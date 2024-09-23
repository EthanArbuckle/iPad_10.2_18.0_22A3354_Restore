@implementation fullPropSpec

- (fullPropSpec)initWithPropertyNumber:(int)a3
{
  char *v4;
  fullPropSpec *v5;
  __int128 *v6;
  int v7;
  __int128 *v8;
  __int128 *v9;
  int v10;
  __int128 *v11;
  __int128 *v12;
  __int128 *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)fullPropSpec;
  v4 = -[fullPropSpec init](&v15, sel_init);
  v5 = (fullPropSpec *)v4;
  if (v4)
  {
    switch(a3)
    {
      case 0:
        v6 = &QueryGuid;
        goto LABEL_15;
      case 1:
        *(_OWORD *)(v4 + 8) = StorageGuid;
        v7 = 14;
        goto LABEL_38;
      case 2:
        *(_OWORD *)(v4 + 8) = StorageGuid;
        v7 = 10;
        goto LABEL_38;
      case 3:
        *(_OWORD *)(v4 + 8) = QueryGuid;
        v7 = 5;
        goto LABEL_38;
      case 4:
        *(_OWORD *)(v4 + 8) = ShellDetailsGuid;
        v7 = 24;
        goto LABEL_38;
      case 5:
        *(_OWORD *)(v4 + 8) = ShellDetailsGuid;
        v7 = 25;
        goto LABEL_38;
      case 6:
        v8 = &ShellDetailsGuid;
        goto LABEL_22;
      case 7:
        v9 = &unknown1_guid;
        goto LABEL_37;
      case 8:
        v6 = &unknown2_guid;
LABEL_15:
        *(_OWORD *)(v4 + 8) = *v6;
        v7 = 3;
        goto LABEL_38;
      case 9:
        v10 = 19;
        goto LABEL_18;
      case 10:
        v10 = 4;
LABEL_18:
        *((_DWORD *)v4 + 8) = v10;
        v11 = &StorageGuid;
        goto LABEL_20;
      case 11:
        *((_DWORD *)v4 + 8) = 100;
        v11 = &unknown3_guid;
LABEL_20:
        *(_OWORD *)(v4 + 8) = *v11;
        goto LABEL_39;
      case 12:
        v8 = &StorageGuid;
LABEL_22:
        *(_OWORD *)(v4 + 8) = *v8;
        v7 = 11;
        goto LABEL_38;
      case 13:
        *(_OWORD *)(v4 + 8) = StorageGuid;
        v7 = 13;
        goto LABEL_38;
      case 14:
        v12 = &StorageGuid;
        goto LABEL_32;
      case 15:
        *(_OWORD *)(v4 + 8) = StorageGuid;
        v7 = 16;
        goto LABEL_38;
      case 16:
        *(_OWORD *)(v4 + 8) = StorageGuid;
        v7 = 12;
        goto LABEL_38;
      case 17:
        v13 = &shell_sfgao_flags_strings_guid;
        goto LABEL_29;
      case 18:
        v13 = &shell_omit_from_view_guid;
LABEL_29:
        *(_OWORD *)(v4 + 8) = *v13;
        v7 = 2;
        goto LABEL_38;
      case 19:
        *(_OWORD *)(v4 + 8) = StorageGuid;
        v7 = 22;
        goto LABEL_38;
      case 20:
        v12 = &QueryGuid;
LABEL_32:
        *(_OWORD *)(v4 + 8) = *v12;
        v7 = 15;
        goto LABEL_38;
      case 21:
        *(_OWORD *)(v4 + 8) = StorageGuid;
        v7 = 18;
        goto LABEL_38;
      case 22:
        *(_OWORD *)(v4 + 8) = StorageGuid;
        v7 = 21;
        goto LABEL_38;
      case 23:
        v9 = &SystemFilenameGuid;
        goto LABEL_37;
      case 24:
        v9 = &SystemFileExtensionGuid;
LABEL_37:
        *(_OWORD *)(v4 + 8) = *v9;
        v7 = 100;
LABEL_38:
        *((_DWORD *)v4 + 8) = v7;
LABEL_39:
        *((_DWORD *)v4 + 6) = a3;
        *((_DWORD *)v4 + 7) = 1;
        break;
      default:
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[fullPropSpec initWithPropertyNumber:].cold.1(a3);

        v5 = 0;
        break;
    }
  }
  return v5;
}

- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  id v8;
  unint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  unsigned int v13;
  const char *v14;
  unsigned int v15;
  int v16;

  v8 = a3;
  v9 = objc_msgSend(v8, "length");
  v10 = (const char *)v9;
  if (v9 <= a4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[fullPropSpec encodeBuffer:BufferOffset:BytesWritten:].cold.5(self, v10, a4);
  }
  else
  {
    v11 = (const char *)(v9 - a4);
    v12 = objc_msgSend(objc_retainAutorelease(v8), "bytes");
    v13 = align8Pad(a4);
    if (v13 && (unint64_t)v11 < v13)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[fullPropSpec encodeBuffer:BufferOffset:BytesWritten:].cold.1(self, v11);
    }
    else
    {
      v14 = &v11[-v13];
      if ((unint64_t)v14 > 0xF)
      {
        v15 = v13 + a4;
        *(network_uuid *)(v12 + v13 + a4) = self->propGuid;
        if ((unint64_t)(v14 - 16) > 3)
        {
          *(_DWORD *)(v12 + v15 + 16) = self->_ulKind;
          *a5 = v13 + 20;
          if ((unint64_t)(v14 - 20) > 3)
          {
            v16 = 0;
            *(_DWORD *)(v12 + v15 + 20) = self->_propID;
            *a5 = v13 + 24;
            goto LABEL_18;
          }
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[fullPropSpec encodeBuffer:BufferOffset:BytesWritten:].cold.4(self, v14 - 20);
        }
        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          -[fullPropSpec encodeBuffer:BufferOffset:BytesWritten:].cold.3(self, v14 - 16);
        }
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        -[fullPropSpec encodeBuffer:BufferOffset:BytesWritten:].cold.2(self, v14);
      }
    }
  }
  v16 = 12;
LABEL_18:

  return v16;
}

- (int)propNumber
{
  return self->_propNumber;
}

- (void)setPropNumber:(int)a3
{
  self->_propNumber = a3;
}

- (unsigned)ulKind
{
  return self->_ulKind;
}

- (void)setUlKind:(unsigned int)a3
{
  self->_ulKind = a3;
}

- (unsigned)propID
{
  return self->_propID;
}

- (void)setPropID:(unsigned int)a3
{
  self->_propID = a3;
}

- (void)initWithPropertyNumber:(int)a1 .cold.1(int a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_227C1F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "fullPropSpec:initWithPropertyNumber: propNum: %u not supported\n", (uint8_t *)v1, 8u);
}

- (void)encodeBuffer:(void *)a1 BufferOffset:(const char *)a2 BytesWritten:.cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_3_1(a1, a2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "fullPropSpec:encodeBuffer: propNum: %u, no buffer space for guid align, sizeAvail: %llu\n", v3, v4, v5, v6, v7);
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

  OUTLINED_FUNCTION_3_1(a1, a2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "fullPropSpec:encodeBuffer: propNum: %u, no buffer space for guid, sizeAvail: %llu\n", v3, v4, v5, v6, v7);
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

  OUTLINED_FUNCTION_3_1(a1, a2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "fullPropSpec:encodeBuffer: propNum: %u, no buffer space for ulType, sizeAvail: %llu\n", v3, v4, v5, v6, v7);
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

  OUTLINED_FUNCTION_3_1(a1, a2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_227C1F000, MEMORY[0x24BDACB70], v2, "fullPropSpec:encodeBuffer: propNum: %u, no buffer space for PrSpec, sizeAvail: %llu\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)encodeBuffer:(void *)a1 BufferOffset:(const char *)a2 BytesWritten:(int)a3 .cold.5(void *a1, const char *a2, int a3)
{
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;

  v5[0] = 67109632;
  v5[1] = OUTLINED_FUNCTION_3_1(a1, a2);
  v6 = 2048;
  v7 = a2;
  v8 = 1024;
  v9 = a3;
  _os_log_error_impl(&dword_227C1F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "fullPropSpec:encodeBuffer: propNum: %u, no buffer space, bLen: %llu, bOffset: %u\n", (uint8_t *)v5, 0x18u);
  OUTLINED_FUNCTION_8();
}

@end
