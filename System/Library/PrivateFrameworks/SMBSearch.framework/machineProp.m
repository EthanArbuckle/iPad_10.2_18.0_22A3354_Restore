@implementation machineProp

- (machineProp)initWithServerMachine:(id)a3 UseExtBTypes:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  machineProp *v7;
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
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL8 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  cdbProp *v35;
  cdbProp *cProps;
  _BOOL8 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  objc_super v46;

  v4 = a4;
  v6 = a3;
  v46.receiver = self;
  v46.super_class = (Class)machineProp;
  v7 = -[machineProp init](&v46, sel_init);
  if (v7)
  {
    v8 = objc_alloc_init(cbaseVariant);
    variant = v7->_variant;
    v7->_variant = v8;

    v10 = v7->_variant;
    if (!v10)
    {
      v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v19)
        -[machineProp initWithServerMachine:UseExtBTypes:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
      goto LABEL_15;
    }
    if (v4)
    {
      if (-[cbaseVariant setStringType:UTF8Str:](v10, "setStringType:UTF8Str:", 31, v6))
      {
        v11 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v11)
          -[machineProp initWithServerMachine:UseExtBTypes:].cold.3(v11, v12, v13, v14, v15, v16, v17, v18);
LABEL_15:

        v7 = 0;
        goto LABEL_16;
      }
    }
    else if (-[cbaseVariant setStringType:UTF8Str:](v10, "setStringType:UTF8Str:", 8, v6))
    {
      v27 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v27)
        -[machineProp initWithServerMachine:UseExtBTypes:].cold.4(v27, v28, v29, v30, v31, v32, v33, v34);
      goto LABEL_15;
    }
    v35 = -[cdbProp initWithPropID:]([cdbProp alloc], "initWithPropID:", 2);
    cProps = v7->_cProps;
    v7->_cProps = v35;

    if (!v7->_cProps)
    {
      v37 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v37)
        -[machineProp initWithServerMachine:UseExtBTypes:].cold.2(v37, v38, v39, v40, v41, v42, v43, v44);
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

  -[machineProp cProps](self, "cProps");
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
      -[machineProp encodeBuffer:BufferOffset:BytesWritten:].cold.3();
    v11 = 12;
  }
  else
  {
    v9 = objc_retainAutorelease(v8);
    objc_msgSend(v9, "bytes");
    -[machineProp cProps](self, "cProps");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "encodeBuffer:BufferOffset:BytesWritten:", v9, v6, &v16);

    if (v11)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[machineProp encodeBuffer:BufferOffset:BytesWritten:].cold.2();
    }
    else
    {
      v13 = v16;
      v14 = (v16 + v6);
      -[machineProp variant](self, "variant");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v15, "encodeBuffer:BufferOffset:BytesWritten:", v9, v14, &v16);

      if (v11)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[machineProp encodeBuffer:BufferOffset:BytesWritten:].cold.1();
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

- (void)initWithServerMachine:(uint64_t)a3 UseExtBTypes:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "machineProp:initWithServerMachine: failed to alloc cbaseVariant\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithServerMachine:(uint64_t)a3 UseExtBTypes:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "machineProp:initWithServerMachine: failed to alloc cProps\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithServerMachine:(uint64_t)a3 UseExtBTypes:(uint64_t)a4 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "machineProp:initWithServerMachine: failed to create VT_LPWSTR variant\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)initWithServerMachine:(uint64_t)a3 UseExtBTypes:(uint64_t)a4 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "machineProp:initWithServerMachine: failed to create VT_BSTR variant\n", a5, a6, a7, a8, 0);
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
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "machineProp:encodeBuffer: encode variant error: %d\n", v1, v2, v3, v4, v5);
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
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "machineProp:encodeBuffer: encode cProps error: %d\n", v1, v2, v3, v4, v5);
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
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "machineProp:encodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

@end
