@implementation VMUSymbolStore

- (VMUSymbolStore)initWithSymbolicator:(_CSTypeRef)a3 debugTimer:(id)a4
{
  id v6;
  VMUSymbolStore *v7;
  unint64_t v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)VMUSymbolStore;
  v7 = -[VMUSymbolStore init](&v10, sel_init);
  if (v7)
  {
    v7->_symbolicator._opaque_1 = CSRetain();
    v7->_symbolicator._opaque_2 = v8;
    objc_storeStrong((id *)&v7->_debugTimer, a4);
    v7->_debugStore = 0;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  CSRelease();
  v3.receiver = self;
  v3.super_class = (Class)VMUSymbolStore;
  -[VMUSymbolStore dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VMUSymbolStore)initWithCoder:(id)a3
{
  id v4;
  VMUSymbolStore *v5;
  uint64_t v6;
  NSData *signature;
  NSData *v8;
  unint64_t v9;
  FILE *v10;
  const char *v11;
  size_t v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VMUSymbolStore;
  v5 = -[VMUSymbolStore init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signature"));
    v6 = objc_claimAutoreleasedReturnValue();
    signature = v5->_signature;
    v5->_signature = (NSData *)v6;

    v8 = v5->_signature;
    if (v8)
    {
      v5->_symbolicator._opaque_1 = MEMORY[0x1A85A89E4](v8, 0);
      v5->_symbolicator._opaque_2 = v9;
      if (CSIsNull() && v5->_debugStore)
      {
        v10 = (FILE *)*MEMORY[0x1E0C80C10];
        v11 = "VMUSymbolStore failed to create the symbolicator from signature.\n";
        v12 = 65;
LABEL_8:
        fwrite(v11, v12, 1uLL, v10);
      }
    }
    else if (v5->_debugStore)
    {
      v10 = (FILE *)*MEMORY[0x1E0C80C10];
      v11 = "VMUSymbolStore failed to decode symbolicator signature or it is missing.\n";
      v12 = 73;
      goto LABEL_8;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSData *v5;
  NSData *signature;
  NSData *v7;
  VMUDebugTimer *debugTimer;
  uint64_t v9;
  NSObject *v10;
  os_signpost_id_t v11;
  VMUDebugTimer *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSData *v15;
  NSData *v16;
  VMUDebugTimer *v17;
  uint64_t v18;
  NSObject *v19;
  os_signpost_id_t v20;
  uint8_t v21[16];
  uint8_t v22[16];
  uint8_t buf[16];

  v4 = a3;
  if (self->_resymbolicatedSuccessfully && self->_signature)
  {
    -[VMUSymbolStore _createResymbolicatedSignature](self, "_createResymbolicatedSignature");
    v5 = (NSData *)objc_claimAutoreleasedReturnValue();
    signature = self->_signature;
    self->_signature = v5;

  }
  v7 = self->_signature;
  if (!v7)
  {
    debugTimer = self->_debugTimer;
    if (debugTimer)
    {
      v9 = -[VMUDebugTimer signpostID](debugTimer, "signpostID");
      debugTimer = self->_debugTimer;
      if (v9)
      {
        -[VMUDebugTimer logHandle](debugTimer, "logHandle");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
        if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v10, OS_SIGNPOST_INTERVAL_END, v11, "VMUSymbolStore", ", buf, 2u);
        }

        debugTimer = self->_debugTimer;
      }
    }
    -[VMUDebugTimer endEvent:](debugTimer, "endEvent:", "VMUSymbolStore");
    -[VMUDebugTimer startWithCategory:message:](self->_debugTimer, "startWithCategory:message:", "VMUSymbolStore", "creating symbolicator signature");
    v12 = self->_debugTimer;
    if (v12)
    {
      -[VMUDebugTimer logHandle](v12, "logHandle");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
      {
        *(_WORD *)v22 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4D79000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v14, "VMUSymbolStore", "creating symbolicator signature", v22, 2u);
      }

    }
    -[VMUSymbolStore _createSymbolicatorSignature](self, "_createSymbolicatorSignature");
    v15 = (NSData *)objc_claimAutoreleasedReturnValue();
    v16 = self->_signature;
    self->_signature = v15;

    v17 = self->_debugTimer;
    if (v17)
    {
      v18 = -[VMUDebugTimer signpostID](v17, "signpostID");
      v17 = self->_debugTimer;
      if (v18)
      {
        -[VMUDebugTimer logHandle](v17, "logHandle");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = -[VMUDebugTimer signpostID](self->_debugTimer, "signpostID");
        if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
        {
          *(_WORD *)v21 = 0;
          _os_signpost_emit_with_name_impl(&dword_1A4D79000, v19, OS_SIGNPOST_INTERVAL_END, v20, "VMUSymbolStore", ", v21, 2u);
        }

        v17 = self->_debugTimer;
      }
    }
    -[VMUDebugTimer endEvent:](v17, "endEvent:", "VMUSymbolStore");
    v7 = self->_signature;
  }
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("signature"));

}

- (void)addAddress:(unint64_t)a3 origin:(int)a4
{
  BOOL v6;
  BOOL v7;
  unint64_t v8;

  v8 = a3;
  if (a3)
  {
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long &>((uint64_t)&self->_addressesTracker, &v8, &v8);
    if (self->_debugStore)
    {
      v6 = a4 >= 4;
      v7 = a4 == 4;
    }
    else
    {
      v6 = 1;
      v7 = 0;
    }
    if (v7 || !v6)
      ++*(&self->backtraceSample + a4);
  }
}

- (void)addBacktrace:(id)a3 origin:(int)a4
{
  uint64_t v4;
  unint64_t i;
  id v7;

  v4 = *(_QWORD *)&a4;
  v7 = a3;
  for (i = 0; i < objc_msgSend(v7, "backtraceLength"); ++i)
    -[VMUSymbolStore addAddress:origin:](self, "addAddress:origin:", *(_QWORD *)(objc_msgSend(v7, "backtrace") + 8 * i), v4);

}

- (void)_groupAddressTrackerByUuid
{
  _QWORD *next;
  unordered_map<std::string, std::unordered_set<unsigned long long>, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, std::unordered_set<unsigned long long>>>> *p_addressesGroupedByUuid;
  unsigned __int8 *v4;
  void *__p[2];
  char v6;
  unint64_t v7;
  void **v8;
  _CSTypeRef v9;

  next = self->_addressesTracker.__table_.__p1_.__value_.__next_;
  if (next)
  {
    p_addressesGroupedByUuid = &self->_addressesGroupedByUuid;
    do
    {
      v7 = next[2];
      v9._opaque_1 = CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
      _uuidStringForOwner(v9, __p);
      v8 = __p;
      v4 = std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_addressesGroupedByUuid, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v8);
      std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long &>((uint64_t)(v4 + 40), &v7, &v7);
      if (v6 < 0)
        operator delete(__p[0]);
      next = (_QWORD *)*next;
    }
    while (next);
  }
}

