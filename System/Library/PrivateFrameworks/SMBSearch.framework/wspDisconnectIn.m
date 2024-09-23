@implementation wspDisconnectIn

- (wspDisconnectIn)init
{
  wspDisconnectIn *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)wspDisconnectIn;
  result = -[wspDisconnectIn init](&v3, sel_init);
  if (result)
    result->msghdr = ($D892E086A49BFFF1EF9F4B456CBD0A06)xmmword_227C48CD0;
  return result;
}

- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;

  v8 = a3;
  v9 = objc_msgSend(v8, "length");
  if (v9 <= a4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspDisconnectIn encodeBuffer:BufferOffset:BytesWritten:].cold.2();
  }
  else
  {
    v10 = v9 - a4;
    v11 = objc_msgSend(objc_retainAutorelease(v8), "bytes");
    if (v10 > 0xF)
    {
      v19 = 0;
      *($D892E086A49BFFF1EF9F4B456CBD0A06 *)(v11 + a4) = self->msghdr;
      *a5 = a4 + 16;
      goto LABEL_9;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspDisconnectIn encodeBuffer:BufferOffset:BytesWritten:].cold.1(v10, v12, v13, v14, v15, v16, v17, v18);
  }
  v19 = 12;
LABEL_9:

  return v19;
}

- (void)encodeBuffer:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "wspDisconnectIn:encodePrimaryQuery: no buffer space for WSP header, sizeAvail: %llu\n", a5, a6, a7, a8, 0);
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

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspDisconnectIn:encodePrimaryQuery: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

@end
