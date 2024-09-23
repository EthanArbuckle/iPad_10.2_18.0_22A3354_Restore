@implementation LibSCLM

+ (id)PerformScript:(unint64_t)a3 sefwPath:(id)a4 seHandle:(id)a5 logSink:(id)a6
{
  id v9;
  id v10;
  id v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  id v14;
  unint64_t v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  id v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  std::__shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  std::string v51;
  uint64_t v52;
  std::__shared_weak_count *v53;
  uint64_t v54;
  std::__shared_weak_count *v55;
  uint64_t v56;
  std::__shared_weak_count *v57;
  std::string v58;
  char v59;
  void *__p[2];
  uint64_t v61;
  std::string *v62[3];
  char v63;
  std::__shared_weak_count *v64;
  std::__shared_weak_count *v65;
  std::__shared_weak_count *v66;
  std::__shared_weak_count *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  _QWORD v71[2];

  v71[1] = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = (std::__shared_weak_count *)operator new(0x28uLL);
  v12->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v12->__shared_owners_;
  v12->__shared_weak_owners_ = 0;
  v12->__vftable = (std::__shared_weak_count_vtbl *)&off_251CC5360;
  v14 = v10;
  v12[1].__vftable = (std::__shared_weak_count_vtbl *)&off_251CC5398;
  v12[1].__shared_owners_ = (uint64_t)v14;
  v66 = v12 + 1;
  v67 = v12;
  do
    v15 = __ldxr(p_shared_owners);
  while (__stxr(v15 + 1, p_shared_owners));
  do
    v16 = __ldaxr(p_shared_owners);
  while (__stlxr(v16 - 1, p_shared_owners));
  if (!v16)
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
  v17 = (std::__shared_weak_count *)operator new(0x28uLL);
  v17->__shared_owners_ = 0;
  v18 = (unint64_t *)&v17->__shared_owners_;
  v17->__shared_weak_owners_ = 0;
  v17->__vftable = (std::__shared_weak_count_vtbl *)&off_251CC53C0;
  v19 = v11;
  v17[1].__vftable = (std::__shared_weak_count_vtbl *)&off_251CC53F8;
  v17[1].__shared_owners_ = (uint64_t)v19;
  v64 = v17 + 1;
  v65 = v17;
  do
    v20 = __ldxr(v18);
  while (__stxr(v20 + 1, v18));
  do
    v21 = __ldaxr(v18);
  while (__stlxr(v21 - 1, v18));
  if (v21)
  {
    if (v9)
    {
LABEL_11:
      objc_msgSend(v9, "asCXXString");
      goto LABEL_14;
    }
  }
  else
  {
    ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
    std::__shared_weak_count::__release_weak(v17);
    if (v9)
      goto LABEL_11;
  }
  __p[0] = 0;
  __p[1] = 0;
  v61 = 0;
LABEL_14:
  SCLM::DefaultSCLMScriptProvider::CreateWithPath((uint64_t)__p, (uint64_t)v62);
  if (SHIBYTE(v61) < 0)
    operator delete(__p[0]);
  if (v63)
  {
    gsl::not_null<std::shared_ptr<SLAM::SEHandle>>::not_null<std::shared_ptr<SLAM::ObjC::SEHandleShim>,void>(&v56, &v66);
    gsl::not_null<std::shared_ptr<SLAM::LogSink>>::not_null<std::shared_ptr<SLAM::ObjC::LogSinkShim>,void>(&v54, &v64);
    v22 = (uint64_t *)caulk::expected<gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>,SLAM::Error>::value((uint64_t)v62);
    v23 = v22[1];
    v52 = *v22;
    v53 = (std::__shared_weak_count *)v23;
    if (v23)
    {
      v24 = (unint64_t *)(v23 + 8);
      do
        v25 = __ldxr(v24);
      while (__stxr(v25 + 1, v24));
    }
    SCLM::SCLMPrivateInterface::PerformScript(a3, &v56, &v54, &v52, (uint64_t)&v58);
    v26 = v53;
    if (v53)
    {
      v27 = (unint64_t *)&v53->__shared_owners_;
      do
        v28 = __ldaxr(v27);
      while (__stlxr(v28 - 1, v27));
      if (!v28)
      {
        ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
        std::__shared_weak_count::__release_weak(v26);
      }
    }
    v29 = v55;
    if (v55)
    {
      v30 = (unint64_t *)&v55->__shared_owners_;
      do
        v31 = __ldaxr(v30);
      while (__stlxr(v31 - 1, v30));
      if (!v31)
      {
        ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
        std::__shared_weak_count::__release_weak(v29);
      }
    }
    v32 = v57;
    if (v57)
    {
      v33 = (unint64_t *)&v57->__shared_owners_;
      do
        v34 = __ldaxr(v33);
      while (__stlxr(v34 - 1, v33));
      if (!v34)
      {
        ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
        std::__shared_weak_count::__release_weak(v32);
      }
    }
    if (v59)
    {
      v35 = (void *)MEMORY[0x24BDD1540];
      v68 = *MEMORY[0x24BDD0FC8];
      v36 = (void *)MEMORY[0x24BDD17C8];
      ctu::join<std::__wrap_iter<std::string const*>>((std::string *)v58.__r_.__value_.__l.__data_, (std::string *)v58.__r_.__value_.__l.__size_, ", ", 2uLL, &v51);
      objc_msgSend(v36, "stringWithCXXString:", &v51);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v37;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("SCLM"), 0, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v51.__r_.__value_.__l.__data_);
      if (v59)
      {
        v51.__r_.__value_.__r.__words[0] = (std::string::size_type)&v58;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v51);
      }
    }
    else
    {
      v39 = 0;
    }
  }
  else
  {
    v40 = (void *)MEMORY[0x24BDD1540];
    v70 = *MEMORY[0x24BDD0FC8];
    v41 = (void *)MEMORY[0x24BDD17C8];
    ctu::join<std::__wrap_iter<std::string const*>>(v62[0], v62[1], ", ", 2uLL, &v58);
    objc_msgSend(v41, "stringWithCXXString:", &v58);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = v42;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v71, &v70, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "errorWithDomain:code:userInfo:", CFSTR("SCLM"), 0, v43);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v58.__r_.__value_.__l.__data_);
  }
  caulk::__expected_detail::base<gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>,SLAM::Error>::~base((uint64_t)v62);
  v44 = v65;
  if (v65)
  {
    v45 = (unint64_t *)&v65->__shared_owners_;
    do
      v46 = __ldaxr(v45);
    while (__stlxr(v46 - 1, v45));
    if (!v46)
    {
      ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
      std::__shared_weak_count::__release_weak(v44);
    }
  }
  v47 = v67;
  if (v67)
  {
    v48 = (unint64_t *)&v67->__shared_owners_;
    do
      v49 = __ldaxr(v48);
    while (__stlxr(v49 - 1, v48));
    if (!v49)
    {
      ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
      std::__shared_weak_count::__release_weak(v47);
    }
  }

  return v39;
}