- (id)_createSymbolicatorSignature
{
  void *Signature;
  _QWORD v5[6];
  void *__p;
  void *v7;
  uint64_t v8;

  -[VMUSymbolStore _groupAddressTrackerByUuid](self, "_groupAddressTrackerByUuid");
  if (self->_debugStore)
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "Number of addresses sent to VMUSymbolStore by client classes:\nFor backtrace sample: %zu\nFor binary sections: %zu\nFor global variables: %zu\nFor malloc stack logging: %zu\nFor hex found in node labels: %zu\nTotal unique addresses to be saved to symbolicator signature: %zu\nNumber of UUIDs in the signature: %zu\n", self->backtraceSample, self->binarySection, self->globalVariable, self->mallocStackLogging, self->hexFromLabels, self->_addressesTracker.__table_.__p2_.__value_, self->_addressesGroupedByUuid.__table_.__p2_.__value_);
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x4812000000;
  v5[3] = __Block_byref_object_copy__1;
  v5[4] = __Block_byref_object_dispose__1;
  v5[5] = &unk_1A4E39779;
  __p = 0;
  v7 = 0;
  v8 = 0;
  CSSymbolicatorForeachSymbolOwnerAtTime();
  CSSymbolicatorCreateWithSymbolOwners();
  Signature = (void *)CSSymbolicatorCreateSignature();
  CSRelease();
  _Block_object_dispose(v5, 8);
  if (__p)
  {
    v7 = __p;
    operator delete(__p);
  }
  return Signature;
}

