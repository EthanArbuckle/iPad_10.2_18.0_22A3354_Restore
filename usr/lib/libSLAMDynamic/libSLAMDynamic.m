void SLAM::SLAM::PerformScript(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  std::__shared_weak_count *v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  std::__shared_weak_count *v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  uint64_t v36;
  std::__shared_weak_count *v37;
  uint64_t v38;
  std::__shared_weak_count *v39;
  uint64_t v40;
  std::__shared_weak_count *v41;

  _ZNSt3__115allocate_sharedB8ne180100IN4SLAM21DefaultScriptProviderENS_9allocatorIS2_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v40);
  v8 = v40;
  v9 = v41;
  v32 = v41;
  v10 = a2[1];
  v38 = *a2;
  v39 = (std::__shared_weak_count *)v10;
  if (v10)
  {
    v11 = (unint64_t *)(v10 + 8);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  v13 = a3[1];
  v36 = *a3;
  v37 = (std::__shared_weak_count *)v13;
  if (v13)
  {
    v14 = (unint64_t *)(v13 + 8);
    do
      v15 = __ldxr(v14);
    while (__stxr(v15 + 1, v14));
  }
  v33 = v9;
  if (!v9)
  {
    v34 = v8;
    v35 = 0;
    if (v8)
      goto LABEL_13;
LABEL_40:
    std::terminate();
  }
  p_shared_owners = (unint64_t *)&v9->__shared_owners_;
  do
    v17 = __ldxr(p_shared_owners);
  while (__stxr(v17 + 1, p_shared_owners));
  v34 = v8;
  v35 = v9;
  do
    v18 = __ldxr(p_shared_owners);
  while (__stxr(v18 + 1, p_shared_owners));
  if (!v8)
    goto LABEL_40;
LABEL_13:
  SLAM::SLAMPrivateInterface::PerformScript(a1, &v38, &v36, &v34, a4);
  v19 = v35;
  if (v35)
  {
    v20 = (unint64_t *)&v35->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  if (v33)
  {
    v22 = (unint64_t *)&v33->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }
  v24 = v37;
  if (v37)
  {
    v25 = (unint64_t *)&v37->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  v27 = v39;
  if (v39)
  {
    v28 = (unint64_t *)&v39->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
  if (v32)
  {
    v30 = (unint64_t *)&v32->__shared_owners_;
    do
      v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }
}

{
  uint64_t v8;
  std::__shared_weak_count *v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  uint64_t v33;
  std::__shared_weak_count *v34;
  uint64_t v35;
  std::__shared_weak_count *v36;
  uint64_t v37;
  std::__shared_weak_count *v38;
  std::string v39;
  uint64_t v40;
  std::__shared_weak_count *v41;

  _ZNSt3__115allocate_sharedB8ne180100IN4SLAM21DefaultScriptProviderENS_9allocatorIS2_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v40);
  v8 = v40;
  v9 = v41;
  v32 = v41;
  if (*(char *)(a1 + 23) < 0)
    std::string::__init_copy_ctor_external(&v39, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
  else
    v39 = *(std::string *)a1;
  v10 = a2[1];
  v37 = *a2;
  v38 = (std::__shared_weak_count *)v10;
  if (v10)
  {
    v11 = (unint64_t *)(v10 + 8);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  v13 = a3[1];
  v35 = *a3;
  v36 = (std::__shared_weak_count *)v13;
  if (v13)
  {
    v14 = (unint64_t *)(v13 + 8);
    do
      v15 = __ldxr(v14);
    while (__stxr(v15 + 1, v14));
  }
  if (!v9)
  {
    v33 = v8;
    v34 = 0;
    if (v8)
      goto LABEL_16;
LABEL_45:
    std::terminate();
  }
  p_shared_owners = (unint64_t *)&v9->__shared_owners_;
  do
    v17 = __ldxr(p_shared_owners);
  while (__stxr(v17 + 1, p_shared_owners));
  v33 = v8;
  v34 = v9;
  do
    v18 = __ldxr(p_shared_owners);
  while (__stxr(v18 + 1, p_shared_owners));
  if (!v8)
    goto LABEL_45;
LABEL_16:
  SLAM::SLAMPrivateInterface::PerformScript((uint64_t)&v39, &v37, &v35, &v33, a4);
  v19 = v34;
  if (v34)
  {
    v20 = (unint64_t *)&v34->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  if (v9)
  {
    v22 = (unint64_t *)&v9->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  v24 = v36;
  if (v36)
  {
    v25 = (unint64_t *)&v36->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  v27 = v38;
  if (v38)
  {
    v28 = (unint64_t *)&v38->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
  if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v39.__r_.__value_.__l.__data_);
  if (v32)
  {
    v30 = (unint64_t *)&v32->__shared_owners_;
    do
      v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }
}

#error "21459D834: call analysis failed (funcsize=40)"

void SLAM::SLAMPrivateInterface::PerformScript(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
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
  std::__shared_weak_count *v33;
  void (***v34)(_QWORD, std::string *);
  unint64_t *v35;
  unint64_t v36;
  unint64_t *v37;
  unint64_t v38;
  uint64_t *v39;
  std::string::size_type v40;
  std::__shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  unint64_t *v47;
  unint64_t v48;
  std::string *p_p;
  uint64_t v50;
  std::string *v51;
  uint64_t v52;
  uint64_t (***v53)();
  uint64_t v54;
  unint64_t *v55;
  unint64_t v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  uint64_t v60;
  std::__shared_weak_count *v61;
  uint64_t v62;
  std::__shared_weak_count *v63;
  uint64_t v64;
  std::__shared_weak_count *v65;
  uint64_t v66;
  std::__shared_weak_count *v67;
  uint64_t v68;
  std::__shared_weak_count *v69;
  std::string *v70;
  uint64_t (**v71)();
  std::string::size_type v72;
  std::__shared_weak_count *v73;
  uint64_t (***v74)();
  std::string __p;
  std::string *v76;
  std::string v77;
  std::string *v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  std::allocate_shared[abi:ne180100]<SLAM::Logger,std::allocator<SLAM::Logger>,gsl::not_null<std::shared_ptr<SLAM::LogSink>> const&,void>(a3, &v68);
  *(_BYTE *)a5 = 0;
  *(_BYTE *)(a5 + 24) = 0;
  v10 = a2[1];
  v66 = *a2;
  v67 = (std::__shared_weak_count *)v10;
  if (v10)
  {
    v11 = (unint64_t *)(v10 + 8);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  v13 = v68;
  v62 = v68;
  v63 = v69;
  if (v69)
  {
    p_shared_owners = (unint64_t *)&v69->__shared_owners_;
    do
      v15 = __ldxr(p_shared_owners);
    while (__stxr(v15 + 1, p_shared_owners));
    v64 = v13;
    v65 = v63;
    if (v63)
    {
      v16 = (unint64_t *)&v63->__shared_owners_;
      do
        v17 = __ldxr(v16);
      while (__stxr(v17 + 1, v16));
    }
  }
  else
  {
    v64 = v68;
    v65 = 0;
  }
  if (!v13)
    std::terminate();
  v18 = (std::__shared_weak_count *)a4[1];
  v60 = *a4;
  v61 = v18;
  if (v18)
  {
    v19 = (unint64_t *)&v18->__shared_owners_;
    do
      v20 = __ldxr(v19);
    while (__stxr(v20 + 1, v19));
  }
  SLAM::Impl::Impl(&__p, &v66, &v64, &v60);
  SLAM::Impl::PerformScript((SLAM::Impl *)&__p, &v77);
  std::__optional_storage_base<SLAM::Error,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<SLAM::Error,false>>((std::vector<std::string> *)a5, (uint64_t)&v77);
  if ((_BYTE)v78)
  {
    v70 = &v77;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v70);
  }
  SLAM::Impl::~Impl((SLAM::Impl *)&__p);
  v21 = v61;
  if (v61)
  {
    v22 = (unint64_t *)&v61->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  v24 = v65;
  if (v65)
  {
    v25 = (unint64_t *)&v65->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  v27 = v63;
  if (v63)
  {
    v28 = (unint64_t *)&v63->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
  v30 = v67;
  if (v67)
  {
    v31 = (unint64_t *)&v67->__shared_owners_;
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
  if (*(_BYTE *)(a5 + 24))
  {
    SLAM::Error::Add((std::vector<std::string> *)a5, "While performing script 0x%llx", a1);
    v34 = (void (***)(_QWORD, std::string *))*a3;
    v33 = (std::__shared_weak_count *)a3[1];
    v77.__r_.__value_.__r.__words[0] = *a3;
    v77.__r_.__value_.__l.__size_ = (std::string::size_type)v33;
    if (v33)
    {
      v35 = (unint64_t *)&v33->__shared_owners_;
      do
        v36 = __ldxr(v35);
      while (__stxr(v36 + 1, v35));
    }
    ctu::join<std::__wrap_iter<std::string const*>>(*(std::string **)a5, *(std::string **)(a5 + 8), ", ", 2uLL, &__p);
    (**v34)(v34, &__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (v33)
    {
      v37 = (unint64_t *)&v33->__shared_owners_;
      do
        v38 = __ldaxr(v37);
      while (__stlxr(v38 - 1, v37));
      if (!v38)
      {
        ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
        std::__shared_weak_count::__release_weak(v33);
      }
    }
    v39 = (uint64_t *)v68;
    v40 = *a3;
    v41 = (std::__shared_weak_count *)a3[1];
    if (v41)
    {
      v42 = (unint64_t *)&v41->__shared_owners_;
      do
        v43 = __ldxr(v42);
      while (__stxr(v43 + 1, v42));
      v73 = v41;
      v74 = 0;
      v72 = v40;
      do
        v44 = __ldxr(v42);
      while (__stxr(v44 + 1, v42));
    }
    else
    {
      v73 = 0;
      v74 = 0;
      v72 = v40;
    }
    v71 = &off_24D1BA600;
    v74 = &v71;
    v45 = v39 + 2;
    if (v39[6])
      v46 = v39[4];
    else
      v46 = 0;
    v77.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_24D1BA600;
    v77.__r_.__value_.__l.__size_ = v40;
    v77.__r_.__value_.__r.__words[2] = (std::string::size_type)v41;
    v78 = &v77;
    if (v41)
    {
      v47 = (unint64_t *)&v41->__shared_owners_;
      do
        v48 = __ldxr(v47);
      while (__stxr(v48 + 1, v47));
    }
    std::for_each[abi:ne180100]<boost::cb_details::iterator<boost::circular_buffer<std::string,std::allocator<std::string>>,boost::cb_details::const_traits<std::allocator<std::string>>>,std::function<void ()(std::string const&)>>(v45, v46, 0, (uint64_t)&v77, (uint64_t)&__p);
    p_p = v76;
    if (v76 == &__p)
    {
      v50 = 4;
      p_p = &__p;
    }
    else
    {
      if (!v76)
        goto LABEL_67;
      v50 = 5;
    }
    (*(void (**)(void))(p_p->__r_.__value_.__r.__words[0] + 8 * v50))();
LABEL_67:
    v51 = v78;
    if (v78 == &v77)
    {
      v52 = 4;
      v51 = &v77;
    }
    else
    {
      if (!v78)
        goto LABEL_72;
      v52 = 5;
    }
    (*(void (**)(void))(v51->__r_.__value_.__r.__words[0] + 8 * v52))();
LABEL_72:
    v53 = v74;
    if (v74 == &v71)
    {
      v54 = 4;
      v53 = &v71;
    }
    else
    {
      if (!v74)
      {
LABEL_77:
        if (v41)
        {
          v55 = (unint64_t *)&v41->__shared_owners_;
          do
            v56 = __ldaxr(v55);
          while (__stlxr(v56 - 1, v55));
          if (!v56)
          {
            ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
            std::__shared_weak_count::__release_weak(v41);
          }
        }
        goto LABEL_82;
      }
      v54 = 5;
    }
    (*v53)[v54]();
    goto LABEL_77;
  }
LABEL_82:
  v57 = v69;
  if (v69)
  {
    v58 = (unint64_t *)&v69->__shared_owners_;
    do
      v59 = __ldaxr(v58);
    while (__stlxr(v59 - 1, v58));
    if (!v59)
    {
      ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
      std::__shared_weak_count::__release_weak(v57);
    }
  }
}

{
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
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
  std::__shared_weak_count *v33;
  void (***v34)(_QWORD, std::string *);
  unint64_t *v35;
  unint64_t v36;
  unint64_t *v37;
  unint64_t v38;
  uint64_t *v39;
  std::string::size_type v40;
  std::__shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  unint64_t *v47;
  unint64_t v48;
  std::string *v49;
  uint64_t v50;
  std::string *v51;
  uint64_t v52;
  uint64_t (***v53)();
  uint64_t v54;
  unint64_t *v55;
  unint64_t v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  std::string v60;
  uint64_t v61;
  std::__shared_weak_count *v62;
  uint64_t v63;
  std::__shared_weak_count *v64;
  uint64_t v65;
  std::__shared_weak_count *v66;
  uint64_t v67;
  std::__shared_weak_count *v68;
  uint64_t v69;
  std::__shared_weak_count *v70;
  std::string *v71;
  uint64_t (**v72)();
  std::string::size_type v73;
  std::__shared_weak_count *v74;
  uint64_t (***v75)();
  std::string v76;
  std::string *v77;
  std::string v78;
  std::string *v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  std::allocate_shared[abi:ne180100]<SLAM::Logger,std::allocator<SLAM::Logger>,gsl::not_null<std::shared_ptr<SLAM::LogSink>> const&,void>(a3, &v69);
  *(_BYTE *)a5 = 0;
  *(_BYTE *)(a5 + 24) = 0;
  v10 = a2[1];
  v67 = *a2;
  v68 = (std::__shared_weak_count *)v10;
  if (v10)
  {
    v11 = (unint64_t *)(v10 + 8);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  v13 = v69;
  v63 = v69;
  v64 = v70;
  if (v70)
  {
    p_shared_owners = (unint64_t *)&v70->__shared_owners_;
    do
      v15 = __ldxr(p_shared_owners);
    while (__stxr(v15 + 1, p_shared_owners));
    v65 = v13;
    v66 = v64;
    if (v64)
    {
      v16 = (unint64_t *)&v64->__shared_owners_;
      do
        v17 = __ldxr(v16);
      while (__stxr(v17 + 1, v16));
    }
  }
  else
  {
    v65 = v69;
    v66 = 0;
  }
  if (!v13)
    std::terminate();
  v18 = (std::__shared_weak_count *)a4[1];
  v61 = *a4;
  v62 = v18;
  if (v18)
  {
    v19 = (unint64_t *)&v18->__shared_owners_;
    do
      v20 = __ldxr(v19);
    while (__stxr(v20 + 1, v19));
  }
  SLAM::Impl::Impl(&v76, &v67, &v65, &v61);
  if (*(char *)(a1 + 23) < 0)
    std::string::__init_copy_ctor_external(&v60, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
  else
    v60 = *(std::string *)a1;
  SLAM::Impl::PerformScript((SLAM::Impl *)&v76, (const char *)&v60, &v78);
  std::__optional_storage_base<SLAM::Error,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<SLAM::Error,false>>((std::vector<std::string> *)a5, (uint64_t)&v78);
  if ((_BYTE)v79)
  {
    v71 = &v78;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v71);
  }
  if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v60.__r_.__value_.__l.__data_);
  SLAM::Impl::~Impl((SLAM::Impl *)&v76);
  v21 = v62;
  if (v62)
  {
    v22 = (unint64_t *)&v62->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  v24 = v66;
  if (v66)
  {
    v25 = (unint64_t *)&v66->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  v27 = v64;
  if (v64)
  {
    v28 = (unint64_t *)&v64->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
  v30 = v68;
  if (v68)
  {
    v31 = (unint64_t *)&v68->__shared_owners_;
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
  if (*(_BYTE *)(a5 + 24))
  {
    v34 = (void (***)(_QWORD, std::string *))*a3;
    v33 = (std::__shared_weak_count *)a3[1];
    v78.__r_.__value_.__r.__words[0] = *a3;
    v78.__r_.__value_.__l.__size_ = (std::string::size_type)v33;
    if (v33)
    {
      v35 = (unint64_t *)&v33->__shared_owners_;
      do
        v36 = __ldxr(v35);
      while (__stxr(v36 + 1, v35));
    }
    ctu::join<std::__wrap_iter<std::string const*>>(*(std::string **)a5, *(std::string **)(a5 + 8), ", ", 2uLL, &v76);
    (**v34)(v34, &v76);
    if (SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v76.__r_.__value_.__l.__data_);
    if (v33)
    {
      v37 = (unint64_t *)&v33->__shared_owners_;
      do
        v38 = __ldaxr(v37);
      while (__stlxr(v38 - 1, v37));
      if (!v38)
      {
        ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
        std::__shared_weak_count::__release_weak(v33);
      }
    }
    v39 = (uint64_t *)v69;
    v40 = *a3;
    v41 = (std::__shared_weak_count *)a3[1];
    if (v41)
    {
      v42 = (unint64_t *)&v41->__shared_owners_;
      do
        v43 = __ldxr(v42);
      while (__stxr(v43 + 1, v42));
      v74 = v41;
      v75 = 0;
      v73 = v40;
      do
        v44 = __ldxr(v42);
      while (__stxr(v44 + 1, v42));
    }
    else
    {
      v74 = 0;
      v75 = 0;
      v73 = v40;
    }
    v72 = &off_24D1BA690;
    v75 = &v72;
    v45 = v39 + 2;
    if (v39[6])
      v46 = v39[4];
    else
      v46 = 0;
    v78.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_24D1BA690;
    v78.__r_.__value_.__l.__size_ = v40;
    v78.__r_.__value_.__r.__words[2] = (std::string::size_type)v41;
    v79 = &v78;
    if (v41)
    {
      v47 = (unint64_t *)&v41->__shared_owners_;
      do
        v48 = __ldxr(v47);
      while (__stxr(v48 + 1, v47));
    }
    std::for_each[abi:ne180100]<boost::cb_details::iterator<boost::circular_buffer<std::string,std::allocator<std::string>>,boost::cb_details::const_traits<std::allocator<std::string>>>,std::function<void ()(std::string const&)>>(v45, v46, 0, (uint64_t)&v78, (uint64_t)&v76);
    v49 = v77;
    if (v77 == &v76)
    {
      v50 = 4;
      v49 = &v76;
    }
    else
    {
      if (!v77)
        goto LABEL_72;
      v50 = 5;
    }
    (*(void (**)(void))(v49->__r_.__value_.__r.__words[0] + 8 * v50))();
LABEL_72:
    v51 = v79;
    if (v79 == &v78)
    {
      v52 = 4;
      v51 = &v78;
    }
    else
    {
      if (!v79)
        goto LABEL_77;
      v52 = 5;
    }
    (*(void (**)(void))(v51->__r_.__value_.__r.__words[0] + 8 * v52))();
LABEL_77:
    v53 = v75;
    if (v75 == &v72)
    {
      v54 = 4;
      v53 = &v72;
    }
    else
    {
      if (!v75)
      {
LABEL_82:
        if (v41)
        {
          v55 = (unint64_t *)&v41->__shared_owners_;
          do
            v56 = __ldaxr(v55);
          while (__stlxr(v56 - 1, v55));
          if (!v56)
          {
            ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
            std::__shared_weak_count::__release_weak(v41);
          }
        }
        goto LABEL_87;
      }
      v54 = 5;
    }
    (*v53)[v54]();
    goto LABEL_82;
  }
LABEL_87:
  v57 = v70;
  if (v70)
  {
    v58 = (unint64_t *)&v70->__shared_owners_;
    do
      v59 = __ldaxr(v58);
    while (__stlxr(v59 - 1, v58));
    if (!v59)
    {
      ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
      std::__shared_weak_count::__release_weak(v57);
    }
  }
}

void sub_21459DD30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, char a15, uint64_t a16, char a17, uint64_t a18, char a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v37;
  uint64_t v38;

  v37 = *(_QWORD **)(v35 - 64);
  if (v37 == v34)
  {
    v38 = 4;
    v37 = (_QWORD *)(v35 - 88);
  }
  else
  {
    if (!v37)
      goto LABEL_6;
    v38 = 5;
  }
  (*(void (**)(void))(*v37 + 8 * v38))();
LABEL_6:
  SLAM::SLAMPrivateInterface::PerformScript();
  if (*(_BYTE *)(v33 + 24))
  {
    a23 = v33;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a23);
  }
  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100]((uint64_t)&a21);
  _Unwind_Resume(a1);
}

std::vector<std::string> *SLAM::Error::Error(std::vector<std::string> *this, const char *a2, ...)
{
  std::string *value;
  std::vector<std::string>::pointer end;
  __int128 v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  std::string *v10;
  std::string *v11;
  __int128 v12;
  std::string *v13;
  int v14;
  void *__p[2];
  std::string::size_type v17;
  va_list v18;
  std::__split_buffer<std::string> __v;
  va_list va;

  va_start(va, a2);
  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  va_copy(v18, va);
  __v.__first_ = 0;
  vasprintf((char **)&__v, a2, va);
  if (__v.__first_)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)__v.__first_);
    free(__v.__first_);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "<FAILED TO VASPRINTF>");
  }
  value = this->__end_cap_.__value_;
  end = this->__end_;
  if (end >= value)
  {
    v6 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)this->__begin_) >> 3);
    v7 = v6 + 1;
    if (v6 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)this->__begin_) >> 3);
    if (2 * v8 > v7)
      v7 = 2 * v8;
    if (v8 >= 0x555555555555555)
      v9 = 0xAAAAAAAAAAAAAAALL;
    else
      v9 = v7;
    __v.__end_cap_.__value_ = (std::allocator<std::string> *)&this->__end_cap_;
    if (v9)
      v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&this->__end_cap_, v9);
    else
      v10 = 0;
    v11 = v10 + v6;
    __v.__first_ = v10;
    __v.__begin_ = v11;
    __v.__end_cap_.__value_ = &v10[v9];
    v12 = *(_OWORD *)__p;
    v11->__r_.__value_.__r.__words[2] = v17;
    *(_OWORD *)&v11->__r_.__value_.__l.__data_ = v12;
    __p[1] = 0;
    v17 = 0;
    __p[0] = 0;
    __v.__end_ = v11 + 1;
    std::vector<std::string>::__swap_out_circular_buffer(this, &__v);
    v13 = this->__end_;
    std::__split_buffer<std::string>::~__split_buffer(&__v);
    v14 = SHIBYTE(v17);
    this->__end_ = v13;
    if (v14 < 0)
      operator delete(__p[0]);
  }
  else
  {
    v5 = *(_OWORD *)__p;
    end->__r_.__value_.__r.__words[2] = v17;
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v5;
    this->__end_ = end + 1;
  }
  return this;
}

void sub_21459E008(_Unwind_Exception *a1, void *__p, uint64_t a3, int a4, __int16 a5, char a6, char a7, uint64_t a8, std::__split_buffer<std::string> *a9, void *__pa, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17)
{
  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a17);
  if (a15 < 0)
    operator delete(__pa);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__pa);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

#error "21459E31C: call analysis failed (funcsize=33)"

#error "21459E958: call analysis failed (funcsize=44)"

void SLAM::SLAM::PerformRecovery(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  std::__shared_weak_count *v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  std::__shared_weak_count *v31;
  uint64_t v32;
  std::__shared_weak_count *v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  uint64_t v36;
  std::__shared_weak_count *v37;
  uint64_t v38;
  std::__shared_weak_count *v39;

  _ZNSt3__115allocate_sharedB8ne180100IN4SLAM21DefaultScriptProviderENS_9allocatorIS2_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v38);
  v6 = v38;
  v7 = v39;
  v30 = v39;
  v8 = a1[1];
  v36 = *a1;
  v37 = (std::__shared_weak_count *)v8;
  if (v8)
  {
    v9 = (unint64_t *)(v8 + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  v11 = a2[1];
  v34 = *a2;
  v35 = (std::__shared_weak_count *)v11;
  if (v11)
  {
    v12 = (unint64_t *)(v11 + 8);
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }
  v31 = v7;
  if (!v7)
  {
    v32 = v6;
    v33 = 0;
    if (v6)
      goto LABEL_13;
LABEL_40:
    std::terminate();
  }
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  do
    v15 = __ldxr(p_shared_owners);
  while (__stxr(v15 + 1, p_shared_owners));
  v32 = v6;
  v33 = v7;
  do
    v16 = __ldxr(p_shared_owners);
  while (__stxr(v16 + 1, p_shared_owners));
  if (!v6)
    goto LABEL_40;
LABEL_13:
  SLAM::SLAMPrivateInterface::PerformRecovery(&v36, &v34, &v32, a3);
  v17 = v33;
  if (v33)
  {
    v18 = (unint64_t *)&v33->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  if (v31)
  {
    v20 = (unint64_t *)&v31->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }
  v22 = v35;
  if (v35)
  {
    v23 = (unint64_t *)&v35->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  v25 = v37;
  if (v37)
  {
    v26 = (unint64_t *)&v37->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  if (v30)
  {
    v28 = (unint64_t *)&v30->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
}

#error "21459EC18: call analysis failed (funcsize=40)"

void SLAM::SLAMPrivateInterface::PerformRecovery(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  std::__shared_weak_count *v31;
  void (***v32)(_QWORD, std::string *);
  unint64_t *v33;
  unint64_t v34;
  unint64_t *v35;
  unint64_t v36;
  uint64_t *v37;
  std::string::size_type v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  unint64_t *v45;
  unint64_t v46;
  std::string *p_p;
  uint64_t v48;
  std::string *v49;
  uint64_t v50;
  uint64_t (***v51)();
  uint64_t v52;
  unint64_t *v53;
  unint64_t v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  uint64_t v58;
  std::__shared_weak_count *v59;
  uint64_t v60;
  std::__shared_weak_count *v61;
  uint64_t v62;
  std::__shared_weak_count *v63;
  uint64_t v64;
  std::__shared_weak_count *v65;
  uint64_t v66;
  std::__shared_weak_count *v67;
  std::string *v68;
  uint64_t (**v69)();
  std::string::size_type v70;
  std::__shared_weak_count *v71;
  uint64_t (***v72)();
  std::string __p;
  std::string *v74;
  std::string v75;
  std::string *v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  std::allocate_shared[abi:ne180100]<SLAM::Logger,std::allocator<SLAM::Logger>,gsl::not_null<std::shared_ptr<SLAM::LogSink>> const&,void>(a2, &v66);
  *(_BYTE *)a4 = 0;
  *(_BYTE *)(a4 + 24) = 0;
  v8 = a1[1];
  v64 = *a1;
  v65 = (std::__shared_weak_count *)v8;
  if (v8)
  {
    v9 = (unint64_t *)(v8 + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  v11 = v66;
  v60 = v66;
  v61 = v67;
  if (v67)
  {
    p_shared_owners = (unint64_t *)&v67->__shared_owners_;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
    v62 = v11;
    v63 = v61;
    if (v61)
    {
      v14 = (unint64_t *)&v61->__shared_owners_;
      do
        v15 = __ldxr(v14);
      while (__stxr(v15 + 1, v14));
    }
  }
  else
  {
    v62 = v66;
    v63 = 0;
  }
  if (!v11)
    std::terminate();
  v16 = (std::__shared_weak_count *)a3[1];
  v58 = *a3;
  v59 = v16;
  if (v16)
  {
    v17 = (unint64_t *)&v16->__shared_owners_;
    do
      v18 = __ldxr(v17);
    while (__stxr(v18 + 1, v17));
  }
  SLAM::Impl::Impl(&__p, &v64, &v62, &v58);
  SLAM::Impl::PerformRecovery((SLAM::Impl *)&__p, &v75);
  std::__optional_storage_base<SLAM::Error,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<SLAM::Error,false>>((std::vector<std::string> *)a4, (uint64_t)&v75);
  if ((_BYTE)v76)
  {
    v68 = &v75;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v68);
  }
  SLAM::Impl::~Impl((SLAM::Impl *)&__p);
  v19 = v59;
  if (v59)
  {
    v20 = (unint64_t *)&v59->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  v22 = v63;
  if (v63)
  {
    v23 = (unint64_t *)&v63->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  v25 = v61;
  if (v61)
  {
    v26 = (unint64_t *)&v61->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  v28 = v65;
  if (v65)
  {
    v29 = (unint64_t *)&v65->__shared_owners_;
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  if (*(_BYTE *)(a4 + 24))
  {
    SLAM::Error::Add((std::vector<std::string> *)a4, "While performing recovery");
    v32 = (void (***)(_QWORD, std::string *))*a2;
    v31 = (std::__shared_weak_count *)a2[1];
    v75.__r_.__value_.__r.__words[0] = *a2;
    v75.__r_.__value_.__l.__size_ = (std::string::size_type)v31;
    if (v31)
    {
      v33 = (unint64_t *)&v31->__shared_owners_;
      do
        v34 = __ldxr(v33);
      while (__stxr(v34 + 1, v33));
    }
    ctu::join<std::__wrap_iter<std::string const*>>(*(std::string **)a4, *(std::string **)(a4 + 8), ", ", 2uLL, &__p);
    (**v32)(v32, &__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (v31)
    {
      v35 = (unint64_t *)&v31->__shared_owners_;
      do
        v36 = __ldaxr(v35);
      while (__stlxr(v36 - 1, v35));
      if (!v36)
      {
        ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
        std::__shared_weak_count::__release_weak(v31);
      }
    }
    v37 = (uint64_t *)v66;
    v38 = *a2;
    v39 = (std::__shared_weak_count *)a2[1];
    if (v39)
    {
      v40 = (unint64_t *)&v39->__shared_owners_;
      do
        v41 = __ldxr(v40);
      while (__stxr(v41 + 1, v40));
      v71 = v39;
      v72 = 0;
      v70 = v38;
      do
        v42 = __ldxr(v40);
      while (__stxr(v42 + 1, v40));
    }
    else
    {
      v71 = 0;
      v72 = 0;
      v70 = v38;
    }
    v69 = &off_24D1BA710;
    v72 = &v69;
    v43 = v37 + 2;
    if (v37[6])
      v44 = v37[4];
    else
      v44 = 0;
    v75.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_24D1BA710;
    v75.__r_.__value_.__l.__size_ = v38;
    v75.__r_.__value_.__r.__words[2] = (std::string::size_type)v39;
    v76 = &v75;
    if (v39)
    {
      v45 = (unint64_t *)&v39->__shared_owners_;
      do
        v46 = __ldxr(v45);
      while (__stxr(v46 + 1, v45));
    }
    std::for_each[abi:ne180100]<boost::cb_details::iterator<boost::circular_buffer<std::string,std::allocator<std::string>>,boost::cb_details::const_traits<std::allocator<std::string>>>,std::function<void ()(std::string const&)>>(v43, v44, 0, (uint64_t)&v75, (uint64_t)&__p);
    p_p = v74;
    if (v74 == &__p)
    {
      v48 = 4;
      p_p = &__p;
    }
    else
    {
      if (!v74)
        goto LABEL_67;
      v48 = 5;
    }
    (*(void (**)(void))(p_p->__r_.__value_.__r.__words[0] + 8 * v48))();
LABEL_67:
    v49 = v76;
    if (v76 == &v75)
    {
      v50 = 4;
      v49 = &v75;
    }
    else
    {
      if (!v76)
        goto LABEL_72;
      v50 = 5;
    }
    (*(void (**)(void))(v49->__r_.__value_.__r.__words[0] + 8 * v50))();
LABEL_72:
    v51 = v72;
    if (v72 == &v69)
    {
      v52 = 4;
      v51 = &v69;
    }
    else
    {
      if (!v72)
      {
LABEL_77:
        if (v39)
        {
          v53 = (unint64_t *)&v39->__shared_owners_;
          do
            v54 = __ldaxr(v53);
          while (__stlxr(v54 - 1, v53));
          if (!v54)
          {
            ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
            std::__shared_weak_count::__release_weak(v39);
          }
        }
        goto LABEL_82;
      }
      v52 = 5;
    }
    (*v51)[v52]();
    goto LABEL_77;
  }
LABEL_82:
  v55 = v67;
  if (v67)
  {
    v56 = (unint64_t *)&v67->__shared_owners_;
    do
      v57 = __ldaxr(v56);
    while (__stlxr(v57 - 1, v56));
    if (!v57)
    {
      ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
      std::__shared_weak_count::__release_weak(v55);
    }
  }
}

void sub_21459F100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, char a15, uint64_t a16, char a17, uint64_t a18, char a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  uint64_t v33;
  uint64_t v34;
  _QWORD *v36;
  uint64_t v37;

  v36 = *(_QWORD **)(v34 - 64);
  if (v36 == (_QWORD *)(v34 - 88))
  {
    v37 = 4;
    v36 = (_QWORD *)(v34 - 88);
  }
  else
  {
    if (!v36)
      goto LABEL_6;
    v37 = 5;
  }
  (*(void (**)(void))(*v36 + 8 * v37))();
LABEL_6:
  SLAM::SLAMPrivateInterface::PerformScript();
  if (*(_BYTE *)(v33 + 24))
  {
    a23 = v33;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a23);
  }
  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100]((uint64_t)&a21);
  _Unwind_Resume(a1);
}

uint64_t SLAM::Impl::PerformScript@<X0>(SLAM::Impl *this@<X0>, std::string *a2@<X8>)
{
  __int128 *v4;
  __int128 *v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 *v13;
  __int128 *v14;
  char v15;
  __int128 *v16;
  __int128 *v17;
  char v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (__int128 *)*((_QWORD *)this + 6);
  v5 = (__int128 *)*((_QWORD *)this + 7);
  v13 = v4;
  v14 = v5;
  if (v5)
  {
    v6 = (unint64_t *)v5 + 1;
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  (*(void (**)(__int128 **__return_ptr))(*(_QWORD *)v4 + 8))(&v16);
  if (v5)
  {
    v8 = (unint64_t *)v5 + 1;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      (*(void (**)(__int128 *))(*(_QWORD *)v5 + 16))(v5);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v5);
    }
  }
  if (v18)
  {
    SLAM::Impl::QueryMigrationInfo(this, (uint64_t)&v13);
    if (v15)
    {
      v10 = caulk::expected<SLAM::Script,SLAM::Error>::value((uint64_t)&v16);
      v11 = caulk::expected<SLAM::MigrationInfo,SLAM::Error>::value((uint64_t)&v13);
      (*(void (**)(SLAM::Impl *, uint64_t, uint64_t))(*(_QWORD *)this + 16))(this, v10, v11);
    }
    else
    {
      a2->__r_.__value_.__r.__words[0] = 0;
      a2->__r_.__value_.__l.__size_ = 0;
      a2->__r_.__value_.__r.__words[2] = 0;
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(a2, v13, v14, 0xAAAAAAAAAAAAAAABLL * (((char *)v14 - (char *)v13) >> 3));
      a2[1].__r_.__value_.__s.__data_[0] = 1;
    }
    caulk::__expected_detail::base<SLAM::MigrationInfo,SLAM::Error>::~base((uint64_t)&v13);
  }
  else
  {
    a2->__r_.__value_.__r.__words[0] = 0;
    a2->__r_.__value_.__l.__size_ = 0;
    a2->__r_.__value_.__r.__words[2] = 0;
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(a2, v16, v17, 0xAAAAAAAAAAAAAAABLL * (((char *)v17 - (char *)v16) >> 3));
    a2[1].__r_.__value_.__s.__data_[0] = 1;
  }
  return caulk::__expected_detail::base<SLAM::Script,SLAM::Error>::~base((uint64_t)&v16);
}

void sub_21459F3F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  caulk::__expected_detail::base<SLAM::Script,SLAM::Error>::~base((uint64_t)va);
  _Unwind_Resume(a1);
}

std::vector<std::string> *std::optional<SLAM::Error>::operator=[abi:ne180100]<SLAM::Error,void>(std::vector<std::string> *this, std::vector<std::string> *a2)
{
  if (LOBYTE(this[1].__begin_))
  {
    std::vector<std::string>::__vdeallocate(this);
    *(_OWORD *)&this->__begin_ = *(_OWORD *)&a2->__begin_;
    this->__end_cap_.__value_ = a2->__end_cap_.__value_;
    a2->__begin_ = 0;
    a2->__end_ = 0;
    a2->__end_cap_.__value_ = 0;
  }
  else
  {
    this->__begin_ = 0;
    this->__end_ = 0;
    this->__end_cap_.__value_ = 0;
    *this = *a2;
    a2->__begin_ = 0;
    a2->__end_ = 0;
    a2->__end_cap_.__value_ = 0;
    LOBYTE(this[1].__begin_) = 1;
  }
  return this;
}

std::vector<std::string> *SLAM::Error::Add(std::vector<std::string> *this, const char *a2, ...)
{
  std::string *value;
  std::vector<std::string>::pointer end;
  __int128 v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  std::string *v10;
  std::string *v11;
  __int128 v12;
  std::string *v13;
  int v14;
  void *__p[2];
  std::string::size_type v17;
  va_list v18;
  std::__split_buffer<std::string> __v;
  va_list va;

  va_start(va, a2);
  va_copy(v18, va);
  __v.__first_ = 0;
  vasprintf((char **)&__v, a2, va);
  if (__v.__first_)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)__v.__first_);
    free(__v.__first_);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "<FAILED TO VASPRINTF>");
  }
  value = this->__end_cap_.__value_;
  end = this->__end_;
  if (end >= value)
  {
    v6 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)this->__begin_) >> 3);
    v7 = v6 + 1;
    if (v6 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)this->__begin_) >> 3);
    if (2 * v8 > v7)
      v7 = 2 * v8;
    if (v8 >= 0x555555555555555)
      v9 = 0xAAAAAAAAAAAAAAALL;
    else
      v9 = v7;
    __v.__end_cap_.__value_ = (std::allocator<std::string> *)&this->__end_cap_;
    if (v9)
      v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&this->__end_cap_, v9);
    else
      v10 = 0;
    v11 = v10 + v6;
    __v.__first_ = v10;
    __v.__begin_ = v11;
    __v.__end_cap_.__value_ = &v10[v9];
    v12 = *(_OWORD *)__p;
    v11->__r_.__value_.__r.__words[2] = v17;
    *(_OWORD *)&v11->__r_.__value_.__l.__data_ = v12;
    __p[1] = 0;
    v17 = 0;
    __p[0] = 0;
    __v.__end_ = v11 + 1;
    std::vector<std::string>::__swap_out_circular_buffer(this, &__v);
    v13 = this->__end_;
    std::__split_buffer<std::string>::~__split_buffer(&__v);
    v14 = SHIBYTE(v17);
    this->__end_ = v13;
    if (v14 < 0)
      operator delete(__p[0]);
  }
  else
  {
    v5 = *(_OWORD *)__p;
    end->__r_.__value_.__r.__words[2] = v17;
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v5;
    this->__end_ = end + 1;
  }
  return this;
}

