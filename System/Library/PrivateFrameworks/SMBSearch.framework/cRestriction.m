@implementation cRestriction

- (cRestriction)initWithType:(unsigned int)a3 Weight:(unsigned int)a4
{
  cRestriction *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)cRestriction;
  result = -[cRestriction init](&v7, sel_init);
  if (result)
  {
    result->ulType = a3;
    result->weight = a4;
  }
  return result;
}

- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  int v13;
  void *v15;
  int v16;

  v8 = a3;
  v16 = 0;
  v9 = objc_msgSend(v8, "length");
  if (v9 <= a4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.4();
    goto LABEL_10;
  }
  v10 = v9 - a4;
  v11 = objc_retainAutorelease(v8);
  v12 = objc_msgSend(v11, "bytes");
  if (v10 <= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.1();
LABEL_10:
    v13 = 12;
    goto LABEL_11;
  }
  *(_DWORD *)(v12 + a4) = self->ulType;
  if (v10 - 4 <= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.2();
    goto LABEL_10;
  }
  *(_DWORD *)(v12 + a4 + 4) = self->weight;
  -[cRestriction restrictionObj](self, "restrictionObj");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v15, "encodeBuffer:BufferOffset:BytesWritten:", v11, a4 + 8, &v16);

  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.3();
  }
  else
  {
    *a5 = v16 + 8;
  }
LABEL_11:

  return v13;
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

- (RestrictionProtocol)restrictionObj
{
  return (RestrictionProtocol *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRestrictionObj:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictionObj, 0);
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
  OUTLINED_FUNCTION_10_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "cRestriction:encodeBuffer: no buffer space for ulType, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
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
  OUTLINED_FUNCTION_10_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "cRestriction:encodeBuffer: no buffer space for weight, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
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

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "cRestriction:encodeBuffer: encode cRestriction obj error: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
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
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "cRestriction:encodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

@end
