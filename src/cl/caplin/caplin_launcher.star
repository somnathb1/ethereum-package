shared_utils = import_module("../../shared_utils/shared_utils.star")
input_parser = import_module("../../package_io/input_parser.star")
cl_context = import_module("../../cl/cl_context.star")
cl_node_ready_conditions = import_module("../../cl/cl_node_ready_conditions.star")
cl_shared = import_module("../cl_shared.star")
node_metrics = import_module("../../node_metrics_info.star")
constants = import_module("../../package_io/constants.star")

blobber_launcher = import_module("../../blobber/blobber_launcher.star")

LIGHTHOUSE_BINARY_COMMAND = "lighthouse"

RUST_BACKTRACE_ENVVAR_NAME = "RUST_BACKTRACE"
RUST_FULL_BACKTRACE_KEYWORD = "full"

#  ---------------------------------- Beacon client -------------------------------------
BEACON_DATA_DIRPATH_ON_BEACON_SERVICE_CONTAINER = "/data/lighthouse/beacon-data"
NODE_KEY_MOUNTPOINT_ON_CLIENTS = (
    BEACON_DATA_DIRPATH_ON_BEACON_SERVICE_CONTAINER + "/beacon/network"
)
# Port nums
BEACON_DISCOVERY_PORT_NUM = 9000
BEACON_HTTP_PORT_NUM = 4000
BEACON_METRICS_PORT_NUM = 5054

# The min/max CPU/memory that the beacon node can use
BEACON_MIN_CPU = 50
BEACON_MIN_MEMORY = 256

METRICS_PATH = "/metrics"

VERBOSITY_LEVELS = {
    constants.GLOBAL_LOG_LEVEL.error: "error",
    constants.GLOBAL_LOG_LEVEL.warn: "warn",
    constants.GLOBAL_LOG_LEVEL.info: "info",
    constants.GLOBAL_LOG_LEVEL.debug: "debug",
    constants.GLOBAL_LOG_LEVEL.trace: "trace",
}


def launch(
    plan,
    launcher,
    beacon_service_name,
    participant,
    global_log_level,

    bootnode_contexts,

    el_context,
    full_name,
    node_keystore_files,
    snooper_engine_context,
    persistent,
    tolerations,
    node_selectors,
    checkpoint_sync_enabled,
    checkpoint_sync_url,
    port_publisher,
    participant_index,
):
    abc = "xyz"
    plan.print("SPIDERMNA EL CONTEXT")
    plan.print(el_context)
    clctx = cl_context.new_cl_context(
        client_name="caplin",
        enr=el_context.enr,
        ip_addr=el_context.ip_addr,
        http_port=4000,
        beacon_http_url="http://{0}:{1}".format(el_context.ip_addr,4000),
        cl_nodes_metrics_info=el_context.el_metrics_info,
        beacon_service_name="lighthouse",
        multiaddr="beacon_multiaddr",
        peer_id=el_context.ip_addr,
        snooper_enabled="false",
        snooper_engine_context="snooper_engine_context",
        validator_keystore_files_artifact_uuid=node_keystore_files.files_artifact_uuid
        if node_keystore_files
        else "",
        supernode=participant.supernode,
    )
    plan.print("SPIDERMAN CL CONTEXT CREATED")
    plan.print(clctx)
    return clctx


def get_beacon_config(
    plan,
    launcher,
    beacon_service_name,
    participant,
    log_level,
    bootnode_contexts,
    el_context,
    full_name,
    node_keystore_files,
    snooper_engine_context,
    persistent,
    tolerations,
    node_selectors,
    checkpoint_sync_enabled,
    checkpoint_sync_url,
    port_publisher,
    participant_index,
):
    abc = "xyz"


def new_caplin_faux_launcher(el_cl_genesis_data, jwt_file, network_params):
    return struct(
        el_cl_genesis_data=el_cl_genesis_data,
        jwt_file=jwt_file,
        network_params=network_params,
    )
