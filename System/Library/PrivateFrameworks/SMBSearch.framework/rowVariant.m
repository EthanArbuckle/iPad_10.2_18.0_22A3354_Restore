@implementation rowVariant

- (rowVariant)init
{
  rowVariant *v2;
  rowVariant *v3;
  NSString *strValue;
  NSMutableArray *vector;
  NSMutableArray *v6;
  NSMutableArray *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)rowVariant;
  v2 = -[rowVariant init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_vType = 0;
    strValue = v2->_strValue;
    v2->_strValue = 0;

    vector = v3->_vector;
    v3->_vector = 0;

    v3->_vectorCount = 0;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = v3->_vector;
    v3->_vector = v6;

  }
  return v3;
}

- (int)decodeBuffer:(id)a3 BaseOffset:(unsigned int)a4 RowStart:(unsigned int)a5 ValueOffset:(unsigned int)a6 ValueLen:(unsigned int)a7 Use64bit:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  void *v19;
  unint64_t v20;
  signed __int16 *p_vType;
  unsigned int v22;
  int v23;
  unsigned int v24;
  unsigned int v26;
  unint64_t v27;
  unsigned int v28;
  unsigned int v29;
  int v30;
  unsigned int v31;
  unint64_t *p_vectorCount;
  const void *v33;
  unint64_t v34;
  unsigned int v35;
  int v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  int v41;
  id v42;
  uint64_t v43;
  void *v44;
  id v45;
  NSString *v46;
  NSString *strValue;
  NSObject *v48;
  const char *v49;
  unsigned int v50;
  unsigned int v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  unsigned int v55;
  uint8_t buf[4];
  unsigned int v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  unsigned int v61;
  __int16 v62;
  unsigned int v63;
  __int16 v64;
  unsigned int v65;
  uint64_t v66;

  v8 = a8;
  v66 = *MEMORY[0x24BDAC8D0];
  v53 = 0;
  v54 = 0;
  v55 = 0;
  v14 = objc_retainAutorelease(a3);
  v15 = objc_msgSend(v14, "bytes");
  v16 = objc_msgSend(v14, "length");
  v17 = v16;
  v18 = a6 + a5;
  if (v18 + 2 > v16)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:].cold.1();
LABEL_4:
    v19 = 0;
    LODWORD(v20) = 55;
    goto LABEL_73;
  }
  v51 = a4;
  v52 = v14;
  self->_vType = *(_WORD *)(v15 + v18);
  p_vType = &self->_vType;
  v22 = v18 + 8;
  if (v18 + 8 > v16 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:].cold.22();
  LODWORD(v20) = *p_vType;
  if ((int)v20 <= 20)
  {
    if (*p_vType)
    {
      if ((_DWORD)v20 != 3 && (_DWORD)v20 != 19)
        goto LABEL_41;
      if (v18 + 12 <= v17)
      {
        v26 = *(_DWORD *)(v15 + v22);
        if ((_DWORD)v20 == 3)
        {
          self->_int4Val = v26;
          v14 = v52;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
            -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:].cold.4();
        }
        else
        {
          self->_uint4Val = v26;
          v14 = v52;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
            -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:].cold.5();
        }
        goto LABEL_61;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:].cold.3();
LABEL_70:
      v19 = 0;
LABEL_71:
      LODWORD(v20) = 55;
LABEL_72:
      v14 = v52;
      goto LABEL_73;
    }
LABEL_50:
    v19 = 0;
    goto LABEL_72;
  }
  if ((int)v20 <= 63)
  {
    if ((_DWORD)v20 == 21)
    {
      if (v18 + 16 <= v17)
      {
        LODWORD(v20) = 0;
        v19 = 0;
        self->_uint64Val = *(_QWORD *)(v15 + v22);
        goto LABEL_72;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:].cold.7();
      goto LABEL_70;
    }
    if ((_DWORD)v20 == 31)
    {
      if (v8)
        v23 = 8;
      else
        v23 = 4;
      v24 = v23 + v22;
      if (v23 + v22 > v17)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:].cold.8();
        goto LABEL_70;
      }
      __memcpy_chk();
      if (v8)
      {
        v14 = v52;
        v28 = v51;
        if (a7 <= 0x18)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:].cold.9();
