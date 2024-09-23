@implementation wspQueryStatusOut

- (wspQueryStatusOut)init
{
  wspQueryStatusOut *v2;
  wspQueryStatusOut *v3;
  wspHeader *v4;
  wspHeader *whdr;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)wspQueryStatusOut;
  v2 = -[wspQueryStatusOut init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_qStatus = 0;
    v4 = objc_alloc_init(wspHeader);
    whdr = v3->_whdr;
    v3->_whdr = v4;

    if (!v3->_whdr)
    {

      return 0;
    }
  }
  return v3;
}

- (int)decodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesDecoded:(unsigned int *)a5
{
  uint64_t v6;
  id v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  int v13;
  unsigned int v14;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v23 = 0;
  v9 = objc_msgSend(v8, "length");
  if (v9 <= v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspQueryStatusOut decodeBuffer:BufferOffset:BytesDecoded:].cold.5();
    v13 = 12;
  }
  else
  {
    v10 = objc_retainAutorelease(v8);
    v11 = objc_msgSend(v10, "bytes");
    -[wspQueryStatusOut whdr](self, "whdr");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "decodeBuffer:BufferOffset:BytesDecoded:", v10, v6, &v23);

    if (v13)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[wspQueryStatusOut decodeBuffer:BufferOffset:BytesDecoded:].cold.4();
      v14 = v23;
      goto LABEL_6;
    }
    v16 = v23;
    -[wspQueryStatusOut whdr](self, "whdr");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "msgid");

    if (v18 == 215)
    {
      -[wspQueryStatusOut whdr](self, "whdr");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "status");

      if (v20)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspQueryStatusOut decodeBuffer:BufferOffset:BytesDecoded:].cold.2(self);
        v13 = 0;
      }
      else
      {
        v21 = v6;
        v22 = v16 + v6;
        if (v9 - v21 - v16 > 3)
        {
          -[wspQueryStatusOut setQStatus:](self, "setQStatus:", *(unsigned int *)(v11 + v22));
          v13 = 0;
          v14 = v23 + 4;
LABEL_6:
          *a5 = v14;
          goto LABEL_10;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspQueryStatusOut decodeBuffer:BufferOffset:BytesDecoded:].cold.1();
        v13 = 55;
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[wspQueryStatusOut decodeBuffer:BufferOffset:BytesDecoded:].cold.3(self);
      v13 = 5;
    }
  }
LABEL_10:

  return v13;
}

- (wspHeader)whdr
{
  return (wspHeader *)objc_getProperty(self, a2, 16, 1);
}

- (void)setWhdr:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unsigned)qStatus
{
  return self->_qStatus;
}

- (void)setQStatus:(unsigned int)a3
{
  self->_qStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whdr, 0);
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryStatusOut:decodeBuffer: out of buffer to decode qStatus, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:(void *)a1 BufferOffset:BytesDecoded:.cold.2(void *a1)
{
  void *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "whdr");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12_0(v2, v3);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v4, "wspQueryStatusOut:decodeBuffer: ConnectOut hdr status: 0x%x\n", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:(void *)a1 BufferOffset:BytesDecoded:.cold.3(void *a1)
{
  void *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "whdr");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12_0(v2, v3);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v4, "wspQueryStatusOut:decodeBuffer: Unexpected MsgId: 0x%x\n", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryStatusOut:decodeBuffer: Failed to decode wsp header, error: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryStatusOut:decodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

@end
