@implementation cbaseVariant

- (cbaseVariant)init
{
  cbaseVariant *v2;
  cbaseVariant *v3;
  NSNumber *scalarValue;
  utf16leData *strData;
  vtVector *vectObj;
  vtSafeArray *arrObj;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)cbaseVariant;
  v2 = -[cbaseVariant init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_DWORD *)&v2->_vData1 = 0;
    scalarValue = v2->_scalarValue;
    v2->_scalarValue = 0;

    strData = v3->_strData;
    v3->_strData = 0;

    vectObj = v3->_vectObj;
    v3->_vectObj = 0;

    arrObj = v3->_arrObj;
    v3->_arrObj = 0;

  }
  return v3;
}

- (int)setScalarType:(unsigned __int16)a3 ScalarValue:(id)a4
{
  int v5;
  id v7;
  int v8;

  v5 = a3;
  v7 = a4;
  if ((v5 - 2) <= 0x3E && ((1 << (v5 - 2)) & 0x400000000003C203) != 0)
  {
    objc_storeStrong((id *)&self->_scalarValue, a4);
    v8 = 0;
    self->_vType = v5;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cbaseVariant setScalarType:ScalarValue:].cold.1();
    v8 = 22;
  }

  return v8;
}

- (int)setStringType:(unsigned __int16)a3 UTF8Str:(id)a4
{
  int v4;
  id v6;
  utf16leData *v7;
  utf16leData *strData;
  int v9;

  v4 = a3;
  v6 = a4;
  if (v4 == 8 || v4 == 31)
  {
    v7 = -[utf16leData initWithStr:]([utf16leData alloc], "initWithStr:", v6);
    strData = self->_strData;
    self->_strData = v7;

    if (self->_strData)
    {
      v9 = 0;
      self->_vType = v4;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[cbaseVariant setStringType:UTF8Str:].cold.2();
      v9 = 12;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cbaseVariant setStringType:UTF8Str:].cold.1();
    v9 = 22;
  }

  return v9;
}

- (int)setVectorWithType:(unsigned __int16)a3 ValueArray:(id)a4
{
  uint64_t v4;
  id v6;
  int v7;
  int v8;

  v4 = a3;
  v6 = a4;
  if (v4 <= 0x1F)
  {
    if (((1 << v4) & 0xF080C) != 0)
    {
      v7 = -[cbaseVariant setIntVectorType:ValueArray:](self, "setIntVectorType:ValueArray:", v4, v6);
LABEL_6:
      v8 = v7;
      goto LABEL_7;
    }
    if (((1 << v4) & 0x80000100) != 0)
    {
      v7 = -[cbaseVariant setStrVectorType:ValueArray:](self, "setStrVectorType:ValueArray:", v4, v6);
      goto LABEL_6;
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[cbaseVariant setVectorWithType:ValueArray:].cold.1();
  v8 = 22;
LABEL_7:

  return v8;
}

- (int)setStrVectorType:(unsigned __int16)a3 ValueArray:(id)a4
{
  uint64_t v4;
  id v6;
  vtVector *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  utf16leData *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  utf16leData *v16;
  void *v17;
  void *v18;
  int v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int16 v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v4 = a3;
  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = objc_alloc_init(vtVector);
  -[cbaseVariant setVectObj:](self, "setVectObj:", v7);

  -[cbaseVariant vectObj](self, "vectObj");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v10)
    {
      v11 = v10;
      v36 = v4;
      v37 = v6;
      v12 = 0;
      v13 = 0;
      v14 = *(_QWORD *)v39;
      while (2)
      {
        v15 = 0;
        v16 = v12;
        v17 = v13;
        do
        {
          if (*(_QWORD *)v39 != v14)
            objc_enumerationMutation(v9);
          v13 = *(id *)(*((_QWORD *)&v38 + 1) + 8 * v15);

          v12 = -[utf16leData initWithStr:]([utf16leData alloc], "initWithStr:", v13);
          if (!v12)
          {
            v20 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v20)
              -[cbaseVariant setStrVectorType:ValueArray:].cold.2(v20, v21, v22, v23, v24, v25, v26, v27);

            v19 = 12;
            v6 = v37;
            goto LABEL_18;
          }
          -[cbaseVariant vectObj](self, "vectObj");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addElement:", v12);

          ++v15;
          v16 = v12;
          v17 = v13;
        }
        while (v11 != v15);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        if (v11)
          continue;
        break;
      }

      v6 = v37;
      LOWORD(v4) = v36;
    }

    v19 = 0;
    self->_vType = v4 | 0x1000;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cbaseVariant setStrVectorType:ValueArray:].cold.1(v4, v28, v29, v30, v31, v32, v33, v34);
    v19 = 12;
  }
LABEL_18:

  return v19;
}

- (int)setIntVectorType:(unsigned int)a3 ValueArray:(id)a4
{
  __int16 v4;
  id v6;
  vtVector *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v4 = a3;
  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = objc_alloc_init(vtVector);
  -[cbaseVariant setVectObj:](self, "setVectObj:", v7);

  -[cbaseVariant vectObj](self, "vectObj");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v28;
      do
      {
        v14 = 0;
        v15 = v12;
        do
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v9);
          v12 = *(id *)(*((_QWORD *)&v27 + 1) + 8 * v14);

          -[cbaseVariant vectObj](self, "vectObj", (_QWORD)v27);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addElement:", v12);

          ++v14;
          v15 = v12;
        }
        while (v11 != v14);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v11);

    }
    v17 = 0;
    self->_vType = v4 | 0x1000;
  }
  else
  {
    v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v18)
      -[cbaseVariant setIntVectorType:ValueArray:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
    v17 = 12;
  }

  return v17;
}

