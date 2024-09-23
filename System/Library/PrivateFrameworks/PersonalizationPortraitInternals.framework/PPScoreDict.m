@implementation PPScoreDict

- (PPScoreDict)initWithScalarValueCount:(unint64_t)a3 arrayValueCount:(unint64_t)a4 objectCount:(unint64_t)a5
{
  return (PPScoreDict *)-[PPScoreDict initWithScalarValueCount:arrayValueCount:objectCount:scoreInputSet:](self, a3, a4, a5, 0);
}

- (PPScoreDict)initWithScoreInputSet:(id)a3
{
  id v4;
  PPScoreDict *v5;

  v4 = a3;
  v5 = (PPScoreDict *)-[PPScoreDict initWithScalarValueCount:arrayValueCount:objectCount:scoreInputSet:](self, objc_msgSend(v4, "scalarScoreIndexUpperBound") - objc_msgSend(v4, "minScalarScoreIndex"), objc_msgSend(v4, "arrayScoreIndexUpperBound") - objc_msgSend(v4, "minArrayScoreIndex"), objc_msgSend(v4, "objectScoreIndexUpperBound") - objc_msgSend(v4, "minObjectScoreIndex"), v4);

  return v5;
}

- (float)scalarValueForIndex:(unint64_t)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)self->_scalarValueStorage.__ptr_.__value_;
  if (a3 >= (*((_QWORD *)self->_scalarValueStorage.__ptr_.__value_ + 1) - v3) >> 2)
    std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
  return *(float *)(v3 + 4 * a3);
}

- (void)setScalarValue:(float)a3 forIndex:(unint64_t)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)self->_scalarValueStorage.__ptr_.__value_;
  if (a4 >= (*((_QWORD *)self->_scalarValueStorage.__ptr_.__value_ + 1) - v4) >> 2)
    std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
  *(float *)(v4 + 4 * a4) = a3;
}

- (id)arrayValueForIndex:(unint64_t)a3
{
  uint64_t v3;
  __int128 v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  void *v8;
  double v9;
  _DWORD *v10;
  _DWORD *v11;
  void *v12;
  void *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  __int128 v17;
  __int128 v18;

  v3 = *(_QWORD *)self->_arrayValueStorage.__ptr_.__value_;
  if (a3 >= (*((_QWORD *)self->_arrayValueStorage.__ptr_.__value_ + 1) - v3) >> 4)
    std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
  v4 = *(_OWORD *)(v3 + 16 * a3);
  v17 = v4;
  v18 = v4;
  v5 = *(std::__shared_weak_count **)(v3 + 16 * a3 + 8);
  if (*((_QWORD *)&v4 + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&v4 + 1) + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", (uint64_t)(*(_QWORD *)(v4 + 8) - *(_QWORD *)v4) >> 2);
  v10 = *(_DWORD **)v17;
  v11 = *(_DWORD **)(v17 + 8);
  if (*(_DWORD **)v17 != v11)
  {
    do
    {
      LODWORD(v9) = *v10;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9, v17, v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v12);

      ++v10;
    }
    while (v10 != v11);
  }
  v13 = (void *)objc_msgSend(v8, "copy", v17);

  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  return v13;
}

