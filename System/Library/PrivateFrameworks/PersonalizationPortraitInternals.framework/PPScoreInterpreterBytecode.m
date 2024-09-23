@implementation PPScoreInterpreterBytecode

- (PPScoreInterpreterBytecode)initWithParseRoot:(id)a3 scalarSubscoreCount:(unint64_t)a4 arraySubscoreCount:(unint64_t)a5 objectSubscoreCount:(unint64_t)a6
{
  uint64_t v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 *i;
  uint64_t v17;
  uint64_t j;
  const __CFBitVector *Mutable;
  unint64_t v20;
  void **v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t k;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void ***v32;
  unint64_t v33;
  void **v34;
  void **v35;
  unint64_t v36;
  int v37;
  unint64_t v38;
  _QWORD *v39;
  void *v40;
  int64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  id v46;
  id obj;
  void ****v48;
  const __CFBitVector *bv;
  const __CFBitVector *v50;
  void *v51;
  id v52;
  char *v53;
  void **v54;
  objc_super v55;
  void **v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, void *);
  void *v59;
  id v60;
  void **v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, unsigned __int8, __int16);
  void *v64;
  char *v65;
  uint64_t v66;
  char v67;
  _QWORD *v68;
  _BYTE *v69;
  uint64_t v70;
  uint64_t v71[4];
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  void **v76;
  _QWORD v77[3];
  _QWORD v78[3];
  _QWORD v79[5];

  v79[3] = *MEMORY[0x1E0C80C00];
  v46 = a3;
  v55.receiver = self;
  v55.super_class = (Class)PPScoreInterpreterBytecode;
  v53 = -[PPScoreInterpreterBytecode init](&v55, sel_init);
  if (v53)
  {
    std::vector<std::unordered_set<PPSubscoreIdentifier>>::vector(v77, a4);
    std::vector<std::unordered_set<PPSubscoreIdentifier>>::vector(v78, a5);
    std::vector<std::unordered_set<PPSubscoreIdentifier>>::vector(v79, a6);
    v73 = 0uLL;
    *(_QWORD *)&v74 = 0;
    v56 = (void **)&v73;
    v57 = 0;
    v10 = 0;
    *(_QWORD *)&v73 = operator new(0x48uLL);
    *((_QWORD *)&v73 + 1) = v73;
    *(_QWORD *)&v74 = v73 + 72;
    v68 = (_QWORD *)v73;
    v61 = (void **)&v74;
    v62 = (uint64_t)&v76;
    v63 = (uint64_t (*)(uint64_t, unsigned __int8, __int16))&v68;
    v64 = 0;
    v11 = (_QWORD *)v73;
    v76 = (void **)v73;
    do
    {
      v12 = &v77[3 * v10];
      *v11 = 0;
      v11[1] = 0;
      v11[2] = 0;
      v13 = *v12;
      v14 = v12[1];
      v71[0] = (uint64_t)v11;
      if (v14 != v13)
      {
        v71[1] = 0;
        std::vector<std::unordered_set<PPSubscoreIdentifier>>::__vallocate[abi:ne180100](v11, 0xCCCCCCCCCCCCCCCDLL * ((v14 - v13) >> 3));
        v15 = v11[1];
        do
        {
          *(_OWORD *)v15 = 0u;
          *(_OWORD *)(v15 + 16) = 0u;
          *(_DWORD *)(v15 + 32) = *(_DWORD *)(v13 + 32);
          std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::__rehash<true>(v15, *(_QWORD *)(v13 + 8));
          for (i = *(unsigned __int8 **)(v13 + 16); i; i = *(unsigned __int8 **)i)
            std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::__emplace_unique_key_args<PPSubscoreIdentifier,PPSubscoreIdentifier const&>(v15, i + 16, *((_DWORD *)i + 4));
          v13 += 40;
          v15 += 40;
        }
        while (v13 != v14);
        v11[1] = v15;
        v11 = v68;
      }
      ++v10;
      v11 += 3;
      v68 = v11;
    }
    while (v10 != 3);
    LOBYTE(v64) = 1;
    std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::unordered_set<PPSubscoreIdentifier>>>,std::vector<std::unordered_set<PPSubscoreIdentifier>>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&v61);
    *((_QWORD *)&v73 + 1) = v11;
    v17 = operator new();
    *(_OWORD *)v17 = v73;
    *(_QWORD *)(v17 + 16) = v74;
    *(_QWORD *)&v74 = 0;
    v73 = 0uLL;
    v54 = 0;
    v48 = (void ****)(v53 + 32);
    std::unique_ptr<std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>>::reset[abi:ne180100]((void ***)v53 + 4, (void **)v17);
    std::unique_ptr<std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>>::reset[abi:ne180100](&v54, 0);
    v61 = (void **)&v73;
    std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__destroy_vector::operator()[abi:ne180100](&v61);
    for (j = 6; j != -3; j -= 3)
    {
      v61 = (void **)&v77[j];
      std::vector<std::unordered_set<PPSubscoreIdentifier>>::__destroy_vector::operator()[abi:ne180100](&v61);
    }
    v52 = v46;
    obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
    v51 = (void *)objc_opt_new();
    Mutable = CFBitVectorCreateMutable(0, 0);
    bv = CFBitVectorCreateMutable(0, 0);
    v50 = CFBitVectorCreateMutable(0, 0);
    v20 = 0;
    v21 = (void **)MEMORY[0x1E0C809B0];
    do
    {
      if (objc_msgSend(v52, "count") <= v20)
      {
        v23 = 0;
      }
      else
      {
        objc_msgSend(v52, "objectAtIndexedSubscript:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count");

      }
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v23);
      if (v23)
      {
        for (k = 0; k != v23; ++k)
        {
          objc_msgSend(v52, "objectAtIndexedSubscript:", v20);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectAtIndexedSubscript:", k);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v21;
          v62 = 3221225472;
          v63 = __47__PPScoreInterpreterBytecode__compileBytecode___block_invoke;
          v64 = &unk_1E7E159F0;
          v67 = v20;
          v65 = v53;
          v66 = k;
          v77[0] = v21;
          v77[1] = 3221225472;
          v77[2] = __47__PPScoreInterpreterBytecode__compileBytecode___block_invoke_2;
          v78[0] = &__block_descriptor_56_e11_v24__0Q8Q16l;
          v78[1] = Mutable;
          v78[2] = bv;
          v79[0] = v50;
          v56 = v21;
          v57 = 3221225472;
          v58 = __47__PPScoreInterpreterBytecode__compileBytecode___block_invoke_3;
          v59 = &unk_1E7E15A38;
          v60 = v51;
          +[PPScoreInterpreterBytecode _compileToBytecode:handleDependency:handleScoreInputsNeeded:handleRetainedObject:]((uint64_t)PPScoreInterpreterBytecode, v27, &v61, v77, &v56);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)objc_msgSend(v28, "copy");

          objc_msgSend(v24, "addObject:", v29);
        }
      }
      objc_msgSend(obj, "addObject:", v24);

      ++v20;
    }
    while (v20 != 3);
    *((_QWORD *)v53 + 5) = CFBitVectorCreateCopy(0, Mutable);
    CFRelease(Mutable);
    *((_QWORD *)v53 + 6) = CFBitVectorCreateCopy(0, bv);
    CFRelease(bv);
    *((_QWORD *)v53 + 7) = CFBitVectorCreateCopy(0, v50);
    CFRelease(v50);
    objc_storeStrong((id *)v53 + 2, obj);
    v30 = objc_msgSend(v51, "copy");
    v31 = (void *)*((_QWORD *)v53 + 3);
    *((_QWORD *)v53 + 3) = v30;

    v75 = 1065353216;
    v73 = 0u;
    v74 = 0u;
    memset(v71, 0, sizeof(v71));
    v72 = 1065353216;
    v68 = 0;
    v69 = 0;
    v70 = 0;
    v32 = (void ***)*((_QWORD *)v53 + 4);
    v33 = (unint64_t)(v32 + 1);
    v34 = v32[1];
    v35 = *v32;
    if (v34 != *v32)
    {
      v36 = 0;
      do
      {
        if (v35[3 * v36 + 1] != v35[3 * v36])
        {
          if (0xAAAAAAAAAAAAAAABLL * (v34 - v35) > v36)
          {
            v37 = 0;
            v38 = 0;
            while (1)
            {
              v33 = v37 & 0xFFFF0000 | (unint64_t)v36 | v33 & 0xFFFFFFFF00000000;
              -[PPScoreInterpreterBytecode resolveSubscoreDependencies:resolved:unresolved:resolvedOrdering:]((uint64_t)v53, v33, (uint64_t)&v73, v71, (void **)&v68);
              v32 = *v48;
              v35 = **v48;
              if (0xAAAAAAAAAAAAAAABLL * ((*v48)[1] - v35) <= v36)
                break;
              ++v38;
              v37 += 0x10000;
              if (v38 >= 0xCCCCCCCCCCCCCCCDLL * (((_BYTE *)v35[3 * v36 + 1] - (_BYTE *)v35[3 * v36]) >> 3))
                goto LABEL_27;
            }
          }
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        }
LABEL_27:
        ++v36;
        v34 = v32[1];
      }
      while (v36 < 0xAAAAAAAAAAAAAAABLL * (v34 - v35));
      v33 = (unint64_t)(v32 + 1);
      while (v34 != v35)
      {
        v34 -= 3;
        v76 = v34;
        std::vector<std::unordered_set<PPSubscoreIdentifier>>::__destroy_vector::operator()[abi:ne180100](&v76);
      }
      v34 = v35;
    }
    *(_QWORD *)v33 = v34;
    v39 = (_QWORD *)operator new();
    *v39 = 0;
    v39[1] = 0;
    v39[2] = 0;
    v40 = v68;
    v41 = v69 - (_BYTE *)v68;
    if (v69 != (_BYTE *)v68)
    {
      if (v41 < 0)
        std::vector<PPTokenCount * {__strong}>::__throw_length_error[abi:ne180100]();
      v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned short,unsigned short>>>(v41 >> 2);
      *v39 = v42;
      v39[1] = v42;
      v39[2] = &v42[4 * v43];
      memmove(v42, v40, v41);
      v39[1] = &v42[4 * (v41 >> 2)];
    }
    if (v40)
      operator delete(v40);
    std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::~__hash_table((uint64_t)v71);
    std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::~__hash_table((uint64_t)&v73);
    v44 = *((_QWORD *)v53 + 1);
    *((_QWORD *)v53 + 1) = v39;
    if (v44)
      std::default_delete<std::vector<PPSubscoreIdentifier>>::operator()[abi:ne180100](v44);

  }
  return (PPScoreInterpreterBytecode *)v53;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_scalarScoreInputsNeeded);
  CFRelease(self->_arrayScoreInputsNeeded);
  CFRelease(self->_objectScoreInputsNeeded);
  v3.receiver = self;
  v3.super_class = (Class)PPScoreInterpreterBytecode;
  -[PPScoreInterpreterBytecode dealloc](&v3, sel_dealloc);
}

