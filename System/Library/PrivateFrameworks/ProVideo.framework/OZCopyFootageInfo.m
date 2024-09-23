@implementation OZCopyFootageInfo

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OZCopyFootageInfo;
  -[OZCopyFootageInfo dealloc](&v3, sel_dealloc);
}

+ (void)updateSizes:(id)a3 forceUpdate:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (void *)objc_msgSend(a3, "keyEnumerator", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++)), "updateSize:error:", v4, 0);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
}

- (BOOL)updateSize:(BOOL)a3 error:(id *)a4
{
  void *v7;
  NSOrderedSet *v8;
  BOOL v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[8];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (self->_sizeIsValid && !a3)
    return 1;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", a3);
  self->_sizeInBytes = 0;
  v8 = -[NSURL OZ_imageSequenceURLs](self->_sourceURL, "OZ_imageSequenceURLs");
  if (-[NSOrderedSet count](v8, "count"))
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 1;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __38__OZCopyFootageInfo_updateSize_error___block_invoke;
    v21[3] = &unk_1E65B3230;
    v21[4] = v7;
    v21[5] = &v26;
    v21[6] = &v22;
    v21[7] = a4;
    -[NSOrderedSet enumerateObjectsUsingBlock:](v8, "enumerateObjectsUsingBlock:", v21);
    if (*((_BYTE *)v23 + 24))
    {
      self->_sizeInBytes = v27[3];
      v9 = 1;
      self->_sizeIsValid = 1;
      _Block_object_dispose(&v22, 8);
      _Block_object_dispose(&v26, 8);
      return v9;
    }
    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v26, 8);
    return 0;
  }
  v10 = (void *)objc_msgSend(v7, "OZ_sizeOfItemAtPath:error:", -[NSURL path](self->_sourceURL, "path"), a4);
  if (!v10)
    return 0;
  self->_sizeInBytes = objc_msgSend(v10, "unsignedIntegerValue");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = (void *)-[NSMutableDictionary keyEnumerator](self->_associatedFilesSourceDestPaths, "keyEnumerator", 0);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v30, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(v7, "OZ_sizeOfItemAtPath:error:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), a4);
        if (v15)
          self->_sizeInBytes += objc_msgSend(v15, "unsignedIntegerValue");
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v30, 16);
    }
    while (v12);
  }
  v9 = 1;
  self->_sizeIsValid = 1;
  return v9;
}

