@implementation Create

void __Create_Connection_block_invoke(id a1, void *a2)
{
  NSObject *v2;
  int string;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (mDNS_LoggingEnabled == 1)
  {
    v2 = mDNSLogCategory_Default;
    string = xpc_dictionary_get_string(a2, _xpc_error_key_description);
    LogMsgWithLevel(v2, OS_LOG_TYPE_DEFAULT, "Create_Connection xpc: [%s] \n", v4, v5, v6, v7, v8, string);
  }
}

@end
