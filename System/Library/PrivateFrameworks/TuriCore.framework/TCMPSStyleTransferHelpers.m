@implementation TCMPSStyleTransferHelpers

+ (vector<unsigned)toVector:(id)a2
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  unint64_t v11;
  unint64_t *var0;
  unint64_t *var1;
  unint64_t *v14;
  unint64_t *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  unint64_t *v21;
  unint64_t v22;
  vector<unsigned long, std::allocator<unsigned long>> *result;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  v24 = v5;
  std::vector<unsigned long>::reserve((void **)&retstr->var0, objc_msgSend(v5, "count"));
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = v24;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v6);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "integerValue");
        v11 = v10;
        var1 = retstr->var1;
        var0 = retstr->var2.var0;
        if (var1 >= var0)
        {
          v15 = retstr->var0;
          v16 = var1 - retstr->var0;
          v17 = v16 + 1;
          if ((unint64_t)(v16 + 1) >> 61)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          v18 = (char *)var0 - (char *)v15;
          if (v18 >> 2 > v17)
            v17 = v18 >> 2;
          if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8)
            v19 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v19 = v17;
          if (v19)
          {
            v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&retstr->var2, v19);
            v15 = retstr->var0;
            var1 = retstr->var1;
          }
          else
          {
            v20 = 0;
          }
          v21 = (unint64_t *)&v20[8 * v16];
          *v21 = v11;
          v14 = v21 + 1;
          while (var1 != v15)
          {
            v22 = *--var1;
            *--v21 = v22;
          }
          retstr->var0 = v21;
          retstr->var1 = v14;
          retstr->var2.var0 = (unint64_t *)&v20[8 * v19];
          if (v15)
            operator delete(v15);
        }
        else
        {
          *var1 = v10;
          v14 = var1 + 1;
        }
        retstr->var1 = v14;
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v7);
  }

  return result;
}

+ (map<std::string,)fromNSDictionary:()std:(std:(turi:(id)a2 :(SEL)a3 neural_net:(id)a4 :shared_float_array>>> *__return_ptr)retstr :allocator<std::pair<const)std::string :less<std::string>
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  int *v14;
  int v15;
  int v16;
  id v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  map<std::string, turi::neural_net::shared_float_array, std::less<std::string>, std::allocator<std::pair<const std::string, turi::neural_net::shared_float_array>>> *result;
  uint64_t **v23;
  id obj;
  void *__p;
  void *v26;
  uint64_t v27;
  _QWORD v28[2];
  std::__shared_weak_count *v29;
  uint64_t v30;
  char *v31;
  void *v32;
  int *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  retstr->var0.var2.var0 = 0;
  retstr->var0.var1.var0.var0 = 0;
  v23 = (uint64_t **)retstr;
  retstr->var0.var0 = &retstr->var0.var1;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v35 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(obj, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "data");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "shape");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "length");
        +[TCMPSStyleTransferHelpers toVector:](TCMPSStyleTransferHelpers, "toVector:", v12);
        v14 = (int *)v32;
        v15 = 1;
        while (v14 != v33)
        {
          v16 = *v14;
          v14 += 2;
          v15 *= v16;
        }
        v30 = v15;
        v31 = (char *)(v13 >> 2);
        if (v13 >> 2 != v15)
        {
          v28[0] = &v31;
          v28[1] = &v30;
          +[TCMPSStyleTransferHelpers fromNSDictionary:]::$_0::operator()();
        }
        v17 = objc_retainAutorelease(v11);
        v18 = objc_msgSend(v17, "bytes");
        v26 = 0;
        v27 = 0;
        __p = 0;
        std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v32, (uint64_t)v33, ((char *)v33 - (_BYTE *)v32) >> 3);
        turi::neural_net::shared_float_array::copy(v18, (uint64_t)&__p, (uint64_t)v28);
        if (__p)
        {
          v26 = __p;
          operator delete(__p);
        }
        v31 = (char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
        std::__tree<std::__value_type<std::string,turi::neural_net::shared_float_array>,std::__map_value_compare<std::string,std::__value_type<std::string,turi::neural_net::shared_float_array>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,turi::neural_net::shared_float_array>>>::__emplace_unique_impl<char const*,turi::neural_net::shared_float_array&>(v23, &v31, (uint64_t)v28);
        v28[0] = &unk_24D9175B8;
        v19 = v29;
        if (v29)
        {
          p_shared_owners = (unint64_t *)&v29->__shared_owners_;
          do
            v21 = __ldaxr(p_shared_owners);
          while (__stlxr(v21 - 1, p_shared_owners));
          if (!v21)
          {
            ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
            std::__shared_weak_count::__release_weak(v19);
          }
        }
        if (v32)
        {
          v33 = (int *)v32;
          operator delete(v32);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v6);
  }

  return result;
}

