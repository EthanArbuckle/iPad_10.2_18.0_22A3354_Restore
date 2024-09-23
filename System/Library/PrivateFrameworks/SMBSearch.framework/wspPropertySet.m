@implementation wspPropertySet

- (wspPropertySet)initWithPropSetID:(int)a3
{
  wspPropertySet *v4;
  wspPropertySet *v5;
  NSMutableArray *v6;
  NSMutableArray *propArr;
  __int128 *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)wspPropertySet;
  v4 = -[wspPropertySet init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_propsetID = a3;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    propArr = v5->_propArr;
    v5->_propArr = v6;

    if (v5->_propArr)
    {
      switch(a3)
      {
        case 1:
          v8 = &propset_fscifrmwork_ext_guid;
          goto LABEL_9;
        case 2:
          v8 = &propset_cifrmwrkcore_ext_guid;
          goto LABEL_9;
        case 3:
          v8 = &propset_query_ext_guid;
          goto LABEL_9;
        case 4:
          v8 = &propset_msidxs_rowsetext_guid;
LABEL_9:
          v5->propSetGuid = (network_uuid)*v8;
          break;
        default:
          return v5;
      }
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (void)addProperty:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[wspPropertySet propArr](self, "propArr");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (id)propertyForPropID:(unsigned int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[wspPropertySet propArr](self, "propArr", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      v10 = v7;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v7 = *(id *)(*((_QWORD *)&v13 + 1) + 8 * v9);

        if (objc_msgSend(v7, "propertyID") == a3)
        {
          v11 = v7;
          goto LABEL_12;
        }
        ++v9;
        v10 = v7;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }

  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (unint64_t)propertyCount
{
  void *v2;
  unint64_t v3;

  -[wspPropertySet propArr](self, "propArr");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  id v8;
  unint64_t v9;
  const char *v10;
  const char *v11;
  id v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v16;
  const char *v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  const char *v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  unsigned int v31;
  unsigned int v32;
  wspPropertySet *v33;
  id v34;
  unsigned int *v35;
  uint64_t v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  unsigned int v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v42 = 0;
  v9 = objc_msgSend(v8, "length");
  v10 = (const char *)v9;
  if (v9 <= a4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspPropertySet encodeBuffer:BufferOffset:BytesWritten:].cold.6(self, v10, a4);
    goto LABEL_7;
  }
  v11 = (const char *)(v9 - a4);
  v12 = objc_retainAutorelease(v8);
  v13 = objc_msgSend(v12, "bytes");
  if ((unint64_t)v11 <= 0xF)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspPropertySet encodeBuffer:BufferOffset:BytesWritten:].cold.1(self, v11);
LABEL_7:
    v14 = 12;
    goto LABEL_8;
  }
  v16 = v13;
  *(network_uuid *)(v13 + a4) = self->propSetGuid;
  v14 = a4 + 16;
  v17 = v11 - 16;
  v18 = align4Pad(v14);
  if (v18)
  {
    v19 = v18;
    if ((unint64_t)v17 <= v18)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[wspPropertySet encodeBuffer:BufferOffset:BytesWritten:].cold.5(self, v17);
      goto LABEL_7;
    }
    v36 = v16;
    bzero((void *)(v16 + v14), v18);
    v14 += v19;
    v17 -= v19;
    v20 = v19 + 20;
  }
  else
  {
    v36 = v16;
    v20 = 20;
  }
  v21 = v17 - 4;
  if ((unint64_t)v17 <= 4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[wspPropertySet encodeBuffer:BufferOffset:BytesWritten:].cold.2(self, v17);
    goto LABEL_7;
  }
  v35 = a5;
  -[wspPropertySet propArr](self, "propArr");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  *(_DWORD *)(v36 + v14) = v23;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[wspPropertySet propArr](self, "propArr");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (!v24)
    goto LABEL_29;
  v25 = v24;
  v33 = self;
  v34 = v8;
  v26 = 0;
  v27 = v14 + 4;
  v28 = *(_QWORD *)v39;
  LOBYTE(v14) = 1;
  while (2)
  {
    v29 = 0;
    v30 = v26;
    do
    {
      if (*(_QWORD *)v39 != v28)
        objc_enumerationMutation(obj);
      v26 = *(id *)(*((_QWORD *)&v38 + 1) + 8 * v29);

      if ((v14 & 1) == 0)
      {
        v31 = align4Pad(v27);
        if (v31)
        {
          v32 = v31;
          if ((unint64_t)v21 <= v31)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[wspPropertySet encodeBuffer:BufferOffset:BytesWritten:].cold.4(v33, v21);
            v14 = 12;
            goto LABEL_37;
          }
          bzero((void *)(v36 + v27), v31);
          v20 += v32;
          v27 = v32 + v27;
          v21 -= v32;
        }
      }
      v14 = objc_msgSend(v26, "encodeBuffer:BufferOffset:BytesWritten:", v12, v27, &v42);
      if (v14)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[wspPropertySet encodeBuffer:BufferOffset:BytesWritten:].cold.3(v33, (char *)v26, v14);
LABEL_37:
        v8 = v34;

        goto LABEL_8;
      }
      v20 += v42;
      v27 = v42 + v27;
      v21 -= v42;
      ++v29;
      v30 = v26;
    }
    while (v25 != v29);
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    LOBYTE(v14) = 0;
    if (v25)
      continue;
    break;
  }

  v8 = v34;
