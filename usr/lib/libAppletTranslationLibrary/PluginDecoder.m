@implementation PluginDecoder

+ (_QWORD)decoderWithData:(uint64_t)a1
{
  id v2;
  _QWORD *v3;

  v2 = a2;
  objc_opt_self();
  v3 = -[PluginDecoder initWithData:]([PluginDecoder alloc], v2);

  return v3;
}

- (_QWORD)initWithData:(_QWORD *)a1
{
  OVM *v3;
  uint64_t *v4;
  NSObject *v5;
  std::string *p_p;
  std::string __p;
  std::string *v9[3];
  char v10;
  objc_super v11;
  uint8_t buf[4];
  std::string *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)PluginDecoder;
    a1 = objc_msgSendSuper2(&v11, sel_init);
    if (a1)
    {
      OVM::Deserialize(v3, (uint64_t)v9);
      if (v10)
      {
        v4 = (uint64_t *)caulk::expected<std::shared_ptr<OVM::Script>,OVM::Error>::value((uint64_t)v9);
        std::shared_ptr<OVM::Var>::operator=[abi:ne180100](a1 + 1, v4);
        caulk::__expected_detail::base<std::shared_ptr<OVM::Script>,OVM::Error>::~base((uint64_t)v9);
      }
      else
      {
        ATLLogObject();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          ctu::join<std::__wrap_iter<std::string const*>>(v9[0], v9[1], ", ", 2uLL, &__p);
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            p_p = &__p;
          else
            p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
          *(_DWORD *)buf = 136315138;
          v13 = p_p;
          _os_log_impl(&dword_1C3511000, v5, OS_LOG_TYPE_ERROR, "Failed to deserialize script %s", buf, 0xCu);
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__p.__r_.__value_.__l.__data_);
        }

        caulk::__expected_detail::base<std::shared_ptr<OVM::Script>,OVM::Error>::~base((uint64_t)v9);
        a1 = 0;
      }
    }
  }

  return a1;
}

- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)p_data
{
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD *v16;
  __shared_weak_count *cntrl;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  std::string *v26;
  NSObject *v27;
  std::string *v28;
  id v29;
  std::string *v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v49;
  std::__shared_weak_count *v50;
  Script *ptr;
  __shared_weak_count *v52;
  std::string *v53;
  std::string *v54;
  int v55;
  char v56;
  void *__p;
  void *v58;
  char *v59;
  int v60;
  id v61;
  int v62;
  _QWORD v63[2];
  _QWORD v64[2];
  uint64_t v65;
  uint64_t v66;
  _QWORD v67[2];
  _QWORD v68[2];
  uint64_t v69;
  uint64_t v70;
  _QWORD v71[2];
  _QWORD v72[2];
  uint64_t v73;
  std::string *v74;
  uint8_t buf[4];
  std::string *v76;
  std::string v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v60 = 3;
  v61 = 0;
  v62 = 2;
  v16 = operator new(0x78uLL);
  v58 = v16 + 15;
  v59 = (char *)(v16 + 15);
  *(_DWORD *)v16 = 3;
  v16[1] = v12;
  *((_DWORD *)v16 + 4) = 2;
  *((_DWORD *)v16 + 6) = 3;
  v16[4] = v13;
  *((_DWORD *)v16 + 10) = 2;
  *((_DWORD *)v16 + 12) = 3;
  v16[7] = v14;
  *((_DWORD *)v16 + 16) = 2;
  *((_DWORD *)v16 + 18) = 3;
  v16[10] = v15;
  *((_DWORD *)v16 + 22) = 2;
  *((_DWORD *)v16 + 24) = 4;
  v16[13] = &v60;
  *((_DWORD *)v16 + 28) = 3;
  __p = v16;
  cntrl = self->script.__cntrl_;
  ptr = self->script.__ptr_;
  v52 = cntrl;
  if (cntrl)
  {
    v18 = (unint64_t *)((char *)cntrl + 8);
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
  std::string::basic_string[abi:ne180100]<0>(&v77, "getAppletStateAndHistory");
  -[PluginDecoder classChecker](self, &v49);
  if (-[PluginDecoder globals]::onceToken != -1)
    dispatch_once(&-[PluginDecoder globals]::onceToken, &__block_literal_global_8);
  OVM::Interpreter::RunSubroutine((uint64_t *)&ptr, (uint64_t)&v77, (uint64_t *)&__p, &v49, -[PluginDecoder globals]::_globals, (uint64_t)&v53);
  v20 = v50;
  if (v50)
  {
    p_shared_owners = (unint64_t *)&v50->__shared_owners_;
    do
      v22 = __ldaxr(p_shared_owners);
    while (__stlxr(v22 - 1, p_shared_owners));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  if (SHIBYTE(v77.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v77.__r_.__value_.__l.__data_);
  v23 = (std::__shared_weak_count *)v52;
  if (v52)
  {
    v24 = (unint64_t *)((char *)v52 + 8);
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  if (!v56)
  {
    ATLLogObject();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      ctu::join<std::__wrap_iter<std::string const*>>(v53, v54, ", ", 2uLL, &v77);
      v28 = (v77.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
          ? &v77
          : (std::string *)v77.__r_.__value_.__r.__words[0];
      *(_DWORD *)buf = 136315138;
      v76 = v28;
      _os_log_impl(&dword_1C3511000, v27, OS_LOG_TYPE_ERROR, "Script execution failure: %s", buf, 0xCu);
      if (SHIBYTE(v77.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v77.__r_.__value_.__l.__data_);
    }

    v29 = objc_alloc(MEMORY[0x1E0CB3940]);
    ctu::join<std::__wrap_iter<std::string const*>>(v53, v54, ", ", 2uLL, &v77);
    if ((v77.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v30 = &v77;
    else
      v30 = (std::string *)v77.__r_.__value_.__r.__words[0];
    v26 = (std::string *)objc_msgSend(v29, "initWithFormat:", CFSTR("Script execution failure: %s"), v30);
    if (SHIBYTE(v77.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v77.__r_.__value_.__l.__data_);
      if (!p_data)
        goto LABEL_60;
    }
    else if (!p_data)
    {
      goto LABEL_60;
    }
    v37 = *p_data;
    v35 = (void *)MEMORY[0x1E0CB35C8];
    if (*p_data)
    {
      v38 = *MEMORY[0x1E0CB3388];
      v71[0] = *MEMORY[0x1E0CB2D50];
      v71[1] = v38;
      v72[0] = v26;
      v72[1] = v37;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
    }
    else
    {
      v73 = *MEMORY[0x1E0CB2D50];
      v74 = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
    }
    goto LABEL_54;
  }
  if (p_data)
  {
    if (v60 != 3)
      std::__throw_bad_optional_access[abi:ne180100]();
    if (v62 != 2)
      std::__throw_bad_variant_access[abi:ne180100]();
    *p_data = objc_retainAutorelease(v61);
  }
  if ((_DWORD)v53 == 3)
  {
    if (v55 != 2)
      std::__throw_bad_variant_access[abi:ne180100]();
    v26 = v54;
    if (!v26 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v26 = v26;
      p_data = (id *)&v26->__r_.__value_.__l.__data_;
      goto LABEL_60;
    }
    ATLLogObject();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v41 = objc_opt_class();
      LODWORD(v77.__r_.__value_.__l.__data_) = 138412290;
      *(std::string::size_type *)((char *)v77.__r_.__value_.__r.__words + 4) = v41;
      _os_log_impl(&dword_1C3511000, v40, OS_LOG_TYPE_ERROR, "Plugin returned wrong class %@", (uint8_t *)&v77, 0xCu);
    }

    v42 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Plugin returned wrong class %@"), objc_opt_class());
    v43 = (void *)v42;
    if (p_data)
    {
      v44 = *p_data;
      v45 = (void *)MEMORY[0x1E0CB35C8];
      if (*p_data)
      {
        v46 = *MEMORY[0x1E0CB3388];
        v63[0] = *MEMORY[0x1E0CB2D50];
        v63[1] = v46;
        v64[0] = v42;
        v64[1] = v44;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 2);
      }
      else
      {
        v65 = *MEMORY[0x1E0CB2D50];
        v66 = v42;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
      }
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 8, v47);
      *p_data = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_59;
  }
  ATLLogObject();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    LODWORD(v77.__r_.__value_.__l.__data_) = 67109120;
    HIDWORD(v77.__r_.__value_.__r.__words[0]) = (_DWORD)v53;
    _os_log_impl(&dword_1C3511000, v31, OS_LOG_TYPE_ERROR, "Plugin returned wrong dynamic type %d", (uint8_t *)&v77, 8u);
  }

  v32 = objc_alloc(MEMORY[0x1E0CB3940]);
  v33 = objc_msgSend(v32, "initWithFormat:", CFSTR("Plugin returned wrong dynamic type %d"), v53);
  v26 = (std::string *)v33;
  if (p_data)
  {
    v34 = *p_data;
    v35 = (void *)MEMORY[0x1E0CB35C8];
    if (*p_data)
    {
      v36 = *MEMORY[0x1E0CB3388];
      v67[0] = *MEMORY[0x1E0CB2D50];
      v67[1] = v36;
      v68[0] = v33;
      v68[1] = v34;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 2);
    }
    else
    {
      v69 = *MEMORY[0x1E0CB2D50];
      v70 = v33;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
    }
LABEL_54:
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 8, v39);
    *p_data = (id)objc_claimAutoreleasedReturnValue();

LABEL_59:
    p_data = 0;
  }
LABEL_60:

  if (!v56)
  {
    v77.__r_.__value_.__r.__words[0] = (std::string::size_type)&v53;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v77);
  }
  if (__p)
  {
    v58 = __p;
    operator delete(__p);
  }

  return p_data;
}

- (_QWORD)classChecker
{
  _QWORD *v3;

  if (result)
  {
    if (-[PluginDecoder classChecker]::onceToken != -1)
      dispatch_once(&-[PluginDecoder classChecker]::onceToken, &__block_literal_global_367);
    v3 = operator new(0x28uLL);
    v3[1] = 0;
    v3[2] = 0;
    *v3 = &off_1E7D8ADD0;
    v3[4] = -[PluginDecoder classChecker]::_allowlistedClases;
    a2[1] = v3;
    v3[3] = &off_1E7D8AD38;
    result = v3 + 3;
    *a2 = result;
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
  }
  return result;
}

- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)p_data
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD *v19;
  __shared_weak_count *cntrl;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *p_shared_owners;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  std::string *v29;
  NSObject *v30;
  std::string *v31;
  id v32;
  std::string *v33;
  NSObject *v34;
  id v35;
  uint64_t v36;
  id v37;
  void *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v52;
  std::__shared_weak_count *v53;
  Script *ptr;
  __shared_weak_count *v55;
  std::string *v56;
  std::string *v57;
  int v58;
  char v59;
  void *__p;
  void *v61;
  char *v62;
  int v63;
  id v64;
  int v65;
  _QWORD v66[2];
  _QWORD v67[2];
  uint64_t v68;
  uint64_t v69;
  _QWORD v70[2];
  _QWORD v71[2];
  uint64_t v72;
  uint64_t v73;
  _QWORD v74[2];
  _QWORD v75[2];
  uint64_t v76;
  std::string *v77;
  uint8_t buf[4];
  std::string *v79;
  std::string v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v63 = 3;
  v64 = 0;
  v65 = 2;
  v19 = operator new(0x90uLL);
  v62 = (char *)(v19 + 18);
  *(_DWORD *)v19 = 3;
  v19[1] = v14;
  *((_DWORD *)v19 + 4) = 2;
  *((_DWORD *)v19 + 6) = 3;
  v19[4] = v15;
  *((_DWORD *)v19 + 10) = 2;
  *((_DWORD *)v19 + 12) = 3;
  v19[7] = v16;
  *((_DWORD *)v19 + 16) = 2;
  *((_DWORD *)v19 + 18) = 3;
  v19[10] = v17;
  *((_DWORD *)v19 + 22) = 2;
  *((_DWORD *)v19 + 24) = 3;
  v19[13] = v18;
  *((_DWORD *)v19 + 28) = 2;
  *((_DWORD *)v19 + 30) = 4;
  v19[16] = &v63;
  *((_DWORD *)v19 + 34) = 3;
  __p = v19;
  v61 = v19 + 18;
  cntrl = self->script.__cntrl_;
  ptr = self->script.__ptr_;
  v55 = cntrl;
  if (cntrl)
  {
    v21 = (unint64_t *)((char *)cntrl + 8);
    do
      v22 = __ldxr(v21);
    while (__stxr(v22 + 1, v21));
  }
  std::string::basic_string[abi:ne180100]<0>(&v80, "parseHCIEvent");
  -[PluginDecoder classChecker](self, &v52);
  if (-[PluginDecoder globals]::onceToken != -1)
    dispatch_once(&-[PluginDecoder globals]::onceToken, &__block_literal_global_8);
  OVM::Interpreter::RunSubroutine((uint64_t *)&ptr, (uint64_t)&v80, (uint64_t *)&__p, &v52, -[PluginDecoder globals]::_globals, (uint64_t)&v56);
  v23 = v53;
  if (v53)
  {
    p_shared_owners = (unint64_t *)&v53->__shared_owners_;
    do
      v25 = __ldaxr(p_shared_owners);
    while (__stlxr(v25 - 1, p_shared_owners));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  if (SHIBYTE(v80.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v80.__r_.__value_.__l.__data_);
  v26 = (std::__shared_weak_count *)v55;
  if (v55)
  {
    v27 = (unint64_t *)((char *)v55 + 8);
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  if (!v59)
  {
    ATLLogObject();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      ctu::join<std::__wrap_iter<std::string const*>>(v56, v57, ", ", 2uLL, &v80);
      v31 = (v80.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
          ? &v80
          : (std::string *)v80.__r_.__value_.__r.__words[0];
      *(_DWORD *)buf = 136315138;
      v79 = v31;
      _os_log_impl(&dword_1C3511000, v30, OS_LOG_TYPE_ERROR, "Script execution failure: %s", buf, 0xCu);
      if (SHIBYTE(v80.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v80.__r_.__value_.__l.__data_);
    }

    v32 = objc_alloc(MEMORY[0x1E0CB3940]);
    ctu::join<std::__wrap_iter<std::string const*>>(v56, v57, ", ", 2uLL, &v80);
    if ((v80.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v33 = &v80;
    else
      v33 = (std::string *)v80.__r_.__value_.__r.__words[0];
    v29 = (std::string *)objc_msgSend(v32, "initWithFormat:", CFSTR("Script execution failure: %s"), v33);
    if (SHIBYTE(v80.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v80.__r_.__value_.__l.__data_);
      if (!p_data)
        goto LABEL_60;
    }
    else if (!p_data)
    {
      goto LABEL_60;
    }
    v40 = *p_data;
    v38 = (void *)MEMORY[0x1E0CB35C8];
    if (*p_data)
    {
      v41 = *MEMORY[0x1E0CB3388];
      v74[0] = *MEMORY[0x1E0CB2D50];
      v74[1] = v41;
      v75[0] = v29;
      v75[1] = v40;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 2);
    }
    else
    {
      v76 = *MEMORY[0x1E0CB2D50];
      v77 = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
    }
    goto LABEL_54;
  }
  if (p_data)
  {
    if (v63 != 3)
      std::__throw_bad_optional_access[abi:ne180100]();
    if (v65 != 2)
      std::__throw_bad_variant_access[abi:ne180100]();
    *p_data = objc_retainAutorelease(v64);
  }
  if ((_DWORD)v56 == 3)
  {
    if (v58 != 2)
      std::__throw_bad_variant_access[abi:ne180100]();
    v29 = v57;
    if (!v29 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v29 = v29;
      p_data = (id *)&v29->__r_.__value_.__l.__data_;
      goto LABEL_60;
    }
    ATLLogObject();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      v44 = objc_opt_class();
      LODWORD(v80.__r_.__value_.__l.__data_) = 138412290;
      *(std::string::size_type *)((char *)v80.__r_.__value_.__r.__words + 4) = v44;
      _os_log_impl(&dword_1C3511000, v43, OS_LOG_TYPE_ERROR, "Plugin returned wrong class %@", (uint8_t *)&v80, 0xCu);
    }

    v45 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Plugin returned wrong class %@"), objc_opt_class());
    v46 = (void *)v45;
    if (p_data)
    {
      v47 = *p_data;
      v48 = (void *)MEMORY[0x1E0CB35C8];
      if (*p_data)
      {
        v49 = *MEMORY[0x1E0CB3388];
        v66[0] = *MEMORY[0x1E0CB2D50];
        v66[1] = v49;
        v67[0] = v45;
        v67[1] = v47;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 2);
      }
      else
      {
        v68 = *MEMORY[0x1E0CB2D50];
        v69 = v45;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
      }
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 8, v50);
      *p_data = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_59;
  }
  ATLLogObject();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    LODWORD(v80.__r_.__value_.__l.__data_) = 67109120;
    HIDWORD(v80.__r_.__value_.__r.__words[0]) = (_DWORD)v56;
    _os_log_impl(&dword_1C3511000, v34, OS_LOG_TYPE_ERROR, "Plugin returned wrong dynamic type %d", (uint8_t *)&v80, 8u);
  }

  v35 = objc_alloc(MEMORY[0x1E0CB3940]);
  v36 = objc_msgSend(v35, "initWithFormat:", CFSTR("Plugin returned wrong dynamic type %d"), v56);
  v29 = (std::string *)v36;
  if (p_data)
  {
    v37 = *p_data;
    v38 = (void *)MEMORY[0x1E0CB35C8];
    if (*p_data)
    {
      v39 = *MEMORY[0x1E0CB3388];
      v70[0] = *MEMORY[0x1E0CB2D50];
      v70[1] = v39;
      v71[0] = v36;
      v71[1] = v37;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, v70, 2);
    }
    else
    {
      v72 = *MEMORY[0x1E0CB2D50];
      v73 = v36;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
    }
LABEL_54:
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 8, v42);
    *p_data = (id)objc_claimAutoreleasedReturnValue();

LABEL_59:
    p_data = 0;
  }