void sub_21459F610(_Unwind_Exception *a1, void *__p, uint64_t a3, int a4, __int16 a5, char a6, char a7, uint64_t a8, std::__split_buffer<std::string> *a9, void *__pa, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17)
{
  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a17);
  if (a15 < 0)
    operator delete(__pa);
  _Unwind_Resume(a1);
}

void SLAM::Impl::PerformScript(SLAM::Impl *a1@<X0>, const char *a2@<X1>, std::string *a3@<X8>)
{
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  void (***v10)(void ***__return_ptr, _QWORD, std::string *, void **, uint64_t);
  unint64_t *p_shared_owners;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void **v24;
  void *v25[2];
  char v26;
  std::string v27;
  void *__p;
  void *v29;
  uint64_t v30;
  std::string v31;
  void *v32;
  _BYTE *v33;
  uint64_t v34;
  __int128 *v35;
  __int128 *v36;
  char v37;
  void **v38;
  __int128 *v39;
  char v40;
  __int128 *v41;
  __int128 *v42;
  char v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  SLAM::Impl::GetChipId(a1, (uint64_t)&v35);
  if (!v37)
  {
    a3->__r_.__value_.__r.__words[0] = 0;
    a3->__r_.__value_.__l.__size_ = 0;
    a3->__r_.__value_.__r.__words[2] = 0;
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(a3, v35, v36, 0xAAAAAAAAAAAAAAABLL * (((char *)v36 - (char *)v35) >> 3));
    a3[1].__r_.__value_.__s.__data_[0] = 1;
    goto LABEL_50;
  }
  v6 = *(unsigned __int8 *)caulk::expected<unsigned char,SLAM::Error>::value((uint64_t)&v35);
  v7 = 1;
  if (v6 > 0xC7)
  {
    if (v6 == 200 || v6 == 210)
      goto LABEL_10;
  }
  else if (v6 == 100 || v6 == 115)
  {
    goto LABEL_10;
  }
  v7 = 2;
LABEL_10:
  SLAM::Impl::QueryMigrationInfo(a1, (uint64_t)&v41);
  if (v43)
  {
    v8 = caulk::expected<SLAM::MigrationInfo,SLAM::Error>::value((uint64_t)&v41);
    v32 = 0;
    v33 = 0;
    v34 = 0;
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v32, *(const void **)(v8 + 16), *(_QWORD *)(v8 + 24), *(_QWORD *)(v8 + 24) - *(_QWORD *)(v8 + 16));
    v10 = (void (***)(void ***__return_ptr, _QWORD, std::string *, void **, uint64_t))*((_QWORD *)a1 + 6);
    v9 = (std::__shared_weak_count *)*((_QWORD *)a1 + 7);
    v27.__r_.__value_.__r.__words[0] = (std::string::size_type)v10;
    v27.__r_.__value_.__l.__size_ = (std::string::size_type)v9;
    if (v9)
    {
      p_shared_owners = (unint64_t *)&v9->__shared_owners_;
      do
        v12 = __ldxr(p_shared_owners);
      while (__stxr(v12 + 1, p_shared_owners));
    }
    if (a2[23] < 0)
      std::string::__init_copy_ctor_external(&v31, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
    else
      v31 = *(std::string *)a2;
    __p = 0;
    v29 = 0;
    v30 = 0;
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, v32, (uint64_t)v33, v33 - (_BYTE *)v32);
    (**v10)(&v38, v10, &v31, &__p, v7);
    if (__p)
    {
      v29 = __p;
      operator delete(__p);
    }
    if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v31.__r_.__value_.__l.__data_);
    if (v9)
    {
      v13 = (unint64_t *)&v9->__shared_owners_;
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
    if (v40)
    {
      v16 = *((_QWORD *)a1 + 8);
      v15 = (std::__shared_weak_count *)*((_QWORD *)a1 + 9);
      v27.__r_.__value_.__r.__words[0] = v16;
      v27.__r_.__value_.__l.__size_ = (std::string::size_type)v15;
      if (v15)
      {
        v17 = (unint64_t *)&v15->__shared_owners_;
        do
          v18 = __ldxr(v17);
        while (__stxr(v18 + 1, v17));
      }
      if (a2[23] < 0)
        a2 = *(const char **)a2;
      v19 = (_QWORD *)caulk::expected<SLAM::Script,SLAM::Error>::value((uint64_t)&v38);
      SLAM::Logger::Log(v16, 1, (uint64_t)"PerformScript", 179, "Executing script %s ID 0x%llX", a2, *v19);
      if (v15)
      {
        v20 = (unint64_t *)&v15->__shared_owners_;
        do
          v21 = __ldaxr(v20);
        while (__stlxr(v21 - 1, v20));
        if (!v21)
        {
          ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
          std::__shared_weak_count::__release_weak(v15);
        }
      }
      v22 = caulk::expected<SLAM::Script,SLAM::Error>::value((uint64_t)&v38);
      v23 = caulk::expected<SLAM::MigrationInfo,SLAM::Error>::value((uint64_t)&v41);
      (*(void (**)(SLAM::Impl *, uint64_t, uint64_t))(*(_QWORD *)a1 + 16))(a1, v22, v23);
    }
    else
    {
      memset(&v27, 0, sizeof(v27));
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v27, (__int128 *)v38, v39, 0xAAAAAAAAAAAAAAABLL * (((char *)v39 - (char *)v38) >> 3));
      if (a2[23] < 0)
        a2 = *(const char **)a2;
      ctu::hex();
      if (v26 >= 0)
        v24 = v25;
      else
        v24 = (void **)v25[0];
      SLAM::Error::Add((std::vector<std::string> *)&v27, "with name %s, pkHash %s, platformCategory %d", a2, (const char *)v24, v7);
      if (v26 < 0)
        operator delete(v25[0]);
      *a3 = v27;
      memset(&v27, 0, sizeof(v27));
      a3[1].__r_.__value_.__s.__data_[0] = 1;
      v25[0] = &v27;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v25);
    }
    caulk::__expected_detail::base<SLAM::Script,SLAM::Error>::~base((uint64_t)&v38);
    if (v32)
    {
      v33 = v32;
      operator delete(v32);
    }
  }
  else
  {
    a3->__r_.__value_.__r.__words[0] = 0;
    a3->__r_.__value_.__l.__size_ = 0;
    a3->__r_.__value_.__r.__words[2] = 0;
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(a3, v41, v42, 0xAAAAAAAAAAAAAAABLL * (((char *)v42 - (char *)v41) >> 3));
    a3[1].__r_.__value_.__s.__data_[0] = 1;
  }
  caulk::__expected_detail::base<SLAM::MigrationInfo,SLAM::Error>::~base((uint64_t)&v41);
LABEL_50:
  if (!v37)
  {
    v38 = (void **)&v35;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v38);
  }
}

void sub_21459FA1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,void *a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,char a36,char *a37)
{
  uint64_t v37;

  if (a17 < 0)
    operator delete(__p);
  __p = &a18;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  caulk::__expected_detail::base<SLAM::Script,SLAM::Error>::~base((uint64_t)&a37);
  if (a30)
  {
    a31 = (uint64_t)a30;
    operator delete(a30);
  }
  caulk::__expected_detail::base<SLAM::MigrationInfo,SLAM::Error>::~base(v37 - 128);
  if (!a36)
  {
    a37 = &a33;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a37);
  }
  _Unwind_Resume(a1);
}

uint64_t SLAM::Impl::PerformRecovery@<X0>(SLAM::Impl *this@<X0>, std::string *a2@<X8>)
{
  _QWORD v5[2];
  _QWORD *v6;
  __int128 *v7;
  __int128 *v8;
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  SLAM::Impl::QueryMigrationInfo(this, (uint64_t)&v7);
  if (v9)
  {
    v5[0] = this;
    v5[1] = this;
    if ((_DWORD)v8 == -1)
      std::__throw_bad_variant_access[abi:ne180100]();
    v6 = v5;
    ((void (*)(_QWORD **, __int128 **))off_24D1BA500[v8])(&v6, &v7);
  }
  else
  {
    a2->__r_.__value_.__r.__words[0] = 0;
    a2->__r_.__value_.__l.__size_ = 0;
    a2->__r_.__value_.__r.__words[2] = 0;
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(a2, v7, v8, 0xAAAAAAAAAAAAAAABLL * (((char *)v8 - (char *)v7) >> 3));
    a2[1].__r_.__value_.__s.__data_[0] = 1;
  }
  return caulk::__expected_detail::base<SLAM::MigrationInfo,SLAM::Error>::~base((uint64_t)&v7);
}

void sub_21459FBE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  caulk::__expected_detail::base<SLAM::MigrationInfo,SLAM::Error>::~base((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t SLAM::Impl::QueryMigrationInfo@<X0>(SLAM::Impl *this@<X0>, uint64_t a2@<X8>)
{
  void (***v3)(__int128 *__return_ptr);
  char *v4;
  _BYTE *v5;
  unint64_t *v6;
  _QWORD *v7;
  unint64_t *v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  unint64_t v14;
  BOOL v15;
  _QWORD *v16;
  const void *v17;
  __int128 v18;
  std::string::size_type v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  BOOL v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD *v32;
  unint64_t v33;
  BOOL v34;
  _QWORD *v35;
  unsigned int v36;
  __int128 **v37;
  __int128 **v38;
  __int128 **v39;
  __int128 **v40;
  __int128 **v41;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  _QWORD *v47;
  unint64_t v48;
  BOOL v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  _QWORD *v54;
  _QWORD *v55;
  unint64_t v56;
  BOOL v57;
  _QWORD *v58;
  unsigned int v59;
  unint64_t v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  _QWORD *v65;
  _QWORD *v66;
  unint64_t v67;
  BOOL v68;
  _QWORD *v69;
  std::string v70;
  std::string v71;
  char v72;
  std::string __p;
  char v74;
  std::vector<std::string> v75;
  char v76;
  std::string *v77;
  std::string v78;
  std::string v79;
  char v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v3 = (void (***)(__int128 *__return_ptr))((char *)this + 8);
  v4 = (char *)operator new(0xEuLL);
  __p.__r_.__value_.__l.__size_ = (std::string::size_type)(v4 + 14);
  __p.__r_.__value_.__r.__words[2] = (std::string::size_type)(v4 + 14);
  *(_QWORD *)v4 = 0xA0080004A400;
  *((_WORD *)v4 + 4) = 20737;
  *(_DWORD *)(v4 + 10) = 0;
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v4;
  SLAM::TransceiverWrapper::TransceiveAndCheckSW(v3, (uint64_t)&v75);
  if (__p.__r_.__value_.__r.__words[0])
  {
    __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v76)
  {
    caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v75);
    v5 = operator new(5uLL);
    __p.__r_.__value_.__l.__size_ = (std::string::size_type)(v5 + 5);
    __p.__r_.__value_.__r.__words[2] = (std::string::size_type)(v5 + 5);
    *(_DWORD *)v5 = 240256;
    v5[4] = 0;
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v5;
    SLAM::TransceiverWrapper::TransceiveAndCheckSW(v3, (uint64_t)&v75);
    if (__p.__r_.__value_.__r.__words[0])
    {
      __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (v76)
    {
      v6 = (unint64_t *)caulk::expected<std::vector<unsigned char>,SLAM::Error>::value((uint64_t)&v75);
      v79.__r_.__value_.__r.__words[0] = 0xC000000000000000;
      SLAM::DERParseSequenceToMap(v6, (uint64_t *)&v79, 1, (uint64_t)&__p);
      if (!v74)
      {
        v39 = (__int128 **)SLAM::Error::Add((std::vector<std::string> *)&__p, "While parsing migration state");
        memset(&v79, 0, sizeof(v79));
        std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v79, *v39, v39[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v39[1] - (char *)*v39) >> 3));
        SLAM::Error::Unexpected((__int128 **)&v79, &v71);
        *(std::string *)a2 = v71;
        memset(&v71, 0, sizeof(v71));
        *(_BYTE *)(a2 + 48) = 0;
        v78.__r_.__value_.__r.__words[0] = (std::string::size_type)&v71;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v78);
        v71.__r_.__value_.__r.__words[0] = (std::string::size_type)&v79;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v71);
LABEL_60:
        caulk::__expected_detail::base<std::map<unsigned long long,DERItem>,SLAM::Error>::~base((uint64_t)&__p);
        return caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v75);
      }
      v7 = operator new(8uLL);
      v71.__r_.__value_.__r.__words[0] = (std::string::size_type)v7;
      *v7 = 0x53DF02FE00CA80;
      v71.__r_.__value_.__l.__size_ = (std::string::size_type)(v7 + 1);
      v71.__r_.__value_.__r.__words[2] = (std::string::size_type)(v7 + 1);
      SLAM::TransceiverWrapper::TransceiveAndCheckSW(v3, (uint64_t)&v79);
      if (v71.__r_.__value_.__r.__words[0])
      {
        v71.__r_.__value_.__l.__size_ = v71.__r_.__value_.__r.__words[0];
        operator delete(v71.__r_.__value_.__l.__data_);
      }
      if (!v80)
      {
        v40 = (__int128 **)SLAM::Error::Add((std::vector<std::string> *)&v79, "While querying SLAM state");
        SLAM::Error::Unexpected(v40, &v71);
        *(std::string *)a2 = v71;
        memset(&v71, 0, sizeof(v71));
        *(_BYTE *)(a2 + 48) = 0;
        v78.__r_.__value_.__r.__words[0] = (std::string::size_type)&v71;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v78);
