@implementation CAReportingPerformanceObject

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  return self;
}

- (void).cxx_destruct
{
  pc_session **begin;

  begin = self->_sessions.__begin_;
  if (begin)
  {
    self->_sessions.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_sessionsLock, 0);
  objc_storeStrong((id *)&self->_hostApplicationDisplayID, 0);
  objc_storeStrong((id *)&self->_processIdentifiers, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_performanceMetrics, 0);
}

- (void)setServiceType:(unsigned __int16)a3
{
  self->_serviceType = a3;
}

- (void)begin
{
  void *v2;
  _QWORD *v3;
  unint64_t v4;
  int v5;
  NSObject *v6;
  _QWORD *v7;
  _QWORD *v8;
  void **v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  int v16;
  NSObject *v17;
  int v18;
  uint64_t v19;
  int *v20;
  int v21;
  NSObject *v22;
  NSObject *v23;
  int v24;
  void **v25;
  unint64_t v26;
  uint64_t *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  uint64_t *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *obj;
  char *v43;
  std::string v44;
  char v45;
  uint64_t v46;
  char *v47;
  int __errnum;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  std::string buf;
  __int16 v54;
  _BYTE v55[14];
  std::string __p;
  __int16 v57;
  _BYTE v58[18];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  -[CAReportingPerformanceObject sessionsLock](self, "sessionsLock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lock");

  v3 = -[CAReportingPerformanceObject sessions](self, "sessions");
  if (v3[1] != *v3)
  {
    v4 = 0;
    do
    {
      -[CAReportingPerformanceObject sessions](self, "sessions");
      v5 = pc_session_destroy();
      if (v5)
      {
        v6 = objc_retainAutorelease(*(id *)AA_PerformanceUtilityCategory());
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          v44.__r_.__value_.__r.__words[0] = (std::string::size_type)strerror(v5);
          caulk::slog::detail::string_converter::string_converter<char *>(&__p, (const char **)&v44.__r_.__value_.__l.__data_);
          LODWORD(buf.__r_.__value_.__l.__data_) = 136315906;
          *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"CAReportingPerformanceUtility.mm";
          WORD2(buf.__r_.__value_.__r.__words[1]) = 1024;
          *(_DWORD *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = 100;
          WORD1(buf.__r_.__value_.__r.__words[2]) = 1024;
          HIDWORD(buf.__r_.__value_.__r.__words[2]) = v5;
          v54 = 2080;
          *(_QWORD *)v55 = *(_QWORD *)&v58[6];
          _os_log_impl(&dword_18F18F000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d pc_session_destroy failed { (*__error())=%i, strerror=\"%s\" }", (uint8_t *)&buf, 0x22u);
          if ((_BYTE)v57)
          {
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__p.__r_.__value_.__l.__data_);
          }
        }

      }
      v7 = -[CAReportingPerformanceObject sessions](self, "sessions");
      ++v4;
    }
    while (v4 < (uint64_t)(v7[1] - *v7) >> 3);
  }
  v8 = -[CAReportingPerformanceObject sessions](self, "sessions");
  v8[1] = *v8;
  v9 = -[CAReportingPerformanceObject sessions](self, "sessions");
  -[CAReportingPerformanceObject processIdentifiers](self, "processIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<pc_session *>::reserve(v9, objc_msgSend(v10, "count"));

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  -[CAReportingPerformanceObject processIdentifiers](self, "processIdentifiers");
  obj = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v50 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        __errnum = 0;
        v15 = pc_session_create();
        if (!v15)
        {
          v17 = objc_retainAutorelease(*(id *)AA_PerformanceUtilityCategory());
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v18 = __errnum;
            v47 = strerror(__errnum);
            caulk::slog::detail::string_converter::string_converter<char *>(&buf, (const char **)&v47);
            v19 = *(_QWORD *)&v55[6];
            v20 = __error();
            v43 = strerror(*v20);
            caulk::slog::detail::string_converter::string_converter<char *>(&v44, (const char **)&v43);
            LODWORD(__p.__r_.__value_.__l.__data_) = 136316162;
            *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)"CAReportingPerformanceUtility.mm";
            WORD2(__p.__r_.__value_.__r.__words[1]) = 1024;
            *(_DWORD *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = 133;
            WORD1(__p.__r_.__value_.__r.__words[2]) = 1024;
            HIDWORD(__p.__r_.__value_.__r.__words[2]) = v18;
            v57 = 2080;
            *(_QWORD *)v58 = v19;
            *(_WORD *)&v58[8] = 2080;
            *(_QWORD *)&v58[10] = v46;
            _os_log_impl(&dword_18F18F000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d pc_session_create failed { (*__error())=%i, strerror=\"%s\", strerror((*__error()))=\"%s\" }", (uint8_t *)&__p, 0x2Cu);
            if (v45 && SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v44.__r_.__value_.__l.__data_);
            if ((_BYTE)v54 && SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
              operator delete(buf.__r_.__value_.__l.__data_);
          }
          goto LABEL_47;
        }
        objc_msgSend(v14, "intValue");
        v16 = pc_session_set_procpid();
        if (v16)
        {
          v17 = objc_retainAutorelease(*(id *)AA_PerformanceUtilityCategory());
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v44.__r_.__value_.__r.__words[0] = (std::string::size_type)strerror(v16);
            caulk::slog::detail::string_converter::string_converter<char *>(&__p, (const char **)&v44.__r_.__value_.__l.__data_);
            LODWORD(buf.__r_.__value_.__l.__data_) = 136315906;
            *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"CAReportingPerformanceUtility.mm";
            WORD2(buf.__r_.__value_.__r.__words[1]) = 1024;
            *(_DWORD *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = 111;
            WORD1(buf.__r_.__value_.__r.__words[2]) = 1024;
            HIDWORD(buf.__r_.__value_.__r.__words[2]) = v16;
            v54 = 2080;
            *(_QWORD *)v55 = *(_QWORD *)&v58[6];
            _os_log_impl(&dword_18F18F000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d pc_session_set_procpid failed { (*__error())=%i, strerror=\"%s\" }", (uint8_t *)&buf, 0x22u);
            if ((_BYTE)v57)
            {
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                operator delete(__p.__r_.__value_.__l.__data_);
            }
          }
LABEL_47:

          continue;
        }
        v21 = pc_session_add_metric();
        if (v21)
        {
          v22 = objc_retainAutorelease(*(id *)AA_PerformanceUtilityCategory());
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            v44.__r_.__value_.__r.__words[0] = (std::string::size_type)strerror(v21);
            caulk::slog::detail::string_converter::string_converter<char *>(&__p, (const char **)&v44.__r_.__value_.__l.__data_);
            LODWORD(buf.__r_.__value_.__l.__data_) = 136315906;
            *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"CAReportingPerformanceUtility.mm";
            WORD2(buf.__r_.__value_.__r.__words[1]) = 1024;
            *(_DWORD *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = 117;
            WORD1(buf.__r_.__value_.__r.__words[2]) = 1024;
            HIDWORD(buf.__r_.__value_.__r.__words[2]) = v21;
            v54 = 2080;
            *(_QWORD *)v55 = *(_QWORD *)&v58[6];
            _os_log_impl(&dword_18F18F000, v22, OS_LOG_TYPE_ERROR, "%25s:%-5d pc_session_add_metric for kPCMetricDirtyMemRecentPeakID failed { (*__error())=%i, strerror=\"%s\" }", (uint8_t *)&buf, 0x22u);
            if ((_BYTE)v57)
            {
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                operator delete(__p.__r_.__value_.__l.__data_);
            }
          }

        }
        pc_session_add_metric();
        if (v21)
        {
          v23 = objc_retainAutorelease(*(id *)AA_PerformanceUtilityCategory());
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v44.__r_.__value_.__r.__words[0] = (std::string::size_type)strerror(v21);
            caulk::slog::detail::string_converter::string_converter<char *>(&__p, (const char **)&v44.__r_.__value_.__l.__data_);
            LODWORD(buf.__r_.__value_.__l.__data_) = 136315906;
            *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"CAReportingPerformanceUtility.mm";
            WORD2(buf.__r_.__value_.__r.__words[1]) = 1024;
            *(_DWORD *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = 122;
            WORD1(buf.__r_.__value_.__r.__words[2]) = 1024;
            HIDWORD(buf.__r_.__value_.__r.__words[2]) = v21;
            v54 = 2080;
            *(_QWORD *)v55 = *(_QWORD *)&v58[6];
            _os_log_impl(&dword_18F18F000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d pc_session_add_metric for kPCMetricDirtyMemPeakDeltaID failed { (*__error())=%i, strerror=\"%s\" }", (uint8_t *)&buf, 0x22u);
            if ((_BYTE)v57)
            {
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                operator delete(__p.__r_.__value_.__l.__data_);
            }
          }

        }
        v24 = pc_session_begin();
        if (v24)
        {
          v17 = objc_retainAutorelease(*(id *)AA_PerformanceUtilityCategory());
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v44.__r_.__value_.__r.__words[0] = (std::string::size_type)strerror(v24);
            caulk::slog::detail::string_converter::string_converter<char *>(&__p, (const char **)&v44.__r_.__value_.__l.__data_);
            LODWORD(buf.__r_.__value_.__l.__data_) = 136315906;
            *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"CAReportingPerformanceUtility.mm";
            WORD2(buf.__r_.__value_.__r.__words[1]) = 1024;
            *(_DWORD *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = 127;
            WORD1(buf.__r_.__value_.__r.__words[2]) = 1024;
            HIDWORD(buf.__r_.__value_.__r.__words[2]) = v24;
            v54 = 2080;
            *(_QWORD *)v55 = *(_QWORD *)&v58[6];
            _os_log_impl(&dword_18F18F000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d pc_session_begin failed { (*__error())=%i, strerror=\"%s\" }", (uint8_t *)&buf, 0x22u);
            if ((_BYTE)v57)
            {
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                operator delete(__p.__r_.__value_.__l.__data_);
            }
          }
          goto LABEL_47;
        }
        v25 = -[CAReportingPerformanceObject sessions](self, "sessions");
        v26 = (unint64_t)v25[2];
        v27 = (uint64_t *)v25[1];
        if ((unint64_t)v27 >= v26)
        {
          v29 = ((char *)v27 - (_BYTE *)*v25) >> 3;
          if ((unint64_t)(v29 + 1) >> 61)
            std::vector<pc_session *>::__throw_length_error[abi:ne180100]();
          v30 = v26 - (_QWORD)*v25;
          v31 = v30 >> 2;
          if (v30 >> 2 <= (unint64_t)(v29 + 1))
            v31 = v29 + 1;
          if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8)
            v32 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v32 = v31;
          if (v32)
            v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<pc_session *>>((uint64_t)(v25 + 2), v32);
          else
            v33 = 0;
          v34 = (uint64_t *)&v33[8 * v29];
          *v34 = v15;
          v28 = v34 + 1;
          v36 = (char *)*v25;
          v35 = (char *)v25[1];
          if (v35 != *v25)
          {
            do
            {
              v37 = *((_QWORD *)v35 - 1);
              v35 -= 8;
              *--v34 = v37;
            }
            while (v35 != v36);
            v35 = (char *)*v25;
          }
          *v25 = v34;
          v25[1] = v28;
          v25[2] = &v33[8 * v32];
          if (v35)
            operator delete(v35);
        }
        else
        {
          *v27 = v15;
          v28 = v27 + 1;
        }
        v25[1] = v28;
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    }
    while (v11);
  }

  -[CAReportingPerformanceObject setHostApplicationDisplayID:](self, "setHostApplicationDisplayID:", CFSTR("unknown"));
  -[NSDictionary objectForKeyedSubscript:](self->_configuration, "objectForKeyedSubscript:", CFSTR("HostApplicationDisplayID"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAReportingPerformanceObject setHostApplicationDisplayID:](self, "setHostApplicationDisplayID:", v38);

  v39 = objc_retainAutorelease(*(id *)AA_PerformanceUtilityCategory());
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(__p.__r_.__value_.__l.__data_) = 136315394;
    *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)"CAReportingPerformanceUtility.mm";
    WORD2(__p.__r_.__value_.__r.__words[1]) = 1024;
    *(_DWORD *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = 142;
    _os_log_impl(&dword_18F18F000, v39, OS_LOG_TYPE_DEFAULT, "%25s:%-5d CAReportingPerformanceObject action=begin", (uint8_t *)&__p, 0x12u);
  }
  -[CAReportingPerformanceObject sessionsLock](self, "sessionsLock");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "unlock");

}

- (void)sessions
{
  return &self->_sessions;
}

- (void)setConfiguration:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[CAReportingPerformanceObject sessionsLock](self, "sessionsLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lock");

  objc_storeStrong((id *)&self->_configuration, a3);
  -[NSDictionary objectForKey:](self->_configuration, "objectForKey:", CFSTR("CAReportingPerfProcesses"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NSDictionary objectForKey:](self->_configuration, "objectForKey:", CFSTR("CAReportingPerfProcesses"));
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          -[CAReportingPerformanceObject processIdentifiers](self, "processIdentifiers", (_QWORD)v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "containsObject:", v12);

          if ((v14 & 1) == 0)
          {
            -[CAReportingPerformanceObject processIdentifiers](self, "processIdentifiers");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v12);

          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

  }
  -[CAReportingPerformanceObject sessionsLock](self, "sessionsLock", (_QWORD)v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "unlock");

}