uint64_t __38__OZCopyFootageInfo_updateSize_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "OZ_sizeOfItemAtPath:error:", objc_msgSend(a2, "path"), *(_QWORD *)(a1 + 56));
  if (result)
  {
    result = objc_msgSend((id)result, "unsignedIntegerValue");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += result;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

+ (id)fileURLsForNode:(void *)a3
{
  _QWORD *v3;
  unint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  const __CFURL **v7;
  __CFString *v8;
  CFTypeRef *v9;
  void *v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  unint64_t v15;
  OZFootage *v16;
  __CFString *v17;
  __int128 v19;
  const __CFURL *v20;
  CFTypeRef cf;
  __int128 v22;
  CFTypeRef v23;
  CFTypeRef v24;
  _QWORD v25[2];

  v3 = a3;
  v25[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = *((_QWORD *)a3 + 1);
    v22 = xmmword_1B3054BB0;
    if (OZFactory::isKindOfClass(v4, (int32x4_t *)&v22))
    {
      v6 = *(v3 - 25);
      v5 = v3 - 25;
      v7 = (const __CFURL **)(*(uint64_t (**)(_QWORD *))(v6 + 1232))(v5);
      PCURL::getAsFileSystemString(v7, (PCString *)&cf);
      v8 = (__CFString *)PCString::ns_str((PCString *)&cf);
      PCString::~PCString((PCString *)&cf);
      if (-[__CFString length](v8, "length"))
      {
        v9 = (CFTypeRef *)(*(uint64_t (**)(_QWORD *))(*v5 + 1232))(v5);
        v25[0] = (id)CFRetain(*v9);
        return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
      }
      return 0;
    }
    if (v11)
    {
      v12 = v11;
      (*(void (**)(const __CFURL **__return_ptr))(*(_QWORD *)v11 + 1232))(&v20);
      PCURL::getAsFileSystemString(&v20, (PCString *)&cf);
      v13 = (__CFString *)PCString::ns_str((PCString *)&cf);
      PCString::~PCString((PCString *)&cf);
      PCURL::~PCURL((PCURL *)&v20);
      if (!-[__CFString length](v13, "length"))
        return 0;
      (*(void (**)(CFTypeRef *__return_ptr, void *))(*(_QWORD *)v12 + 1232))(&cf, v12);
      v24 = (id)CFRetain(cf);
      v14 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    }
    else
    {
      v15 = v3[1];
      v19 = xmmword_1B3053B10;
      if (OZFactory::isKindOfClass(v15, (int32x4_t *)&v19)
        && (*(unsigned int (**)(_QWORD *))(*(v3 - 25) + 296))(v3 - 25))
      {
        return (id)(*(uint64_t (**)(_QWORD *))(*(v3 - 25) + 888))(v3 - 25);
      }
      v3 = v16;
      if (!v16)
        return v3;
      if ((OZFootage::isInUseByUnreplacedDropZonesOnly(v16, 0) & 1) != 0)
        return 0;
      (*(void (**)(const __CFURL **__return_ptr, _QWORD *))(*v3 + 1232))(&v20, v3);
      PCURL::getAsFileSystemString(&v20, (PCString *)&cf);
      v17 = (__CFString *)PCString::ns_str((PCString *)&cf);
      PCString::~PCString((PCString *)&cf);
      PCURL::~PCURL((PCURL *)&v20);
      if (!-[__CFString length](v17, "length"))
        return 0;
      (*(void (**)(CFTypeRef *__return_ptr, _QWORD *))(*v3 + 1232))(&cf, v3);
      v23 = (id)CFRetain(cf);
      v14 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    }
    v3 = (_QWORD *)v14;
    PCURL::~PCURL((PCURL *)&cf);
  }
  return v3;
}

+ (id)fileURLToFootageInfoMap:(void *)a3 includeUnused:(BOOL)a4 destination:(id)a5
{
  OZScene *v6;
  uint64_t v7;
  unsigned int *v8;
  unsigned int *v9;
  _DWORD *v10;
  _QWORD *v11;
  _QWORD **v12;
  _QWORD *v13;
  _QWORD **v14;
  unsigned int v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  OZCopyFootageInfo *v22;
  uint64_t v23;
  void *v24;
  const PCURL *v25;
  const PCURL *v26;
  __CFString *v27;
  uint64_t v28;
  NSSet *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t m;
  uint64_t v49;
  void *v50;
  _BYTE *v52;
  uint64_t v53;
  _BYTE *v54;
  id obj;
  unsigned int v57;
  void *v58;
  _QWORD v59[7];
  const PCURL *v60;
  const PCURL **v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  PCString v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t *v81;
  _QWORD *v82[2];
  void *__p;
  unsigned int *v84;
  _QWORD *v85;
  uint64_t v86;
  _QWORD *v87;
  char v88;
  _BYTE v89[32];
  int v90;
  _QWORD v91[3];
  char v92;
  _BYTE v93[32];
  int v94;
  const PCURL **v95;
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v58 = 0;
  if (a5)
  {
    v6 = (OZScene *)*((_QWORD *)a3 + 3);
    if (v6)
    {
      v58 = (void *)objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
      v7 = *((_QWORD *)v6 + 151);
      v54 = v93;
      memset(v93, 0, sizeof(v93));
      v94 = 1065353216;
      v91[0] = v7;
      v91[1] = v7;
      v91[2] = (char *)v6 + 1200;
      v92 = 0;
      v52 = v89;
      memset(v89, 0, sizeof(v89));
      v90 = 1065353216;
      v85 = (_QWORD *)((char *)v6 + 1200);
      v86 = v7;
      v87 = (_QWORD *)((char *)v6 + 1200);
      v88 = 0;
      OZScene::unusedSceneNodeFileIDs(v6, (char **)&__p);
      v82[0] = 0;
      v82[1] = 0;
      v81 = (uint64_t *)v82;
      v8 = (unsigned int *)__p;
      v9 = v84;
      while (v8 != v9)
      {
        std::__tree<unsigned int>::__emplace_unique_key_args<unsigned int,unsigned int const&>(&v81, v8, v8);
        ++v8;
      }
      while ((_QWORD *)v91[0] != v85)
      {
        v10 = *(_DWORD **)(v91[0] + 16);
        v57 = v10[20];
        if (a4)
          goto LABEL_18;
        v11 = v82[0];
        if (!v82[0])
          goto LABEL_18;
        v12 = v82;
        do
        {
          v13 = v11;
          v14 = v12;
          v15 = *((_DWORD *)v11 + 7);
          if (v15 >= v57)
            v12 = (_QWORD **)v11;
          else
            ++v11;
          v11 = (_QWORD *)*v11;
        }
        while (v11);
        if (v12 == v82)
          goto LABEL_18;
        if (v15 < v57)
          v13 = v14;
        if (v57 < *((_DWORD *)v13 + 7))
        {
LABEL_18:
          v16 = +[OZCopyFootageInfo fileURLsForNode:](OZCopyFootageInfo, "fileURLsForNode:", v10, v52, v54);
          v17 = v16;
          if (v16)
          {
            v79 = 0u;
            v80 = 0u;
            v77 = 0u;
            v78 = 0u;
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v77, v99, 16);
            if (v18)
            {
              v19 = *(_QWORD *)v78;
              obj = v17;
              do
              {
                for (i = 0; i != v18; ++i)
                {
                  if (*(_QWORD *)v78 != v19)
                    objc_enumerationMutation(obj);
                  v21 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
                  if (objc_msgSend((id)objc_msgSend(v21, "path"), "length"))
                  {
                    v22 = (OZCopyFootageInfo *)objc_msgSend(v58, "objectForKey:", v21);
                    if (!v22)
                    {
                      v22 = objc_alloc_init(OZCopyFootageInfo);
                      -[OZCopyFootageInfo setSourceURL:](v22, "setSourceURL:", v21);
                      v23 = objc_msgSend((id)objc_msgSend(v21, "path"), "lastPathComponent");
                      -[OZCopyFootageInfo setDestinationURL:](v22, "setDestinationURL:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", objc_msgSend(a5, "stringByAppendingPathComponent:", v23)));
                      -[OZCopyFootageInfo setAssociatedFilesSourceDestPaths:](v22, "setAssociatedFilesSourceDestPaths:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"));
                      objc_msgSend(v58, "setObject:forKey:", v22, v21);
                    }
                    if (v10)
                    {
                      if (v24)
                      {
                        (*(void (**)(const PCURL **__return_ptr))(*(_QWORD *)v24 + 1512))(&v60);
                        v25 = v60;
                        v26 = (const PCURL *)v61;
                        while (v25 != v26)
                        {
                          PCURL::PCURL((PCURL *)&v95, v25);
                          PCURL::getAsFileSystemString((const __CFURL **)&v95, &v76);
                          v27 = (__CFString *)PCString::ns_str(&v76);
                          PCString::~PCString(&v76);
                          if (v27)
                          {
                            if (-[__CFString length](v27, "length"))
                            {
                              v28 = objc_msgSend(a5, "stringByAppendingPathComponent:", -[__CFString lastPathComponent](v27, "lastPathComponent"));
                              if ((-[__CFString isEqualToString:](v27, "isEqualToString:", v28) & 1) == 0)
                                -[NSMutableDictionary setObject:forKeyedSubscript:](-[OZCopyFootageInfo associatedFilesSourceDestPaths](v22, "associatedFilesSourceDestPaths"), "setObject:forKeyedSubscript:", v28, v27);
                            }
                          }
                          PCURL::~PCURL((PCURL *)&v95);
                          v25 = (const PCURL *)((char *)v25 + 8);
                        }
                        v95 = &v60;
                        std::vector<PCURL>::__destroy_vector::operator()[abi:ne180100]((void ***)&v95);
                      }
                    }
                    if (-[OZCopyFootageInfo nodeIDs](v22, "nodeIDs"))
                    {
                      v29 = -[OZCopyFootageInfo nodeIDs](v22, "nodeIDs");
                      v30 = -[NSSet setByAddingObject:](v29, "setByAddingObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v57));
                    }
                    else
                    {
                      v30 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v57));
                    }
                    -[OZCopyFootageInfo setNodeIDs:](v22, "setNodeIDs:", v30);
                  }
                }
                v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v99, 16);
              }
              while (v18);
            }
          }
        }
        OZObject::iterator_t<OZSceneNode,false,true,OZObject::defaultValidator>::increment(v91);
      }
      v31 = (void *)objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v32 = (void *)objc_msgSend(v58, "keyEnumerator");
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v72, v98, 16);
      if (v33)
      {
        v34 = *(_QWORD *)v73;
        do
        {
          for (j = 0; j != v33; ++j)
          {
            if (*(_QWORD *)v73 != v34)
              objc_enumerationMutation(v32);
            v36 = (void *)objc_msgSend(v58, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * j), v52);
            v37 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v36, "destinationURL"), "path"), "lastPathComponent");
            v38 = objc_msgSend((id)objc_msgSend(v37, "pathExtension"), "lowercaseString");
            if (v38)
              v37 = (void *)objc_msgSend((id)objc_msgSend(v37, "stringByDeletingPathExtension"), "stringByAppendingPathExtension:", v38);
            v39 = (void *)objc_msgSend(v31, "objectForKey:", v37);
            if (v39)
              objc_msgSend(v39, "addObject:", v36);
            else
              objc_msgSend(v31, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v36), v37);
          }
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v72, v98, 16);
        }
        while (v33);
      }
      v40 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set", v52);
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v41 = (void *)objc_msgSend(v31, "keyEnumerator");
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v68, v97, 16);
      if (v42)
      {
        v43 = *(_QWORD *)v69;
        do
        {
          for (k = 0; k != v42; ++k)
          {
            if (*(_QWORD *)v69 != v43)
              objc_enumerationMutation(v41);
            objc_msgSend(v40, "addObject:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * k));
          }
          v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v68, v97, 16);
        }
        while (v42);
      }
      v67 = 0u;
      v65 = 0u;
      v66 = 0u;
      v64 = 0u;
      v45 = (void *)objc_msgSend(v31, "keyEnumerator");
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v64, v96, 16);
      if (v46)
      {
        v47 = *(_QWORD *)v65;
        do
        {
          for (m = 0; m != v46; ++m)
          {
            if (*(_QWORD *)v65 != v47)
              objc_enumerationMutation(v45);
            v49 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * m);
            v50 = (void *)objc_msgSend(v31, "objectForKey:", v49);
            v60 = 0;
            v61 = &v60;
            v62 = 0x2020000000;
            v63 = 0;
            v59[0] = MEMORY[0x1E0C809B0];
            v59[1] = 3221225472;
            v59[2] = __71__OZCopyFootageInfo_fileURLToFootageInfoMap_includeUnused_destination___block_invoke;
            v59[3] = &unk_1E65B3258;
            v59[5] = v49;
            v59[6] = &v60;
            v59[4] = v40;
            objc_msgSend(v50, "enumerateObjectsUsingBlock:", v59);
            _Block_object_dispose(&v60, 8);
          }
          v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v64, v96, 16);
        }
        while (v46);
      }
      std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)&v81, v82[0]);
      if (__p)
      {
        v84 = (unsigned int *)__p;
        operator delete(__p);
      }
      std::__hash_table<std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::__unordered_map_hasher<OZSceneNode *,std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::hash<OZSceneNode *>,std::equal_to<OZSceneNode *>,true>,std::__unordered_map_equal<OZSceneNode *,std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::equal_to<OZSceneNode *>,std::hash<OZSceneNode *>,true>,std::allocator<std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>>>::~__hash_table(v53);
      std::__hash_table<std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::__unordered_map_hasher<OZSceneNode *,std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::hash<OZSceneNode *>,std::equal_to<OZSceneNode *>,true>,std::__unordered_map_equal<OZSceneNode *,std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::equal_to<OZSceneNode *>,std::hash<OZSceneNode *>,true>,std::allocator<std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>>>::~__hash_table((uint64_t)v54);
    }
  }
  return v58;
}

