@implementation VGSerializationHelpersCVA

+ (BOOL)setCVAMatrix3xXf:(const void *)a3 inDictionary:(id)a4 forKey:(id)a5
{
  id v7;
  id v8;
  _BYTE v10[16];
  _BYTE v11[16];

  v7 = a5;
  cva::DictionaryHandler::DictionaryHandler((cva::DictionaryHandler *)v11, (__CFDictionary *)a4);
  cva::ItemHandler::createMatrix<float,3u,0u>((uint64_t)a3);
  v8 = objc_retainAutorelease(v7);
  LOBYTE(a4) = cva::DictionaryHandler::setItem((cva::DictionaryHandler *)v11, (const char *)objc_msgSend(v8, "UTF8String"), (const cva::ItemHandler *)v10);
  cva::ItemHandler::~ItemHandler((cva::ItemHandler *)v10);
  cva::DictionaryHandler::~DictionaryHandler((cva::DictionaryHandler *)v11);

  return (char)a4;
}

+ (BOOL)setCVAMatrix3xXui:(const void *)a3 inDictionary:(id)a4 forKey:(id)a5
{
  __CFDictionary *v7;
  id v8;
  size_t v9;
  _DWORD *v10;
  int v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  int v15;
  id v16;
  char v17;
  void *memptr[2];
  void *v20[2];
  int v21;
  _BYTE v22[16];

  v7 = (__CFDictionary *)a4;
  v8 = a5;
  cva::DictionaryHandler::DictionaryHandler((cva::DictionaryHandler *)v22, v7);
  v9 = (4 * (3 * *((_DWORD *)a3 + 4)) + 31) & 0x7FFFFFFE0;
  v20[1] = (void *)(v9 >> 2);
  memptr[0] = 0;
  malloc_type_posix_memalign(memptr, 0x20uLL, v9, 0x49090899uLL);
  v10 = memptr[0];
  v20[0] = memptr[0];
  v11 = *((_DWORD *)a3 + 4);
  v21 = v11;
  if (v11)
  {
    v12 = (3 * v11);
    v13 = *(int **)a3;
    v14 = 4 * v12;
    do
    {
      v15 = *v13++;
      *v10++ = v15;
      v14 -= 4;
    }
    while (v14);
  }
  cva::ItemHandler::createMatrix<int,3u,0u>((uint64_t)v20);
  v16 = objc_retainAutorelease(v8);
  v17 = cva::DictionaryHandler::setItem((cva::DictionaryHandler *)v22, (const char *)objc_msgSend(v16, "UTF8String"), (const cva::ItemHandler *)memptr);
  cva::ItemHandler::~ItemHandler((cva::ItemHandler *)memptr);
  free(v20[0]);
  cva::DictionaryHandler::~DictionaryHandler((cva::DictionaryHandler *)v22);

  return v17;
}

+ (BOOL)setCVAMatrix4x4f:(const void *)a3 inDictionary:(id)a4 forKey:(id)a5
{
  id v7;
  id v8;
  _BYTE v10[16];
  _BYTE v11[16];

  v7 = a5;
  cva::DictionaryHandler::DictionaryHandler((cva::DictionaryHandler *)v11, (__CFDictionary *)a4);
  cva::ItemHandler::createMatrix<float,4u,4u>((uint64_t)a3);
  v8 = objc_retainAutorelease(v7);
  LOBYTE(a4) = cva::DictionaryHandler::setItem((cva::DictionaryHandler *)v11, (const char *)objc_msgSend(v8, "UTF8String"), (const cva::ItemHandler *)v10);
  cva::ItemHandler::~ItemHandler((cva::ItemHandler *)v10);
  cva::DictionaryHandler::~DictionaryHandler((cva::DictionaryHandler *)v11);

  return (char)a4;
}

+ (BOOL)setSimdFloat33:(id *)a3 inDictionary:(id)a4 forKey:(id)a5
{
  __CFDictionary *v7;
  id v8;
  cva::ItemHandler *v9;
  const __CFData *v10;
  id v11;
  char v12;
  _BYTE v14[16];
  _BYTE v15[16];

  v7 = (__CFDictionary *)a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", a3, 48, 0);
  v9 = (cva::ItemHandler *)objc_claimAutoreleasedReturnValue();
  cva::DictionaryHandler::DictionaryHandler((cva::DictionaryHandler *)v15, v7);
  cva::ItemHandler::createData(v9, v10);
  v11 = objc_retainAutorelease(v8);
  v12 = cva::DictionaryHandler::setItem((cva::DictionaryHandler *)v15, (const char *)objc_msgSend(v11, "UTF8String"), (const cva::ItemHandler *)v14);
  cva::ItemHandler::~ItemHandler((cva::ItemHandler *)v14);
  cva::DictionaryHandler::~DictionaryHandler((cva::DictionaryHandler *)v15);

  return v12;
}

+ (BOOL)getCVAMatrix3xXf:(void *)a3 fromDictionary:(id)a4 forKey:(id)a5
{
  id v7;
  id v8;
  BOOL v9;
  _BYTE v11[16];
  _BYTE v12[16];

  v7 = a5;
  cva::DictionaryHandler::DictionaryHandler((cva::DictionaryHandler *)v12, (const __CFDictionary *)a4);
  v8 = objc_retainAutorelease(v7);
  cva::DictionaryHandler::item((cva::DictionaryHandler *)v12, (const char *)objc_msgSend(v8, "UTF8String"));
  v9 = (cva::ItemHandler::isMatrixType((cva::ItemHandler *)v11) & 1) != 0
    && cva::ItemHandler::getMatrix<float,3u,0u>((uint64_t)v11, (uint64_t)a3);
  cva::ItemHandler::~ItemHandler((cva::ItemHandler *)v11);
  cva::DictionaryHandler::~DictionaryHandler((cva::DictionaryHandler *)v12);

  return v9;
}