- (NSLock)sessionsLock
{
  return self->_sessionsLock;
}

- (CAReportingPerformanceObject)initWithProcessIdentifiers:(id)a3
{
  id v4;
  CAReportingPerformanceObject *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  CAReportingPerformanceObject *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((CAReportingUtilityIsInternalBuild() & 1) != 0)
  {
    v20.receiver = self;
    v20.super_class = (Class)CAReportingPerformanceObject;
    v5 = -[CAReportingPerformanceObject init](&v20, sel_init);
    if (v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[CAReportingPerformanceObject setProcessIdentifiers:](v5, "setProcessIdentifiers:", v6);

      v7 = objc_alloc_init(MEMORY[0x1E0CB3740]);
      -[CAReportingPerformanceObject setSessionsLock:](v5, "setSessionsLock:", v7);

      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v8 = v4;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v17;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v17 != v10)
              objc_enumerationMutation(v8);
            v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
            -[CAReportingPerformanceObject processIdentifiers](v5, "processIdentifiers", (_QWORD)v16);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v12);

            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        }
        while (v9);
      }

    }
    self = v5;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSMutableArray)processIdentifiers
{
  return self->_processIdentifiers;
}

- (void)setSessionsLock:(id)a3
{
  objc_storeStrong((id *)&self->_sessionsLock, a3);
}

