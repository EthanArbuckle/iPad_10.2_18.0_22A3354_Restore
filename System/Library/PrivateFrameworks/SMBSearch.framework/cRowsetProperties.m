@implementation cRowsetProperties

- (cRowsetProperties)init
{
  cRowsetProperties *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)cRowsetProperties;
  result = -[cRowsetProperties init](&v3, sel_init);
  if (result)
  {
    *(_QWORD *)&result->_BOOLeanOptions = 0;
    *(_QWORD *)&result->_memoryUsage = 0;
    result->_cmdTimeout = 0;
  }
  return result;
}

- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  int v12;

  v8 = a3;
  v9 = objc_msgSend(v8, "length");
  if (v9 <= a4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cRowsetProperties encodeBuffer:BufferOffset:BytesWritten:].cold.6();
  }
  else
  {
    v10 = v9 - a4;
    v11 = objc_msgSend(objc_retainAutorelease(v8), "bytes");
    if (v10 > 3)
    {
      *(_DWORD *)(v11 + a4) = self->_BOOLeanOptions;
      if (v10 - 4 > 3)
      {
        *(_DWORD *)(v11 + a4 + 4) = self->_maxOpenRows;
        if (v10 - 8 > 3)
        {
          *(_DWORD *)(v11 + a4 + 8) = self->_memoryUsage;
          if (v10 - 12 > 3)
          {
            *(_DWORD *)(v11 + a4 + 12) = self->_maxResult;
            if (v10 - 16 > 3)
            {
              v12 = 0;
              *(_DWORD *)(v11 + a4 + 16) = self->_cmdTimeout;
              *a5 = 20;
              goto LABEL_20;
            }
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[cRowsetProperties encodeBuffer:BufferOffset:BytesWritten:].cold.5();
          }
          else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            -[cRowsetProperties encodeBuffer:BufferOffset:BytesWritten:].cold.4();
          }
        }
        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          -[cRowsetProperties encodeBuffer:BufferOffset:BytesWritten:].cold.3();
        }
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        -[cRowsetProperties encodeBuffer:BufferOffset:BytesWritten:].cold.2();
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[cRowsetProperties encodeBuffer:BufferOffset:BytesWritten:].cold.1();
    }
  }
  v12 = 12;
LABEL_20:

  return v12;
}

- (unsigned)BOOLeanOptions
{
  return self->_BOOLeanOptions;
}

- (void)setBooleanOptions:(unsigned int)a3
{
  self->_BOOLeanOptions = a3;
}

- (unsigned)maxOpenRows
{
  return self->_maxOpenRows;
}

- (void)setMaxOpenRows:(unsigned int)a3
{
  self->_maxOpenRows = a3;
}

- (unsigned)memoryUsage
{
  return self->_memoryUsage;
}

- (void)setMemoryUsage:(unsigned int)a3
{
  self->_memoryUsage = a3;
}

- (unsigned)maxResult
{
  return self->_maxResult;
}

- (void)setMaxResult:(unsigned int)a3
{
  self->_maxResult = a3;
}

- (unsigned)cmdTimeout
{
  return self->_cmdTimeout;
}

- (void)setCmdTimeout:(unsigned int)a3
{
  self->_cmdTimeout = a3;
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodePrimaryQuery: no buffer space for BOOLeanOptions: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
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
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodePrimaryQuery: no buffer space for maxOpenRows: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
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
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodePrimaryQuery: no buffer space for memoryUsage: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
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
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodePrimaryQuery: no buffer space for maxResult: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
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
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "wspQueryIn:encodePrimaryQuery: no buffer space for cmdTimeout: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
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

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "cRowsetProperties:encodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

@end