+ (id)PerformScriptWithName:(id)a3 sefwPath:(id)a4 seHandle:(id)a5 logSink:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  id v15;
  unint64_t v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  id v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t *v28;
  uint64_t v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  std::string v52;
  uint64_t v53;
  std::__shared_weak_count *v54;
  uint64_t v55;
  std::__shared_weak_count *v56;
  uint64_t v57;
  std::__shared_weak_count *v58;
  void *v59[2];
  uint64_t v60;
  std::string v61;
  char v62;
  void *__p[2];
  uint64_t v64;
  std::string *v65[3];
  char v66;
  std::__shared_weak_count *v67;
  std::__shared_weak_count *v68;
  std::__shared_weak_count *v69;
  std::__shared_weak_count *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  _QWORD v74[2];

  v74[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (std::__shared_weak_count *)operator new(0x28uLL);
  v13->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v13->__shared_owners_;
  v13->__shared_weak_owners_ = 0;
  v13->__vftable = (std::__shared_weak_count_vtbl *)&off_251CC5360;
  v15 = v11;
  v13[1].__vftable = (std::__shared_weak_count_vtbl *)&off_251CC5398;
  v13[1].__shared_owners_ = (uint64_t)v15;
  v69 = v13 + 1;
  v70 = v13;
  do
    v16 = __ldxr(p_shared_owners);
  while (__stxr(v16 + 1, p_shared_owners));
  do
    v17 = __ldaxr(p_shared_owners);
  while (__stlxr(v17 - 1, p_shared_owners));
  if (!v17)
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
  v18 = (std::__shared_weak_count *)operator new(0x28uLL);
  v18->__shared_owners_ = 0;
  v19 = (unint64_t *)&v18->__shared_owners_;
  v18->__shared_weak_owners_ = 0;
  v18->__vftable = (std::__shared_weak_count_vtbl *)&off_251CC53C0;
  v20 = v12;
  v18[1].__vftable = (std::__shared_weak_count_vtbl *)&off_251CC53F8;
  v18[1].__shared_owners_ = (uint64_t)v20;
  v67 = v18 + 1;
  v68 = v18;
  do
    v21 = __ldxr(v19);
  while (__stxr(v21 + 1, v19));
  do
    v22 = __ldaxr(v19);
  while (__stlxr(v22 - 1, v19));
  if (v22)
  {
    if (v10)
    {
LABEL_11:
      objc_msgSend(v10, "asCXXString");
      goto LABEL_14;
    }
  }
  else
  {
    ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
    std::__shared_weak_count::__release_weak(v18);
    if (v10)
      goto LABEL_11;
  }
  __p[0] = 0;
  __p[1] = 0;
  v64 = 0;
LABEL_14:
  SCLM::DefaultSCLMScriptProvider::CreateWithPath((uint64_t)__p, (uint64_t)v65);
  if (SHIBYTE(v64) < 0)
    operator delete(__p[0]);
  if (v66)
  {
    if (v9)
    {
      objc_msgSend(v9, "asCXXString");
    }
    else
    {
      v59[0] = 0;
      v59[1] = 0;
      v60 = 0;
    }
    gsl::not_null<std::shared_ptr<SLAM::SEHandle>>::not_null<std::shared_ptr<SLAM::ObjC::SEHandleShim>,void>(&v57, &v69);
    gsl::not_null<std::shared_ptr<SLAM::LogSink>>::not_null<std::shared_ptr<SLAM::ObjC::LogSinkShim>,void>(&v55, &v67);
    v28 = (uint64_t *)caulk::expected<gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>,SLAM::Error>::value((uint64_t)v65);
    v29 = v28[1];
    v53 = *v28;
    v54 = (std::__shared_weak_count *)v29;
    if (v29)
    {
      v30 = (unint64_t *)(v29 + 8);
      do
        v31 = __ldxr(v30);
      while (__stxr(v31 + 1, v30));
    }
    SCLM::SCLMPrivateInterface::PerformScript((uint64_t)v59, &v57, &v55, &v53, (uint64_t)&v61);
    v32 = v54;
    if (v54)
    {
      v33 = (unint64_t *)&v54->__shared_owners_;
      do
        v34 = __ldaxr(v33);
      while (__stlxr(v34 - 1, v33));
      if (!v34)
      {
        ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
        std::__shared_weak_count::__release_weak(v32);
      }
    }
    v35 = v56;
    if (v56)
    {
      v36 = (unint64_t *)&v56->__shared_owners_;
      do
        v37 = __ldaxr(v36);
      while (__stlxr(v37 - 1, v36));
      if (!v37)
      {
        ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
        std::__shared_weak_count::__release_weak(v35);
      }
    }
    v38 = v58;
    if (v58)
    {
      v39 = (unint64_t *)&v58->__shared_owners_;
      do
        v40 = __ldaxr(v39);
      while (__stlxr(v40 - 1, v39));
      if (!v40)
      {
        ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
        std::__shared_weak_count::__release_weak(v38);
      }
    }
    if (SHIBYTE(v60) < 0)
      operator delete(v59[0]);
    if (v62)
    {
      v41 = (void *)MEMORY[0x24BDD1540];
      v71 = *MEMORY[0x24BDD0FC8];
      v42 = (void *)MEMORY[0x24BDD17C8];
      ctu::join<std::__wrap_iter<std::string const*>>((std::string *)v61.__r_.__value_.__l.__data_, (std::string *)v61.__r_.__value_.__l.__size_, ", ", 2uLL, &v52);
      objc_msgSend(v42, "stringWithCXXString:", &v52);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v43;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "errorWithDomain:code:userInfo:", CFSTR("SCLM"), 0, v44);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v52.__r_.__value_.__l.__data_);
      if (v62)
      {
        v52.__r_.__value_.__r.__words[0] = (std::string::size_type)&v61;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v52);
      }
    }
    else
    {
      v27 = 0;
    }
  }
  else
  {
    v23 = (void *)MEMORY[0x24BDD1540];
    v73 = *MEMORY[0x24BDD0FC8];
    v24 = (void *)MEMORY[0x24BDD17C8];
    ctu::join<std::__wrap_iter<std::string const*>>(v65[0], v65[1], ", ", 2uLL, &v61);
    objc_msgSend(v24, "stringWithCXXString:", &v61);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v74[0] = v25;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v74, &v73, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("SCLM"), 0, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v61.__r_.__value_.__l.__data_);
  }
  caulk::__expected_detail::base<gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>,SLAM::Error>::~base((uint64_t)v65);
  v45 = v68;
  if (v68)
  {
    v46 = (unint64_t *)&v68->__shared_owners_;
    do
      v47 = __ldaxr(v46);
    while (__stlxr(v47 - 1, v46));
    if (!v47)
    {
      ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
      std::__shared_weak_count::__release_weak(v45);
    }
  }
  v48 = v70;
  if (v70)
  {
    v49 = (unint64_t *)&v70->__shared_owners_;
    do
      v50 = __ldaxr(v49);
    while (__stlxr(v50 - 1, v49));
    if (!v50)
    {
      ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
      std::__shared_weak_count::__release_weak(v48);
    }
  }

  return v27;
}