- (int)setArrayWithType:(unsigned __int16)a3 ValueArray:(id)a4
{
  uint64_t v4;
  id v6;
  int v7;
  int v8;

  v4 = a3;
  v6 = a4;
  if (v4 <= 0x1F)
  {
    if (((1 << v4) & 0xF080C) != 0)
    {
      v7 = -[cbaseVariant setIntArrayType:ValueArray:](self, "setIntArrayType:ValueArray:", v4, v6);
LABEL_6:
      v8 = v7;
      goto LABEL_7;
    }
    if (((1 << v4) & 0x80000100) != 0)
    {
      v7 = -[cbaseVariant setStrArrayType:ValueArray:](self, "setStrArrayType:ValueArray:", v4, v6);
      goto LABEL_6;
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[cbaseVariant setArrayWithType:ValueArray:].cold.1();
  v8 = 22;
LABEL_7:

  return v8;
}

- (int)setStrArrayType:(unsigned __int16)a3 ValueArray:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  utf16leData *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  utf16leData *v15;
  void *v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  vtSafeArray *v34;
  void *v35;
  _BOOL8 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unsigned __int16 v45;
  cbaseVariant *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (!v7)
  {
    v26 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v26)
      -[cbaseVariant setStrArrayType:ValueArray:].cold.1(v26, v27, v28, v29, v30, v31, v32, v33);
    goto LABEL_22;
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v9)
  {
    v10 = v9;
    v45 = a3;
    v46 = self;
    v47 = v6;
    v11 = 0;
    v12 = 0;
    v13 = *(_QWORD *)v49;
    while (2)
    {
      v14 = 0;
      v15 = v11;
      v16 = v12;
      do
      {
        if (*(_QWORD *)v49 != v13)
          objc_enumerationMutation(v8);
        v12 = *(id *)(*((_QWORD *)&v48 + 1) + 8 * v14);

        v11 = -[utf16leData initWithStr:]([utf16leData alloc], "initWithStr:", v12);
        if (!v11)
        {
          v17 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v17)
            -[cbaseVariant setStrArrayType:ValueArray:].cold.3(v17, v18, v19, v20, v21, v22, v23, v24);

          v25 = 12;
          v6 = v47;
          goto LABEL_23;
        }
        objc_msgSend(v7, "addObject:", v11);
        ++v14;
        v15 = v11;
        v16 = v12;
      }
      while (v10 != v14);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      if (v10)
        continue;
      break;
    }

    self = v46;
    v6 = v47;
    a3 = v45;
  }
  else
  {
    v11 = 0;
  }

  v34 = -[vtSafeArray initWithArray:ElementSize:]([vtSafeArray alloc], "initWithArray:ElementSize:", v7, 4);
  -[cbaseVariant setArrObj:](self, "setArrObj:", v34);

  -[cbaseVariant arrObj](self, "arrObj");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v35)
  {
    v36 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v36)
      -[cbaseVariant setStrArrayType:ValueArray:].cold.2(v36, v37, v38, v39, v40, v41, v42, v43);

LABEL_22:
    v25 = 12;
    goto LABEL_23;
  }
  self->_vType = a3 | 0x2000;

  v25 = 0;
LABEL_23:

  return v25;
}

- (int)setIntArrayType:(unsigned int)a3 ValueArray:(id)a4
{
  void *v6;
  uint64_t v7;
  vtSafeArray *v8;
  void *v9;
  int v10;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = 1;
    switch(a3)
    {
      case 0xBu:
      case 0x12u:
        goto LABEL_7;
      case 0xCu:
      case 0xDu:
      case 0xEu:
      case 0xFu:
        goto LABEL_13;
      case 0x10u:
      case 0x11u:
        goto LABEL_9;
      case 0x13u:
        goto LABEL_8;
      default:
        if (a3 == 3)
        {
LABEL_8:
          v7 = 4;
        }
        else
        {
          if (a3 != 2)
          {
LABEL_13:
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[cbaseVariant setIntArrayType:ValueArray:].cold.2();
            break;
          }
LABEL_7:
          v7 = 2;
        }
LABEL_9:
        v8 = -[vtSafeArray initWithArray:ElementSize:]([vtSafeArray alloc], "initWithArray:ElementSize:", v6, v7);
        -[cbaseVariant setArrObj:](self, "setArrObj:", v8);

        -[cbaseVariant arrObj](self, "arrObj");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v10 = 0;
          self->_vType = a3 | 0x2000;
          goto LABEL_16;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[cbaseVariant setIntArrayType:ValueArray:].cold.3();
        break;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[cbaseVariant setIntArrayType:ValueArray:].cold.1();
  }
  v10 = 12;
LABEL_16:

  return v10;
}

- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  const char *v14;
  uint64_t v16;
  uint64_t v17;
  int v18;
  const char *v19;
  unint64_t v20;
  const char *v21;
  unsigned int v22;
  int v23;
  void *v24;
  void *v25;
  char v26;
  const char *v27;
  void *v28;
  __int16 v29;
  void *v30;
  int v31;
  int v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  __int16 v37;
  int v38;
  void *v39;
  unsigned int v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  int v46;

  v8 = a3;
  v46 = 0;
  v9 = objc_msgSend(v8, "length");
  v10 = v9;
  if (v9 <= a4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cbaseVariant encodeBuffer:BufferOffset:BytesWritten:].cold.12();
    goto LABEL_7;
  }
  v11 = v9 - a4;
  v12 = objc_retainAutorelease(v8);
  v13 = objc_msgSend(v12, "bytes");
  if (v11 <= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cbaseVariant encodeBuffer:BufferOffset:BytesWritten:].cold.1(self, (const char *)(v10 - a4));
LABEL_7:
    LODWORD(v14) = 12;
    goto LABEL_8;
  }
  v16 = v13;
  *(_WORD *)(v13 + a4) = self->_vType;
  *(_BYTE *)(v13 + a4 + 2) = self->_vData1;
  *(_BYTE *)(v13 + a4 + 3) = self->_vData2;
  v17 = a4 + 4;
  v18 = -[cbaseVariant vType](self, "vType");
  if (v18 <= 4097)
  {
    v20 = v11 - 4;
    switch(v18)
    {
      case 2:
      case 18:
        if (v20 > 1)
        {
          -[cbaseVariant vType](self, "vType");
          -[cbaseVariant scalarValue](self, "scalarValue");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "shortValue");

          *(_WORD *)(v16 + v17) = v29;
          goto LABEL_55;
        }
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_7;
        goto LABEL_45;
      case 3:
      case 19:
        if (v20 > 3)
        {
          -[cbaseVariant vType](self, "vType");
          -[cbaseVariant scalarValue](self, "scalarValue");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "intValue");

          *(_DWORD *)(v16 + v17) = v31;
          v22 = 8;
          goto LABEL_25;
        }
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_7;
        goto LABEL_45;
      case 4:
      case 5:
      case 6:
      case 7:
      case 9:
      case 10:
      case 12:
      case 13:
      case 14:
      case 15:
        goto LABEL_40;
      case 8:
        goto LABEL_37;
      case 11:
        if (v20 > 1)
        {
          -[cbaseVariant scalarValue](self, "scalarValue");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "BOOLValue");

          *(_WORD *)(v16 + v17) = (__int16)(v37 << 15) >> 15;