- (void)setProcessIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_processIdentifiers, a3);
}

- (void)setHostApplicationDisplayID:(id)a3
{
  objc_storeStrong((id *)&self->_hostApplicationDisplayID, a3);
}

BOOL __62__CAReportingPerformanceObject_endAndReturnPerformanceMetrics__block_invoke()
{
  _BOOL8 result;

  result = CAReportingUtilityReadBooleanPref(CFSTR("careporting_enable_perfwriter"), CFSTR("com.apple.coreaudio"));
  -[CAReportingPerformanceObject endAndReturnPerformanceMetrics]::perfWriterEnabled = result;
  return result;
}

- (id)endAndReturnPerformanceMetrics
{
  void *v3;
  unint64_t v4;
  __int128 v5;
  _QWORD *v6;
  int v7;
  NSObject *v8;
  uint64_t procname;
  uint64_t v10;
  __CFString *v11;
  id v12;
  __CFString *v13;
  int values;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  NSObject *v23;
  _QWORD *v24;
  NSObject *v25;
  void *v26;
  id v27;
  __int128 v29;
  char *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  std::string __p;
  char v38;
  uint64_t v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  int v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  v36 = (id)objc_opt_new();
  if (-[CAReportingPerformanceObject endAndReturnPerformanceMetrics]::once != -1)
    dispatch_once(&-[CAReportingPerformanceObject endAndReturnPerformanceMetrics]::once, &__block_literal_global_0);
  -[CAReportingPerformanceObject sessionsLock](self, "sessionsLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = 0;
  *(_QWORD *)&v5 = 136315394;
  v29 = v5;
  while (1)
  {
    v6 = -[CAReportingPerformanceObject sessions](self, "sessions", v29);
    if (v4 >= (uint64_t)(v6[1] - *v6) >> 3)
      break;
    if (*(_QWORD *)(*(_QWORD *)-[CAReportingPerformanceObject sessions](self, "sessions") + 8 * v4))
    {
      -[CAReportingPerformanceObject sessions](self, "sessions");
      v7 = pc_session_end();
      if (v7)
      {
        v8 = objc_retainAutorelease(*(id *)AA_PerformanceUtilityCategory());
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v30 = strerror(v7);
          caulk::slog::detail::string_converter::string_converter<char *>(&__p, (const char **)&v30);
          *(_DWORD *)buf = 136315906;
          v41 = "CAReportingPerformanceUtility.mm";
          v42 = 1024;
          v43 = 172;
          v44 = 1024;
          v45 = v7;
          v46 = 2080;
          v47 = v39;
          _os_log_impl(&dword_18F18F000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d pc_session_end failed { (*__error())=%i, strerror=\"%s\" }", buf, 0x22u);
          if (v38)
          {
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__p.__r_.__value_.__l.__data_);
          }
        }

      }
      -[CAReportingPerformanceObject sessions](self, "sessions");
      procname = pc_session_get_procname();
      if (procname)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", procname);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
          v11 = (__CFString *)v10;
        else
          v11 = CFSTR("Unknown");
        v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend((id)v32[5], "setObject:forKeyedSubscript:", v12, v11);

        -[CAReportingPerformanceObject sessions](self, "sessions");
        v13 = v11;
        values = pc_session_get_values();
        if (values)
        {
          v15 = objc_retainAutorelease(*(id *)AA_PerformanceUtilityCategory());
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v30 = strerror(values);
            caulk::slog::detail::string_converter::string_converter<char *>(&__p, (const char **)&v30);
            *(_DWORD *)buf = 136315906;
            v41 = "CAReportingPerformanceUtility.mm";
            v42 = 1024;
            v43 = 200;
            v44 = 1024;
            v45 = values;
            v46 = 2080;
            v47 = v39;
            _os_log_impl(&dword_18F18F000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d pc_session_get_values failed { (*__error())=%i, strerror=\"%s\" }", buf, 0x22u);
            if (v38)
            {
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                operator delete(__p.__r_.__value_.__l.__data_);
            }
          }

        }
        if (-[CAReportingPerformanceObject endAndReturnPerformanceMetrics]::perfWriterEnabled)
        {
          -[CAReportingPerformanceObject hostApplicationDisplayID](self, "hostApplicationDisplayID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v32[5], "objectForKeyedSubscript:", v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("HostApplicationDisplayID"));

          CAReportingUtilityGenerateServiceNameFromServiceType(self->_serviceType);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v32[5], "objectForKeyedSubscript:", v13);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("serviceType"));

        }
      }
      else
      {
        v21 = objc_retainAutorelease(*(id *)AA_PerformanceUtilityCategory());
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          LODWORD(__p.__r_.__value_.__l.__data_) = v29;
          *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)"CAReportingPerformanceUtility.mm";
          WORD2(__p.__r_.__value_.__r.__words[1]) = 1024;
          *(_DWORD *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = 208;
          _os_log_impl(&dword_18F18F000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d pc_session_get_procname failed", (uint8_t *)&__p, 0x12u);
        }
      }
      -[CAReportingPerformanceObject sessions](self, "sessions");
      v22 = pc_session_destroy();
      if (v22)
      {
        v23 = objc_retainAutorelease(*(id *)AA_PerformanceUtilityCategory());
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v30 = strerror(v22);
          caulk::slog::detail::string_converter::string_converter<char *>(&__p, (const char **)&v30);
          *(_DWORD *)buf = 136315906;
          v41 = "CAReportingPerformanceUtility.mm";
          v42 = 1024;
          v43 = 213;
          v44 = 1024;
          v45 = v22;
          v46 = 2080;
          v47 = v39;
          _os_log_impl(&dword_18F18F000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d pc_session_destroy failed { (*__error())=%i, strerror=\"%s\" }", buf, 0x22u);
          if (v38)
          {
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__p.__r_.__value_.__l.__data_);
          }
        }

      }
    }
    else
    {
      v20 = objc_retainAutorelease(*(id *)AA_PerformanceUtilityCategory());
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        LODWORD(__p.__r_.__value_.__l.__data_) = v29;
        *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)"CAReportingPerformanceUtility.mm";
        WORD2(__p.__r_.__value_.__r.__words[1]) = 1024;
        *(_DWORD *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = 166;
        _os_log_impl(&dword_18F18F000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d Attempting to end invalid pc_session", (uint8_t *)&__p, 0x12u);
      }
    }
    ++v4;
  }
  v24 = -[CAReportingPerformanceObject sessions](self, "sessions");
  v24[1] = *v24;
  v25 = objc_retainAutorelease(*(id *)AA_PerformanceUtilityCategory());
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(__p.__r_.__value_.__l.__data_) = v29;
    *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)"CAReportingPerformanceUtility.mm";
    WORD2(__p.__r_.__value_.__r.__words[1]) = 1024;
    *(_DWORD *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = 219;
    _os_log_impl(&dword_18F18F000, v25, OS_LOG_TYPE_DEFAULT, "%25s:%-5d CAReportingPerformanceObject action=destroy", (uint8_t *)&__p, 0x12u);
  }
  -[CAReportingPerformanceObject sessionsLock](self, "sessionsLock");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "unlock");

  v27 = (id)v32[5];
  _Block_object_dispose(&v31, 8);

  return v27;
}