- (shared_ptr<std::vector<float>>)arraySharedPtrForIndex:(unint64_t)a3
{
  _OWORD *v3;
  uint64_t v4;
  __int128 v5;
  unint64_t *v6;
  unint64_t v7;
  shared_ptr<std::vector<float>> result;

  v4 = *(_QWORD *)self->_arrayValueStorage.__ptr_.__value_;
  if (a3 >= (*((_QWORD *)self->_arrayValueStorage.__ptr_.__value_ + 1) - v4) >> 4)
    std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
  v5 = *(_OWORD *)(v4 + 16 * a3);
  *v3 = v5;
  if (*((_QWORD *)&v5 + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&v5 + 1) + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = self;
  return result;
}

- (void)setArrayValue:(id)a3 forIndex:(unint64_t)a4
{
  unint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  char **v16;
  unint64_t v17;
  char *v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  uint64_t v30;
  char *v31;
  char *v32;
  int v33;
  char *v34;
  unint64_t i;
  void *v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  id v41;
  __int128 v42;

  v41 = a3;
  v6 = objc_msgSend(v41, "count");
  v7 = (char *)operator new(0x30uLL);
  v8 = v7;
  *(_OWORD *)(v7 + 8) = 0u;
  *(_QWORD *)v7 = &off_1E7E17F30;
  *((_QWORD *)v7 + 3) = 0;
  v9 = v7 + 24;
  *((_OWORD *)v7 + 2) = 0u;
  if (v6)
  {
    std::vector<float>::__vallocate[abi:ne180100]((_QWORD *)v7 + 3, v6);
    v10 = (char *)*((_QWORD *)v8 + 4);
    bzero(v10, 4 * v6);
    *((_QWORD *)v8 + 4) = &v10[4 * v6];
  }
  *(_QWORD *)&v42 = v9;
  *((_QWORD *)&v42 + 1) = v8;
  v11 = *(_QWORD *)self->_arrayValueStorage.__ptr_.__value_;
  if (a4 >= (*((_QWORD *)self->_arrayValueStorage.__ptr_.__value_ + 1) - v11) >> 4)
    std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
  std::shared_ptr<std::vector<float>>::operator=[abi:ne180100](v11 + 16 * a4, &v42);
  v12 = (std::__shared_weak_count *)*((_QWORD *)&v42 + 1);
  if (*((_QWORD *)&v42 + 1))
  {
    v13 = (unint64_t *)(*((_QWORD *)&v42 + 1) + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  v15 = *(_QWORD *)self->_arrayValueStorage.__ptr_.__value_;
  if (a4 >= (*((_QWORD *)self->_arrayValueStorage.__ptr_.__value_ + 1) - v15) >> 4)
    std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
  v16 = *(char ***)(v15 + 16 * a4);
  v17 = objc_msgSend(v41, "count");
  v18 = *v16;
  v19 = v16[1];
  v20 = (v19 - *v16) >> 2;
  if (v17 <= v20)
  {
    if (v17 >= v20)
      goto LABEL_27;
    v34 = &v18[4 * v17];
LABEL_24:
    v16[1] = v34;
    goto LABEL_27;
  }
  v21 = v17 - v20;
  v22 = v16[2];
  if (v17 - v20 <= (v22 - v19) >> 2)
  {
    bzero(v16[1], 4 * v21);
    v34 = &v19[4 * v21];
    goto LABEL_24;
  }
  if (v17 >> 62)
    std::vector<PPTokenCount * {__strong}>::__throw_length_error[abi:ne180100]();
  v23 = v22 - v18;
  v24 = v23 >> 1;
  if (v23 >> 1 <= v17)
    v24 = v17;
  if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFFCLL)
    v25 = 0x3FFFFFFFFFFFFFFFLL;
  else
    v25 = v24;
  v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned short,unsigned short>>>(v25);
  v27 = *v16;
  v28 = v16[1];
  v29 = &v26[4 * v20];
  v31 = &v26[4 * v30];
  bzero(v29, 4 * v21);
  v32 = &v29[4 * v21];
  while (v28 != v27)
  {
    v33 = *((_DWORD *)v28 - 1);
    v28 -= 4;
    *((_DWORD *)v29 - 1) = v33;
    v29 -= 4;
  }
  *v16 = v29;
  v16[1] = v32;
  v16[2] = v31;
  if (v27)
    operator delete(v27);
LABEL_27:
  for (i = 0; i < objc_msgSend(v41, "count"); ++i)
  {
    objc_msgSend(v41, "objectAtIndexedSubscript:", i);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "floatValue");
    v38 = *(_QWORD *)self->_arrayValueStorage.__ptr_.__value_;
    if (a4 >= (*((_QWORD *)self->_arrayValueStorage.__ptr_.__value_ + 1) - v38) >> 4)
      std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
    v40 = *(uint64_t **)(v38 + 16 * a4);
    v39 = *v40;
    if (i >= (v40[1] - *v40) >> 2)
      std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
    *(_DWORD *)(v39 + 4 * i) = v37;

  }
}

- (void)setArrayStorage:(void *)a3 forIndex:(unint64_t)a4
{
  char *v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  __int128 v12;

  v7 = (char *)operator new(0x30uLL);
  *(_OWORD *)(v7 + 8) = 0u;
  *((_QWORD *)v7 + 3) = 0;
  *(_QWORD *)v7 = &off_1E7E17F30;
  *((_OWORD *)v7 + 2) = 0u;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>((_QWORD *)v7 + 3, *(const void **)a3, *((_QWORD *)a3 + 1), (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 2);
  *(_QWORD *)&v12 = v7 + 24;
  *((_QWORD *)&v12 + 1) = v7;
  v8 = *(_QWORD *)self->_arrayValueStorage.__ptr_.__value_;
  if (a4 >= (*((_QWORD *)self->_arrayValueStorage.__ptr_.__value_ + 1) - v8) >> 4)
    std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
  std::shared_ptr<std::vector<float>>::operator=[abi:ne180100](v8 + 16 * a4, &v12);
  v9 = (std::__shared_weak_count *)*((_QWORD *)&v12 + 1);
  if (*((_QWORD *)&v12 + 1))
  {
    v10 = (unint64_t *)(*((_QWORD *)&v12 + 1) + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
}

- (void)setArraySharedPtr:(shared_ptr<std:(unint64_t)a4 :vector<float>>)a3 forIndex:
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;

  v4 = *(_QWORD *)self->_arrayValueStorage.__ptr_.__value_;
  if (a3.var1 >= (__shared_weak_count *)((*((_QWORD *)self->_arrayValueStorage.__ptr_.__value_ + 1) - v4) >> 4))
    std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
  v5 = (_QWORD *)(v4 + 16 * (uint64_t)a3.var1);
  v7 = *(_QWORD *)a3.var0;
  v6 = *((_QWORD *)a3.var0 + 1);
  if (v6)
  {
    v8 = (unint64_t *)(v6 + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  v10 = (std::__shared_weak_count *)v5[1];
  *v5 = v7;
  v5[1] = v6;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *, SEL))v10->__on_zero_shared)(v10, a2);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
}

- (id)objectForIndex:(unint64_t)a3
{
  void *v3;
  void *v4;
  id v5;

  -[NSMutableArray objectAtIndexedSubscript:](self->_objectStorage, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
    v5 = 0;
  else
    v5 = v3;

  return v5;
}

- (void)setObject:(id)a3 forIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  v8 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[NSMutableArray setObject:atIndexedSubscript:](self->_objectStorage, "setObject:atIndexedSubscript:", v6, a4);
  v7 = v8;
  if (!v8)
  {

    v7 = 0;
  }

}

- (unint64_t)scalarValueCount
{
  _QWORD *value;

  value = self->_scalarValueStorage.__ptr_.__value_;
  if (value)
    return (uint64_t)(value[1] - *value) >> 2;
  else
    return 0;
}

- (unint64_t)arrayValueCount
{
  _QWORD *value;

  value = self->_arrayValueStorage.__ptr_.__value_;
  if (value)
    return (uint64_t)(value[1] - *value) >> 4;
  else
    return 0;
}

- (unint64_t)objectCount
{
  unint64_t result;

  result = (unint64_t)self->_objectStorage;
  if (result)
    return objc_msgSend((id)result, "count");
  return result;
}

- (NSSet)featureNames
{
  void *v3;
  unint64_t i;
  void *v5;
  unint64_t j;
  void *v7;
  unint64_t k;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  for (i = 0; i < -[PPScoreDict scalarValueCount](self, "scalarValueCount"); ++i)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("scalar_%tu"), i);
    objc_msgSend(v3, "addObject:", v5);

  }
  for (j = 0; j < -[PPScoreDict arrayValueCount](self, "arrayValueCount"); ++j)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("array_%tu"), j);
    objc_msgSend(v3, "addObject:", v7);

  }
  for (k = 0; k < -[PPScoreDict objectCount](self, "objectCount"); ++k)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("object_%tu"), k);
    objc_msgSend(v3, "addObject:", v9);

  }
  v10 = (void *)objc_msgSend(v3, "copy");

  return (NSSet *)v10;
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  NSObject *v24;
  void *v25;
  id v26;
  __CFString *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  objc_class *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  objc_class *v37;
  uint64_t v38;
  void *v39;
  const __CFString *v40;
  objc_class *v41;
  uint64_t v42;
  void *v43;
  const __CFString *v44;
  objc_class *v45;
  void *v46;
  id v47;
  void *v48;
  void *context;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  uint8_t v59[128];
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  id v63;
  __int16 v64;
  const __CFString *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  context = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("_"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") <= 1)
  {
    pp_default_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C392E000, v6, OS_LOG_TYPE_ERROR, "PPScoreDict: invalid feature name passed.", buf, 2u);
    }

    goto LABEL_5;
  }
  objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  if (objc_msgSend(v4, "hasPrefix:", CFSTR("scalar_")))
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[PPScoreDict scalarValueForIndex:](self, "scalarValueForIndex:", v9);
    objc_msgSend(v10, "numberWithFloat:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPCoreMLUtils multiArrayFeatureValueForNumber:](PPCoreMLUtils, "multiArrayFeatureValueForNumber:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v7 = (void *)v12;

    goto LABEL_12;
  }
  if (!objc_msgSend(v4, "hasPrefix:", CFSTR("array_")))
  {
    if (!objc_msgSend(v4, "hasPrefix:", CFSTR("object_")))
      goto LABEL_5;
    -[PPScoreDict objectForIndex:](self, "objectForIndex:", v9);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v58 = 0;
      objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithDictionary:error:", v48, &v58);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v58;
      if (v7)
      {
LABEL_36:

LABEL_37:
        goto LABEL_12;
      }
      pp_score_interpreter_log_handle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = (void *)v34;
        v36 = &stru_1E7E221D0;
        *(_DWORD *)buf = 138412802;
        if (v15)
          v36 = (const __CFString *)v15;
        v61 = v34;
        v62 = 2112;
        v63 = v4;
        v64 = 2112;
        v65 = v36;
        _os_log_error_impl(&dword_1C392E000, v16, OS_LOG_TYPE_ERROR, "Failed to log %@ value for %@: %@", buf, 0x20u);

      }
