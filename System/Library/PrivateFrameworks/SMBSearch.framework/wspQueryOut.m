@implementation wspQueryOut

- (wspQueryOut)init
{
  wspQueryOut *v2;
  wspHeader *v3;
  wspHeader *whdr;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)wspQueryOut;
  v2 = -[wspQueryOut init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(wspHeader);
    whdr = v2->_whdr;
    v2->_whdr = v3;

    if (v2->_whdr)
    {
      v2->_workID = 0;
      v2->_cursor = 0;
    }
    else
    {

      return 0;
    }
  }
  return v2;
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
  unint64_t v23;
  unint64_t v24;
  unsigned int v25;
  unsigned int v26;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v26 = 0;
  v9 = objc_msgSend(v8, "length");
  if (v9 <= v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspQueryOut decodeBuffer:BufferOffset:BytesDecoded:].cold.7();
    v13 = 12;
  }
  else
  {
    v10 = objc_retainAutorelease(v8);
    v11 = objc_msgSend(v10, "bytes");
    -[wspQueryOut whdr](self, "whdr");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "decodeBuffer:BufferOffset:BytesDecoded:", v10, v6, &v26);

    if (v13)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[wspQueryOut decodeBuffer:BufferOffset:BytesDecoded:].cold.6();
      v14 = v26;
      goto LABEL_6;
    }
    v16 = v26;
    -[wspQueryOut whdr](self, "whdr");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "msgid");

    if (v18 == 202)
    {
      -[wspQueryOut whdr](self, "whdr");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "status");

      if (!v20)
      {
        v21 = v6;
        v22 = v16 + v6;
        v23 = v9 - v21 - v16;
        if (v23 > 3)
        {
          -[wspQueryOut setTrueSequential:](self, "setTrueSequential:", *(unsigned int *)(v11 + v22));
          v26 += 4;
          v24 = v23 & 0xFFFFFFFFFFFFFFFCLL;
          if (v24 == 4)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[wspQueryOut decodeBuffer:BufferOffset:BytesDecoded:].cold.2();
          }
          else
          {
            -[wspQueryOut setWorkID:](self, "setWorkID:", *(unsigned int *)(v11 + v22 + 4));
            v26 += 4;
            v25 = v22 + 8;
            if (v24 != 8)
            {
              -[wspQueryOut setCursor:](self, "setCursor:", *(unsigned int *)(v11 + v25));
              v13 = 0;
              v14 = v26 + 4;
LABEL_6:
              *a5 = v14;
              goto LABEL_10;
            }
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[wspQueryOut decodeBuffer:BufferOffset:BytesDecoded:].cold.3();
          }
        }
        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          -[wspQueryOut decodeBuffer:BufferOffset:BytesDecoded:].cold.1();
        }
        v13 = 55;
        goto LABEL_10;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[wspQueryOut decodeBuffer:BufferOffset:BytesDecoded:].cold.4(self);
      v13 = 0;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[wspQueryOut decodeBuffer:BufferOffset:BytesDecoded:].cold.5(self);
      v13 = 5;
    }
  }
LABEL_10:

  return v13;
}

- (wspHeader)whdr
{
  return (wspHeader *)objc_getProperty(self, a2, 24, 1);
}

- (void)setWhdr:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unsigned)trueSequential
{
  return self->_trueSequential;
}

- (void)setTrueSequential:(unsigned int)a3
{
  self->_trueSequential = a3;
}

- (unsigned)workID
{
  return self->_workID;
}

- (void)setWorkID:(unsigned int)a3
{
  self->_workID = a3;
}

- (unsigned)cursor
{
  return self->_cursor;
}

- (void)setCursor:(unsigned int)a3
{
  self->_cursor = a3;
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
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryOut:decodeBuffer: out of buffer to decode trueSequential, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryOut:decodeBuffer: out of buffer to decode workID, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryOut:decodeBuffer: out of buffer to decode cursor, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:(void *)a1 BufferOffset:BytesDecoded:.cold.4(void *a1)
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
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v4, "wspQueryOut:decodeBuffer: ConnectOut hdr status: 0x%x\n", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:(void *)a1 BufferOffset:BytesDecoded:.cold.5(void *a1)
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
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v4, "wspQueryOut:decodeBuffer: Unexpected MsgId: 0x%x\n", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryOut:decodeBuffer: Failed to decode wsp header, error: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryOut:decodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

@end