- (__CFBitVector)scalarScoreInputsNeeded
{
  return self->_scalarScoreInputsNeeded;
}

- (__CFBitVector)arrayScoreInputsNeeded
{
  return self->_arrayScoreInputsNeeded;
}

- (__CFBitVector)objectScoreInputsNeeded
{
  return self->_objectScoreInputsNeeded;
}

- (void).cxx_destruct
{
  void *value;

  std::unique_ptr<std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>>::reset[abi:ne180100]((void ***)&self->_subscoreDependencies, 0);
  objc_storeStrong((id *)&self->_bytecodeRetainedObjectSlots, 0);
  objc_storeStrong((id *)&self->_bytecodeDataBySubscoreTypeAndIndex, 0);
  value = self->_subscoreComputeOrder.__ptr_.__value_;
  self->_subscoreComputeOrder.__ptr_.__value_ = 0;
  if (value)
    std::default_delete<std::vector<PPSubscoreIdentifier>>::operator()[abi:ne180100]((uint64_t)value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

uint64_t __47__PPScoreInterpreterBytecode__compileBytecode___block_invoke(uint64_t a1, unsigned __int8 a2, __int16 a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  int v8;

  LOWORD(v8) = a2;
  HIWORD(v8) = a3;
  v3 = **(_QWORD **)(*(_QWORD *)(a1 + 32) + 32);
  if (0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 8) - v3) >> 3) <= *(unsigned __int8 *)(a1 + 48))
    std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
  v4 = *(_QWORD *)(a1 + 40);
  v6 = (uint64_t *)(v3 + 24 * *(unsigned __int8 *)(a1 + 48));
  v5 = *v6;
  if (0xCCCCCCCCCCCCCCCDLL * ((v6[1] - *v6) >> 3) <= v4)
    std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
  return std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::__emplace_unique_key_args<PPSubscoreIdentifier,PPSubscoreIdentifier const&>(v5 + 40 * v4, (unsigned __int8 *)&v8, v8);
}

