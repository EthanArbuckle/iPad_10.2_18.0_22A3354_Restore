@implementation wspGetRows

- (wspGetRows)initWithCtx:(id)a3
{
  id v5;
  char *v6;
  wspGetRows *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)wspGetRows;
  v6 = -[wspGetRows init](&v9, sel_init);
  v7 = (wspGetRows *)v6;
  if (v6)
  {
    *(_OWORD *)(v6 + 8) = xmmword_227C48C40;
    objc_storeStrong((id *)v6 + 3, a3);
  }

  return v7;
}

- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  unsigned int v24;
  unsigned int v25;

  v8 = a3;
  v9 = objc_msgSend(v8, "length");
  if (v9 <= a4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspGetRows encodeBuffer:BufferOffset:BytesWritten:].cold.15();
    goto LABEL_7;
  }
  v10 = v9 - a4;
  v11 = objc_msgSend(objc_retainAutorelease(v8), "bytes");
  if (v10 <= 0xF)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspGetRows encodeBuffer:BufferOffset:BytesWritten:].cold.1(v10);
    goto LABEL_7;
  }
  v14 = v11;
  *($D892E086A49BFFF1EF9F4B456CBD0A06 *)(v11 + a4) = self->msghdr;
  if (v10 - 16 <= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspGetRows encodeBuffer:BufferOffset:BytesWritten:].cold.2();
    goto LABEL_7;
  }
  -[wspGetRows wctx](self, "wctx");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "cursor");

  *(_DWORD *)(v14 + a4 + 16) = v16;
  if (v10 - 20 <= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspGetRows encodeBuffer:BufferOffset:BytesWritten:].cold.3();
    goto LABEL_7;
  }
  *(_DWORD *)(v14 + a4 + 20) = 32;
  if (v10 - 24 <= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspGetRows encodeBuffer:BufferOffset:BytesWritten:].cold.4();
    goto LABEL_7;
  }
  -[wspGetRows wctx](self, "wctx");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pidMap");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "rowLength");

  *(_DWORD *)(v14 + a4 + 24) = v19;
  if (v10 - 28 <= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspGetRows encodeBuffer:BufferOffset:BytesWritten:].cold.5();
    goto LABEL_7;
  }
  *(_DWORD *)(v14 + a4 + 28) = 20;
  if (v10 - 32 <= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspGetRows encodeBuffer:BufferOffset:BytesWritten:].cold.6();
    goto LABEL_7;
  }
  *(_DWORD *)(v14 + a4 + 32) = 40;
  if (v10 - 36 <= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspGetRows encodeBuffer:BufferOffset:BytesWritten:].cold.7();
    goto LABEL_7;
  }
  *(_DWORD *)(v14 + a4 + 36) = 0x4000;
  if (v10 - 40 <= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspGetRows encodeBuffer:BufferOffset:BytesWritten:].cold.8();
    goto LABEL_7;
  }
  *(_DWORD *)(v14 + a4 + 40) = 0;
  if (v10 - 44 <= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspGetRows encodeBuffer:BufferOffset:BytesWritten:].cold.9();
    goto LABEL_7;
  }
  *(_DWORD *)(v14 + a4 + 44) = 0;
  if (v10 - 48 <= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspGetRows encodeBuffer:BufferOffset:BytesWritten:].cold.10();
    goto LABEL_7;
  }
  *(_DWORD *)(v14 + a4 + 48) = 2;
  if (v10 - 52 > 3)
  {
    *(_DWORD *)(v14 + a4 + 52) = 0;
    if (v10 - 56 <= 3)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      goto LABEL_38;
    }
    v25 = a4 + 52;
    -[wspGetRows wctx](self, "wctx");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "seekBookmarkOffset");

    *(_DWORD *)(v14 + a4 + 56) = v21;
    if (v10 - 60 > 3)
    {
      -[wspGetRows wctx](self, "wctx");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "seekSkip");

      *(_DWORD *)(v14 + a4 + 60) = v23;
      if (v10 - 64 > 3)
      {
        *(_DWORD *)(v14 + a4 + 64) = 0;
        v24 = a4 + 68;
        v12 = 0;
        *(_DWORD *)(v14 + 8) = getChecksum32(204, (int *)(v14 + 16), v25);
        *a5 = v24;
        goto LABEL_8;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[wspGetRows encodeBuffer:BufferOffset:BytesWritten:].cold.14();
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[wspGetRows encodeBuffer:BufferOffset:BytesWritten:].cold.13();
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
LABEL_38:
    -[wspGetRows encodeBuffer:BufferOffset:BytesWritten:].cold.11();
  }
LABEL_7:
  v12 = 12;
LABEL_8:

  return v12;
}

- (wspContext)wctx
{
  return (wspContext *)objc_getProperty(self, a2, 24, 1);
}

- (void)setWctx:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wctx, 0);
}

- (void)encodeBuffer:(uint64_t)a1 BufferOffset:BytesWritten:.cold.1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 134217984;
  v2 = a1;
  _os_log_error_impl(&dword_227C1F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "wspGetRows:encodeBuffer: no buffer space for WSP header, sizeAvail: %llu\n", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRows:encodeBuffer: no buffer space for hCursor, size: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRows:encodeBuffer: no buffer space for cbRowsToTransfer, size: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRows:encodeBuffer: no buffer space for cbRowWidth field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRows:encodeBuffer: no buffer space for cbSeek, size: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRows:encodeBuffer: no buffer space for cbReserved, size: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRows:encodeBuffer: no buffer space for cbReadBuffer, size: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRows:encodeBuffer: no buffer space for ulClientBase, size: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRows:encodeBuffer: no buffer space for fBwdFetch, size: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRows:encodeBuffer: no buffer space for eType, size: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRows:encodeBuffer: no buffer space for chapter, size: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.13()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRows:encodeBuffer: no buffer space for skip, size: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRows:encodeBuffer: no buffer space for hregion, size: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.15()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspGetRows:encodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

@end
