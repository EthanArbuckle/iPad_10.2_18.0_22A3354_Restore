@implementation reuseWhereRestriction

- (reuseWhereRestriction)initWithReuseWhereID:(unsigned int)a3 Weight:(unsigned int)a4
{
  reuseWhereRestriction *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)reuseWhereRestriction;
  result = -[reuseWhereRestriction init](&v7, sel_init);
  if (result)
  {
    result->ulType = 17;
    result->_resuseWhereID = a3;
  }
  result->weight = a4;
  return result;
}

- (int)restrictionNumber
{
  return 5;
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
      -[reuseWhereRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.4();
  }
  else
  {
    v10 = v9 - a4;
    v11 = objc_msgSend(objc_retainAutorelease(v8), "bytes");
    if (v10 > 3)
    {
      *(_DWORD *)(v11 + a4) = self->ulType;
      if (v10 - 4 > 3)
      {
        *(_DWORD *)(v11 + a4 + 4) = self->weight;
        if (v10 - 8 > 3)
        {
          v12 = 0;
          *(_DWORD *)(v11 + a4 + 8) = self->_resuseWhereID;
          *a5 = 12;
          goto LABEL_14;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[reuseWhereRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.3();
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        -[reuseWhereRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.2();
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[reuseWhereRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.1();
    }
  }
  v12 = 12;
LABEL_14:

  return v12;
}

- (int)restrictId
{
  return self->restrictId;
}

- (void)setRestrictId:(int)a3
{
  self->restrictId = a3;
}

- (unsigned)ulType
{
  return self->ulType;
}

- (void)setUlType:(unsigned int)a3
{
  self->ulType = a3;
}

- (unsigned)weight
{
  return self->weight;
}

- (void)setWeight:(unsigned int)a3
{
  self->weight = a3;
}

- (unsigned)resuseWhereID
{
  return self->_resuseWhereID;
}

- (void)setResuseWhereID:(unsigned int)a3
{
  self->_resuseWhereID = a3;
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
  OUTLINED_FUNCTION_10_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "reuseWhereRestriction:encodeBuffer: no buffer space for ulType, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
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
  OUTLINED_FUNCTION_10_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "reuseWhereRestriction:encodeBuffer: no buffer space for weight, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
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
  OUTLINED_FUNCTION_10_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "reuseWhereRestriction:encodeBuffer: no buffer space for whereID, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
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
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "reuseWhereRestriction:encodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

@end
