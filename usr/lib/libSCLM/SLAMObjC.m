@implementation SLAMObjC

+ (id)PerformScript:(unint64_t)a3 seHandle:(id)a4 logSink:(id)a5
{
  id v7;
  id v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  id v11;
  unint64_t v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  std::string __p;
  uint64_t v38;
  std::__shared_weak_count *v39;
  uint64_t v40;
  std::__shared_weak_count *v41;
  std::string *v42[3];
  char v43;
  std::__shared_weak_count *v44;
  std::__shared_weak_count *v45;
  std::__shared_weak_count *v46;
  std::__shared_weak_count *v47;
  uint64_t v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v9 = (std::__shared_weak_count *)operator new(0x28uLL);
  v9->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v9->__shared_owners_;
  v9->__shared_weak_owners_ = 0;
  v9->__vftable = (std::__shared_weak_count_vtbl *)&off_251CC5360;
  v11 = v7;
  v9[1].__vftable = (std::__shared_weak_count_vtbl *)&off_251CC5398;
  v9[1].__shared_owners_ = (uint64_t)v11;
  v46 = v9 + 1;
  v47 = v9;
  do
    v12 = __ldxr(p_shared_owners);
  while (__stxr(v12 + 1, p_shared_owners));
  do
    v13 = __ldaxr(p_shared_owners);
  while (__stlxr(v13 - 1, p_shared_owners));
  if (!v13)
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
  v14 = (std::__shared_weak_count *)operator new(0x28uLL);
  v14->__shared_owners_ = 0;
  v15 = (unint64_t *)&v14->__shared_owners_;
  v14->__shared_weak_owners_ = 0;
  v14->__vftable = (std::__shared_weak_count_vtbl *)&off_251CC53C0;
  v16 = v8;
  v14[1].__vftable = (std::__shared_weak_count_vtbl *)&off_251CC53F8;
  v14[1].__shared_owners_ = (uint64_t)v16;
  v44 = v14 + 1;
  v45 = v14;
  do
    v17 = __ldxr(v15);
  while (__stxr(v17 + 1, v15));
  do
    v18 = __ldaxr(v15);
  while (__stlxr(v18 - 1, v15));
  if (!v18)
  {
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
  }
  gsl::not_null<std::shared_ptr<SLAM::SEHandle>>::not_null<std::shared_ptr<SLAM::ObjC::SEHandleShim>,void>(&v40, &v46);
  gsl::not_null<std::shared_ptr<SLAM::LogSink>>::not_null<std::shared_ptr<SLAM::ObjC::LogSinkShim>,void>(&v38, &v44);
  SLAM::SLAM::PerformScript(a3, &v40, &v38, (uint64_t)v42);
  v19 = v39;
  if (v39)
  {
    v20 = (unint64_t *)&v39->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  v22 = v41;
  if (v41)
  {
    v23 = (unint64_t *)&v41->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  if (v43)
  {
    v25 = (void *)MEMORY[0x24BDD1540];
    v48 = *MEMORY[0x24BDD0FC8];
    v26 = (void *)MEMORY[0x24BDD17C8];
    ctu::join<std::__wrap_iter<std::string const*>>(v42[0], v42[1], ", ", 2uLL, &__p);
    objc_msgSend(v26, "stringWithCXXString:", &__p);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v27;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("SLAM"), 0, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (v43)
    {
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v42;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
    }
  }
  else
  {
    v29 = 0;
  }
  v30 = v45;
  if (v45)
  {
    v31 = (unint64_t *)&v45->__shared_owners_;
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
  v33 = v47;
  if (v47)
  {
    v34 = (unint64_t *)&v47->__shared_owners_;
    do
      v35 = __ldaxr(v34);
    while (__stlxr(v35 - 1, v34));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }

  return v29;
}

+ (id)PerformScriptWithName:(id)a3 seHandle:(id)a4 logSink:(id)a5
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
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  std::string v38;
  uint64_t v39;
  std::__shared_weak_count *v40;
  uint64_t v41;
  std::__shared_weak_count *v42;
  void *__p[2];
  uint64_t v44;
  std::string *v45[3];
  char v46;
  std::__shared_weak_count *v47;
  std::__shared_weak_count *v48;
  std::__shared_weak_count *v49;
  std::__shared_weak_count *v50;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x24BDAC8D0];
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
  v49 = v10 + 1;
  v50 = v10;
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
  v47 = v15 + 1;
  v48 = v15;
  do
    v18 = __ldxr(v16);
  while (__stxr(v18 + 1, v16));
  do
    v19 = __ldaxr(v16);
  while (__stlxr(v19 - 1, v16));
  if (!v19)
  {
    ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
    std::__shared_weak_count::__release_weak(v15);
    if (v7)
      goto LABEL_11;
LABEL_13:
    __p[0] = 0;
    __p[1] = 0;
    v44 = 0;
    goto LABEL_14;
  }
  if (!v7)
    goto LABEL_13;
LABEL_11:
  objc_msgSend(v7, "asCXXString");
LABEL_14:
  gsl::not_null<std::shared_ptr<SLAM::SEHandle>>::not_null<std::shared_ptr<SLAM::ObjC::SEHandleShim>,void>(&v41, &v49);
  gsl::not_null<std::shared_ptr<SLAM::LogSink>>::not_null<std::shared_ptr<SLAM::ObjC::LogSinkShim>,void>(&v39, &v47);
  SLAM::SLAM::PerformScript((uint64_t)__p, &v41, &v39, (uint64_t)v45);
  v20 = v40;
  if (v40)
  {
    v21 = (unint64_t *)&v40->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  v23 = v42;
  if (v42)
  {
    v24 = (unint64_t *)&v42->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  if (SHIBYTE(v44) < 0)
    operator delete(__p[0]);
  if (v46)
  {
    v26 = (void *)MEMORY[0x24BDD1540];
    v51 = *MEMORY[0x24BDD0FC8];
    v27 = (void *)MEMORY[0x24BDD17C8];
    ctu::join<std::__wrap_iter<std::string const*>>(v45[0], v45[1], ", ", 2uLL, &v38);
    objc_msgSend(v27, "stringWithCXXString:", &v38);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v28;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("SLAM"), 0, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v38.__r_.__value_.__l.__data_);
    if (v46)
    {
      v38.__r_.__value_.__r.__words[0] = (std::string::size_type)v45;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v38);
    }
  }
  else
  {
    v30 = 0;
  }
  v31 = v48;
  if (v48)
  {
    v32 = (unint64_t *)&v48->__shared_owners_;
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }
  v34 = v50;
  if (v50)
  {
    v35 = (unint64_t *)&v50->__shared_owners_;
    do
      v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }

  return v30;
}

+ (id)PerformRecovery:(id)a3 logSink:(id)a4
{
  id v5;
  id v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  id v9;
  unint64_t v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  std::string __p;
  uint64_t v36;
  std::__shared_weak_count *v37;
  uint64_t v38;
  std::__shared_weak_count *v39;
  std::string *v40[3];
  char v41;
  std::__shared_weak_count *v42;
  std::__shared_weak_count *v43;
  std::__shared_weak_count *v44;
  std::__shared_weak_count *v45;
  uint64_t v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (std::__shared_weak_count *)operator new(0x28uLL);
  v7->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  v7->__shared_weak_owners_ = 0;
  v7->__vftable = (std::__shared_weak_count_vtbl *)&off_251CC5360;
  v9 = v5;
  v7[1].__vftable = (std::__shared_weak_count_vtbl *)&off_251CC5398;
  v7[1].__shared_owners_ = (uint64_t)v9;
  v44 = v7 + 1;
  v45 = v7;
  do
    v10 = __ldxr(p_shared_owners);
  while (__stxr(v10 + 1, p_shared_owners));
  do
    v11 = __ldaxr(p_shared_owners);
  while (__stlxr(v11 - 1, p_shared_owners));
  if (!v11)
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  v12 = (std::__shared_weak_count *)operator new(0x28uLL);
  v12->__shared_owners_ = 0;
  v13 = (unint64_t *)&v12->__shared_owners_;
  v12->__shared_weak_owners_ = 0;
  v12->__vftable = (std::__shared_weak_count_vtbl *)&off_251CC53C0;
  v14 = v6;
  v12[1].__vftable = (std::__shared_weak_count_vtbl *)&off_251CC53F8;
  v12[1].__shared_owners_ = (uint64_t)v14;
  v42 = v12 + 1;
  v43 = v12;
  do
    v15 = __ldxr(v13);
  while (__stxr(v15 + 1, v13));
  do
    v16 = __ldaxr(v13);
  while (__stlxr(v16 - 1, v13));
  if (!v16)
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
  gsl::not_null<std::shared_ptr<SLAM::SEHandle>>::not_null<std::shared_ptr<SLAM::ObjC::SEHandleShim>,void>(&v38, &v44);
  gsl::not_null<std::shared_ptr<SLAM::LogSink>>::not_null<std::shared_ptr<SLAM::ObjC::LogSinkShim>,void>(&v36, &v42);
  SLAM::SLAM::PerformRecovery(&v38, &v36, (uint64_t)v40);
  v17 = v37;
  if (v37)
  {
    v18 = (unint64_t *)&v37->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  v20 = v39;
  if (v39)
  {
    v21 = (unint64_t *)&v39->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  if (v41)
  {
    v23 = (void *)MEMORY[0x24BDD1540];
    v46 = *MEMORY[0x24BDD0FC8];
    v24 = (void *)MEMORY[0x24BDD17C8];
    ctu::join<std::__wrap_iter<std::string const*>>(v40[0], v40[1], ", ", 2uLL, &__p);
    objc_msgSend(v24, "stringWithCXXString:", &__p);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v25;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("SLAM"), 0, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (v41)
    {
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v40;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
    }
  }
  else
  {
    v27 = 0;
  }
  v28 = v43;
  if (v43)
  {
    v29 = (unint64_t *)&v43->__shared_owners_;
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  v31 = v45;
  if (v45)
  {
    v32 = (unint64_t *)&v45->__shared_owners_;
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }

  return v27;
}

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
  _QWORD *v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  std::__shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  std::string v48;
  uint64_t v49;
  std::__shared_weak_count *v50;
  uint64_t v51;
  std::__shared_weak_count *v52;
  uint64_t v53;
  std::__shared_weak_count *v54;
  std::string v55;
  char v56;
  void *__p[2];
  uint64_t v58;
  std::string *v59[3];
  char v60;
  std::__shared_weak_count *v61;
  std::__shared_weak_count *v62;
  std::__shared_weak_count *v63;
  std::__shared_weak_count *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  _QWORD v68[2];

  v68[1] = *MEMORY[0x24BDAC8D0];
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
  v63 = v12 + 1;
  v64 = v12;
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
  v61 = v17 + 1;
  v62 = v17;
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
  v58 = 0;
LABEL_14:
  SLAM::DefaultScriptProvider::CreateWithPath((uint64_t)__p, (uint64_t)v59);
  if (SHIBYTE(v58) < 0)
    operator delete(__p[0]);
  if (v60)
  {
    gsl::not_null<std::shared_ptr<SLAM::SEHandle>>::not_null<std::shared_ptr<SLAM::ObjC::SEHandleShim>,void>(&v53, &v63);
    gsl::not_null<std::shared_ptr<SLAM::LogSink>>::not_null<std::shared_ptr<SLAM::ObjC::LogSinkShim>,void>(&v51, &v61);
    v22 = (_QWORD *)caulk::expected<gsl::not_null<std::shared_ptr<SLAM::DefaultScriptProvider>>,SLAM::Error>::value((uint64_t)v59);
    gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>::not_null<std::shared_ptr<SLAM::DefaultScriptProvider>,void>(&v49, v22);
    SLAM::SLAMPrivateInterface::PerformScript(a3, &v53, &v51, &v49, (uint64_t)&v55);
    v23 = v50;
    if (v50)
    {
      v24 = (unint64_t *)&v50->__shared_owners_;
      do
        v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }
    v26 = v52;
    if (v52)
    {
      v27 = (unint64_t *)&v52->__shared_owners_;
      do
        v28 = __ldaxr(v27);
      while (__stlxr(v28 - 1, v27));
      if (!v28)
      {
        ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
        std::__shared_weak_count::__release_weak(v26);
      }
    }
    v29 = v54;
    if (v54)
    {
      v30 = (unint64_t *)&v54->__shared_owners_;
      do
        v31 = __ldaxr(v30);
      while (__stlxr(v31 - 1, v30));
      if (!v31)
      {
        ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
        std::__shared_weak_count::__release_weak(v29);
      }
    }
    if (v56)
    {
      v32 = (void *)MEMORY[0x24BDD1540];
      v65 = *MEMORY[0x24BDD0FC8];
      v33 = (void *)MEMORY[0x24BDD17C8];
      ctu::join<std::__wrap_iter<std::string const*>>((std::string *)v55.__r_.__value_.__l.__data_, (std::string *)v55.__r_.__value_.__l.__size_, ", ", 2uLL, &v48);
      objc_msgSend(v33, "stringWithCXXString:", &v48);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v34;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("SLAM"), 0, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v48.__r_.__value_.__l.__data_);
      if (v56)
      {
        v48.__r_.__value_.__r.__words[0] = (std::string::size_type)&v55;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v48);
      }
    }
    else
    {
      v36 = 0;
    }
  }
  else
  {
    v37 = (void *)MEMORY[0x24BDD1540];
    v67 = *MEMORY[0x24BDD0FC8];
    v38 = (void *)MEMORY[0x24BDD17C8];
    ctu::join<std::__wrap_iter<std::string const*>>(v59[0], v59[1], ", ", 2uLL, &v55);
    objc_msgSend(v38, "stringWithCXXString:", &v55);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = v39;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v68, &v67, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("SLAM"), 0, v40);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v55.__r_.__value_.__l.__data_);
  }
  caulk::__expected_detail::base<gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>,SLAM::Error>::~base((uint64_t)v59);
  v41 = v62;
  if (v62)
  {
    v42 = (unint64_t *)&v62->__shared_owners_;
    do
      v43 = __ldaxr(v42);
    while (__stlxr(v43 - 1, v42));
    if (!v43)
    {
      ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
      std::__shared_weak_count::__release_weak(v41);
    }
  }
  v44 = v64;
  if (v64)
  {
    v45 = (unint64_t *)&v64->__shared_owners_;
    do
      v46 = __ldaxr(v45);
    while (__stlxr(v46 - 1, v45));
    if (!v46)
    {
      ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
      std::__shared_weak_count::__release_weak(v44);
    }
  }

  return v36;
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
  _QWORD *v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
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
  void *v56[2];
  uint64_t v57;
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
  v66 = v13 + 1;
  v67 = v13;
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
  v64 = v18 + 1;
  v65 = v18;
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
  v61 = 0;