LABEL_55:
          v22 = 6;
          goto LABEL_25;
        }
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_7;
        goto LABEL_45;
      case 16:
      case 17:
        if (v11 != 4)
        {
          v23 = -[cbaseVariant vType](self, "vType");
          -[cbaseVariant scalarValue](self, "scalarValue");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (v23 == 16)
            v26 = objc_msgSend(v24, "charValue");
          else
            v26 = objc_msgSend(v24, "unsignedCharValue");
          *(_BYTE *)(v16 + v17) = v26;

          v22 = 5;
          goto LABEL_25;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[cbaseVariant encodeBuffer:BufferOffset:BytesWritten:].cold.3(self);
        goto LABEL_7;
      default:
        if (v18 == 31)
        {
LABEL_37:
          if (v20 > 3)
          {
            v32 = -[cbaseVariant vType](self, "vType");
            -[cbaseVariant strData](self, "strData");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v33;
            if (v32 == 8)
              v35 = objc_msgSend(v33, "byteCount");
            else
              v35 = objc_msgSend(v33, "charCount");
            v38 = v35;

            *(_DWORD *)(v16 + v17) = v38;
            -[cbaseVariant strData](self, "strData");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v39, "byteCount");

            if (v11 - 8 < v40)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[cbaseVariant encodeBuffer:BufferOffset:BytesWritten:].cold.9(self, (const char *)v40);
              goto LABEL_7;
            }
            v41 = (void *)(v16 + a4 + 8);
            -[cbaseVariant strData](self, "strData");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "datab");
            v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            memcpy(v41, (const void *)objc_msgSend(v43, "bytes"), v40);

            v22 = v40 + 8;
LABEL_25:
            LODWORD(v14) = 0;
            *a5 = v22;
            goto LABEL_8;
          }
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            goto LABEL_7;
        }
        else
        {
          if (v18 != 64)
            goto LABEL_40;
          if (v20 > 7)
          {
            -[cbaseVariant scalarValue](self, "scalarValue");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v44, "unsignedLongLongValue");

            *(_QWORD *)(v16 + v17) = v45;
            v22 = 12;
            goto LABEL_25;
          }
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            goto LABEL_7;
        }
LABEL_45:
        -[cbaseVariant encodeBuffer:BufferOffset:BytesWritten:].cold.4(self, (const char *)(v11 - 4));
        goto LABEL_7;
    }
  }
  if ((v18 - 4098) <= 0x1D && ((1 << (v18 - 2)) & 0x2003C243) != 0)
  {
    v21 = (const char *)-[cbaseVariant encodeVector:BufferOffset:BytesWritten:](self, "encodeVector:BufferOffset:BytesWritten:", v12, a4 + 4, &v46);
    if ((_DWORD)v21)
    {
      v14 = v21;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[cbaseVariant encodeBuffer:BufferOffset:BytesWritten:].cold.11(self, v14);
      goto LABEL_8;
    }
    goto LABEL_24;
  }
  if ((v18 - 8194) <= 0x1D && ((1 << (v18 - 2)) & 0x2003C243) != 0)
  {
    v19 = (const char *)-[cbaseVariant encodeArray:BufferOffset:BytesWritten:](self, "encodeArray:BufferOffset:BytesWritten:", v12, a4 + 4, &v46);
    if (!(_DWORD)v19)
    {
LABEL_24:
      v22 = v46 + 4;
      goto LABEL_25;
    }
    v14 = v19;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cbaseVariant encodeBuffer:BufferOffset:BytesWritten:].cold.10(self, v14);
  }
  else
  {
LABEL_40:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cbaseVariant encodeBuffer:BufferOffset:BytesWritten:].cold.2(self, v27);
    LODWORD(v14) = 22;
  }
LABEL_8:

  return (int)v14;
}

- (int)encodeArray:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  id v8;
  unint64_t v9;
  const char *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  const char *v23;
  const char *v24;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  const char *v30;
  const char *v31;
  int v32;

  v8 = a3;
  v32 = 0;
  v9 = objc_msgSend(v8, "length");
  if (v9 <= a4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cbaseVariant encodeArray:BufferOffset:BytesWritten:].cold.8();
    goto LABEL_19;
  }
  v10 = (const char *)(v9 - a4);
  v11 = objc_retainAutorelease(v8);
  v12 = objc_msgSend(v11, "bytes");
  if ((unint64_t)v10 <= 1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cbaseVariant encodeArray:BufferOffset:BytesWritten:].cold.1(self, v10);
LABEL_19:
    LODWORD(v24) = 12;
    goto LABEL_20;
  }
  v13 = v12;
  -[cbaseVariant arrObj](self, "arrObj");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "cDims");

  *(_WORD *)(v13 + a4) = v15;
  if ((unint64_t)(v10 - 2) <= 1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cbaseVariant encodeArray:BufferOffset:BytesWritten:].cold.2(self, v10 - 2);
    goto LABEL_19;
  }
  -[cbaseVariant arrObj](self, "arrObj");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "fFeatures");

  *(_WORD *)(v13 + a4 + 2) = v17;
  if ((unint64_t)(v10 - 4) <= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cbaseVariant encodeArray:BufferOffset:BytesWritten:].cold.3(self, v10 - 4);
    goto LABEL_19;
  }
  -[cbaseVariant arrObj](self, "arrObj");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "cbElementSize");

  *(_DWORD *)(v13 + a4 + 4) = v19;
  if ((unint64_t)(v10 - 8) <= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cbaseVariant encodeArray:BufferOffset:BytesWritten:].cold.4(self, v10 - 8);
    goto LABEL_19;
  }
  -[cbaseVariant arrObj](self, "arrObj");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "rgsBoundArr");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "cElements");

  *(_DWORD *)(v13 + a4 + 8) = v22;
  v23 = v10 - 12;
  if ((unint64_t)v23 <= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cbaseVariant encodeArray:BufferOffset:BytesWritten:].cold.5(self, v23);
    goto LABEL_19;
  }
  -[cbaseVariant arrObj](self, "arrObj");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "rgsBoundArr");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "lowBound");

  *(_DWORD *)(v13 + a4 + 12) = v28;
  v29 = a4 + 16;
  if (-[cbaseVariant vType](self, "vType") == 8200 || -[cbaseVariant vType](self, "vType") == 8223)
  {
    v30 = (const char *)-[cbaseVariant encodeStrArray:BufferOffset:BytesWritten:](self, "encodeStrArray:BufferOffset:BytesWritten:", v11, v29, &v32);
    if ((_DWORD)v30)
    {
      v24 = v30;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[cbaseVariant encodeArray:BufferOffset:BytesWritten:].cold.6(self, v24);
      goto LABEL_20;
    }
LABEL_29:
    LODWORD(v24) = 0;
    *a5 = v32 + 16;
    goto LABEL_20;
  }
  v31 = (const char *)-[cbaseVariant encodeIntArray:BufferOffset:BytesWritten:](self, "encodeIntArray:BufferOffset:BytesWritten:", v11, v29, &v32);
  if (!(_DWORD)v31)
    goto LABEL_29;
  v24 = v31;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[cbaseVariant encodeArray:BufferOffset:BytesWritten:].cold.7(self, v24);