void __46__VMUSymbolStore__createSymbolicatorSignature__block_invoke(uint64_t a1, _CSTypeRef a2)
{
  unint64_t opaque_2;
  unint64_t opaque_1;
  unsigned __int8 *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  FILE *v9;
  const char *Name;
  const char *v11;
  _QWORD *v12;
  uint64_t *v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t *v22;
  char *v23;
  _BYTE v24[40];
  _BYTE v25[40];
  void *v26[2];
  char v27;

  opaque_2 = a2._opaque_2;
  opaque_1 = a2._opaque_1;
  _uuidStringForOwner(a2, v26);
  v5 = std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::find<std::string>((_QWORD *)(*(_QWORD *)(a1 + 32) + 16), (unsigned __int8 *)v26);
  if (v5)
  {
    std::unordered_set<unsigned long long>::unordered_set((uint64_t)v25, (uint64_t)(v5 + 40));
    std::unordered_set<unsigned long long>::unordered_set((uint64_t)v24, (uint64_t)v25);
    v6 = _sparsifySymbolOwner(opaque_1, opaque_2, (uint64_t)v24);
    v8 = v7;
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)v24);
    if ((CSIsNull() & 1) != 0)
    {
      if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 120))
      {
        v9 = (FILE *)*MEMORY[0x1E0C80C10];
        Name = (const char *)CSSymbolOwnerGetName();
        v11 = (const char *)v26;
        if (v27 < 0)
          v11 = (const char *)v26[0];
        fprintf(v9, "VMUSymbolStore failed to create a sparse version of symbol owner '%s' with UUID: %s \n", Name, v11);
      }
    }
    else
    {
      v12 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
      v13 = (uint64_t *)v12[7];
      v14 = v12[8];
      if ((unint64_t)v13 >= v14)
      {
        v16 = (uint64_t *)v12[6];
        v17 = ((char *)v13 - (char *)v16) >> 4;
        v18 = v17 + 1;
        if ((unint64_t)(v17 + 1) >> 60)
          std::vector<_CSTypeRef>::__throw_length_error[abi:ne180100]();
        v19 = v14 - (_QWORD)v16;
        if (v19 >> 3 > v18)
          v18 = v19 >> 3;
        if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0)
          v20 = 0xFFFFFFFFFFFFFFFLL;
        else
          v20 = v18;
        if (v20)
        {
          v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSTypeRef>>((uint64_t)(v12 + 8), v20);
          v16 = (uint64_t *)v12[6];
          v13 = (uint64_t *)v12[7];
        }
        else
        {
          v21 = 0;
        }
        v22 = (uint64_t *)&v21[16 * v17];
        v23 = &v21[16 * v20];
        *v22 = v6;
        v22[1] = v8;
        v15 = v22 + 2;
        if (v13 != v16)
        {
          do
          {
            *((_OWORD *)v22 - 1) = *((_OWORD *)v13 - 1);
            v22 -= 2;
            v13 -= 2;
          }
          while (v13 != v16);
          v16 = (uint64_t *)v12[6];
        }
        v12[6] = v22;
        v12[7] = v15;
        v12[8] = v23;
        if (v16)
          operator delete(v16);
      }
      else
      {
        *v13 = v6;
        v13[1] = v8;
        v15 = v13 + 2;
      }
      v12[7] = v15;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)v25);
  }
  if (v27 < 0)
    operator delete(v26[0]);
}