LABEL_18:
      v7 = 0;
      goto LABEL_36;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v47 = v48;
      v17 = (void *)objc_opt_new();
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v15 = v47;
      v18 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v54, v59, 16, v47);
      if (v18)
      {
        v19 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v55 != v19)
              objc_enumerationMutation(v15);
            v21 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSObject countForObject:](v15, "countForObject:", v21));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v22, v21);

          }
          v18 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
        }
        while (v18);
      }

      v53 = 0;
      objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithDictionary:error:", v17, &v53);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (__CFString *)v53;
      if (!v7)
      {
        pp_score_interpreter_log_handle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v37 = (objc_class *)objc_opt_class();
          NSStringFromClass(v37);
          v38 = objc_claimAutoreleasedReturnValue();
          v39 = (void *)v38;
          v40 = &stru_1E7E221D0;
          *(_DWORD *)buf = 138412802;
          if (v23)
            v40 = v23;
          v61 = v38;
          v62 = 2112;
          v63 = v4;
          v64 = 2112;
          v65 = v40;
          _os_log_error_impl(&dword_1C392E000, v24, OS_LOG_TYPE_ERROR, "Failed to log %@ value for %@: %@", buf, 0x20u);

        }
      }

      goto LABEL_36;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = v48;
      v25 = (void *)objc_opt_new();
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __35__PPScoreDict_featureValueForName___block_invoke;
      v51[3] = &unk_1E7E17F00;
      v26 = v25;
      v52 = v26;
      -[NSObject enumerateValuesAndCountsUsingBlock:](v15, "enumerateValuesAndCountsUsingBlock:", v51);
      v50 = 0;
      objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithDictionary:error:", v26, &v50);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (__CFString *)v50;
      if (!v7)
      {
        pp_score_interpreter_log_handle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v41 = (objc_class *)objc_opt_class();
          NSStringFromClass(v41);
          v42 = objc_claimAutoreleasedReturnValue();
          v43 = (void *)v42;
          v44 = &stru_1E7E221D0;
          *(_DWORD *)buf = 138412802;
          if (v27)
            v44 = v27;
          v61 = v42;
          v62 = 2112;
          v63 = v4;
          v64 = 2112;
          v65 = v44;
          _os_log_error_impl(&dword_1C392E000, v28, OS_LOG_TYPE_ERROR, "Failed to log %@ value for %@: %@", buf, 0x20u);

        }
      }

      goto LABEL_36;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = v48;
      if (!-[NSObject length](v15, "length"))
      {
        pp_score_interpreter_log_handle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v61 = (uint64_t)v4;
          _os_log_error_impl(&dword_1C392E000, v29, OS_LOG_TYPE_ERROR, "Encountered nil or empty NSString for %@", buf, 0xCu);
        }
        goto LABEL_47;
      }
      objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithString:", v15);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        goto LABEL_36;
      pp_score_interpreter_log_handle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        goto LABEL_47;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v7 = 0;
          goto LABEL_37;
        }
        pp_score_interpreter_log_handle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v31 = (objc_class *)objc_opt_class();
          NSStringFromClass(v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v61 = (uint64_t)v32;
          v62 = 2112;
          v63 = v4;
          _os_log_error_impl(&dword_1C392E000, v15, OS_LOG_TYPE_ERROR, "Unrecognized object type of %@ in feature %@", buf, 0x16u);

        }
        goto LABEL_18;
      }
      v15 = v48;
      v30 = (void *)MEMORY[0x1E0C9E918];
      -[NSObject timeIntervalSince1970](v15, "timeIntervalSince1970");
      objc_msgSend(v30, "featureValueWithDouble:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        goto LABEL_36;
      pp_score_interpreter_log_handle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        goto LABEL_47;
    }
    v45 = (objc_class *)objc_opt_class();
    NSStringFromClass(v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v61 = (uint64_t)v46;
    v62 = 2112;
    v63 = v4;
    v64 = 2112;
    v65 = &stru_1E7E221D0;
    _os_log_error_impl(&dword_1C392E000, v29, OS_LOG_TYPE_ERROR, "Failed to log %@ value for %@: %@", buf, 0x20u);

LABEL_47:
    goto LABEL_18;
  }
  -[PPScoreDict arrayValueForIndex:](self, "arrayValueForIndex:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPCoreMLUtils multiArrayForArray:](PPCoreMLUtils, "multiArrayForArray:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithMultiArray:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
LABEL_5:
  v7 = 0;
LABEL_12:

  objc_autoreleasePoolPop(context);
  return v7;
}

