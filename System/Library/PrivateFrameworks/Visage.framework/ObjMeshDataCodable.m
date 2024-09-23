@implementation ObjMeshDataCodable

- (ObjMeshDataCodable)initWithObjMeshDataNoCopy:(const void *)a3
{
  ObjMeshDataCodable *v4;
  ObjMeshDataCodable *v5;
  ObjMeshDataCodable *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ObjMeshDataCodable;
  v4 = -[ObjMeshDataCodable init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_pObjMeshData = a3;
    v4->_freeWhenDone = 0;
    v6 = v4;
  }

  return v5;
}

- (void)dealloc
{
  void **pObjMeshData;
  objc_super v4;

  if (self->_freeWhenDone)
  {
    pObjMeshData = (void **)self->_pObjMeshData;
    if (pObjMeshData)
    {
      if (*((_BYTE *)pObjMeshData + 200))
        free(pObjMeshData[22]);
      if (*((_BYTE *)pObjMeshData + 168))
        free(pObjMeshData[18]);
      if (*((_BYTE *)pObjMeshData + 136))
        free(pObjMeshData[14]);
      if (*((_BYTE *)pObjMeshData + 104))
        free(pObjMeshData[10]);
      if (*((_BYTE *)pObjMeshData + 72))
        free(pObjMeshData[6]);
      free(pObjMeshData[3]);
      free(*pObjMeshData);
      MEMORY[0x24BD02D60](pObjMeshData, 0x1092C4070EEB0B2);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)ObjMeshDataCodable;
  -[ObjMeshDataCodable dealloc](&v4, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  __CFDictionary *v5;
  _DWORD *pObjMeshData;
  size_t v7;
  _DWORD *v8;
  int v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  int v13;
  _BYTE *v14;
  size_t v15;
  _DWORD *v16;
  int v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  int v21;
  size_t v22;
  _DWORD *v23;
  int v24;
  uint64_t v25;
  int *v26;
  uint64_t v27;
  int v28;
  void *v29;
  size_t v30;
  int v31;
  _BYTE v32[16];
  _BYTE v33[16];
  void *memptr;

  v4 = a3;
  if (self->_pObjMeshData)
  {
    v5 = (__CFDictionary *)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
    cva::DictionaryHandler::DictionaryHandler((cva::DictionaryHandler *)v33, v5);
    cva::ItemHandler::createMatrix<float,3u,0u>((uint64_t)self->_pObjMeshData);
    cva::DictionaryHandler::setItem((cva::DictionaryHandler *)v33, "V", (const cva::ItemHandler *)&v29);
    cva::ItemHandler::~ItemHandler((cva::ItemHandler *)&v29);
    pObjMeshData = self->_pObjMeshData;
    v7 = (4 * (3 * pObjMeshData[10]) + 31) & 0x7FFFFFFE0;
    v29 = 0;
    v30 = v7 >> 2;
    memptr = 0;
    malloc_type_posix_memalign(&memptr, 0x20uLL, v7, 0x49090899uLL);
    v8 = memptr;
    v29 = memptr;
    v9 = pObjMeshData[10];
    v31 = v9;
    if (v9)
    {
      v10 = (3 * v9);
      v11 = (int *)*((_QWORD *)pObjMeshData + 3);
      v12 = 4 * v10;
      do
      {
        v13 = *v11++;
        *v8++ = v13;
        v12 -= 4;
      }
      while (v12);
    }
    cva::ItemHandler::createMatrix<int,3u,0u>((uint64_t)&v29);
    cva::DictionaryHandler::setItem((cva::DictionaryHandler *)v33, "F", (const cva::ItemHandler *)v32);
    cva::ItemHandler::~ItemHandler((cva::ItemHandler *)v32);
    free(v29);
    v14 = self->_pObjMeshData;
    if (v14[72])
    {
      cva::ItemHandler::createMatrix<float,2u,0u>((uint64_t)(v14 + 48));
      cva::DictionaryHandler::setItem((cva::DictionaryHandler *)v33, "VT", (const cva::ItemHandler *)&v29);
      cva::ItemHandler::~ItemHandler((cva::ItemHandler *)&v29);
      v14 = self->_pObjMeshData;
    }
    if (v14[104])
    {
      cva::ItemHandler::createMatrix<float,3u,0u>((uint64_t)(v14 + 80));
      cva::DictionaryHandler::setItem((cva::DictionaryHandler *)v33, "VN", (const cva::ItemHandler *)&v29);
      cva::ItemHandler::~ItemHandler((cva::ItemHandler *)&v29);
      v14 = self->_pObjMeshData;
    }
    if (v14[136])
    {
      cva::ItemHandler::createMatrix<float,3u,0u>((uint64_t)(v14 + 112));
      cva::DictionaryHandler::setItem((cva::DictionaryHandler *)v33, "VC", (const cva::ItemHandler *)&v29);
      cva::ItemHandler::~ItemHandler((cva::ItemHandler *)&v29);
      v14 = self->_pObjMeshData;
    }
    if (v14[168])
    {
      v15 = (4 * (3 * *((_DWORD *)v14 + 40)) + 31) & 0x7FFFFFFE0;
      v30 = v15 >> 2;
      memptr = 0;
      malloc_type_posix_memalign(&memptr, 0x20uLL, v15, 0x49090899uLL);
      v16 = memptr;
      v29 = memptr;
      v17 = *((_DWORD *)v14 + 40);
      v31 = v17;
      if (v17)
      {
        v18 = (3 * v17);
        v19 = (int *)*((_QWORD *)v14 + 18);
        v20 = 4 * v18;
        do
        {
          v21 = *v19++;
          *v16++ = v21;
          v20 -= 4;
        }
        while (v20);
      }
      cva::ItemHandler::createMatrix<int,3u,0u>((uint64_t)&v29);
      cva::DictionaryHandler::setItem((cva::DictionaryHandler *)v33, "FT", (const cva::ItemHandler *)v32);
      cva::ItemHandler::~ItemHandler((cva::ItemHandler *)v32);
      free(v29);
      v14 = self->_pObjMeshData;
    }
    if (v14[200])
    {
      v22 = (4 * (3 * *((_DWORD *)v14 + 48)) + 31) & 0x7FFFFFFE0;
      v30 = v22 >> 2;
      memptr = 0;
      malloc_type_posix_memalign(&memptr, 0x20uLL, v22, 0x49090899uLL);
      v23 = memptr;
      v29 = memptr;
      v24 = *((_DWORD *)v14 + 48);
      v31 = v24;
      if (v24)
      {
        v25 = (3 * v24);
        v26 = (int *)*((_QWORD *)v14 + 22);
        v27 = 4 * v25;
        do
        {
          v28 = *v26++;
          *v23++ = v28;
          v27 -= 4;
        }
        while (v27);
      }
      cva::ItemHandler::createMatrix<int,3u,0u>((uint64_t)&v29);
      cva::DictionaryHandler::setItem((cva::DictionaryHandler *)v33, "FN", (const cva::ItemHandler *)v32);
      cva::ItemHandler::~ItemHandler((cva::ItemHandler *)v32);
      free(v29);
    }
    objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("meshProperties"), v29);
    cva::DictionaryHandler::~DictionaryHandler((cva::DictionaryHandler *)v33);

  }
}

- (const)objMeshData
{
  return self->_pObjMeshData;
}

- (ObjMeshDataCodable)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const __CFDictionary *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int v14;
  int v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  ObjMeshDataCodable *v21;
  size_t v23;
  void *v24;
  int v25;
  int *v26;
  uint64_t v27;
  _DWORD *v28;
  int v29;
  void *v30;
  int *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  int *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  int *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  ObjMeshDataCodable *v49;
  void *v50[2];
  int **v51[2];
  uint8_t buf[8];
  uint64_t v53;
  uint64_t v54;
  _BYTE v55[16];
  _QWORD v56[6];

  v56[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v56[0] = objc_opt_class();
  v56[1] = objc_opt_class();
  v56[2] = objc_opt_class();
  v56[3] = objc_opt_class();
  v56[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("meshProperties"));
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  cva::DictionaryHandler::DictionaryHandler((cva::DictionaryHandler *)v55, v7);
  if (cva::DictionaryHandler::hasKey((cva::DictionaryHandler *)v55, "V")
    && (cva::DictionaryHandler::hasKey((cva::DictionaryHandler *)v55, "F") & 1) != 0)
  {
    v8 = operator new();
    *(_OWORD *)(v8 + 144) = 0u;
    *(_OWORD *)(v8 + 176) = 0u;
    *(_OWORD *)(v8 + 192) = 0u;
    *(_OWORD *)(v8 + 160) = 0u;
    *(_OWORD *)(v8 + 112) = 0u;
    *(_OWORD *)(v8 + 128) = 0u;
    *(_OWORD *)(v8 + 80) = 0u;
    *(_OWORD *)(v8 + 96) = 0u;
    *(_OWORD *)(v8 + 48) = 0u;
    *(_OWORD *)(v8 + 64) = 0u;
    *(_OWORD *)(v8 + 16) = 0u;
    *(_OWORD *)(v8 + 32) = 0u;
    *(_OWORD *)v8 = 0u;
    cva::DictionaryHandler::item((cva::DictionaryHandler *)v55, "V");
    cva::ItemHandler::getMatrix<float>();
    v9 = *(void **)v8;
    v10 = *(_QWORD *)(v8 + 8);
    v11 = v53;
    *(_QWORD *)v8 = *(_QWORD *)buf;
    *(_QWORD *)(v8 + 8) = v11;
    *(_QWORD *)buf = v9;
    v53 = v10;
    *(_DWORD *)(v8 + 16) = HIDWORD(v54);
    v54 = 0;
    free(v9);
    cva::ItemHandler::~ItemHandler((cva::ItemHandler *)v51);
    cva::DictionaryHandler::item((cva::DictionaryHandler *)v55, "F");
    cva::ItemHandler::getMatrix<int>();
    v12 = (uint64_t *)(v8 + 24);
    v13 = v54;
    if ((_DWORD)v54 != 3 || (v14 = HIDWORD(v54), HIDWORD(v54) != *(_DWORD *)(v8 + 40)))
    {
      v15 = HIDWORD(v54);
      if (*(_QWORD *)buf == *v12)
      {
        v23 = (4 * (HIDWORD(v54) * v54) + 31) & 0x7FFFFFFE0;
        v50[0] = 0;
        malloc_type_posix_memalign(v50, 0x20uLL, v23, 0x49090899uLL);
        v24 = v50[0];
        v25 = HIDWORD(v54);
        if (HIDWORD(v54))
        {
          v26 = *(int **)buf;
          v27 = 4 * (3 * HIDWORD(v54));
          v28 = v50[0];
          do
          {
            v29 = *v26++;
            *v28++ = v29;
            v27 -= 4;
          }
          while (v27);
        }
        v30 = *(void **)(v8 + 24);
        *(_QWORD *)(v8 + 24) = v24;
        *(_QWORD *)(v8 + 32) = v23 >> 2;
        *(_DWORD *)(v8 + 40) = v25;
        free(v30);
        v16 = *(char **)buf;
        goto LABEL_19;
      }
      *(_DWORD *)(v8 + 40) = HIDWORD(v54);
      cva::MatrixData<float,0ul,0ul,false>::reserve(v8 + 24, (v15 * v13));
      v14 = *(_DWORD *)(v8 + 40);
    }
    v16 = *(char **)buf;
    if (v14)
    {
      v17 = 0;
      v18 = *v12;
      v19 = 4 * (3 * v14);
      do
      {
        *(_DWORD *)(v18 + v17) = *(_DWORD *)&v16[v17];
        v17 += 4;
      }
      while (v19 != v17);
    }
LABEL_19:
    free(v16);
    cva::ItemHandler::~ItemHandler((cva::ItemHandler *)v51);
    if (cva::DictionaryHandler::hasKey((cva::DictionaryHandler *)v55, "VT"))
    {
      cva::DictionaryHandler::item((cva::DictionaryHandler *)v55, "VT");
      cva::ItemHandler::getMatrix<float>();
      v31 = *(int **)buf;
      if (*(_BYTE *)(v8 + 72))
      {
        v32 = *(void **)(v8 + 48);
        v33 = *(_QWORD *)(v8 + 56);
        *(_QWORD *)buf = v32;
        v34 = v53;
        *(_QWORD *)(v8 + 48) = v31;
        *(_QWORD *)(v8 + 56) = v34;
        v35 = HIDWORD(v54);
      }
      else
      {
        v32 = 0;
        v33 = 0;
        *(_QWORD *)buf = 0;
        v36 = v53;
        *(_QWORD *)(v8 + 48) = v31;
        *(_QWORD *)(v8 + 56) = v36;
        v35 = HIDWORD(v54);
        *(_BYTE *)(v8 + 72) = 1;
      }
      *(_DWORD *)(v8 + 64) = v35;
      v53 = v33;
      v54 = 0;
      free(v32);
      cva::ItemHandler::~ItemHandler((cva::ItemHandler *)v51);
    }
    if (cva::DictionaryHandler::hasKey((cva::DictionaryHandler *)v55, "VN"))
    {
      cva::DictionaryHandler::item((cva::DictionaryHandler *)v55, "VN");
      cva::ItemHandler::getMatrix<float>();
      v37 = *(int **)buf;
      if (*(_BYTE *)(v8 + 104))
      {
        v38 = *(void **)(v8 + 80);
        v39 = *(_QWORD *)(v8 + 88);
        *(_QWORD *)buf = v38;
        v40 = v53;
        *(_QWORD *)(v8 + 80) = v37;
        *(_QWORD *)(v8 + 88) = v40;
        v41 = HIDWORD(v54);
      }
      else
      {
        v38 = 0;
        v39 = 0;
        *(_QWORD *)buf = 0;
        v42 = v53;
        *(_QWORD *)(v8 + 80) = v37;
        *(_QWORD *)(v8 + 88) = v42;
        v41 = HIDWORD(v54);
        *(_BYTE *)(v8 + 104) = 1;
      }
      *(_DWORD *)(v8 + 96) = v41;
      v53 = v39;
      v54 = 0;
      free(v38);
      cva::ItemHandler::~ItemHandler((cva::ItemHandler *)v51);
    }
    if (cva::DictionaryHandler::hasKey((cva::DictionaryHandler *)v55, "VC"))
    {
      cva::DictionaryHandler::item((cva::DictionaryHandler *)v55, "VC");
      cva::ItemHandler::getMatrix<float>();
      v43 = *(int **)buf;
      if (*(_BYTE *)(v8 + 136))
      {
        v44 = *(void **)(v8 + 112);
        v45 = *(_QWORD *)(v8 + 120);
        *(_QWORD *)buf = v44;
        v46 = v53;
        *(_QWORD *)(v8 + 112) = v43;
        *(_QWORD *)(v8 + 120) = v46;
        v47 = HIDWORD(v54);
      }
      else
      {
        v44 = 0;
        v45 = 0;
        *(_QWORD *)buf = 0;
        v48 = v53;
        *(_QWORD *)(v8 + 112) = v43;
        *(_QWORD *)(v8 + 120) = v48;
        v47 = HIDWORD(v54);
        *(_BYTE *)(v8 + 136) = 1;
      }
      *(_DWORD *)(v8 + 128) = v47;
      v53 = v45;
      v54 = 0;
      free(v44);
      cva::ItemHandler::~ItemHandler((cva::ItemHandler *)v51);
    }
    if (cva::DictionaryHandler::hasKey((cva::DictionaryHandler *)v55, "FT"))
    {
      cva::DictionaryHandler::item((cva::DictionaryHandler *)v55, "FT");
      cva::ItemHandler::getMatrix<int>();
      v51[0] = (int **)buf;
      std::optional<cva::Matrix<unsigned int,3u,0u,false>>::operator=[abi:ne180100]<cva::MatrixUnaryExpr<cva::Matrix<int,0u,0u,false>,cva::detail::CastOp<unsigned int>>,void>(v8 + 144, v51);
      free(*(void **)buf);
      cva::ItemHandler::~ItemHandler((cva::ItemHandler *)v50);
    }
    if (cva::DictionaryHandler::hasKey((cva::DictionaryHandler *)v55, "FN"))
    {
      cva::DictionaryHandler::item((cva::DictionaryHandler *)v55, "FN");
      cva::ItemHandler::getMatrix<int>();
      v51[0] = (int **)buf;
      std::optional<cva::Matrix<unsigned int,3u,0u,false>>::operator=[abi:ne180100]<cva::MatrixUnaryExpr<cva::Matrix<int,0u,0u,false>,cva::detail::CastOp<unsigned int>>,void>(v8 + 176, v51);
      free(*(void **)buf);
      cva::ItemHandler::~ItemHandler((cva::ItemHandler *)v50);
    }
    v49 = -[ObjMeshDataCodable initWithObjMeshDataNoCopy:](self, "initWithObjMeshDataNoCopy:", v8);
    v21 = v49;
    if (v49)
      v49->_freeWhenDone = 1;
    goto LABEL_14;
  }
  __VGLogSharedInstance();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_249CAD000, v20, OS_LOG_TYPE_ERROR, " Required properties : Vertices and Faces, not found in mesh data ", buf, 2u);
  }

  v21 = 0;
LABEL_14:
  cva::DictionaryHandler::~DictionaryHandler((cva::DictionaryHandler *)v55);

  return v21;
}

@end