- (id)_createResymbolicatedSignature
{
  void *Signature;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1;
  CSSymbolicatorForeachSymbolOwnerAtTime();
  if (self->_debugStore && !*((_BYTE *)v6 + 24))
    fwrite("VMUSymbolStore failed to sparsify some of resymbolicated symbol owners.\n", 0x48uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
  Signature = (void *)CSSymbolicatorCreateSignature();
  _Block_object_dispose(&v5, 8);
  return Signature;
}

void __48__VMUSymbolStore__createResymbolicatedSignature__block_invoke(uint64_t a1, _CSTypeRef a2)
{
  unint64_t opaque_2;
  unint64_t opaque_1;
  unsigned __int8 *v5;
  void *v6;
  void **v7;
  void *v8;
  void *v9;
  _BYTE v10[40];
  _BYTE v11[40];
  void *v12[2];
  char v13;

  opaque_2 = a2._opaque_2;
  opaque_1 = a2._opaque_1;
  _uuidStringForOwner(a2, v12);
  v5 = std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::find<std::string>((_QWORD *)(*(_QWORD *)(a1 + 32) + 16), (unsigned __int8 *)v12);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  if (v13 >= 0)
    v7 = v12;
  else
    v7 = (void **)v12[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

    if (v5)
    {
      std::unordered_set<unsigned long long>::unordered_set((uint64_t)v11, (uint64_t)(v5 + 40));
      std::unordered_set<unsigned long long>::unordered_set((uint64_t)v10, (uint64_t)v11);
      _sparsifySymbolOwner(opaque_1, opaque_2, (uint64_t)v10);
      std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)v10);
      if (CSIsNull())
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)v11);
    }
  }
  else
  {

  }
  if (v13 < 0)
    operator delete(v12[0]);
}

- (BOOL)resymbolicateWithDsymPath:(id)a3 libraryNames:(id)a4 all:(BOOL)a5 progress:(id)a6 showDebugInfo:(BOOL)a7 error:(id *)a8
{
  _BOOL4 v11;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *resymbolicationUUIDs;
  id WeakRetained;
  void *v21;
  id v22;
  void *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  id v27;
  __CFString *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, _CSTypeRef);
  void *v41;
  VMUSymbolStore *v42;
  __CFString *v43;
  _QWORD v44[5];
  uint64_t v45;
  const __CFString *v46;
  uint64_t v47;
  const __CFString *v48;
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  _QWORD v52[3];

  v11 = a5;
  v52[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = v16;
  self->_debugStore = a7;
  if (v14 && v16)
  {

    v17 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  resymbolicationUUIDs = self->_resymbolicationUUIDs;
  self->_resymbolicationUUIDs = v18;

  if (self->_signature)
  {
    if (CSSymbolicatorIsKernelSymbolicator())
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_graph);
      objc_msgSend(WeakRetained, "stackLogReader");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v22 = objc_loadWeakRetained((id *)&self->_graph);
        objc_msgSend(v22, "stackLogReader");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __90__VMUSymbolStore_resymbolicateWithDsymPath_libraryNames_all_progress_showDebugInfo_error___block_invoke;
        v44[3] = &unk_1E4E01250;
        v44[4] = self;
        objc_msgSend(v23, "enumerateUniquingTable:", v44);

        -[VMUSymbolStore _groupAddressTrackerByUuid](self, "_groupAddressTrackerByUuid");
      }
    }
    -[VMUSymbolStore _extractAddressesFromSymbolicator](self, "_extractAddressesFromSymbolicator");
  }
  else
  {
    -[VMUSymbolStore _groupAddressTrackerByUuid](self, "_groupAddressTrackerByUuid");
  }
  if (self->_addressesGroupedByUuid.__table_.__p2_.__value_)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      if (!-[VMUSymbolStore _readContentsOfDsymFile:error:](self, "_readContentsOfDsymFile:error:", v14, a8))
        goto LABEL_31;
    }
    else if (v15)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v15);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      v28 = v24;
      CSSymbolicatorForeachSymbolOwnerAtTime();
      if (!-[__CFString count](v28, "count"))
      {
        if (a8)
        {
          v36 = (void *)MEMORY[0x1E0CB35C8];
          v49 = *MEMORY[0x1E0CB2D50];
          v50 = CFSTR("No matching libraries found in this memgraph");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("Memgraph Resymbolication Error"), 3, v37);
          *a8 = (id)objc_claimAutoreleasedReturnValue();

        }
        LOBYTE(a8) = 0;
        v24 = v28;
        goto LABEL_32;
      }

    }
    else if (v11)
    {
      v29 = (void *)MEMORY[0x1A85A9758]();
      v38 = MEMORY[0x1E0C809B0];
      v39 = 3221225472;
      v40 = __90__VMUSymbolStore_resymbolicateWithDsymPath_libraryNames_all_progress_showDebugInfo_error___block_invoke_3;
      v41 = &unk_1E4E012A0;
      v42 = self;
      v43 = v24;
      CSSymbolicatorForeachSymbolOwnerAtTime();

      objc_autoreleasePoolPop(v29);
    }
    if (-[__CFString count](v24, "count", v38, v39, v40, v41, v42)
      && !-[VMUSymbolStore _getDsymPathsForUUIDs:andReportProgress:](self, "_getDsymPathsForUUIDs:andReportProgress:", v24, v17))
    {
      if (!a8)
        goto LABEL_32;
      v33 = (void *)MEMORY[0x1E0CB35C8];
      v47 = *MEMORY[0x1E0CB2D50];
      v48 = CFSTR("No dSYMs were found");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("Memgraph Resymbolication Error"), 4, v34);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[VMUSymbolStore _flagSymbolOwnersForResymbolication](self, "_flagSymbolOwnersForResymbolication");
      if (-[VMUSymbolStore _refillSymbolOwnersWithDataAndReportProgress:](self, "_refillSymbolOwnersWithDataAndReportProgress:", v17))
      {
        v30 = objc_loadWeakRetained((id *)&self->_graph);
        objc_msgSend(v30, "resymbolicatePrivateMaps");

        LOBYTE(a8) = 1;
        self->_resymbolicatedSuccessfully = 1;
LABEL_32:

        goto LABEL_33;
      }
      if (!a8)
        goto LABEL_32;
      v31 = (void *)MEMORY[0x1E0CB35C8];
      v45 = *MEMORY[0x1E0CB2D50];
      v46 = CFSTR("CoreSymbolication failed to resymbolicate all symbol owners");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("Memgraph Resymbolication Error"), 5, v32);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_31:
    LOBYTE(a8) = 0;
    goto LABEL_32;
  }
  if (a8)
  {
    v24 = CFSTR("Nothing to symbolicate. All addresses in the memgraph are already symbolicated.");
    if (os_variant_has_internal_content())
    {
      objc_msgSend(CFSTR("Nothing to symbolicate. All addresses in the memgraph are already symbolicated."), "stringByAppendingString:", CFSTR("\n\nIf after processing this memgraph with other cli tools you still see non-symbolicated addresses for some binary images, please file a Radar to 'Symbolication | Xcode' and attach the memgraph and the non-symbolicated output of interest."));
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v51 = *MEMORY[0x1E0CB2D50];
    v52[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("Memgraph Resymbolication Error"), 0, v26);
    *a8 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_31;
  }
LABEL_33:

  return (char)a8;
}