LABEL_29:

  v14 = 0;
  *v35 = v20;
LABEL_8:

  return v14;
}

- (int)propsetID
{
  return self->_propsetID;
}

- (void)setPropsetID:(int)a3
{
  self->_propsetID = a3;
}

- (NSMutableArray)propArr
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPropArr:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propArr, 0);
}

- (void)encodeBuffer:(void *)a1 BufferOffset:(const char *)a2 BytesWritten:.cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_3_2(a1, a2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "wspPropertySet:encodeBuffer: propsetID: %u encodeBuffer: no buffer space for propSetGuid, sizeAvail: %llu\n", v3, v4, v5, v6, v7);
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

  OUTLINED_FUNCTION_3_2(a1, a2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "wspPropertySet:encodeBuffer: propsetID: %u, no buffer space for cProperties, sizeAvail: %llu\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)encodeBuffer:(void *)a1 BufferOffset:(char *)a2 BytesWritten:(int)a3 .cold.3(void *a1, char *a2, int a3)
{
  _DWORD v5[2];
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;

  v5[0] = 67109632;
  v5[1] = OUTLINED_FUNCTION_3_2(a1, a2);
  v6 = 1024;
  v7 = objc_msgSend(a2, "propertyID");
  v8 = 1024;
  v9 = a3;
  _os_log_error_impl(&dword_227C1F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "wspPropertySet:encodeBuffer: propsetID: %u, encode propId: %u error: %d\n", (uint8_t *)v5, 0x14u);
}

- (void)encodeBuffer:(void *)a1 BufferOffset:(const char *)a2 BytesWritten:.cold.4(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_3_2(a1, a2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "wspPropertySet:encodeBuffer: propsetID: %u, no buffer space for alignment, sizeAvail: %llu\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)encodeBuffer:(void *)a1 BufferOffset:(const char *)a2 BytesWritten:.cold.5(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_3_2(a1, a2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "wspPropertySet:encodeBuffer: propsetID: %u, no buffer space for _padding field, sizeAvail: %llu\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)encodeBuffer:(void *)a1 BufferOffset:(const char *)a2 BytesWritten:(int)a3 .cold.6(void *a1, const char *a2, int a3)
{
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;

  v5[0] = 67109632;
  v5[1] = OUTLINED_FUNCTION_3_2(a1, a2);
  v6 = 2048;
  v7 = a2;
  v8 = 1024;
  v9 = a3;
  _os_log_error_impl(&dword_227C1F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "wspPropertySet: %u encodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", (uint8_t *)v5, 0x18u);
  OUTLINED_FUNCTION_8();
}

@end