LABEL_20:

  return (int)v24;
}

- (int)encodeStrArray:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  id v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  unint64_t v21;
  size_t v22;
  int v23;
  uint64_t v24;
  id v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int *v34;
  id v35;
  id obj;
  uint64_t v37;
  cbaseVariant *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = objc_msgSend(v8, "length");
  if (v9 <= a4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cbaseVariant encodeStrArray:BufferOffset:BytesWritten:].cold.3();
    v26 = 12;
    goto LABEL_25;
  }
  v10 = objc_msgSend(objc_retainAutorelease(v8), "bytes");
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[cbaseVariant arrObj](self, "arrObj");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "vData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v12;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (!v13)
  {
    v15 = 0;
    goto LABEL_19;
  }
  v14 = v13;
  v34 = a5;
  v35 = v8;
  v15 = 0;
  v16 = 0;
  v17 = v9 - a4;
  v37 = *(_QWORD *)v40;
  v38 = self;
  while (2)
  {
    v18 = 0;
    v19 = v16;
    do
    {
      if (*(_QWORD *)v40 != v37)
        objc_enumerationMutation(obj);
      v16 = *(id *)(*((_QWORD *)&v39 + 1) + 8 * v18);

      if ((-[cbaseVariant vType](v38, "vType") & 8) != 0)
        v20 = objc_msgSend(v16, "byteCount");
      else
        v20 = objc_msgSend(v16, "charCount");
      if (v17 <= 3)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[cbaseVariant encodeStrArray:BufferOffset:BytesWritten:].cold.1(v17);
        goto LABEL_24;
      }
      *(_DWORD *)(v10 + a4) = v20;
      v21 = v17 - 4;
      v22 = objc_msgSend(v16, "byteCount");
      if (v21 < v22)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[cbaseVariant encodeStrArray:BufferOffset:BytesWritten:].cold.2(v22, v21, v27, v28, v29, v30, v31, v32);
LABEL_24:

        v26 = 12;
        v8 = v35;
        goto LABEL_25;
      }
      v23 = v15 + v22;
      v24 = a4 + 4;
      objc_msgSend(v16, "datab");
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      memcpy((void *)(v10 + v24), (const void *)objc_msgSend(v25, "bytes"), v22);

      v15 = v23 + 4;
      a4 = v22 + v24;
      v17 = v21 - v22;
      ++v18;
      v19 = v16;
    }
    while (v14 != v18);
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v14)
      continue;
    break;
  }

  a5 = v34;
  v8 = v35;
LABEL_19:

  v26 = 0;
  *a5 = v15;
LABEL_25:

  return v26;
}

- (int)encodeIntArray:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  id v8;
  unint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  id v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  char v23;
  unsigned int v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  __int16 v41;
  const char *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  int v51;
  unsigned int *v52;
  id v53;
  id obj;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = objc_msgSend(v8, "length");
  if (v9 <= a4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cbaseVariant encodeIntArray:BufferOffset:BytesWritten:].cold.6();
    v25 = 12;
  }
  else
  {
    v10 = (const char *)(v9 - a4);
    v11 = objc_msgSend(objc_retainAutorelease(v8), "bytes");
    -[cbaseVariant arrObj](self, "arrObj");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cbElementSize");

    v13 = -[cbaseVariant vType](self, "vType");
    switch(v13)
    {
      case 8203:
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        -[cbaseVariant arrObj](self, "arrObj");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "vData");
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        obj = v44;
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
        if (!v45)
          goto LABEL_62;
        v46 = v45;
        v52 = a5;
        v53 = v8;
        v24 = 0;
        v19 = 0;
        v47 = *(_QWORD *)v56;
        while (1)
        {
          v48 = 0;
          v49 = v19;
          do
          {
            if (*(_QWORD *)v56 != v47)
              objc_enumerationMutation(obj);
            v19 = *(id *)(*((_QWORD *)&v55 + 1) + 8 * v48);

            if ((unint64_t)v10 <= 1)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[cbaseVariant encodeIntArray:BufferOffset:BytesWritten:].cold.3(self, v10);
              goto LABEL_66;
            }
            *(_WORD *)(v11 + a4) = (__int16)((unsigned __int16)objc_msgSend(v19, "BOOLValue") << 15) >> 15;
            v24 += 2;
            a4 += 2;
            v10 -= 2;
            ++v48;
            v49 = v19;
          }
          while (v46 != v48);
          v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
          if (!v46)
            goto LABEL_61;
        }
      case 8204:
      case 8205:
      case 8206:
      case 8207:
        goto LABEL_46;
      case 8208:
      case 8209:
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        -[cbaseVariant arrObj](self, "arrObj");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "vData");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        obj = v15;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
        if (!v16)
          goto LABEL_62;
        v17 = v16;
        v52 = a5;
        v53 = v8;
        v18 = 0;
        v19 = 0;
        v20 = *(_QWORD *)v68;
        while (2)
        {
          v21 = 0;
          v51 = v18;
          v22 = v19;
          do
          {
            if (*(_QWORD *)v68 != v20)
              objc_enumerationMutation(obj);
            v19 = *(id *)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)v21);

            if (v10 == v21)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[cbaseVariant encodeIntArray:BufferOffset:BytesWritten:].cold.2(self);
              goto LABEL_66;
            }
            if ((-[cbaseVariant vType](self, "vType") & 0x10) != 0)
              v23 = objc_msgSend(v19, "charValue");
            else
              v23 = objc_msgSend(v19, "unsignedCharValue");
            *(_BYTE *)(v11 + a4 + v21++) = v23;
            v22 = v19;
          }
          while ((const char *)v17 != v21);
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
          v18 = v51 + (_DWORD)v21;
          v10 -= (uint64_t)v21;
          a4 += v21;
          if (v17)
            continue;
          break;
        }
        v24 = v51 + (_DWORD)v21;