+ (BOOL)getCVAMatrix3xXui:(void *)a3 fromDictionary:(id)a4 forKey:(id)a5
{
  const __CFDictionary *v7;
  id v8;
  id v9;
  BOOL v10;
  int v11;
  _DWORD *v12;
  uint64_t v13;
  int *v14;
  uint64_t v15;
  int v16;
  size_t v17;
  void *v18;
  int v19;
  int *v20;
  uint64_t v21;
  _DWORD *v22;
  int v23;
  _DWORD *v24;
  void *v26[2];
  int v27;
  _BYTE v28[16];
  _BYTE v29[16];
  void *memptr;

  v7 = (const __CFDictionary *)a4;
  v8 = a5;
  cva::DictionaryHandler::DictionaryHandler((cva::DictionaryHandler *)v29, v7);
  v9 = objc_retainAutorelease(v8);
  cva::DictionaryHandler::item((cva::DictionaryHandler *)v29, (const char *)objc_msgSend(v9, "UTF8String"));
  if ((cva::ItemHandler::isMatrixType((cva::ItemHandler *)v28) & 1) != 0)
  {
    v26[0] = 0;
    v26[1] = 0;
    v27 = 0;
    v10 = cva::ItemHandler::getMatrix<int,3u,0u>((uint64_t)v28, (uint64_t)v26);
    if (v10)
    {
      v11 = v27;
      if (v27 != *((_DWORD *)a3 + 4))
      {
        if (v26[0] == *(void **)a3)
        {
          v17 = (4 * (3 * v27) + 31) & 0x7FFFFFFE0;
          memptr = 0;
          malloc_type_posix_memalign(&memptr, 0x20uLL, v17, 0x49090899uLL);
          v18 = memptr;
          v19 = v27;
          if (v27)
          {
            v20 = (int *)v26[0];
            v21 = 4 * (3 * v27);
            v22 = memptr;
            do
            {
              v23 = *v20++;
              *v22++ = v23;
              v21 -= 4;
            }
            while (v21);
          }
          v24 = *(_DWORD **)a3;
          *(_QWORD *)a3 = v18;
          *((_QWORD *)a3 + 1) = v17 >> 2;
          *((_DWORD *)a3 + 4) = v19;
          free(v24);
          goto LABEL_15;
        }
        *((_DWORD *)a3 + 4) = v27;
        cva::MatrixData<float,0ul,0ul,false>::reserve((uint64_t)a3, (3 * v11));
        v11 = *((_DWORD *)a3 + 4);
      }
      if (v11)
      {
        v12 = *(_DWORD **)a3;
        v13 = (3 * v11);
        v14 = (int *)v26[0];
        v15 = 4 * v13;
        do
        {
          v16 = *v14++;
          *v12++ = v16;
          v15 -= 4;
        }
        while (v15);
      }
    }
LABEL_15:
    free(v26[0]);
    goto LABEL_16;
  }
  v10 = 0;
LABEL_16:
  cva::ItemHandler::~ItemHandler((cva::ItemHandler *)v28);
  cva::DictionaryHandler::~DictionaryHandler((cva::DictionaryHandler *)v29);

  return v10;
}

+ (BOOL)getCVAMatrix4x4f:(void *)a3 fromDictionary:(id)a4 forKey:(id)a5
{
  id v7;
  id v8;
  char v9;
  _BYTE v11[16];
  _BYTE v12[16];

  v7 = a5;
  cva::DictionaryHandler::DictionaryHandler((cva::DictionaryHandler *)v12, (const __CFDictionary *)a4);
  v8 = objc_retainAutorelease(v7);
  cva::DictionaryHandler::item((cva::DictionaryHandler *)v12, (const char *)objc_msgSend(v8, "UTF8String"));
  if ((cva::ItemHandler::isMatrixType((cva::ItemHandler *)v11) & 1) != 0)
    v9 = cva::ItemHandler::getMatrix<float,4u,4u>((uint64_t)v11, (uint64_t)a3);
  else
    v9 = 0;
  cva::ItemHandler::~ItemHandler((cva::ItemHandler *)v11);
  cva::DictionaryHandler::~DictionaryHandler((cva::DictionaryHandler *)v12);

  return v9;
}

+ (BOOL)getSimdFloat33:(id *)a3 fromDictionary:(id)a4 forKey:(id)a5
{
  id v7;
  id v8;
  char isDataType;
  void *v10;
  _BYTE v12[16];
  _BYTE v13[16];

  v7 = a5;
  cva::DictionaryHandler::DictionaryHandler((cva::DictionaryHandler *)v13, (const __CFDictionary *)a4);
  v8 = objc_retainAutorelease(v7);
  cva::DictionaryHandler::item((cva::DictionaryHandler *)v13, (const char *)objc_msgSend(v8, "UTF8String"));
  isDataType = cva::ItemHandler::isDataType((cva::ItemHandler *)v12);
  if ((isDataType & 1) != 0)
  {
    cva::ItemHandler::getData((cva::ItemHandler *)v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "getBytes:length:", a3, 48);

  }
  cva::ItemHandler::~ItemHandler((cva::ItemHandler *)v12);
  cva::DictionaryHandler::~DictionaryHandler((cva::DictionaryHandler *)v13);

  return isDataType;
}

@end