void __47__PPScoreInterpreterBytecode__compileBytecode___block_invoke_2(CFBitVectorRef *a1, uint64_t a2, CFIndex a3)
{
  CFBitVectorRef *v4;
  __CFBitVector *v5;
  unint64_t Count;
  CFIndex v7;

  switch(a2)
  {
    case 401:
      v4 = a1 + 6;
      break;
    case 301:
      v4 = a1 + 5;
      break;
    case 201:
      v4 = a1 + 4;
      break;
    default:
      __break(1u);
      return;
  }
  v5 = *v4;
  Count = CFBitVectorGetCount(*v4);
  if (Count <= a3 + 1)
    v7 = a3 + 1;
  else
    v7 = Count;
  CFBitVectorSetCount(v5, v7);
  CFBitVectorSetBitAtIndex(v5, a3, 1u);
}

uint64_t __47__PPScoreInterpreterBytecode__compileBytecode___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "count");
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  return v4;
}

+ (id)_compileToBytecode:(void *)a3 handleDependency:(void *)a4 handleScoreInputsNeeded:(void *)a5 handleRetainedObject:
{
  void *v5;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void (**v11)(id, uint64_t, _QWORD);
  uint64_t v12;
  void *v13;
  int v14;
  unsigned __int16 v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unint64_t v46;
  unsigned __int16 v47;
  uint64_t v48;
  void *v49;
  uint64_t (**v50)(void);

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v50 = a5;
  v12 = objc_opt_self();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "intValue");
  v15 = v14;
  v16 = v14;

  if (v16 > 300)
  {
    switch(v16)
    {
      case 301:
        goto LABEL_10;
      case 302:
        if (!v10)
          goto LABEL_25;
        objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v10[2](v10, 1, (unsigned __int16)objc_msgSend(v17, "intValue"));
        goto LABEL_24;
      case 303:
        goto LABEL_25;
      case 304:
LABEL_20:
        objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v50)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v50[2]());
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          +[PPScoreInterpreterBytecode _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:objectArgument:](v12, 65532, v22, 0, 0);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_36;
        }
        +[PPScoreInterpreterBytecode _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:objectArgument:](v12, v15, 0, 0, v18);
        v31 = objc_claimAutoreleasedReturnValue();
        break;
      default:
        switch(v16)
        {
          case 401:
            goto LABEL_10;
          case 402:
            if (!v10)
              goto LABEL_25;
            objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v10[2](v10, 2, (unsigned __int16)objc_msgSend(v17, "intValue"));
            goto LABEL_24;
          case 403:
            goto LABEL_25;
          case 404:
            goto LABEL_20;
          default:
            goto LABEL_28;
        }
    }
    goto LABEL_26;
  }
  switch(v16)
  {
    case 201:
LABEL_10:
      if (!v11)
        goto LABEL_25;
      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v11[2](v11, v16, (int)objc_msgSend(v17, "intValue"));
      goto LABEL_24;
    case 202:
      if (!v10)
        goto LABEL_25;
      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, 0, (unsigned __int16)objc_msgSend(v17, "intValue"));