LABEL_61:
        a5 = v52;
        v8 = v53;

LABEL_63:
        v25 = 0;
        *a5 = v24;
        break;
      case 8210:
        goto LABEL_32;
      case 8211:
        goto LABEL_20;
      default:
        if (v13 == 8194)
        {
LABEL_32:
          v65 = 0u;
          v66 = 0u;
          v63 = 0u;
          v64 = 0u;
          -[cbaseVariant arrObj](self, "arrObj");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "vData");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          obj = v35;
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
          if (v36)
          {
            v37 = v36;
            v52 = a5;
            v53 = v8;
            v24 = 0;
            v19 = 0;
            v38 = *(_QWORD *)v64;
LABEL_34:
            v39 = 0;
            v40 = v19;
            while (1)
            {
              if (*(_QWORD *)v64 != v38)
                objc_enumerationMutation(obj);
              v19 = *(id *)(*((_QWORD *)&v63 + 1) + 8 * v39);

              if ((unint64_t)v10 <= 1)
                break;
              if ((-[cbaseVariant vType](self, "vType") & 2) != 0)
                v41 = objc_msgSend(v19, "shortValue");
              else
                v41 = objc_msgSend(v19, "unsignedShortValue");
              *(_WORD *)(v11 + a4) = v41;
              v24 += 2;
              a4 += 2;
              v10 -= 2;
              ++v39;
              v40 = v19;
              if (v37 == v39)
              {
                v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
                if (!v37)
                  goto LABEL_61;
                goto LABEL_34;
              }
            }
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[cbaseVariant encodeIntArray:BufferOffset:BytesWritten:].cold.3(self, v10);
            goto LABEL_66;
          }
LABEL_62:
          v24 = 0;
          goto LABEL_63;
        }
        if (v13 == 8195)
        {
LABEL_20:
          v61 = 0u;
          v62 = 0u;
          v59 = 0u;
          v60 = 0u;
          -[cbaseVariant arrObj](self, "arrObj");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "vData");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          obj = v27;
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
          if (v28)
          {
            v29 = v28;
            v52 = a5;
            v53 = v8;
            v24 = 0;
            v19 = 0;
            v30 = *(_QWORD *)v60;
LABEL_22:
            v31 = 0;
            v32 = v19;
            while (1)
            {
              if (*(_QWORD *)v60 != v30)
                objc_enumerationMutation(obj);
              v19 = *(id *)(*((_QWORD *)&v59 + 1) + 8 * v31);

              if ((unint64_t)v10 <= 3)
                break;
              if ((-[cbaseVariant vType](self, "vType") & 3) != 0)
                v33 = objc_msgSend(v19, "intValue");
              else
                v33 = objc_msgSend(v19, "unsignedIntValue");
              *(_DWORD *)(v11 + a4) = v33;
              v24 += 4;
              a4 += 4;
              v10 -= 4;
              ++v31;
              v32 = v19;
              if (v29 == v31)
              {
                v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
                if (!v29)
                  goto LABEL_61;
                goto LABEL_22;
              }
            }
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[cbaseVariant encodeIntArray:BufferOffset:BytesWritten:].cold.3(self, v10);
LABEL_66:

            v25 = 12;
            v8 = v53;
            break;
          }
          goto LABEL_62;
        }
LABEL_46:
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[cbaseVariant encodeIntArray:BufferOffset:BytesWritten:].cold.1(self, v42);
        v25 = 22;
        break;
    }
  }

  return v25;
}

- (int)encodeVector:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  id v8;
  unint64_t v9;
  const char *v10;
  id v11;
  uint64_t v12;
  const char *v13;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  int v21;

  v8 = a3;
  v21 = 0;
  v9 = objc_msgSend(v8, "length");
  if (v9 <= a4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cbaseVariant encodeVector:BufferOffset:BytesWritten:].cold.4();
    goto LABEL_7;
  }
  v10 = (const char *)(v9 - a4);
  v11 = objc_retainAutorelease(v8);
  v12 = objc_msgSend(v11, "bytes");
  if ((unint64_t)v10 > 3)
  {
    v15 = v12;
    -[cbaseVariant vectObj](self, "vectObj");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "vVectorElements");

    *(_DWORD *)(v15 + a4) = v17;
    v18 = a4 + 4;
    if (-[cbaseVariant vType](self, "vType") == 4127 || -[cbaseVariant vType](self, "vType") == 4104)
    {
      v19 = (const char *)-[cbaseVariant encodeStrVector:BufferOffset:BytesWritten:](self, "encodeStrVector:BufferOffset:BytesWritten:", v11, v18, &v21);
      if ((_DWORD)v19)
      {
        v13 = v19;
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_8;
LABEL_13:
        -[cbaseVariant encodeVector:BufferOffset:BytesWritten:].cold.2(self, v13);
        goto LABEL_8;
      }
    }
    else
    {
      v20 = (const char *)-[cbaseVariant encodeIntVector:BufferOffset:BytesWritten:](self, "encodeIntVector:BufferOffset:BytesWritten:", v11, v18, &v21);
      if ((_DWORD)v20)
      {
        v13 = v20;
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_8;
        goto LABEL_13;
      }
    }
    LODWORD(v13) = 0;
    *a5 = v21 + 4;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[cbaseVariant encodeVector:BufferOffset:BytesWritten:].cold.1(self, v10);
LABEL_7:
  LODWORD(v13) = 12;
LABEL_8:

  return (int)v13;
}