LABEL_14:
  SLAM::DefaultScriptProvider::CreateWithPath((uint64_t)__p, (uint64_t)v62);
  if (SHIBYTE(v61) < 0)
    operator delete(__p[0]);
  if (v63)
  {
    if (v9)
    {
      objc_msgSend(v9, "asCXXString");
    }
    else
    {
      v56[0] = 0;
      v56[1] = 0;
      v57 = 0;
    }
    gsl::not_null<std::shared_ptr<SLAM::SEHandle>>::not_null<std::shared_ptr<SLAM::ObjC::SEHandleShim>,void>(&v54, &v66);
    gsl::not_null<std::shared_ptr<SLAM::LogSink>>::not_null<std::shared_ptr<SLAM::ObjC::LogSinkShim>,void>(&v52, &v64);
    v28 = (_QWORD *)caulk::expected<gsl::not_null<std::shared_ptr<SLAM::DefaultScriptProvider>>,SLAM::Error>::value((uint64_t)v62);
    gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>::not_null<std::shared_ptr<SLAM::DefaultScriptProvider>,void>(&v50, v28);
    SLAM::SLAMPrivateInterface::PerformScript((uint64_t)v56, &v54, &v52, &v50, (uint64_t)&v58);
    v29 = v51;
    if (v51)
    {
      v30 = (unint64_t *)&v51->__shared_owners_;
      do
        v31 = __ldaxr(v30);
      while (__stlxr(v31 - 1, v30));
      if (!v31)
      {
        ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
        std::__shared_weak_count::__release_weak(v29);
      }
    }
    v32 = v53;
    if (v53)
    {
      v33 = (unint64_t *)&v53->__shared_owners_;
      do
        v34 = __ldaxr(v33);
      while (__stlxr(v34 - 1, v33));
      if (!v34)
      {
        ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
        std::__shared_weak_count::__release_weak(v32);
      }
    }
    v35 = v55;
    if (v55)
    {
      v36 = (unint64_t *)&v55->__shared_owners_;
      do
        v37 = __ldaxr(v36);
      while (__stlxr(v37 - 1, v36));
      if (!v37)
      {
        ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
        std::__shared_weak_count::__release_weak(v35);
      }
    }
    if (SHIBYTE(v57) < 0)
      operator delete(v56[0]);
    if (v59)
    {
      v38 = (void *)MEMORY[0x24BDD1540];
      v68 = *MEMORY[0x24BDD0FC8];
      v39 = (void *)MEMORY[0x24BDD17C8];
      ctu::join<std::__wrap_iter<std::string const*>>((std::string *)v58.__r_.__value_.__l.__data_, (std::string *)v58.__r_.__value_.__l.__size_, ", ", 2uLL, &v49);
      objc_msgSend(v39, "stringWithCXXString:", &v49);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v40;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("SLAM"), 0, v41);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v49.__r_.__value_.__l.__data_);
      if (v59)
      {
        v49.__r_.__value_.__r.__words[0] = (std::string::size_type)&v58;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v49);
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
    v70 = *MEMORY[0x24BDD0FC8];
    v24 = (void *)MEMORY[0x24BDD17C8];
    ctu::join<std::__wrap_iter<std::string const*>>(v62[0], v62[1], ", ", 2uLL, &v58);
    objc_msgSend(v24, "stringWithCXXString:", &v58);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = v25;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v71, &v70, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("SLAM"), 0, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v58.__r_.__value_.__l.__data_);
  }
  caulk::__expected_detail::base<gsl::not_null<std::shared_ptr<SCLM::DefaultSCLMScriptProvider>>,SLAM::Error>::~base((uint64_t)v62);
  v42 = v65;
  if (v65)
  {
    v43 = (unint64_t *)&v65->__shared_owners_;
    do
      v44 = __ldaxr(v43);
    while (__stlxr(v44 - 1, v43));
    if (!v44)
    {
      ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
      std::__shared_weak_count::__release_weak(v42);
    }
  }
  v45 = v67;
  if (v67)
  {
    v46 = (unint64_t *)&v67->__shared_owners_;
    do
      v47 = __ldaxr(v46);
    while (__stlxr(v47 - 1, v46));
    if (!v47)
    {
      ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
      std::__shared_weak_count::__release_weak(v45);
    }
  }

  return v27;
}

@end
