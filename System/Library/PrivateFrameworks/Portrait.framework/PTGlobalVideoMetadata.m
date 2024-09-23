@implementation PTGlobalVideoMetadata

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    xmmword_1EF90365C = xmmword_1C9343C60;
}

- (void)setMetadata:(id)a3 ofType:(unsigned int)a4
{
  id v7;
  id v8;

  v7 = a3;
  if (a4 - 1 <= 3)
  {
    v8 = v7;
    objc_storeStrong((id *)&self->_atoms[a4], a3);
    v7 = v8;
  }

}

- (unsigned)sizeOfSerializedObjectWithOptions:(id)a3
{
  unsigned int v5;
  uint64_t i;

  v5 = 8;
  for (i = 2; i != 6; ++i)
  {
    if (*((_QWORD *)&self->super.isa + i))
      v5 += -[PTGlobalVideoMetadata _sizeOfAtomOfType:withOptions:](self, "_sizeOfAtomOfType:withOptions:", (i - 1), a3);
  }
  return v5;
}

- (BOOL)writeToData:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  _DWORD *v9;
  uint64_t v10;
  _DWORD *v11;
  id *v12;
  unsigned int v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v18;
  unint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  v8 = -[PTGlobalVideoMetadata sizeOfSerializedObjectWithOptions:](self, "sizeOfSerializedObjectWithOptions:", v7);
  v19 = objc_msgSend(v6, "length");
  if (v19 >= v8)
  {
    v18 = objc_retainAutorelease(v6);
    v9 = (_DWORD *)objc_msgSend(v18, "mutableBytes");
    v10 = 0;
    v20 = v8;
    *v9 = bswap32(v8);
    v9[1] = 1684633187;
    v11 = v9 + 2;
    do
    {
      v12 = (id *)(&self->super.isa + v10);
      if (v12[2])
      {
        v13 = -[PTGlobalVideoMetadata _sizeOfAtomOfType:withOptions:](self, "_sizeOfAtomOfType:withOptions:", (v10 + 1), v7);
        *v11 = bswap32(v13);
        v11[1] = bswap32(*((_DWORD *)&kAtomIdentifiers + v10 + 1));
        objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v13 - 8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12[2], "writeToData:withOptions:", v14, v7);
        v15 = objc_retainAutorelease(v14);
        memcpy(v11 + 2, (const void *)objc_msgSend(v15, "mutableBytes"), objc_msgSend(v15, "length"));
        v11 = (_DWORD *)((char *)v11 + v13);

      }
      ++v10;
    }
    while (v10 != 4);
    v8 = v20;
    if ((PTSerializationDebugIsEnabled() & 1) != 0)
    {
      _PTLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[PTGlobalVideoMetadata writeToData:withOptions:].cold.1(v18, v20);

    }
  }

  return v19 >= v8;
}

+ (id)deserializeMetadataWithType:(unsigned int)a3 fromGlobalMetadata:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  unsigned int *v8;
  unint64_t v9;
  unsigned int *v10;
  id v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  unsigned int v20;

  v6 = a4;
  if ((unint64_t)objc_msgSend(v6, "length") >= 8
    && (v7 = objc_retainAutorelease(v6),
        v8 = (unsigned int *)objc_msgSend(v7, "bytes"),
        v9 = bswap32(*v8),
        objc_msgSend(v7, "length") >= v9)
    && v8[1] == 1684633187
    && (v10 = v8 + 2, v11 = objc_retainAutorelease(v7), (unint64_t)v10 < objc_msgSend(v11, "bytes") + v9))
  {
    v20 = a3;
    v12 = a3;
    while (1)
    {
      v13 = bswap32(*v10);
      v14 = bswap32(v10[1]);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v10 + 2, v13 - 8, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (kAtomIdentifiers[v12] == v14)
        break;
      v10 = (unsigned int *)((char *)v10 + v13);

      if ((unint64_t)v10 >= objc_msgSend(objc_retainAutorelease(v11), "bytes") + v9)
        goto LABEL_8;
    }
    if (PTSerializationDebugIsEnabled())
    {
      _PTLogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        +[PTGlobalVideoMetadata deserializeMetadataWithType:fromGlobalMetadata:error:].cold.1(v16, v9);

    }
    if (v20 - 1 > 3)
    {
      v17 = 0;
    }
    else
    {
      -[__objc2_class objectFromData:](*off_1E822A8F8[v20 - 1], "objectFromData:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
LABEL_8:
    v17 = 0;
  }

  return v17;
}

- (unsigned)_sizeOfAtomOfType:(unsigned int)a3 withOptions:(id)a4
{
  return -[PTSerializable sizeOfSerializedObjectWithOptions:](self->_atoms[a3], "sizeOfSerializedObjectWithOptions:", a4)+ 8;
}

- (void).cxx_destruct
{
  uint64_t v3;

  v3 = 40;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

- (void)writeToData:(void *)a1 withOptions:(uint64_t)a2 .cold.1(void *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  NSStringFromBytes((unsigned __int8 *)objc_msgSend(objc_retainAutorelease(a1), "mutableBytes"), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1C9281000, v3, v4, "w[+]: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_1_1();
}

+ (void)deserializeMetadataWithType:(void *)a1 fromGlobalMetadata:(uint64_t)a2 error:.cold.1(void *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  NSStringFromBytes((unsigned __int8 *)objc_msgSend(objc_retainAutorelease(a1), "bytes"), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1C9281000, v3, v4, "r[+]: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_1_1();
}

@end