- (int)encodeStrVector:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  id v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  int v18;
  const char *v19;
  size_t v20;
  int v21;
  uint64_t v22;
  id v23;
  int v24;
  unsigned int *v26;
  id v27;
  id obj;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = objc_msgSend(v8, "length");
  if (v9 <= a4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cbaseVariant encodeStrVector:BufferOffset:BytesWritten:].cold.3();
    v24 = 12;
    goto LABEL_25;
  }
  v10 = objc_msgSend(objc_retainAutorelease(v8), "bytes");
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[cbaseVariant vectObj](self, "vectObj");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "vVectorData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v12;
  v30 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (!v30)
  {
    v13 = 0;
    goto LABEL_19;
  }
  v26 = a5;
  v27 = v8;
  v13 = 0;
  v14 = 0;
  v15 = (const char *)(v9 - a4);
  v29 = *(_QWORD *)v32;
  while (2)
  {
    v16 = 0;
    v17 = v14;
    do
    {
      if (*(_QWORD *)v32 != v29)
        objc_enumerationMutation(obj);
      v14 = *(id *)(*((_QWORD *)&v31 + 1) + 8 * v16);

      if (-[cbaseVariant vType](self, "vType") == 4104)
        v18 = objc_msgSend(v14, "byteCount");
      else
        v18 = objc_msgSend(v14, "charCount");
      if ((unint64_t)v15 <= 3)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[cbaseVariant encodeStrVector:BufferOffset:BytesWritten:].cold.1(self, v15);
        goto LABEL_24;
      }
      *(_DWORD *)(v10 + a4) = v18;
      v19 = v15 - 4;
      v20 = objc_msgSend(v14, "byteCount");
      if ((unint64_t)v19 < v20)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[cbaseVariant encodeStrVector:BufferOffset:BytesWritten:].cold.2(self, (const char *)v20);
LABEL_24:

        v24 = 12;
        v8 = v27;
        goto LABEL_25;
      }
      v21 = v13 + v20;
      v22 = a4 + 4;
      objc_msgSend(v14, "datab");
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      memcpy((void *)(v10 + v22), (const void *)objc_msgSend(v23, "bytes"), v20);

      v13 = v21 + 4;
      a4 = v20 + v22;
      v15 = &v19[-v20];
      ++v16;
      v17 = v14;
    }
    while (v30 != v16);
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v30)
      continue;
    break;
  }

  a5 = v26;
  v8 = v27;
LABEL_19:

  v24 = 0;
  *a5 = v13;
LABEL_25:

  return v24;
}

- (int)encodeIntVector:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  id v8;
  unint64_t v9;
  const char *v10;
  uint64_t v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  id v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  char v22;
  unsigned int v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  __int16 v40;
  const char *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  int v50;
  unsigned int *v51;
  id v52;
  id obj;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = objc_msgSend(v8, "length");
  if (v9 <= a4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cbaseVariant encodeIntVector:BufferOffset:BytesWritten:].cold.6();
    v24 = 12;
  }
  else
  {
    v10 = (const char *)(v9 - a4);
    v11 = objc_msgSend(objc_retainAutorelease(v8), "bytes");
    v12 = -[cbaseVariant vType](self, "vType");
    switch(v12)
    {
      case 4107:
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        -[cbaseVariant vectObj](self, "vectObj");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "vVectorData");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        obj = v43;
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
        if (!v44)
          goto LABEL_62;
        v45 = v44;
        v51 = a5;
        v52 = v8;
        v23 = 0;
        v18 = 0;
        v46 = *(_QWORD *)v55;
        while (1)
        {
          v47 = 0;
          v48 = v18;
          do
          {
            if (*(_QWORD *)v55 != v46)
              objc_enumerationMutation(obj);
            v18 = *(id *)(*((_QWORD *)&v54 + 1) + 8 * v47);

            if ((unint64_t)v10 <= 1)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[cbaseVariant encodeIntVector:BufferOffset:BytesWritten:].cold.3(self, v10);
              goto LABEL_66;
            }
            *(_WORD *)(v11 + a4) = (__int16)((unsigned __int16)objc_msgSend(v18, "BOOLValue") << 15) >> 15;
            v23 += 2;
            a4 += 2;
            v10 -= 2;
            ++v47;
            v48 = v18;
          }
          while (v45 != v47);
          v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
          if (!v45)
            goto LABEL_61;
        }
      case 4108:
      case 4109:
      case 4110:
      case 4111:
        goto LABEL_46;
      case 4112:
      case 4113:
        v68 = 0u;
        v69 = 0u;
        v66 = 0u;
        v67 = 0u;
        -[cbaseVariant vectObj](self, "vectObj");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "vVectorData");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        obj = v14;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
        if (!v15)
          goto LABEL_62;
        v16 = v15;
        v51 = a5;
        v52 = v8;
        v17 = 0;
        v18 = 0;
        v19 = *(_QWORD *)v67;
        while (2)
        {
          v20 = 0;
          v50 = v17;
          v21 = v18;
          do
          {
            if (*(_QWORD *)v67 != v19)
              objc_enumerationMutation(obj);
            v18 = *(id *)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)v20);

            if (v10 == v20)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[cbaseVariant encodeIntVector:BufferOffset:BytesWritten:].cold.2(self);
              goto LABEL_66;
            }
            if ((-[cbaseVariant vType](self, "vType") & 0x10) != 0)
              v22 = objc_msgSend(v18, "charValue");
            else
              v22 = objc_msgSend(v18, "unsignedCharValue");
            *(_BYTE *)(v11 + a4 + v20++) = v22;
            v21 = v18;
          }
          while ((const char *)v16 != v20);
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
          v17 = v50 + (_DWORD)v20;
          v10 -= (uint64_t)v20;
          a4 += v20;
          if (v16)
            continue;
          break;
        }
        v23 = v50 + (_DWORD)v20;
LABEL_61:
        a5 = v51;
        v8 = v52;

LABEL_63:
        v24 = 0;
        *a5 = v23;
        break;
      case 4114:
        goto LABEL_32;
      case 4115:
        goto LABEL_20;
      default:
        if (v12 == 4098)
        {
LABEL_32:
          v64 = 0u;
          v65 = 0u;
          v62 = 0u;
          v63 = 0u;
          -[cbaseVariant vectObj](self, "vectObj");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "vVectorData");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          obj = v34;
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
          if (v35)
          {
            v36 = v35;
            v51 = a5;
            v52 = v8;
            v23 = 0;
            v18 = 0;
            v37 = *(_QWORD *)v63;
LABEL_34:
            v38 = 0;
            v39 = v18;
            while (1)
            {
              if (*(_QWORD *)v63 != v37)
                objc_enumerationMutation(obj);
              v18 = *(id *)(*((_QWORD *)&v62 + 1) + 8 * v38);

              if ((unint64_t)v10 <= 1)
                break;
              if ((-[cbaseVariant vType](self, "vType") & 2) != 0)
                v40 = objc_msgSend(v18, "shortValue");
              else
                v40 = objc_msgSend(v18, "unsignedShortValue");
              *(_WORD *)(v11 + a4) = v40;
              v23 += 2;
              a4 += 2;
              v10 -= 2;
              ++v38;
              v39 = v18;
              if (v36 == v38)
              {
                v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
                if (!v36)
                  goto LABEL_61;
                goto LABEL_34;
              }
            }
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[cbaseVariant encodeIntVector:BufferOffset:BytesWritten:].cold.3(self, v10);
            goto LABEL_66;
          }
