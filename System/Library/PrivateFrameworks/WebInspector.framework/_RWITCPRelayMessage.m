@implementation _RWITCPRelayMessage

- (_RWITCPRelayMessage)initWithPayload:(id)a3
{
  id v4;
  _RWITCPRelayMessage *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _RWITCPRelayMessage *v14;
  uint64_t v15;
  NSData *payload;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_RWITCPRelayMessage;
  v5 = -[_RWITCPRelayMessage init](&v18, sel_init);
  if (v5)
  {
    if ((unint64_t)objc_msgSend(v4, "length") < 0xFFFFFFFC)
    {
      v15 = objc_msgSend(v4, "copy");
      payload = v5->_payload;
      v5->_payload = (NSData *)v15;

      v5->_writtenHeader = 0;
      v5->_writtenPayloadOffset = 0;
      v14 = v5;
      goto LABEL_8;
    }
    RWIDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[_RWITCPRelayMessage initWithPayload:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  }
  v14 = 0;
LABEL_8:

  return v14;
}

+ (id)TCPRelayMessageFromDataStream:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v29;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    v7 = objc_msgSend(v5, "length");
    if (v7 >= 4)
    {
      v8 = v7;
      v29 = 0;
      objc_msgSend(v6, "getBytes:length:", &v29, 4);
      v9 = bswap32(v29);
      v29 = v9;
      if (v9 >= 0xFFFFFFFB)
      {
        RWIDefaultLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          +[_RWITCPRelayMessage TCPRelayMessageFromDataStream:error:].cold.2(v10, v11, v12, v13, v14, v15, v16, v17);

        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Cannot read _RWITCPRelayMessage from stream. Corrupt header."), *MEMORY[0x24BDD0FC8]);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0;
        *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("_RWITCPRelayMessage"), 1, v18);
        goto LABEL_13;
      }
      if (v8 >= v9 + 4)
      {
        objc_msgSend(v6, "subdataWithRange:", 4);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[_RWITCPRelayMessage TCPRelayMessageWithPayload:](_RWITCPRelayMessage, "TCPRelayMessageWithPayload:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

        goto LABEL_14;
      }
    }
  }
  else
  {
    RWIDefaultLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      +[_RWITCPRelayMessage TCPRelayMessageFromDataStream:error:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);

  }
  v19 = 0;
LABEL_14:

  return v19;
}

+ (id)TCPRelayMessageWithPayload:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPayload:", v4);

  return v5;
}

- (unint64_t)length
{
  return -[NSData length](self->_payload, "length") + 4;
}

- (int64_t)write:(int)a3
{
  _QWORD v4[4];
  int v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __29___RWITCPRelayMessage_write___block_invoke;
  v4[3] = &__block_descriptor_36_e12_q24__0r_8Q16l;
  v5 = a3;
  return -[_RWITCPRelayMessage writeInternal:](self, "writeInternal:", v4);
}

- (int64_t)writeLockdown:(_lockdown_connection *)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37___RWITCPRelayMessage_writeLockdown___block_invoke;
  v4[3] = &__block_descriptor_40_e12_q24__0r_8Q16l;
  v4[4] = a3;
  return -[_RWITCPRelayMessage writeInternal:](self, "writeInternal:", v4);
}

- (int64_t)writeInternal:(id)a3
{
  uint64_t (**v4)(id, uint64_t, uint64_t);
  id v5;
  NSUInteger v6;
  unint64_t writtenPayloadOffset;
  int64_t v8;
  uint64_t v9;
  NSData *payload;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  unsigned int v15;

  v4 = (uint64_t (**)(id, uint64_t, uint64_t))a3;
  if (!self->_writtenHeader)
  {
    v15 = bswap32(-[NSData length](self->_payload, "length"));
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v15, 4);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    if (v4[2](v4, objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length")) < 0)
    {
      if (*__error() == 35)
      {
        v8 = 2;
      }
      else
      {
        RWIDefaultLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[_RWITCPRelayMessage writeInternal:].cold.2();

        v8 = 3;
      }

      goto LABEL_19;
    }
    self->_writtenHeader = 1;

  }
  v6 = -[NSData length](self->_payload, "length");
  writtenPayloadOffset = self->_writtenPayloadOffset;
  if (v6 != writtenPayloadOffset)
  {
    v9 = v4[2](v4, (uint64_t)(-[NSData bytes](self->_payload, "bytes") + self->_writtenPayloadOffset), v6 - writtenPayloadOffset);
    if ((v9 & 0x8000000000000000) == 0)
    {
      payload = self->_payload;
      v11 = self->_writtenPayloadOffset + v9;
      self->_writtenPayloadOffset = v11;
      v8 = v11 != -[NSData length](payload, "length");
      goto LABEL_19;
    }
    if (*__error() == 35)
    {
      v8 = 2;
      goto LABEL_19;
    }
    RWIDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[_RWITCPRelayMessage writeInternal:].cold.1();

  }
  v8 = 3;
LABEL_19:

  return v8;
}

- (NSData)payload
{
  return self->_payload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
}

- (void)initWithPayload:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_21AD49000, a1, a3, "_RWITCPRelayMessage: Attempted to make a message that was too large.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

+ (void)TCPRelayMessageFromDataStream:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_21AD49000, a1, a3, "_RWITCPRelayMessage: The error parameter is not optional and should not be nil.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

+ (void)TCPRelayMessageFromDataStream:(uint64_t)a3 error:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_21AD49000, a1, a3, "_RWITCPRelayMessage: Serious error. Header value was too large. This likely means a corrupted data stream.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)writeInternal:.cold.1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_1(&dword_21AD49000, v1, v2, "_RWITCPRelayMessage payload write failure: %{public}d - %{public}s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2();
}

- (void)writeInternal:.cold.2()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_1(&dword_21AD49000, v1, v2, "_RWITCPRelayMessage header write failure: %{public}d - %{public}s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2();
}

@end