LABEL_77:
          v19 = 0;
LABEL_44:
          LODWORD(v20) = 22;
          goto LABEL_73;
        }
      }
      else
      {
        v14 = v52;
        v28 = v51;
        if (a7 <= 0x10)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:].cold.12();
          goto LABEL_77;
        }
      }
      v37 = -[rowVariant utf16StrLen:Offset:Result:](self, "utf16StrLen:Offset:Result:", v14, v54, &v55);
      if (v37)
      {
        LODWORD(v20) = v37;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:].cold.11(&v54, v17, v20);
        goto LABEL_62;
      }
      if (v54 + v28 + (unint64_t)v55 > v17)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67110144;
          v57 = v28;
          v58 = 2048;
          v59 = v54;
          v60 = 1024;
          v61 = v55;
          v62 = 1024;
          v63 = v24;
          v64 = 1024;
          v65 = v17;
          _os_log_error_impl(&dword_227C1F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "rowVariant: out of buffer for VT_LPWSTR string, baseOffset: %u offSet: 0x%llx, strLen: %u bOffset: %u, bLen: %u\n", buf, 0x24u);
        }
        goto LABEL_4;
      }
      v45 = objc_alloc(MEMORY[0x24BDD17C8]);
      v46 = (NSString *)objc_msgSend(v45, "initWithBytes:length:encoding:", v15 + v54, v55 - 2, 2483028224);
      strValue = self->_strValue;
      self->_strValue = v46;

      if (!self->_strValue)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:].cold.10();
        v19 = 0;
        LODWORD(v20) = 5;
        goto LABEL_73;
      }
LABEL_61:
      LODWORD(v20) = 0;
LABEL_62:
      v19 = 0;
      goto LABEL_73;
    }