uint64_t __90__VMUSymbolStore_resymbolicateWithDsymPath_libraryNames_all_progress_showDebugInfo_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAddress:origin:", a2, 3);
}

void __90__VMUSymbolStore_resymbolicateWithDsymPath_libraryNames_all_progress_showDebugInfo_error___block_invoke_2(_QWORD *a1, unint64_t a2, unint64_t a3)
{
  uint64_t Name;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void **v11;
  void *v12;
  void *__p[2];
  char v14;
  _CSTypeRef v15;

  Name = CSSymbolOwnerGetName();
  v7 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Name);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "containsObject:", v8);

  if ((_DWORD)v7)
  {
    v15._opaque_1 = a2;
    v15._opaque_2 = a3;
    _uuidStringForOwner(v15, __p);
    if (std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::find<std::string>((_QWORD *)(a1[5] + 16), (unsigned __int8 *)__p))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Name);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)a1[6];
      if (v14 >= 0)
        v11 = __p;
      else
        v11 = (void **)__p[0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v12);

    }
    if (v14 < 0)
      operator delete(__p[0]);
  }
}

void __90__VMUSymbolStore_resymbolicateWithDsymPath_libraryNames_all_progress_showDebugInfo_error___block_invoke_3(uint64_t a1, _CSTypeRef a2)
{
  void *v3;
  void *v4;
  void **v5;
  void *v6;
  void *__p[2];
  char v8;

  _uuidStringForOwner(a2, __p);
  if (std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::find<std::string>((_QWORD *)(*(_QWORD *)(a1 + 32) + 16), (unsigned __int8 *)__p))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", CSSymbolOwnerGetName());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 40);
    if (v8 >= 0)
      v5 = __p;
    else
      v5 = (void **)__p[0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, v6);

  }
  if (v8 < 0)
    operator delete(__p[0]);
}

