@implementation cNodeRestriction

- (cNodeRestriction)initWithType:(unsigned int)a3 Weight:(unsigned int)a4
{
  cNodeRestriction *v6;
  cNodeRestriction *v7;
  NSMutableArray *v8;
  NSMutableArray *restrictArray;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)cNodeRestriction;
  v6 = -[cNodeRestriction init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->restrictId = 0;
    v6->ulType = a3;
    v6->weight = a4;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    restrictArray = v7->_restrictArray;
    v7->_restrictArray = v8;

    if (!v7->_restrictArray)
    {

      return 0;
    }
  }
  return v7;
}

- (int)restrictionNumber
{
  return 0;
}

- (unsigned)nodeCount
{
  void *v2;
  unsigned int v3;

  -[cNodeRestriction restrictArray](self, "restrictArray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (int)appendRestriction:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[cNodeRestriction restrictArray](self, "restrictArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  return 0;
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
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  void *v25;
  unsigned int v26;
  unsigned int *v27;
  id obj;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  unsigned int v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v34 = 0;
  v9 = objc_msgSend(v8, "length");
  if (v9 <= a4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cNodeRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.6();
    goto LABEL_7;
  }
  v10 = v9 - a4;
  v11 = objc_retainAutorelease(v8);
  v12 = objc_msgSend(v11, "bytes");
  if (v10 <= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cNodeRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.1();
LABEL_7:
    v13 = 12;
    goto LABEL_8;
  }
  v15 = v12;
  *(_DWORD *)(v12 + a4) = -[cNodeRestriction ulType](self, "ulType");
  if (v10 - 4 <= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cNodeRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.2();
    goto LABEL_7;
  }
  *(_DWORD *)(v15 + a4 + 4) = self->weight;
  if (v10 - 8 <= 3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cNodeRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.3();
    goto LABEL_7;
  }
  v27 = a5;
  -[cNodeRestriction restrictArray](self, "restrictArray");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  *(_DWORD *)(v15 + a4 + 8) = v17;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[cNodeRestriction restrictArray](self, "restrictArray");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (!v18)
  {
    v23 = 12;
    goto LABEL_31;
  }
  v19 = v18;
  v20 = 0;
  v21 = v10 - 12;
  v22 = a4 + 12;
  v29 = *(_QWORD *)v31;
  LOBYTE(v13) = 1;
  v23 = 12;
  while (2)
  {
    v24 = 0;
    v25 = v20;
    do
    {
      if (*(_QWORD *)v31 != v29)
        objc_enumerationMutation(obj);
      v20 = *(id *)(*((_QWORD *)&v30 + 1) + 8 * v24);

      if ((v13 & 1) == 0)
      {
        v26 = align4Pad(v22);
        if (v26)
        {
          if (v21 < v26)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[cNodeRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.5();
            v13 = 12;
            goto LABEL_35;
          }
          v23 += v26;
          v22 = v26 + v22;
          v21 -= v26;
        }
      }
      v13 = objc_msgSend(v20, "encodeBuffer:BufferOffset:BytesWritten:", v11, v22, &v34);
      if (v13)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[cNodeRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.4();
LABEL_35:

        goto LABEL_8;
      }
      v23 += v34;
      v22 = v34 + v22;
      v21 -= v34;
      ++v24;
      v25 = v20;
    }
    while (v19 != v24);
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    LOBYTE(v13) = 0;
    if (v19)
      continue;
    break;
  }

LABEL_31:
  v13 = 0;
  *v27 = v23;
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

- (NSMutableArray)restrictArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRestrictArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictArray, 0);
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
  OUTLINED_FUNCTION_10_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "cNodeRestriction:encodeBuffer: no buffer space for ulType, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
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
  OUTLINED_FUNCTION_10_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "cNodeRestriction:encodeBuffer: no buffer space for weight, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
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
  OUTLINED_FUNCTION_10_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "cNodeRestriction:encodeBuffer: no buffer space for count, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
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

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "cNodeRestriction:encodeBuffer: encode cRestriction obj error: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
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
  OUTLINED_FUNCTION_10_0(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "cNodeRestriction:encodeBuffer: no space for align4, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
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

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v0, "cNodeRestriction:encodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

@end