LABEL_41:
    v14 = v52;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:].cold.2();
    v19 = 0;
    *p_vType = 0;
    goto LABEL_44;
  }
  if ((_DWORD)v20 == 64)
  {
    if (v18 + 16 > v17)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:].cold.6();
      goto LABEL_70;
    }
    v27 = *(_QWORD *)(v15 + v22);
    self->_uint64Val = v27;
    smb_time_NT2local(v27, &self->_timeSpec.tv_sec);
    LODWORD(v20) = 0;
    goto LABEL_50;
  }
  if ((_DWORD)v20 != 4127)
    goto LABEL_41;
  if (v8)
  {
    if (a7 <= 0x18)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:].cold.13();
      goto LABEL_33;
    }
    v29 = 8;
    v30 = -24;
  }
  else
  {
    if (a7 <= 0x10 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:].cold.21();
    v29 = 4;
    v30 = -16;
  }
  v31 = v29 + v22;
  if (v29 + v22 > v17)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:].cold.14();
    goto LABEL_70;
  }
  p_vectorCount = &self->_vectorCount;
  v33 = (const void *)(v15 + v22);
  v34 = v29;
  v35 = v29;
  memcpy(&self->_vectorCount, v33, v29);
  v50 = v35;
  if (v31 + v35 > v17)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:].cold.15();
    goto LABEL_70;
  }
  v20 = v30 + a7;
  __memcpy_chk();
  if (*p_vectorCount)
  {
    v19 = 0;
    v38 = 0;
    v39 = 0;
    while (1)
    {
      if (v34 + v51 + v39 > v17)
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_71;
        *(_DWORD *)buf = 67109888;
        v57 = v51;
        v58 = 2048;
        v59 = v53;
        v60 = 1024;
        v61 = v50;
        v62 = 1024;
        v63 = v17;
        v48 = MEMORY[0x24BDACB70];
        v49 = "rowVariant: out of buffer for VT_LPWSTR vectorStart, baseOffset: %u, vectOffset: %llu, desiredLen: %u, bLen: %u\n";
LABEL_111:
        _os_log_error_impl(&dword_227C1F000, v48, OS_LOG_TYPE_ERROR, v49, buf, 0x1Eu);
        goto LABEL_71;
      }
      __memcpy_chk();
      v40 = v20 - v34;
      if (v20 <= v34)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:].cold.20();
        goto LABEL_34;
      }
      v41 = -[rowVariant utf16StrLen:Offset:Result:](self, "utf16StrLen:Offset:Result:", v52, v51, &v55);
      if (v41)
      {
        LODWORD(v20) = v41;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:].cold.19();
        goto LABEL_72;
      }
      if (v51 + (unint64_t)v55 > v17)
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_71;
        *(_DWORD *)buf = 67109888;
        v57 = v51;
        v58 = 2048;
        v59 = 0;
        v60 = 1024;
        v61 = v55;
        v62 = 1024;
        v63 = v17;
        v48 = MEMORY[0x24BDACB70];
        v49 = "rowVariant: out of buffer for VT_LPWSTR vector, baseOffset: %u, vectStart: %llu, vectLen: %u, bLen: %u\n";
        goto LABEL_111;
      }
      v42 = objc_alloc(MEMORY[0x24BDD17C8]);
      v43 = objc_msgSend(v42, "initWithBytes:length:encoding:", v15, v55 - 2, 2483028224);

      if (!v43)
        break;
      -[rowVariant vector](self, "vector");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addObject:", v43);

      v39 = v53 + v34;
      v53 += v34;
      v20 = v40 - v55;
      if (v40 < v55)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:].cold.18();
        LODWORD(v20) = 5;
        goto LABEL_117;
      }
      ++v38;
      v19 = (void *)v43;
      if (v38 >= *p_vectorCount)
        goto LABEL_95;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:].cold.17();
LABEL_33:
    v19 = 0;
LABEL_34:
    LODWORD(v20) = 5;
    goto LABEL_72;
  }
  v43 = 0;
LABEL_95:
  if (!v20)
  {
LABEL_117:
    v19 = (void *)v43;
    goto LABEL_72;
  }
  v14 = v52;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:].cold.16();
  LODWORD(v20) = 0;
  v19 = (void *)v43;
LABEL_73:

  return v20;
}

- (int)utf16StrLen:(id)a3 Offset:(unint64_t)a4 Result:(unsigned int *)a5
{
  id v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  int v11;

  v7 = objc_retainAutorelease(a3);
  v8 = objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");
  if (v9 <= a4)
  {
LABEL_5:
    v11 = 2;
  }
  else
  {
    v10 = 0;
    while (*(_WORD *)(v8 + a4 + v10))
    {
      v10 += 2;
      if (a4 + v10 >= v9)
        goto LABEL_5;
    }
    v11 = 0;
    *a5 = v10 + 2;
  }

  return v11;
}

- (signed)vType
{
  return self->_vType;
}

- (void)setVType:(signed __int16)a3
{
  self->_vType = a3;
}

- (unsigned)reserved1
{
  return self->_reserved1;
}

- (void)setReserved1:(unsigned __int8)a3
{
  self->_reserved1 = a3;
}

- (unsigned)reserved2
{
  return self->_reserved2;
}

- (void)setReserved2:(unsigned int)a3
{
  self->_reserved2 = a3;
}

- (unint64_t)uint64Val
{
  return self->_uint64Val;
}

- (void)setUint64Val:(unint64_t)a3
{
  self->_uint64Val = a3;
}