LABEL_59:
        caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v79);
        goto LABEL_60;
      }
      v8 = (unint64_t *)caulk::expected<std::vector<unsigned char>,SLAM::Error>::value((uint64_t)&v79);
      *(_OWORD *)&v78.__r_.__value_.__l.__data_ = xmmword_2145AA2B0;
      SLAM::DERParseSequenceToMap(v8, (uint64_t *)&v78, 2, (uint64_t)&v71);
      if (v72)
      {
        v9 = caulk::expected<std::map<unsigned long long,DERItem>,SLAM::Error>::value((uint64_t)&v71);
        v12 = *(_QWORD **)(v9 + 8);
        v10 = (_QWORD *)(v9 + 8);
        v11 = v12;
        if (v12)
        {
          v13 = v10;
          do
          {
            v14 = v11[4];
            v15 = v14 >= 0x8000000000000003;
            if (v14 >= 0x8000000000000003)
              v16 = v11;
            else
              v16 = v11 + 1;
            if (v15)
              v13 = v11;
            v11 = (_QWORD *)*v16;
          }
          while (*v16);
          if (v13 != v10 && v13[4] <= 0x8000000000000003 && v13[6] == 32)
          {
            v17 = (const void *)v13[5];
            memset(&v78, 0, sizeof(v78));
            std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v78, v17, (uint64_t)v17 + 32, 0x20uLL);
            v18 = *(_OWORD *)&v78.__r_.__value_.__l.__data_;
            v19 = v78.__r_.__value_.__r.__words[2];
            v20 = caulk::expected<std::map<unsigned long long,DERItem>,SLAM::Error>::value((uint64_t)&v71);
            v23 = *(_QWORD **)(v20 + 8);
            v21 = v20 + 8;
            v22 = v23;
            if (!v23)
              goto LABEL_62;
            v24 = (_QWORD *)v21;
            do
            {
              v25 = v22[4];
              v26 = v25 < 0;
              if (v25 < 0)
                v27 = v22;
              else
                v27 = v22 + 1;
              if (v26)
                v24 = v22;
              v22 = (_QWORD *)*v27;
            }
            while (*v27);
            if (v24 == (_QWORD *)v21 || v24[4] > 0x8000000000000000 || v24[6] != 1)
            {
LABEL_62:
              SLAM::Error::Unexpected((SLAM::Error *)"Missing or wrong length tag 0x%llx", (uint64_t)&v78, 0x8000000000000000);
              goto LABEL_63;
            }
            if (*(unsigned __int8 *)v24[5] < 2u)
            {
              v36 = 0;
            }
            else
            {
              v28 = caulk::expected<std::map<unsigned long long,DERItem>,SLAM::Error>::value((uint64_t)&v71);
              v31 = *(_QWORD **)(v28 + 8);
              v29 = v28 + 8;
              v30 = v31;
              if (!v31)
                goto LABEL_82;
              v32 = (_QWORD *)v29;
              do
              {
                v33 = v30[4];
                v34 = v33 >= 0x8000000000000004;
                if (v33 >= 0x8000000000000004)
                  v35 = v30;
                else
                  v35 = v30 + 1;
                if (v34)
                  v32 = v30;
                v30 = (_QWORD *)*v35;
              }
              while (*v35);
              if (v32 == (_QWORD *)v29 || v32[4] > 0x8000000000000004 || v32[6] != 2)
              {
LABEL_82:
                SLAM::Error::Unexpected((SLAM::Error *)"Missing or wrong length tag 0x%llx", (uint64_t)&v78, 0x8000000000000004);
                goto LABEL_63;
              }
              v36 = bswap32(*(unsigned __int16 *)v32[5]) >> 16;
            }
            v43 = caulk::expected<std::map<unsigned long long,DERItem>,SLAM::Error>::value((uint64_t)&__p);
            v46 = *(_QWORD **)(v43 + 8);
            v44 = v43 + 8;
            v45 = v46;
            if (!v46)
              goto LABEL_81;
            v47 = (_QWORD *)v44;
            do
            {
              v48 = v45[4];
              v49 = v48 >= 0xC000000000000009;
              if (v48 >= 0xC000000000000009)
                v50 = v45;
              else
                v50 = v45 + 1;
              if (v49)
                v47 = v45;
              v45 = (_QWORD *)*v50;
            }
            while (*v50);
            if (v47 != (_QWORD *)v44 && v47[4] <= 0xC000000000000009 && v47[6] == 2)
            {
              if (*(_WORD *)v47[5] == 23130)
              {
                *(_QWORD *)a2 = 0;
                *(_QWORD *)(a2 + 8) = 1;
LABEL_80:
                *(_OWORD *)(a2 + 16) = v18;
                *(_QWORD *)(a2 + 32) = v19;
                *(_DWORD *)(a2 + 40) = v36;
                *(_BYTE *)(a2 + 48) = 1;
                goto LABEL_58;
              }
              v51 = caulk::expected<std::map<unsigned long long,DERItem>,SLAM::Error>::value((uint64_t)&__p);
              v54 = *(_QWORD **)(v51 + 8);
              v52 = v51 + 8;
              v53 = v54;
              if (!v54)
                goto LABEL_99;
              v55 = (_QWORD *)v52;
              do
              {
                v56 = v53[4];
                v57 = v56 >= 0xC00000000000000BLL;
                if (v56 >= 0xC00000000000000BLL)
                  v58 = v53;
                else
                  v58 = v53 + 1;
                if (v57)
                  v55 = v53;
                v53 = (_QWORD *)*v58;
              }
              while (*v58);
              if (v55 != (_QWORD *)v52 && v55[4] <= 0xC00000000000000BLL && v55[6] == 2)
              {
                v59 = bswap32(*(unsigned __int16 *)v55[5]) >> 16;
                if (v59 != 13260)
                {
                  if (v59 == 52275)
                  {
                    v60 = 0;
                    v61 = 3;
                  }
                  else if (v59 == 42405)
                  {
                    v60 = 0;
                    v61 = 2;
                  }
                  else
                  {
                    v61 = 0;
                    v60 = 0;
                  }
                  goto LABEL_115;
                }
                v62 = caulk::expected<std::map<unsigned long long,DERItem>,SLAM::Error>::value((uint64_t)&v71);
                v65 = *(_QWORD **)(v62 + 8);
                v63 = v62 + 8;
                v64 = v65;
                if (v65)
                {
                  v66 = (_QWORD *)v63;
                  do
                  {
                    v67 = v64[4];
                    v68 = v67 >= 0x8000000000000002;
                    if (v67 >= 0x8000000000000002)
                      v69 = v64;
                    else
                      v69 = v64 + 1;
                    if (v68)
                      v66 = v64;
                    v64 = (_QWORD *)*v69;
                  }
                  while (*v69);
                  if (v66 != (_QWORD *)v63 && v66[4] <= 0x8000000000000002 && v66[6] == 8)
                  {
                    v60 = bswap64(*(_QWORD *)v66[5]);
                    v61 = 4;
LABEL_115:
                    *(_QWORD *)a2 = v60;
                    *(_DWORD *)(a2 + 8) = v61;
                    *(_DWORD *)(a2 + 12) = 0;
                    goto LABEL_80;
                  }
                }
                SLAM::Error::Unexpected((SLAM::Error *)"Missing or wrong length tag 0x%llx", (uint64_t)&v78, 0x8000000000000002);
              }
              else
              {
LABEL_99:
                SLAM::Error::Unexpected((SLAM::Error *)"Missing or wrong length tag 0x%llx", (uint64_t)&v78, 0xC00000000000000BLL);
              }
            }
            else
            {
LABEL_81:
              SLAM::Error::Unexpected((SLAM::Error *)"Missing or wrong length tag 0x%llx", (uint64_t)&v78, 0xC000000000000009);
            }
LABEL_63:
            *(std::string *)a2 = v78;
            memset(&v78, 0, sizeof(v78));
            *(_BYTE *)(a2 + 48) = 0;
            v70.__r_.__value_.__r.__words[0] = (std::string::size_type)&v78;
            std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v70);
            if ((_QWORD)v18)
              operator delete((void *)v18);
            goto LABEL_58;
          }
        }
        SLAM::Error::Unexpected((SLAM::Error *)"Missing or wrong length tag 0x%llx", (uint64_t)&v78, 0x8000000000000003);
        *(std::string *)a2 = v78;
        memset(&v78, 0, sizeof(v78));
        *(_BYTE *)(a2 + 48) = 0;
      }
      else
      {
        v41 = (__int128 **)SLAM::Error::Add((std::vector<std::string> *)&v71, "While parsing the respons from SLAM state");
        memset(&v78, 0, sizeof(v78));
        std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v78, *v41, v41[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v41[1] - (char *)*v41) >> 3));
        SLAM::Error::Unexpected((__int128 **)&v78, &v70);
        *(std::string *)a2 = v70;
        memset(&v70, 0, sizeof(v70));
        *(_BYTE *)(a2 + 48) = 0;
        v77 = &v70;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v77);
      }
      v70.__r_.__value_.__r.__words[0] = (std::string::size_type)&v78;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v70);
LABEL_58:
      caulk::__expected_detail::base<std::map<unsigned long long,DERItem>,SLAM::Error>::~base((uint64_t)&v71);
      goto LABEL_59;
    }
    v38 = (__int128 **)SLAM::Error::Add(&v75, "While querying migration state");
    SLAM::Error::Unexpected(v38, &__p);
  }
  else
  {
    v37 = (__int128 **)SLAM::Error::Add(&v75, "While selecting ISD");
    SLAM::Error::Unexpected(v37, &__p);
  }
  *(std::string *)a2 = __p;
  memset(&__p, 0, sizeof(__p));
  *(_BYTE *)(a2 + 48) = 0;
  v79.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v79);
  return caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v75);
}

void sub_2145A03C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  void *v24;
  uint64_t v25;

  if (v24)
    operator delete(v24);
  caulk::__expected_detail::base<std::map<unsigned long long,DERItem>,SLAM::Error>::~base((uint64_t)&__p);
  caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base(v25 - 88);
  caulk::__expected_detail::base<std::map<unsigned long long,DERItem>,SLAM::Error>::~base((uint64_t)&a19);
  caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&a24);
  _Unwind_Resume(a1);
}

uint64_t caulk::expected<SLAM::Script,SLAM::Error>::value(uint64_t result)
{
  __int128 **v1;
  void *exception;
  std::string v3;

  v1 = (__int128 **)result;
  if (!*(_BYTE *)(result + 72))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    memset(&v3, 0, sizeof(v3));
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v3, *v1, v1[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v1[1] - (char *)*v1) >> 3));
    caulk::bad_expected_access<SLAM::Error>::bad_expected_access((uint64_t)exception, (__int128 **)&v3);
  }
  return result;
}

void sub_2145A0560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  a12 = (void **)&a9;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a12);
  _Unwind_Resume(a1);
}

uint64_t caulk::expected<SLAM::MigrationInfo,SLAM::Error>::value(uint64_t result)
{
  __int128 **v1;
  void *exception;
  std::string v3;

  v1 = (__int128 **)result;
  if (!*(_BYTE *)(result + 48))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    memset(&v3, 0, sizeof(v3));
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v3, *v1, v1[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v1[1] - (char *)*v1) >> 3));
    caulk::bad_expected_access<SLAM::Error>::bad_expected_access((uint64_t)exception, (__int128 **)&v3);
  }
  return result;
}

void sub_2145A0638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  a12 = (void **)&a9;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a12);
  _Unwind_Resume(a1);
}

uint64_t SLAM::Impl::GetChipId@<X0>(SLAM::Impl *this@<X0>, uint64_t a2@<X8>)
{
  void (***v4)(__int128 *__return_ptr);
  char *v5;
  char *v6;
  _QWORD *v7;
  uint64_t v8;
  __int128 **v9;
  void *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  char v16;
  __int128 v18;
  uint64_t v19;
  _QWORD v20[2];
  void *p_p;
  _BYTE *v22;
  unint64_t v23;
  std::string __p;
  char v25;
  std::vector<std::string> v26;
  char v27;
  void **v28;

  v4 = (void (***)(__int128 *__return_ptr))((char *)this + 8);
  v5 = (char *)operator new(0xEuLL);
  __p.__r_.__value_.__l.__size_ = (std::string::size_type)(v5 + 14);
  __p.__r_.__value_.__r.__words[2] = (std::string::size_type)(v5 + 14);
  *(_QWORD *)v5 = 0xA0080004A400;
  *((_WORD *)v5 + 4) = 20737;
  *(_DWORD *)(v5 + 10) = 0;
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v5;
  SLAM::TransceiverWrapper::TransceiveAndCheckSW(v4, (uint64_t)&v26);
  if (__p.__r_.__value_.__r.__words[0])
  {
    __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v27)
  {
    v6 = (char *)operator new(5uLL);
    v22 = v6 + 5;
    v23 = (unint64_t)(v6 + 5);
    *(_DWORD *)v6 = 2141178496;
    v6[4] = 0;
    p_p = v6;
    SLAM::TransceiverWrapper::TransceiveAndCheckSW(v4, (uint64_t)&__p);
    if (p_p)
    {
      v22 = p_p;
      operator delete(p_p);
    }
    if (v25)
    {
      p_p = 0;
      v22 = 0;
      v23 = 0;
      v20[0] = *(_QWORD *)caulk::expected<std::vector<unsigned char>,SLAM::Error>::value((uint64_t)&__p);
      v7 = (_QWORD *)caulk::expected<std::vector<unsigned char>,SLAM::Error>::value((uint64_t)&__p);
      v20[1] = v7[1] - *v7;
      v8 = DERDecodeItem((uint64_t)v20, (unint64_t *)&p_p);
      if ((_DWORD)v8)
      {
        SLAM::Error::Unexpected((SLAM::Error *)"Failed to decode CPLC data top level tag %d", (uint64_t)&v18, v8);
LABEL_24:
        *(_OWORD *)a2 = v18;
        *(_QWORD *)(a2 + 16) = v19;
        v19 = 0;
        v18 = 0uLL;
        *(_BYTE *)(a2 + 24) = 0;
        v28 = (void **)&v18;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v28);
        goto LABEL_25;
      }
      if (p_p != (void *)0x800000000000007FLL)
      {
        SLAM::Error::Unexpected((SLAM::Error *)"Unexpected CPLC data top level tag %llu", (uint64_t)&v18, p_p);
        goto LABEL_24;
      }
      if (v23 <= 3)
      {
        SLAM::Error::Unexpected((SLAM::Error *)"Unexpected length for CPLC data %zu", (uint64_t)&v18, v23);
        goto LABEL_24;
      }
      v16 = v22[3];
    }
    else
    {
      v10 = (void *)*((_QWORD *)this + 8);
      v11 = (std::__shared_weak_count *)*((_QWORD *)this + 9);
      p_p = v10;
      v22 = v11;
      if (v11)
      {
        p_shared_owners = (unint64_t *)&v11->__shared_owners_;
        do
          v13 = __ldxr(p_shared_owners);
        while (__stxr(v13 + 1, p_shared_owners));
      }
      SLAM::Logger::Log((uint64_t)v10, 1, (uint64_t)"GetChipId", 477, "Failed to read CPLC data; defaulting to SN210V");
      if (v11)
      {
        v14 = (unint64_t *)&v11->__shared_owners_;
        do
          v15 = __ldaxr(v14);
        while (__stlxr(v15 - 1, v14));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
      }
      v16 = -46;
    }
    *(_BYTE *)a2 = v16;
    *(_BYTE *)(a2 + 24) = 1;
LABEL_25:
    caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&__p);
    return caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v26);
  }
  v9 = (__int128 **)SLAM::Error::Add(&v26, "Failed to select ISD");
  SLAM::Error::Unexpected(v9, &__p);
  *(std::string *)a2 = __p;
  memset(&__p, 0, sizeof(__p));
  *(_BYTE *)(a2 + 24) = 0;
  p_p = &__p;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_p);
  return caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v26);
}

void sub_2145A0904(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, uint64_t a18, char a19)
{
  uint64_t v19;

  caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&a19);
  caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base(v19 - 72);
  _Unwind_Resume(a1);
}

void sub_2145A0964(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20)
{
  if (__p)
    operator delete(__p);
  JUMPOUT(0x2145A095CLL);
}

uint64_t caulk::expected<unsigned char,SLAM::Error>::value(uint64_t result)
{
  __int128 **v1;
  void *exception;
  std::string v3;

  v1 = (__int128 **)result;
  if (!*(_BYTE *)(result + 24))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    memset(&v3, 0, sizeof(v3));
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v3, *v1, v1[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v1[1] - (char *)*v1) >> 3));
    caulk::bad_expected_access<SLAM::Error>::bad_expected_access((uint64_t)exception, (__int128 **)&v3);
  }
  return result;
}

void sub_2145A0A14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  a12 = (void **)&a9;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a12);
  _Unwind_Resume(a1);
}

void SLAM::Logger::Log(uint64_t a1, int a2, uint64_t a3, uint64_t a4, char *a5, ...)
{
  void **v9;
  void (***v10)(_QWORD, std::string *);
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  std::string __s;
  void *__p[2];
  char v18;
  va_list v19;
  va_list va;

  va_start(va, a5);
  va_copy(v19, va);
  __s.__r_.__value_.__r.__words[0] = 0;
  vasprintf(&__s.__r_.__value_.__l.__data_, a5, va);
  if (__s.__r_.__value_.__r.__words[0])
  {
    std::string::basic_string[abi:ne180100]<0>(__p, __s.__r_.__value_.__l.__data_);
    free(__s.__r_.__value_.__l.__data_);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "<FAILED TO VASPRINTF>");
  }
  v9 = __p;
  if (v18 < 0)
    v9 = (void **)__p[0];
  SLAM::StringUtil::Format((SLAM::StringUtil *)"%s/%d : %s", &__s, a3, a4, v9);
  boost::circular_buffer<std::string,std::allocator<std::string>>::push_back_impl<std::string const&>(a1 + 16, &__s);
  if (a2 == 1)
  {
    v10 = *(void (****)(_QWORD, std::string *))a1;
    v11 = *(std::__shared_weak_count **)(a1 + 8);
    if (v11)
    {
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        v13 = __ldxr(p_shared_owners);
      while (__stxr(v13 + 1, p_shared_owners));
    }
    (**v10)(v10, &__s);
    if (v11)
    {
      v14 = (unint64_t *)&v11->__shared_owners_;
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__s.__r_.__value_.__l.__data_);
  if (v18 < 0)
    operator delete(__p[0]);
}

void sub_2145A0B98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100]((uint64_t)&a12);
  if (a19 < 0)
    operator delete(__p);
  if (a25 < 0)
    operator delete(a20);
  _Unwind_Resume(a1);
}

void SLAM::Impl::PerformScript(std::string::size_type a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, std::string *a4@<X8>)
{
  std::string::size_type v5;
  uint64_t v6;
  const void *v10;
  size_t v11;
  const void *v12;
  int v13;
  void **v14;
  void **v15;
  const char *p_p;
  __int128 **v17;
  std::string v18;
  char v19;
  void *__p;
  char v21;
  void *v22[2];
  char v23;
  __int128 v24;
  std::string::size_type v25;
  char v26;
  std::string *v27;

  v5 = *a2;
  v18.__r_.__value_.__r.__words[0] = a1;
  v18.__r_.__value_.__l.__size_ = a1;
  v18.__r_.__value_.__r.__words[2] = v5;
  v6 = *(unsigned int *)(a3 + 8);
  if ((_DWORD)v6 == -1)
    std::__throw_bad_variant_access[abi:ne180100]();
  v22[0] = &v18;
  ((void (*)(__int128 *__return_ptr, void **, uint64_t))off_24D1BA4D8[v6])(&v24, v22, a3);
  if (v26)
  {
    *(_OWORD *)&a4->__r_.__value_.__l.__data_ = v24;
    a4->__r_.__value_.__r.__words[2] = v25;
    v25 = 0;
    v24 = 0uLL;
    a4[1].__r_.__value_.__s.__data_[0] = 1;
  }
  else
  {
    v10 = *(const void **)(a3 + 16);
    v11 = *(_QWORD *)(a3 + 24) - (_QWORD)v10;
    v12 = (const void *)a2[1];
    if (v11 == a2[2] - (_QWORD)v12 && !memcmp(v10, v12, v11))
    {
      SLAM::Impl::ExecuteScript(a1, a2 + 5, &v18);
      if (v19)
      {
        v17 = (__int128 **)SLAM::Error::Add((std::vector<std::string> *)&v18, "While executing script 0x%llx", v5);
        a4->__r_.__value_.__r.__words[0] = 0;
        a4->__r_.__value_.__l.__size_ = 0;
        a4->__r_.__value_.__r.__words[2] = 0;
        std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(a4, *v17, v17[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v17[1] - (char *)*v17) >> 3));
        a4[1].__r_.__value_.__s.__data_[0] = 1;
        if (v19)
        {
          v22[0] = &v18;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v22);
        }
      }
      else
      {
        a4->__r_.__value_.__s.__data_[0] = 0;
        a4[1].__r_.__value_.__s.__data_[0] = 0;
      }
    }
    else
    {
      ctu::hex();
      v13 = v23;
      v14 = (void **)v22[0];
      ctu::hex();
      v15 = v22;
      if (v13 < 0)
        v15 = v14;
      if (v21 >= 0)
        p_p = (const char *)&__p;
      else
        p_p = (const char *)__p;
      SLAM::Error::Error((std::vector<std::string> *)&v18, "Mismatched signing keys device %s script %s", (const char *)v15, p_p);
      *a4 = v18;
      memset(&v18, 0, sizeof(v18));
      a4[1].__r_.__value_.__s.__data_[0] = 1;
      v27 = &v18;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v27);
      if (v21 < 0)
        operator delete(__p);
      if (v23 < 0)
        operator delete(v22[0]);
    }
  }
  if (v26)
  {
    v18.__r_.__value_.__r.__words[0] = (std::string::size_type)&v24;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v18);
  }
}

