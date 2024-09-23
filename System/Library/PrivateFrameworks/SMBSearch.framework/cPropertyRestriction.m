@implementation cPropertyRestriction

- (cPropertyRestriction)initWithRelop:(unsigned int)a3 Weight:(unsigned int)a4
{
  cPropertyRestriction *v6;
  cPropertyRestriction *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)cPropertyRestriction;
  v6 = -[cPropertyRestriction init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->ulType = 5;
    v6->weight = a4;
    v6->_relOp = a3;
    v8 = (void *)MEMORY[0x24BDBCEA0];
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_lcid = objc_msgSend(v8, "windowsLocaleCodeFromLocaleIdentifier:", v10);

  }
  return v7;
}

- (int)restrictionNumber
{
  return 1;
}

- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  int v13;
  uint64_t v15;
  unsigned int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  unsigned int v22;
  unint64_t v23;
  unsigned int v24;
  unsigned int v25;

  v8 = a3;
  v25 = 0;
  v9 = objc_msgSend(v8, "length");
  if (v9 <= a4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cPropertyRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.8();
    goto LABEL_7;
  }
  v10 = v9 - a4;
  v11 = objc_retainAutorelease(v8);
  v12 = objc_msgSend(v11, "bytes");
  if (v10 <= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cPropertyRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.1();
LABEL_7:
    v13 = 12;
    goto LABEL_8;
  }
  v15 = v12;
  *(_DWORD *)(v12 + a4) = self->ulType;
  if (v10 - 4 <= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cPropertyRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.2();
    goto LABEL_7;
  }
  *(_DWORD *)(v12 + a4 + 4) = self->weight;
  if (v10 - 8 <= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cPropertyRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.3();
    goto LABEL_7;
  }
  *(_DWORD *)(v12 + a4 + 8) = self->_relOp;
  v16 = a4 + 12;
  -[cPropertyRestriction propSpec](self, "propSpec");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v17, "encodeBuffer:BufferOffset:BytesWritten:", v11, a4 + 12, &v25);

  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cPropertyRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.7();
  }
  else
  {
    v18 = v25;
    v19 = v25 + v16;
    -[cPropertyRestriction prVal](self, "prVal");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v20, "encodeBuffer:BufferOffset:BytesWritten:", v11, v19, &v25);

    if (!v13)
    {
      v21 = v18 + v25 + 12;
      v22 = v25 + v19;
      v23 = v10 - (v18 + v25) - 12;
      v24 = align4Pad(v25 + v19);
      if (v24)
      {
        if (v23 < v24)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[cPropertyRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.5();
          goto LABEL_7;
        }
        v21 += v24;
        v22 += v24;
        v23 -= v24;
      }
      if (v23 > 3)
      {
        v13 = 0;
        *(_DWORD *)(v15 + v22) = self->_lcid;
        *a5 = v21 + 4;
        goto LABEL_8;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[cPropertyRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.4();
      goto LABEL_7;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cPropertyRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.6();
  }
LABEL_8:

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

- (unsigned)relOp
{
  return self->_relOp;
}

- (void)setRelOp:(unsigned int)a3
{
  self->_relOp = a3;
}

- (fullPropSpec)propSpec
{
  return (fullPropSpec *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPropSpec:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (cbaseVariant)prVal
{
  return (cbaseVariant *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPrVal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (unsigned)lcid
{
  return self->_lcid;
}

- (void)setLcid:(unsigned int)a3
{
  self->_lcid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prVal, 0);
  objc_storeStrong((id *)&self->_propSpec, 0);
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
  OUTLINED_FUNCTION_10_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "cPropertyRestriction:encodeBuffer: no buffer space for ulType, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
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
  OUTLINED_FUNCTION_10_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "cPropertyRestriction:encodeBuffer: no buffer space for weight, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
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
  OUTLINED_FUNCTION_10_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "cPropertyRestriction:encodeBuffer: no buffer space for relOp, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
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

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_10_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "cPropertyRestriction:encodeBuffer: no buffer space for LCID, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
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

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_10_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "cPropertyRestriction:encodeBuffer: no buffer space for align LCID, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
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

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "cPropertyRestriction:encodeBuffer: encode prVal error: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "cPropertyRestriction:encodeBuffer: encode propSpec error: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "cPropertyRestriction:encodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

@end
