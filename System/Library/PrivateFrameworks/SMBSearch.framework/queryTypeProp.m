@implementation queryTypeProp

- (queryTypeProp)init
{
  queryTypeProp *v2;
  cbaseVariant *v3;
  cbaseVariant *variant;
  uint64_t v5;
  void *v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  cdbProp *v24;
  cdbProp *cProps;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)queryTypeProp;
  v2 = -[queryTypeProp init](&v34, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(cbaseVariant);
    variant = v2->_variant;
    v2->_variant = v3;

    if (v2->_variant)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
      v5 = objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = (void *)v5;
        if (-[cbaseVariant setScalarType:ScalarValue:](v2->_variant, "setScalarType:ScalarValue:", 3, v5))
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[queryTypeProp init].cold.4();
        }
        else
        {
          v24 = -[cdbProp initWithPropID:]([cdbProp alloc], "initWithPropID:", 7);
          cProps = v2->_cProps;
          v2->_cProps = v24;

          if (v2->_cProps)
            goto LABEL_14;
          v26 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v26)
            -[queryTypeProp init].cold.3(v26, v27, v28, v29, v30, v31, v32, v33);
        }
        goto LABEL_13;
      }
      v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v15)
        -[queryTypeProp init].cold.2(v15, v16, v17, v18, v19, v20, v21, v22);
    }
    else
    {
      v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v7)
        -[queryTypeProp init].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    v6 = 0;
LABEL_13:

    v2 = 0;
    goto LABEL_14;
  }
  v6 = 0;
LABEL_14:

  return v2;
}

- (unsigned)propertyID
{
  void *v2;
  unsigned int v3;

  -[queryTypeProp cProps](self, "cProps");
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
      -[queryTypeProp encodeBuffer:BufferOffset:BytesWritten:].cold.3();
    v11 = 12;
  }
  else
  {
    v9 = objc_retainAutorelease(v8);
    objc_msgSend(v9, "bytes");
    -[queryTypeProp cProps](self, "cProps");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "encodeBuffer:BufferOffset:BytesWritten:", v9, v6, &v16);

    if (v11)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[queryTypeProp encodeBuffer:BufferOffset:BytesWritten:].cold.2();
    }
    else
    {
      v13 = v16;
      v14 = (v16 + v6);
      -[queryTypeProp variant](self, "variant");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v15, "encodeBuffer:BufferOffset:BytesWritten:", v9, v14, &v16);

      if (v11)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[queryTypeProp encodeBuffer:BufferOffset:BytesWritten:].cold.1();
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

- (void)init
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "queryTypeProp:init: setScalarType error: %d\n", v1, v2, v3, v4, v5);
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
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "queryTypeProp:encodeBuffer: encode variant error: %d\n", v1, v2, v3, v4, v5);
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
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "queryTypeProp:encodeBuffer: encode cProps error: %d\n", v1, v2, v3, v4, v5);
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
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "queryTypeProp:encodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

@end
