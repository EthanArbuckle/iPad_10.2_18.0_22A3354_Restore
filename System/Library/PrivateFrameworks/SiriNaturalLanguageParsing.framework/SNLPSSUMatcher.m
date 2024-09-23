@implementation SNLPSSUMatcher

- (BOOL)performFullCacheUpdate:(id)a3 error:(id *)a4
{
  return -[SNLPSSUMatcher _performFullCacheUpdateInnerWithUserShortcuts:applicationInfos:error:](self, "_performFullCacheUpdateInnerWithUserShortcuts:applicationInfos:error:", 0, a3, a4);
}

- (BOOL)registerApp:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  SSUMatcher *value;
  __int128 v13;
  BOOL v14;
  char **v16;
  char **updated;
  char **v18;
  std::string v19;
  void *v20[2];
  char v21;
  std::string v22;
  char ***v23;
  char v24;
  std::string v25;
  int v26;
  void *__p;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  std::string buf;
  int v32;
  const void *v33;
  uint64_t v34;
  char v35;
  uint64_t v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = self->__systemEventLock;
  objc_sync_enter(v6);
  v36[0] = snlp::ssu::selflogging::logBackgroundUpdateStarted(1);
  v36[1] = v7;
  SNLPOSLoggerForCategory(8);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf.__r_.__value_.__l.__data_) = 138412290;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v5;
    _os_log_impl(&dword_1C2196000, v8, OS_LOG_TYPE_DEBUG, "Attempting to register app with info: %@", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(v5, "bundleIdentifier");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(v20, (char *)objc_msgSend(v9, "UTF8String"));
  objc_msgSend(v5, "assetURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  buf.__r_.__value_.__r.__words[0] = objc_msgSend(v11, "UTF8String");
  std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&v22, &buf.__r_.__value_.__l.__data_);

  buf.__r_.__value_.__s.__data_[0] = 0;
  v35 = 0;
  snlp::ssu::matcher::SSUMatcher::registerApp((snlp::ssu::matcher::SSUMatcher *)self->_cppMatcher.__ptr_.__value_, (const snlp::ssu::matcher::SSUAppInfo *)v20, (uint64_t)&v25);
  std::__optional_storage_base<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo,false>>((uint64_t)&buf, (__int128 *)&v25);
  std::__optional_destruct_base<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v25);
  if (v35)
  {
    value = self->_cppMatcher.__ptr_.__value_;
    if (*((char *)value + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v19, *(const std::string::value_type **)value, *((_QWORD *)value + 1));
      if (!v35)
        std::__throw_bad_optional_access[abi:ne180100]();
    }
    else
    {
      v13 = *(_OWORD *)value;
      v19.__r_.__value_.__r.__words[2] = *((_QWORD *)value + 2);
      *(_OWORD *)&v19.__r_.__value_.__l.__data_ = v13;
    }
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v25, buf.__r_.__value_.__l.__data_, buf.__r_.__value_.__l.__size_);
    else
      v25 = buf;
    v26 = v32;
    v28 = 0;
    v29 = 0;
    __p = 0;
    std::vector<snlp::ssu::selflogging::SSUBackgroundUpdateAppCategoryInfo>::__init_with_size[abi:ne180100]<snlp::ssu::selflogging::SSUBackgroundUpdateAppCategoryInfo*,snlp::ssu::selflogging::SSUBackgroundUpdateAppCategoryInfo*>(&__p, v33, v34, (v34 - (uint64_t)v33) >> 4);
    v16 = 0;
    updated = 0;
    v18 = 0;
    v23 = &v16;
    v24 = 0;
    v16 = (char **)operator new(0x38uLL);
    updated = v16;
    v18 = v16 + 7;
    updated = (char **)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo>,snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo const*,snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo const*,snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo*>((uint64_t)&v18, (uint64_t)&v25, (uint64_t)&v30, (uint64_t)v16);
    snlp::ssu::selflogging::logBackgroundUpdateEnded(v36, (uint64_t *)&v19, &v16);
    v23 = &v16;
    std::vector<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v23);
    if (__p)
    {
      v28 = __p;
      operator delete(__p);
    }
    if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v25.__r_.__value_.__l.__data_);
    if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v19.__r_.__value_.__l.__data_);
    v14 = 1;
  }
  else
  {
    snlp::ssu::selflogging::logBackgroundUpdateFailed(v36);
    v14 = 0;
  }
  std::__optional_destruct_base<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&buf);
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v22.__r_.__value_.__l.__data_);
  if (v21 < 0)
    operator delete(v20[0]);
  objc_sync_exit(v6);

  return v14;
}