+ (void)fromNSDictionary:
{
  int *v0;
  file_logger *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  int locale;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  const std::locale::facet *v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  _QWORD *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  std::locale v44;
  std::locale v45;

  v0 = (int *)OUTLINED_FUNCTION_11();
  if (v0[169] <= 6)
  {
    if (cppipc::must_cancel((cppipc *)v0))
      OUTLINED_FUNCTION_15();
    v1 = (file_logger *)global_logger();
    OUTLINED_FUNCTION_7(v1, 6, "/Library/Caches/com.apple.xbs/Sources/TuriCore/turicreate_oss/src/ml/neural_net/style_transfer/mps_style_transfer_backend.mm", "operator()", 56);
    v2 = OUTLINED_FUNCTION_0();
    v10 = OUTLINED_FUNCTION_4(v2, v3, v4, v5, v6, v7, v8, v9, v37);
    v11 = pthread_getspecific(*(_QWORD *)(v10 + 592));
    if (v11)
    {
      if (*((_BYTE *)v11 + 280))
      {
        locale = OUTLINED_FUNCTION_10((const std::ios_base *)((char *)v11 + *(_QWORD *)(v11[2] - 24)
                                                                                        + 16)).__locale_;
        v27 = OUTLINED_FUNCTION_16(locale, MEMORY[0x24BEDB350], v21, v22, v23, v24, v25, v26, (uint64_t)v38, v40, v42, v44);
        v28 = OUTLINED_FUNCTION_13((uint64_t)v27, (uint64_t (*)(uint64_t, uint64_t))v27->__vftable[2].~facet_0);
        OUTLINED_FUNCTION_1(v28, v29, v30, v31, v32, v33, v34, v35, v39, v41, v43, v45);
        OUTLINED_FUNCTION_3();
        OUTLINED_FUNCTION_6();
        OUTLINED_FUNCTION_19();
        if (*(_DWORD *)(v10 + 600) == 7)
        {
          __print_back_trace();
          v36 = OUTLINED_FUNCTION_17();
          *v36 = "LOG_FATAL encountered";
          OUTLINED_FUNCTION_12(v36, MEMORY[0x24BEDB718]);
        }
      }
    }
    if (SHIBYTE(v42) < 0)
      OUTLINED_FUNCTION_2((int)v11, v12, v13, v14, v15, v16, v17, v18, v38);
  }
  OUTLINED_FUNCTION_14();
  v19 = OUTLINED_FUNCTION_8();
}

+ (id)toNSDictionary:()map<std:()turi:()std:(std:(turi::neural_net::shared_float_array>>> *)a3 :allocator<std::pair<const)std::string :less<std::string> :neural_net::shared_float_array :string
{
  id v4;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, turi::neural_net::shared_float_array>, void *>>> *p_var1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, turi::neural_net::shared_float_array>, void *>>> *v6;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, turi::neural_net::shared_float_array>, void *>>> *var0;
  void *v8;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, turi::neural_net::shared_float_array>, void *>>> *v9;
  void *v10;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, turi::neural_net::shared_float_array>, void *>>> *v11;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, turi::neural_net::shared_float_array>, void *>>> *v12;
  BOOL v13;
  void *v14;

  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  var0 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, turi::neural_net::shared_float_array>, void *>>> *)a3->var0.var0;
  p_var1 = &a3->var0.var1;
  v6 = var0;
  if (var0 != p_var1)
  {
    do
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", (*(uint64_t (**)(void *))(*(_QWORD *)v6[8].var0.var0 + 16))(v6[8].var0.var0)+ 4 * (uint64_t)v6[10].var0.var0, 4 * (uint64_t)v6[13].var0.var0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v6 + 4;
      if (SHIBYTE(v6[6].var0.var0) < 0)
        v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, turi::neural_net::shared_float_array>, void *>>> *)v9->var0.var0;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, v10);

      v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, turi::neural_net::shared_float_array>, void *>>> *)v6[1].var0.var0;
      if (v11)
      {
        do
        {
          v12 = v11;
          v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, turi::neural_net::shared_float_array>, void *>>> *)v11->var0.var0;
        }
        while (v11);
      }
      else
      {
        do
        {
          v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, turi::neural_net::shared_float_array>, void *>>> *)v6[2].var0.var0;
          v13 = v12->var0.var0 == v6;
          v6 = v12;
        }
        while (!v13);
      }
      v6 = v12;
    }
    while (v12 != p_var1);
  }
  v14 = (void *)objc_msgSend(v4, "copy");

  return v14;
}

@end
