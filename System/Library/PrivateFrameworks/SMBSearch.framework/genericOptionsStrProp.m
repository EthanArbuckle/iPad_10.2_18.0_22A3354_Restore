@implementation genericOptionsStrProp

- (genericOptionsStrProp)initWithOptionsStr:(id)a3
{
  id v4;
  genericOptionsStrProp *v5;
  cbaseVariant *v6;
  cbaseVariant *variant;
  cbaseVariant *v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  cdbProp *v18;
  cdbProp *cProps;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)genericOptionsStrProp;
  v5 = -[genericOptionsStrProp init](&v28, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(cbaseVariant);
    variant = v5->_variant;
    v5->_variant = v6;

    v8 = v5->_variant;
    if (v8)
    {
      if (-[cbaseVariant setStringType:UTF8Str:](v8, "setStringType:UTF8Str:", 8, v4))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[genericOptionsStrProp initWithOptionsStr:].cold.3();
      }
      else
      {
        v18 = -[cdbProp initWithPropID:]([cdbProp alloc], "initWithPropID:", 6);
        cProps = v5->_cProps;
        v5->_cProps = v18;

        if (v5->_cProps)
          goto LABEL_9;
        v20 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v20)
          -[genericOptionsStrProp initWithOptionsStr:].cold.2(v20, v21, v22, v23, v24, v25, v26, v27);
      }
    }
    else
    {
      v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v9)
        -[genericOptionsStrProp initWithOptionsStr:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    v5 = 0;
  }
LABEL_9:

  return v5;
}

- (unsigned)propertyID
{
  void *v2;
  unsigned int v3;

  -[genericOptionsStrProp cProps](self, "cProps");
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
      -[genericOptionsStrProp encodeBuffer:BufferOffset:BytesWritten:].cold.3();
    v11 = 12;
  }
  else
  {
    v9 = objc_retainAutorelease(v8);
    objc_msgSend(v9, "bytes");
    -[genericOptionsStrProp cProps](self, "cProps");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "encodeBuffer:BufferOffset:BytesWritten:", v9, v6, &v16);

    if (v11)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[genericOptionsStrProp encodeBuffer:BufferOffset:BytesWritten:].cold.2();
    }
    else
    {
      v13 = v16;
      v14 = (v16 + v6);
      -[genericOptionsStrProp variant](self, "variant");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v15, "encodeBuffer:BufferOffset:BytesWritten:", v9, v14, &v16);

      if (v11)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[genericOptionsStrProp encodeBuffer:BufferOffset:BytesWritten:].cold.1();
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

- (void)initWithOptionsStr:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "genericOptionsStrProp:initWithOptionsStr: failed to alloc cbaseVariant\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithOptionsStr:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "genericOptionsStrProp:initWithOptionsStr: failed to alloc cProps\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithOptionsStr:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "genericOptionsStrProp:initWithOptionsStr: setScalarType error: %d\n", v1, v2, v3, v4, v5);
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
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "genericOptionsStrProp:encodeBuffer: encode variant error: %d\n", v1, v2, v3, v4, v5);
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
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "genericOptionsStrProp:encodeBuffer: encode cProps error: %d\n", v1, v2, v3, v4, v5);
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
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "genericOptionsStrProp:encodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

@end