- (BOOL)deregisterApp:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  SSUMatcher *value;
  id v11;
  SSUMatcher *v12;
  __int128 v13;
  void *v14;
  void *v15;
  BOOL v16;
  char **v18;
  char **updated;
  char **v20;
  std::string __p;
  char ***v22;
  char v23;
  _QWORD v24[2];
  _QWORD v25[6];
  std::string v26;
  int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  std::string buf;
  int v33;
  const void *v34;
  uint64_t v35;
  char v36;
  uint64_t v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = self->__systemEventLock;
  objc_sync_enter(v7);
  v37[0] = snlp::ssu::selflogging::logBackgroundUpdateStarted(2);
  v37[1] = v8;
  SNLPOSLoggerForCategory(8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf.__r_.__value_.__l.__data_) = 138412290;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v6;
    _os_log_impl(&dword_1C2196000, v9, OS_LOG_TYPE_DEBUG, "Attempting to deregister app with bundle ID: %@", (uint8_t *)&buf, 0xCu);
  }

  buf.__r_.__value_.__s.__data_[0] = 0;
  v36 = 0;
  value = self->_cppMatcher.__ptr_.__value_;
  v11 = objc_retainAutorelease(v6);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v11, "UTF8String"));
  snlp::ssu::matcher::SSUMatcher::deregisterApp((uint64_t)value, (char *)&__p, (uint64_t)&v26);
  std::__optional_storage_base<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo,false>>((uint64_t)&buf, (__int128 *)&v26);
  std::__optional_destruct_base<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v26);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (v36)
  {
    v12 = self->_cppMatcher.__ptr_.__value_;
    if (*((char *)v12 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v12, *((_QWORD *)v12 + 1));
      if (!v36)
        std::__throw_bad_optional_access[abi:ne180100]();
    }
    else
    {
      v13 = *(_OWORD *)v12;
      __p.__r_.__value_.__r.__words[2] = *((_QWORD *)v12 + 2);
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v13;
    }
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v26, buf.__r_.__value_.__l.__data_, buf.__r_.__value_.__l.__size_);
    else
      v26 = buf;
    v27 = v33;
    v29 = 0;
    v30 = 0;
    v28 = 0;
    std::vector<snlp::ssu::selflogging::SSUBackgroundUpdateAppCategoryInfo>::__init_with_size[abi:ne180100]<snlp::ssu::selflogging::SSUBackgroundUpdateAppCategoryInfo*,snlp::ssu::selflogging::SSUBackgroundUpdateAppCategoryInfo*>(&v28, v34, v35, (v35 - (uint64_t)v34) >> 4);
    v18 = 0;
    updated = 0;
    v20 = 0;
    v22 = &v18;
    v23 = 0;
    v18 = (char **)operator new(0x38uLL);
    updated = v18;
    v20 = v18 + 7;
    updated = (char **)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo>,snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo const*,snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo const*,snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo*>((uint64_t)&v20, (uint64_t)&v26, (uint64_t)&v31, (uint64_t)v18);
    snlp::ssu::selflogging::logBackgroundUpdateEnded(v37, (uint64_t *)&__p, &v18);
    v22 = &v18;
    std::vector<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v22);
    if (v28)
    {
      v29 = v28;
      operator delete(v28);
    }
    if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v26.__r_.__value_.__l.__data_);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    v16 = 1;
  }
  else
  {
    snlp::ssu::selflogging::logBackgroundUpdateFailed(v37);
    if (a4)
    {
      v24[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not deregister app: %@."), v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = *MEMORY[0x1E0CB2D68];
      v25[0] = v14;
      v25[1] = CFSTR("A failure was encountered during deregisteration.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SNLPSSUErrorDomain"), 3, v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v16 = 0;
  }
  std::__optional_destruct_base<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&buf);
  objc_sync_exit(v7);

  return v16;
}