uint64_t __71__OZCopyFootageInfo_fileURLToFootageInfoMap_includeUnused_destination___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t result;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    while (1)
    {
      v4 = (void *)objc_msgSend(*(id *)(a1 + 40), "stringByDeletingPathExtension");
      v5 = objc_msgSend((id)objc_msgSend(a2, "destinationURL"), "OZ_isImageSequenceURL");
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
      if (v5)
      {
        v8 = objc_msgSend(v6, "stringWithFormat:", CFSTR("(%@)["), v7);
        v9 = objc_msgSend(v4, "rangeOfString:options:", CFSTR("["), 4);
        v11 = objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", v9, v10, v8);
      }
      else
      {
        v11 = objc_msgSend(v4, "stringByAppendingString:", objc_msgSend(v6, "stringWithFormat:", CFSTR(" %@"), v7));
      }
      v12 = (void *)v11;
      v13 = objc_msgSend(*(id *)(a1 + 40), "pathExtension");
      if (v13)
        v12 = (void *)objc_msgSend(v12, "stringByAppendingPathExtension:", v13);
      if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v12) & 1) == 0)
        break;
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    }
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v12);
    result = objc_msgSend(a2, "setDestinationURL:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "destinationURL"), "URLByDeletingLastPathComponent"), "URLByAppendingPathComponent:", v12));
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  return result;
}