LABEL_24:

LABEL_25:
      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPScoreInterpreterBytecode _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:objectArgument:](v12, v15, v18, 0, 0);
      v31 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 203:
      goto LABEL_25;
    case 204:
      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPScoreInterpreterBytecode _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:objectArgument:](v12, 204, 0, v18, 0);
      v31 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    default:
      if (v16 == -1)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "data");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_28;
      }
      if (v16 != 101)
        goto LABEL_28;
      objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v18, "count");
      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "intValue");

      if (v20 != -1)
      {
        if (v20 == 14)
        {
          if (v48 != 2)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", sel__compileToBytecode_handleDependency_handleScoreInputsNeeded_handleRetainedObject_, v12, CFSTR("PPScoreInterpreter.mm"), 669, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("argCount == 2"));

          }
          objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          +[PPScoreInterpreterBytecode _compileToBytecode:handleDependency:handleScoreInputsNeeded:handleRetainedObject:](v12, v33, v10, v11, v50);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v22, "length"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          +[PPScoreInterpreterBytecode _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:objectArgument:](v12, 65534, v34, 0, 0);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          +[PPScoreInterpreterBytecode _compileToBytecode:handleDependency:handleScoreInputsNeeded:handleRetainedObject:](v12, v35, v10, v11, v50);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v5 = (void *)objc_msgSend(v26, "mutableCopy");
          objc_msgSend(v5, "appendData:", v49);
          objc_msgSend(v5, "appendData:", v22);
          goto LABEL_35;
        }
        if (v20 == 10)
        {
          if (v48 != 3)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", sel__compileToBytecode_handleDependency_handleScoreInputsNeeded_handleRetainedObject_, v12, CFSTR("PPScoreInterpreter.mm"), 632, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("argCount == 3"));

          }
          objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[PPScoreInterpreterBytecode _compileToBytecode:handleDependency:handleScoreInputsNeeded:handleRetainedObject:](v12, v21, v10, v11, v50);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "objectAtIndexedSubscript:", 2);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[PPScoreInterpreterBytecode _compileToBytecode:handleDependency:handleScoreInputsNeeded:handleRetainedObject:](v12, v23, v10, v11, v50);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v49 = v24;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v24, "length"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          +[PPScoreInterpreterBytecode _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:objectArgument:](v12, 0xFFFFLL, v25, 0, 0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          +[PPScoreInterpreterBytecode _compileToBytecode:handleDependency:handleScoreInputsNeeded:handleRetainedObject:](v12, v27, v10, v11, v50);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v26, "length") + objc_msgSend(v22, "length"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          +[PPScoreInterpreterBytecode _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:objectArgument:](v12, 65533, v29, 0, 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v5 = (void *)objc_msgSend(v28, "mutableCopy");
          objc_msgSend(v5, "appendData:", v30);
          objc_msgSend(v5, "appendData:", v22);
          objc_msgSend(v5, "appendData:", v26);
          objc_msgSend(v5, "appendData:", v49);

LABEL_35:
LABEL_36:

          goto LABEL_27;
        }
        v47 = v20;
        if ((unint64_t)(v20 - 17) < 2)
        {
          if (objc_msgSend(v18, "count"))
            goto LABEL_44;
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", sel__compileToBytecode_handleDependency_handleScoreInputsNeeded_handleRetainedObject_, v12, CFSTR("PPScoreInterpreter.mm"), 699, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("argArray.count >= 1"));
        }
        else
        {
          if (v20 != 21 && v20 != 19 || (unint64_t)objc_msgSend(v18, "count") > 1)
            goto LABEL_44;
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", sel__compileToBytecode_handleDependency_handleScoreInputsNeeded_handleRetainedObject_, v12, CFSTR("PPScoreInterpreter.mm"), 695, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("argArray.count >= 2"));
        }

LABEL_44:
        objc_opt_self();
        v46 = 0x17C0013uLL >> (v20 + 1);
        if ((v46 & 1) == 0)
        {
          v37 = qword_1C3AE4FB0[v20 + 1];
          if (objc_msgSend(v18, "count") != v37)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", sel__compileToBytecode_handleDependency_handleScoreInputsNeeded_handleRetainedObject_, v12, CFSTR("PPScoreInterpreter.mm"), 708, CFSTR("expected argArray.count (%tu) == expected count (%tu) for operator %hu"), objc_msgSend(v18, "count"), v37, (unsigned __int16)v20);

          }
        }
        v5 = (void *)objc_opt_new();
        if (v48)
        {
          for (i = 0; i != v48; ++i)
          {
            v39 = (void *)MEMORY[0x1C3BD6630]();
            objc_msgSend(v18, "objectAtIndexedSubscript:", i);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            +[PPScoreInterpreterBytecode _compileToBytecode:handleDependency:handleScoreInputsNeeded:handleRetainedObject:](v12, v40, v10, v11, v50);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "appendData:", v41);

            objc_autoreleasePoolPop(v39);
          }
        }
        if ((v46 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v48);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          +[PPScoreInterpreterBytecode _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:objectArgument:](v12, v47, v42, 0, 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          +[PPScoreInterpreterBytecode _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:objectArgument:](v12, v47, 0, 0, 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v5, "appendData:", v22);
        goto LABEL_36;
      }
      objc_msgSend(MEMORY[0x1E0C99D50], "data");
      v31 = objc_claimAutoreleasedReturnValue();
LABEL_26:
      v5 = (void *)v31;
LABEL_27:

LABEL_28:
      return v5;
  }
}