void sub_2145A0DEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char *a11, uint64_t a12, uint64_t a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,char a27,uint64_t a28,uint64_t a29,char a30)
{
  if (a30)
  {
    a11 = &a27;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a11);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SLAM::Impl::ExecuteScript@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, std::string *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  int v11;
  _QWORD *v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  std::__shared_weak_count *v16;
  void **v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  std::vector<std::string>::pointer p_p;
  unint64_t *v21;
  unint64_t v22;
  __int128 **v23;
  std::vector<std::string> __p;
  void **v25[2];
  std::vector<std::string> v26;
  char v27;

  v4 = *a2;
  v5 = a2[1];
  if (v5 != *a2)
  {
    v7 = result;
    LODWORD(v8) = 0;
    v9 = (v5 - *a2) >> 3;
    v10 = (_QWORD *)(result + 8);
    do
    {
      v11 = 0;
      while (1)
      {
        SLAM::TransceiverWrapper::Transceive(v10, v4, (uint64_t)&v26);
        if (!v27)
        {
          v23 = (__int128 **)SLAM::Error::Add(&v26, "While executing APDU %d", v11);
          a3->__r_.__value_.__r.__words[0] = 0;
          a3->__r_.__value_.__l.__size_ = 0;
          a3->__r_.__value_.__r.__words[2] = 0;
          std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(a3, *v23, v23[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v23[1] - (char *)*v23) >> 3));
          a3[1].__r_.__value_.__s.__data_[0] = 1;
          return caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v26);
        }
        v12 = (_QWORD *)caulk::expected<std::vector<unsigned char>,SLAM::Error>::value((uint64_t)&v26);
        v13 = v12[1];
        if ((unint64_t)(v13 - *v12) < 2)
        {
          v15 = 49068;
LABEL_27:
          SLAM::Error::Error(&__p, "Failed SW 0x%hX at idx %d", v15, v11);
          *(std::vector<std::string> *)a3 = __p;
          memset(&__p, 0, sizeof(__p));
          a3[1].__r_.__value_.__s.__data_[0] = 1;
          v25[0] = (void **)&__p;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v25);
          return caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v26);
        }
        v14 = *(unsigned __int16 *)(v13 - 2);
        v15 = __rev16(v14);
        if ((v15 & 0xFFF0) == 0x63C0)
        {
          v8 = (v8 + 1);
          if (v9 > v8)
            break;
        }
        if (v14 != 144)
          goto LABEL_27;
        result = caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v26);
        v4 += 24;
        ++v11;
        if (v4 == v5)
          goto LABEL_24;
      }
      v17 = *(void ***)(v7 + 64);
      v16 = *(std::__shared_weak_count **)(v7 + 72);
      v25[0] = v17;
      v25[1] = (void **)&v16->__vftable;
      if (v16)
      {
        p_shared_owners = (unint64_t *)&v16->__shared_owners_;
        do
          v19 = __ldxr(p_shared_owners);
        while (__stxr(v19 + 1, p_shared_owners));
      }
      caulk::expected<std::vector<unsigned char>,SLAM::Error>::value((uint64_t)&v26);
      ctu::hex();
      p_p = (std::vector<std::string>::pointer)&__p;
      if (SHIBYTE(__p.__end_cap_.__value_) < 0)
        p_p = __p.__begin_;
      SLAM::Logger::Log((uint64_t)v17, 1, (uint64_t)"ExecuteScript", 292, "Warning APDU: %s idx %d replaying %d", (const char *)p_p, v11, v8);
      if (SHIBYTE(__p.__end_cap_.__value_) < 0)
        operator delete(__p.__begin_);
      if (v16)
      {
        v21 = (unint64_t *)&v16->__shared_owners_;
        do
          v22 = __ldaxr(v21);
        while (__stlxr(v22 - 1, v21));
        if (!v22)
        {
          ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
          std::__shared_weak_count::__release_weak(v16);
        }
      }
      result = caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v26);
      v4 = *a2;
      v5 = a2[1];
    }
    while (*a2 != v5);
  }
LABEL_24:
  a3->__r_.__value_.__s.__data_[0] = 0;
  a3[1].__r_.__value_.__s.__data_[0] = 0;
  return result;
}

void sub_2145A10AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, char a20,uint64_t a21,char a22)
{
  if (a18 < 0)
    operator delete(__p);
  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100]((uint64_t)&a20);
  caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&a22);
  _Unwind_Resume(a1);
}

void SLAM::TransceiverWrapper::Transceive(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  std::__shared_weak_count *v6;
  uint64_t v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  void **v10;
  unint64_t *v11;
  unint64_t v12;
  void (***v13)(void *, uint64_t);
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  uint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  void **v23;
  unint64_t *v24;
  unint64_t v25;
  void *__p[2];
  char v27;
  uint64_t v28;
  std::__shared_weak_count *v29;

  v7 = a1[3];
  v6 = (std::__shared_weak_count *)a1[4];
  v28 = v7;
  v29 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  ctu::hex();
  if (v27 >= 0)
    v10 = __p;
  else
    v10 = (void **)__p[0];
  SLAM::Logger::Log(v7, 0, (uint64_t)"Transceive", 49, "> %s", (const char *)v10);
  if (v27 < 0)
    operator delete(__p[0]);
  if (v6)
  {
    v11 = (unint64_t *)&v6->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  v13 = (void (***)(void *, uint64_t))a1[1];
  v14 = (std::__shared_weak_count *)a1[2];
  __p[0] = v13;
  __p[1] = v14;
  if (v14)
  {
    v15 = (unint64_t *)&v14->__shared_owners_;
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
  }
  (**v13)(v13, a2);
  if (v14)
  {
    v17 = (unint64_t *)&v14->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  if (*(_BYTE *)(a3 + 24))
  {
    v20 = a1[3];
    v19 = (std::__shared_weak_count *)a1[4];
    v28 = v20;
    v29 = v19;
    if (v19)
    {
      v21 = (unint64_t *)&v19->__shared_owners_;
      do
        v22 = __ldxr(v21);
      while (__stxr(v22 + 1, v21));
    }
    caulk::expected<std::vector<unsigned char>,SLAM::Error>::value(a3);
    ctu::hex();
    if (v27 >= 0)
      v23 = __p;
    else
      v23 = (void **)__p[0];
    SLAM::Logger::Log(v20, 0, (uint64_t)"Transceive", 54, "< %s", (const char *)v23);
    if (v27 < 0)
      operator delete(__p[0]);
    if (v19)
    {
      v24 = (unint64_t *)&v19->__shared_owners_;
      do
        v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
  }
}

void sub_2145A12F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  uint64_t v16;

  if (a15 < 0)
    operator delete(__p);
  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100]((uint64_t)&a16);
  caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base(v16);
  _Unwind_Resume(a1);
}

uint64_t caulk::expected<std::vector<unsigned char>,SLAM::Error>::value(uint64_t result)
{
  __int128 **v1;
  void *exception;
  std::string v3;

  v1 = (__int128 **)result;
  if (!*(_BYTE *)(result + 24))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    memset(&v3, 0, sizeof(v3));
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v3, *v1, v1[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v1[1] - (char *)*v1) >> 3));
    caulk::bad_expected_access<SLAM::Error>::bad_expected_access((uint64_t)exception, (__int128 **)&v3);
  }
  return result;
}

void sub_2145A13F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  a12 = (void **)&a9;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a12);
  _Unwind_Resume(a1);
}

uint64_t SLAM::Impl::PerformTermination@<X0>(SLAM::Impl *this@<X0>, std::string *a2@<X8>)
{
  void (***v3)(__int128 *__return_ptr);
  char v4;
  __int128 **v5;
  _DWORD *__p;
  std::vector<std::string> v8;
  char v9;

  v3 = (void (***)(__int128 *__return_ptr))((char *)this + 8);
  __p = operator new(4uLL);
  *__p = 371328;
  SLAM::TransceiverWrapper::TransceiveAndCheckSW(v3, (uint64_t)&v8);
  if (__p)
    operator delete(__p);
  if (v9)
  {
    v4 = 0;
    a2->__r_.__value_.__s.__data_[0] = 0;
  }
  else
  {
    v5 = (__int128 **)SLAM::Error::Add(&v8, "While terminating");
    a2->__r_.__value_.__r.__words[0] = 0;
    a2->__r_.__value_.__l.__size_ = 0;
    a2->__r_.__value_.__r.__words[2] = 0;
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(a2, *v5, v5[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v5[1] - (char *)*v5) >> 3));
    v4 = 1;
  }
  a2[1].__r_.__value_.__s.__data_[0] = v4;
  return caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v8);
}

void sub_2145A14F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, char a13)
{
  caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t SLAM::TransceiverWrapper::TransceiveAndCheckSW@<X0>(void (***a1)(__int128 *__return_ptr)@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  char v14;
  void **v15;

  (**a1)(&v12);
  if (!v14)
  {
    *(_BYTE *)(a2 + 24) = 0;
    *(_OWORD *)a2 = v12;
    *(_QWORD *)(a2 + 16) = v13;
    v12 = 0uLL;
    v13 = 0;
    return caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v12);
  }
  v3 = (_QWORD *)caulk::expected<std::vector<unsigned char>,SLAM::Error>::value((uint64_t)&v12);
  v4 = v3[1];
  if ((unint64_t)(v4 - *v3) < 2)
  {
    v7 = 49068;
LABEL_9:
    SLAM::Error::Unexpected((SLAM::Error *)"Unexpected SW 0x%hX", (uint64_t)&v10, v7);
    *(_OWORD *)a2 = v10;
    *(_QWORD *)(a2 + 16) = v11;
    v11 = 0;
    v10 = 0uLL;
    *(_BYTE *)(a2 + 24) = 0;
    v15 = (void **)&v10;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v15);
    return caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v12);
  }
  v5 = *(unsigned __int16 *)(v4 - 2);
  if (v5 != 144)
  {
    v7 = __rev16(v5);
    goto LABEL_9;
  }
  v6 = v12;
  if (*((_QWORD *)&v12 + 1) - (_QWORD)v12 > 1uLL)
  {
    *((_QWORD *)&v12 + 1) -= 2;
  }
  else
  {
    std::vector<unsigned char>::__append((unint64_t *)&v12, 0xFFFFFFFFFFFFFFFELL);
    v6 = v12;
  }
  *(_BYTE *)(a2 + 24) = v14;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = v6;
  v8 = v13;
  *(_QWORD *)(a2 + 8) = *((_QWORD *)&v12 + 1);
  *(_QWORD *)(a2 + 16) = v8;
  v13 = 0;
  v12 = 0uLL;
  return caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)&v12);
}

void sub_2145A1650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base((uint64_t)va);
  _Unwind_Resume(a1);
}

void SLAM::Error::Unexpected(__int128 **this@<X0>, std::string *a2@<X8>)
{
  std::string v4;
  std::string *v5;

  memset(&v4, 0, sizeof(v4));
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v4, *this, this[1], 0xAAAAAAAAAAAAAAABLL * (((char *)this[1] - (char *)*this) >> 3));
  *a2 = v4;
  memset(&v4, 0, sizeof(v4));
  v5 = &v4;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v5);
}

void SLAM::DERParseSequenceToMap(unint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  unint64_t v12;
  __int128 v13;
  _QWORD *(*v14)(_QWORD *, _QWORD *);
  void (*v15)(uint64_t);
  _QWORD **v16;
  _QWORD *v17[2];
  __int128 v18;
  uint64_t v19;
  unint64_t v20[3];
  void **v21;

  v5 = a1[1] - *a1;
  v20[0] = *a1;
  v20[1] = v5;
  if (a3)
  {
    v7 = 8 * a3;
    while (1)
    {
      v12 = 0;
      v13 = 0uLL;
      v8 = DERDecodeItem((uint64_t)v20, &v12);
      v9 = *a2;
      if ((_DWORD)v8 || v12 != v9)
        break;
      *(_OWORD *)v20 = v13;
      ++a2;
      v7 -= 8;
      if (!v7)
        goto LABEL_6;
    }
    SLAM::Error::Unexpected((SLAM::Error *)"Failed to decode ret %d tag 0x%llx exoected 0x%llx", (uint64_t)&v18, v8, v12, v9);
    *(_OWORD *)a4 = v18;
    *(_QWORD *)(a4 + 16) = v19;
    v19 = 0;
    v18 = 0uLL;
    *(_BYTE *)(a4 + 24) = 0;
    v21 = (void **)&v18;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v21);
  }
  else
  {
LABEL_6:
    v12 = 0;
    *(_QWORD *)&v13 = &v12;
    *((_QWORD *)&v13 + 1) = 0x4002000000;
    v14 = __Block_byref_object_copy_;
    v15 = __Block_byref_object_dispose_;
    v17[1] = 0;
    v16 = v17;
    v17[0] = 0;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 0x40000000;
    v11[2] = ___ZN4SLAML21DERParseSequenceToMapERNSt3__16vectorIhNS0_9allocatorIhEEEESt16initializer_listIyE_block_invoke;
    v11[3] = &unk_24D1BA530;
    v11[4] = &v12;
    v10 = DERDecodeSequenceContentWithBlock(v20, (uint64_t)v11);
    if ((_DWORD)v10)
    {
      SLAM::Error::Unexpected((SLAM::Error *)"DecodeSequenceContent returned %d", (uint64_t)&v18, v10);
      *(_OWORD *)a4 = v18;
      *(_QWORD *)(a4 + 16) = v19;
      v19 = 0;
      v18 = 0uLL;
      *(_BYTE *)(a4 + 24) = 0;
      v21 = (void **)&v18;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v21);
    }
    else
    {
      std::map<unsigned long long,DERItem>::map[abi:ne180100](a4, v13 + 40);
      *(_BYTE *)(a4 + 24) = 1;
    }
    _Block_object_dispose(&v12, 8);
    std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::destroy((uint64_t)&v16, v17[0]);
  }
}

void sub_2145A189C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,_QWORD *a23)
{
  uint64_t v23;

  _Block_object_dispose(&a17, 8);
  std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::destroy(v23, a23);
  _Unwind_Resume(a1);
}

uint64_t caulk::expected<std::map<unsigned long long,DERItem>,SLAM::Error>::value(uint64_t result)
{
  __int128 **v1;
  void *exception;
  std::string v3;

  v1 = (__int128 **)result;
  if (!*(_BYTE *)(result + 24))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    memset(&v3, 0, sizeof(v3));
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v3, *v1, v1[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v1[1] - (char *)*v1) >> 3));
    caulk::bad_expected_access<SLAM::Error>::bad_expected_access((uint64_t)exception, (__int128 **)&v3);
  }
  return result;
}

void sub_2145A195C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  a12 = (void **)&a9;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a12);
  _Unwind_Resume(a1);
}

void SLAM::Error::Unexpected(SLAM::Error *this@<X0>, uint64_t a2@<X8>, ...)
{
  char *__s[2];
  uint64_t v5;
  void *__p[2];
  char v7;
  va_list v8;
  char **v9;
  va_list va;

  va_start(va, a2);
  va_copy(v8, va);
  __s[0] = 0;
  vasprintf(__s, (const char *)this, va);
  if (__s[0])
  {
    std::string::basic_string[abi:ne180100]<0>(__p, __s[0]);
    free(__s[0]);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "<FAILED TO VASPRINTF>");
  }
  SLAM::Error::Error((std::string **)__s, (uint64_t)__p);
  *(_OWORD *)a2 = *(_OWORD *)__s;
  *(_QWORD *)(a2 + 16) = v5;
  __s[1] = 0;
  v5 = 0;
  __s[0] = 0;
  v9 = __s;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v9);
  if (v7 < 0)
    operator delete(__p[0]);
}

void sub_2145A1A4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void SLAM::Impl::~Impl(SLAM::Impl *this)
{
  SLAM::Impl::~Impl(this);
  JUMPOUT(0x2199D23E0);
}

{
  *(_QWORD *)this = &off_24D1BA3C8;
  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100]((uint64_t)this + 64);
  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100]((uint64_t)this + 48);
  *((_QWORD *)this + 1) = &off_24D1BA400;
  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100]((uint64_t)this + 32);
  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100]((uint64_t)this + 16);
}

uint64_t std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100](uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return a1;
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::string *v4;
  std::string *begin;
  std::string *end;
  std::string *value;

  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

void std::vector<std::string>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24D1BA208, MEMORY[0x24BEDAAF0]);
}

void sub_2145A1BA8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  __int128 v10;
  _QWORD v12[3];
  char v13;
  __int128 v14;
  __int128 v15;

  v7 = a7;
  *(_QWORD *)&v15 = a6;
  *((_QWORD *)&v15 + 1) = a7;
  v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    v9 = a7;
    do
    {
      v10 = *(_OWORD *)(a3 - 24);
      *(_QWORD *)(v9 - 8) = *(_QWORD *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(_QWORD *)(a3 - 16) = 0;
      *(_QWORD *)(a3 - 8) = 0;
      *(_QWORD *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((_QWORD *)&v15 + 1) = v9;
  }
  v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
    v1 += 24;
  }
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100]((uint64_t)this, (void **)&this->__begin_->__r_.__value_.__l.__data_);
  if (this->__first_)
    operator delete(this->__first_);
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  void **v2;
  void **v5;

  v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      v5 = v2 - 3;
      *(_QWORD *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        v5 = *(void ***)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != a2);
  }
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0)
      operator delete(*(void **)(i - 24));
  }
  a1[1] = v2;
}

_QWORD *SLAM::Impl::Impl(_QWORD *a1, uint64_t *a2, uint64_t *a3, _QWORD *a4)
{
  uint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t *v26;
  unint64_t v27;

  *a1 = &off_24D1BA3C8;
  v7 = *a2;
  v8 = (std::__shared_weak_count *)a2[1];
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  v11 = *a3;
  v12 = (std::__shared_weak_count *)a3[1];
  if (v12)
  {
    v13 = (unint64_t *)&v12->__shared_owners_;
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
  a1[1] = &off_24D1BA400;
  a1[2] = v7;
  a1[3] = v8;
  if (v8)
  {
    v15 = (unint64_t *)&v8->__shared_owners_;
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
  }
  a1[4] = v11;
  a1[5] = v12;
  if (!v12)
    goto LABEL_15;
  v17 = (unint64_t *)&v12->__shared_owners_;
  do
    v18 = __ldxr(v17);
  while (__stxr(v18 + 1, v17));
  do
    v19 = __ldaxr(v17);
  while (__stlxr(v19 - 1, v17));
  if (!v19)
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
    if (!v8)
      goto LABEL_21;
  }
  else
  {
LABEL_15:
    if (!v8)
      goto LABEL_21;
  }
  v20 = (unint64_t *)&v8->__shared_owners_;
  do
    v21 = __ldaxr(v20);
  while (__stlxr(v21 - 1, v20));
  if (!v21)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
  }
LABEL_21:
  v22 = a4[1];
  a1[6] = *a4;
  a1[7] = v22;
  if (v22)
  {
    v23 = (unint64_t *)(v22 + 8);
    do
      v24 = __ldxr(v23);
    while (__stxr(v24 + 1, v23));
  }
  v25 = a3[1];
  a1[8] = *a3;
  a1[9] = v25;
  if (v25)
  {
    v26 = (unint64_t *)(v25 + 8);
    do
      v27 = __ldxr(v26);
    while (__stxr(v27 + 1, v26));
  }
  return a1;
}

void SLAM::TransceiverWrapper::~TransceiverWrapper(SLAM::TransceiverWrapper *this)
{
  char *v1;

  *(_QWORD *)this = &off_24D1BA400;
  v1 = (char *)this + 8;
  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100]((uint64_t)v1);
}

{
  char *v1;

  *(_QWORD *)this = &off_24D1BA400;
  v1 = (char *)this + 8;
  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100]((uint64_t)v1);
  JUMPOUT(0x2199D23E0);
}

__n128 std::__optional_storage_base<SLAM::Error,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<SLAM::Error,false>>(std::vector<std::string> *this, uint64_t a2)
{
  __n128 result;
  std::vector<std::string> *v5;

  if (LOBYTE(this[1].__begin_) == *(unsigned __int8 *)(a2 + 24))
  {
    if (LOBYTE(this[1].__begin_))
    {
      std::vector<std::string>::__vdeallocate(this);
      result = *(__n128 *)a2;
      *(_OWORD *)&this->__begin_ = *(_OWORD *)a2;
      this->__end_cap_.__value_ = *(std::string **)(a2 + 16);
      *(_QWORD *)a2 = 0;
      *(_QWORD *)(a2 + 8) = 0;
      *(_QWORD *)(a2 + 16) = 0;
    }
  }
  else if (LOBYTE(this[1].__begin_))
  {
    v5 = this;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v5);
    LOBYTE(this[1].__begin_) = 0;
  }
  else
  {
    this->__begin_ = 0;
    this->__end_ = 0;
    this->__end_cap_.__value_ = 0;
    result = *(__n128 *)a2;
    *this = *(std::vector<std::string> *)a2;
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
    LOBYTE(this[1].__begin_) = 1;
  }
  return result;
}

void std::vector<std::string>::__vdeallocate(std::vector<std::string> *this)
{
  if (this->__begin_)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this);
    operator delete(this->__begin_);
    this->__begin_ = 0;
    this->__end_ = 0;
    this->__end_cap_.__value_ = 0;
  }
}

std::string *ctu::join<std::__wrap_iter<std::string const*>>@<X0>(std::string *__str@<X0>, std::string *a2@<X1>, void *a3@<X2>, size_t a4@<X3>, std::string *a5@<X8>)
{
  std::string *v8;
  std::string *i;
  std::string::size_type v11;
  void **v12;
  std::string::size_type v13;
  void **p_p;
  std::string::size_type v15;
  int v16;
  const std::string::value_type *v17;
  std::string::size_type size;
  void *__p;
  std::string::size_type v20;
  uint64_t v21;

  a5->__r_.__value_.__r.__words[0] = 0;
  a5->__r_.__value_.__l.__size_ = 0;
  a5->__r_.__value_.__r.__words[2] = 0;
  if (__str != a2)
  {
    v8 = __str;
    __str = std::string::operator=(a5, __str);
    for (i = v8 + 1; i != a2; ++i)
    {
      if (a3)
      {
        std::string::basic_string[abi:ne180100](&__p, a3, a4);
        v11 = HIBYTE(v21);
        v12 = (void **)__p;
        v13 = v20;
      }
      else
      {
        v13 = 0;
        v12 = 0;
        v11 = 0;
        __p = 0;
        v20 = 0;
        v21 = 0;
      }
      if ((v11 & 0x80u) == 0)
        p_p = &__p;
      else
        p_p = v12;
      if ((v11 & 0x80u) == 0)
        v15 = v11;
      else
        v15 = v13;
      std::string::append(a5, (const std::string::value_type *)p_p, v15);
      if (SHIBYTE(v21) < 0)
        operator delete(__p);
      v16 = SHIBYTE(i->__r_.__value_.__r.__words[2]);
      if (v16 >= 0)
        v17 = (const std::string::value_type *)i;
      else
        v17 = (const std::string::value_type *)i->__r_.__value_.__r.__words[0];
      if (v16 >= 0)
        size = HIBYTE(i->__r_.__value_.__r.__words[2]);
      else
        size = i->__r_.__value_.__l.__size_;
      __str = std::string::append(a5, v17, size);
    }
  }
  return __str;
}

void sub_2145A2350(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  if (*(char *)(v15 + 23) < 0)
    operator delete(*(void **)v15);
  _Unwind_Resume(exception_object);
}

_QWORD *std::string::basic_string[abi:ne180100](_QWORD *__dst, void *__src, size_t __len)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((_BYTE *)__dst + 23) = __len;
    v6 = __dst;
    if (!__len)
      goto LABEL_9;
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __dst;
}

uint64_t std::for_each[abi:ne180100]<boost::cb_details::iterator<boost::circular_buffer<std::string,std::allocator<std::string>>,boost::cb_details::const_traits<std::allocator<std::string>>>,std::function<void ()(std::string const&)>>@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;

  if (a2 != a3)
  {
    v8 = a2;
    do
    {
      v10 = *(_QWORD *)(a4 + 24);
      if (!v10)
        std::__throw_bad_function_call[abi:ne180100]();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v10 + 48))(v10, v8);
      v11 = v8 + 24;
      if (v8 + 24 == a1[1])
        v11 = *a1;
      if (v11 == a1[3])
        v8 = 0;
      else
        v8 = v11;
    }
    while (v8 != a3);
  }
  return std::__function::__value_func<void ()(std::string const&)>::__value_func[abi:ne180100](a5, a4);
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x2199D23E0);
}

uint64_t std::__function::__value_func<void ()(std::string const&)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(_QWORD *)(a1 + 24) = a1;
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)*v3 + 24))(*v3, a1);
      return a1;
    }
    *(_QWORD *)(a1 + 24) = v4;
  }
  else
  {
    v3 = (_QWORD *)(a1 + 24);
  }
  *v3 = 0;
  return a1;
}

void caulk::bad_expected_access<SLAM::Error>::~bad_expected_access(std::exception *a1)
{
  std::exception *v2;

  a1->__vftable = (std::exception_vtbl *)off_24D1BA4C0;
  v2 = a1 + 1;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v2);
  std::exception::~exception(a1);
}

uint64_t caulk::bad_expected_access<SLAM::Error>::bad_expected_access(uint64_t a1, __int128 **a2)
{
  *(_QWORD *)a1 = off_24D1BA4C0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 8) = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)(a1 + 8), *a2, a2[1], 0xAAAAAAAAAAAAAAABLL * (((char *)a2[1] - (char *)*a2) >> 3));
  return a1;
}

void sub_2145A2620(_Unwind_Exception *a1)
{
  std::exception *v1;

  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

uint64_t caulk::bad_expected_access<SLAM::Error>::~bad_expected_access(std::exception *a1)
{
  std::exception *v3;

  a1->__vftable = (std::exception_vtbl *)off_24D1BA4C0;
  v3 = a1 + 1;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v3);
  std::exception::~exception(a1);
  return MEMORY[0x2199D23E0]();
}

uint64_t caulk::__expected_detail::base<SLAM::MigrationInfo,SLAM::Error>::~base(uint64_t a1)
{
  void *v2;
  void **v4;

  if (*(_BYTE *)(a1 + 48))
  {
    v2 = *(void **)(a1 + 16);
    if (v2)
    {
      *(_QWORD *)(a1 + 24) = v2;
      operator delete(v2);
    }
  }
  else
  {
    v4 = (void **)a1;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v4);
  }
  return a1;
}

uint64_t caulk::__expected_detail::base<SLAM::Script,SLAM::Error>::~base(uint64_t a1)
{
  void **v3;

  if (*(_BYTE *)(a1 + 72))
  {
    caulk::__expected_detail::destroy<SLAM::Script,(void *)0>(a1);
  }
  else
  {
    v3 = (void **)a1;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v3);
  }
  return a1;
}

