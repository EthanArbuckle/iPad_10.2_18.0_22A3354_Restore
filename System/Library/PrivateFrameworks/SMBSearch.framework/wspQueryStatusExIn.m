@implementation wspQueryStatusExIn

- (wspQueryStatusExIn)initWithCtx:(id)a3
{
  id v5;
  char *v6;
  wspQueryStatusExIn *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)wspQueryStatusExIn;
  v6 = -[wspQueryStatusExIn init](&v9, sel_init);
  v7 = (wspQueryStatusExIn *)v6;
  if (v6)
  {
    *(_OWORD *)(v6 + 8) = xmmword_227C48C90;
    objc_storeStrong((id *)v6 + 4, a3);
    v7->_bmk = -4;
  }

  return v7;
}

- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  int v15;
  unsigned int v17;

  v8 = a3;
  v9 = objc_msgSend(v8, "length");
  if (v9 <= a4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspQueryStatusExIn encodeBuffer:BufferOffset:BytesWritten:].cold.4();
  }
  else
  {
    v10 = v9 - a4;
    v11 = objc_msgSend(objc_retainAutorelease(v8), "bytes");
    if (v10 > 0xF)
    {
      v12 = v11;
      *($D892E086A49BFFF1EF9F4B456CBD0A06 *)(v11 + a4) = self->msghdr;
      if (v10 - 16 > 3)
      {
        -[wspQueryStatusExIn wctx](self, "wctx");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "cursor");

        *(_DWORD *)(v12 + a4 + 16) = v14;
        if (v10 - 20 > 3)
        {
          v17 = -[wspQueryStatusExIn bmk](self, "bmk");
          v15 = 0;
          *(_DWORD *)(v12 + a4 + 20) = v17;
          *a5 = a4 + 24;
          goto LABEL_14;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspQueryStatusExIn encodeBuffer:BufferOffset:BytesWritten:].cold.3();
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        -[wspQueryStatusExIn encodeBuffer:BufferOffset:BytesWritten:].cold.2();
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[wspQueryStatusExIn encodeBuffer:BufferOffset:BytesWritten:].cold.1();
    }
  }
  v15 = 12;
LABEL_14:

  return v15;
}

- (wspContext)wctx
{
  return (wspContext *)objc_getProperty(self, a2, 32, 1);
}

- (void)setWctx:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (unsigned)bmk
{
  return self->_bmk;
}

- (void)setBmk:(unsigned int)a3
{
  self->_bmk = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wctx, 0);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_10_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryStatusExIn:encodeBuffer: no buffer space for WSP header, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
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

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_10_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryStatusExIn:encodeBuffer: no buffer space for hCursor, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
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

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_10_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryStatusExIn:encodeBuffer: no buffer space for bmk, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
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

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryStatusExIn:encodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

@end