+ (id)PerformOnlyScriptInSEFW:(id)a3 seHandle:(id)a4 logSink:(id)a5
{
  id v7;
  id v8;
  id v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  id v12;
  unint64_t v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  id v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  std::string v49;
  uint64_t v50;
  std::__shared_weak_count *v51;
  uint64_t v52;
  std::__shared_weak_count *v53;
  uint64_t v54;
  std::__shared_weak_count *v55;
  std::string v56;
  char v57;
  void *__p[2];
  uint64_t v59;
  std::string *v60[3];
  char v61;
  std::__shared_weak_count *v62;
  std::__shared_weak_count *v63;
  std::__shared_weak_count *v64;
  std::__shared_weak_count *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  _QWORD v69[2];

  v69[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (std::__shared_weak_count *)operator new(0x28uLL);
  v10->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v10->__shared_owners_;
  v10->__shared_weak_owners_ = 0;
  v10->__vftable = (std::__shared_weak_count_vtbl *)&off_251CC5360;
  v12 = v8;
  v10[1].__vftable = (std::__shared_weak_count_vtbl *)&off_251CC5398;
  v10[1].__shared_owners_ = (uint64_t)v12;
  v64 = v10 + 1;
  v65 = v10;
  do
    v13 = __ldxr(p_shared_owners);
  while (__stxr(v13 + 1, p_shared_owners));
  do
    v14 = __ldaxr(p_shared_owners);
  while (__stlxr(v14 - 1, p_shared_owners));
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
  }
  v15 = (std::__shared_weak_count *)operator new(0x28uLL);
  v15->__shared_owners_ = 0;
  v16 = (unint64_t *)&v15->__shared_owners_;
  v15->__shared_weak_owners_ = 0;
  v15->__vftable = (std::__shared_weak_count_vtbl *)&off_251CC53C0;
  v17 = v9;
  v15[1].__vftable = (std::__shared_weak_count_vtbl *)&off_251CC53F8;
  v15[1].__shared_owners_ = (uint64_t)v17;
  v62 = v15 + 1;
  v63 = v15;
  do
    v18 = __ldxr(v16);
  while (__stxr(v18 + 1, v16));
  do
    v19 = __ldaxr(v16);
  while (__stlxr(v19 - 1, v16));
  if (v19)
  {
    if (v7)
    {
LABEL_11:
      objc_msgSend(v7, "asCXXString");
      goto LABEL_14;
    }
  }
  else
  {
    ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
    std::__shared_weak_count::__release_weak(v15);
    if (v7)
      goto LABEL_11;
  }
  __p[0] = 0;
  __p[1] = 0;
  v59 = 0;
LABEL_14:
  SCLM::DefaultSCLMScriptProvider::CreateWithPath((uint64_t)__p, (uint64_t)v60);
  if (SHIBYTE(v59) < 0)
    operator delete(__p[0]);
  if (v61)
  {
    gsl::not_null<std::shared_ptr<SLAM::SEHandle>>::not_null<std::shared_ptr<SLAM::ObjC::SEHandleShim>,void>(&v54, &v64);
    gsl::not_null<std::shared_ptr<SLAM::LogSink>>::not_null<std::shared_ptr<SLAM::ObjC::LogSinkShim>,void>(&v52, &v62);
    v20 = (uint64_t *)caulk::expected<gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>,SLAM::Error>::value((uint64_t)v60);
    v21 = v20[1];
    v50 = *v20;
    v51 = (std::__shared_weak_count *)v21;
    if (v21)
    {
      v22 = (unint64_t *)(v21 + 8);
      do
        v23 = __ldxr(v22);
      while (__stxr(v23 + 1, v22));
    }
    SCLM::SCLMPrivateInterface::PerformOnlyScriptInSEFW(&v54, &v52, &v50, (uint64_t)&v56);
    v24 = v51;
    if (v51)
    {
      v25 = (unint64_t *)&v51->__shared_owners_;
      do
        v26 = __ldaxr(v25);
      while (__stlxr(v26 - 1, v25));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
        std::__shared_weak_count::__release_weak(v24);
      }
    }
    v27 = v53;
    if (v53)
    {
      v28 = (unint64_t *)&v53->__shared_owners_;
      do
        v29 = __ldaxr(v28);
      while (__stlxr(v29 - 1, v28));
      if (!v29)
      {
        ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
        std::__shared_weak_count::__release_weak(v27);
      }
    }
    v30 = v55;
    if (v55)
    {
      v31 = (unint64_t *)&v55->__shared_owners_;
      do
        v32 = __ldaxr(v31);
      while (__stlxr(v32 - 1, v31));
      if (!v32)
      {
        ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
        std::__shared_weak_count::__release_weak(v30);
      }
    }
    if (v57)
    {
      v33 = (void *)MEMORY[0x24BDD1540];
      v66 = *MEMORY[0x24BDD0FC8];
      v34 = (void *)MEMORY[0x24BDD17C8];
      ctu::join<std::__wrap_iter<std::string const*>>((std::string *)v56.__r_.__value_.__l.__data_, (std::string *)v56.__r_.__value_.__l.__size_, ", ", 2uLL, &v49);
      objc_msgSend(v34, "stringWithCXXString:", &v49);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v35;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("SCLM"), 0, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v49.__r_.__value_.__l.__data_);
      if (v57)
      {
        v49.__r_.__value_.__r.__words[0] = (std::string::size_type)&v56;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v49);
      }
    }
    else
    {
      v37 = 0;
    }
  }
  else
  {
    v38 = (void *)MEMORY[0x24BDD1540];
    v68 = *MEMORY[0x24BDD0FC8];
    v39 = (void *)MEMORY[0x24BDD17C8];
    ctu::join<std::__wrap_iter<std::string const*>>(v60[0], v60[1], ", ", 2uLL, &v56);
    objc_msgSend(v39, "stringWithCXXString:", &v56);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = v40;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, &v68, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("SCLM"), 0, v41);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (SHIBYTE(v56.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v56.__r_.__value_.__l.__data_);
  }
  caulk::__expected_detail::base<gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>,SLAM::Error>::~base((uint64_t)v60);
  v42 = v63;
  if (v63)
  {
    v43 = (unint64_t *)&v63->__shared_owners_;
    do
      v44 = __ldaxr(v43);
    while (__stlxr(v44 - 1, v43));
    if (!v44)
    {
      ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
      std::__shared_weak_count::__release_weak(v42);
    }
  }
  v45 = v65;
  if (v65)
  {
    v46 = (unint64_t *)&v65->__shared_owners_;
    do
      v47 = __ldaxr(v46);
    while (__stlxr(v47 - 1, v46));
    if (!v47)
    {
      ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
      std::__shared_weak_count::__release_weak(v45);
    }
  }

  return v37;
}