void caulk::__expected_detail::destroy<SLAM::Script,(void *)0>(uint64_t a1)
{
  void *v2;
  void **v3;

  v3 = (void **)(a1 + 40);
  std::vector<std::vector<unsigned char>>::__destroy_vector::operator()[abi:ne180100](&v3);
  v2 = *(void **)(a1 + 8);
  if (v2)
  {
    *(_QWORD *)(a1 + 16) = v2;
    operator delete(v2);
  }
}

void std::vector<std::vector<unsigned char>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::vector<unsigned char>>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<std::vector<unsigned char>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = *a1;
  v2 = a1[1];
  if (v2 != *a1)
  {
    v4 = a1[1];
    do
    {
      v6 = *(void **)(v4 - 24);
      v4 -= 24;
      v5 = v6;
      if (v6)
      {
        *(_QWORD *)(v2 - 16) = v5;
        operator delete(v5);
      }
      v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

std::string *std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(std::string *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  std::string *v6;

  if (a4)
  {
    v6 = result;
    std::vector<std::string>::__vallocate[abi:ne180100](result, a4);
    result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>((uint64_t)&v6->__r_.__value_.__r.__words[2], a2, a3, (std::string *)v6->__r_.__value_.__l.__size_);
    v6->__r_.__value_.__l.__size_ = (std::string::size_type)result;
  }
  return result;
}

void sub_2145A2868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::string>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(uint64_t a1, __int128 *a2, __int128 *a3, std::string *this)
{
  std::string *v4;
  __int128 *v6;
  __int128 v7;
  _QWORD v9[3];
  char v10;
  std::string *v11;
  std::string *v12;

  v4 = this;
  v11 = this;
  v12 = this;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  v10 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((_QWORD *)v6 + 1));
        v4 = v12;
      }
      else
      {
        v7 = *v6;
        v4->__r_.__value_.__r.__words[2] = *((_QWORD *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
      }
      v6 = (__int128 *)((char *)v6 + 24);
      v12 = ++v4;
    }
    while (v6 != a3);
  }
  v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_2145A2980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = **(_QWORD **)(a1 + 16);
  v2 = **(_QWORD **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 1) < 0)
      operator delete(*(void **)(v1 - 24));
    v1 -= 24;
  }
}

void SLAM::StringUtil::Format(SLAM::StringUtil *this@<X0>, _QWORD *a2@<X8>, ...)
{
  char *__s;
  va_list va;

  va_start(va, a2);
  __s = 0;
  vasprintf(&__s, (const char *)this, va);
  if (__s)
  {
    std::string::basic_string[abi:ne180100]<0>(a2, __s);
    free(__s);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(a2, "<FAILED TO VASPRINTF>");
  }
}

void boost::circular_buffer<std::string,std::allocator<std::string>>::push_back_impl<std::string const&>(uint64_t a1, const std::string *a2)
{
  uint64_t v3;
  uint64_t v4;
  std::string *v5;
  __int128 v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v3 - *(_QWORD *)a1) >> 3) == *(_QWORD *)(a1 + 32))
  {
    if (v3 != *(_QWORD *)a1)
    {
      std::string::operator=(*(std::string **)(a1 + 24), a2);
      v4 = *(_QWORD *)(a1 + 24) + 24;
      *(_QWORD *)(a1 + 24) = v4;
      if (v4 == *(_QWORD *)(a1 + 8))
      {
        v4 = *(_QWORD *)a1;
        *(_QWORD *)(a1 + 24) = *(_QWORD *)a1;
      }
      *(_QWORD *)(a1 + 16) = v4;
    }
  }
  else
  {
    v5 = *(std::string **)(a1 + 24);
    if (SHIBYTE(a2->__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(v5, a2->__r_.__value_.__l.__data_, a2->__r_.__value_.__l.__size_);
    }
    else
    {
      v6 = *(_OWORD *)&a2->__r_.__value_.__l.__data_;
      v5->__r_.__value_.__r.__words[2] = a2->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
    }
    v7 = *(_QWORD *)(a1 + 24) + 24;
    *(_QWORD *)(a1 + 24) = v7;
    if (v7 == *(_QWORD *)(a1 + 8))
      *(_QWORD *)(a1 + 24) = *(_QWORD *)a1;
    ++*(_QWORD *)(a1 + 32);
  }
}

void std::__throw_bad_variant_access[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB8D8] + 16;
  __cxa_throw(exception, MEMORY[0x24BEDB738], (void (*)(void *))std::bad_variant_access::~bad_variant_access);
}

void std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_0,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_1,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_2,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_3,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,SLAM::MigrationInfo::Idle,SLAM::MigrationInfo::SecureChannel,SLAM::MigrationInfo::Termination,SLAM::MigrationInfo::SLAM> const&>(uint64_t a1@<X8>)
{
  std::vector<std::string> v2;
  std::vector<std::string> *v3;

  SLAM::Error::Error(&v2, "Cannot proceed in OSU state");
  *(std::vector<std::string> *)a1 = v2;
  memset(&v2, 0, sizeof(v2));
  *(_BYTE *)(a1 + 24) = 1;
  v3 = &v2;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v3);
}

void std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_0,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_1,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_2,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_3,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,SLAM::MigrationInfo::Idle,SLAM::MigrationInfo::SecureChannel,SLAM::MigrationInfo::Termination,SLAM::MigrationInfo::SLAM> const&>(_BYTE *a1@<X8>)
{
  *a1 = 0;
  a1[24] = 0;
}

void std::__variant_detail::__visitation::__base::__dispatcher<2ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_0,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_1,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_2,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_3,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,SLAM::MigrationInfo::Idle,SLAM::MigrationInfo::SecureChannel,SLAM::MigrationInfo::Termination,SLAM::MigrationInfo::SLAM> const&>(uint64_t a1@<X8>)
{
  std::vector<std::string> v2;
  std::vector<std::string> *v3;

  SLAM::Error::Error(&v2, "Cannot proceed in SC state");
  *(std::vector<std::string> *)a1 = v2;
  memset(&v2, 0, sizeof(v2));
  *(_BYTE *)(a1 + 24) = 1;
  v3 = &v2;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v3);
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<3ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_0,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_1,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_2,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_3,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,SLAM::MigrationInfo::Idle,SLAM::MigrationInfo::SecureChannel,SLAM::MigrationInfo::Termination,SLAM::MigrationInfo::SLAM> const&>@<X0>(SLAM::Impl ***a1@<X0>, std::string *a2@<X8>)
{
  SLAM::Impl *v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;

  v3 = **a1;
  v4 = *((_QWORD *)v3 + 8);
  v5 = (std::__shared_weak_count *)*((_QWORD *)v3 + 9);
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  SLAM::Logger::Log(v4, 1, (uint64_t)"operator()", 198, "Recovering incomplete termination");
  if (v5)
  {
    v8 = (unint64_t *)&v5->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  return SLAM::Impl::PerformTermination(v3, a2);
}

void sub_2145A2CF0(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    std::__variant_detail::__visitation::__base::__dispatcher<3ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_0,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_1,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_2,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_3,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,SLAM::MigrationInfo::Idle,SLAM::MigrationInfo::SecureChannel,SLAM::MigrationInfo::Termination,SLAM::MigrationInfo::SLAM> const&>();
  _Unwind_Resume(exception_object);
}

void std::__variant_detail::__visitation::__base::__dispatcher<4ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_0,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_1,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_2,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_3,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,SLAM::MigrationInfo::Idle,SLAM::MigrationInfo::SecureChannel,SLAM::MigrationInfo::Termination,SLAM::MigrationInfo::SLAM> const&>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, std::string *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  SLAM::Impl *v6;
  uint64_t v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;

  v4 = *a1;
  v6 = *(SLAM::Impl **)(*a1 + 8);
  v5 = *(_QWORD *)(*a1 + 16);
  v7 = *a2;
  v8 = *((_QWORD *)v6 + 8);
  v9 = (std::__shared_weak_count *)*((_QWORD *)v6 + 9);
  if (v5 == *a2)
  {
    if (v9)
    {
      p_shared_owners = (unint64_t *)&v9->__shared_owners_;
      do
        v11 = __ldxr(p_shared_owners);
      while (__stxr(v11 + 1, p_shared_owners));
      v5 = *(_QWORD *)(v4 + 16);
    }
    SLAM::Logger::Log(v8, 1, (uint64_t)"operator()", 211, "Resuming interrupted script 0x%llx", v5);
    if (v9)
    {
      v12 = (unint64_t *)&v9->__shared_owners_;
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
LABEL_21:
    a3->__r_.__value_.__s.__data_[0] = 0;
    a3[1].__r_.__value_.__s.__data_[0] = 0;
    return;
  }
  if (v9)
  {
    v14 = (unint64_t *)&v9->__shared_owners_;
    do
      v15 = __ldxr(v14);
    while (__stxr(v15 + 1, v14));
    v7 = *a2;
    v5 = *(_QWORD *)(v4 + 16);
  }
  SLAM::Logger::Log(v8, 1, (uint64_t)"operator()", 206, "Recover interrupted script 0x%llx before running 0x%llx", v7, v5);
  if (v9)
  {
    v16 = (unint64_t *)&v9->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  SLAM::Impl::PerformRecovery(v6, a3);
  if (!a3[1].__r_.__value_.__s.__data_[0])
    goto LABEL_21;
}

void sub_2145A2E50(_Unwind_Exception *exception_object)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v4;

  if (v1)
  {
    p_shared_owners = (unint64_t *)&v1->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
  _Unwind_Resume(exception_object);
}

void std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformRecovery(void)::$_0,SLAM::Impl::PerformRecovery(void)::$_1,SLAM::Impl::PerformRecovery(void)::$_2,SLAM::Impl::PerformRecovery(void)::$_3,SLAM::Impl::PerformRecovery(void)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,std::__variant_detail::_Trait::Idle,std::__variant_detail::_Trait::SecureChannel,std::__variant_detail::_Trait::Termination,std::__variant_detail::_Trait::SLAM> const&>(_BYTE *a1@<X8>)
{
  *a1 = 0;
  a1[24] = 0;
}

void std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformRecovery(void)::$_0,SLAM::Impl::PerformRecovery(void)::$_1,SLAM::Impl::PerformRecovery(void)::$_2,SLAM::Impl::PerformRecovery(void)::$_3,SLAM::Impl::PerformRecovery(void)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,std::__variant_detail::_Trait::Idle,std::__variant_detail::_Trait::SecureChannel,std::__variant_detail::_Trait::Termination,std::__variant_detail::_Trait::SLAM> const&>(_BYTE *a1@<X8>)
{
  *a1 = 0;
  a1[24] = 0;
}

void std::__variant_detail::__visitation::__base::__dispatcher<2ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformRecovery(void)::$_0,SLAM::Impl::PerformRecovery(void)::$_1,SLAM::Impl::PerformRecovery(void)::$_2,SLAM::Impl::PerformRecovery(void)::$_3,SLAM::Impl::PerformRecovery(void)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,std::__variant_detail::_Trait::Idle,std::__variant_detail::_Trait::SecureChannel,std::__variant_detail::_Trait::Termination,std::__variant_detail::_Trait::SLAM> const&>(_BYTE *a1@<X8>)
{
  *a1 = 0;
  a1[24] = 0;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<3ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformRecovery(void)::$_0,SLAM::Impl::PerformRecovery(void)::$_1,SLAM::Impl::PerformRecovery(void)::$_2,SLAM::Impl::PerformRecovery(void)::$_3,SLAM::Impl::PerformRecovery(void)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,std::__variant_detail::_Trait::Idle,std::__variant_detail::_Trait::SecureChannel,std::__variant_detail::_Trait::Termination,std::__variant_detail::_Trait::SLAM> const&>@<X0>(SLAM::Impl ***a1@<X0>, std::string *a2@<X8>)
{
  SLAM::Impl *v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;

  v3 = **a1;
  v4 = *((_QWORD *)v3 + 8);
  v5 = (std::__shared_weak_count *)*((_QWORD *)v3 + 9);
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  SLAM::Logger::Log(v4, 1, (uint64_t)"operator()", 252, "Recovering incomplete termination");
  if (v5)
  {
    v8 = (unint64_t *)&v5->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  return SLAM::Impl::PerformTermination(v3, a2);
}

void sub_2145A2F74(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    std::__variant_detail::__visitation::__base::__dispatcher<3ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_0,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_1,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_2,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_3,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,SLAM::MigrationInfo::Idle,SLAM::MigrationInfo::SecureChannel,SLAM::MigrationInfo::Termination,SLAM::MigrationInfo::SLAM> const&>();
  _Unwind_Resume(exception_object);
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<4ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformRecovery(void)::$_0,SLAM::Impl::PerformRecovery(void)::$_1,SLAM::Impl::PerformRecovery(void)::$_2,SLAM::Impl::PerformRecovery(void)::$_3,SLAM::Impl::PerformRecovery(void)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,std::__variant_detail::_Trait::Idle,std::__variant_detail::_Trait::SecureChannel,std::__variant_detail::_Trait::Termination,std::__variant_detail::_Trait::SLAM> const&>@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, std::string *a3@<X8>)
{
  SLAM::Impl *v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  uint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  std::string *p_p;
  unint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  std::string __p;
  std::string v28;
  char v29;
  _QWORD v30[5];
  uint64_t v31[4];
  char v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = *(SLAM::Impl **)(*(_QWORD *)a1 + 8);
  v6 = *((_QWORD *)v5 + 6);
  v7 = (std::__shared_weak_count *)*((_QWORD *)v5 + 7);
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)v6 + 8))(v30, v6, *a2);
  if (v7)
  {
    v10 = (unint64_t *)&v7->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  if (v32)
  {
    SLAM::Impl::ExecuteScript((uint64_t)v5, v31, &v28);
    if (v29)
    {
      v13 = *((_QWORD *)v5 + 8);
      v12 = (std::__shared_weak_count *)*((_QWORD *)v5 + 9);
      if (v12)
      {
        v14 = (unint64_t *)&v12->__shared_owners_;
        do
          v15 = __ldxr(v14);
        while (__stxr(v15 + 1, v14));
      }
      v16 = *a2;
      ctu::join<std::__wrap_iter<std::string const*>>((std::string *)v28.__r_.__value_.__l.__data_, (std::string *)v28.__r_.__value_.__l.__size_, ", ", 2uLL, &__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      SLAM::Logger::Log(v13, 1, (uint64_t)"operator()", 267, "Failed recovery with scriptID 0x%llx, error was %s", v16, (const char *)p_p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (v12)
      {
        v18 = (unint64_t *)&v12->__shared_owners_;
        do
          v19 = __ldaxr(v18);
        while (__stlxr(v19 - 1, v18));
        if (!v19)
        {
          ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
          std::__shared_weak_count::__release_weak(v12);
        }
      }
      SLAM::Impl::PerformTermination(v5, a3);
      if (v29)
      {
        __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v28;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
      }
    }
    else
    {
      a3->__r_.__value_.__s.__data_[0] = 0;
      a3[1].__r_.__value_.__s.__data_[0] = 0;
    }
  }
  else
  {
    v20 = *((_QWORD *)v5 + 8);
    v21 = (std::__shared_weak_count *)*((_QWORD *)v5 + 9);
    if (v21)
    {
      v22 = (unint64_t *)&v21->__shared_owners_;
      do
        v23 = __ldxr(v22);
      while (__stxr(v23 + 1, v22));
    }
    SLAM::Logger::Log(v20, 1, (uint64_t)"operator()", 260, "Recovery script 0x%llx not found, terminating!", *a2);
    if (v21)
    {
      v24 = (unint64_t *)&v21->__shared_owners_;
      do
        v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
    SLAM::Impl::PerformTermination(v5, a3);
  }
  return caulk::__expected_detail::base<SLAM::Script,SLAM::Error>::~base((uint64_t)v30);
}

void sub_2145A31F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17, uint64_t a18, uint64_t a19, char a20,int a21,__int16 a22,char a23,char a24)
{
  caulk::__expected_detail::base<SLAM::Script,SLAM::Error>::~base((uint64_t)&a22);
  _Unwind_Resume(a1);
}

void sub_2145A32B8()
{
  std::__shared_weak_count *v0;
  unint64_t *p_shared_owners;
  unint64_t v2;

  if (v0)
  {
    p_shared_owners = (unint64_t *)&v0->__shared_owners_;
    do
      v2 = __ldaxr(p_shared_owners);
    while (__stlxr(v2 - 1, p_shared_owners));
    if (!v2)
    {
      ((void (*)(std::__shared_weak_count *))v0->__on_zero_shared)(v0);
      std::__shared_weak_count::__release_weak(v0);
    }
  }
  JUMPOUT(0x2145A32B0);
}

uint64_t caulk::__expected_detail::base<std::vector<unsigned char>,SLAM::Error>::~base(uint64_t a1)
{
  void *v2;
  void **v4;

  if (*(_BYTE *)(a1 + 24))
  {
    v2 = *(void **)a1;
    if (*(_QWORD *)a1)
    {
      *(_QWORD *)(a1 + 8) = v2;
      operator delete(v2);
    }
  }
  else
  {
    v4 = (void **)a1;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v4);
  }
  return a1;
}

void std::vector<unsigned char>::__append(unint64_t *a1, size_t a2)
{
  char *v4;
  char *v5;
  unint64_t v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  size_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char v15;

  v5 = (char *)a1[1];
  v4 = (char *)a1[2];
  if (v4 - v5 >= a2)
  {
    if (a2)
    {
      bzero((void *)a1[1], a2);
      v5 += a2;
    }
    a1[1] = (unint64_t)v5;
  }
  else
  {
    v6 = *a1;
    v7 = &v5[-*a1];
    v8 = (unint64_t)&v7[a2];
    if ((uint64_t)&v7[a2] < 0)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v9 = (unint64_t)&v4[-v6];
    if (2 * v9 > v8)
      v8 = 2 * v9;
    if (v9 >= 0x3FFFFFFFFFFFFFFFLL)
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v10 = v8;
    if (v10)
      v11 = (unint64_t)operator new(v10);
    else
      v11 = 0;
    v12 = &v7[v11];
    v13 = (char *)(v11 + v10);
    bzero(v12, a2);
    if (v5 == (char *)v6)
    {
      v11 = (unint64_t)v12;
    }
    else
    {
      v14 = &v5[~v6];
      do
      {
        v15 = *--v5;
        (v14--)[v11] = v15;
      }
      while (v5 != (char *)v6);
      v5 = (char *)*a1;
    }
    *a1 = v11;
    a1[1] = (unint64_t)&v12[a2];
    a1[2] = (unint64_t)v13;
    if (v5)
      operator delete(v5);
  }
}

char *std::vector<unsigned char>::__vallocate[abi:ne180100](_QWORD *a1, size_t __sz)
{
  char *result;

  if ((__sz & 0x8000000000000000) != 0)
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

_QWORD *__Block_byref_object_copy_(_QWORD *result, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  result[5] = a2[5];
  v2 = a2 + 6;
  v3 = a2[6];
  result[6] = v3;
  v4 = result + 6;
  v5 = a2[7];
  result[7] = v5;
  if (v5)
  {
    *(_QWORD *)(v3 + 16) = v4;
    a2[5] = v2;
    *v2 = 0;
    a2[7] = 0;
  }
  else
  {
    result[5] = v4;
  }
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::destroy(a1 + 40, *(_QWORD **)(a1 + 48));
}

uint64_t ___ZN4SLAML21DERParseSequenceToMapERNSt3__16vectorIhNS0_9allocatorIhEEEESt16initializer_listIyE_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t **v2;
  uint64_t *v4;

  v2 = (uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4 = (uint64_t *)a2;
  *(_OWORD *)(std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v2, (unint64_t *)a2, (uint64_t)&std::piecewise_construct, &v4)+ 5) = *(_OWORD *)(a2 + 8);
  return 0;
}

void std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t *std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(uint64_t **a1, unint64_t *a2, uint64_t a3, uint64_t **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  unint64_t v8;
  uint64_t **v9;
  unint64_t v10;
  uint64_t *v11;

  v7 = a1 + 1;
  v6 = a1[1];
  if (v6)
  {
    v8 = *a2;
    while (1)
    {
      while (1)
      {
        v9 = (uint64_t **)v6;
        v10 = v6[4];
        if (v8 >= v10)
          break;
        v6 = *v9;
        v7 = v9;
        if (!*v9)
          goto LABEL_10;
      }
      if (v10 >= v8)
        break;
      v6 = v9[1];
      if (!v6)
      {
        v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v9 = a1 + 1;
LABEL_10:
    v11 = (uint64_t *)operator new(0x38uLL);
    v11[4] = **a4;
    v11[5] = 0;
    v11[6] = 0;
    std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::__insert_node_at(a1, (uint64_t)v9, v7, v11);
    return v11;
  }
  return (uint64_t *)v9;
}

uint64_t *std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

uint64_t std::map<unsigned long long,DERItem>::map[abi:ne180100](uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)a1 = a1 + 8;
  std::map<unsigned long long,DERItem>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<unsigned long long,DERItem>,std::__tree_node<std::__value_type<unsigned long long,DERItem>,void *> *,long>>>((_OWORD *)a1, *(_QWORD **)a2, (_QWORD *)(a2 + 8));
  return a1;
}

void sub_2145A3874(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::destroy(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

_OWORD *std::map<unsigned long long,DERItem>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<unsigned long long,DERItem>,std::__tree_node<std::__value_type<unsigned long long,DERItem>,void *> *,long>>>(_OWORD *result, _QWORD *a2, _QWORD *a3)
{
  _QWORD *v4;
  uint64_t **v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  BOOL v9;

  if (a2 != a3)
  {
    v4 = a2;
    v5 = (uint64_t **)result;
    v6 = (_QWORD *)result + 1;
    do
    {
      result = std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::__emplace_hint_unique_key_args<unsigned long long,std::pair<unsigned long long const,DERItem> const&>(v5, v6, v4 + 4, (uint64_t)(v4 + 4));
      v7 = (_QWORD *)v4[1];
      if (v7)
      {
        do
        {
          v8 = v7;
          v7 = (_QWORD *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (_QWORD *)v4[2];
          v9 = *v8 == (_QWORD)v4;
          v4 = v8;
        }
        while (!v9);
      }
      v4 = v8;
    }
    while (v8 != a3);
  }
  return result;
}

_OWORD *std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::__emplace_hint_unique_key_args<unsigned long long,std::pair<unsigned long long const,DERItem> const&>(uint64_t **a1, _QWORD *a2, unint64_t *a3, uint64_t a4)
{
  void **v6;
  _OWORD *v7;
  uint64_t **v8;
  uint64_t v10;
  uint64_t v11;

  v6 = (void **)std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::__find_equal<unsigned long long>(a1, a2, &v11, &v10, a3);
  v7 = *v6;
  if (!*v6)
  {
    v8 = (uint64_t **)v6;
    v7 = operator new(0x38uLL);
    v7[2] = *(_OWORD *)a4;
    *((_QWORD *)v7 + 6) = *(_QWORD *)(a4 + 16);
    std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::__insert_node_at(a1, v11, v8, (uint64_t *)v7);
  }
  return v7;
}

_QWORD *std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::__find_equal<unsigned long long>(_QWORD *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, unint64_t *a5)
{
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  BOOL v14;
  unint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  unint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  unint64_t v22;

  v5 = a1 + 1;
  if (a1 + 1 == a2 || (v6 = *a5, v7 = a2[4], *a5 < v7))
  {
    v8 = *a2;
    if ((_QWORD *)*a1 == a2)
    {
      v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      v9 = (_QWORD *)*a2;
      do
      {
        v10 = v9;
        v9 = (_QWORD *)v9[1];
      }
      while (v9);
    }
    else
    {
      v13 = a2;
      do
      {
        v10 = (_QWORD *)v13[2];
        v14 = *v10 == (_QWORD)v13;
        v13 = v10;
      }
      while (v14);
    }
    v15 = *a5;
    if (v10[4] < *a5)
      goto LABEL_17;
    v16 = (_QWORD *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v17 = v16;
          v18 = v16[4];
          if (v15 >= v18)
            break;
          v16 = (_QWORD *)*v17;
          v5 = v17;
          if (!*v17)
            goto LABEL_29;
        }
        if (v18 >= v15)
          break;
        v5 = v17 + 1;
        v16 = (_QWORD *)v17[1];
      }
      while (v16);
    }
    else
    {
      v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = a2;
    return a4;
  }
  v11 = a2[1];
  if (v11)
  {
    v12 = (_QWORD *)a2[1];
    do
    {
      a4 = v12;
      v12 = (_QWORD *)*v12;
    }
    while (v12);
  }
  else
  {
    v19 = a2;
    do
    {
      a4 = (_QWORD *)v19[2];
      v14 = *a4 == (_QWORD)v19;
      v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= a4[4])
  {
    v20 = (_QWORD *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v21 = v20;
          v22 = v20[4];
          if (v6 >= v22)
            break;
          v20 = (_QWORD *)*v21;
          v5 = v21;
          if (!*v21)
            goto LABEL_48;
        }
        if (v22 >= v6)
          break;
        v5 = v21 + 1;
        v20 = (_QWORD *)v21[1];
      }
      while (v20);
    }
    else
    {
      v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

std::string **SLAM::Error::Error(std::string **a1, uint64_t a2)
{
  std::string *v3;
  std::string v5;
  __int128 v6;

  *(_QWORD *)&v6 = *MEMORY[0x24BDAC8D0];
  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v5, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v5 = *(std::string *)a2;
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  v3 = (std::string *)operator new(0x18uLL);
  *a1 = v3;
  a1[1] = v3;
  a1[2] = v3 + 1;
  a1[1] = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)(a1 + 2), (__int128 *)&v5, &v6, v3);
  if (SHIBYTE(v5.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v5.__r_.__value_.__l.__data_);
  return a1;
}

void sub_2145A3C18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  _Unwind_Resume(exception_object);
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>(uint64_t a1, __int128 *a2, __int128 *a3, std::string *this)
{
  std::string *v4;
  __int128 *v6;
  __int128 v7;
  _QWORD v9[3];
  char v10;
  std::string *v11;
  std::string *v12;

  v4 = this;
  v11 = this;
  v12 = this;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  v10 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((_QWORD *)v6 + 1));
        v4 = v12;
      }
      else
      {
        v7 = *v6;
        v4->__r_.__value_.__r.__words[2] = *((_QWORD *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
      }
      v6 = (__int128 *)((char *)v6 + 24);
      v12 = ++v4;
    }
    while (v6 != a3);
  }
  v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_2145A3CFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t caulk::__expected_detail::base<std::map<unsigned long long,DERItem>,SLAM::Error>::~base(uint64_t a1)
{
  void **v3;

  if (*(_BYTE *)(a1 + 24))
  {
    std::__tree<std::__value_type<unsigned long long,DERItem>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DERItem>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DERItem>>>::destroy(a1, *(_QWORD **)(a1 + 8));
  }
  else
  {
    v3 = (void **)a1;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v3);
  }
  return a1;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

_QWORD *_ZNSt3__115allocate_sharedB8ne180100IN4SLAM21DefaultScriptProviderENS_9allocatorIS2_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v2;
  _QWORD *result;

  v2 = operator new(0x30uLL);
  result = _ZNSt3__120__shared_ptr_emplaceIN4SLAM21DefaultScriptProviderENS_9allocatorIS2_EEEC2B8ne180100IJES4_Li0EEES4_DpOT_(v2);
  *a1 = v2 + 3;
  a1[1] = v2;
  return result;
}

void sub_2145A3E1C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *_ZNSt3__120__shared_ptr_emplaceIN4SLAM21DefaultScriptProviderENS_9allocatorIS2_EEEC2B8ne180100IJES4_Li0EEES4_DpOT_(_QWORD *a1)
{
  char v3;

  a1[1] = 0;
  a1[2] = 0;
  *a1 = &off_24D1BA560;
  std::allocator<SLAM::DefaultScriptProvider>::construct[abi:ne180100]<SLAM::DefaultScriptProvider>((uint64_t)&v3, a1 + 3);
  return a1;
}

void sub_2145A3E74(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<SLAM::DefaultScriptProvider>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24D1BA560;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<SLAM::DefaultScriptProvider>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24D1BA560;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2199D23E0);
}

uint64_t std::__shared_ptr_emplace<SLAM::DefaultScriptProvider>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 24) + 16))(a1 + 24);
}

