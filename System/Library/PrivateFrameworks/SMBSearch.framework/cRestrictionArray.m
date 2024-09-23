@implementation cRestrictionArray

- (cRestrictionArray)init
{
  cRestrictionArray *v2;
  cRestrictionArray *v3;
  RestrictionProtocol *restriction;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)cRestrictionArray;
  v2 = -[cRestrictionArray init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isPresent = 0;
    restriction = v2->_restriction;
    v2->_restriction = 0;

  }
  return v3;
}

- (cRestrictionArray)initWithRestriction:(id)a3
{
  id v5;
  cRestrictionArray *v6;
  cRestrictionArray *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)cRestrictionArray;
  v6 = -[cRestrictionArray init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_isPresent = 1;
    objc_storeStrong((id *)&v6->_restriction, a3);
  }

  return v7;
}

- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  id v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unsigned int v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  unsigned int v24;
  int v25;
  void *v26;
  int v28;

  v8 = a3;
  v28 = 0;
  v9 = objc_msgSend(v8, "length");
  if (v9 <= a4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cRestrictionArray encodeBuffer:BufferOffset:BytesWritten:].cold.4();
    goto LABEL_12;
  }
  v10 = objc_retainAutorelease(v8);
  v11 = objc_msgSend(v10, "bytes");
  *(_BYTE *)(v11 + a4) = 1;
  v12 = v9 + ~(unint64_t)a4;
  if (!v12)
  {
    v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v15)
      -[cRestrictionArray encodeBuffer:BufferOffset:BytesWritten:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
    goto LABEL_12;
  }
  *(_BYTE *)(v11 + a4 + 1) = -[cRestrictionArray isPresent](self, "isPresent");
  if (!-[cRestrictionArray isPresent](self, "isPresent"))
  {
    v24 = 2;
LABEL_20:
    v23 = 0;
    *a5 = v24;
    goto LABEL_21;
  }
  v13 = a4 + 2;
  v14 = align4Pad(v13);
  if (v14)
  {
    if (v12 - 1 < v14)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[cRestrictionArray encodeBuffer:BufferOffset:BytesWritten:].cold.3();
LABEL_12:
      v23 = 12;
      goto LABEL_21;
    }
    v25 = v14 + 2;
    v13 = v14 + v13;
  }
  else
  {
    v25 = 2;
  }
  -[cRestrictionArray restriction](self, "restriction");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v26, "encodeBuffer:BufferOffset:BytesWritten:", v10, v13, &v28);

  if (!v23)
  {
    v24 = v28 + v25;
    goto LABEL_20;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[cRestrictionArray encodeBuffer:BufferOffset:BytesWritten:].cold.2();
LABEL_21:

  return v23;
}

- (BOOL)isPresent
{
  return self->_isPresent;
}

- (RestrictionProtocol)restriction
{
  return (RestrictionProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRestriction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restriction, 0);
}

- (void)encodeBuffer:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "cRestrictionArray:encodeBuffer: no buffer space for isPresent, sizeAvail: %llu\n", a5, a6, a7, a8, 0);
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

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "cRestrictionArray:encodeBuffer: encode cRestriction error: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
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
  OUTLINED_FUNCTION_10_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "cRestrictionArray:encodeBuffer: no buffer space for align, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
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
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "cRestrictionArray:encodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

@end