+ (unint64_t)fileCount:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)objc_msgSend(a3, "keyEnumerator", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v15;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v15 != v8)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
      v11 = (void *)objc_msgSend(v10, "OZ_imageSequenceURLs");
      if (objc_msgSend(v11, "count"))
        v12 = objc_msgSend(v11, "count");
      else
        v12 = 1;
      v7 += v12
          + objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", v10), "associatedFilesSourceDestPaths"), "allKeys"), "count");
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  }
  while (v6);
  return v7;
}

+ (unint64_t)totalSizeInBytes:(id)a3 forceUpdate:(BOOL)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[OZCopyFootageInfo updateSizes:forceUpdate:](OZCopyFootageInfo, "updateSizes:forceUpdate:", a3, a4);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_msgSend(a3, "keyEnumerator", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v14;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v5);
      v11 = (void *)objc_msgSend(a3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
      if (objc_msgSend(v11, "sizeIsValid"))
        v8 += objc_msgSend(v11, "sizeInBytes");
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  }
  while (v7);
  return v8;
}

+ (void)reconnectFootage:(id)a3 scene:(void *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[6];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      v9 = MEMORY[0x1E0C809B0];
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(a3);
          v11 = (void *)objc_msgSend(a3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10));
          v12 = (void *)objc_msgSend(v11, "nodeIDs");
          v13[0] = v9;
          v13[1] = 3221225472;
          v13[2] = __44__OZCopyFootageInfo_reconnectFootage_scene___block_invoke;
          v13[3] = &unk_1E65B3280;
          v13[4] = v11;
          v13[5] = a4;
          objc_msgSend(v12, "enumerateObjectsUsingBlock:", v13);
          ++v10;
        }
        while (v7 != v10);
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }
  }
}