- (void)resolveSubscoreDependencies:(uint64_t)a3 resolved:(uint64_t *)a4 unresolved:(void *)a5 resolvedOrdering:
{
  unint64_t v5;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  unsigned __int8 *i;
  void *v15;
  unint64_t v16;
  int *v17;
  _DWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  int *v24;
  unint64_t v25;
  char *v26;
  char *v27;
  int v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  unint64_t v32;
  uint8x8_t v33;
  uint64_t *v34;
  uint64_t *v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  int v40;

  v40 = a2;
  std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::__emplace_unique_key_args<PPSubscoreIdentifier,PPSubscoreIdentifier const&>((uint64_t)a4, (unsigned __int8 *)&v40, a2);
  v11 = **(_QWORD **)(a1 + 32);
  if (0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) - v11) >> 3) <= a2)
    std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
  v13 = (uint64_t *)(v11 + 24 * a2);
  v12 = *v13;
  if (0xCCCCCCCCCCCCCCCDLL * ((v13[1] - *v13) >> 3) <= HIWORD(a2))
    std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
  for (i = *(unsigned __int8 **)(v12 + 40 * HIWORD(a2) + 16); i; i = *(unsigned __int8 **)i)
  {
    if (!std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::find<PPSubscoreIdentifier>(*(_QWORD *)a3, *(_QWORD *)(a3 + 8), i + 16))
    {
      if (std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::find<PPSubscoreIdentifier>(*a4, a4[1], i + 16))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", sel_resolveSubscoreDependencies_resolved_unresolved_resolvedOrdering_, a1, CFSTR("PPScoreInterpreter.mm"), 371, CFSTR("Circular dependency detected in model subscore definitions"));

      }
      v5 = v5 & 0xFFFFFFFF00000000 | *((unsigned int *)i + 4);
      -[PPScoreInterpreterBytecode resolveSubscoreDependencies:resolved:unresolved:resolvedOrdering:](a1, v5, a3, a4, a5);
    }
  }
  if ((std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::__emplace_unique_key_args<PPSubscoreIdentifier,PPSubscoreIdentifier const&>(a3, (unsigned __int8 *)&v40, a2) & 1) != 0)
  {
    v17 = (int *)a5[1];
    v16 = (unint64_t)a5[2];
    if ((unint64_t)v17 >= v16)
    {
      v19 = ((char *)v17 - (_BYTE *)*a5) >> 2;
      if ((unint64_t)(v19 + 1) >> 62)
        std::vector<PPTokenCount * {__strong}>::__throw_length_error[abi:ne180100]();
      v20 = v16 - (_QWORD)*a5;
      v21 = v20 >> 1;
      if (v20 >> 1 <= (unint64_t)(v19 + 1))
        v21 = v19 + 1;
      if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFFCLL)
        v22 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v22 = v21;
      if (v22)
        v22 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned short,unsigned short>>>(v22);
      else
        v23 = 0;
      v24 = (int *)(v22 + 4 * v19);
      v25 = v22 + 4 * v23;
      *v24 = a2;
      v18 = v24 + 1;
      v27 = (char *)*a5;
      v26 = (char *)a5[1];
      if (v26 != *a5)
      {
        do
        {
          v28 = *((_DWORD *)v26 - 1);
          v26 -= 4;
          *--v24 = v28;
        }
        while (v26 != v27);
        v26 = (char *)*a5;
      }
      *a5 = v24;
      a5[1] = v18;
      a5[2] = (void *)v25;
      if (v26)
        operator delete(v26);
    }
    else
    {
      *v17 = a2;
      v18 = v17 + 1;
    }
    a5[1] = v18;
  }
  v30 = *a4;
  v29 = a4[1];
  v31 = std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::find<PPSubscoreIdentifier>(*a4, v29, (unsigned __int8 *)&v40);
  if (v31)
  {
    v32 = v31[1];
    v33 = (uint8x8_t)vcnt_s8((int8x8_t)v29);
    v33.i16[0] = vaddlv_u8(v33);
    if (v33.u32[0] > 1uLL)
    {
      if (v32 >= v29)
        v32 %= v29;
    }
    else
    {
      v32 &= v29 - 1;
    }
    v34 = *(uint64_t **)(v30 + 8 * v32);
    do
    {
      v35 = v34;
      v34 = (uint64_t *)*v34;
    }
    while (v34 != v31);
    if (v35 == a4 + 2)
      goto LABEL_46;
    v36 = v35[1];
    if (v33.u32[0] > 1uLL)
    {
      if (v36 >= v29)
        v36 %= v29;
    }
    else
    {
      v36 &= v29 - 1;
    }
    if (v36 != v32)
    {
LABEL_46:
      if (!*v31)
        goto LABEL_47;
      v37 = *(_QWORD *)(*v31 + 8);
      if (v33.u32[0] > 1uLL)
      {
        if (v37 >= v29)
          v37 %= v29;
      }
      else
      {
        v37 &= v29 - 1;
      }
      if (v37 != v32)
LABEL_47:
        *(_QWORD *)(v30 + 8 * v32) = 0;
    }
    v38 = *v31;
    if (*v31)
    {
      v39 = *(_QWORD *)(v38 + 8);
      if (v33.u32[0] > 1uLL)
      {
        if (v39 >= v29)
          v39 %= v29;
      }
      else
      {
        v39 &= v29 - 1;
      }
      if (v39 != v32)
      {
        *(_QWORD *)(*a4 + 8 * v39) = v35;
        v38 = *v31;
      }
    }
    *v35 = v38;
    *v31 = 0;
    --a4[3];
    operator delete(v31);
  }
}