LABEL_60:

  if (!v59)
  {
    v80.__r_.__value_.__r.__words[0] = (std::string::size_type)&v56;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v80);
  }
  if (__p)
  {
    v61 = __p;
    operator delete(__p);
  }

  return p_data;
}

- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)p_data
{
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD *v16;
  __shared_weak_count *cntrl;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  std::string *v26;
  NSObject *v27;
  std::string *v28;
  id v29;
  std::string *v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v49;
  std::__shared_weak_count *v50;
  Script *ptr;
  __shared_weak_count *v52;
  std::string *v53;
  std::string *v54;
  int v55;
  char v56;
  void *__p;
  void *v58;
  char *v59;
  int v60;
  id v61;
  int v62;
  _QWORD v63[2];
  _QWORD v64[2];
  uint64_t v65;
  uint64_t v66;
  _QWORD v67[2];
  _QWORD v68[2];
  uint64_t v69;
  uint64_t v70;
  _QWORD v71[2];
  _QWORD v72[2];
  uint64_t v73;
  std::string *v74;
  uint8_t buf[4];
  std::string *v76;
  std::string v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v60 = 3;
  v61 = 0;
  v62 = 2;
  v16 = operator new(0x78uLL);
  v58 = v16 + 15;
  v59 = (char *)(v16 + 15);
  *(_DWORD *)v16 = 3;
  v16[1] = v12;
  *((_DWORD *)v16 + 4) = 2;
  *((_DWORD *)v16 + 6) = 3;
  v16[4] = v13;
  *((_DWORD *)v16 + 10) = 2;
  *((_DWORD *)v16 + 12) = 3;
  v16[7] = v14;
  *((_DWORD *)v16 + 16) = 2;
  *((_DWORD *)v16 + 18) = 3;
  v16[10] = v15;
  *((_DWORD *)v16 + 22) = 2;
  *((_DWORD *)v16 + 24) = 4;
  v16[13] = &v60;
  *((_DWORD *)v16 + 28) = 3;
  __p = v16;
  cntrl = self->script.__cntrl_;
  ptr = self->script.__ptr_;
  v52 = cntrl;
  if (cntrl)
  {
    v18 = (unint64_t *)((char *)cntrl + 8);
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
  std::string::basic_string[abi:ne180100]<0>(&v77, "GetAppletProperties");
  -[PluginDecoder classChecker](self, &v49);
  if (-[PluginDecoder globals]::onceToken != -1)
    dispatch_once(&-[PluginDecoder globals]::onceToken, &__block_literal_global_8);
  OVM::Interpreter::RunSubroutine((uint64_t *)&ptr, (uint64_t)&v77, (uint64_t *)&__p, &v49, -[PluginDecoder globals]::_globals, (uint64_t)&v53);
  v20 = v50;
  if (v50)
  {
    p_shared_owners = (unint64_t *)&v50->__shared_owners_;
    do
      v22 = __ldaxr(p_shared_owners);
    while (__stlxr(v22 - 1, p_shared_owners));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  if (SHIBYTE(v77.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v77.__r_.__value_.__l.__data_);
  v23 = (std::__shared_weak_count *)v52;
  if (v52)
  {
    v24 = (unint64_t *)((char *)v52 + 8);
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  if (!v56)
  {
    ATLLogObject();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      ctu::join<std::__wrap_iter<std::string const*>>(v53, v54, ", ", 2uLL, &v77);
      v28 = (v77.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
          ? &v77
          : (std::string *)v77.__r_.__value_.__r.__words[0];
      *(_DWORD *)buf = 136315138;
      v76 = v28;
      _os_log_impl(&dword_1C3511000, v27, OS_LOG_TYPE_ERROR, "Script execution failure: %s", buf, 0xCu);
      if (SHIBYTE(v77.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v77.__r_.__value_.__l.__data_);
    }

    v29 = objc_alloc(MEMORY[0x1E0CB3940]);
    ctu::join<std::__wrap_iter<std::string const*>>(v53, v54, ", ", 2uLL, &v77);
    if ((v77.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v30 = &v77;
    else
      v30 = (std::string *)v77.__r_.__value_.__r.__words[0];
    v26 = (std::string *)objc_msgSend(v29, "initWithFormat:", CFSTR("Script execution failure: %s"), v30);
    if (SHIBYTE(v77.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v77.__r_.__value_.__l.__data_);
      if (!p_data)
        goto LABEL_60;
    }
    else if (!p_data)
    {
      goto LABEL_60;
    }
    v37 = *p_data;
    v35 = (void *)MEMORY[0x1E0CB35C8];
    if (*p_data)
    {
      v38 = *MEMORY[0x1E0CB3388];
      v71[0] = *MEMORY[0x1E0CB2D50];
      v71[1] = v38;
      v72[0] = v26;
      v72[1] = v37;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
    }
    else
    {
      v73 = *MEMORY[0x1E0CB2D50];
      v74 = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
    }
    goto LABEL_54;
  }
  if (p_data)
  {
    if (v60 != 3)
      std::__throw_bad_optional_access[abi:ne180100]();
    if (v62 != 2)
      std::__throw_bad_variant_access[abi:ne180100]();
    *p_data = objc_retainAutorelease(v61);
  }
  if ((_DWORD)v53 == 3)
  {
    if (v55 != 2)
      std::__throw_bad_variant_access[abi:ne180100]();
    v26 = v54;
    if (!v26 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v26 = v26;
      p_data = (id *)&v26->__r_.__value_.__l.__data_;
      goto LABEL_60;
    }
    ATLLogObject();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v41 = objc_opt_class();
      LODWORD(v77.__r_.__value_.__l.__data_) = 138412290;
      *(std::string::size_type *)((char *)v77.__r_.__value_.__r.__words + 4) = v41;
      _os_log_impl(&dword_1C3511000, v40, OS_LOG_TYPE_ERROR, "Plugin returned wrong class %@", (uint8_t *)&v77, 0xCu);
    }

    v42 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Plugin returned wrong class %@"), objc_opt_class());
    v43 = (void *)v42;
    if (p_data)
    {
      v44 = *p_data;
      v45 = (void *)MEMORY[0x1E0CB35C8];
      if (*p_data)
      {
        v46 = *MEMORY[0x1E0CB3388];
        v63[0] = *MEMORY[0x1E0CB2D50];
        v63[1] = v46;
        v64[0] = v42;
        v64[1] = v44;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 2);
      }
      else
      {
        v65 = *MEMORY[0x1E0CB2D50];
        v66 = v42;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
      }
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 8, v47);
      *p_data = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_59;
  }
  ATLLogObject();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    LODWORD(v77.__r_.__value_.__l.__data_) = 67109120;
    HIDWORD(v77.__r_.__value_.__r.__words[0]) = (_DWORD)v53;
    _os_log_impl(&dword_1C3511000, v31, OS_LOG_TYPE_ERROR, "Plugin returned wrong dynamic type %d", (uint8_t *)&v77, 8u);
  }

  v32 = objc_alloc(MEMORY[0x1E0CB3940]);
  v33 = objc_msgSend(v32, "initWithFormat:", CFSTR("Plugin returned wrong dynamic type %d"), v53);
  v26 = (std::string *)v33;
  if (p_data)
  {
    v34 = *p_data;
    v35 = (void *)MEMORY[0x1E0CB35C8];
    if (*p_data)
    {
      v36 = *MEMORY[0x1E0CB3388];
      v67[0] = *MEMORY[0x1E0CB2D50];
      v67[1] = v36;
      v68[0] = v33;
      v68[1] = v34;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 2);
    }
    else
    {
      v69 = *MEMORY[0x1E0CB2D50];
      v70 = v33;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
    }
LABEL_54:
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 8, v39);
    *p_data = (id)objc_claimAutoreleasedReturnValue();

LABEL_59:
    p_data = 0;
  }
LABEL_60:

  if (!v56)
  {
    v77.__r_.__value_.__r.__words[0] = (std::string::size_type)&v53;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v77);
  }
  if (__p)
  {
    v58 = __p;
    operator delete(__p);
  }

  return p_data;
}

- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)p_data
{
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD *v16;
  __shared_weak_count *cntrl;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  id v26;
  NSObject *v27;
  std::string *v28;
  id v29;
  std::string *v30;
  std::string *v31;
  NSObject *v32;
  id v33;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v50;
  std::__shared_weak_count *v51;
  Script *ptr;
  __shared_weak_count *v53;
  std::string *v54;
  std::string *v55;
  int v56;
  char v57;
  void *__p;
  void *v59;
  char *v60;
  int v61;
  id v62;
  int v63;
  _QWORD v64[2];
  _QWORD v65[2];
  uint64_t v66;
  uint64_t v67;
  _QWORD v68[2];
  _QWORD v69[2];
  uint64_t v70;
  uint64_t v71;
  _QWORD v72[2];
  _QWORD v73[2];
  uint64_t v74;
  std::string *v75;
  uint8_t buf[4];
  std::string *v77;
  std::string v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v61 = 3;
  v62 = 0;
  v63 = 2;
  v16 = operator new(0x78uLL);
  v59 = v16 + 15;
  v60 = (char *)(v16 + 15);
  *(_DWORD *)v16 = 3;
  v16[1] = v13;
  *((_DWORD *)v16 + 4) = 2;
  *((_DWORD *)v16 + 6) = 3;
  v16[4] = v14;
  *((_DWORD *)v16 + 10) = 2;
  *((_DWORD *)v16 + 12) = 3;
  v16[7] = v15;
  *((_DWORD *)v16 + 16) = 2;
  *((_DWORD *)v16 + 18) = 3;
  v16[10] = v12;
  *((_DWORD *)v16 + 22) = 2;
  *((_DWORD *)v16 + 24) = 4;
  v16[13] = &v61;
  *((_DWORD *)v16 + 28) = 3;
  __p = v16;
  cntrl = self->script.__cntrl_;
  ptr = self->script.__ptr_;
  v53 = cntrl;
  if (cntrl)
  {
    v18 = (unint64_t *)((char *)cntrl + 8);
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
  std::string::basic_string[abi:ne180100]<0>(&v78, "processEndOfTransaction");
  -[PluginDecoder classChecker](self, &v50);
  if (-[PluginDecoder globals]::onceToken != -1)
    dispatch_once(&-[PluginDecoder globals]::onceToken, &__block_literal_global_8);
  OVM::Interpreter::RunSubroutine((uint64_t *)&ptr, (uint64_t)&v78, (uint64_t *)&__p, &v50, -[PluginDecoder globals]::_globals, (uint64_t)&v54);
  v20 = v51;
  if (v51)
  {
    p_shared_owners = (unint64_t *)&v51->__shared_owners_;
    do
      v22 = __ldaxr(p_shared_owners);
    while (__stlxr(v22 - 1, p_shared_owners));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  if (SHIBYTE(v78.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v78.__r_.__value_.__l.__data_);
  v23 = (std::__shared_weak_count *)v53;
  if (v53)
  {
    v24 = (unint64_t *)((char *)v53 + 8);
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  if (!v57)
  {
    ATLLogObject();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      ctu::join<std::__wrap_iter<std::string const*>>(v54, v55, ", ", 2uLL, &v78);
      v28 = (v78.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
          ? &v78
          : (std::string *)v78.__r_.__value_.__r.__words[0];
      *(_DWORD *)buf = 136315138;
      v77 = v28;
      _os_log_impl(&dword_1C3511000, v27, OS_LOG_TYPE_ERROR, "Script execution failure: %s", buf, 0xCu);
      if (SHIBYTE(v78.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v78.__r_.__value_.__l.__data_);
    }

    v29 = objc_alloc(MEMORY[0x1E0CB3940]);
    ctu::join<std::__wrap_iter<std::string const*>>(v54, v55, ", ", 2uLL, &v78);
    if ((v78.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v30 = &v78;
    else
      v30 = (std::string *)v78.__r_.__value_.__r.__words[0];
    v31 = (std::string *)objc_msgSend(v29, "initWithFormat:", CFSTR("Script execution failure: %s"), v30);
    if (SHIBYTE(v78.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v78.__r_.__value_.__l.__data_);
      if (!p_data)
        goto LABEL_62;
    }
    else if (!p_data)
    {
      goto LABEL_62;
    }
    v38 = *p_data;
    v36 = (void *)MEMORY[0x1E0CB35C8];
    if (*p_data)
    {
      v39 = *MEMORY[0x1E0CB3388];
      v72[0] = *MEMORY[0x1E0CB2D50];
      v72[1] = v39;
      v73[0] = v31;
      v73[1] = v38;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 2);
    }
    else
    {
      v74 = *MEMORY[0x1E0CB2D50];
      v75 = v31;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
    }
    goto LABEL_56;
  }
  if (p_data)
  {
    if (v61 == 3)
    {
      if (v63 != 2)
        std::__throw_bad_variant_access[abi:ne180100]();
      v26 = objc_retainAutorelease(v62);
    }
    else
    {
      v26 = 0;
    }
    *p_data = v26;
  }
  if ((_DWORD)v54 == 3)
  {
    if (v56 != 2)
      std::__throw_bad_variant_access[abi:ne180100]();
    v31 = v55;
    if (!v31 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v31 = v31;
      p_data = (id *)&v31->__r_.__value_.__l.__data_;
      goto LABEL_62;
    }
    ATLLogObject();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v42 = objc_opt_class();
      LODWORD(v78.__r_.__value_.__l.__data_) = 138412290;
      *(std::string::size_type *)((char *)v78.__r_.__value_.__r.__words + 4) = v42;
      _os_log_impl(&dword_1C3511000, v41, OS_LOG_TYPE_ERROR, "Plugin returned wrong class %@", (uint8_t *)&v78, 0xCu);
    }

    v43 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Plugin returned wrong class %@"), objc_opt_class());
    v44 = (void *)v43;
    if (p_data)
    {
      v45 = *p_data;
      v46 = (void *)MEMORY[0x1E0CB35C8];
      if (*p_data)
      {
        v47 = *MEMORY[0x1E0CB3388];
        v64[0] = *MEMORY[0x1E0CB2D50];
        v64[1] = v47;
        v65[0] = v43;
        v65[1] = v45;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
      }
      else
      {
        v66 = *MEMORY[0x1E0CB2D50];
        v67 = v43;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
      }
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 8, v48);
      *p_data = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_61;
  }
  ATLLogObject();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    LODWORD(v78.__r_.__value_.__l.__data_) = 67109120;
    HIDWORD(v78.__r_.__value_.__r.__words[0]) = (_DWORD)v54;
    _os_log_impl(&dword_1C3511000, v32, OS_LOG_TYPE_ERROR, "Plugin returned wrong dynamic type %d", (uint8_t *)&v78, 8u);
  }

  v33 = objc_alloc(MEMORY[0x1E0CB3940]);
  v34 = objc_msgSend(v33, "initWithFormat:", CFSTR("Plugin returned wrong dynamic type %d"), v54);
  v31 = (std::string *)v34;
  if (p_data)
  {
    v35 = *p_data;
    v36 = (void *)MEMORY[0x1E0CB35C8];
    if (*p_data)
    {
      v37 = *MEMORY[0x1E0CB3388];
      v68[0] = *MEMORY[0x1E0CB2D50];
      v68[1] = v37;
      v69[0] = v34;
      v69[1] = v35;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 2);
    }
    else
    {
      v70 = *MEMORY[0x1E0CB2D50];
      v71 = v34;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
    }
LABEL_56:
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 8, v40);
    *p_data = (id)objc_claimAutoreleasedReturnValue();

LABEL_61:
    p_data = 0;
  }
LABEL_62:

  if (!v57)
  {
    v78.__r_.__value_.__r.__words[0] = (std::string::size_type)&v54;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v78);
  }
  if (__p)
  {
    v59 = __p;
    operator delete(__p);
  }

  return p_data;
}

- (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withPublicKey:(id)a6 withEncryptionScheme:(id)a7 withTransceiver:(id)a8 withError:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD *v21;
  __shared_weak_count *cntrl;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *p_shared_owners;
  unint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  id v31;
  NSObject *v32;
  std::string *v33;
  id v34;
  std::string *v35;
  std::string *v36;
  std::string *v37;
  NSObject *v38;
  id v39;
  uint64_t v40;
  id v41;
  void *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  id v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v54;
  uint64_t v55;
  std::__shared_weak_count *v56;
  Script *ptr;
  __shared_weak_count *v58;
  std::string *v59;
  std::string *v60;
  int v61;
  char v62;
  void *__p;
  void *v64;
  char *v65;
  int v66;
  id v67;
  int v68;
  _QWORD v69[2];
  _QWORD v70[2];
  uint64_t v71;
  void *v72;
  _QWORD v73[2];
  _QWORD v74[2];
  uint64_t v75;
  uint64_t v76;
  _QWORD v77[2];
  _QWORD v78[2];
  uint64_t v79;
  std::string *v80;
  uint8_t buf[4];
  std::string *v82;
  std::string v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v66 = 3;
  v67 = 0;
  v68 = 2;
  v21 = operator new(0xA8uLL);
  v65 = (char *)(v21 + 21);
  *(_DWORD *)v21 = 3;
  v21[1] = v15;
  *((_DWORD *)v21 + 4) = 2;
  *((_DWORD *)v21 + 6) = 3;
  v21[4] = v16;
  *((_DWORD *)v21 + 10) = 2;
  *((_DWORD *)v21 + 12) = 3;
  v21[7] = v17;
  *((_DWORD *)v21 + 16) = 2;
  *((_DWORD *)v21 + 18) = 3;
  v21[10] = v18;
  *((_DWORD *)v21 + 22) = 2;
  *((_DWORD *)v21 + 24) = 3;
  v21[13] = v19;
  *((_DWORD *)v21 + 28) = 2;
  *((_DWORD *)v21 + 30) = 3;
  v21[16] = v20;
  *((_DWORD *)v21 + 34) = 2;
  *((_DWORD *)v21 + 36) = 4;
  v21[19] = &v66;
  *((_DWORD *)v21 + 40) = 3;
  __p = v21;
  v64 = v21 + 21;
  cntrl = self->script.__cntrl_;
  ptr = self->script.__ptr_;
  v58 = cntrl;
  if (cntrl)
  {
    v23 = (unint64_t *)((char *)cntrl + 8);
    do
      v24 = __ldxr(v23);
    while (__stxr(v24 + 1, v23));
  }
  std::string::basic_string[abi:ne180100]<0>(&v83, "getServiceProviderDataWithEncryptionScheme");
  -[PluginDecoder classChecker](self, &v55);
  if (-[PluginDecoder globals]::onceToken != -1)
    dispatch_once(&-[PluginDecoder globals]::onceToken, &__block_literal_global_8);
  OVM::Interpreter::RunSubroutine((uint64_t *)&ptr, (uint64_t)&v83, (uint64_t *)&__p, &v55, -[PluginDecoder globals]::_globals, (uint64_t)&v59);
  v25 = v56;
  if (v56)
  {
    p_shared_owners = (unint64_t *)&v56->__shared_owners_;
    do
      v27 = __ldaxr(p_shared_owners);
    while (__stlxr(v27 - 1, p_shared_owners));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v83.__r_.__value_.__l.__data_);
  v28 = (std::__shared_weak_count *)v58;
  if (v58)
  {
    v29 = (unint64_t *)((char *)v58 + 8);
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  if (!v62)
  {
    ATLLogObject();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      ctu::join<std::__wrap_iter<std::string const*>>(v59, v60, ", ", 2uLL, &v83);
      v33 = (v83.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
          ? &v83
          : (std::string *)v83.__r_.__value_.__r.__words[0];
      *(_DWORD *)buf = 136315138;
      v82 = v33;
      _os_log_impl(&dword_1C3511000, v32, OS_LOG_TYPE_ERROR, "Script execution failure: %s", buf, 0xCu);
      if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v83.__r_.__value_.__l.__data_);
    }

    v34 = objc_alloc(MEMORY[0x1E0CB3940]);
    ctu::join<std::__wrap_iter<std::string const*>>(v59, v60, ", ", 2uLL, &v83);
    if ((v83.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v35 = &v83;
    else
      v35 = (std::string *)v83.__r_.__value_.__r.__words[0];
    v36 = (std::string *)objc_msgSend(v34, "initWithFormat:", CFSTR("Script execution failure: %s"), v35);
    if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v83.__r_.__value_.__l.__data_);
      if (!a9)
        goto LABEL_61;
    }
    else if (!a9)
    {
      goto LABEL_61;
    }
    v44 = *a9;
    v42 = (void *)MEMORY[0x1E0CB35C8];
    if (*a9)
    {
      v45 = *MEMORY[0x1E0CB3388];
      v77[0] = *MEMORY[0x1E0CB2D50];
      v77[1] = v45;
      v78[0] = v36;
      v78[1] = v44;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, v77, 2);
    }
    else
    {
      v79 = *MEMORY[0x1E0CB2D50];
      v80 = v36;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
    }
LABEL_56:
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 8, v46);
    *a9 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_61;
  }
  if (a9)
  {
    if (v66 == 3)
    {
      if (v68 != 2)
        std::__throw_bad_variant_access[abi:ne180100]();
      v31 = objc_retainAutorelease(v67);
    }
    else
    {
      v31 = 0;
    }
    *a9 = v31;
  }
  if ((_DWORD)v59 != 3)
  {
    ATLLogObject();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v83.__r_.__value_.__l.__data_) = 67109120;
      HIDWORD(v83.__r_.__value_.__r.__words[0]) = (_DWORD)v59;
      _os_log_impl(&dword_1C3511000, v38, OS_LOG_TYPE_ERROR, "Plugin returned wrong dynamic type %d", (uint8_t *)&v83, 8u);
    }

    v39 = objc_alloc(MEMORY[0x1E0CB3940]);
    v40 = objc_msgSend(v39, "initWithFormat:", CFSTR("Plugin returned wrong dynamic type %d"), v59);
    v36 = (std::string *)v40;
    if (!a9)
      goto LABEL_61;
    v41 = *a9;
    v42 = (void *)MEMORY[0x1E0CB35C8];
    if (*a9)
    {
      v43 = *MEMORY[0x1E0CB3388];
      v73[0] = *MEMORY[0x1E0CB2D50];
      v73[1] = v43;
      v74[0] = v40;
      v74[1] = v41;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 2);
    }
    else
    {
      v75 = *MEMORY[0x1E0CB2D50];
      v76 = v40;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
    }
    goto LABEL_56;
  }
  if (v61 != 2)
    std::__throw_bad_variant_access[abi:ne180100]();
  v36 = v60;
  if (!v36 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v36 = v36;
    v37 = v36;
    goto LABEL_62;
  }
  ATLLogObject();
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
  {
    v48 = objc_opt_class();
    LODWORD(v83.__r_.__value_.__l.__data_) = 138412290;
    *(std::string::size_type *)((char *)v83.__r_.__value_.__r.__words + 4) = v48;
    _os_log_impl(&dword_1C3511000, v47, OS_LOG_TYPE_ERROR, "Plugin returned wrong class %@", (uint8_t *)&v83, 0xCu);
  }

  v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Plugin returned wrong class %@"), objc_opt_class());
  if (a9)
  {
    v49 = *a9;
    v50 = (void *)MEMORY[0x1E0CB35C8];
    if (*a9)
    {
      v51 = *MEMORY[0x1E0CB3388];
      v69[0] = *MEMORY[0x1E0CB2D50];
      v69[1] = v51;
      v70[0] = v54;
      v70[1] = v49;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v69, 2);
    }
    else
    {
      v71 = *MEMORY[0x1E0CB2D50];
      v72 = v54;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
    }
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 8, v52);
    *a9 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_61:
  v37 = 0;