- (timespec)timeSpec
{
  __darwin_time_t v2;
  uint64_t v3;
  _QWORD v4[2];
  timespec result;

  objc_copyStruct(v4, &self->_timeSpec, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.tv_nsec = v3;
  result.tv_sec = v2;
  return result;
}

- (void)setTimeSpec:(timespec)a3
{
  timespec v3;

  v3 = a3;
  objc_copyStruct(&self->_timeSpec, &v3, 16, 1, 0);
}

- (unsigned)uint4Val
{
  return self->_uint4Val;
}

- (void)setUint4Val:(unsigned int)a3
{
  self->_uint4Val = a3;
}

- (int)int4Val
{
  return self->_int4Val;
}

- (void)setInt4Val:(int)a3
{
  self->_int4Val = a3;
}

- (NSString)strValue
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setStrValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableArray)vector
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setVector:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (unint64_t)vectorCount
{
  return self->_vectorCount;
}

- (void)setVectorCount:(unint64_t)a3
{
  self->_vectorCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vector, 0);
  objc_storeStrong((id *)&self->_strValue, 0);
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_10(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "rowVariant: out of buffer for vType, rowStart: %u, bOffset: %u, bLen: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_1_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "rowVariant:decodeBuffer: vt_type: 0x%x not supported\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_10(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "rowVariant: out of buffer for VT_I4 value, rowStart: %u, bOffset: %u, bLen: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_1_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "rowVariant: decoded VT_I4: 0x%x\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_1_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "rowVariant: decoded VT_UI4: 0x%x\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_10(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "rowVariant: out of buffer for VT_FILETIME value, rowStart: %u, bOffset: %u, bLen: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_10(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "rowVariant: out of buffer for VT_I8 value, rowStart: %u, bOffset: %u, bLen: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_10(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "rowVariant: out of buffer for VT_LPWSTR offSet field, rowStart: %u, bOffset: %u, bLen: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_9_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "rowVariant: LPWSTR: valLen: %u less than VALUE_LEN_64bit: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.10()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_227C1F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "rowVariant: failed to decode LPWSTR\n", v0, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)decodeBuffer:(int)a3 BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.11(uint64_t *a1, int a2, int a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 134218496;
  v5 = v3;
  v6 = 1024;
  v7 = a2;
  v8 = 1024;
  v9 = a3;
  _os_log_error_impl(&dword_227C1F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "rowVariant: LPWSTR: offSet: %llu, bLen: %u, utf16StrLen error: %d", (uint8_t *)&v4, 0x18u);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.12()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_9_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "rowVariant: LPWSTR: valLen: %u less than VALUE_LEN_32bit: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.13()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_9_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "rowVariant: valLen: %u is <= than VALUE_LEN_64bit: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_10(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "rowVariant: out of buffer for VT_LPWSTR vector count field, rowStart: %u, bOffset: %u, bLen: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.15()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_10(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "rowVariant: out of buffer for VT_LPWSTR vectorOffset, rowStart: %u, bOffset: %u, bLen: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.16()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_10_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "rowVariant: vectRemain: %llu not zero like it should be\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.17()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_10_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "rowVariant: failed to decode LPWSTR Vect at index: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.18()
{
  uint64_t v0;
  uint64_t v1;
  uint8_t v2[8];
  __int16 v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10_1();
  v3 = 2048;
  v4 = v0;
  v5 = 2048;
  v6 = v1;
  _os_log_error_impl(&dword_227C1F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "rowVariant: strLen: %u > vectRemain: %llu, LPWSTR Vect at index: %llu\n", v2, 0x1Cu);
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.19()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_10_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "rowVariant:decodeBuffer error decoding LPWSTR Vect at index: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_10_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "rowVariant:decodeBuffer vectRemain way too small: %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.21()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_9_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "rowVariant: valLen: %u is <= VALUE_LEN_32bit: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.22()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_10(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "rowVariant: out of buffer for reserved fields, rowStart: %u, bOffset: %u, bLen: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

@end