- (BOOL)handleUserShortcutsDatabaseChanged:(id)a3 error:(id *)a4
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  id v11;
  unint64_t v12;
  __int128 v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  std::string::size_type v19;
  __int128 v20;
  __int128 v21;
  unint64_t v22;
  SSUMatcher *value;
  __int128 v24;
  void *v25;
  void *v26;
  BOOL v27;
  NSObject *v30;
  id v32;
  id obj;
  char **v34;
  char **updated;
  char **v36;
  std::string v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  char ***v45;
  char v46;
  _QWORD v47[2];
  _QWORD v48[6];
  std::string v49;
  unint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  std::string buf;
  __int128 __p;
  uint64_t v57;
  char v58;
  _BYTE v59[128];
  uint64_t v60[5];

  v60[2] = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v30 = self->__systemEventLock;
  objc_sync_enter(v30);
  v60[0] = snlp::ssu::selflogging::logBackgroundUpdateStarted(4);
  v60[1] = v4;
  SNLPOSLoggerForCategory(8);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf.__r_.__value_.__l.__data_) = 134217984;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = objc_msgSend(v32, "count");
    _os_log_impl(&dword_1C2196000, v5, OS_LOG_TYPE_DEBUG, "Handling user shortcuts database changed event with %lu configured user shortcuts", (uint8_t *)&buf, 0xCu);
  }

  v42 = 0;
  v43 = 0;
  v44 = 0;
  std::vector<snlp::ssu::cache::SSUCacheObjectParameter>::reserve(&v42, objc_msgSend(v32, "count"));
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v32;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v59, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v39 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v9, "identifier");
        v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend(v10, "UTF8String"));
        objc_msgSend(v9, "phrase");
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v11, "UTF8String"));
        v12 = v43;
        if (v43 >= v44)
        {
          v15 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v43 - v42) >> 4);
          v16 = v15 + 1;
          if (v15 + 1 > 0x555555555555555)
            std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
          if (0x5555555555555556 * ((uint64_t)(v44 - v42) >> 4) > v16)
            v16 = 0x5555555555555556 * ((uint64_t)(v44 - v42) >> 4);
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v44 - v42) >> 4) >= 0x2AAAAAAAAAAAAAALL)
            v17 = 0x555555555555555;
          else
            v17 = v16;
          v51 = &v44;
          if (v17)
            v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<snlp::ssu::cache::SSUCacheObjectParameter>>(v17);
          else
            v18 = 0;
          v19 = v17 + 48 * v15;
          v49.__r_.__value_.__r.__words[0] = v17;
          v49.__r_.__value_.__l.__size_ = v19;
          v50 = v17 + 48 * v18;
          v20 = *(_OWORD *)&buf.__r_.__value_.__l.__data_;
          *(_QWORD *)(v19 + 16) = *((_QWORD *)&buf.__r_.__value_.__l + 2);
          *(_OWORD *)v19 = v20;
          memset(&buf, 0, sizeof(buf));
          v21 = __p;
          *(_QWORD *)(v19 + 40) = v57;
          *(_OWORD *)(v19 + 24) = v21;
          v57 = 0;
          __p = 0uLL;
          v49.__r_.__value_.__r.__words[2] = v19 + 48;
          std::vector<snlp::ssu::cache::SSUCacheObjectParameter>::__swap_out_circular_buffer(&v42, &v49);
          v22 = v43;
          std::__split_buffer<snlp::ssu::cache::SSUCacheObjectParameter>::~__split_buffer((uint64_t)&v49);
          v43 = v22;
          if (SHIBYTE(v57) < 0)
            operator delete((void *)__p);
        }
        else
        {
          v13 = *(_OWORD *)&buf.__r_.__value_.__l.__data_;
          *(_QWORD *)(v43 + 16) = *((_QWORD *)&buf.__r_.__value_.__l + 2);
          *(_OWORD *)v12 = v13;
          memset(&buf, 0, sizeof(buf));
          v14 = v57;
          *(_OWORD *)(v12 + 24) = __p;
          *(_QWORD *)(v12 + 40) = v14;
          v57 = 0;
          __p = 0uLL;
          v43 = v12 + 48;
        }
        if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
          operator delete(buf.__r_.__value_.__l.__data_);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v59, 16);
    }
    while (v6);
  }

  buf.__r_.__value_.__s.__data_[0] = 0;
  v58 = 0;
  snlp::ssu::matcher::SSUMatcher::handleUserShortcutsDatabaseChanged((uint64_t)self->_cppMatcher.__ptr_.__value_, &v42, (uint64_t)&v49);
  std::__optional_storage_base<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo,false>>((uint64_t)&buf, (__int128 *)&v49);
  std::__optional_destruct_base<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v49);
  if (v58)
  {
    value = self->_cppMatcher.__ptr_.__value_;
    if (*((char *)value + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v37, *(const std::string::value_type **)value, *((_QWORD *)value + 1));
      if (!v58)
        std::__throw_bad_optional_access[abi:ne180100]();
    }
    else
    {
      v24 = *(_OWORD *)value;
      v37.__r_.__value_.__r.__words[2] = *((_QWORD *)value + 2);
      *(_OWORD *)&v37.__r_.__value_.__l.__data_ = v24;
    }
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v49, buf.__r_.__value_.__l.__data_, buf.__r_.__value_.__l.__size_);
    else
      v49 = buf;
    LODWORD(v50) = __p;
    v52 = 0;
    v53 = 0;
    v51 = 0;
    std::vector<snlp::ssu::selflogging::SSUBackgroundUpdateAppCategoryInfo>::__init_with_size[abi:ne180100]<snlp::ssu::selflogging::SSUBackgroundUpdateAppCategoryInfo*,snlp::ssu::selflogging::SSUBackgroundUpdateAppCategoryInfo*>(&v51, *((const void **)&__p + 1), v57, (v57 - *((_QWORD *)&__p + 1)) >> 4);
    v34 = 0;
    updated = 0;
    v36 = 0;
    v45 = &v34;
    v46 = 0;
    v34 = (char **)operator new(0x38uLL);
    updated = v34;
    v36 = v34 + 7;
    updated = (char **)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo>,snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo const*,snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo const*,snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo*>((uint64_t)&v36, (uint64_t)&v49, (uint64_t)&v54, (uint64_t)v34);
    snlp::ssu::selflogging::logBackgroundUpdateEnded(v60, (uint64_t *)&v37, &v34);
    v45 = &v34;
    std::vector<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v45);
    if (v51)
    {
      v52 = v51;
      operator delete(v51);
    }
    if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v49.__r_.__value_.__l.__data_);
    if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v37.__r_.__value_.__l.__data_);
    v27 = 1;
  }
  else
  {
    snlp::ssu::selflogging::logBackgroundUpdateFailed(v60);
    if (a4)
    {
      v47[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not handle user shortcuts database changed event"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v47[1] = *MEMORY[0x1E0CB2D68];
      v48[0] = v25;
      v48[1] = CFSTR("A failure was encountered during handling.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SNLPSSUErrorDomain"), 9, v26);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v27 = 0;
  }
  std::__optional_destruct_base<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&buf);
  buf.__r_.__value_.__r.__words[0] = (std::string::size_type)&v42;
  std::vector<snlp::ssu::app::SSUAppParameter>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  objc_sync_exit(v30);

  return v27;
}