+ (id)_bytecodeInstructionForOp:(void *)a3 unsignedIntegerArgument:(void *)a4 doubleArgument:(void *)a5 objectArgument:
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  __int16 v28;
  const __CFString *v29;
  id v30;
  _DWORD v31[4];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v28 = a2;
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_opt_self();
  v12 = v8 != 0;
  if (v9)
    ++v12;
  if (v10)
    ++v12;
  if (v12 >= 2)
    __assert_rtn("+[PPScoreInterpreterBytecode _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:objectArgument:]", "PPScoreInterpreter.mm", 487, "(nil != unsignedIntegerArgument ? 1 : 0) + (nil != doubleArgument ? 1 : 0) + (nil != objectArgument ? 1 : 0) <= 1");
  v13 = v11;
  if (!v8 && !v9 && !v10)
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v28, 2);
LABEL_16:
    v17 = (void *)v14;
    goto LABEL_17;
  }
  if (v8)
  {
    v15 = objc_msgSend(v8, "unsignedIntValue");
    if (HIWORD(v15))
    {
      LOWORD(v31[0]) = -5;
      HIWORD(v31[0]) = a2;
      v31[1] = v15;
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v31, 8);
    }
    else
    {
      LOWORD(v31[0]) = a2;
      HIWORD(v31[0]) = v15;
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v31, 4);
    }
    goto LABEL_16;
  }
  if (v9)
  {
    LOWORD(v31[0]) = a2;
    objc_msgSend(v9, "doubleValue");
    *(_QWORD *)((char *)v31 + 2) = v16;
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v31, 10);
    goto LABEL_16;
  }
  v27 = 0;
  objc_msgSend(MEMORY[0x1E0D815D0], "dataWithPropertyList:error:", v10, &v27);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v27;
  if (v20)
  {
    v24 = (void *)MEMORY[0x1E0C99DA0];
    v29 = CFSTR("error");
    v30 = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "exceptionWithName:reason:userInfo:", CFSTR("PPScoreInterpreterError"), CFSTR("couldn't encode obj arg to plist"), v25);
    v26 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v26);
  }
  if (!v19)
    __assert_rtn("+[PPScoreInterpreterBytecode _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:objectArgument:]", "PPScoreInterpreter.mm", 529, "lazyPlist");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v19, "length"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPScoreInterpreterBytecode _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:objectArgument:](v13, a2, v21, 0, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)objc_msgSend(v22, "mutableCopy");
  objc_msgSend(v23, "appendData:", v19);
  v17 = (void *)objc_msgSend(v23, "copy");