void std::allocator<SLAM::DefaultScriptProvider>::construct[abi:ne180100]<SLAM::DefaultScriptProvider>(uint64_t a1, _QWORD *a2)
{
  void *__p[2];
  char v4;

  std::string::basic_string[abi:ne180100]<0>(__p, "/usr/standalone/firmware/SLAM/SLAM.sefw");
  SLAM::DefaultScriptProvider::DefaultScriptProvider(a2, (uint64_t)__p);
  if (v4 < 0)
    operator delete(__p[0]);
}

void sub_2145A3F28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::allocate_shared[abi:ne180100]<SLAM::Logger,std::allocator<SLAM::Logger>,gsl::not_null<std::shared_ptr<SLAM::LogSink>> const&,void>@<X0>(uint64_t *a1@<X1>, _QWORD *a2@<X8>)
{
  _QWORD *v4;
  _QWORD *result;

  v4 = operator new(0x50uLL);
  result = std::__shared_ptr_emplace<SLAM::Logger>::__shared_ptr_emplace[abi:ne180100]<gsl::not_null<std::shared_ptr<SLAM::LogSink>> const&,std::allocator<SLAM::Logger>,0>(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_2145A3F88(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__shared_ptr_emplace<SLAM::Logger>::__shared_ptr_emplace[abi:ne180100]<gsl::not_null<std::shared_ptr<SLAM::LogSink>> const&,std::allocator<SLAM::Logger>,0>(_QWORD *a1, uint64_t *a2)
{
  char v4;

  a1[1] = 0;
  a1[2] = 0;
  *a1 = &off_24D1BA5B0;
  std::allocator<SLAM::Logger>::construct[abi:ne180100]<SLAM::Logger,gsl::not_null<std::shared_ptr<SLAM::LogSink>> const&>((uint64_t)&v4, a1 + 3, a2);
  return a1;
}

void sub_2145A3FE4(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<SLAM::Logger>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24D1BA5B0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<SLAM::Logger>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24D1BA5B0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2199D23E0);
}

uint64_t std::__shared_ptr_emplace<SLAM::Logger>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 + 24;
  boost::circular_buffer<std::string,std::allocator<std::string>>::destroy((uint64_t *)(a1 + 40));
  return std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100](v1);
}

void std::allocator<SLAM::Logger>::construct[abi:ne180100]<SLAM::Logger,gsl::not_null<std::shared_ptr<SLAM::LogSink>> const&>(uint64_t a1, _QWORD *a2, uint64_t *a3)
{
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;

  v3 = (std::__shared_weak_count *)a3[1];
  v9 = *a3;
  v10 = v3;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  SLAM::Logger::Logger(a2, &v9);
  v6 = v10;
  if (v10)
  {
    v7 = (unint64_t *)&v10->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void sub_2145A40E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

_QWORD *SLAM::Logger::Logger(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  char *v6;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  a1[6] = 0;
  v6 = (char *)operator new(0x1E0uLL);
  a1[2] = v6;
  a1[3] = v6 + 480;
  a1[4] = v6;
  a1[5] = v6;
  return a1;
}

void sub_2145A4154(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void boost::circular_buffer<std::string,std::allocator<std::string>>::destroy(uint64_t *a1)
{
  boost::circular_buffer<std::string,std::allocator<std::string>>::destroy_content(a1);
  if (*a1)
    operator delete((void *)*a1);
}

void boost::circular_buffer<std::string,std::allocator<std::string>>::destroy_content(uint64_t *a1)
{
  unint64_t v2;
  uint64_t v3;

  if (a1[4])
  {
    v2 = 0;
    v3 = a1[2];
    do
    {
      if (*(char *)(v3 + 23) < 0)
      {
        operator delete(*(void **)v3);
        v3 = a1[2];
      }
      v3 += 24;
      a1[2] = v3;
      if (v3 == a1[1])
      {
        v3 = *a1;
        a1[2] = *a1;
      }
      ++v2;
    }
    while (v2 < a1[4]);
  }
}

_QWORD *std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::~__func(_QWORD *a1)
{
  *a1 = &off_24D1BA600;
  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
  return a1;
}

void std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::~__func(_QWORD *a1)
{
  *a1 = &off_24D1BA600;
  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
  JUMPOUT(0x2199D23E0);
}

_QWORD *std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  result = operator new(0x18uLL);
  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  *result = &off_24D1BA600;
  result[1] = v4;
  result[2] = v3;
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  return result;
}

uint64_t std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v3 = *(_QWORD *)(result + 8);
  v2 = *(_QWORD *)(result + 16);
  *a2 = &off_24D1BA600;
  a2[1] = v3;
  a2[2] = v2;
  if (v2)
  {
    v4 = (unint64_t *)(v2 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  return result;
}

uint64_t std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::destroy(uint64_t a1)
{
  return std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100](a1 + 8);
}

void std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::destroy_deallocate(void *a1)
{
  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100]((uint64_t)a1 + 8);
  operator delete(a1);
}

void std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::operator()(uint64_t a1)
{
  void (***v2)(_QWORD);
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;

  v2 = *(void (****)(_QWORD))(a1 + 8);
  v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  (**v2)(v2);
  if (v3)
  {
    v6 = (unint64_t *)&v3->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void sub_2145A43B4(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    std::__variant_detail::__visitation::__base::__dispatcher<3ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_0,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_1,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_2,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_3,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,SLAM::MigrationInfo::Idle,SLAM::MigrationInfo::SecureChannel,SLAM::MigrationInfo::Termination,SLAM::MigrationInfo::SLAM> const&>();
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(unsigned long long,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::target_type()
{
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return 1;
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3))
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  return 0;
}

_QWORD *std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::~__func(_QWORD *a1)
{
  *a1 = &off_24D1BA690;
  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
  return a1;
}

void std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::~__func(_QWORD *a1)
{
  *a1 = &off_24D1BA690;
  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
  JUMPOUT(0x2199D23E0);
}

_QWORD *std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  result = operator new(0x18uLL);
  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  *result = &off_24D1BA690;
  result[1] = v4;
  result[2] = v3;
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  return result;
}

uint64_t std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v3 = *(_QWORD *)(result + 8);
  v2 = *(_QWORD *)(result + 16);
  *a2 = &off_24D1BA690;
  a2[1] = v3;
  a2[2] = v2;
  if (v2)
  {
    v4 = (unint64_t *)(v2 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  return result;
}

uint64_t std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::destroy(uint64_t a1)
{
  return std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100](a1 + 8);
}

void std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::destroy_deallocate(void *a1)
{
  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100]((uint64_t)a1 + 8);
  operator delete(a1);
}

void std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::operator()(uint64_t a1)
{
  void (***v2)(_QWORD);
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;

  v2 = *(void (****)(_QWORD))(a1 + 8);
  v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  (**v2)(v2);
  if (v3)
  {
    v6 = (unint64_t *)&v3->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void sub_2145A4604(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    std::__variant_detail::__visitation::__base::__dispatcher<3ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_0,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_1,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_2,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_3,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,SLAM::MigrationInfo::Idle,SLAM::MigrationInfo::SecureChannel,SLAM::MigrationInfo::Termination,SLAM::MigrationInfo::SLAM> const&>();
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformScript(std::string,gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::target_type()
{
}

_QWORD *std::__function::__func<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::~__func(_QWORD *a1)
{
  *a1 = &off_24D1BA710;
  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
  return a1;
}

void std::__function::__func<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::~__func(_QWORD *a1)
{
  *a1 = &off_24D1BA710;
  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
  JUMPOUT(0x2199D23E0);
}

_QWORD *std::__function::__func<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  result = operator new(0x18uLL);
  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  *result = &off_24D1BA710;
  result[1] = v4;
  result[2] = v3;
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  return result;
}

uint64_t std::__function::__func<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v3 = *(_QWORD *)(result + 8);
  v2 = *(_QWORD *)(result + 16);
  *a2 = &off_24D1BA710;
  a2[1] = v3;
  a2[2] = v2;
  if (v2)
  {
    v4 = (unint64_t *)(v2 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  return result;
}

uint64_t std::__function::__func<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::destroy(uint64_t a1)
{
  return std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100](a1 + 8);
}

void std::__function::__func<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::destroy_deallocate(void *a1)
{
  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100]((uint64_t)a1 + 8);
  operator delete(a1);
}

void std::__function::__func<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::operator()(uint64_t a1)
{
  void (***v2)(_QWORD);
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;

  v2 = *(void (****)(_QWORD))(a1 + 8);
  v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  (**v2)(v2);
  if (v3)
  {
    v6 = (unint64_t *)&v3->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void sub_2145A4808(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    std::__variant_detail::__visitation::__base::__dispatcher<3ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_0,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_1,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_2,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_3,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,SLAM::MigrationInfo::Idle,SLAM::MigrationInfo::SecureChannel,SLAM::MigrationInfo::Termination,SLAM::MigrationInfo::SLAM> const&>();
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0,std::allocator<SLAM::SLAMPrivateInterface::PerformRecovery(gsl::not_null<std::shared_ptr<SLAM::SEHandle>>,gsl::not_null<std::shared_ptr<SLAM::LogSink>>,gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>)::$_0>,void ()(std::string const&)>::target_type()
{
}

_QWORD *std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(_QWORD *result, const void *a2, uint64_t a3, size_t __sz)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (__sz)
  {
    v6 = result;
    result = std::vector<unsigned char>::__vallocate[abi:ne180100](result, __sz);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2145A48C4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void OUTLINED_FUNCTION_0(std::__shared_weak_count *this)
{
  std::__shared_weak_count::__release_weak(this);
}

uint64_t OUTLINED_FUNCTION_1()
{
  uint64_t v0;

  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v0 + 16))(v0);
}

void OUTLINED_FUNCTION_2(unint64_t *a1@<X8>)
{
  unint64_t v1;

  v1 = __ldaxr(a1);
  __stlxr(v1 - 1, a1);
}

uint64_t OUTLINED_FUNCTION_4@<X0>(_QWORD *a1@<X1>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(_QWORD *))(*a1 + 8 * a2))(a1);
}

uint64_t OUTLINED_FUNCTION_7()
{
  uint64_t v0;

  return std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100](v0);
}

void sub_2145A4CA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, char *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, uint64_t a16, char a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,char a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,char a28)
{
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  if (a14 < 0)
    operator delete(__p);
  if (a22)
  {
    __p = &a19;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  }
  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100]((uint64_t)&a24);
  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100]((uint64_t)&a28);

  _Unwind_Resume(a1);
}

void sub_2145A50FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, char a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,char a26,uint64_t a27,uint64_t a28,char a29,int a30,__int16 a31,char a32,char a33)
{
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;

  if (a15 < 0)
    operator delete(__p);
  if (a29)
  {
    __p = &a26;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  }
  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100]((uint64_t)&a31);
  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100](v38 - 120);

  _Unwind_Resume(a1);
}

void sub_2145A5520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, char *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, uint64_t a16, char a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,char a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,char a28)
{
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  if (a14 < 0)
    operator delete(__p);
  if (a22)
  {
    __p = &a19;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  }
  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100]((uint64_t)&a24);
  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100]((uint64_t)&a28);

  _Unwind_Resume(a1);
}

void sub_2145A5A90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, char a18, uint64_t a19, char a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27,char a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,char a35)
{
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;

  if (a27 < 0)
    operator delete(__p);
  caulk::__expected_detail::base<gsl::not_null<std::shared_ptr<SLAM::DefaultScriptProvider>>,SLAM::Error>::~base((uint64_t)&a35);
  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100](v40 - 152);
  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100](v40 - 136);

  _Unwind_Resume(a1);
}

uint64_t caulk::expected<gsl::not_null<std::shared_ptr<SLAM::DefaultScriptProvider>>,SLAM::Error>::value(uint64_t result)
{
  __int128 **v1;
  void *exception;
  std::string v3;

  v1 = (__int128 **)result;
  if (!*(_BYTE *)(result + 24))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    memset(&v3, 0, sizeof(v3));
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v3, *v1, v1[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v1[1] - (char *)*v1) >> 3));
    caulk::bad_expected_access<SLAM::Error>::bad_expected_access((uint64_t)exception, (__int128 **)&v3);
  }
  return result;
}

void sub_2145A5C44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  a12 = (void **)&a9;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a12);
  _Unwind_Resume(a1);
}

void sub_2145A6180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void **__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, uint64_t a16, char a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,char a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,char a40)
{
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;

  if (a14 < 0)
    operator delete(__p);
  if (a33)
  {
    __p = &a27;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&__p);
  }
  caulk::__expected_detail::base<gsl::not_null<std::shared_ptr<SLAM::DefaultScriptProvider>>,SLAM::Error>::~base((uint64_t)&a40);
  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100](v46 - 152);
  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100](v46 - 136);

  _Unwind_Resume(a1);
}

uint64_t caulk::__expected_detail::base<gsl::not_null<std::shared_ptr<SLAM::DefaultScriptProvider>>,SLAM::Error>::~base(uint64_t a1)
{
  void **v3;

  if (*(_BYTE *)(a1 + 24))
  {
    std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100](a1);
  }
  else
  {
    v3 = (void **)a1;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v3);
  }
  return a1;
}

void std::__shared_ptr_emplace<SLAM::ObjC::SEHandleShim>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24D1BA790;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<SLAM::ObjC::SEHandleShim>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24D1BA790;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2199D23E0);
}

uint64_t std::__shared_ptr_emplace<SLAM::ObjC::SEHandleShim>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 24) + 8))(a1 + 24);
}

void SLAM::ObjC::SEHandleShim::Transceive(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  void *__p[2];
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  void **v20[3];
  id v21;
  __int128 v22;
  uint64_t v23;
  void **v24;

  v6 = (void *)MEMORY[0x2199D24C4]();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithCXXVector:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 8);
  v21 = 0;
  objc_msgSend(v8, "transceive:error:", v7, &v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v21;
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v9, "asCXXVector");
    *(_OWORD *)a3 = v22;
    *(_QWORD *)(a3 + 16) = v23;
    *(_BYTE *)(a3 + 24) = 1;
  }
  else if (v10)
  {
    objc_msgSend(v10, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "asCXXString");
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      v17 = 0;
    }
    SLAM::Error::Error((std::string **)&v18, (uint64_t)__p);
    v14 = v19;
    v15 = v18;
    v19 = 0;
    v18 = 0uLL;
    v23 = 0;
    v22 = 0uLL;
    v24 = (void **)&v22;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v24);
    *(_OWORD *)a3 = v15;
    *(_QWORD *)(a3 + 16) = v14;
    memset(v20, 0, sizeof(v20));
    *(_BYTE *)(a3 + 24) = 0;
    *(_QWORD *)&v22 = v20;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v22);
    *(_QWORD *)&v22 = &v18;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v22);
    if (SHIBYTE(v17) < 0)
      operator delete(__p[0]);

  }
  else
  {
    SLAM::Error::Unexpected((SLAM::Error *)"%s", (uint64_t)&v22, "Transceive return nil and no error?");
    *(_OWORD *)a3 = v22;
    *(_QWORD *)(a3 + 16) = v23;
    v23 = 0;
    v22 = 0uLL;
    *(_BYTE *)(a3 + 24) = 0;
    v20[0] = (void **)&v22;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v20);
  }

  objc_autoreleasePoolPop(v6);
}

void sub_2145A6518(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  void *v19;
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void SLAM::ObjC::SEHandleShim::~SEHandleShim(id *this)
{

}

{

  JUMPOUT(0x2199D23E0);
}

void std::__shared_ptr_emplace<SLAM::ObjC::LogSinkShim>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24D1BA820;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<SLAM::ObjC::LogSinkShim>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24D1BA820;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2199D23E0);
}

uint64_t std::__shared_ptr_emplace<SLAM::ObjC::LogSinkShim>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 24) + 8))(a1 + 24);
}

void SLAM::ObjC::LogSinkShim::Log(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x2199D24C4]();
  v5 = *(void **)(a1 + 8);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCXXString:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "log:", v6);

  objc_autoreleasePoolPop(v4);
}