- (id)scalarValueDictionary
{
  void *v3;
  unint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  if (-[PPBaseScoreInputSet scalarScoreIndexUpperBound](self->_scoreInputSet, "scalarScoreIndexUpperBound"))
  {
    for (i = -[PPBaseScoreInputSet minScalarScoreIndex](self->_scoreInputSet, "minScalarScoreIndex");
          i < -[PPBaseScoreInputSet scalarScoreIndexUpperBound](self->_scoreInputSet, "scalarScoreIndexUpperBound");
          ++i)
    {
      v5 = (void *)MEMORY[0x1E0CB37E8];
      -[PPScoreDict scalarValueForIndex:](self, "scalarValueForIndex:", i);
      objc_msgSend(v5, "numberWithFloat:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPBaseScoreInputSet nameForScalarScoreIndex:](self->_scoreInputSet, "nameForScalarScoreIndex:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, v7);

    }
  }
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (id)arrayValueDictionary
{
  void *v3;
  unint64_t i;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  if (-[PPBaseScoreInputSet arrayScoreIndexUpperBound](self->_scoreInputSet, "arrayScoreIndexUpperBound"))
  {
    for (i = -[PPBaseScoreInputSet minArrayScoreIndex](self->_scoreInputSet, "minArrayScoreIndex");
          i < -[PPBaseScoreInputSet arrayScoreIndexUpperBound](self->_scoreInputSet, "arrayScoreIndexUpperBound");
          ++i)
    {
      -[PPScoreDict arrayValueForIndex:](self, "arrayValueForIndex:", i);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPBaseScoreInputSet nameForArrayScoreIndex:](self->_scoreInputSet, "nameForArrayScoreIndex:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v6);

    }
  }
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (id)objectDictionary
{
  void *v3;
  unint64_t i;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  if (-[PPBaseScoreInputSet objectScoreIndexUpperBound](self->_scoreInputSet, "objectScoreIndexUpperBound"))
  {
    for (i = -[PPBaseScoreInputSet minObjectScoreIndex](self->_scoreInputSet, "minObjectScoreIndex");
          i < -[PPBaseScoreInputSet objectScoreIndexUpperBound](self->_scoreInputSet, "objectScoreIndexUpperBound");
          ++i)
    {
      -[PPScoreDict objectForIndex:](self, "objectForIndex:", i);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPBaseScoreInputSet nameForObjectScoreIndex:](self->_scoreInputSet, "nameForObjectScoreIndex:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v6);

    }
  }
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self->_scoreInputSet)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[PPScoreDict scalarValueDictionary](self, "scalarValueDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPScoreDict arrayValueDictionary](self, "arrayValueDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPScoreDict objectDictionary](self, "objectDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("PPScoreDict: %@\n%@\n%@\n"), v4, v5, v6);

    return v7;
  }
  else
  {
    v9 = (void *)objc_opt_new();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[PPScoreDict featureNames](self, "featureNames");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v10);
          v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          -[PPScoreDict featureValueForName:](self, "featureValueForName:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v14);

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("PPScoreDict: %@\n"), v9);
    return v16;
  }
}