- (id)responseForRequest:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  const sirinluexternal::RequestID *v13;
  unsigned __int8 *value;
  uint64_t v15;
  const sirinluexternal::RequestID *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v33;
  uint8_t v34[8];
  __int128 v35;
  void *v36;
  void *__p[4];
  uint8_t buf[64];
  uint64_t v39;
  _QWORD v40[2];
  _QWORD v41[6];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[3];

  v45[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  SNLPOSLoggerForCategory(8);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2196000, v7, OS_LOG_TYPE_DEBUG, "Handling call to [SNLPSSUMatcher responseForRequest:error:]", buf, 2u);
  }

  SNLPOSLoggerForCategory(7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  SNLPOSLoggerForCategory(7);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C2196000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SNLPSSUMatcher responseForRequest", ", buf, 2u);
  }

  SNLPOSLoggerForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2196000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN \"SNLPSSUMatcher responseForRequest\", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D9FAD8], "convertSSURequestFromObjCToCpp:", v6);
  if (!v39)
  {
    if (!a4)
      goto LABEL_34;
    v21 = *MEMORY[0x1E0CB2D68];
    v44[0] = *MEMORY[0x1E0CB2D50];
    v44[1] = v21;
    v45[0] = CFSTR("Could not produce an SSU response for the given request.");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not convert ObjC proto SSU request to C++ proto SSU request"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SNLPSSUErrorDomain"), 5, v23);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_23;
  }
  if (*(_QWORD *)(v39 + 48))
  {
    MEMORY[0x1C3BB841C](buf);
    snlp::ssu::selflogging::logUserRequestStarted((snlp::ssu::selflogging *)buf, v13);
    memset(__p, 0, sizeof(__p));
    value = (unsigned __int8 *)self->_cppMatcher.__ptr_.__value_;
    v15 = v39;
    v39 = 0;
    v33 = v15;
    snlp::ssu::matcher::SSUMatcher::handleUserRequest(value, &v33, (uint64_t *)v34);
    v17 = *(void **)v34;
    __p[0] = *(void **)v34;
    *(_OWORD *)&__p[1] = v35;
    __p[3] = v36;
    if (v33)
      (*(void (**)(uint64_t))(*(_QWORD *)v33 + 8))(v33);
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0D9FAD8], "convertSSUResponseFromCppToObjC:", __p);
      a4 = (id *)objc_claimAutoreleasedReturnValue();
      SNLPOSLoggerForCategory(7);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        *(_WORD *)v34 = 0;
        _os_signpost_emit_with_name_impl(&dword_1C2196000, v19, OS_SIGNPOST_INTERVAL_END, v9, "SNLPSSUMatcher responseForRequest", ", v34, 2u);
      }

      SNLPOSLoggerForCategory(0);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_1C2196000, v20, OS_LOG_TYPE_DEFAULT, "END \"SNLPSSUMatcher responseForRequest\", v34, 2u);
      }

      snlp::ssu::selflogging::logUserRequestEnded((snlp::ssu::selflogging *)buf, (unsigned int **)&__p[1]);
    }
    else
    {
      if (a4)
      {
        v27 = *MEMORY[0x1E0CB2D68];
        v40[0] = *MEMORY[0x1E0CB2D50];
        v40[1] = v27;
        v41[0] = CFSTR("Could not produce an SSU response for the given request.");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The C++ SSUMatcher returned a nullptr response."));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v41[1] = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SNLPSSUErrorDomain"), 6, v29);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      snlp::ssu::selflogging::logUserRequestFailed((snlp::ssu::selflogging *)buf, v16);
      a4 = 0;
    }
    if (__p[1])
    {
      __p[2] = __p[1];
      operator delete(__p[1]);
    }
    v30 = __p[0];
    __p[0] = 0;
    if (v30)
      (*(void (**)(void *))(*(_QWORD *)v30 + 8))(v30);
    MEMORY[0x1C3BB8428](buf);
    goto LABEL_32;
  }
  if (a4)
  {
    v24 = *MEMORY[0x1E0CB2D68];
    v42[0] = *MEMORY[0x1E0CB2D50];
    v42[1] = v24;
    v43[0] = CFSTR("Could not produce an SSU response for the given request.");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The SSU request has no request ID"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SNLPSSUErrorDomain"), 10, v26);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_23:
    a4 = 0;
  }
