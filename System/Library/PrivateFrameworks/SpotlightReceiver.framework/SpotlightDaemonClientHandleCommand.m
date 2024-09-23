@implementation SpotlightDaemonClientHandleCommand

void ___SpotlightDaemonClientHandleCommand_block_invoke(uint64_t a1, const char *a2, void *a3, const char *a4, int64_t a5)
{
  _xpc_connection_s *v9;
  xpc_object_t reply;
  void *v11;
  xpc_object_t value;

  value = a3;
  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
  v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
    v11 = reply;
    if (reply)
    {
      xpc_dictionary_set_int64(reply, "status", a5);
      if (a5)
      {
        xpc_dictionary_set_string(v11, "ed", a4);
      }
      else if (a2 && value)
      {
        xpc_dictionary_set_value(v11, a2, value);
      }
      xpc_connection_send_message(v9, v11);
    }

  }
}

uint64_t ___SpotlightDaemonClientHandleCommand_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t ___SpotlightDaemonClientHandleCommand_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t ___SpotlightDaemonClientHandleCommand_block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void ___SpotlightDaemonClientHandleCommand_block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    ___SpotlightDaemonClientHandleCommand_block_invoke_5_cold_2();
  v13 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  if (v5)
  {
    logForCSLogCategoryDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      ___SpotlightDaemonClientHandleCommand_block_invoke_5_cold_1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  }
  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

void ___SpotlightDaemonClientHandleCommand_block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  id v5;
  xpc_object_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = (xpc_object_t)objc_msgSend(v11, "length");
  if (v6)
    v6 = xpc_data_create((const void *)objc_msgSend(objc_retainAutorelease(v11), "bytes"), (size_t)v6);
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "domain");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "UTF8String");
  v10 = objc_msgSend(v5, "code");

  (*(void (**)(uint64_t, const char *, xpc_object_t, uint64_t, uint64_t))(v7 + 16))(v7, "d", v6, v9, v10);
}

void ___SpotlightDaemonClientHandleCommand_block_invoke_2_41(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v5 = (void *)MEMORY[0x24BDC23B8];
  v6 = a3;
  objc_msgSend(v5, "encodeURLPreservingSecurityScope:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "length"))
  {
    v9 = objc_retainAutorelease(v8);
    v14 = xpc_data_create((const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"));
  }
  else
  {
    v14 = 0;
  }
  v10 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "domain");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = objc_msgSend(v11, "UTF8String");
  v13 = objc_msgSend(v6, "code");

  (*(void (**)(uint64_t, const char *, id, uint64_t, uint64_t))(v10 + 16))(v10, "u", v14, v12, v13);
}

void ___SpotlightDaemonClientHandleCommand_block_invoke_3_47(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  size_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v5 = (void *)MEMORY[0x24BDD1618];
  v6 = a3;
  objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", a2, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");
  if (v8)
    v13 = xpc_data_create((const void *)objc_msgSend(objc_retainAutorelease(v7), "bytes"), v8);
  else
    v13 = 0;
  v9 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "domain");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = objc_msgSend(v10, "UTF8String");
  v12 = objc_msgSend(v6, "code");

  (*(void (**)(uint64_t, const char *, id, uint64_t, uint64_t))(v9 + 16))(v9, "brs", v13, v11, v12);
}

void ___SpotlightDaemonClientHandleCommand_block_invoke_4_51(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  size_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v5 = (void *)MEMORY[0x24BDD1618];
  v6 = a3;
  objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", a2, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");
  if (v8)
    v13 = xpc_data_create((const void *)objc_msgSend(objc_retainAutorelease(v7), "bytes"), v8);
  else
    v13 = 0;
  v9 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "domain");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = objc_msgSend(v10, "UTF8String");
  v12 = objc_msgSend(v6, "code");

  (*(void (**)(uint64_t, const char *, id, uint64_t, uint64_t))(v9 + 16))(v9, "brs", v13, v11, v12);
}

void ___SpotlightDaemonClientHandleCommand_block_invoke_5_52(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;

  v5 = *(void **)(a1 + 32);
  v6 = (objc_class *)MEMORY[0x24BDC23F8];
  v7 = a3;
  v8 = a2;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithFileURL:andError:", v8, v7);

  objc_msgSend(v5, "addObject:", v9);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void ___SpotlightDaemonClientHandleCommand_block_invoke_6(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

void ___SpotlightDaemonClientHandleCommand_block_invoke_5_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21066D000, a2, a3, "Error while decoding updatedItem: %@", a5, a6, a7, a8, 2u);
}

void ___SpotlightDaemonClientHandleCommand_block_invoke_5_cold_2()
{
  __assert_rtn("_SpotlightDaemonClientHandleCommand_block_invoke_5", "SpotlightDaemonClient.m", 119, "[data isKindOfClass:NSData.class]");
}

@end
