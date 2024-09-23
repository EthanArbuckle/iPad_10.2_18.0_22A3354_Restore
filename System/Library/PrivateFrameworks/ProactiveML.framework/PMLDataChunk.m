@implementation PMLDataChunk

- (PMLDataChunk)initWithData:(id)a3
{
  id v5;
  PMLDataChunk *v6;
  PMLDataChunk *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PMLDataChunk;
  v6 = -[PMLDataChunk init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_backingData, a3);

  return v7;
}

- (void)setSuperdata:(id)a3
{
  objc_storeStrong((id *)&self->_superdata, a3);
}

- (BOOL)isEqual:(id)a3
{
  PMLDataChunk *v4;
  BOOL v5;

  v4 = (PMLDataChunk *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[NSData isEqualToData:](self->_backingData, "isEqualToData:", v4->_backingData);
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSData hash](self->_backingData, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_superdata, 0);
  objc_storeStrong((id *)&self->_backingData, 0);
}

+ (id)chunkOfType:(unsigned int)a3 data:(id)a4 superdata:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a4;
  v8 = a5;
  if (a3 > 3)
    v9 = 0;
  else
    v9 = objc_alloc(*off_24D3DBD78[a3]);
  v10 = (void *)objc_msgSend(v9, "initWithData:", v7);
  objc_msgSend(v10, "setSuperdata:", v8);

  return v10;
}

+ (id)chunksFromFileAtPath:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v9 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfFile:options:error:", v3, 1, &v9);
  v5 = v9;
  if (v4)
  {
    +[PMLDataChunk chunksFromData:](PMLDataChunk, "chunksFromData:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PML_LogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v11 = v3;
      v12 = 2112;
      v13 = v5;
      _os_log_error_impl(&dword_2159BB000, v7, OS_LOG_TYPE_ERROR, "Could not open chunk file at %@: %@", buf, 0x16u);
    }

    v6 = 0;
  }

  return v6;
}

+ (id)chunksFromData:(id)a3
{
  id v3;
  _DWORD *v4;
  unint64_t v5;
  unsigned int v6;
  unint64_t v7;
  uint64_t v8;
  size_t v9;
  void *v10;
  unsigned int *v12;
  unint64_t v13;
  unsigned int *v14;
  unint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  int v20;
  unint64_t v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = objc_retainAutorelease(a3);
  v4 = (_DWORD *)objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");
  if (v5 < 8 || *v4 != 1563411470)
    goto LABEL_5;
  v6 = v4[1];
  if (!v6)
  {
    v10 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_6;
  }
  v7 = v5;
  v8 = 12 * v6;
  v9 = v8 + 8;
  if (v8 + 8 <= v5)
  {
    v12 = (unsigned int *)malloc_type_malloc(v8 + 8, 0x76E18EuLL);
    memcpy(v12, v4, v9);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v12[1]);
    if (v12[1])
    {
      v13 = 0;
      v14 = v12 + 2;
      while (1)
      {
        v15 = v14[1] + (unint64_t)*v14;
        if (v15 > v7)
          break;
        v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", (char *)v4 + *v14, v14[1], 0);
        +[PMLDataChunk chunkOfType:data:superdata:](PMLDataChunk, "chunkOfType:data:superdata:", v14[2], v16, v3);
        v17 = objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          PML_LogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v20 = 67109120;
            LODWORD(v21) = v13;
            _os_log_error_impl(&dword_2159BB000, v19, OS_LOG_TYPE_ERROR, "Could not parse chunk %u; bailing out",
              (uint8_t *)&v20,
              8u);
          }

          goto LABEL_19;
        }
        v18 = (void *)v17;
        objc_msgSend(v10, "addObject:", v17);

        ++v13;
        v14 += 3;
        if (v13 >= v12[1])
          goto LABEL_20;
      }
      PML_LogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v20 = 134218240;
        v21 = v15;
        v22 = 2048;
        v23 = v7;
        _os_log_error_impl(&dword_2159BB000, v16, OS_LOG_TYPE_ERROR, "Chunk descriptor out of bounds: ends at %llu in data of length %llu", (uint8_t *)&v20, 0x16u);
      }