LABEL_32:
  v31 = v39;
  v39 = 0;
  if (v31)
    (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
LABEL_34:

  return a4;
}

- (id)_initWithCacheDirectoryURL:(id)a3 cppMatcher:()unique_ptr<snlp:(std::default_delete<snlp::ssu::matcher::SSUMatcher>>)a4 :ssu::matcher::SSUMatcher
{
  id v7;
  id v8;
  id v9;
  void *v10;
  snlp::ssu::matcher::SSUMatcher *v11;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SNLPSSUMatcher;
  v8 = -[SNLPSSUMatcher init](&v13, sel_init);
  objc_storeStrong((id *)v8 + 2, a3);
  v9 = objc_alloc_init(MEMORY[0x1E0DE7910]);
  v10 = (void *)*((_QWORD *)v8 + 3);
  *((_QWORD *)v8 + 3) = v9;

  v11 = *(snlp::ssu::matcher::SSUMatcher **)a4.__ptr_.__value_;
  *(_QWORD *)a4.__ptr_.__value_ = 0;
  std::unique_ptr<snlp::ssu::matcher::SSUMatcher>::reset[abi:ne180100]((snlp::ssu::matcher::SSUMatcher **)v8 + 1, v11);

  return v8;
}

- (BOOL)_performFullCacheUpdateInnerWithUserShortcuts:(id)a3 applicationInfos:(id)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  id v14;
  unint64_t v15;
  __int128 v16;
  std::string::size_type v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  std::string::size_type v22;
  __int128 v23;
  __int128 v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  unint64_t v37;
  __int128 v38;
  std::string::size_type v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  std::string::size_type v44;
  __int128 v45;
  __int128 v46;
  unint64_t v47;
  NSObject *v48;
  NSObject *v49;
  SSUMatcher *value;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  BOOL v56;
  SNLPSSUMatcher *v58;
  NSObject *v60;
  id v61;
  void *v62;
  id obj;
  id obja;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  char *v69;
  unint64_t v70;
  unint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  char v79;
  std::string v80;
  unint64_t v81;
  unint64_t *v82;
  _QWORD v83[3];
  _QWORD v84[3];
  uint8_t v85[128];
  uint8_t buf[16];
  unint64_t v87;
  std::string __p;
  _BYTE v89[128];
  uint64_t v90[5];

  v90[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v61 = a4;
  v58 = self;
  v60 = self->__systemEventLock;
  objc_sync_enter(v60);
  v62 = v7;
  v90[0] = snlp::ssu::selflogging::logBackgroundUpdateStarted(3);
  v90[1] = v8;
  LOBYTE(v76) = 0;
  v79 = 0;
  if (v7)
  {
    v76 = 0;
    v77 = 0;
    v78 = 0;
    v79 = 1;
    std::vector<snlp::ssu::cache::SSUCacheObjectParameter>::reserve(&v76, objc_msgSend(v7, "count"));
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    obj = v7;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v89, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v73;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v73 != v10)
            objc_enumerationMutation(obj);
          if (!v79)
            std::__throw_bad_optional_access[abi:ne180100]();
          v12 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
          objc_msgSend(v12, "identifier");
          v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          std::string::basic_string[abi:ne180100]<0>(buf, (char *)objc_msgSend(v13, "UTF8String"));
          objc_msgSend(v12, "phrase");
          v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v14, "UTF8String"));
          v15 = v77;
          if (v77 >= v78)
          {
            v18 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v77 - v76) >> 4);
            v19 = v18 + 1;
            if (v18 + 1 > 0x555555555555555)
              std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
            if (0x5555555555555556 * ((uint64_t)(v78 - v76) >> 4) > v19)
              v19 = 0x5555555555555556 * ((uint64_t)(v78 - v76) >> 4);
            if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v78 - v76) >> 4) >= 0x2AAAAAAAAAAAAAALL)
              v20 = 0x555555555555555;
            else
              v20 = v19;
            v82 = &v78;
            if (v20)
              v20 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<snlp::ssu::cache::SSUCacheObjectParameter>>(v20);
            else
              v21 = 0;
            v22 = v20 + 48 * v18;
            v80.__r_.__value_.__r.__words[0] = v20;
            v80.__r_.__value_.__l.__size_ = v22;
            v81 = v20 + 48 * v21;
            v23 = *(_OWORD *)buf;
            *(_QWORD *)(v22 + 16) = v87;
            *(_OWORD *)v22 = v23;
            v87 = 0;
            memset(buf, 0, sizeof(buf));
            v24 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
            *(_QWORD *)(v22 + 40) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
            *(_OWORD *)(v22 + 24) = v24;
            memset(&__p, 0, sizeof(__p));
            v80.__r_.__value_.__r.__words[2] = v22 + 48;
            std::vector<snlp::ssu::cache::SSUCacheObjectParameter>::__swap_out_circular_buffer(&v76, &v80);
            v25 = v77;
            std::__split_buffer<snlp::ssu::cache::SSUCacheObjectParameter>::~__split_buffer((uint64_t)&v80);
            v77 = v25;
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__p.__r_.__value_.__l.__data_);
          }
          else
          {
            v16 = *(_OWORD *)buf;
            *(_QWORD *)(v77 + 16) = v87;
            *(_OWORD *)v15 = v16;
            v87 = 0;
            memset(buf, 0, sizeof(buf));
            v17 = __p.__r_.__value_.__r.__words[2];
            *(_OWORD *)(v15 + 24) = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
            *(_QWORD *)(v15 + 40) = v17;
            memset(&__p, 0, sizeof(__p));
            v77 = v15 + 48;
          }
          if (SHIBYTE(v87) < 0)
            operator delete(*(void **)buf);

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v89, 16);
      }
      while (v9);
    }

  }
  v69 = 0;
  v70 = 0;
  v71 = 0;
  v26 = objc_msgSend(v61, "count");
  if (v26)
  {
    if (v26 > 0x555555555555555)
      std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
    __p.__r_.__value_.__l.__size_ = (std::string::size_type)&v71;
    *(_QWORD *)buf = std::__allocate_at_least[abi:ne180100]<std::allocator<snlp::ssu::cache::SSUCacheObjectParameter>>(v26);
    *(_QWORD *)&buf[8] = *(_QWORD *)buf + v70;
    v87 = *(_QWORD *)buf + v70;
    __p.__r_.__value_.__r.__words[0] = *(_QWORD *)buf + 48 * v27;
    std::vector<snlp::ssu::cache::SSUCacheObjectParameter>::__swap_out_circular_buffer((uint64_t *)&v69, buf);
    std::__split_buffer<snlp::ssu::cache::SSUCacheObjectParameter>::~__split_buffer((uint64_t)buf);
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v28 = v61;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v65, v85, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v66;
    while (2)
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v66 != v30)
          objc_enumerationMutation(v28);
        v32 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
        objc_msgSend(v32, "bundleIdentifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(obja, "containsObject:", v33))
        {
          if (a5)
          {
            v52 = *MEMORY[0x1E0CB2D50];
            v84[0] = CFSTR("Could not perform full cache update.");
            v53 = *MEMORY[0x1E0CB2D68];
            v83[0] = v52;
            v83[1] = v53;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("There was a duplicate app bundle ID in applicationInfos: %@."), v33);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v83[2] = *MEMORY[0x1E0CB2D80];
            v84[1] = v54;
            v84[2] = CFSTR("Ensure that only unique apps are passed.");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 3);
            v55 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SNLPSSUErrorDomain"), 2, v55);
            *a5 = (id)objc_claimAutoreleasedReturnValue();

          }
          snlp::ssu::selflogging::logBackgroundUpdateFailed(v90);

          v56 = 0;
          goto LABEL_68;
        }
        objc_msgSend(obja, "addObject:", v33);
        objc_msgSend(v32, "bundleIdentifier");
        v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        std::string::basic_string[abi:ne180100]<0>(buf, (char *)objc_msgSend(v34, "UTF8String"));
        objc_msgSend(v32, "assetURL");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "path");
        v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v80.__r_.__value_.__r.__words[0] = objc_msgSend(v36, "UTF8String");
        std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&__p, &v80.__r_.__value_.__l.__data_);

        v37 = v70;
        if (v70 >= v71)
        {
          v40 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v70 - (_QWORD)v69) >> 4);
          v41 = v40 + 1;
          if (v40 + 1 > 0x555555555555555)
            std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
          if (0x5555555555555556 * ((uint64_t)(v71 - (_QWORD)v69) >> 4) > v41)
            v41 = 0x5555555555555556 * ((uint64_t)(v71 - (_QWORD)v69) >> 4);
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v71 - (_QWORD)v69) >> 4) >= 0x2AAAAAAAAAAAAAALL)
            v42 = 0x555555555555555;
          else
            v42 = v41;
          v82 = &v71;
          if (v42)
            v42 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<snlp::ssu::cache::SSUCacheObjectParameter>>(v42);
          else
            v43 = 0;
          v44 = v42 + 48 * v40;
          v80.__r_.__value_.__r.__words[0] = v42;
          v80.__r_.__value_.__l.__size_ = v44;
          v81 = v42 + 48 * v43;
          v45 = *(_OWORD *)buf;
          *(_QWORD *)(v44 + 16) = v87;
          *(_OWORD *)v44 = v45;
          v87 = 0;
          memset(buf, 0, sizeof(buf));
          v46 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
          *(_QWORD *)(v44 + 40) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
          *(_OWORD *)(v44 + 24) = v46;
          memset(&__p, 0, sizeof(__p));
          v80.__r_.__value_.__r.__words[2] = v44 + 48;
          std::vector<snlp::ssu::cache::SSUCacheObjectParameter>::__swap_out_circular_buffer((uint64_t *)&v69, &v80);
          v47 = v70;
          std::__split_buffer<snlp::ssu::cache::SSUCacheObjectParameter>::~__split_buffer((uint64_t)&v80);
          v70 = v47;
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__p.__r_.__value_.__l.__data_);
        }
        else
        {
          v38 = *(_OWORD *)buf;
          *(_QWORD *)(v70 + 16) = v87;
          *(_OWORD *)v37 = v38;
          v87 = 0;
          memset(buf, 0, sizeof(buf));
          v39 = __p.__r_.__value_.__r.__words[2];
          *(_OWORD *)(v37 + 24) = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
          *(_QWORD *)(v37 + 40) = v39;
          memset(&__p, 0, sizeof(__p));
          v70 = v37 + 48;
        }
        if (SHIBYTE(v87) < 0)
          operator delete(*(void **)buf);

      }
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v65, v85, 16);
      if (v29)
        continue;
      break;
    }
  }

  SNLPOSLoggerForCategory(8);
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v70 - (_QWORD)v69) >> 4);
    _os_log_impl(&dword_1C2196000, v48, OS_LOG_TYPE_DEBUG, "Performing full cache update for %lu applications", buf, 0xCu);
  }

  if (v79)
  {
    SNLPOSLoggerForCategory(8);
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
    {
      if (!v79)
        std::__throw_bad_optional_access[abi:ne180100]();
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v77 - v76) >> 4);
      _os_log_impl(&dword_1C2196000, v49, OS_LOG_TYPE_DEBUG, "Performing full cache update for %lu configured user shortcuts", buf, 0xCu);
    }

  }
  snlp::ssu::matcher::SSUMatcher::performFullCacheUpdate((uint64_t)v58->_cppMatcher.__ptr_.__value_, &v69, (uint64_t)&v76, (int64x2_t *)buf);
  value = v58->_cppMatcher.__ptr_.__value_;
  if (*((char *)value + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v80, *(const std::string::value_type **)value, *((_QWORD *)value + 1));
  }
  else
  {
    v51 = *(_OWORD *)value;
    v80.__r_.__value_.__r.__words[2] = *((_QWORD *)value + 2);
    *(_OWORD *)&v80.__r_.__value_.__l.__data_ = v51;
  }
  snlp::ssu::selflogging::logBackgroundUpdateEnded(v90, (uint64_t *)&v80, (char ***)buf);
  if (SHIBYTE(v80.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v80.__r_.__value_.__l.__data_);
  v80.__r_.__value_.__r.__words[0] = (std::string::size_type)buf;
  std::vector<snlp::ssu::selflogging::SSUBackgroundUpdateAppInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v80);
  v56 = 1;
