@implementation maxRankProp

- (maxRankProp)initWithInt:(int)a3
{
  uint64_t v3;
  maxRankProp *v4;
  cbaseVariant *v5;
  cbaseVariant *variant;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  cdbProp *v26;
  cdbProp *cProps;
  _BOOL8 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  objc_super v36;

  v3 = *(_QWORD *)&a3;
  v36.receiver = self;
  v36.super_class = (Class)maxRankProp;
  v4 = -[maxRankProp init](&v36, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(cbaseVariant);
    variant = v4->_variant;
    v4->_variant = v5;

    if (v4->_variant)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        if (-[cbaseVariant setScalarType:ScalarValue:](v4->_variant, "setScalarType:ScalarValue:", 3, v7))
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[maxRankProp initWithInt:].cold.4();
        }
        else
        {
          v26 = -[cdbProp initWithPropID:]([cdbProp alloc], "initWithPropID:", 6);
          cProps = v4->_cProps;
          v4->_cProps = v26;

          if (v4->_cProps)
            goto LABEL_14;
          v28 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v28)
            -[maxRankProp initWithInt:].cold.3(v28, v29, v30, v31, v32, v33, v34, v35);
        }
        goto LABEL_13;
      }
      v17 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v17)
        -[maxRankProp initWithInt:].cold.2(v17, v18, v19, v20, v21, v22, v23, v24);
    }
    else
    {
      v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v9)
        -[maxRankProp initWithInt:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    v8 = 0;
LABEL_13:

    v4 = 0;
    goto LABEL_14;
  }
  v8 = 0;
LABEL_14:

  return v4;
}

- (unsigned)propertyID
{
  void *v2;
  unsigned int v3;

  -[maxRankProp cProps](self, "cProps");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dbPropId");

  return v3;
}

- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  int v11;
  int v13;
  uint64_t v14;
  void *v15;
  int v16;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v16 = 0;
  if (objc_msgSend(v8, "length") <= (unint64_t)v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[maxRankProp encodeBuffer:BufferOffset:BytesWritten:].cold.3();
    v11 = 12;
  }
  else
  {
    v9 = objc_retainAutorelease(v8);
    objc_msgSend(v9, "bytes");
    -[maxRankProp cProps](self, "cProps");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "encodeBuffer:BufferOffset:BytesWritten:", v9, v6, &v16);

    if (v11)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[maxRankProp encodeBuffer:BufferOffset:BytesWritten:].cold.2();
    }
    else
    {
      v13 = v16;
      v14 = (v16 + v6);
      -[maxRankProp variant](self, "variant");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v15, "encodeBuffer:BufferOffset:BytesWritten:", v9, v14, &v16);

      if (v11)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[maxRankProp encodeBuffer:BufferOffset:BytesWritten:].cold.1();
      }
      else
      {
        *a5 = v16 + v13;
      }
    }
  }

  return v11;
}

- (cdbProp)cProps
{
  return (cdbProp *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCProps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (cbaseVariant)variant
{
  return (cbaseVariant *)objc_getProperty(self, a2, 16, 1);
}

- (void)setVariant:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variant, 0);
  objc_storeStrong((id *)&self->_cProps, 0);
}

- (void)initWithInt:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "maxRankProp:init: failed to alloc cbaseVariant\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithInt:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "maxRankProp:init: failed to alloc NSNumber\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithInt:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "maxRankProp:init: failed to alloc cProps\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithInt:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "maxRankProp:init: setScalarType error: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "maxRankProp:encodeBuffer: encode variant error: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
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
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "maxRankProp:encodeBuffer: encode cProps error: %d\n", v1, v2, v3, v4, v5);
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

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "maxRankProp:encodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

@end