void __44__OZCopyFootageInfo_reconnectFootage_scene___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *Node;
  unint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  const __CFURL **v7;
  __CFString *v8;
  const void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  const void *v14;
  OZFootage *v15;
  OZFootage *v16;
  __CFString *v17;
  const void *v18;
  PMMediaManager *v19;
  PMMediaManager *Instance;
  PMClip *v21;
  PCString v22;
  PCString v23;
  PCString v24;
  __int128 v25;

  Node = OZScene::getNode(*(OZScene **)(a1 + 40), objc_msgSend(a2, "unsignedIntValue"));
  v4 = Node[1];
  v25 = xmmword_1B3054BB0;
  if (OZFactory::isKindOfClass(v4, (int32x4_t *)&v25))
  {
    v6 = *(Node - 25);
    v5 = Node - 25;
    v7 = (const __CFURL **)(*(uint64_t (**)(_QWORD *))(v6 + 1232))(v5);
    PCURL::getAsFileSystemString(v7, &v24);
    v8 = (__CFString *)PCString::ns_str(&v24);
    PCString::~PCString(&v24);
    v9 = (const void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "destinationURL"), "path");
    if ((-[__CFString isEqualToString:](v8, "isEqualToString:", v9) & 1) != 0)
      return;
    PCURL::PCURL((PCURL *)&v23, v9);
    PCURL::PCURL((PCURL *)&v24, &v23, 0);
    PCString::~PCString(&v23);
    (*(void (**)(_QWORD *, PCString *))(*v5 + 1224))(v5, &v24);
  }
  else
  {
    if (v10)
      (*(void (**)(void *, _QWORD))(*(_QWORD *)v10 + 1488))(v10, *(_QWORD *)(a1 + 32));
    if (v11)
    {
      v12 = v11;
      (*(void (**)(PCString *__return_ptr))(*(_QWORD *)v11 + 1232))(&v24);
      PCURL::getAsFileSystemString((const __CFURL **)&v24, &v23);
      v13 = (__CFString *)PCString::ns_str(&v23);
      PCString::~PCString(&v23);
      v14 = (const void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "destinationURL"), "path");
      if ((-[__CFString isEqualToString:](v13, "isEqualToString:", v14) & 1) == 0)
      {
        PCURL::PCURL((PCURL *)&v22, v14);
        PCURL::PCURL((PCURL *)&v23, &v22, 0);
        PCString::~PCString(&v22);
        (*(void (**)(void *, PCString *))(*(_QWORD *)v12 + 1400))(v12, &v23);
        PCURL::~PCURL((PCURL *)&v23);
      }
    }
    else
    {
      if (!v15)
        return;
      v16 = v15;
      (*(void (**)(PCString *__return_ptr))(*(_QWORD *)v15 + 1232))(&v24);
      PCURL::getFilename((const __CFURL **)&v24, &v23);
      PCURL::getAsFileSystemString((const __CFURL **)&v24, &v22);
      v17 = (__CFString *)PCString::ns_str(&v22);
      PCString::~PCString(&v22);
      v18 = (const void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "destinationURL"), "path");
      if ((-[__CFString isEqualToString:](v17, "isEqualToString:", v18) & 1) == 0)
      {
        PCURL::PCURL((PCURL *)&v21, v18);
        PCURL::PCURL((PCURL *)&v22, (const PCString *)&v21, 0);
        PCString::~PCString((PCString *)&v21);
        v21 = 0;
        Instance = (PMMediaManager *)PMMediaManager::getInstance(v19);
        if (!PMMediaManager::open(Instance, (const PCURL *)&v22, &v21, 0))
          OZFootage::setClipMinimal(v16, v21);
        PCURL::~PCURL((PCURL *)&v22);
      }
      PCString::~PCString(&v23);
    }
  }
  PCURL::~PCURL((PCURL *)&v24);
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (void)setDestinationURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSSet)nodeIDs
{
  return self->_nodeIDs;
}

- (void)setNodeIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (BOOL)sizeIsValid
{
  return self->_sizeIsValid;
}

- (void)setSizeIsValid:(BOOL)a3
{
  self->_sizeIsValid = a3;
}

- (unint64_t)sizeInBytes
{
  return self->_sizeInBytes;
}

- (void)setSizeInBytes:(unint64_t)a3
{
  self->_sizeInBytes = a3;
}

- (NSMutableDictionary)associatedFilesSourceDestPaths
{
  return self->_associatedFilesSourceDestPaths;
}

- (void)setAssociatedFilesSourceDestPaths:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (void)scene
{
  return self->_scene;
}

- (void)setScene:(void *)a3
{
  self->_scene = a3;
}

@end