- (void).cxx_destruct
{
  void *value;

  objc_storeStrong((id *)&self->_objectStorage, 0);
  std::unique_ptr<std::vector<std::shared_ptr<std::vector<float>>>>::reset[abi:ne180100]((void ***)&self->_arrayValueStorage, 0);
  value = self->_scalarValueStorage.__ptr_.__value_;
  self->_scalarValueStorage.__ptr_.__value_ = 0;
  if (value)
    std::default_delete<std::vector<float>>::operator()[abi:ne180100]((uint64_t)value);
  objc_storeStrong((id *)&self->_scoreInputSet, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

void __35__PPScoreDict_featureValueForName___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

- (id)initWithScalarValueCount:(unint64_t)a3 arrayValueCount:(uint64_t)a4 objectCount:(void *)a5 scoreInputSet:
{
  id v10;
  _QWORD *v11;
  _QWORD *v12;
  _DWORD *v13;
  _DWORD *v14;
  uint64_t v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void **v30;
  objc_super v31;
  uint64_t v32;
  uint64_t v33;

  v10 = a5;
  if (a1)
  {
    v31.receiver = a1;
    v31.super_class = (Class)PPScoreDict;
    v11 = objc_msgSendSuper2(&v31, sel_init);
    a1 = v11;
    if (v11)
    {
      if (a2)
      {
        v12 = (_QWORD *)operator new();
        *v12 = 0;
        v12[1] = 0;
        v12[2] = 0;
        std::vector<float>::__vallocate[abi:ne180100](v12, a2);
        v13 = (_DWORD *)v12[1];
        v14 = &v13[a2];
        v15 = 4 * a2;
        do
        {
          *v13++ = -957033984;
          v15 -= 4;
        }
        while (v15);
        v12[1] = v14;
        v16 = *((_QWORD *)a1 + 2);
        *((_QWORD *)a1 + 2) = v12;
        if (v16)
LABEL_7:
          std::default_delete<std::vector<float>>::operator()[abi:ne180100](v16);
      }
      else
      {
        v16 = v11[2];
        *((_QWORD *)a1 + 2) = 0;
        if (v16)
          goto LABEL_7;
      }
      if (a3)
      {
        v17 = (std::__shared_weak_count *)operator new(0x30uLL);
        v17->__shared_owners_ = 0;
        p_shared_owners = (unint64_t *)&v17->__shared_owners_;
        v17->__shared_weak_owners_ = 0;
        v17->__vftable = (std::__shared_weak_count_vtbl *)&off_1E7E17F30;
        v17[1].__vftable = 0;
        v17[1].__shared_owners_ = 0;
        v17[1].__shared_weak_owners_ = 0;
        v19 = operator new();
        *(_QWORD *)v19 = 0;
        *(_QWORD *)(v19 + 8) = 0;
        *(_QWORD *)(v19 + 16) = 0;
        v32 = v19;
        v33 = 0;
        if (a3 >> 60)
          std::vector<PPTokenCount * {__strong}>::__throw_length_error[abi:ne180100]();
        v20 = operator new(16 * a3);
        *(_QWORD *)v19 = v20;
        *(_QWORD *)(v19 + 8) = v20;
        v21 = &v20[2 * a3];
        *(_QWORD *)(v19 + 16) = v21;
        do
        {
          *v20 = v17 + 1;
          v20[1] = v17;
          do
            v22 = __ldxr(p_shared_owners);
          while (__stxr(v22 + 1, p_shared_owners));
          v20 += 2;
        }
        while (v20 != v21);
        *(_QWORD *)(v19 + 8) = v21;
        v30 = 0;
        std::unique_ptr<std::vector<std::shared_ptr<std::vector<float>>>>::reset[abi:ne180100]((void ***)a1 + 3, (void **)v19);
        std::unique_ptr<std::vector<std::shared_ptr<std::vector<float>>>>::reset[abi:ne180100](&v30, 0);
        do
          v23 = __ldaxr(p_shared_owners);
        while (__stlxr(v23 - 1, p_shared_owners));
        if (v23)
        {
          if (a4)
            goto LABEL_18;
LABEL_24:
          v28 = (void *)*((_QWORD *)a1 + 4);
          *((_QWORD *)a1 + 4) = 0;

LABEL_25:
          objc_storeStrong((id *)a1 + 1, a5);
          goto LABEL_26;
        }
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
        if (!a4)
          goto LABEL_24;
      }
      else
      {
        std::unique_ptr<std::vector<std::shared_ptr<std::vector<float>>>>::reset[abi:ne180100]((void ***)a1 + 3, 0);
        if (!a4)
          goto LABEL_24;
      }
LABEL_18:
      v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4);
      v25 = (void *)*((_QWORD *)a1 + 4);
      *((_QWORD *)a1 + 4) = v24;

      do
      {
        v26 = (void *)*((_QWORD *)a1 + 4);
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addObject:", v27);

        --a4;
      }
      while (a4);
      goto LABEL_25;
    }
  }
LABEL_26:

  return a1;
}

@end