+ (BOOL)InspectSEFW:(id)a3 closure:(id)a4 error:(id *)a5
{
  id v7;
  uint64_t *v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  unint64_t *v21;
  unint64_t v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  std::string v29;
  std::string v30;
  unsigned __int8 v31;
  void *__p[2];
  uint64_t v33;
  std::string *v34[3];
  char v35;
  id v36;
  uint64_t v37;
  void *v38;
  _QWORD v39[3];
  _QWORD *v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v36 = a4;
  if (v7)
  {
    objc_msgSend(v7, "asCXXString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v33 = 0;
  }
  SCLM::DefaultSCLMScriptProvider::CreateWithPath((uint64_t)__p, (uint64_t)v34);
  if (SHIBYTE(v33) < 0)
    operator delete(__p[0]);
  if (v35)
  {
    v8 = (uint64_t *)caulk::expected<gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>,SLAM::Error>::value((uint64_t)v34);
    v9 = *v8;
    v10 = (std::__shared_weak_count *)v8[1];
    v29.__r_.__value_.__r.__words[0] = *v8;
    v29.__r_.__value_.__l.__size_ = (std::string::size_type)v10;
    if (v10)
    {
      p_shared_owners = (unint64_t *)&v10->__shared_owners_;
      do
        v12 = __ldxr(p_shared_owners);
      while (__stxr(v12 + 1, p_shared_owners));
    }
    v39[0] = &off_251CC5420;
    v39[1] = &v36;
    v40 = v39;
    SCLM::DefaultSCLMScriptProvider::InspectScriptsWithBlock(v9, (uint64_t)v39, &v30);
    v14 = v40;
    if (v40 == v39)
    {
      v15 = 4;
      v14 = v39;
    }
    else
    {
      if (!v40)
        goto LABEL_19;
      v15 = 5;
    }
    (*(void (**)(_QWORD *, uint64_t))(*v14 + 8 * v15))(v14, v13);
LABEL_19:
    if (v10)
    {
      v21 = (unint64_t *)&v10->__shared_owners_;
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    v23 = v31;
    v20 = v31 != 0;
    if (a5 && !v31)
    {
      v24 = (void *)MEMORY[0x24BDD1540];
      v37 = *MEMORY[0x24BDD0FC8];
      v25 = (void *)MEMORY[0x24BDD17C8];
      ctu::join<std::__wrap_iter<std::string const*>>((std::string *)v30.__r_.__value_.__l.__data_, (std::string *)v30.__r_.__value_.__l.__size_, ", ", 2uLL, &v29);
      objc_msgSend(v25, "stringWithCXXString:", &v29);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v26;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("SCLM"), 0, v27);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v29.__r_.__value_.__l.__data_);
      v23 = v31;
    }
    if (!v23)
    {
      v29.__r_.__value_.__r.__words[0] = (std::string::size_type)&v30;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v29);
    }
    goto LABEL_31;
  }
  if (a5)
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    v41 = *MEMORY[0x24BDD0FC8];
    v17 = (void *)MEMORY[0x24BDD17C8];
    ctu::join<std::__wrap_iter<std::string const*>>(v34[0], v34[1], ", ", 2uLL, &v30);
    objc_msgSend(v17, "stringWithCXXString:", &v30);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("SCLM"), 0, v19);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v30.__r_.__value_.__l.__data_);
  }
  v20 = 0;
LABEL_31:
  caulk::__expected_detail::base<gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>,SLAM::Error>::~base((uint64_t)v34);

  return v20;
}

+ (void)InspectSEFW:closure:error:
{
  JUMPOUT(0x24BD2AEA0);
}

+ (_QWORD)InspectSEFW:closure:error:
{
  return (*(_QWORD *(**)(_QWORD *__return_ptr))(**(_QWORD **)(a1 + 8) + 16))(*(_QWORD **)(a1 + 8));
}

+ (uint64_t)InspectSEFW:closure:error:
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_251CC5420;
  a2[1] = v2;
  return result;
}

@end