LABEL_62:
          v23 = 0;
          goto LABEL_63;
        }
        if (v12 == 4099)
        {
LABEL_20:
          v60 = 0u;
          v61 = 0u;
          v58 = 0u;
          v59 = 0u;
          -[cbaseVariant vectObj](self, "vectObj");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "vVectorData");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          obj = v26;
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
          if (v27)
          {
            v28 = v27;
            v51 = a5;
            v52 = v8;
            v23 = 0;
            v18 = 0;
            v29 = *(_QWORD *)v59;
LABEL_22:
            v30 = 0;
            v31 = v18;
            while (1)
            {
              if (*(_QWORD *)v59 != v29)
                objc_enumerationMutation(obj);
              v18 = *(id *)(*((_QWORD *)&v58 + 1) + 8 * v30);

              if ((unint64_t)v10 <= 3)
                break;
              if ((-[cbaseVariant vType](self, "vType") & 3) != 0)
                v32 = objc_msgSend(v18, "intValue");
              else
                v32 = objc_msgSend(v18, "unsignedIntValue");
              *(_DWORD *)(v11 + a4) = v32;
              v23 += 4;
              a4 += 4;
              v10 -= 4;
              ++v30;
              v31 = v18;
              if (v28 == v30)
              {
                v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
                if (!v28)
                  goto LABEL_61;
                goto LABEL_22;
              }
            }
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[cbaseVariant encodeIntVector:BufferOffset:BytesWritten:].cold.3(self, v10);
LABEL_66:

            v24 = 12;
            v8 = v52;
            break;
          }
          goto LABEL_62;
        }
LABEL_46:
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[cbaseVariant encodeIntVector:BufferOffset:BytesWritten:].cold.1(self, v41);
        v24 = 22;
        break;
    }
  }

  return v24;
}

- (unsigned)vType
{
  return self->_vType;
}

- (unsigned)vData1
{
  return self->_vData1;
}

- (unsigned)vData2
{
  return self->_vData2;
}

- (NSNumber)scalarValue
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (utf16leData)strData
{
  return (utf16leData *)objc_getProperty(self, a2, 24, 1);
}

- (vtVector)vectObj
{
  return (vtVector *)objc_getProperty(self, a2, 32, 1);
}

- (void)setVectObj:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (vtSafeArray)arrObj
{
  return (vtSafeArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setArrObj:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrObj, 0);
  objc_storeStrong((id *)&self->_vectObj, 0);
  objc_storeStrong((id *)&self->_strData, 0);
  objc_storeStrong((id *)&self->_scalarValue, 0);
}

- (void)setScalarType:ScalarValue:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "cbaseVariant:setScalarType: vt_type: 0x%x not a supported scalar type\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)setStringType:UTF8Str:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "cbaseVariant:setStringType: vt_type: 0x%x not a string type\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)setStringType:UTF8Str:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "cbaseVariant:setStringType: vt_type: 0x%x, failed to aloc utf16leData\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)setVectorWithType:ValueArray:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "cbaseVariant:setVectorWithType: vt_type: 0x%x not a valid vector type\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)setStrVectorType:(uint64_t)a3 ValueArray:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "cbaseVariant:setStrVectorType: vt_type: 0x%x, no memory for vtVector\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)setStrVectorType:(uint64_t)a3 ValueArray:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "cbaseVariant:setStrVectorType: no memory for utf16leData\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)setIntVectorType:(uint64_t)a3 ValueArray:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "cbaseVariant:setIntVectorType: no memory for vtVector\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)setArrayWithType:ValueArray:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "cbaseVariant:setArrayWithType: vt_type: 0x%x not a valid array type\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)setStrArrayType:(uint64_t)a3 ValueArray:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "cbaseVariant:setStrArrayType: no memory for strArr\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)setStrArrayType:(uint64_t)a3 ValueArray:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "cbaseVariant:setStrArrayType: no memory for safearray object\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)setStrArrayType:(uint64_t)a3 ValueArray:(uint64_t)a4 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "cbaseVariant:setStrArrayType: no memory for utf16leData\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)setIntArrayType:ValueArray:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "cbaseVariant:setIntArrayType: vt_type: 0x%x, no memory for temporary array object\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)setIntArrayType:ValueArray:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "cbaseVariant:setIntArrayType: vt_type: 0x%x not a legal array type\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)setIntArrayType:ValueArray:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "cbaseVariant:setIntArrayType: vt_type: 0x%x, no memory for safearray object\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)encodeBuffer:(void *)a1 BufferOffset:(const char *)a2 BytesWritten:.cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_0(a1, a2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cbaseVariant:encodeBuffer: vType: 0x%x, no buffer space for vType, sizeAvail: %llu\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)encodeBuffer:(void *)a1 BufferOffset:(const char *)a2 BytesWritten:.cold.2(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_17(a1, a2);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cbaseVariant:encodeBuffer: vType: 0x%x is not supported\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2();
}