void sub_2145A6674(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void SLAM::ObjC::LogSinkShim::~LogSinkShim(id *this)
{

}

{

  JUMPOUT(0x2199D23E0);
}

_QWORD *gsl::not_null<std::shared_ptr<SLAM::SEHandle>>::not_null<std::shared_ptr<SLAM::ObjC::SEHandleShim>,void>(_QWORD *a1, _QWORD *a2)
{
  *a1 = 0;
  a1[1] = 0;
  gsl::not_null<std::shared_ptr<SLAM::SEHandle>>::operator=<std::shared_ptr<SLAM::ObjC::SEHandleShim>,void>((uint64_t)a1, a2);
  return a1;
}

void sub_2145A670C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t gsl::not_null<std::shared_ptr<SLAM::SEHandle>>::operator=<std::shared_ptr<SLAM::ObjC::SEHandleShim>,void>(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  __int128 v10;

  v3 = a2[1];
  *(_QWORD *)&v10 = *a2;
  *((_QWORD *)&v10 + 1) = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  std::shared_ptr<SLAM::SEHandle>::operator=[abi:ne180100]<SLAM::ObjC::SEHandleShim,void>(a1, &v10);
  v6 = (std::__shared_weak_count *)*((_QWORD *)&v10 + 1);
  if (*((_QWORD *)&v10 + 1))
  {
    v7 = (unint64_t *)(*((_QWORD *)&v10 + 1) + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return a1;
}

uint64_t std::shared_ptr<SLAM::SEHandle>::operator=[abi:ne180100]<SLAM::ObjC::SEHandleShim,void>(uint64_t a1, __int128 *a2)
{
  __int128 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;

  v3 = *a2;
  *(_QWORD *)a2 = 0;
  *((_QWORD *)a2 + 1) = 0;
  v4 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v3;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  return a1;
}

_QWORD *gsl::not_null<std::shared_ptr<SLAM::LogSink>>::not_null<std::shared_ptr<SLAM::ObjC::LogSinkShim>,void>(_QWORD *a1, _QWORD *a2)
{
  *a1 = 0;
  a1[1] = 0;
  gsl::not_null<std::shared_ptr<SLAM::SEHandle>>::operator=<std::shared_ptr<SLAM::ObjC::SEHandleShim>,void>((uint64_t)a1, a2);
  return a1;
}

void sub_2145A6838(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

_QWORD *gsl::not_null<std::shared_ptr<SLAM::ScriptProvider>>::not_null<std::shared_ptr<SLAM::DefaultScriptProvider>,void>(_QWORD *a1, _QWORD *a2)
{
  *a1 = 0;
  a1[1] = 0;
  gsl::not_null<std::shared_ptr<SLAM::SEHandle>>::operator=<std::shared_ptr<SLAM::ObjC::SEHandleShim>,void>((uint64_t)a1, a2);
  return a1;
}

void sub_2145A6874(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<SLAM::SEHandle>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void SLAM::DefaultScriptProvider::CreateWithPath(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  std::__shared_weak_count *v3;
  uint64_t v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  std::allocate_shared[abi:ne180100]<SLAM::DefaultScriptProvider,std::allocator<SLAM::DefaultScriptProvider>,std::string &,void>(a1, &v13);
  v4 = v13;
  v3 = v14;
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  if (!v4)
    std::terminate();
  v7 = v14;
  if (v14)
  {
    v8 = (unint64_t *)&v14->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = v3;
  if (v3)
  {
    v10 = (unint64_t *)&v3->__shared_owners_;
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
    *(_BYTE *)(a2 + 24) = 1;
    do
      v12 = __ldaxr(v10);
    while (__stlxr(v12 - 1, v10));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  else
  {
    *(_BYTE *)(a2 + 24) = 1;
  }
}

_QWORD *SLAM::DefaultScriptProvider::DefaultScriptProvider(_QWORD *a1, uint64_t a2)
{
  *a1 = &off_24D1BA8C0;
  applesauce::v1::mapped_file::mapped_file(a1 + 1, a2, 1);
  return a1;
}

_QWORD *SLAM::DefaultScriptProvider::GetScriptByID@<X0>(SLAM::DefaultScriptProvider *this@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *result;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6[0] = &off_24D1BA978;
  v6[1] = &v5;
  v7 = v6;
  SLAM::DefaultScriptProvider::FindScriptMatching((uint64_t)this, (uint64_t)v6, a3);
  result = v7;
  if (v7 == v6)
  {
    v4 = 4;
    result = v6;
  }
  else
  {
    if (!v7)
      return result;
    v4 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v4))();
}

void sub_2145A6B18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v14;
  uint64_t v15;

  v14 = a13;
  if (a13 == &a10)
  {
    v15 = 4;
    v14 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v15 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v14 + 8 * v15))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void SLAM::DefaultScriptProvider::FindScriptMatching(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  std::vector<std::string> *p_p;
  uint64_t v14;
  void ***v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  unsigned int v21;
  unint64_t v22;
  uint64_t v23;
  __int128 v24;
  std::vector<std::string>::pointer end;
  std::string::pointer data;
  __int128 v27;
  std::string __p;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  void *v35[2];
  uint64_t v36;
  _QWORD v37[5];
  std::vector<std::string> v38;
  __n128 (*v39)(__n128 *, __n128 *);
  void (*v40)(uint64_t);
  void *v41;
  _QWORD v42[3];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _OWORD v47[2];
  __int128 v48;
  std::string *v49;
  std::string **v50;
  uint64_t v51;
  __n128 (*v52)(uint64_t, __n128 *);
  void (*v53)(uint64_t);
  uint64_t v54;
  char v55;
  char v56;
  std::string v57;
  __n128 (*v58)(uint64_t, uint64_t);
  uint64_t (*v59)();
  uint64_t v60;
  char v61;
  char v62;
  _QWORD v63[3];
  int v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[2];
  _QWORD v68[7];
  _BYTE v69[24];
  _BYTE *v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  if (v5 < 7
    || (SLAM::DefaultScriptProvider::FindScriptMatching(std::function<BOOL ()(SLAMScriptDERObj const&)>)::plist_header == *(_DWORD *)v6
      ? (v7 = word_254D7B31C == *(_WORD *)(v6 + 4))
      : (v7 = 0),
        !v7))
  {
    v67[0] = *(_QWORD *)(a1 + 8);
    v67[1] = v5;
    v65 = 0u;
    v66 = 0u;
    v8 = DERParseSequence((uint64_t)v67, (unsigned __int16)slamSEFWItemSpecLen, (uint64_t)&slamSEFWItemSpec, (unint64_t)&v65, 0x20uLL);
    if ((_DWORD)v8)
    {
      SLAM::Error::Unexpected((SLAM::Error *)"Failed to parse top level %d", (uint64_t)&v57, v8);
LABEL_18:
      *(std::string *)a3 = v57;
      memset(&v57, 0, sizeof(v57));
      *(_BYTE *)(a3 + 72) = 0;
      *(_QWORD *)&v43 = &v57;
      v15 = (void ***)&v43;
      goto LABEL_19;
    }
    if (*((_QWORD *)&v65 + 1) != 4)
    {
      SLAM::Error::Unexpected((SLAM::Error *)"Unexpected SLAM version length %zu", (uint64_t)&v57, *((_QWORD *)&v65 + 1));
      goto LABEL_18;
    }
    v63[0] = 0;
    v63[1] = v63;
    v63[2] = 0x2020000000;
    v64 = 0;
    v9 = bswap32(*(_DWORD *)v65);
    v64 = v9;
    if ((v9 - 1) >= 2)
    {
      SLAM::Error::Unexpected((SLAM::Error *)"Unexpected SLAM SEFW version %u", (uint64_t)&v57, v9);
      *(std::string *)a3 = v57;
      memset(&v57, 0, sizeof(v57));
      *(_BYTE *)(a3 + 72) = 0;
      *(_QWORD *)&v43 = &v57;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v43);
LABEL_30:
      _Block_object_dispose(v63, 8);
      return;
    }
    v57.__r_.__value_.__r.__words[0] = 0;
    v57.__r_.__value_.__l.__size_ = (std::string::size_type)&v57;
    v57.__r_.__value_.__r.__words[2] = 0xA812000000;
    v58 = __Block_byref_object_copy__0;
    v59 = __Block_byref_object_dispose__0;
    v60 = 0;
    v61 = 0;
    v62 = 0;
    v49 = 0;
    v50 = &v49;
    v51 = 0x5012000000;
    v52 = __Block_byref_object_copy__5;
    v53 = __Block_byref_object_dispose__6;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v10 = MEMORY[0x24BDAC760];
    v68[0] = MEMORY[0x24BDAC760];
    v68[1] = 3321888768;
    v68[2] = ___ZN4SLAM21DefaultScriptProvider18FindScriptMatchingENSt3__18functionIFbRK16SLAMScriptDERObjEEE_block_invoke;
    v68[3] = &unk_24D1BA8E8;
    v11 = v69;
    v68[4] = v63;
    v68[5] = &v49;
    std::__function::__value_func<BOOL ()(SLAMScriptDERObj const&)>::__value_func[abi:ne180100]((uint64_t)v69, a2);
    v68[6] = &v57;
    v12 = DERDecodeSequenceContentWithBlock((unint64_t *)&v66, (uint64_t)v68);
    if ((_DWORD)v12)
    {
      SLAM::Error::Unexpected((SLAM::Error *)"Failed to decode script %d", (uint64_t)&v43, v12);
      *(_OWORD *)a3 = v43;
      *(_QWORD *)(a3 + 16) = v44;
      *(_QWORD *)&v44 = 0;
      v43 = 0uLL;
      *(_BYTE *)(a3 + 72) = 0;
      v38.__begin_ = (std::vector<std::string>::pointer)&v43;
      p_p = &v38;
LABEL_12:
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)p_p);
      goto LABEL_13;
    }
    if (*((_BYTE *)v50 + 72))
    {
      ctu::join<std::__wrap_iter<std::string const*>>(v50[6], v50[7], ", ", 2uLL, &__p);
      SLAM::Error::Error(&v38.__begin_, (uint64_t)&__p);
      v43 = 0uLL;
      *(_QWORD *)&v44 = 0;
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)&v43, (__int128 *)v38.__begin_, (__int128 *)v38.__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)v38.__end_ - (char *)v38.__begin_) >> 3));
      *(_OWORD *)a3 = v43;
      *(_QWORD *)(a3 + 16) = v44;
      *(_QWORD *)&v44 = 0;
      v43 = 0uLL;
      *(_BYTE *)(a3 + 72) = 0;
      v35[0] = &v43;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v35);
      v35[0] = &v38;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v35);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
    else
    {
      if (!*(_BYTE *)(v57.__r_.__value_.__l.__size_ + 160))
      {
        SLAM::Error::Error(&v38, "Could not find script within SEFW");
        v43 = 0uLL;
        *(_QWORD *)&v44 = 0;
        std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)&v43, (__int128 *)v38.__begin_, (__int128 *)v38.__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)v38.__end_ - (char *)v38.__begin_) >> 3));
        *(_OWORD *)a3 = v43;
        *(_QWORD *)(a3 + 16) = v44;
        *(_QWORD *)&v44 = 0;
        v43 = 0uLL;
        *(_BYTE *)(a3 + 72) = 0;
        __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v43;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
        __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v38;
        p_p = (std::vector<std::string> *)&__p;
        goto LABEL_12;
      }
      v16 = *(_OWORD *)(v57.__r_.__value_.__l.__size_ + 96);
      v17 = *(_OWORD *)(v57.__r_.__value_.__l.__size_ + 128);
      v18 = *(_OWORD *)(v57.__r_.__value_.__l.__size_ + 144);
      v47[0] = *(_OWORD *)(v57.__r_.__value_.__l.__size_ + 112);
      v47[1] = v17;
      v48 = v18;
      v19 = *(_OWORD *)(v57.__r_.__value_.__l.__size_ + 64);
      v45 = *(_OWORD *)(v57.__r_.__value_.__l.__size_ + 80);
      v46 = v16;
      v43 = *(_OWORD *)(v57.__r_.__value_.__l.__size_ + 48);
      v44 = v19;
      v38.__begin_ = 0;
      v38.__end_ = (std::vector<std::string>::pointer)&v38;
      v38.__end_cap_.__value_ = (std::string *)0x4812000000;
      v39 = __Block_byref_object_copy__11;
      v40 = __Block_byref_object_dispose__12;
      v41 = &unk_2145ABAC9;
      memset(v42, 0, sizeof(v42));
      v37[0] = v10;
      v37[1] = 3221225472;
      v37[2] = ___ZN4SLAM21DefaultScriptProvider18FindScriptMatchingENSt3__18functionIFbRK16SLAMScriptDERObjEEE_block_invoke_13;
      v37[3] = &unk_24D1BA920;
      v37[4] = &v38;
      v20 = DERDecodeSequenceContentWithBlock((unint64_t *)v47, (uint64_t)v37);
      if ((_DWORD)v20)
      {
        SLAM::Error::Unexpected((SLAM::Error *)"Failed to decode APDUs %d", (uint64_t)&__p, v20);
        *(std::string *)a3 = __p;
        memset(&__p, 0, sizeof(__p));
        *(_BYTE *)(a3 + 72) = 0;
        v35[0] = &__p;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v35);
      }
      else
      {
        v35[1] = 0;
        v36 = 0;
        v35[0] = 0;
        std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v35, (const void *)v45, v45 + *((_QWORD *)&v45 + 1), *((size_t *)&v45 + 1));
        v21 = v48;
        if ((_QWORD)v48)
          v21 = bswap32(*(_DWORD *)v48);
        v22 = bswap64(*(_QWORD *)v43);
        v23 = v36;
        v24 = *(_OWORD *)v35;
        v35[1] = 0;
        v36 = 0;
        v35[0] = 0;
        end = v38.__end_;
        data = v38.__end_[2].__r_.__value_.__l.__data_;
        v27 = *(_OWORD *)&v38.__end_[2].__r_.__value_.__r.__words[1];
        *(_OWORD *)(a3 + 48) = v27;
        end[2].__r_.__value_.__l.__size_ = 0;
        end[2].__r_.__value_.__r.__words[2] = 0;
        end[2].__r_.__value_.__r.__words[0] = 0;
        v34 = v21;
        *(_QWORD *)a3 = v22;
        *(_OWORD *)(a3 + 8) = v24;
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v22;
        __p.__r_.__value_.__r.__words[2] = 0;
        v29 = 0;
        *(_QWORD *)(a3 + 24) = v23;
        *(_QWORD *)(a3 + 32) = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v27 - (_QWORD)data) >> 3);
        *(_QWORD *)(a3 + 40) = data;
        v30 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v27 - (_QWORD)data) >> 3);
        v31 = 0;
        v32 = 0;
        v33 = 0;
        *(_DWORD *)(a3 + 64) = v21;
        *(_BYTE *)(a3 + 72) = 1;
        SLAM::Script::~Script((SLAM::Script *)&__p);
        if (v35[0])
        {
          v35[1] = v35[0];
          operator delete(v35[0]);
        }
      }
      _Block_object_dispose(&v38, 8);
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v42;
      std::vector<std::vector<unsigned char>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
    }
LABEL_13:
    if (v70 == v69)
    {
      v14 = 4;
    }
    else
    {
      if (!v70)
      {
LABEL_27:
        _Block_object_dispose(&v49, 8);
        if (v56)
        {
          *(_QWORD *)&v43 = &v55;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v43);
        }
        _Block_object_dispose(&v57, 8);
        goto LABEL_30;
      }
      v14 = 5;
      v11 = v70;
    }
    (*(void (**)(_QWORD *))(*v11 + 8 * v14))(v11);
    goto LABEL_27;
  }
  SLAM::Error::Error((std::vector<std::string> *)&v43, "Legacy (plist) SLAM SEFW path is no longer supported");
  memset(&v57, 0, sizeof(v57));
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v57, (__int128 *)v43, *((__int128 **)&v43 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v43 + 1) - v43) >> 3));
  *(std::string *)a3 = v57;
  memset(&v57, 0, sizeof(v57));
  *(_BYTE *)(a3 + 72) = 0;
  v49 = &v57;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v49);
  v49 = (std::string *)&v43;
  v15 = (void ***)&v49;
LABEL_19:
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v15);
}

void sub_2145A71C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62,int a63)
{
  __int16 a64;
  _QWORD *v64;
  uint64_t v65;
  _QWORD *v67;
  uint64_t v68;

  _Block_object_dispose(&a30, 8);
  std::vector<std::vector<unsigned char>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  v67 = *(_QWORD **)(v65 - 80);
  if (v67 == v64)
  {
    v68 = 4;
  }
  else
  {
    if (!v67)
      goto LABEL_6;
    v68 = 5;
    v64 = *(_QWORD **)(v65 - 80);
  }
  (*(void (**)(_QWORD *))(*v64 + 8 * v68))(v64);
LABEL_6:
  _Block_object_dispose(&a53, 8);
  if (a62)
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a39);
  _Block_object_dispose(&a64, 8);
  _Block_object_dispose((const void *)(v65 - 240), 8);
  _Unwind_Resume(a1);
}

_QWORD *SLAM::DefaultScriptProvider::GetScript@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  _QWORD *v9;
  _QWORD *result;
  uint64_t v11;
  int v12;
  _BYTE v13[24];
  _BYTE *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v9 = operator new(0x20uLL);
  *v9 = &off_24D1BAA08;
  v9[1] = a2;
  v9[2] = a3;
  v9[3] = &v12;
  v14 = v9;
  SLAM::DefaultScriptProvider::FindScriptMatching(a1, (uint64_t)v13, a5);
  result = v14;
  if (v14 == v13)
  {
    v11 = 4;
    result = v13;
  }
  else
  {
    if (!v14)
      return result;
    v11 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v11))();
}

void sub_2145A73B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v13;
  char *v15;
  uint64_t v16;

  v15 = a13;
  if (a13 == v13)
  {
    v16 = 4;
    v15 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v16 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v15 + 8 * v16))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

__n128 __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  v2 = *(_OWORD *)(a2 + 48);
  v3 = *(_OWORD *)(a2 + 64);
  v4 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v4;
  *(_OWORD *)(a1 + 48) = v2;
  *(_OWORD *)(a1 + 64) = v3;
  result = *(__n128 *)(a2 + 112);
  v6 = *(_OWORD *)(a2 + 128);
  v7 = *(_OWORD *)(a2 + 144);
  *(_BYTE *)(a1 + 160) = *(_BYTE *)(a2 + 160);
  *(_OWORD *)(a1 + 128) = v6;
  *(_OWORD *)(a1 + 144) = v7;
  *(__n128 *)(a1 + 112) = result;
  return result;
}

__n128 __Block_byref_object_copy__5(uint64_t a1, __n128 *a2)
{
  __n128 result;

  *(_BYTE *)(a1 + 48) = 0;
  *(_BYTE *)(a1 + 72) = 0;
  if (a2[4].n128_u8[8])
  {
    *(_QWORD *)(a1 + 48) = 0;
    *(_QWORD *)(a1 + 56) = 0;
    *(_QWORD *)(a1 + 64) = 0;
    result = a2[3];
    *(__n128 *)(a1 + 48) = result;
    *(_QWORD *)(a1 + 64) = a2[4].n128_u64[0];
    a2[3].n128_u64[0] = 0;
    a2[3].n128_u64[1] = 0;
    a2[4].n128_u64[0] = 0;
    *(_BYTE *)(a1 + 72) = 1;
  }
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
  void **v1;

  if (*(_BYTE *)(a1 + 72))
  {
    v1 = (void **)(a1 + 48);
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v1);
  }
}

void sub_2145A75E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  uint64_t v16;
  uint64_t v17;

  *(_QWORD *)(v17 - 40) = v16;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v17 - 40));
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_ea8_56c46_ZTSNSt3__18functionIFbRK16SLAMScriptDERObjEEE(uint64_t a1, uint64_t a2)
{
  return std::__function::__value_func<BOOL ()(SLAMScriptDERObj const&)>::__value_func[abi:ne180100](a1 + 56, a2 + 56);
}

_QWORD *__destroy_helper_block_ea8_56c46_ZTSNSt3__18functionIFbRK16SLAMScriptDERObjEEE(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 56);
  result = *(_QWORD **)(a1 + 80);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

__n128 __Block_byref_object_copy__11(__n128 *a1, __n128 *a2)
{
  __n128 result;

  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
  void **v1;

  v1 = (void **)(a1 + 48);
  std::vector<std::vector<unsigned char>>::__destroy_vector::operator()[abi:ne180100](&v1);
}

uint64_t ___ZN4SLAM21DefaultScriptProvider18FindScriptMatchingENSt3__18functionIFbRK16SLAMScriptDERObjEEE_block_invoke_13(uint64_t a1, _QWORD *a2)
{
  uint64_t *v2;
  const void **v3;
  size_t v4;
  const void *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;

  if (*a2 != 4)
    return 2;
  v2 = *(uint64_t **)(*(_QWORD *)(a1 + 32) + 8);
  v5 = (const void *)a2[1];
  v4 = a2[2];
  v3 = (const void **)(a2 + 1);
  v9 = (uint64_t)v5 + v4;
  v6 = (_QWORD *)v2[7];
  if ((unint64_t)v6 >= v2[8])
  {
    v7 = std::vector<std::vector<unsigned char>>::__emplace_back_slow_path<unsigned char *&,unsigned char *>(v2 + 6, v3, &v9);
  }
  else
  {
    *v6 = 0;
    v6[1] = 0;
    v6[2] = 0;
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v6, v5, (uint64_t)v5 + v4, v4);
    v7 = (uint64_t)(v6 + 3);
    v2[7] = (uint64_t)(v6 + 3);
  }
  result = 0;
  v2[7] = v7;
  return result;
}

void sub_2145A7730(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 56) = v1;
  _Unwind_Resume(a1);
}

void SLAM::Script::~Script(SLAM::Script *this)
{
  void *v2;
  void **v3;

  v3 = (void **)((char *)this + 40);
  std::vector<std::vector<unsigned char>>::__destroy_vector::operator()[abi:ne180100](&v3);
  v2 = (void *)*((_QWORD *)this + 1);
  if (v2)
  {
    *((_QWORD *)this + 2) = v2;
    operator delete(v2);
  }
}

void SLAM::DefaultScriptProvider::~DefaultScriptProvider(SLAM::DefaultScriptProvider *this)
{
  void *v2;

  *(_QWORD *)this = &off_24D1BA8C0;
  v2 = (void *)*((_QWORD *)this + 1);
  if (v2)
    munmap(v2, *((_QWORD *)this + 2));
  *((_QWORD *)this + 2) = 0;
}

{
  void *v2;

  *(_QWORD *)this = &off_24D1BA8C0;
  v2 = (void *)*((_QWORD *)this + 1);
  if (v2)
    munmap(v2, *((_QWORD *)this + 2));
  *((_QWORD *)this + 2) = 0;
  JUMPOUT(0x2199D23E0);
}

_QWORD *applesauce::v1::mapped_file::mapped_file(_QWORD *a1, uint64_t a2, __int16 a3)
{
  const char *v6;
  int v7;
  int v8;
  unint64_t st_size;
  int v10;
  int v11;
  void *v12;
  std::ios_base::failure *exception;
  int *v15;
  std::ios_base::failure *v16;
  int *v17;
  std::ios_base::failure *v18;
  int *v19;
  const void *v20;
  int v21;
  stat v22;

  *a1 = 0;
  a1[1] = 0;
  if (*(char *)(a2 + 23) >= 0)
    v6 = (const char *)a2;
  else
    v6 = *(const char **)a2;
  v7 = open(v6, 0);
  if (v7 < 0)
  {
    exception = (std::ios_base::failure *)__cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(&v22, "open()");
    v15 = __error();
    __cxa_throw(exception, MEMORY[0x24BEDB710], MEMORY[0x24BEDB570]);
  }
  v8 = v7;
  if (fstat(v7, &v22) < 0)
  {
    v16 = (std::ios_base::failure *)__cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(&v20, "fstat()");
    v17 = __error();
    __cxa_throw(v16, MEMORY[0x24BEDB710], MEMORY[0x24BEDB570]);
  }
  st_size = v22.st_size;
  a1[1] = v22.st_size;
  if ((a3 & 1) != 0)
  {
    v10 = 0x7FFFFFFF;
    if (st_size < 0x7FFFFFFF)
      v10 = st_size;
    v21 = v10;
    v20 = 0;
    fcntl(v8, 44, &v20);
    st_size = a1[1];
  }
  if ((a3 & 0x100) != 0)
    v11 = 1;
  else
    v11 = 1025;
  v12 = mmap(0, st_size, 1, v11, v8, 0);
  *a1 = v12;
  if (v12 == (void *)-1)
  {
    v18 = (std::ios_base::failure *)__cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(&v20, "mmap()");
    v19 = __error();
    __cxa_throw(v18, MEMORY[0x24BEDB710], MEMORY[0x24BEDB570]);
  }
  close(v8);
  return a1;
}

void sub_2145A79F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  int v21;
  void *v22;
  int v23;

  if (a15 < 0)
  {
    operator delete(__p);
    if ((v23 & 1) == 0)
    {
LABEL_6:
      close(v21);
      _Unwind_Resume(a1);
    }
  }
  else if (!v23)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v22);
  goto LABEL_6;
}