void __62__CAReportingPerformanceObject_endAndReturnPerformanceMetrics__block_invoke_18(uint64_t a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (-[CAReportingPerformanceObject endAndReturnPerformanceMetrics]::perfWriterEnabled)
    {
      v19[0] = CFSTR("value");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19[1] = CFSTR("unit");
      v20[0] = v13;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v12);

    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v12;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addEntriesFromDictionary:", v15);
    }

  }
}

- (void)abandon
{
  void *v3;
  _QWORD *v4;
  _QWORD *v5;
  __int128 v6;
  unint64_t v7;
  int v8;
  NSObject *v9;
  int v10;
  NSObject *v11;
  _QWORD *v12;
  _QWORD *v13;
  void *v14;
  BOOL v15;
  void *v16;
  NSObject *v17;
  void *v18;
  __int128 v19;
  char *v20;
  std::string __p;
  char v22;
  uint64_t v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[CAReportingPerformanceObject sessionsLock](self, "sessionsLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = -[CAReportingPerformanceObject sessions](self, "sessions");
  if (*v4 != v4[1])
  {
    v5 = -[CAReportingPerformanceObject sessions](self, "sessions");
    if (v5[1] != *v5)
    {
      v7 = 0;
      *(_QWORD *)&v6 = 136315906;
      v19 = v6;
      do
      {
        -[CAReportingPerformanceObject sessions](self, "sessions", v19);
        v8 = pc_session_end();
        if (v8)
        {
          v9 = objc_retainAutorelease(*(id *)AA_PerformanceUtilityCategory());
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            v20 = strerror(v8);
            caulk::slog::detail::string_converter::string_converter<char *>(&__p, (const char **)&v20);
            *(_DWORD *)buf = v19;
            v25 = "CAReportingPerformanceUtility.mm";
            v26 = 1024;
            v27 = 240;
            v28 = 1024;
            v29 = v8;
            v30 = 2080;
            v31 = v23;
            _os_log_impl(&dword_18F18F000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d pc_session_end failed { (*__error())=%i, strerror=\"%s\" }", buf, 0x22u);
            if (v22)
            {
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                operator delete(__p.__r_.__value_.__l.__data_);
            }
          }

        }
        -[CAReportingPerformanceObject sessions](self, "sessions");
        v10 = pc_session_destroy();
        if (v10)
        {
          v11 = objc_retainAutorelease(*(id *)AA_PerformanceUtilityCategory());
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            v20 = strerror(v10);
            caulk::slog::detail::string_converter::string_converter<char *>(&__p, (const char **)&v20);
            *(_DWORD *)buf = v19;
            v25 = "CAReportingPerformanceUtility.mm";
            v26 = 1024;
            v27 = 245;
            v28 = 1024;
            v29 = v10;
            v30 = 2080;
            v31 = v23;
            _os_log_impl(&dword_18F18F000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d pc_session_destroy failed { (*__error())=%i, strerror=\"%s\" }", buf, 0x22u);
            if (v22)
            {
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                operator delete(__p.__r_.__value_.__l.__data_);
            }
          }

        }
        v12 = -[CAReportingPerformanceObject sessions](self, "sessions");
        ++v7;
      }
      while (v7 < (uint64_t)(v12[1] - *v12) >> 3);
    }
    v13 = -[CAReportingPerformanceObject sessions](self, "sessions");
    v13[1] = *v13;
  }
  -[CAReportingPerformanceObject processIdentifiers](self, "processIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count") == 0;

  if (!v15)
  {
    -[CAReportingPerformanceObject processIdentifiers](self, "processIdentifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeAllObjects");

  }
  v17 = objc_retainAutorelease(*(id *)AA_PerformanceUtilityCategory());
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(__p.__r_.__value_.__l.__data_) = 136315394;
    *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)"CAReportingPerformanceUtility.mm";
    WORD2(__p.__r_.__value_.__r.__words[1]) = 1024;
    *(_DWORD *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = 255;
    _os_log_impl(&dword_18F18F000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d CAReportingPerformanceObject action=abandon", (uint8_t *)&__p, 0x12u);
  }
  -[CAReportingPerformanceObject sessionsLock](self, "sessionsLock");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "unlock");

}

- (NSDictionary)performanceMetrics
{
  return self->_performanceMetrics;
}

- (unsigned)serviceType
{
  return self->_serviceType;
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setSessions:(void *)a3
{
  char *p_sessions;

  p_sessions = (char *)&self->_sessions;
  if (p_sessions != a3)
    std::vector<pc_session *>::__assign_with_size[abi:ne180100]<pc_session **,pc_session **>(p_sessions, *(char **)a3, *((_QWORD *)a3 + 1), (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3);
}

- (NSString)hostApplicationDisplayID
{
  return self->_hostApplicationDisplayID;
}

@end
