@implementation SFOperationCancel

void __SFOperationCancel_block_invoke(uint64_t a1)
{
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

@end