LABEL_68:

  *(_QWORD *)buf = &v69;
  std::vector<snlp::ssu::app::SSUAppParameter>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  if (v79)
  {
    *(_QWORD *)buf = &v76;
    std::vector<snlp::ssu::app::SSUAppParameter>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  }
  objc_sync_exit(v60);

  return v56;
}

- (NSURL)cacheDirectoryURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (NSObject)_systemEventLock
{
  return self->__systemEventLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__systemEventLock, 0);
  objc_storeStrong((id *)&self->_cacheDirectoryURL, 0);
  std::unique_ptr<snlp::ssu::matcher::SSUMatcher>::reset[abi:ne180100]((snlp::ssu::matcher::SSUMatcher **)&self->_cppMatcher, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

+ (id)matcherWithDirectories:(id)a3 initializeModelsPreemptively:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  id v10;
  id v11;
  snlp::ssu::matcher::SSUMatcher *v12;
  id v13;
  void *v14;
  void *v15;
  snlp::ssu::matcher::SSUMatcher *v16;
  uint64_t v17;
  void *v18;
  snlp::ssu::matcher::SSUMatcher *v20;
  char *v21[5];
  char *v22[5];
  void *__p[5];
  snlp::ssu::matcher::SSUMatcher *v24;
  std::string v25;
  std::string v26;
  std::string v27;
  _QWORD v28[2];
  _QWORD v29[2];
  __int128 v30;
  uint64_t v31;

  v6 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(v8, "cacheDirectoryURL");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  __p[0] = (void *)objc_msgSend(v9, "fileSystemRepresentation");
  std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&v25, (char **)__p);
  objc_msgSend(v8, "modelAssetsDirectoryURL");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v22[0] = (char *)objc_msgSend(v10, "fileSystemRepresentation");
  std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&v26, v22);
  objc_msgSend(v8, "datasetAssetsDirectoryURL");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v21[0] = (char *)objc_msgSend(v11, "fileSystemRepresentation");
  std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&v27, v21);

  v24 = 0;
  objc_msgSend(a1, "_loadAppShortcutAlwaysTriggeredAllowList");
  +[SNLPAssetVersionChecker loadUInt32ListFromConfigPListResourceName:](SNLPAssetVersionChecker, "loadUInt32ListFromConfigPListResourceName:", CFSTR("SSUSupportedGenerationList"));
  v30 = xmmword_1C230B560;
  std::unordered_set<unsigned int>::unordered_set((uint64_t)v21, (unsigned int *)&v30, 4);
  if (v6)
    snlp::ssu::matcher::SSUMatcher::buildFromPathsWithImmediateInitialize((uint64_t)__p, (uint64_t)v22, (uint64_t)v21, (char *)&v25, (std::string **)&v30);
  else
    snlp::ssu::matcher::SSUMatcher::buildFromPathsWithLazyInitialize((uint64_t)__p, (uint64_t)v22, (uint64_t)v21, (char *)&v25, (std::string **)&v30);
  v12 = (snlp::ssu::matcher::SSUMatcher *)v30;
  v24 = (snlp::ssu::matcher::SSUMatcher *)v30;
  if ((_QWORD)v30)
  {
    v13 = objc_alloc((Class)a1);
    objc_msgSend(v8, "cacheDirectoryURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v20 = v12;
    v15 = (void *)objc_msgSend(v13, "_initWithCacheDirectoryURL:cppMatcher:", v14, &v20);
    v16 = v20;
    v20 = 0;
    if (v16)
    {
      snlp::ssu::matcher::SSUMatcher::~SSUMatcher(v16);
      MEMORY[0x1C3BB9B44]();
    }
    goto LABEL_9;
  }
  if (a5)
  {
    v17 = *MEMORY[0x1E0CB2D80];
    v28[0] = *MEMORY[0x1E0CB2D50];
    v28[1] = v17;
    v29[0] = CFSTR("Could not build C++ SSUMatcher instance.");
    v29[1] = CFSTR("Check error logs to understand root cause.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SNLPSSUErrorDomain"), 8, v14);
    v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

    goto LABEL_10;
  }
  v15 = 0;