LABEL_62:

  if (!v62)
  {
    v83.__r_.__value_.__r.__words[0] = (std::string::size_type)&v59;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v83);
  }
  if (__p)
  {
    v64 = __p;
    operator delete(__p);
  }

  return v37;
}

- (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)p_data
{
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD *v16;
  __shared_weak_count *cntrl;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  id v26;
  NSObject *v27;
  std::string *v28;
  id v29;
  std::string *v30;
  std::string *v31;
  NSObject *v32;
  id v33;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v50;
  std::__shared_weak_count *v51;
  Script *ptr;
  __shared_weak_count *v53;
  std::string *v54;
  std::string *v55;
  int v56;
  char v57;
  void *__p;
  void *v59;
  char *v60;
  int v61;
  id v62;
  int v63;
  _QWORD v64[2];
  _QWORD v65[2];
  uint64_t v66;
  uint64_t v67;
  _QWORD v68[2];
  _QWORD v69[2];
  uint64_t v70;
  uint64_t v71;
  _QWORD v72[2];
  _QWORD v73[2];
  uint64_t v74;
  std::string *v75;
  uint8_t buf[4];
  std::string *v77;
  std::string v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v61 = 3;
  v62 = 0;
  v63 = 2;
  v16 = operator new(0x78uLL);
  v59 = v16 + 15;
  v60 = (char *)(v16 + 15);
  *(_DWORD *)v16 = 3;
  v16[1] = v12;
  *((_DWORD *)v16 + 4) = 2;
  *((_DWORD *)v16 + 6) = 3;
  v16[4] = v13;
  *((_DWORD *)v16 + 10) = 2;
  *((_DWORD *)v16 + 12) = 3;
  v16[7] = v14;
  *((_DWORD *)v16 + 16) = 2;
  *((_DWORD *)v16 + 18) = 3;
  v16[10] = v15;
  *((_DWORD *)v16 + 22) = 2;
  *((_DWORD *)v16 + 24) = 4;
  v16[13] = &v61;
  *((_DWORD *)v16 + 28) = 3;
  __p = v16;
  cntrl = self->script.__cntrl_;
  ptr = self->script.__ptr_;
  v53 = cntrl;
  if (cntrl)
  {
    v18 = (unint64_t *)((char *)cntrl + 8);
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
  std::string::basic_string[abi:ne180100]<0>(&v78, "getServiceProviderData");
  -[PluginDecoder classChecker](self, &v50);
  if (-[PluginDecoder globals]::onceToken != -1)
    dispatch_once(&-[PluginDecoder globals]::onceToken, &__block_literal_global_8);
  OVM::Interpreter::RunSubroutine((uint64_t *)&ptr, (uint64_t)&v78, (uint64_t *)&__p, &v50, -[PluginDecoder globals]::_globals, (uint64_t)&v54);
  v20 = v51;
  if (v51)
  {
    p_shared_owners = (unint64_t *)&v51->__shared_owners_;
    do
      v22 = __ldaxr(p_shared_owners);
    while (__stlxr(v22 - 1, p_shared_owners));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  if (SHIBYTE(v78.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v78.__r_.__value_.__l.__data_);
  v23 = (std::__shared_weak_count *)v53;
  if (v53)
  {
    v24 = (unint64_t *)((char *)v53 + 8);
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  if (!v57)
  {
    ATLLogObject();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      ctu::join<std::__wrap_iter<std::string const*>>(v54, v55, ", ", 2uLL, &v78);
      v28 = (v78.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
          ? &v78
          : (std::string *)v78.__r_.__value_.__r.__words[0];
      *(_DWORD *)buf = 136315138;
      v77 = v28;
      _os_log_impl(&dword_1C3511000, v27, OS_LOG_TYPE_ERROR, "Script execution failure: %s", buf, 0xCu);
      if (SHIBYTE(v78.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v78.__r_.__value_.__l.__data_);
    }

    v29 = objc_alloc(MEMORY[0x1E0CB3940]);
    ctu::join<std::__wrap_iter<std::string const*>>(v54, v55, ", ", 2uLL, &v78);
    if ((v78.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v30 = &v78;
    else
      v30 = (std::string *)v78.__r_.__value_.__r.__words[0];
    v31 = (std::string *)objc_msgSend(v29, "initWithFormat:", CFSTR("Script execution failure: %s"), v30);
    if (SHIBYTE(v78.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v78.__r_.__value_.__l.__data_);
      if (!p_data)
        goto LABEL_62;
    }
    else if (!p_data)
    {
      goto LABEL_62;
    }
    v38 = *p_data;
    v36 = (void *)MEMORY[0x1E0CB35C8];
    if (*p_data)
    {
      v39 = *MEMORY[0x1E0CB3388];
      v72[0] = *MEMORY[0x1E0CB2D50];
      v72[1] = v39;
      v73[0] = v31;
      v73[1] = v38;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 2);
    }
    else
    {
      v74 = *MEMORY[0x1E0CB2D50];
      v75 = v31;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
    }
    goto LABEL_56;
  }
  if (p_data)
  {
    if (v61 == 3)
    {
      if (v63 != 2)
        std::__throw_bad_variant_access[abi:ne180100]();
      v26 = objc_retainAutorelease(v62);
    }
    else
    {
      v26 = 0;
    }
    *p_data = v26;
  }
  if ((_DWORD)v54 == 3)
  {
    if (v56 != 2)
      std::__throw_bad_variant_access[abi:ne180100]();
    v31 = v55;
    if (!v31 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v31 = v31;
      p_data = (id *)&v31->__r_.__value_.__l.__data_;
      goto LABEL_62;
    }
    ATLLogObject();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v42 = objc_opt_class();
      LODWORD(v78.__r_.__value_.__l.__data_) = 138412290;
      *(std::string::size_type *)((char *)v78.__r_.__value_.__r.__words + 4) = v42;
      _os_log_impl(&dword_1C3511000, v41, OS_LOG_TYPE_ERROR, "Plugin returned wrong class %@", (uint8_t *)&v78, 0xCu);
    }

    v43 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Plugin returned wrong class %@"), objc_opt_class());
    v44 = (void *)v43;
    if (p_data)
    {
      v45 = *p_data;
      v46 = (void *)MEMORY[0x1E0CB35C8];
      if (*p_data)
      {
        v47 = *MEMORY[0x1E0CB3388];
        v64[0] = *MEMORY[0x1E0CB2D50];
        v64[1] = v47;
        v65[0] = v43;
        v65[1] = v45;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
      }
      else
      {
        v66 = *MEMORY[0x1E0CB2D50];
        v67 = v43;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
      }
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 8, v48);
      *p_data = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_61;
  }
  ATLLogObject();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    LODWORD(v78.__r_.__value_.__l.__data_) = 67109120;
    HIDWORD(v78.__r_.__value_.__r.__words[0]) = (_DWORD)v54;
    _os_log_impl(&dword_1C3511000, v32, OS_LOG_TYPE_ERROR, "Plugin returned wrong dynamic type %d", (uint8_t *)&v78, 8u);
  }

  v33 = objc_alloc(MEMORY[0x1E0CB3940]);
  v34 = objc_msgSend(v33, "initWithFormat:", CFSTR("Plugin returned wrong dynamic type %d"), v54);
  v31 = (std::string *)v34;
  if (p_data)
  {
    v35 = *p_data;
    v36 = (void *)MEMORY[0x1E0CB35C8];
    if (*p_data)
    {
      v37 = *MEMORY[0x1E0CB3388];
      v68[0] = *MEMORY[0x1E0CB2D50];
      v68[1] = v37;
      v69[0] = v34;
      v69[1] = v35;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 2);
    }
    else
    {
      v70 = *MEMORY[0x1E0CB2D50];
      v71 = v34;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
    }
LABEL_56:
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 8, v40);
    *p_data = (id)objc_claimAutoreleasedReturnValue();

LABEL_61:
    p_data = 0;
  }
LABEL_62:

  if (!v57)
  {
    v78.__r_.__value_.__r.__words[0] = (std::string::size_type)&v54;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v78);
  }
  if (__p)
  {
    v59 = __p;
    operator delete(__p);
  }

  return p_data;
}

void __24__PluginDecoder_globals__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4[3];
  int v5;
  uint64_t v6;
  int v7;
  _QWORD v8[3];
  int v9;
  uint64_t v10;
  int v11;
  _QWORD v12[3];
  int v13;
  uint64_t v14;
  int v15;
  _QWORD v16[3];
  int v17;
  uint64_t v18;
  int v19;
  _QWORD v20[3];
  int v21;
  uint64_t v22;
  int v23;
  _QWORD v24[3];
  int v25;
  uint64_t v26;
  int v27;
  _QWORD v28[3];
  int v29;
  uint64_t v30;
  int v31;
  _QWORD v32[3];
  int v33;
  uint64_t v34;
  int v35;
  _QWORD v36[3];
  int v37;
  uint64_t v38;
  int v39;
  _QWORD v40[3];
  int v41;
  uint64_t v42;
  int v43;
  _QWORD v44[3];
  int v45;
  uint64_t v46;
  int v47;
  _QWORD v48[3];
  int v49;
  uint64_t v50;
  int v51;
  _QWORD v52[3];
  int v53;
  uint64_t v54;
  int v55;
  _QWORD v56[3];
  int v57;
  uint64_t v58;
  int v59;
  _QWORD v60[3];
  int v61;
  uint64_t v62;
  int v63;
  _QWORD v64[3];
  int v65;
  uint64_t v66;
  int v67;
  _QWORD v68[3];
  int v69;
  uint64_t v70;
  int v71;
  _QWORD v72[3];
  int v73;
  uint64_t v74;
  int v75;
  _QWORD v76[3];
  int v77;
  uint64_t v78;
  int v79;
  _QWORD v80[3];
  int v81;
  uint64_t v82;
  int v83;
  _QWORD v84[3];
  int v85;
  uint64_t v86;
  int v87;
  _QWORD v88[3];
  int v89;
  uint64_t v90;
  int v91;
  _QWORD v92[3];
  int v93;
  uint64_t v94;
  int v95;
  _QWORD v96[3];
  int v97;
  uint64_t v98;
  int v99;
  _QWORD v100[3];
  int v101;
  uint64_t v102;
  int v103;
  _QWORD v104[3];
  int v105;
  uint64_t v106;
  int v107;
  _QWORD v108[3];
  int v109;
  const __CFString *v110;
  int v111;
  _QWORD v112[3];
  int v113;
  const __CFString *v114;
  int v115;
  _QWORD v116[3];
  int v117;
  const __CFString *v118;
  int v119;
  _QWORD v120[3];
  int v121;
  const __CFString *v122;
  int v123;
  _QWORD v124[3];
  int v125;
  const __CFString *v126;
  int v127;
  _QWORD v128[3];
  int v129;
  const __CFString *v130;
  int v131;
  _QWORD v132[3];
  int v133;
  const __CFString *v134;
  int v135;
  _QWORD v136[3];
  int v137;
  const __CFString *v138;
  int v139;
  _QWORD v140[3];
  int v141;
  const __CFString *v142;
  int v143;
  _QWORD v144[3];
  int v145;
  const __CFString *v146;
  int v147;
  _QWORD v148[3];
  int v149;
  const __CFString *v150;
  int v151;
  _QWORD v152[3];
  int v153;
  const __CFString *v154;
  int v155;
  _QWORD v156[3];
  int v157;
  const __CFString *v158;
  int v159;
  _QWORD v160[3];
  int v161;
  const __CFString *v162;
  int v163;
  _QWORD v164[3];
  int v165;
  const __CFString *v166;
  int v167;
  _QWORD v168[3];
  int v169;
  const __CFString *v170;
  int v171;
  _QWORD v172[3];
  int v173;
  const __CFString *v174;
  int v175;
  _QWORD v176[3];
  int v177;
  const __CFString *v178;
  int v179;
  _QWORD v180[3];
  int v181;
  const __CFString *v182;
  int v183;
  _QWORD v184[3];
  int v185;
  const __CFString *v186;
  int v187;
  _QWORD v188[3];
  int v189;
  const __CFString *v190;
  int v191;
  _QWORD v192[3];
  int v193;
  const __CFString *v194;
  int v195;
  _QWORD v196[3];
  int v197;
  const __CFString *v198;
  int v199;
  _QWORD v200[3];
  int v201;
  const __CFString *v202;
  int v203;
  _QWORD v204[3];
  int v205;
  const __CFString *v206;
  int v207;
  _QWORD v208[3];
  int v209;
  const __CFString *v210;
  int v211;
  _QWORD v212[3];
  int v213;
  const __CFString *v214;
  int v215;
  _QWORD v216[3];
  int v217;
  const __CFString *v218;
  int v219;
  _QWORD v220[3];
  int v221;
  const __CFString *v222;
  int v223;
  uint64_t v224;

  v224 = *MEMORY[0x1E0C80C00];
  v0 = operator new();
  std::string::basic_string[abi:ne180100]<0>(v4, "ATLErrorAppletNotSupported");
  v5 = 2;
  v6 = 2;
  v7 = 1;
  std::string::basic_string[abi:ne180100]<0>(v8, "ATLErrorHCIDataMalformed");
  v9 = 2;
  v10 = 3;
  v11 = 1;
  std::string::basic_string[abi:ne180100]<0>(v12, "ATLErrorSETransceiveTransport");
  v13 = 2;
  v14 = 4;
  v15 = 1;
  std::string::basic_string[abi:ne180100]<0>(v16, "ATLErrorSETransceiveLogical");
  v17 = 2;
  v18 = 5;
  v19 = 1;
  std::string::basic_string[abi:ne180100]<0>(v20, "ATLErrorInvalidParameter");
  v21 = 2;
  v22 = 6;
  v23 = 1;
  std::string::basic_string[abi:ne180100]<0>(v24, "ATLErrorUnknown");
  v25 = 2;
  v26 = 8;
  v27 = 1;
  std::string::basic_string[abi:ne180100]<0>(v28, "NSLocalizedDescriptionKey");
  v1 = *MEMORY[0x1E0CB2D50];
  v29 = 3;
  v30 = v1;
  v31 = 2;
  std::string::basic_string[abi:ne180100]<0>(v32, "NSUnderlyingErrorKey");
  v2 = *MEMORY[0x1E0CB3388];
  v33 = 3;
  v34 = v2;
  v35 = 2;
  std::string::basic_string[abi:ne180100]<0>(v36, "OS_LOG_TYPE_INFO");
  v37 = 2;
  v38 = 1;
  v39 = 1;
  std::string::basic_string[abi:ne180100]<0>(v40, "OS_LOG_TYPE_ERROR");
  v41 = 2;
  v42 = 16;
  v43 = 1;
  std::string::basic_string[abi:ne180100]<0>(v44, "NFContactlessPaymentTypePurchase");
  v45 = 2;
  v46 = 0;
  v47 = 1;
  std::string::basic_string[abi:ne180100]<0>(v48, "NFContactlessPaymentTypeCashback");
  v49 = 2;
  v50 = 1;
  v51 = 1;
  std::string::basic_string[abi:ne180100]<0>(v52, "NFContactlessPaymentTypeVoidRefund");
  v53 = 2;
  v54 = 2;
  v55 = 1;
  std::string::basic_string[abi:ne180100]<0>(v56, "NFContactlessPaymentTypePurchaseWithCashback");
  v57 = 2;
  v58 = 9;
  v59 = 1;
  std::string::basic_string[abi:ne180100]<0>(v60, "NFContactlessPaymentTypeCashDisbursement");
  v61 = 2;
  v62 = 23;
  v63 = 1;
  std::string::basic_string[abi:ne180100]<0>(v64, "NFContactlessPaymentTypeRefundPurchase");
  v65 = 2;
  v66 = 32;
  v67 = 1;
  std::string::basic_string[abi:ne180100]<0>(v68, "NFContactlessPaymentTypeVoidPurchase");
  v69 = 2;
  v70 = 34;
  v71 = 1;
  std::string::basic_string[abi:ne180100]<0>(v72, "NFContactlessPaymentTypeFelica");
  v73 = 2;
  v74 = 256;
  v75 = 1;
  std::string::basic_string[abi:ne180100]<0>(v76, "NFContactlessPaymentTypeParsed");
  v77 = 2;
  v78 = 61441;
  v79 = 1;
  std::string::basic_string[abi:ne180100]<0>(v80, "NFContactlessPaymentTypeUnknown");
  v81 = 2;
  v82 = 0xFFFFLL;
  v83 = 1;
  std::string::basic_string[abi:ne180100]<0>(v84, "NFContactlessPaymentResultOfflineDeclined");
  v85 = 2;
  v86 = 0;
  v87 = 1;
  std::string::basic_string[abi:ne180100]<0>(v88, "NFContactlessPaymentResultOfflineApproved");
  v89 = 2;
  v90 = 64;
  v91 = 1;
  std::string::basic_string[abi:ne180100]<0>(v92, "NFContactlessPaymentResultOnlinePendingApproval");
  v93 = 2;
  v94 = 128;
  v95 = 1;
  std::string::basic_string[abi:ne180100]<0>(v96, "NFContactlessPaymentResultCommandFailed");
  v97 = 2;
  v98 = 256;
  v99 = 1;
  std::string::basic_string[abi:ne180100]<0>(v100, "NFContactlessPaymentResultFieldTear");
  v101 = 2;
  v102 = 61440;
  v103 = 1;
  std::string::basic_string[abi:ne180100]<0>(v104, "NFContactlessPaymentResultIncompatibleApplet");
  v105 = 2;
  v106 = 61444;
  v107 = 1;
  std::string::basic_string[abi:ne180100]<0>(v108, "ATLHCIEventType");
  v109 = 3;
  v110 = CFSTR("EventType");
  v111 = 2;
  std::string::basic_string[abi:ne180100]<0>(v112, "ATLHCIEventTypeStart");
  v113 = 3;
  v114 = CFSTR("StartEvent");
  v115 = 2;
  std::string::basic_string[abi:ne180100]<0>(v116, "ATLHCIEventTypeEnd");
  v117 = 3;
  v118 = CFSTR("EndEvent");
  v119 = 2;
  std::string::basic_string[abi:ne180100]<0>(v120, "ATLHCIEventTypeActivityTimeout");
  v121 = 3;
  v122 = CFSTR("ActivityTimeout");
  v123 = 2;
  std::string::basic_string[abi:ne180100]<0>(v124, "ATLHCIEventFormatVersion");
  v125 = 3;
  v126 = CFSTR("Version");
  v127 = 2;
  std::string::basic_string[abi:ne180100]<0>(v128, "ATLStartEventIgnoreRFEvents");
  v129 = 3;
  v130 = CFSTR("IgnoreRFEvents");
  v131 = 2;
  std::string::basic_string[abi:ne180100]<0>(v132, "ATLStartEventDontWaitForEOT");
  v133 = 3;
  v134 = CFSTR("DontWaitForEOT");
  v135 = 2;
  std::string::basic_string[abi:ne180100]<0>(v136, "ATLStartEventRequiresPowerCycle");
  v137 = 3;
  v138 = CFSTR("RequiresPowerCycle");
  v139 = 2;
  std::string::basic_string[abi:ne180100]<0>(v140, "ATLStartEventDelayExpressReentryMS");
  v141 = 3;
  v142 = CFSTR("DelayExpressReentry");
  v143 = 2;
  std::string::basic_string[abi:ne180100]<0>(v144, "ATLActivityTimeoutResult");
  v145 = 3;
  v146 = CFSTR("Result");
  v147 = 2;
  std::string::basic_string[abi:ne180100]<0>(v148, "ATLActivityTimeoutResultSuccess");
  v149 = 3;
  v150 = CFSTR("Success");
  v151 = 2;
  std::string::basic_string[abi:ne180100]<0>(v152, "ATLActivityTimeoutResultFailure");
  v153 = 3;
  v154 = CFSTR("(deprecated)");
  v155 = 2;
  std::string::basic_string[abi:ne180100]<0>(v156, "ATLStateInfo");
  v157 = 3;
  v158 = CFSTR("State");
  v159 = 2;
  std::string::basic_string[abi:ne180100]<0>(v160, "ATLTransactionInfo");
  v161 = 3;
  v162 = CFSTR("Transaction");
  v163 = 2;
  std::string::basic_string[abi:ne180100]<0>(v164, "ATLTransactionHistory");
  v165 = 3;
  v166 = CFSTR("TransactionHistory");
  v167 = 2;
  std::string::basic_string[abi:ne180100]<0>(v168, "ATLStateSPIdentifier");
  v169 = 3;
  v170 = CFSTR("SP");
  v171 = 2;
  std::string::basic_string[abi:ne180100]<0>(v172, "ATLStateSPIdentifierRaw");
  v173 = 3;
  v174 = CFSTR("SPRaw");
  v175 = 2;
  std::string::basic_string[abi:ne180100]<0>(v176, "ATLStateCardIdentifier");
  v177 = 3;
  v178 = CFSTR("CardIdentifier");
  v179 = 2;
  std::string::basic_string[abi:ne180100]<0>(v180, "ATLStateCardCurrency");
  v181 = 3;
  v182 = CFSTR("CardCurrency");
  v183 = 2;
  std::string::basic_string[abi:ne180100]<0>(v184, "ATLStateCardCurrencyCode");
  v185 = 3;
  v186 = CFSTR("CardCurrencyCode");
  v187 = 2;
  std::string::basic_string[abi:ne180100]<0>(v188, "ATLStateCardCurrencyExponent");
  v189 = 3;
  v190 = CFSTR("CardCurrencyExponent");
  v191 = 2;
  std::string::basic_string[abi:ne180100]<0>(v192, "ATLStateBalance");
  v193 = 3;
  v194 = CFSTR("Balance");
  v195 = 2;
  std::string::basic_string[abi:ne180100]<0>(v196, "ATLStatePointBalance");
  v197 = 3;
  v198 = CFSTR("PointBalance");
  v199 = 2;
  std::string::basic_string[abi:ne180100]<0>(v200, "ATLStateTransactionInProgress");
  v201 = 3;
  v202 = CFSTR("TransactionInProgress");
  v203 = 2;
  std::string::basic_string[abi:ne180100]<0>(v204, "ATLStateCardDenylisted");
  v205 = 3;
  v206 = CFSTR("CardDenyListed");
  v207 = 2;
  std::string::basic_string[abi:ne180100]<0>(v208, "ATLStateCardExpirationDate");
  v209 = 3;
  v210 = CFSTR("CardExpirationDate");
  v211 = 2;
  std::string::basic_string[abi:ne180100]<0>(v212, "ATLTransactionSerialNumber");
  v213 = 3;
  v214 = CFSTR("SerialNumber");
  v215 = 2;
  std::string::basic_string[abi:ne180100]<0>(v216, "ATLTransactionStartStation");
  v217 = 3;
  v218 = CFSTR("StartStation");
  v219 = 2;
  std::string::basic_string[abi:ne180100]<0>(v220, "ATLTransactionTypeDetail");
  v221 = 3;
  v222 = CFSTR("TypeDetail");
  v223 = 2;
  std::map<std::string,OVM::Var>::map[abi:ne180100](v0, v4, 55);
  -[PluginDecoder globals]::_globals = v0;
  v3 = 330;
  do
  {
    if (*((char *)&v4[v3 - 3] - 1) < 0)
      operator delete(v4[v3 - 6]);
    v3 -= 6;
  }
  while (v3 * 8);
}