LABEL_19:

      v10 = 0;
    }
LABEL_20:
    free(v12);
  }
  else
  {
LABEL_5:
    v10 = 0;
  }
LABEL_6:

  return v10;
}

+ (id)serializeChunks:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  size_t v11;
  size_t v12;
  char *v13;
  uint64_t v14;
  int v15;
  unsigned int v16;
  unsigned int v17;
  char *v18;
  id *v19;
  void *v20;
  uint64_t v22;
  unsigned int v23;
  unsigned int v24;
  _QWORD *v25;
  void *v27;
  int v28;
  int v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *memptr;
  uint64_t v36;
  int v37;
  unsigned int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PMLDataChunk.m"), 177, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("chunks"));

  }
  v6 = (void *)objc_opt_new();
  v37 = 1563411470;
  v38 = objc_msgSend(v5, "count");
  objc_msgSend(v6, "appendBytes:length:", &v37, 8);
  v7 = v38;
  v8 = 12 * v38;
  memptr = 0;
  v36 = 0;
  if (v38 > 0x15)
  {
    v28 = malloc_type_posix_memalign(&memptr, 8uLL, 12 * v38, 0x40712C42uLL);
    LOBYTE(v36) = 0;
    if (v28)
      goto LABEL_27;
    v9 = (char *)memptr;
    v10 = v38;
  }
  else
  {
    v9 = (char *)&v31 - ((v8 + 15) & 0x1FFFFFFFF0);
    bzero(v9, 12 * v38);
    v10 = v7;
  }
  v11 = 4 * v10;
  v12 = (4 * v10) | 3;
  memptr = 0;
  v36 = 0;
  v32 = v12;
  v33 = v7;
  v34 = v8;
  if (v12 <= 0x100)
  {
    v13 = (char *)&v31 - ((v12 + 15) & 0x7FFFFFFF0);
    bzero(v13, v12);
    goto LABEL_7;
  }
  v29 = malloc_type_posix_memalign(&memptr, 8uLL, 4 * v10, 0x3136F737uLL);
  LOBYTE(v36) = 0;
  if (v29)
  {
LABEL_27:
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB70], CFSTR("malloc failed"), 0);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v30);
  }
  v13 = (char *)memptr;
LABEL_7:
  bzero(v13, v11);
  if (objc_msgSend(v5, "count"))
  {
    v14 = 0;
    v15 = v34 + 8;
    v16 = 1;
    do
    {
      if ((v15 & 0x1F) != 0)
      {
        v17 = v15 | 0xFFFFFFE0;
        v15 -= v15 | 0xFFFFFFE0;
        *(_DWORD *)&v13[4 * v14] -= v17;
      }
      v18 = &v9[12 * v14];
      *(_DWORD *)v18 = v15;
      objc_msgSend(v5, "objectAtIndexedSubscript:", v14);
      v19 = (id *)objc_claimAutoreleasedReturnValue();
      *((_DWORD *)v18 + 1) = objc_msgSend(v19[1], "length");

      objc_msgSend(v5, "objectAtIndexedSubscript:", v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *((_DWORD *)v18 + 2) = objc_msgSend((id)objc_opt_class(), "dataChunkType");

      v15 += *((_DWORD *)v18 + 1);
      v14 = v16;
    }
    while (objc_msgSend(v5, "count") > (unint64_t)v16++);
  }
  objc_msgSend(v6, "appendBytes:length:", v9, v34);
  if (objc_msgSend(v5, "count"))
  {
    v22 = 0;
    v23 = 0;
    do
    {
      if (*(_DWORD *)&v13[4 * v22])
      {
        v24 = 0;
        do
        {
          objc_msgSend(v6, "appendBytes:length:", &unk_215A00350, 1);
          ++v24;
        }
        while (v24 < *(_DWORD *)&v13[4 * v22]);
      }
      objc_msgSend(v5, "objectAtIndexedSubscript:", v22);
      v25 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendData:", v25[1]);

      v22 = ++v23;
    }
    while (objc_msgSend(v5, "count") > (unint64_t)v23);
  }
  if (v33 > 0x15)
    free(v9);
  if (v32 >= 0x101)
    free(v13);

  return v6;
}

@end