- (void)_extractAddressesFromSymbolicator
{
  CSSymbolicatorForeachSymbolOwnerAtTime();
}

void __51__VMUSymbolStore__extractAddressesFromSymbolicator__block_invoke(int a1, _CSTypeRef a2)
{
  std::string __p;
  std::string v3;

  _uuidStringForOwner(a2, &v3);
  if (SHIBYTE(v3.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, v3.__r_.__value_.__l.__data_, v3.__r_.__value_.__l.__size_);
  else
    __p = v3;
  CSSymbolOwnerForeachSymbol();
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v3.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v3.__r_.__value_.__l.__data_);
}

_QWORD *__51__VMUSymbolStore__extractAddressesFromSymbolicator__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  unsigned __int8 *v3;
  unint64_t Range;
  __int128 *v6;

  Range = CSSymbolGetRange();
  v2 = *(_QWORD *)(a1 + 32) + 16;
  v6 = (__int128 *)(a1 + 40);
  v3 = std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v2, (unsigned __int8 *)(a1 + 40), (uint64_t)&std::piecewise_construct, &v6);
  return std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long &>((uint64_t)(v3 + 40), &Range, &Range);
}

- (BOOL)_readContentsOfDsymFile:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  BOOL v22;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *context;
  id v31;
  id v32;
  void *v33;
  id obj;
  void *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  _BYTE v56[128];
  uint64_t v57;
  _QWORD v58[3];

  v58[1] = *MEMORY[0x1E0C80C00];
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__32;
  v50 = __Block_byref_object_dispose__33;
  v51 = 0;
  v31 = a3;
  objc_msgSend(v31, "stringByAppendingString:", CFSTR("/Contents/Resources/DWARF/"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  objc_msgSend(v4, "subpathsOfDirectoryAtPath:error:", v36, &v45);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v45;

  if (!v33 || !objc_msgSend(v33, "count"))
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    if (v32)
    {
      objc_msgSend(v32, "localizedDescription");
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = &stru_1E4E04720;
    }
    objc_msgSend(v18, "stringWithFormat:", CFSTR("Failed to find the binary in the dSYM: '%@'. %@\n"), v31, v19);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)

    if (a4)
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v57 = *MEMORY[0x1E0CB2D50];
      v58[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, &v57, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("Memgraph Resymbolication Error"), 1, v21);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_23;
  }
  context = (void *)MEMORY[0x1A85A9758]();
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v33;
  v5 = 0;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v56, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v42;
LABEL_5:
    v8 = 0;
    while (1)
    {
      v9 = v5;
      if (*(_QWORD *)v42 != v7)
        objc_enumerationMutation(obj);
      objc_msgSend(v36, "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v8));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0;
      v38 = &v37;
      v39 = 0x2020000000;
      v40 = 0;
      v11 = objc_retainAutorelease(v10);
      objc_msgSend(v11, "UTF8String");
      v12 = v11;
      CSSymbolicatorForeachSymbolicatorWithPath();
      v13 = v38[3];
      if (!v13)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to read symbol data from the dSYM: '%@'."), v12);
        v14 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v14;
      }
      v15 = v13 == 0;

      v5 = v9;
      _Block_object_dispose(&v37, 8);

      if (v15)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v56, 16);
        if (v6)
          goto LABEL_5;
        break;
      }
    }
  }

  objc_autoreleasePoolPop(context);
  if (v5)
  {
    if (a4)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v54 = *MEMORY[0x1E0CB2D50];
      v55 = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("Memgraph Resymbolication Error"), 2, v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_23:
    v22 = 0;
    goto LABEL_24;
  }
  v24 = -[NSMutableDictionary count](self->_resymbolicationUUIDs, "count");
  v5 = 0;
  if (a4 && !v24)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Nothing to symbolicate. This dSYM does not contain symbols for '%@' binary. For more information, please compare the UUIDs."), v47[5]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_variant_has_internal_content())
    {
      objc_msgSend(v25, "stringByAppendingFormat:", CFSTR("\n\nIf after processing this memgraph with other cli tools and verifying the UUIDs you still see non-symbolicated addresses for '%@', please file a Radar to 'Symbolication | Xcode' and attach the memgraph, the dSYM and the non-symbolicated output of interest."), v47[5]);
      v26 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v26;
    }
    else
    {
      v5 = v25;
    }
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v52 = *MEMORY[0x1E0CB2D50];
    v53 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("Memgraph Resymbolication Error"), 0, v28);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  v22 = -[NSMutableDictionary count](self->_resymbolicationUUIDs, "count") != 0;