LABEL_10:
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__deallocate_node((void **)__p[2]);
  v18 = __p[0];
  __p[0] = 0;
  if (v18)
    operator delete(v18);
  if (v24)
  {
    snlp::ssu::matcher::SSUMatcher::~SSUMatcher(v24);
    MEMORY[0x1C3BB9B44]();
  }
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v27.__r_.__value_.__l.__data_);
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v26.__r_.__value_.__l.__data_);
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v25.__r_.__value_.__l.__data_);

  return v15;
}

+ (unordered_set<std::string,)_loadAppShortcutAlwaysTriggeredAllowList
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unordered_set<std::string, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::string>> *result;
  void *__p[2];
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[SNLPSSUConfig loadAppShortcutAlwaysTriggeredAllowList](SNLPSSUConfig, "loadAppShortcutAlwaysTriggeredAllowList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var1.var0.var0 = 0u;
  retstr->var0.var3.var0 = 1.0;
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>((uint64_t)retstr, vcvtps_u32_f32((float)(unint64_t)objc_msgSend(v4, "count") / retstr->var0.var3.var0));
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8)), "UTF8String"));
        std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string>((uint64_t)retstr, (unsigned __int8 *)__p, (uint64_t)__p);
        if (v11 < 0)
          operator delete(__p[0]);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return result;
}

@end
