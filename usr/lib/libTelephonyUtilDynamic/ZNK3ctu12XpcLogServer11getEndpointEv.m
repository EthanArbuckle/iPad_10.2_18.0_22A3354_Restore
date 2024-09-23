@implementation ZNK3ctu12XpcLogServer11getEndpointEv

void *___ZNK3ctu12XpcLogServer11getEndpointEv_block_invoke@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  void *result;

  result = xpc_endpoint_create(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 64));
  *a2 = result;
  if (!result)
  {
    result = xpc_null_create();
    *a2 = result;
  }
  return result;
}

@end