LABEL_24:

  _Block_object_dispose(&v46, 8);
  return v22;
}

void __48__VMUSymbolStore__readContentsOfDsymFile_error___block_invoke(uint64_t a1)
{
  id v1;
  __int128 v2;

  v2 = *(_OWORD *)(a1 + 40);
  v1 = (id)v2;
  CSSymbolicatorForeachSymbolOwnerAtTime();

}

void __48__VMUSymbolStore__readContentsOfDsymFile_error___block_invoke_2(_QWORD *a1, unint64_t a2, unint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void **v11;
  void *v12;
  void *__p[2];
  char v14;
  _CSTypeRef v15;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", CSSymbolOwnerGetName());
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  ++*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
  v15._opaque_1 = a2;
  v15._opaque_2 = a3;
  _uuidStringForOwner(v15, __p);
  if (std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::find<std::string>((_QWORD *)(a1[4] + 16), (unsigned __int8 *)__p))
  {
    v9 = a1[5];
    v10 = *(void **)(a1[4] + 112);
    if (v14 >= 0)
      v11 = __p;
    else
      v11 = (void **)__p[0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v12);

  }
  if (v14 < 0)
    operator delete(__p[0]);
}

- (BOOL)_getDsymPathsForUUIDs:(id)a3 andReportProgress:(id)a4
{
  return -[NSMutableDictionary count](self->_resymbolicationUUIDs, "count", a3, a4) != 0;
}

- (void)_flagSymbolOwnersForResymbolication
{
  void *v2;

  v2 = (void *)MEMORY[0x1A85A9758](self, a2);
  CSSymbolicatorForeachSymbolOwnerAtTime();
  objc_autoreleasePoolPop(v2);
}

void __53__VMUSymbolStore__flagSymbolOwnersForResymbolication__block_invoke(uint64_t a1, _CSTypeRef a2)
{
  void *v3;
  void **v4;
  void *v5;
  void *v6;
  void *__p[2];
  char v8;

  _uuidStringForOwner(a2, __p);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  if (v8 >= 0)
    v4 = __p;
  else
    v4 = (void **)__p[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    CSSymbolOwnerSetPathForSymbolication();
  }

  if (v8 < 0)
    operator delete(__p[0]);
}

- (BOOL)_refillSymbolOwnersWithDataAndReportProgress:(id)a3
{
  return 0;
}

- (VMUProcessObjectGraph)graph
{
  return (VMUProcessObjectGraph *)objc_loadWeakRetained((id *)&self->_graph);
}

- (void)setGraph:(id)a3
{
  objc_storeWeak((id *)&self->_graph, a3);
}

- (_CSTypeRef)symbolicator
{
  unint64_t opaque_2;
  unint64_t opaque_1;
  _CSTypeRef result;

  opaque_2 = self->_symbolicator._opaque_2;
  opaque_1 = self->_symbolicator._opaque_1;
  result._opaque_2 = opaque_2;
  result._opaque_1 = opaque_1;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_graph);
  objc_storeStrong((id *)&self->_resymbolicationUUIDs, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)&self->_addressesTracker);
  std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::~__hash_table((uint64_t)&self->_addressesGroupedByUuid);
  objc_storeStrong((id *)&self->_debugTimer, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 12) = 1065353216;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((_DWORD *)self + 22) = 1065353216;
  return self;
}

@end
