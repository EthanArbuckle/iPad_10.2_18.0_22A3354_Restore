@implementation BodyWriter

- (void)sendBodyDataWithContext:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD, _QWORD);
  NSObject *v7;
  size_t size;
  NSObject *v9;
  dispatch_data_t subrange;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __38__BodyWriter_sendBodyDataWithContext___block_invoke;
  v11[3] = &unk_24C9767E8;
  v11[4] = self;
  v5 = v4;
  v12 = v5;
  v13 = &v14;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x212BC1F98](v11);
  -[BodyWriter postData](self, "postData");
  v7 = objc_claimAutoreleasedReturnValue();
  size = dispatch_data_get_size(v7);
  if (-[BodyWriter bytesLeftToPost](self, "bytesLeftToPost") < size)
  {
    -[BodyWriter postData](self, "postData");
    v9 = objc_claimAutoreleasedReturnValue();
    subrange = dispatch_data_create_subrange(v9, 0, -[BodyWriter bytesLeftToPost](self, "bytesLeftToPost"));

    *((_BYTE *)v15 + 24) = 1;
    v7 = subrange;
  }
  ((void (**)(_QWORD, NSObject *))v6)[2](v6, v7);

  _Block_object_dispose(&v14, 8);
}

void __38__BodyWriter_sendBodyDataWithContext___block_invoke(uint64_t a1, dispatch_data_t data, BOOL a3)
{
  size_t size;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD completion[5];
  __int128 v11;
  size_t v12;
  BOOL v13;

  size = dispatch_data_get_size(data);
  v7 = *(void **)(a1 + 32);
  v8 = data;
  objc_msgSend(v7, "connection");
  v9 = objc_claimAutoreleasedReturnValue();
  completion[0] = MEMORY[0x24BDAC760];
  completion[1] = 3221225472;
  completion[2] = __38__BodyWriter_sendBodyDataWithContext___block_invoke_2;
  completion[3] = &unk_24C9767C0;
  completion[4] = *(_QWORD *)(a1 + 32);
  v12 = size;
  v13 = a3;
  v11 = *(_OWORD *)(a1 + 40);
  nw_connection_send(v9, v8, (nw_content_context_t)(id)v11, a3, completion);

}

void __38__BodyWriter_sendBodyDataWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  if (v3)
  {
    netqual_log_init();
    v4 = (void *)os_log_netqual;
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
      __38__BodyWriter_sendBodyDataWithContext___block_invoke_2_cold_2(v4, v3);
    goto LABEL_11;
  }
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "bytesLeftToPost") >= *(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "setBytesLeftToPost:", objc_msgSend(*(id *)(a1 + 32), "bytesLeftToPost") - *(_QWORD *)(a1 + 56));
  }
  else if (!*(_BYTE *)(a1 + 64))
  {
    netqual_log_init();
    v5 = os_log_netqual;
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR))
      __38__BodyWriter_sendBodyDataWithContext___block_invoke_2_cold_1(v5);
    goto LABEL_11;
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 32), "sendBodyDataWithContext:", *(_QWORD *)(a1 + 40));
LABEL_11:

}

- (OS_nw_connection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_data)postData
{
  return self->_postData;
}

- (void)setPostData:(id)a3
{
  objc_storeStrong((id *)&self->_postData, a3);
}

- (unint64_t)bytesLeftToPost
{
  return self->_bytesLeftToPost;
}

- (void)setBytesLeftToPost:(unint64_t)a3
{
  self->_bytesLeftToPost = a3;
}

- (unsigned)postWriteSize
{
  return self->_postWriteSize;
}

- (void)setPostWriteSize:(unsigned int)a3
{
  self->_postWriteSize = a3;
}

- (unsigned)totalExpectedBytes
{
  return self->_totalExpectedBytes;
}

- (void)setTotalExpectedBytes:(unsigned int)a3
{
  self->_totalExpectedBytes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postData, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __38__BodyWriter_sendBodyDataWithContext___block_invoke_2_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = 136315394;
  v2 = "-[BodyWriter sendBodyDataWithContext:]_block_invoke";
  v3 = 1024;
  v4 = 34;
  _os_log_error_impl(&dword_20E622000, log, OS_LOG_TYPE_ERROR, "%s:%u - Write not complete, but didn't have a full amount to write", (uint8_t *)&v1, 0x12u);
}

void __38__BodyWriter_sendBodyDataWithContext___block_invoke_2_cold_2(void *a1, NSObject *a2)
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  nw_error_domain_t error_domain;
  __int16 v10;
  int error_code;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = 136315906;
  v5 = "-[BodyWriter sendBodyDataWithContext:]_block_invoke_2";
  v6 = 1024;
  v7 = 26;
  v8 = 1024;
  error_domain = nw_error_get_error_domain(a2);
  v10 = 1024;
  error_code = nw_error_get_error_code(a2);
  _os_log_error_impl(&dword_20E622000, v3, OS_LOG_TYPE_ERROR, "%s:%u - Write encountered error: %u:%u\n", (uint8_t *)&v4, 0x1Eu);

}

@end