LABEL_17:
  return v17;
}

+ (id)scoreInterpreterParseRootFromAsset:(id)a3 scalarSubscoreCount:(unint64_t *)a4 arraySubscoreCount:(unint64_t *)a5 objectSubscoreCount:(unint64_t *)a6
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Scorer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *a4 = objc_msgSend(v10, "count");

  objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *a5 = objc_msgSend(v11, "count");

  objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *a6 = objc_msgSend(v12, "count");

  return v9;
}

+ (id)bytecodeFromAsset:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  v9 = 0;
  v10 = 0;
  v8 = 0;
  objc_msgSend((id)objc_opt_class(), "scoreInterpreterParseRootFromAsset:scalarSubscoreCount:arraySubscoreCount:objectSubscoreCount:", v3, &v10, &v9, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc((Class)objc_opt_class());
  v6 = (void *)objc_msgSend(v5, "initWithParseRoot:scalarSubscoreCount:arraySubscoreCount:objectSubscoreCount:", v4, v10, v9, v8);

  return v6;
}

+ (id)bytecodeFromFactorName:(id)a3 namespaceName:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v5 = a3;
  v6 = a4;
  if (+[PPScoreInterpreterBytecode bytecodeFromFactorName:namespaceName:]::_pasOnceToken2 != -1)
    dispatch_once(&+[PPScoreInterpreterBytecode bytecodeFromFactorName:namespaceName:]::_pasOnceToken2, &__block_literal_global_2438);
  v7 = (id)+[PPScoreInterpreterBytecode bytecodeFromFactorName:namespaceName:]::_pasExprOnceResult;
  v8 = (void *)MEMORY[0x1E0D81638];
  v9 = (void *)objc_msgSend(v5, "copy");
  v10 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v8, "tupleWithFirst:second:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2440;
  v25 = __Block_byref_object_dispose__2441;
  v26 = 0;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __67__PPScoreInterpreterBytecode_bytecodeFromFactorName_namespaceName___block_invoke_62;
  v18 = &unk_1E7E159C8;
  v20 = &v21;
  v12 = v11;
  v19 = v12;
  objc_msgSend(v7, "runWithLockAcquired:", &v15);
  objc_msgSend((id)v22[5], "result", v15, v16, v17, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v21, 8);
  return v13;
}

