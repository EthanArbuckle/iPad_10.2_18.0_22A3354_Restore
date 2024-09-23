@implementation wspHeader

- (wspHeader)init
{
  wspHeader *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)wspHeader;
  result = -[wspHeader init](&v3, sel_init);
  if (result)
  {
    *(_QWORD *)&result->_msgid = 0;
    *(_QWORD *)&result->_checksum = 0;
  }
  return result;
}

- (int)decodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesDecoded:(unsigned int *)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  unsigned int v15;

  v8 = a3;
  v9 = objc_msgSend(v8, "length");
  if (v9 <= a4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspHeader decodeBuffer:BufferOffset:BytesDecoded:].cold.5();
    v12 = 12;
  }
  else
  {
    v10 = v9 - a4;
    v11 = objc_msgSend(objc_retainAutorelease(v8), "bytes");
    if (v10 > 3)
    {
      v13 = v11;
      -[wspHeader setMsgid:](self, "setMsgid:", *(unsigned int *)(v11 + a4));
      v14 = v10 & 0xFFFFFFFFFFFFFFFCLL;
      if (v14 == 4)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspHeader decodeBuffer:BufferOffset:BytesDecoded:].cold.2();
      }
      else
      {
        -[wspHeader setStatus:](self, "setStatus:", *(unsigned int *)(v13 + a4 + 4));
        if (v14 == 8)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[wspHeader decodeBuffer:BufferOffset:BytesDecoded:].cold.3();
        }
        else
        {
          -[wspHeader setChecksum:](self, "setChecksum:", *(unsigned int *)(v13 + a4 + 8));
          v15 = a4 + 12;
          if (v14 != 12)
          {
            -[wspHeader setReserved2:](self, "setReserved2:", *(unsigned int *)(v13 + v15));
            v12 = 0;
            *a5 = 16;
            goto LABEL_18;
          }
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[wspHeader decodeBuffer:BufferOffset:BytesDecoded:].cold.4();
        }
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[wspHeader decodeBuffer:BufferOffset:BytesDecoded:].cold.1();
    }
    v12 = 55;
  }
LABEL_18:

  return v12;
}

- (unsigned)msgid
{
  return self->_msgid;
}

- (void)setMsgid:(unsigned int)a3
{
  self->_msgid = a3;
}

- (unsigned)status
{
  return self->_status;
}

- (void)setStatus:(unsigned int)a3
{
  self->_status = a3;
}

- (unsigned)checksum
{
  return self->_checksum;
}

- (void)setChecksum:(unsigned int)a3
{
  self->_checksum = a3;
}

- (unsigned)reserved2
{
  return self->_reserved2;
}

- (void)setReserved2:(unsigned int)a3
{
  self->_reserved2 = a3;
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
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspHeader:decodeBuffer: no buffer space for msgid, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
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
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspHeader:decodeBuffer: no buffer space for status, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
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
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspHeader:decodeBuffer: no buffer space for checksum, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
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

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspHeader:decodeBuffer: no buffer space for reserved2, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
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
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspHeader:decodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

@end
