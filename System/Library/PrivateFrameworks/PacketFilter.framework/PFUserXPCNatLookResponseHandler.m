@implementation PFUserXPCNatLookResponseHandler

void ____PFUserXPCNatLookResponseHandler_block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  xpc_object_t value;
  void *v6;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  if (v3)
    value = xpc_dictionary_get_value(v3, (const char *)pfXPCKeyRule);
  else
    value = 0;
  (*(void (**)(uint64_t, BOOL, xpc_object_t))(v4 + 16))(v4, v2 != 0, value);
  v6 = *(void **)(a1 + 40);
  if (v6)
    xpc_release(v6);
}

@end