void __67__PPScoreInterpreterBytecode_bytecodeFromFactorName_namespaceName___block_invoke_62(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v7 = objc_alloc(MEMORY[0x1E0D815E0]);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67__PPScoreInterpreterBytecode_bytecodeFromFactorName_namespaceName___block_invoke_2;
    v11[3] = &unk_1E7E159A0;
    v12 = *(id *)(a1 + 32);
    v8 = objc_msgSend(v7, "initWithBlock:", v11);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
  }

}

id __67__PPScoreInterpreterBytecode_bytecodeFromFactorName_namespaceName___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "first");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "second");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v2, "lazyPlistForFactorName:namespaceName:error:", v3, v4, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;

  if (v5)
  {
    +[PPScoreInterpreterBytecode bytecodeFromAsset:](PPScoreInterpreterBytecode, "bytecodeFromAsset:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    pp_default_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v6;
      _os_log_error_impl(&dword_1C392E000, v9, OS_LOG_TYPE_ERROR, "Error loading asset %@: %@", buf, 0x16u);
    }

    v7 = 0;
  }

  return v7;
}

void __67__PPScoreInterpreterBytecode_bytecodeFromFactorName_namespaceName___block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = objc_alloc(MEMORY[0x1E0D815F0]);
  v2 = (void *)objc_opt_new();
  v3 = objc_msgSend(v1, "initWithGuardedData:", v2);
  v4 = (void *)+[PPScoreInterpreterBytecode bytecodeFromFactorName:namespaceName:]::_pasExprOnceResult;
  +[PPScoreInterpreterBytecode bytecodeFromFactorName:namespaceName:]::_pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v0);
}

@end
