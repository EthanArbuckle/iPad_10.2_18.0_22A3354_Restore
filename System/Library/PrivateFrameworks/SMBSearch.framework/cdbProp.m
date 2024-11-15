@implementation cdbProp

- (cdbProp)initWithPropID:(unsigned int)a3
{
  cdbProp *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)cdbProp;
  result = -[cdbProp init](&v5, sel_init);
  if (result)
  {
    *(_QWORD *)&result->colidGuid.u1 = 0;
    *(_QWORD *)result->colidGuid.u4 = 0;
    result->_dbPropId = a3;
    *(_OWORD *)&result->_dbPropOptions = xmmword_227C48BB0;
  }
  return result;
}

- (void)setTimeMidGuid
{
  self->colidGuid = (network_uuid)TimeMidGuid;
}

- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  id v8;
  unint64_t v9;
  const char *v10;
  unint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v15;
  unsigned int v16;
  const char *v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  const char *v21;

  v8 = a3;
  v9 = objc_msgSend(v8, "length");
  v10 = (const char *)v9;
  if (v9 <= a4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[cdbProp encodeBuffer:BufferOffset:BytesWritten:].cold.8(self, v10, a4);
    goto LABEL_7;
  }
  v11 = v9 - a4;
  v12 = objc_msgSend(objc_retainAutorelease(v8), "bytes");
  if (v11 > 3)
  {
    v15 = v12;
    *(_DWORD *)(v12 + a4) = self->_dbPropId;
    if (v11 - 4 > 3)
    {
      *(_DWORD *)(v12 + a4 + 4) = self->_dbPropOptions;
      if (v11 - 8 > 3)
      {
        *(_DWORD *)(v12 + a4 + 8) = self->_dbPropStatus;
        if (v11 - 12 > 3)
        {
          *(_DWORD *)(v12 + a4 + 12) = self->_colidEKind;
          v16 = a4 + 16;
          v17 = (const char *)(v11 - 16);
          v18 = align8Pad(v16);
          if (v18)
          {
            v19 = v18;
            if ((unint64_t)v17 <= v18)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[cdbProp encodeBuffer:BufferOffset:BytesWritten:].cold.7(self, v17);
              goto LABEL_7;
            }
            bzero((void *)(v15 + v16), v18);
            v16 += v19;
            v17 -= v19;
            v20 = v19 + 36;
          }
          else
          {
            v20 = 36;
          }
          if ((unint64_t)v17 > 0xF)
          {
            *(network_uuid *)(v15 + v16) = self->colidGuid;
            v21 = v17 - 16;
            if ((unint64_t)v21 > 3)
            {
              v13 = 0;
              *(_DWORD *)(v15 + v16 + 16) = self->_colidULID;
              *a5 = v20;
              goto LABEL_8;
            }
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[cdbProp encodeBuffer:BufferOffset:BytesWritten:].cold.6(self, v21);
          }
          else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            -[cdbProp encodeBuffer:BufferOffset:BytesWritten:].cold.5(self, v17);
          }
        }
        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          -[cdbProp encodeBuffer:BufferOffset:BytesWritten:].cold.4(self, (const char *)(v11 - 12));
        }
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        -[cdbProp encodeBuffer:BufferOffset:BytesWritten:].cold.3(self, (const char *)(v11 - 8));
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[cdbProp encodeBuffer:BufferOffset:BytesWritten:].cold.2(self, (const char *)(v11 - 4));
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[cdbProp encodeBuffer:BufferOffset:BytesWritten:].cold.1(self, &v10[-a4]);
  }
LABEL_7:
  v13 = 12;
LABEL_8:

  return v13;
}

- (unsigned)dbPropId
{
  return self->_dbPropId;
}

- (void)setDbPropId:(unsigned int)a3
{
  self->_dbPropId = a3;
}

- (unsigned)dbPropOptions
{
  return self->_dbPropOptions;
}

- (void)setDbPropOptions:(unsigned int)a3
{
  self->_dbPropOptions = a3;
}

- (unsigned)dbPropStatus
{
  return self->_dbPropStatus;
}

- (void)setDbPropStatus:(unsigned int)a3
{
  self->_dbPropStatus = a3;
}

- (unsigned)colidEKind
{
  return self->_colidEKind;
}

- (void)setColidEKind:(unsigned int)a3
{
  self->_colidEKind = a3;
}

- (unsigned)colidULID
{
  return self->_colidULID;
}

- (void)setColidULID:(unsigned int)a3
{
  self->_colidULID = a3;
}

- (void)encodeBuffer:(void *)a1 BufferOffset:(const char *)a2 BytesWritten:.cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_9(a1, a2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cdbProp:encodeBuffer: propId: %u, no buffer space for dbPropId, sizeAvail: %llu\n", v3, v4, v5, v6, v7);
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

  OUTLINED_FUNCTION_9(a1, a2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cdbProp:encodeBuffer: propId: %u, no buffer space for dbPropOptions, sizeAvail: %llu\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)encodeBuffer:(void *)a1 BufferOffset:(const char *)a2 BytesWritten:.cold.3(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_9(a1, a2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cdbProp:encodeBuffer: propId: %u, no buffer space for dbPropStatus, sizeAvail: %llu\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)encodeBuffer:(void *)a1 BufferOffset:(const char *)a2 BytesWritten:.cold.4(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_9(a1, a2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cdbProp:encodeBuffer: propId: %u, no buffer space for colidEKind, sizeAvail: %llu\n", v3, v4, v5, v6, v7);
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

  OUTLINED_FUNCTION_9(a1, a2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cdbProp:encodeBuffer: propId: %u, no buffer space for colidGuid, sizeAvail: %llu\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)encodeBuffer:(void *)a1 BufferOffset:(const char *)a2 BytesWritten:.cold.6(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_9(a1, a2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cdbProp:encodeBuffer: propId: %u, no buffer space for colidULID, sizeAvail: %llu\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)encodeBuffer:(void *)a1 BufferOffset:(const char *)a2 BytesWritten:.cold.7(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_9(a1, a2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "cdbProp:encodeBuffer: propId: %u, no buffer space for paddingGuidAlign, sizeAvail: %llu\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)encodeBuffer:(void *)a1 BufferOffset:(const char *)a2 BytesWritten:(int)a3 .cold.8(void *a1, const char *a2, int a3)
{
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;

  v5[0] = 67109632;
  v5[1] = OUTLINED_FUNCTION_9(a1, a2);
  v6 = 2048;
  v7 = a2;
  v8 = 1024;
  v9 = a3;
  _os_log_error_impl(&dword_227C1F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "cdbProp:encodeBuffer: propId: %u, no buffer space, bLen: %llu, bOffset: %u\n", (uint8_t *)v5, 0x18u);
  OUTLINED_FUNCTION_8();
}

@end