void applesauce::v1::`anonymous namespace'::io_failure_exception(const void **a1@<X0>, uint64_t a2@<X1>, unsigned int a3@<W2>, std::ios_base::failure *a4@<X8>)
{
  size_t v8;
  std::string *v9;
  const void *v10;
  int v11;
  const std::string::value_type *v12;
  std::string::size_type v13;
  std::string *v14;
  __int128 v15;
  std::string *v16;
  __int128 v17;
  std::error_code __ec;
  std::string v19;
  std::string v20;
  std::string __msg;

  if (*((char *)a1 + 23) >= 0)
    v8 = *((unsigned __int8 *)a1 + 23);
  else
    v8 = (size_t)a1[1];
  v9 = &v19;
  std::string::basic_string[abi:ne180100]((uint64_t)&v19, v8 + 13);
  if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v9 = (std::string *)v19.__r_.__value_.__r.__words[0];
  if (v8)
  {
    if (*((char *)a1 + 23) >= 0)
      v10 = a1;
    else
      v10 = *a1;
    memmove(v9, v10, v8);
  }
  strcpy((char *)v9 + v8, " failed for '");
  v11 = *(char *)(a2 + 23);
  if (v11 >= 0)
    v12 = (const std::string::value_type *)a2;
  else
    v12 = *(const std::string::value_type **)a2;
  if (v11 >= 0)
    v13 = *(unsigned __int8 *)(a2 + 23);
  else
    v13 = *(_QWORD *)(a2 + 8);
  v14 = std::string::append(&v19, v12, v13);
  v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  v20.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v20.__r_.__value_.__l.__data_ = v15;
  v14->__r_.__value_.__l.__size_ = 0;
  v14->__r_.__value_.__r.__words[2] = 0;
  v14->__r_.__value_.__r.__words[0] = 0;
  v16 = std::string::append(&v20, "'");
  v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
  __msg.__r_.__value_.__r.__words[2] = v16->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__msg.__r_.__value_.__l.__data_ = v17;
  v16->__r_.__value_.__l.__size_ = 0;
  v16->__r_.__value_.__r.__words[2] = 0;
  v16->__r_.__value_.__r.__words[0] = 0;
  *(_QWORD *)&__ec.__val_ = a3;
  __ec.__cat_ = std::generic_category();
  std::ios_base::failure::failure(a4, &__msg, &__ec);
  if (SHIBYTE(__msg.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__msg.__r_.__value_.__l.__data_);
  if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v20.__r_.__value_.__l.__data_);
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v19.__r_.__value_.__l.__data_);
}

void sub_2145A7BE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a30 < 0)
    operator delete(__p);
  if (a23 < 0)
    operator delete(a18);
  if (a17 < 0)
    operator delete(a12);
  _Unwind_Resume(exception_object);
}

uint64_t std::string::basic_string[abi:ne180100](uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a2 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (a2 > 0x16)
  {
    v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17)
      v4 = a2 | 7;
    v5 = v4 + 1;
    v6 = operator new(v4 + 1);
    *(_QWORD *)(a1 + 8) = a2;
    *(_QWORD *)(a1 + 16) = v5 | 0x8000000000000000;
    *(_QWORD *)a1 = v6;
  }
  else
  {
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)a1 = 0;
    *(_BYTE *)(a1 + 23) = a2;
  }
  return a1;
}

_QWORD *std::allocate_shared[abi:ne180100]<SLAM::DefaultScriptProvider,std::allocator<SLAM::DefaultScriptProvider>,std::string &,void>@<X0>(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  _QWORD *v4;
  _QWORD *result;

  v4 = operator new(0x30uLL);
  result = std::__shared_ptr_emplace<SLAM::DefaultScriptProvider>::__shared_ptr_emplace[abi:ne180100]<std::string &,std::allocator<SLAM::DefaultScriptProvider>,0>(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_2145A7CF8(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__shared_ptr_emplace<SLAM::DefaultScriptProvider>::__shared_ptr_emplace[abi:ne180100]<std::string &,std::allocator<SLAM::DefaultScriptProvider>,0>(_QWORD *a1, uint64_t a2)
{
  char v4;

  a1[1] = 0;
  a1[2] = 0;
  *a1 = &off_24D1BA560;
  std::allocator<SLAM::DefaultScriptProvider>::construct[abi:ne180100]<SLAM::DefaultScriptProvider,std::string &>((uint64_t)&v4, a1 + 3, a2);
  return a1;
}

void sub_2145A7D54(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::allocator<SLAM::DefaultScriptProvider>::construct[abi:ne180100]<SLAM::DefaultScriptProvider,std::string &>(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  std::string __p;

  if (*(char *)(a3 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
  else
    __p = *(std::string *)a3;
  *a2 = &off_24D1BA8C0;
  applesauce::v1::mapped_file::mapped_file(a2 + 1, (uint64_t)&__p, 1);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_2145A7DE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__function::__func<SLAM::DefaultScriptProvider::GetScriptByID(unsigned long long)::$_0,std::allocator<SLAM::DefaultScriptProvider::GetScriptByID(unsigned long long)::$_0>,BOOL ()(SLAMScriptDERObj const&)>::~__func()
{
  JUMPOUT(0x2199D23E0);
}

_QWORD *std::__function::__func<SLAM::DefaultScriptProvider::GetScriptByID(unsigned long long)::$_0,std::allocator<SLAM::DefaultScriptProvider::GetScriptByID(unsigned long long)::$_0>,BOOL ()(SLAMScriptDERObj const&)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24D1BA978;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<SLAM::DefaultScriptProvider::GetScriptByID(unsigned long long)::$_0,std::allocator<SLAM::DefaultScriptProvider::GetScriptByID(unsigned long long)::$_0>,BOOL ()(SLAMScriptDERObj const&)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24D1BA978;
  a2[1] = v2;
  return result;
}

BOOL std::__function::__func<SLAM::DefaultScriptProvider::GetScriptByID(unsigned long long)::$_0,std::allocator<SLAM::DefaultScriptProvider::GetScriptByID(unsigned long long)::$_0>,BOOL ()(SLAMScriptDERObj const&)>::operator()(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 8) == 8 && bswap64(**(_QWORD **)a2) == **(_QWORD **)(a1 + 8);
}

uint64_t std::__function::__func<SLAM::DefaultScriptProvider::GetScriptByID(unsigned long long)::$_0,std::allocator<SLAM::DefaultScriptProvider::GetScriptByID(unsigned long long)::$_0>,BOOL ()(SLAMScriptDERObj const&)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<SLAM::DefaultScriptProvider::GetScriptByID(unsigned long long)::$_0,std::allocator<SLAM::DefaultScriptProvider::GetScriptByID(unsigned long long)::$_0>,BOOL ()(SLAMScriptDERObj const&)>::target_type()
{
}

void std::__function::__func<SLAM::DefaultScriptProvider::GetScript(std::string,std::vector<unsigned char>,SLAM::PlatformCategory)::$_0,std::allocator<SLAM::DefaultScriptProvider::GetScript(std::string,std::vector<unsigned char>,SLAM::PlatformCategory)::$_0>,BOOL ()(SLAMScriptDERObj const&)>::~__func()
{
  JUMPOUT(0x2199D23E0);
}

__n128 std::__function::__func<SLAM::DefaultScriptProvider::GetScript(std::string,std::vector<unsigned char>,SLAM::PlatformCategory)::$_0,std::allocator<SLAM::DefaultScriptProvider::GetScript(std::string,std::vector<unsigned char>,SLAM::PlatformCategory)::$_0>,BOOL ()(SLAMScriptDERObj const&)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x20uLL);
  *(_QWORD *)v2 = &off_24D1BAA08;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((_QWORD *)v2 + 3) = *(_QWORD *)(a1 + 24);
  return result;
}

__n128 std::__function::__func<SLAM::DefaultScriptProvider::GetScript(std::string,std::vector<unsigned char>,SLAM::PlatformCategory)::$_0,std::allocator<SLAM::DefaultScriptProvider::GetScript(std::string,std::vector<unsigned char>,SLAM::PlatformCategory)::$_0>,BOOL ()(SLAMScriptDERObj const&)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_24D1BAA08;
  result = *(__n128 *)(a1 + 8);
  *(_QWORD *)(a2 + 24) = *(_QWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

BOOL std::__function::__func<SLAM::DefaultScriptProvider::GetScript(std::string,std::vector<unsigned char>,SLAM::PlatformCategory)::$_0,std::allocator<SLAM::DefaultScriptProvider::GetScript(std::string,std::vector<unsigned char>,SLAM::PlatformCategory)::$_0>,BOOL ()(SLAMScriptDERObj const&)>::operator()(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  size_t v5;
  _QWORD *v6;
  size_t v7;
  uint64_t v8;

  if (*(_QWORD *)(a2 + 88) == 4)
    v4 = bswap32(**(_DWORD **)(a2 + 80));
  else
    v4 = 1;
  v5 = *(_QWORD *)(a2 + 24);
  v6 = *(_QWORD **)(a1 + 8);
  if (*((char *)v6 + 23) < 0)
  {
    if (v5 != v6[1])
      return 0;
    v6 = (_QWORD *)*v6;
  }
  else if (v5 != *((unsigned __int8 *)v6 + 23))
  {
    return 0;
  }
  if (memcmp(v6, *(const void **)(a2 + 16), v5))
    return 0;
  v7 = *(_QWORD *)(a2 + 40);
  v8 = *(_QWORD *)(a1 + 16);
  if (v7 != *(_QWORD *)(v8 + 8) - *(_QWORD *)v8 || memcmp(*(const void **)v8, *(const void **)(a2 + 32), v7))
    return 0;
  return !v4 || **(_DWORD **)(a1 + 24) == v4;
}

uint64_t std::__function::__func<SLAM::DefaultScriptProvider::GetScript(std::string,std::vector<unsigned char>,SLAM::PlatformCategory)::$_0,std::allocator<SLAM::DefaultScriptProvider::GetScript(std::string,std::vector<unsigned char>,SLAM::PlatformCategory)::$_0>,BOOL ()(SLAMScriptDERObj const&)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<SLAM::DefaultScriptProvider::GetScript(std::string,std::vector<unsigned char>,SLAM::PlatformCategory)::$_0,std::allocator<SLAM::DefaultScriptProvider::GetScript(std::string,std::vector<unsigned char>,SLAM::PlatformCategory)::$_0>,BOOL ()(SLAMScriptDERObj const&)>::target_type()
{
}

uint64_t std::__function::__value_func<BOOL ()(SLAMScriptDERObj const&)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(_QWORD *)(a1 + 24) = a1;
      (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a2 + 24) + 24))(*(_QWORD *)(a2 + 24), a1);
    }
    else
    {
      *(_QWORD *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3);
    }
  }
  else
  {
    *(_QWORD *)(a1 + 24) = 0;
  }
  return a1;
}

uint64_t std::vector<std::vector<unsigned char>>::__emplace_back_slow_path<unsigned char *&,unsigned char *>(uint64_t *a1, const void **a2, uint64_t *a3)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  const void *v14;
  uint64_t v15;
  size_t v16;
  uint64_t v17;
  _QWORD v19[2];
  char *v20;
  char *v21;
  uint64_t *v22;

  v4 = *a1;
  v5 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  v6 = v5 + 1;
  if (v5 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  v9 = (uint64_t)(a1 + 2);
  v10 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v4) >> 3);
  if (2 * v10 > v6)
    v6 = 2 * v10;
  if (v10 >= 0x555555555555555)
    v11 = 0xAAAAAAAAAAAAAAALL;
  else
    v11 = v6;
  v22 = a1 + 2;
  if (v11)
    v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v9, v11);
  else
    v12 = 0;
  v13 = &v12[24 * v5];
  v19[0] = v12;
  v19[1] = v13;
  v20 = v13;
  v21 = &v12[24 * v11];
  v14 = *a2;
  v15 = *a3;
  v16 = *a3 - (_QWORD)*a2;
  *(_QWORD *)v13 = 0;
  *((_QWORD *)v13 + 1) = 0;
  *((_QWORD *)v13 + 2) = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v13, v14, v15, v16);
  v20 += 24;
  std::vector<std::vector<unsigned char>>::__swap_out_circular_buffer(a1, v19);
  v17 = a1[1];
  std::__split_buffer<std::vector<unsigned char>>::~__split_buffer((uint64_t)v19);
  return v17;
}

void sub_2145A81D4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::vector<unsigned char>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::vector<unsigned char>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<unsigned char>>,std::reverse_iterator<std::vector<unsigned char>*>,std::reverse_iterator<std::vector<unsigned char>*>,std::reverse_iterator<std::vector<unsigned char>*>>((uint64_t)(a1 + 2), a1[1], (_QWORD *)a1[1], *a1, (_QWORD *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<unsigned char>>,std::reverse_iterator<std::vector<unsigned char>*>,std::reverse_iterator<std::vector<unsigned char>*>,std::reverse_iterator<std::vector<unsigned char>*>>(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  _QWORD v11[3];
  char v12;
  __int128 v13;
  __int128 v14;

  v7 = a7;
  *(_QWORD *)&v14 = a6;
  *((_QWORD *)&v14 + 1) = a7;
  v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    v9 = a6;
  }
  else
  {
    do
    {
      *(_QWORD *)(v7 - 24) = 0;
      *(_QWORD *)(v7 - 16) = 0;
      *(_QWORD *)(v7 - 8) = 0;
      v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(_QWORD *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      v7 = *((_QWORD *)&v14 + 1) - 24;
      *((_QWORD *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    v9 = v14;
  }
  v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<unsigned char>>,std::reverse_iterator<std::vector<unsigned char>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<unsigned char>>,std::reverse_iterator<std::vector<unsigned char>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<unsigned char>>,std::reverse_iterator<std::vector<unsigned char>*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<unsigned char>>,std::reverse_iterator<std::vector<unsigned char>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    v3 = *(void **)v1;
    if (*(_QWORD *)v1)
    {
      *(_QWORD *)(v1 + 8) = v3;
      operator delete(v3);
    }
    v1 += 24;
  }
}

uint64_t std::__split_buffer<std::vector<unsigned char>>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<std::vector<unsigned char>>::__destruct_at_end[abi:ne180100](a1, *(_QWORD *)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<std::vector<unsigned char>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;

  v2 = *(_QWORD *)(a1 + 16);
  while (v2 != a2)
  {
    v5 = *(void **)(v2 - 24);
    *(_QWORD *)(a1 + 16) = v2 - 24;
    if (v5)
    {
      *(_QWORD *)(v2 - 16) = v5;
      operator delete(v5);
      v2 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
}

uint64_t DERDecodeItem(uint64_t a1, unint64_t *a2)
{
  return DERDecodeItemPartialBufferGetLength(a1, a2, 0);
}

uint64_t DERDecodeItemPartialBufferGetLength(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  unsigned __int8 *v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  BOOL v10;
  unint64_t v11;
  char *v12;
  unsigned __int8 v13;
  _BYTE *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unsigned int v24;
  BOOL v25;
  char v26;
  unint64_t v27;
  _BYTE *v28;

  v3 = *(_QWORD *)(result + 8);
  if (v3 < 2)
    return 3;
  v4 = *(_BYTE **)result;
  if (*(_QWORD *)result == -1)
    goto LABEL_68;
  v5 = &v4[v3];
  v6 = v4 + 1;
  v7 = v3 - 1;
  v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4)
        goto LABEL_69;
      v14 = v12 + 1;
      v15 = *v12;
      v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15)
            v17 = *v12;
          else
            v17 = v7 - 1;
          v10 = v5 >= v14;
          v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3)
              return 0;
LABEL_34:
            result = 0;
            *a3 = v15;
            return result;
          }
LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }
        return 3;
      }
      v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8)
        return 3;
      if ((v15 & 0x7F) == 0 || v16 < v19)
        return 3;
      if (v14 >= v5 || v14 < v4)
        goto LABEL_69;
      if (!*v14)
        return 3;
      v15 = 0;
      v21 = (v19 - 1);
      v22 = v7 - v21 - 2;
      v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (_BYTE *)-1)
      {
        if (v14 >= v5)
          goto LABEL_69;
        v10 = v16-- != 0;
        if (!v10)
          goto LABEL_70;
        v24 = *v14++;
        v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!(_DWORD)v19)
        {
          if (a3)
            v25 = 0;
          else
            v25 = v15 > v22;
          v26 = v25;
          result = 3;
          if (v15 < 0x80 || (v26 & 1) != 0)
            return result;
          if (v15 >= v22)
            v27 = v22;
          else
            v27 = v15;
          v10 = (unint64_t)v5 >= v23;
          v28 = &v5[-v23];
          if (!v10 || (unint64_t)v4 > v23 || v27 > (unint64_t)v28)
            goto LABEL_69;
          a2[1] = v23;
          a2[2] = v27;
          if (a3)
            goto LABEL_34;
          return 0;
        }
      }
    }
LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }
  v9 = *v6;
  v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10)
    return 3;
  v8 = 0;
  result = 3;
  while (v7 >= 2)
  {
    v11 = v8;
    if (v8 >> 57)
      break;
    if (v6 == (unsigned __int8 *)-1)
      goto LABEL_68;
    if (v6 >= v5 || v6 < v4)
      goto LABEL_69;
    v12 = (char *)(v6 + 1);
    --v7;
    v13 = *v6;
    v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54)
        return 3;
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERDecodeItemPartialBuffer(uint64_t result, unint64_t *a2, int a3)
{
  unint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  unsigned __int8 *v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  BOOL v10;
  unint64_t v11;
  char *v12;
  unsigned __int8 v13;
  _BYTE *v14;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  unint64_t v22;
  unsigned int v23;
  char v24;

  v3 = *(_QWORD *)(result + 8);
  if (v3 < 2)
    return 3;
  v4 = *(_BYTE **)result;
  if (*(_QWORD *)result == -1)
    goto LABEL_54;
  v5 = &v4[v3];
  v6 = v4 + 1;
  v7 = v3 - 1;
  v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4)
        goto LABEL_55;
      v14 = v12 + 1;
      v15 = *v12;
      v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        v17 = v16 < v15 && a3 == 0;
        v18 = (unint64_t)(v12 + 1);
        if (v17)
          return 3;
LABEL_28:
        if (v15 > (~v18 & 0x7FFFFFFFFFFFFFFFLL))
          return 7;
        if (v18 <= v18 + v15)
        {
          result = 0;
          a2[1] = v18;
          a2[2] = v15;
          return result;
        }
        goto LABEL_55;
      }
      v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8)
        return 3;
      if ((v15 & 0x7F) == 0 || v16 < v19)
        return 3;
      if (v14 >= v5 || v14 < v4)
      {
LABEL_55:
        __break(0x5519u);
LABEL_56:
        __break(0x5515u);
        return result;
      }
      if (!*v14)
        return 3;
      v15 = 0;
      v21 = (v19 - 1);
      v22 = v7 - v21 - 2;
      v18 = (unint64_t)&v12[v21 + 2];
      while (v14 != (_BYTE *)-1)
      {
        if (v14 >= v5)
          goto LABEL_55;
        v10 = v16-- != 0;
        if (!v10)
          goto LABEL_56;
        v23 = *v14++;
        v15 = (v15 << 8) | v23;
        LODWORD(v19) = v19 - 1;
        if (!(_DWORD)v19)
        {
          if (v15 <= v22)
            v24 = 1;
          else
            v24 = a3;
          result = 3;
          if (v15 >= 0x80 && (v24 & 1) != 0)
            goto LABEL_28;
          return result;
        }
      }
    }
LABEL_54:
    __break(0x5513u);
    goto LABEL_55;
  }
  v9 = *v6;
  v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10)
    return 3;
  v8 = 0;
  result = 3;
  while (v7 >= 2)
  {
    v11 = v8;
    if (v8 >> 57)
      break;
    if (v6 == (unsigned __int8 *)-1)
      goto LABEL_54;
    if (v6 >= v5 || v6 < v4)
      goto LABEL_55;
    v12 = (char *)(v6 + 1);
    --v7;
    v13 = *v6;
    v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54)
        return 3;
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERParseBitString(uint64_t result, unint64_t *a2, _BYTE *a3)
{
  unsigned int v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 *v8;
  unint64_t v10;

  *a3 = 0;
  *a2 = 0;
  a2[1] = 0;
  if (!*(_QWORD *)(result + 8))
    return 3;
  v3 = **(unsigned __int8 **)result;
  *a3 = v3;
  v4 = *(_QWORD *)(result + 8);
  if (v4 != 1)
  {
    if (v3 <= 7)
    {
      v5 = v4 - 1;
      if (!v4)
      {
LABEL_20:
        __break(0x5515u);
        goto LABEL_21;
      }
      v6 = *(_QWORD *)result;
      v7 = *(_QWORD *)result + v4;
      v8 = (unsigned __int8 *)(*(_QWORD *)result + v5);
      if ((unint64_t)v8 >= v7 || (unint64_t)v8 < v6)
      {
LABEL_19:
        __break(0x5519u);
        goto LABEL_20;
      }
      if (((0xFFu >> (8 - v3)) & *v8) == 0)
      {
        if (v6 == -1)
        {
LABEL_21:
          __break(0x5513u);
          return result;
        }
        v10 = v6 + 1;
        if (v6 + 1 <= v7 && v6 <= v10)
        {
          result = 0;
          *a2 = v10;
          a2[1] = v5;
          return result;
        }
        goto LABEL_19;
      }
    }
    return 3;
  }
  if (v3)
    return 3;
  else
    return 0;
}

uint64_t DERParseBoolean(unsigned __int8 **a1, BOOL *a2)
{
  int v2;
  uint64_t result;

  if (a1[1] != (unsigned __int8 *)1)
    return 3;
  v2 = **a1;
  if (v2 != 255 && v2 != 0)
    return 3;
  result = 0;
  *a2 = v2 != 0;
  return result;
}

uint64_t DERParseBooleanWithDefault(unsigned __int8 **a1, BOOL a2, BOOL *a3)
{
  unsigned __int8 *v3;
  int v4;
  uint64_t result;

  v3 = a1[1];
  if (!v3)
    goto LABEL_9;
  if (v3 == (unsigned __int8 *)1)
  {
    v4 = **a1;
    if (v4 == 255 || v4 == 0)
    {
      a2 = v4 != 0;
LABEL_9:
      result = 0;
      *a3 = a2;
      return result;
    }
  }
  return 3;
}

uint64_t DERParseInteger(char **a1, _DWORD *a2)
{
  uint64_t result;
  unint64_t v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  result = DERParseInteger64(a1, v4);
  if (!(_DWORD)result)
  {
    if (HIDWORD(v4[0]))
    {
      return 7;
    }
    else
    {
      result = 0;
      *a2 = v4[0];
    }
  }
  return result;
}

uint64_t DERParseInteger64(char **a1, unint64_t *a2)
{
  unint64_t v2;
  unsigned __int8 *v3;
  uint64_t result;
  unint64_t v5;
  unsigned int v6;

  v2 = (unint64_t)a1[1];
  if (!v2)
    return 3;
  v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0)
    return 3;
  if (**a1)
  {
    if (v2 > 8)
      return 7;
    goto LABEL_10;
  }
  if (v2 >= 2)
  {
    if (((char)v3[1] & 0x80000000) == 0)
      return 3;
    if (v2 > 9)
      return 7;
  }
LABEL_10:
  v5 = 0;
  do
  {
    v6 = *v3++;
    v5 = v6 | (v5 << 8);
    --v2;
  }
  while (v2);
  result = 0;
  *a2 = v5;
  return result;
}

uint64_t DERDecodeSeqInit(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  memset(v8, 170, 24);
  result = DERDecodeItemPartialBufferGetLength(a1, v8, 0);
  if (!(_DWORD)result)
  {
    v6 = v8[0];
    *a2 = v8[0];
    if (v6 >> 1 == 0x1000000000000008)
    {
      if (__CFADD__(v8[1], v8[2]))
      {
        __break(0x5513u);
      }
      else
      {
        v7 = v8[1] + v8[2];
        if (v8[1] <= v8[1] + v8[2])
        {
          result = 0;
          *a3 = v8[1];
          a3[1] = v7;
          return result;
        }
      }
      __break(0x5519u);
    }
    else
    {
      return 2;
    }
  }
  return result;
}

unint64_t *DERDecodeSeqContentInit(unint64_t *result, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = *result;
  v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }
  else
  {
    v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSeqNext(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = 0;
  v2 = *a1;
  v3 = a1[1];
  if (*a1 >= v3)
    return 1;
  v10[0] = *a1;
  v10[1] = v3 - v2;
  result = DERDecodeItemPartialBufferGetLength((uint64_t)v10, a2, 0);
  if (!(_DWORD)result)
  {
    v8 = a2[1];
    v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        result = 0;
        *a1 = v9;
        return result;
      }
      __break(0x5519u);
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t DERParseSequenceToObject(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  uint64_t result;
  unint64_t v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  memset(v12, 170, 24);
  result = DERDecodeItemPartialBufferGetLength(a1, v12, 0);
  if (!(_DWORD)result)
  {
    if (v12[0] == 0x2000000000000010)
      return DERParseSequenceContentToObject(&v12[1], a2, a3, a4, a5, a6);
    else
      return 2;
  }
  return result;
}

uint64_t DERParseSequenceContentToObject(unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int16 v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;
  unsigned __int16 v17;
  __int16 v18;
  unint64_t v19;
  char *v21;
  uint64_t v23;
  unint64_t v24;
  __int16 *v25;
  unint64_t v26;
  __int16 v27;
  unint64_t v28;
  char *v29;
  unint64_t v31[3];
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v32 = 0;
  if (a6)
  {
    if (a6 > a5)
      goto LABEL_59;
    bzero((void *)a4, a6);
  }
  v10 = *a1;
  v11 = a1[1];
  if (__CFADD__(*a1, v11))
    goto LABEL_58;
  v12 = v10 + v11;
  if (v10 > v12)
LABEL_59:
    __break(0x5519u);
  v32 = *a1;
  v33 = v12;
  if (a2)
  {
    v13 = 0;
    v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      v15 = v32;
      v14 = v33;
      result = DERDecodeSeqNext(&v32, v31);
      if ((_DWORD)result)
        break;
      if (a2 <= v13)
        return 2;
      while (1)
      {
        if (24 * (__int16)v13 > (unint64_t)~a3)
          goto LABEL_58;
        v17 = v13;
        v18 = *(_WORD *)(a3 + 24 * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(_QWORD *)(a3 + 24 * v13 + 8))
          break;
        result = 2;
        if ((v18 & 1) != 0)
        {
          ++v13;
          if (a2 > (unsigned __int16)(v17 + 1))
            continue;
        }
        return result;
      }
      if ((v18 & 4) == 0)
      {
        v19 = *(_QWORD *)(a3 + 24 * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5)
          return 7;
        if (v19 > ~a4)
          goto LABEL_58;
        v21 = (char *)(a4 + v19);
        if (v21 >= v29 || (unint64_t)v21 < a4)
          goto LABEL_59;
        *(_OWORD *)v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((_QWORD *)v21 + 1) <= v14 - v15)
            {
              *(_QWORD *)v21 = v15;
              return 3;
            }
            goto LABEL_59;
          }
          if (v21 + 16 > v29)
            goto LABEL_59;
          v23 = *((_QWORD *)v21 + 1);
          v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }
          if (v14 < v15 || v24 > v14 - v15)
            goto LABEL_59;
          *(_QWORD *)v21 = v15;
          *((_QWORD *)v21 + 1) = v24;
        }
      }
      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            v10 = v31[1] + v31[2];
            v12 = *a1 + v28;
            goto LABEL_47;
          }
        }
LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }
      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        v10 = v32;
        v12 = v33;
        goto LABEL_47;
      }
    }
    if ((_DWORD)result == 1)
    {
      if (a2 <= v13)
      {
        return 0;
      }
      else
      {
        v25 = (__int16 *)(a3 + 24 * v13 + 16);
        v26 = a2 - (unint64_t)v13;
        result = 0;
        while (1)
        {
          v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0)
            break;
          if (!--v26)
            return result;
        }
        return 5;
      }
    }
  }
  else
  {
LABEL_47:
    if (v10 == v12)
      return 0;
    else
      return 3;
  }
  return result;
}

uint64_t DERParseSequence(uint64_t result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4)
    return DERParseSequenceToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  __break(0x5519u);
  return result;
}

unint64_t *DERParseSequenceContent(unint64_t *result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4)
    return (unint64_t *)DERParseSequenceContentToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSequenceWithBlock(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v4[4];

  v4[3] = *MEMORY[0x24BDAC8D0];
  memset(v4, 170, 24);
  result = DERDecodeItemPartialBufferGetLength(a1, v4, 0);
  if (!(_DWORD)result)
  {
    if (v4[0] - 0x2000000000000012 >= 0xFFFFFFFFFFFFFFFELL)
      return DERDecodeSequenceContentWithBlock(&v4[1], a2);
    else
      return 2;
  }
  return result;
}

uint64_t DERDecodeSequenceContentWithBlock(unint64_t *a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t result;
  char v7;
  unint64_t v8[3];
  unint64_t v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = 0;
  v2 = *a1;
  v3 = a1[1];
  if (__CFADD__(*a1, v3))
  {
    __break(0x5513u);
LABEL_13:
    __break(0x5519u);
  }
  v4 = v2 + v3;
  if (v2 > v4)
    goto LABEL_13;
  v9[0] = *a1;
  v9[1] = v4;
  memset(v8, 170, sizeof(v8));
  v7 = 0;
  while (1)
  {
    LODWORD(result) = DERDecodeSeqNext(v9, v8);
    if ((_DWORD)result)
      break;
    LODWORD(result) = (*(uint64_t (**)(uint64_t, unint64_t *, char *))(a2 + 16))(a2, v8, &v7);
    if ((_DWORD)result)
      break;
    if (v7)
      return 0;
  }
  if (result <= 1)
    return 0;
  else
    return result;
}

void SLAM::SLAMPrivateInterface::PerformScript()
{
  _QWORD *v0;
  _QWORD *v1;
  char v2;
  uint64_t v3;

  OUTLINED_FUNCTION_6();
  if (v2)
  {
    v3 = 4;
    goto LABEL_5;
  }
  if (v1)
  {
    v3 = 5;
    v0 = v1;
LABEL_5:
    OUTLINED_FUNCTION_4(v0, v3);
  }
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3();
}

void std::__variant_detail::__visitation::__base::__dispatcher<3ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<SLAM::overloaded<SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_0,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_1,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_2,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_3,SLAM::Impl::PerformScript(SLAM::Script const&,SLAM::MigrationInfo const&)::$_4>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)0,SLAM::MigrationInfo::OSU,SLAM::MigrationInfo::Idle,SLAM::MigrationInfo::SecureChannel,SLAM::MigrationInfo::Termination,SLAM::MigrationInfo::SLAM> const&>()
{
  std::__shared_weak_count *v0;
  unint64_t *v1;
  uint64_t v2;
  int v3;

  OUTLINED_FUNCTION_5();
  do
    OUTLINED_FUNCTION_2(v1);
  while (v3);
  if (v2)
  {
    OUTLINED_FUNCTION_3();
  }
  else
  {
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_0(v0);
  }
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t ctu::hex()
{
  return MEMORY[0x24BED9BB8]();
}

const char *__cdecl std::exception::what(const std::exception *this)
{
  return (const char *)MEMORY[0x24BEDAA88](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC38](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

const std::error_category *std::generic_category(void)
{
  return (const std::error_category *)MEMORY[0x24BEDB0B8]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

std::ios_base::failure *__cdecl std::ios_base::failure::failure(std::ios_base::failure *this, const std::string *__msg, const std::error_code *__ec)
{
  return (std::ios_base::failure *)MEMORY[0x24BEDB558](this, __msg, __ec);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24D1BA238(__p);
}

uint64_t operator delete()
{
  return off_24D1BA240();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24D1BA248(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x24BDB0358](a1, a2, a3);
}

