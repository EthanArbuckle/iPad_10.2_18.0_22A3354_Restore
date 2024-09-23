@implementation wspFreeCursorOut

- (wspFreeCursorOut)init
{
  wspFreeCursorOut *v2;
  wspFreeCursorOut *v3;
  wspHeader *v4;
  wspHeader *whdr;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)wspFreeCursorOut;
  v2 = -[wspFreeCursorOut init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_cursorsRemaining = 0;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  uint64_t v28;
  unsigned int v29;
  unsigned int v30;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v30 = 0;
  v9 = objc_msgSend(v8, "length");
  if (v9 <= v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspFreeCursorOut decodeBuffer:BufferOffset:BytesDecoded:].cold.5();
    LODWORD(v13) = 12;
  }
  else
  {
    v10 = objc_retainAutorelease(v8);
    v11 = objc_msgSend(v10, "bytes");
    -[wspFreeCursorOut whdr](self, "whdr");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "decodeBuffer:BufferOffset:BytesDecoded:", v10, v6, &v30);

    if ((_DWORD)v13)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[wspFreeCursorOut decodeBuffer:BufferOffset:BytesDecoded:].cold.4(v13, v14, v15, v16, v17, v18, v19, v20);
      v21 = v30;
      goto LABEL_6;
    }
    v23 = v30;
    -[wspFreeCursorOut whdr](self, "whdr");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "msgid");

    if (v25 == 203)
    {
      -[wspFreeCursorOut whdr](self, "whdr");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "status");

      if (v27)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspFreeCursorOut decodeBuffer:BufferOffset:BytesDecoded:].cold.2(self);
        LODWORD(v13) = 0;
      }
      else
      {
        v28 = v6;
        v29 = v23 + v6;
        if (v9 - v28 - v23 > 3)
        {
          -[wspFreeCursorOut setCursorsRemaining:](self, "setCursorsRemaining:", *(unsigned int *)(v11 + v29));
          LODWORD(v13) = 0;
          v21 = v30 + 4;
LABEL_6:
          *a5 = v21;
          goto LABEL_10;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspFreeCursorOut decodeBuffer:BufferOffset:BytesDecoded:].cold.1();
        LODWORD(v13) = 55;
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[wspFreeCursorOut decodeBuffer:BufferOffset:BytesDecoded:].cold.3(self);
      LODWORD(v13) = 5;
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

- (unsigned)cursorsRemaining
{
  return self->_cursorsRemaining;
}

- (void)setCursorsRemaining:(unsigned int)a3
{
  self->_cursorsRemaining = a3;
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
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspFreeCursorOut:decodeBuffer: out of buffer to decode qStatus, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:(void *)a1 BufferOffset:BytesDecoded:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "whdr");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "msgid");
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "wspFreeCursorOut:decodeBuffer: ConnectOut hdr status: 0x%x\n", v3, v4, v5, v6, 0);

  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:(void *)a1 BufferOffset:BytesDecoded:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "whdr");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "msgid");
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "wspFreeCursorOut:decodeBuffer: Unexpected MsgId: 0x%x\n", v3, v4, v5, v6, 0);

  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesDecoded:(uint64_t)a5 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspFreeCursorOut:decodeBuffer: Failed to decode wsp header, error: %d\n", a5, a6, a7, a8, 0);
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
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspFreeCursorOut:decodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

@end
