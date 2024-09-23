@implementation SAPAStyleSymbolDataStore

+ (id)classDictionaryKey
{
  return CFSTR("PASymbolDataStore");
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5;
  id v6;

  v5 = a5;
  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleSymbolDataStore"), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleSymbolDataStore"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2;

  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleSymbolDataStore"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  id v5;

  if ((unint64_t)(*(_QWORD *)a3 - 324506182) >= 3)
  {
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Bad PASymbolDataStore magic"), 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v5);
  }
  return objc_alloc_init(SAPAStyleSymbolDataStore);
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  void *v25;
  void *v26;
  void *v27;
  SEL v28;
  SAKernelCache *v29;
  SAKernelCache *kernelCache;
  unint64_t v31;
  void *v32;
  void *Property;
  const char *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  const char *v47;
  void *v48;
  id v49;
  const char *v50;
  uint64_t v51;
  id v52;
  const char *v53;
  uint64_t v54;
  int v55;
  SEL v56;
  id v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  const char *v62;
  id v63;
  void *v64;
  const char *v65;
  void *v66;
  id v67;
  uint64_t v68;
  void *v69;
  SASharedCache *v70;
  SASharedCache *sharedCache64Bit;
  unint64_t v72;
  void *v73;
  void *v74;
  const char *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  id v86;
  void *v87;
  const char *v88;
  void *v89;
  id v90;
  const char *v91;
  uint64_t v92;
  id v93;
  const char *v94;
  uint64_t v95;
  int v96;
  SEL v97;
  id v98;
  uint64_t v99;
  void *v100;
  void *v101;
  uint64_t v102;
  const char *v103;
  id v104;
  void *v105;
  const char *v106;
  void *v107;
  id v108;
  uint64_t v109;
  void *v110;
  SASharedCache *v111;
  SASharedCache *sharedCache32Bit;
  id v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  id v118;
  void *v119;
  void *v121;
  id v122;
  id v123;
  id v124;
  id obj;
  id obja;
  void *v127;
  void *v128;
  id selfa;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  _BYTE v138[128];
  _BYTE v139[128];
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v122 = a6;
  v9 = *(_QWORD *)a3 - 324506182;
  if (v9 >= 3)
  {
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Bad PASymbolDataStore magic"), 0);
    v113 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v113);
  }
  v10 = (char *)a3 + qword_1B9CC2B78[v9];
  v11 = *((_QWORD *)a3 + 1);
  if (v11)
  {
    v12 = (void *)objc_opt_class();
    v13 = (void *)objc_opt_class();
    v14 = SASerializableNewMutableDictionaryFromIndexList((uint64_t)v10, v11, v8, v122, v12, v13);
    v15 = *((_QWORD *)a3 + 1);
  }
  else
  {
    v15 = 0;
  }
  v16 = *((_QWORD *)a3 + 2);
  if (v16)
  {
    v17 = &v10[24 * v15];
    v18 = (void *)objc_opt_class();
    v19 = (void *)objc_opt_class();
    SASerializableNewMutableDictionaryOfArraysFromIndexList(v17, v16, v8, v122, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
  if (*(_QWORD *)a3 > 0x13579246uLL)
  {
    v121 = v20;
    if (*(_QWORD *)a3 != 324506183)
    {
      v21 = *((_QWORD *)a3 + 5);
      v22 = (void *)objc_opt_class();
      _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v21, v8, v122, v22, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v23;
      if (v23)
      {
        objc_msgSend(objc_getProperty(v23, v24, 8, 1), "binary");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "uuid");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[SAKernelCache kernelCacheWithUUID:loadAddress:](SAKernelCache, "kernelCacheWithUUID:loadAddress:", v27, objc_msgSend(objc_getProperty(v25, v28, 8, 1), "loadAddress"));
        v29 = (SAKernelCache *)objc_claimAutoreleasedReturnValue();
        kernelCache = self->_kernelCache;
        self->_kernelCache = v29;

      }
    }
    v31 = *((_QWORD *)a3 + 3);
    v32 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v31, v8, v122, v32, 0);
    Property = (void *)objc_claimAutoreleasedReturnValue();
    selfa = Property;
    if (Property)
      Property = objc_getProperty(Property, v34, 8, 1);
    objc_msgSend(Property, "binary");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "uuid");
    v36 = objc_claimAutoreleasedReturnValue();

    v119 = (void *)v36;
    if (v36)
    {
      objc_msgSend(v121, "objectForKeyedSubscript:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (v37 && objc_msgSend(v37, "count"))
      {
        v123 = (id)a3;
        v117 = v8;
        v127 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v38, "count"));
        v134 = 0u;
        v135 = 0u;
        v136 = 0u;
        v137 = 0u;
        v115 = v38;
        obj = v38;
        v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v134, v139, 16);
        if (v39)
        {
          v41 = v39;
          v42 = *(_QWORD *)v135;
          do
          {
            v43 = 0;
            do
            {
              if (*(_QWORD *)v135 != v42)
                objc_enumerationMutation(obj);
              v44 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * v43);
              if (v44)
                v45 = objc_getProperty(*(id *)(*((_QWORD *)&v134 + 1) + 8 * v43), v40, 8, 1);
              else
                v45 = 0;
              objc_msgSend(v45, "binary");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              -[SABinary segmentWithCleanName:](v46, CFSTR("__TEXT"));
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v48)
              {
                +[SASegment segmentWithBinary:name:length:]((uint64_t)SASegment, v46, CFSTR("__TEXT"), objc_msgSend(v46, "length"));
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                -[SABinary addSegment:](v46, v48);
              }
              if (v44)
                v49 = objc_getProperty(v44, v47, 8, 1);
              else
                v49 = 0;
              v51 = objc_msgSend(v49, "loadAddress");
              v52 = selfa;
              if (selfa)
                v52 = objc_getProperty(selfa, v50, 8, 1);
              v54 = objc_msgSend(v52, "loadAddress");
              if (v44)
              {
                v55 = objc_msgSend(objc_getProperty(v44, v53, 8, 1), "isInKernelAddressSpace");
                v57 = objc_getProperty(v44, v56, 8, 1);
              }
              else
              {
                v55 = objc_msgSend(0, "isInKernelAddressSpace");
                v57 = 0;
              }
              v58 = v54 + v51;
              objc_msgSend(v57, "exclave");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              +[SABinaryLoadInfo binaryLoadInfoWithSegment:loadAddress:isInKernelAddressSpace:exclave:](SABinaryLoadInfo, v48, v58, v55, v59);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v127, "addObject:", v60);

              ++v43;
            }
            while (v41 != v43);
            v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v134, v139, 16);
            v41 = v61;
          }
          while (v61);
        }

        if (selfa)
          v63 = objc_getProperty(selfa, v62, 8, 1);
        else
          v63 = 0;
        v8 = v117;
        objc_msgSend(v63, "binary");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "uuid");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        a3 = v123;
        if (selfa)
          v67 = objc_getProperty(selfa, v65, 8, 1);
        else
          v67 = 0;
        v38 = v115;
        v68 = objc_msgSend(v67, "loadAddress");
        v69 = (void *)objc_msgSend(v127, "copy");
        +[SASharedCache sharedCacheWithUUID:slide:binaryLoadInfos:]((uint64_t)SASharedCache, v66, v68, v69);
        v70 = (SASharedCache *)objc_claimAutoreleasedReturnValue();
        sharedCache64Bit = self->_sharedCache64Bit;
        self->_sharedCache64Bit = v70;

      }
    }
    v72 = *((_QWORD *)a3 + 4);
    v73 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v72, v8, v122, v73, 0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v74;
    if (v74)
      v74 = objc_getProperty(v74, v75, 8, 1);
    objc_msgSend(v74, "binary");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "uuid");
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v121;
    if (v78)
    {
      objc_msgSend(v121, "objectForKeyedSubscript:", v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = v79;
      if (v79 && objc_msgSend(v79, "count"))
      {
        v116 = v78;
        v118 = v8;
        v128 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v80, "count"));
        v130 = 0u;
        v131 = 0u;
        v132 = 0u;
        v133 = 0u;
        v114 = v80;
        v124 = v80;
        v81 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v130, v138, 16);
        if (v81)
        {
          v83 = v81;
          obja = *(id *)v131;
          do
          {
            v84 = 0;
            do
            {
              if (*(id *)v131 != obja)
                objc_enumerationMutation(v124);
              v85 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * v84);
              if (v85)
                v86 = objc_getProperty(*(id *)(*((_QWORD *)&v130 + 1) + 8 * v84), v82, 8, 1);
              else
                v86 = 0;
              objc_msgSend(v86, "binary");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              -[SABinary segmentWithCleanName:](v87, CFSTR("__TEXT"));
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v89)
              {
                +[SASegment segmentWithBinary:name:length:]((uint64_t)SASegment, v87, CFSTR("__TEXT"), objc_msgSend(v87, "length"));
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                -[SABinary addSegment:](v87, v89);
              }
              if (v85)
                v90 = objc_getProperty(v85, v88, 8, 1);
              else
                v90 = 0;
              v92 = objc_msgSend(v90, "loadAddress");
              if (v76)
                v93 = objc_getProperty(v76, v91, 8, 1);
              else
                v93 = 0;
              v95 = objc_msgSend(v93, "loadAddress");
              if (v85)
              {
                v96 = objc_msgSend(objc_getProperty(v85, v94, 8, 1), "isInKernelAddressSpace");
                v98 = objc_getProperty(v85, v97, 8, 1);
              }
              else
              {
                v96 = objc_msgSend(0, "isInKernelAddressSpace");
                v98 = 0;
              }
              v99 = v95 + v92;
              objc_msgSend(v98, "exclave");
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              +[SABinaryLoadInfo binaryLoadInfoWithSegment:loadAddress:isInKernelAddressSpace:exclave:](SABinaryLoadInfo, v89, v99, v96, v100);
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v128, "addObject:", v101);

              ++v84;
            }
            while (v83 != v84);
            v102 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v130, v138, 16);
            v83 = v102;
          }
          while (v102);
        }

        if (v76)
          v104 = objc_getProperty(v76, v103, 8, 1);
        else
          v104 = 0;
        objc_msgSend(v104, "binary");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "uuid");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v118;
        if (v76)
          v108 = objc_getProperty(v76, v106, 8, 1);
        else
          v108 = 0;
        v109 = objc_msgSend(v108, "loadAddress");
        v110 = (void *)objc_msgSend(v128, "copy");
        +[SASharedCache sharedCacheWithUUID:slide:binaryLoadInfos:]((uint64_t)SASharedCache, v107, v109, v110);
        v111 = (SASharedCache *)objc_claimAutoreleasedReturnValue();
        sharedCache32Bit = self->_sharedCache32Bit;
        self->_sharedCache32Bit = v111;

        v20 = v121;
        v80 = v114;
        v78 = v116;
      }

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kernelCache, 0);
  objc_storeStrong((id *)&self->_sharedCache32Bit, 0);
  objc_storeStrong((id *)&self->_sharedCache64Bit, 0);
}

@end
