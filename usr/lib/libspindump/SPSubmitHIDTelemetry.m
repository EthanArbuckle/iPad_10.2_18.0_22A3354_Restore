@implementation SPSubmitHIDTelemetry

xpc_object_t __SPSubmitHIDTelemetry_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  xpc_object_t empty;
  const char *v12;
  const char *v13;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v3 = (void *)objc_msgSend(v2, "bundleIdentifier");
  v4 = (void *)objc_msgSend(v2, "infoDictionary");
  v5 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDBD2A0]);
  v6 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDBD1E0]);
  v7 = objc_msgSend(v6, "length");
  v8 = objc_msgSend(v5, "length");
  if (v7)
  {
    if (v8)
      v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@ (%@)"), v6, v5);
    else
      v9 = v6;
    goto LABEL_7;
  }
  if (v8)
  {
    v9 = v5;
LABEL_7:
    v10 = v9;
    goto LABEL_8;
  }
  v10 = 0;
LABEL_8:
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "hid_event_count", *(_QWORD *)(a1 + 32));
  xpc_dictionary_set_uint64(empty, "ns", *(_QWORD *)(a1 + 40));
  v12 = (const char *)objc_msgSend(v3, "UTF8String");
  if (v12)
    xpc_dictionary_set_string(empty, "bundle_id", v12);
  v13 = (const char *)objc_msgSend(v10, "UTF8String");
  if (v13)
    xpc_dictionary_set_string(empty, "bundle_version", v13);

  return empty;
}

@end
