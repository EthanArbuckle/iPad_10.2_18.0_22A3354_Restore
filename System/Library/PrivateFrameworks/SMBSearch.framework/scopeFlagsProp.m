@implementation scopeFlagsProp

- (scopeFlagsProp)initWithScopeFlagsArr:(id)a3 UseExtBTypes:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  scopeFlagsProp *v7;
  cbaseVariant *v8;
  cbaseVariant *variant;
  cbaseVariant *v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  cdbProp *v19;
  cdbProp *cProps;
  _BOOL8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  objc_super v30;

  v4 = a4;
  v6 = a3;
  v30.receiver = self;
  v30.super_class = (Class)scopeFlagsProp;
  v7 = -[scopeFlagsProp init](&v30, sel_init);
  if (v7)
  {
    v8 = objc_alloc_init(cbaseVariant);
    variant = v7->_variant;
    v7->_variant = v8;

    v10 = v7->_variant;
    if (!v10)
    {
      v11 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v11)
        -[scopeFlagsProp initWithScopeFlagsArr:UseExtBTypes:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
      goto LABEL_15;
    }
    if (v4)
    {
      if (-[cbaseVariant setVectorWithType:ValueArray:](v10, "setVectorWithType:ValueArray:", 3, v6))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[scopeFlagsProp initWithScopeFlagsArr:UseExtBTypes:].cold.3();
LABEL_15:

        v7 = 0;
        goto LABEL_16;
      }
    }
    else if (-[cbaseVariant setArrayWithType:ValueArray:](v10, "setArrayWithType:ValueArray:", 3, v6))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[scopeFlagsProp initWithScopeFlagsArr:UseExtBTypes:].cold.4();
      goto LABEL_15;
    }
    v19 = -[cdbProp initWithPropID:]([cdbProp alloc], "initWithPropID:", 4);
    cProps = v7->_cProps;
    v7->_cProps = v19;

    if (!v7->_cProps)
    {
      v21 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v21)
        -[scopeFlagsProp initWithScopeFlagsArr:UseExtBTypes:].cold.2(v21, v22, v23, v24, v25, v26, v27, v28);
      goto LABEL_15;
    }
  }
LABEL_16:

  return v7;
}

- (unsigned)propertyID
{
  void *v2;
  unsigned int v3;

  -[scopeFlagsProp cProps](self, "cProps");
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
      -[scopeFlagsProp encodeBuffer:BufferOffset:BytesWritten:].cold.3();
    v11 = 12;
  }
  else
  {
    v9 = objc_retainAutorelease(v8);
    objc_msgSend(v9, "bytes");
    -[scopeFlagsProp cProps](self, "cProps");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "encodeBuffer:BufferOffset:BytesWritten:", v9, v6, &v16);

    if (v11)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[scopeFlagsProp encodeBuffer:BufferOffset:BytesWritten:].cold.2();
    }
    else
    {
      v13 = v16;
      v14 = (v16 + v6);
      -[scopeFlagsProp variant](self, "variant");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v15, "encodeBuffer:BufferOffset:BytesWritten:", v9, v14, &v16);

      if (v11)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[scopeFlagsProp encodeBuffer:BufferOffset:BytesWritten:].cold.1();
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

- (void)initWithScopeFlagsArr:(uint64_t)a3 UseExtBTypes:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "scopeFlagsProp:initWithScopeFlagsArr: failed to alloc cbaseVariant\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithScopeFlagsArr:(uint64_t)a3 UseExtBTypes:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "scopeFlagsProp:initWithScopeFlagsArr: failed to alloc cProps\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithScopeFlagsArr:UseExtBTypes:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "scopeFlagsProp:initWithScopeFlagsArr: setVectorWithType error: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)initWithScopeFlagsArr:UseExtBTypes:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "scopeFlagsProp:initWithScopeFlagsArr: setArrayWithType error: %d\n", v1, v2, v3, v4, v5);
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
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "scopeFlagsProp:encodeBuffer: encode variant error: %d\n", v1, v2, v3, v4, v5);
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
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "scopeFlagsProp:encodeBuffer: encode cProps error: %d\n", v1, v2, v3, v4, v5);
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
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "scopeFlagsProp:encodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

@end