void __29__PluginDecoder_classChecker__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2[3];
  _QWORD v3[3];
  _QWORD v4[3];
  _QWORD v5[3];
  _QWORD v6[3];
  _QWORD v7[3];
  _QWORD v8[3];
  _QWORD v9[3];
  _QWORD v10[3];
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[3];
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[3];
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[3];
  _QWORD v42[3];
  _QWORD v43[3];
  _QWORD v44[3];
  _QWORD v45[3];
  _QWORD v46[3];
  _QWORD v47[3];
  _QWORD v48[3];
  _QWORD v49[3];
  _QWORD v50[3];
  _QWORD v51[3];
  _QWORD v52[3];
  _QWORD v53[3];
  _QWORD v54[3];
  _QWORD v55[3];
  _QWORD v56[3];
  _QWORD v57[3];
  _QWORD v58[3];
  _QWORD v59[3];
  _QWORD v60[4];

  v60[3] = *MEMORY[0x1E0C80C00];
  v0 = operator new();
  std::string::basic_string[abi:ne180100]<0>(v2, "ASR");
  std::string::basic_string[abi:ne180100]<0>(v3, "ATLCurrency");
  std::string::basic_string[abi:ne180100]<0>(v4, "ATLGetDecoder");
  std::string::basic_string[abi:ne180100]<0>(v5, "ATLLoggerObj");
  std::string::basic_string[abi:ne180100]<0>(v6, "ATLTestBase");
  std::string::basic_string[abi:ne180100]<0>(v7, "ATLTimer");
  std::string::basic_string[abi:ne180100]<0>(v8, "AppletConfigurationData");
  std::string::basic_string[abi:ne180100]<0>(v9, "AppletTranslator");
  std::string::basic_string[abi:ne180100]<0>(v10, "AtlasDecoder");
  std::string::basic_string[abi:ne180100]<0>(v11, "AtlasRecordData");
  std::string::basic_string[abi:ne180100]<0>(v12, "BaseMifareDecoder");
  std::string::basic_string[abi:ne180100]<0>(v13, "CopernicusDecoder");
  std::string::basic_string[abi:ne180100]<0>(v14, "CopernicusHCEDecoder");
  std::string::basic_string[abi:ne180100]<0>(v15, "DERDecoder");
  std::string::basic_string[abi:ne180100]<0>(v16, "EMVDecoder");
  std::string::basic_string[abi:ne180100]<0>(v17, "EMVEventTests");
  std::string::basic_string[abi:ne180100]<0>(v18, "EMVPluginTests");
  std::string::basic_string[abi:ne180100]<0>(v19, "ExpressMode");
  std::string::basic_string[abi:ne180100]<0>(v20, "HPHistoryDecoder");
  std::string::basic_string[abi:ne180100]<0>(v21, "HashHelper");
  std::string::basic_string[abi:ne180100]<0>(v22, "HerculesDALBuilder");
  std::string::basic_string[abi:ne180100]<0>(v23, "HerculesDALRecord");
  std::string::basic_string[abi:ne180100]<0>(v24, "HerculesDecoder");
  std::string::basic_string[abi:ne180100]<0>(v25, "IDHistoryDecoder");
  std::string::basic_string[abi:ne180100]<0>(v26, "MercuryDecoder");
  std::string::basic_string[abi:ne180100]<0>(v27, "MifareDecoder");
  std::string::basic_string[abi:ne180100]<0>(v28, "MockATLDelegate");
  std::string::basic_string[abi:ne180100]<0>(v29, "MockTransceiver");
  std::string::basic_string[abi:ne180100]<0>(v30, "NSConcreteData");
  std::string::basic_string[abi:ne180100]<0>(v31, "NSConcreteMutableData");
  std::string::basic_string[abi:ne180100]<0>(v32, "NSData");
  std::string::basic_string[abi:ne180100]<0>(v33, "NSDateComponents");
  std::string::basic_string[abi:ne180100]<0>(v34, "NSDecimalNumber");
  std::string::basic_string[abi:ne180100]<0>(v35, "NSDistributedNotificationCenter");
  std::string::basic_string[abi:ne180100]<0>(v36, "NSError");
  std::string::basic_string[abi:ne180100]<0>(v37, "NSMutableArray");
  std::string::basic_string[abi:ne180100]<0>(v38, "NSMutableData");
  std::string::basic_string[abi:ne180100]<0>(v39, "NSMutableDictionary");
  std::string::basic_string[abi:ne180100]<0>(v40, "NSMutableString");
  std::string::basic_string[abi:ne180100]<0>(v41, "NSNumber");
  std::string::basic_string[abi:ne180100]<0>(v42, "NSPlaceholderString");
  std::string::basic_string[abi:ne180100]<0>(v43, "NSString");
  std::string::basic_string[abi:ne180100]<0>(v44, "NSTaggedPointerString");
  std::string::basic_string[abi:ne180100]<0>(v45, "OctopusDecoder");
  std::string::basic_string[abi:ne180100]<0>(v46, "PluginDecoder");
  std::string::basic_string[abi:ne180100]<0>(v47, "QPHistoryDecoder");
  std::string::basic_string[abi:ne180100]<0>(v48, "SeosDecoder");
  std::string::basic_string[abi:ne180100]<0>(v49, "SeosEventTests");
  std::string::basic_string[abi:ne180100]<0>(v50, "SeosPluginTests");
  std::string::basic_string[abi:ne180100]<0>(v51, "SlalomDecoder");
  std::string::basic_string[abi:ne180100]<0>(v52, "SlalomDecoder(SlalomDecoderExtension)");
  std::string::basic_string[abi:ne180100]<0>(v53, "SlalomReadOperation");
  std::string::basic_string[abi:ne180100]<0>(v54, "SlalomUtils");
  std::string::basic_string[abi:ne180100]<0>(v55, "SlalomWriteOperation");
  std::string::basic_string[abi:ne180100]<0>(v56, "TestClass");
  std::string::basic_string[abi:ne180100]<0>(v57, "TransceiverWrapper");
  std::string::basic_string[abi:ne180100]<0>(v58, "WuluDecoder");
  std::string::basic_string[abi:ne180100]<0>(v59, "WuluReaderContext");
  std::string::basic_string[abi:ne180100]<0>(v60, "WuluRecord");
  std::set<std::string>::set[abi:ne180100](v0, v2, 59);
  -[PluginDecoder classChecker]::_allowlistedClases = v0;
  v1 = 177;
  do
  {
    if (SHIBYTE(v2[v1 - 1]) < 0)
      operator delete(v2[v1 - 3]);
    v1 -= 3;
  }
  while (v1 * 8);
}

- (void).cxx_destruct
{
  std::shared_ptr<OVM::Script const>::~shared_ptr[abi:ne180100]((uint64_t)&self->script);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

+ (id)persistentContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (+[PluginDecoder(IndirectMethods) persistentContext:]::onceToken[0] != -1)
    dispatch_once(+[PluginDecoder(IndirectMethods) persistentContext:]::onceToken, &__block_literal_global_451);
  objc_msgSend((id)+[PluginDecoder(IndirectMethods) persistentContext:]::persistentStore, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = (void *)+[PluginDecoder(IndirectMethods) persistentContext:]::persistentStore;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v3);
  }

  return v4;
}

void __52__PluginDecoder_IndirectMethods__persistentContext___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)+[PluginDecoder(IndirectMethods) persistentContext:]::persistentStore;
  +[PluginDecoder(IndirectMethods) persistentContext:]::persistentStore = (uint64_t)v0;

}

@end
