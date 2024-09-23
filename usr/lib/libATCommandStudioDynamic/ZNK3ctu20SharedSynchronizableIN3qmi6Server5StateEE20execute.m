@implementation ZNK3ctu20SharedSynchronizableIN3qmi6Server5StateEE20execute

void *___ZNK3ctu20SharedSynchronizableIN3qmi6Server5StateEE20execute_wrapped_syncIZNKS3_11getEndpointEvE3__0EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  xpc_connection_t *Listener;
  void *result;

  Listener = (xpc_connection_t *)ctu::XpcServerHelper::getListener((ctu::XpcServerHelper *)(**(_QWORD **)(a1 + 40) + 40));
  result = xpc_endpoint_create(*Listener);
  *a2 = result;
  if (!result)
  {
    result = xpc_null_create();
    *a2 = result;
  }
  return result;
}

@end