- (void)encodeBuffer:(void *)a1 BufferOffset:BytesWritten:.cold.3(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v1, "cbaseVariant:encodeBuffer: vType: 0x%x, no buffer space for value, sizeAvail: %llu\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)encodeBuffer:(void *)a1 BufferOffset:(const char *)a2 BytesWritten:.cold.4(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_0(a1, a2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cbaseVariant:encodeBuffer: vType: 0x%x, no buffer space for value, sizeAvail: %llu\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)encodeBuffer:(void *)a1 BufferOffset:(const char *)a2 BytesWritten:.cold.9(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_0(a1, a2);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6_0(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cbaseVariant:encodeBuffer: vType: 0x%x, no buffer space for str len: %u, sizeAvail: %llu\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)encodeBuffer:(void *)a1 BufferOffset:(const char *)a2 BytesWritten:.cold.10(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_0(a1, a2);
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_9_0(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cbaseVariant:encodeBuffer: vType: 0x%x encodeStrArray error: %d\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)encodeBuffer:(void *)a1 BufferOffset:(const char *)a2 BytesWritten:.cold.11(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_0(a1, a2);
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_9_0(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cbaseVariant:encodeBuffer: vType: 0x%x encodeVector error: %d\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.12()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4_0(v0, v1);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6_0(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cbaseVariant:encodeBuffer: vType: 0x%x, no buffer space, bLen: %llu, bOffset: %u\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)encodeArray:(void *)a1 BufferOffset:(const char *)a2 BytesWritten:.cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_0(a1, a2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cbaseVariant:encodeArray: vType: 0x%x, no buffer space for cDims, sizeAvail: %llu\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)encodeArray:(void *)a1 BufferOffset:(const char *)a2 BytesWritten:.cold.2(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_0(a1, a2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cbaseVariant:encodeArray: vType: 0x%x, no buffer space for fFeatures, sizeAvail: %llu\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)encodeArray:(void *)a1 BufferOffset:(const char *)a2 BytesWritten:.cold.3(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_0(a1, a2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cbaseVariant:encodeArray: vType: 0x%x, no buffer space for cbElements, sizeAvail: %llu\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)encodeArray:(void *)a1 BufferOffset:(const char *)a2 BytesWritten:.cold.4(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_0(a1, a2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cbaseVariant:encodeArray: vType: 0x%x, no buffer space for rgsabound cElements, sizeAvail: %llu\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)encodeArray:(void *)a1 BufferOffset:(const char *)a2 BytesWritten:.cold.5(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_0(a1, a2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cbaseVariant:encodeArray: vType: 0x%x, no buffer space for rgsabound ILBound, sizeAvail: %llu\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)encodeArray:(void *)a1 BufferOffset:(const char *)a2 BytesWritten:.cold.6(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_0(a1, a2);
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_9_0(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cbaseVariant:encodeArray: vType: 0x%x, encodeStrArray error: %d\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)encodeArray:(void *)a1 BufferOffset:(const char *)a2 BytesWritten:.cold.7(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_0(a1, a2);
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_9_0(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cbaseVariant:encodeArray: vType: 0x%x, encodeIntArray error: %d\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)encodeArray:BufferOffset:BytesWritten:.cold.8()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4_0(v0, v1);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6_0(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cbaseVariant:encodeArray: vType: 0x%x, no buffer space, bLen: %llu, bOffset: %u\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)encodeStrArray:(uint64_t)a1 BufferOffset:BytesWritten:.cold.1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 134217984;
  v2 = a1;
  _os_log_error_impl(&dword_227C1F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "cbaseVariant:encodeStrArray: no buffer space for str count, sizeAvail: %llu\n", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_6();
}

- (void)encodeStrArray:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], a3, "cbaseVariant:encodeStrArray: no buffer space for stringlen: %u, sizeAvail: %llu\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)encodeStrArray:BufferOffset:BytesWritten:.cold.3()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4_0(v0, v1);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6_0(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cbaseVariant:encodeStrArray: vType: 0x%x, no buffer space, bLen: %llu, bOffset: %u\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)encodeIntArray:(void *)a1 BufferOffset:(const char *)a2 BytesWritten:.cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_17(a1, a2);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cbaseVariant:encodeIntArray: vType: 0x%x not supported\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2();
}

- (void)encodeIntArray:(void *)a1 BufferOffset:BytesWritten:.cold.2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v1, "cbaseVariant:encodeIntArray: no buffer space for vtype: 0x%x, sizeAvail: %llu\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)encodeIntArray:(void *)a1 BufferOffset:(const char *)a2 BytesWritten:.cold.3(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_0(a1, a2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cbaseVariant:encodeIntArray: no buffer space for vtype: 0x%x, sizeAvail: %llu\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)encodeIntArray:BufferOffset:BytesWritten:.cold.6()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4_0(v0, v1);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6_0(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cbaseVariant:encodeIntArray: vType: 0x%x, no buffer space, bLen: %llu, bOffset: %u\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)encodeVector:(void *)a1 BufferOffset:(const char *)a2 BytesWritten:.cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_0(a1, a2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cbaseVariant:encodeVector: vType: 0x%x, no buffer space for vVectorElements, sizeAvail: %llu\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)encodeVector:(void *)a1 BufferOffset:(const char *)a2 BytesWritten:.cold.2(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_0(a1, a2);
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_9_0(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cbaseVariant:encodeVector: vType: 0x%x, encodeStrVector error: %d\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)encodeVector:BufferOffset:BytesWritten:.cold.4()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4_0(v0, v1);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6_0(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cbaseVariant:encodeVector: vType: 0x%x, no buffer space, bLen: %llu, bOffset: %u\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)encodeStrVector:(void *)a1 BufferOffset:(const char *)a2 BytesWritten:.cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_0(a1, a2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cbaseVariant:encodeStrVector: vType: 0x%x,  no buffer space for str count, sizeAvail: %llu\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)encodeStrVector:(void *)a1 BufferOffset:(const char *)a2 BytesWritten:.cold.2(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_0(a1, a2);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6_0(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cbaseVariant:encodeStrVector: vType: 0x%x,  no buffer space for str len: %u, sizeAvail: %llu\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)encodeStrVector:BufferOffset:BytesWritten:.cold.3()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4_0(v0, v1);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6_0(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cbaseVariant:encodeStrVector: vType: 0x%x, no buffer space, bLen: %llu, bOffset: %u\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)encodeIntVector:(void *)a1 BufferOffset:(const char *)a2 BytesWritten:.cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_17(a1, a2);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cbaseVariant:encodeIntVector: vtype: 0x%x does not contain a scalar\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2();
}

- (void)encodeIntVector:(void *)a1 BufferOffset:BytesWritten:.cold.2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v1, "cbaseVariant:encodeIntVector: no buffer space for vtype: 0x%x, sizeAvail: %llu\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)encodeIntVector:(void *)a1 BufferOffset:(const char *)a2 BytesWritten:.cold.3(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_0(a1, a2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cbaseVariant:encodeIntVector: no buffer space for vtype: 0x%x, sizeAvail: %llu\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)encodeIntVector:BufferOffset:BytesWritten:.cold.6()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4_0(v0, v1);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6_0(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cbaseVariant:encodeIntVector: vtype: 0x%x, no buffer space, bLen: %llu, bOffset: %u\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

@end
