void start()
{
  std::string *v0;
  std::string *v1;
  int v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  std::__fs::filesystem::path *p_to;
  _BOOL8 v7;
  NSObject *v8;
  NSObject *v9;
  std::__fs::filesystem::path *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  _opaque_pthread_t *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *queue;
  int out_token[2];
  int __relative_priority[2];
  std::error_code __ec;
  std::__fs::filesystem::path __new_symlink;
  std::__fs::filesystem::path __to;
  _BYTE buf[18];
  __int16 v30;
  std::__fs::filesystem::path *v31;
  __int16 v32;
  int val;

  +[NSError _setFileNameLocalizationEnabled:](NSError, "_setFileNameLocalizationEnabled:", 0);
  _set_user_dir_suffix("com.apple.audiomxd");
  v0 = -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@AudioCapture"), NSTemporaryDirectory()), "UTF8String");
  memset(&__to, 0, sizeof(__to));
  v1 = (std::string *)((char *)v0 - 1);
  do
  {
    v2 = v1->__r_.__value_.__s.__data_[1];
    v1 = (std::string *)((char *)v1 + 1);
  }
  while (v2);
  sub_100004AC4(&__to.__pn_, v0, v1);
  memset(&__new_symlink, 0, sizeof(__new_symlink));
  sub_100004AC4(&__new_symlink.__pn_, (std::string *)"/var/tmp/AudioCapture", (std::string *)"");
  __ec.__val_ = 0;
  __ec.__cat_ = std::system_category();
  std::__fs::filesystem::__create_directory_symlink(&__to, &__new_symlink, &__ec);
  if (__ec.__val_)
  {
    if (__ec.__val_ != 17)
    {
      v4 = CADefaultLog(v3);
      v5 = v4;
      if (v4)
      {
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          p_to = &__to;
          if ((__to.__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
            p_to = (std::__fs::filesystem::path *)__to.__pn_.__r_.__value_.__r.__words[0];
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "mediaserverd.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 185;
          v30 = 2080;
          v31 = p_to;
          v32 = 1024;
          val = __ec.__val_;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Error creating symlink to %s. Code:%d", buf, 0x22u);
        }
      }
    }
  }
  v7 = std::__fs::filesystem::__create_directory(&__to, &__ec);
  if (__ec.__val_)
  {
    if (__ec.__val_ != 17)
    {
      v8 = CADefaultLog(v7);
      v9 = v8;
      if (v8)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v10 = &__to;
          if ((__to.__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
            v10 = (std::__fs::filesystem::path *)__to.__pn_.__r_.__value_.__r.__words[0];
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "mediaserverd.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 189;
          v30 = 2080;
          v31 = v10;
          v32 = 1024;
          val = __ec.__val_;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Error creating %s path. Code:%d", buf, 0x22u);
        }
      }
    }
  }
  setiopolicy_np(9, 0, 1);
  if (qword_10000C040 != -1)
    dispatch_once(&qword_10000C040, &stru_1000085D8);
  v11 = os_signpost_id_generate((os_log_t)qword_10000C038);
  if (qword_10000C040 != -1)
    dispatch_once(&qword_10000C040, &stru_1000085D8);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v12 = qword_10000C038;
    if (os_signpost_enabled((os_log_t)qword_10000C038))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, v11, "mediaserverdSubServerCreationTime", " enableTelemetry=YES ", buf, 2u);
      if (qword_10000C040 != -1)
        dispatch_once(&qword_10000C040, &stru_1000085D8);
    }
    v13 = qword_10000C038;
    if (os_signpost_enabled((os_log_t)qword_10000C038))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "mediaserverdStartTime", " enableTelemetry=YES ", buf, 2u);
    }
  }
  pthread_set_fixedpriority_self();
  *(_QWORD *)__relative_priority = 0;
  v14 = pthread_self();
  if (!pthread_get_qos_class_np(v14, (qos_class_t *)&__relative_priority[1], __relative_priority))
    pthread_set_qos_class_self_np(QOS_CLASS_USER_INITIATED, 0);
  v15 = getprogname();
  openlog(v15, 40, 24);
  v16 = getpid();
  proc_disable_wakemon(v16);
  wd_endpoint_register("com.apple.audiomxd.watchdog");
  out_token[0] = 0;
  v17 = notify_register_dispatch("com.apple.language.changed", out_token, (dispatch_queue_t)&_dispatch_main_q, &stru_100008638);
  v18 = v17;
  if ((_DWORD)v17)
  {
    v19 = CADefaultLog(v17);
    v20 = v19;
    if (v19)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "mediaserverd.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 147;
        v30 = 1024;
        LODWORD(v31) = v18;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d Could not register for language change notification, err = %u", buf, 0x18u);
      }
    }
  }
  qword_10000C030 = (uint64_t)CFRunLoopGetCurrent();
  queue = dispatch_queue_create("com.apple.coreaudio.mediaserverd.cleanup", 0);
  objc_autoreleasePoolPush();
  signal(15, (void (__cdecl *)(int))1);
  signal(1, (void (__cdecl *)(int))1);
  signal(13, (void (__cdecl *)(int))1);
  v21 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, queue);
  if (v21)
  {
    v22 = v21;
    dispatch_source_set_event_handler(v21, &stru_1000085F8);
    dispatch_resume(v22);
    operator new();
  }
  __assert_rtn("main", "mediaserverd.mm", 239, "gSTS_TERM != NULL");
}

void sub_100004470(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  if (a30 < 0)
    operator delete(__p);
  if (a36 < 0)
    operator delete(a31);
  _Unwind_Resume(exception_object);
}

void sub_1000045A4(std::exception *a1)
{
  std::exception::~exception(a1);
  operator delete();
}

const char *sub_1000045C8()
{
  return "CAException";
}

void sub_1000045D8(uint64_t a1)
{
  sub_100004648(a1);
  operator delete();
}

void sub_100004600(uint64_t a1)
{
  sub_100004648(a1);
  operator delete();
}

uint64_t sub_100004624(uint64_t result)
{
  *(_BYTE *)(result + 8) = 1;
  return result;
}

uint64_t sub_100004630(uint64_t result)
{
  *(_BYTE *)(result + 8) = 0;
  return result;
}

uint64_t sub_100004638()
{
  return 0;
}

uint64_t sub_100004640()
{
  return 0;
}

uint64_t sub_100004648(uint64_t result)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  *(_QWORD *)result = &off_100008588;
  if (*(_BYTE *)(result + 8))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v1 = 136315394;
      v2 = "CAD_SubServer.cpp";
      v3 = 1024;
      v4 = 36;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d  CAD_SubServer::~CAD_SubServer: still running at destruction", (uint8_t *)&v1, 0x12u);
    }
    __break(1u);
  }
  return result;
}

void sub_100004708(id a1)
{
  qword_10000C038 = (uint64_t)os_log_create("com.apple.coreaudio.mediaserverd", "service");
}

void sub_100004734(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_100004744()
{
  sub_1000048AC("vector");
}

void *sub_100004758(unint64_t a1)
{
  if (a1 >> 61)
    sub_100004884();
  return operator new(8 * a1);
}

uint64_t sub_10000478C(uint64_t a1)
{
  const void *v2;

  if (*(_BYTE *)(a1 + 8))
  {
    v2 = *(const void **)a1;
    if (*(_QWORD *)a1)
      CFRelease(v2);
  }
  return a1;
}

uint64_t sub_1000047C4()
{
  uint64_t v0;
  char *v1;
  char *v3;
  __int128 v4;
  uint64_t v5;

  v3 = 0;
  if (!qword_10000C058)
  {
    v4 = off_1000086E0;
    v5 = 0;
    qword_10000C058 = _sl_dlopen(&v4, &v3);
    v1 = v3;
    v0 = qword_10000C058;
    if (qword_10000C058)
    {
      if (!v3)
        return v0;
    }
    else
    {
      v1 = (char *)abort_report_np("%s", v3);
    }
    free(v1);
    return v0;
  }
  return qword_10000C058;
}

void sub_100004884()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void sub_1000048AC(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1000048FC(exception, a1);
}

void sub_1000048E8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1000048FC(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_100004924(uint64_t a1)
{
  sub_100004648(a1);
  operator delete();
}

uint64_t sub_100004948()
{
  uint64_t result;

  result = audiomxd_enabled();
  if ((_DWORD)result)
    return AudioToolboxServerInit(1);
  return result;
}

void sub_10000496C(id a1)
{
  NSObject *v1;
  NSObject *v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;

  v1 = CADefaultLog(a1);
  if (v1)
  {
    v2 = v1;
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      v3 = 136315394;
      v4 = "mediaserverd.mm";
      v5 = 1024;
      v6 = 241;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%25s:%-5d SIGTERM received, process about to terminate.", (uint8_t *)&v3, 0x12u);
    }
  }
  if (qword_10000C030)
  {
    byte_10000C048 = 1;
    CFRunLoopStop((CFRunLoopRef)qword_10000C030);
  }
}

void sub_100004A38(id a1, int a2)
{
  NSObject *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;

  v2 = CADefaultLog(a1);
  if (v2)
  {
    v3 = v2;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315394;
      v5 = "mediaserverd.mm";
      v6 = 1024;
      v7 = 138;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d com.apple.language.changed notification received, audiomxd exiting", (uint8_t *)&v4, 0x12u);
    }
  }
  exit(0);
}

std::string *sub_100004AC4(std::string *this, std::string *a2, std::string *a3)
{
  std::string *v4;
  unint64_t v6;
  unint64_t v7;
  std::string::size_type size;
  std::string::size_type v9;
  std::string *v10;
  unint64_t v11;
  std::string::value_type *p_p;
  std::string *v13;
  std::string::value_type *v14;
  std::string::value_type v15;
  std::string::size_type v16;
  uint64_t v17;
  uint64_t v18;
  std::string::value_type v19;
  const std::string::value_type *v20;
  std::string::size_type v21;
  void *__p;
  std::string::size_type v24;
  int64_t v25;

  v4 = a2;
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  v7 = (char *)a3 - (char *)a2;
  if ((v6 & 0x80000000) != 0)
  {
    if (a3 == a2)
      return this;
    size = this->__r_.__value_.__l.__size_;
    v11 = this->__r_.__value_.__r.__words[2];
    v9 = (v11 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    v10 = (std::string *)this->__r_.__value_.__r.__words[0];
    v6 = HIBYTE(v11);
  }
  else
  {
    if (a3 == a2)
      return this;
    size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    v9 = 22;
    v10 = this;
  }
  if (v10 > v4 || (std::string *)((char *)&v10->__r_.__value_.__l.__data_ + size + 1) <= v4)
  {
    if (v9 - size < v7)
    {
      std::string::__grow_by(this, v9, size - v9 + v7, size, size, 0, 0);
      this->__r_.__value_.__l.__size_ = size;
      LOBYTE(v6) = *((_BYTE *)&this->__r_.__value_.__s + 23);
    }
    v13 = this;
    if ((v6 & 0x80) != 0)
      v13 = (std::string *)this->__r_.__value_.__r.__words[0];
    v14 = (char *)v13 + size;
    do
    {
      v15 = v4->__r_.__value_.__s.__data_[0];
      v4 = (std::string *)((char *)v4 + 1);
      *v14++ = v15;
    }
    while (v4 != a3);
    *v14 = 0;
    v16 = v7 + size;
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
      this->__r_.__value_.__l.__size_ = v16;
    else
      *((_BYTE *)&this->__r_.__value_.__s + 23) = v16 & 0x7F;
  }
  else
  {
    if (v7 >= 0x7FFFFFFFFFFFFFF8)
      sub_100004C80();
    if (v7 > 0x16)
    {
      v17 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v7 | 7) != 0x17)
        v17 = v7 | 7;
      v18 = v17 + 1;
      p_p = (std::string::value_type *)operator new(v17 + 1);
      v24 = v7;
      v25 = v18 | 0x8000000000000000;
      __p = p_p;
    }
    else
    {
      HIBYTE(v25) = v7;
      p_p = (std::string::value_type *)&__p;
    }
    do
    {
      v19 = v4->__r_.__value_.__s.__data_[0];
      v4 = (std::string *)((char *)v4 + 1);
      *p_p++ = v19;
    }
    while (v4 != a3);
    *p_p = 0;
    if (v25 >= 0)
      v20 = (const std::string::value_type *)&__p;
    else
      v20 = (const std::string::value_type *)__p;
    if (v25 >= 0)
      v21 = HIBYTE(v25);
    else
      v21 = v24;
    std::string::append(this, v20, v21);
    if (SHIBYTE(v25) < 0)
      operator delete(__p);
  }
  return this;
}

void sub_100004C64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_100004C80()
{
  sub_1000048AC("basic_string");
}

void sub_100004C98()
{
  operator delete();
}

void sub_100004CAC()
{
  operator new();
}

void sub_100004F00()
{
  XPC_Connection *v0;
  _QWORD *v1;

  sub_100006180(v1);
  XPC_Connection::~XPC_Connection(v0);
  operator delete();
}

void sub_100004F78(uint64_t a1, xpc_object_t object)
{
  _xpc_connection_s **v3;
  int PropertyInfo;
  OpaqueAudioFileID *v5;
  AudioFileID *v6;
  xpc_object_t v7;
  void *v8;
  _xpc_connection_s *v9;
  int v10;
  xpc_object_t v11;
  void *v12;
  UInt32 v13;
  int v14;
  xpc_object_t v15;
  AudioFilePropertyID v16;
  xpc_object_t v17;
  void *v18;
  const char *bytes_ptr;
  OpaqueAudioFileID *v20;
  AudioFilePropertyID v21;
  int v22;
  const __CFData *Data;
  unsigned int Length;
  const UInt8 *BytePtr;
  void *v26;
  uint64_t v27;
  uint64_t value;
  int fd;
  UInt32 isWritable[2];
  UInt32 ioDataSize[2];
  UInt32 ioNumPackets;
  UInt32 ioNumBytes;
  SInt64 inStartingPacket;
  AudioFilePropertyID v35;
  char *v36;
  xpc_object_t xdict;
  char v38;
  char *v39;
  xpc_object_t v40;
  char v41;

  v3 = *(_xpc_connection_s ***)(a1 + 40);
  if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_dictionary)
    return;
  v41 = 0;
  v40 = object;
  if (object)
  {
    PropertyInfo = 560821095;
    v38 = 1;
    xdict = xpc_dictionary_create_reply(object);
    v6 = v3 + 6;
    v5 = v3[6];
    v35 = 0;
    v7 = xpc_dictionary_get_value(v40, "type");
    v8 = v7;
    if (!v7 || xpc_get_type(v7) != (xpc_type_t)&_xpc_type_uint64)
    {
LABEL_5:
      if (xdict)
        xpc_dictionary_set_int64(xdict, "status", PropertyInfo);
      goto LABEL_8;
    }
    v10 = xpc_uint64_get_value(v8);
    if (v10 <= 1869636973)
    {
      if (v10 == 1668050803)
      {
        AudioFileClose(*v6);
        PropertyInfo = 0;
        *v6 = 0;
        goto LABEL_5;
      }
      if (v10 != 1768842863)
        goto LABEL_5;
      if (v5)
      {
        if (!sub_100005740((uint64_t)v40, "selector", &v35))
          goto LABEL_57;
        v16 = v35;
        if ((sub_100005798(v35) & 1) != 0 || v16 == 1633776244 || v16 == 1819243876 || v16 == 1768842863)
        {
          LODWORD(v27) = 0;
          LODWORD(inStartingPacket) = 0;
          PropertyInfo = AudioFileGetPropertyInfo(v5, v16, (UInt32 *)&v27, (UInt32 *)&inStartingPacket);
          if (!PropertyInfo)
          {
            if (xdict)
            {
              xpc_dictionary_set_uint64(xdict, "size", v27);
              if (xdict)
                xpc_dictionary_set_uint64(xdict, "writable", inStartingPacket);
            }
          }
          goto LABEL_5;
        }
LABEL_72:
        PropertyInfo = 1886681407;
        goto LABEL_5;
      }
    }
    else
    {
      switch(v10)
      {
        case 1869636974:
          v17 = xpc_dictionary_get_value(v40, "data");
          v18 = v17;
          if (!v17 || xpc_get_type(v17) != (xpc_type_t)&_xpc_type_data)
            goto LABEL_57;
          xpc_data_get_length(v18);
          bytes_ptr = (const char *)xpc_data_get_bytes_ptr(v18);
          v27 = 0;
          PropertyInfo = sub_100005648(bytes_ptr, (CFURLRef *)&v27);
          if (PropertyInfo)
            goto LABEL_5;
          LODWORD(inStartingPacket) = 0;
          sub_100005740((uint64_t)v40, "hint", &inStartingPacket);
          if (!v5)
          {
            PropertyInfo = AudioFileOpenURL((CFURLRef)v27, kAudioFileReadPermission, inStartingPacket, v3 + 6);
            if (!PropertyInfo)
            {
              v20 = v3[6];
              ioDataSize[0] = 40;
              PropertyInfo = AudioFileGetProperty(v20, 0x64666D74u, ioDataSize, v3 + 16);
              if (PropertyInfo)
                AudioFileClose(v20);
            }
            goto LABEL_5;
          }
          break;
        case 1886547824:
          if (v5)
          {
            if (!sub_100005740((uint64_t)v40, "selector", &v35))
              goto LABEL_57;
            v21 = v35;
            v22 = sub_100005798(v35);
            if ((v22 & 1) != 0 || v21 == 1633776244 || v21 == 1819243876 || v21 == 1768842863)
            {
              ioDataSize[0] = 0;
              isWritable[0] = 0;
              PropertyInfo = AudioFileGetPropertyInfo(v5, v21, ioDataSize, isWritable);
              if (PropertyInfo)
                goto LABEL_5;
              if (v21 == 1633776244 || v21 == 1819243876 || v21 == 1768842863)
              {
                inStartingPacket = 0;
                PropertyInfo = AudioFileGetProperty(v5, v21, ioDataSize, &inStartingPacket);
                if (!PropertyInfo)
                {
                  Data = CFPropertyListCreateData(kCFAllocatorDefault, (CFPropertyListRef)inStartingPacket, kCFPropertyListBinaryFormat_v1_0, 0, 0);
                  v27 = (uint64_t)Data;
                  LOBYTE(value) = 1;
                  if (Data)
                  {
                    Length = CFDataGetLength(Data);
                    BytePtr = CFDataGetBytePtr((CFDataRef)v27);
                    if (xdict)
                      xpc_dictionary_set_data(xdict, "data", BytePtr, Length);
                    PropertyInfo = 0;
                  }
                  else
                  {
                    PropertyInfo = 2003334207;
                  }
                  sub_100005970((uint64_t)&v27);
                }
                goto LABEL_5;
              }
              if (v22)
              {
                sub_1000059A8(&v27, ioDataSize[0]);
                PropertyInfo = AudioFileGetProperty(v5, v21, ioDataSize, (void *)v27);
                v26 = (void *)v27;
                if (PropertyInfo)
                {
                  if (v27)
                    free((void *)v27);
                  goto LABEL_5;
                }
                if (xdict)
                {
                  xpc_dictionary_set_data(xdict, "data", (const void *)v27, ioDataSize[0]);
                  v26 = (void *)v27;
                }
                if (v26)
                  free(v26);
                goto LABEL_79;
              }
            }
            goto LABEL_72;
          }
          break;
        case 1919246692:
          ioNumPackets = 0;
          inStartingPacket = 0;
          v11 = xpc_dictionary_get_value(v40, "numbytes");
          v12 = v11;
          if (v11)
          {
            if (xpc_get_type(v11) == (xpc_type_t)&_xpc_type_uint64)
            {
              v13 = xpc_uint64_get_value(v12);
              ioNumBytes = v13;
              if (sub_100005740((uint64_t)v40, "numpackets", &ioNumPackets))
              {
                if (sub_100005A0C((uint64_t)v40, &inStartingPacket))
                {
                  *(_QWORD *)isWritable = 0;
                  *(_QWORD *)ioDataSize = 0;
                  value = 2;
                  v27 = (uint64_t)off_1000087C8;
                  fd = -1;
                  PropertyInfo = sub_100005A6C((uint64_t)(v3 + 7), (uint64_t)(v3 + 16), v13, ioNumPackets, (unsigned int **)ioDataSize, (unsigned int **)isWritable, (uint64_t)&v27);
                  if (PropertyInfo)
                    goto LABEL_5;
                  PropertyInfo = AudioFileReadPacketData(v5, 0, &ioNumBytes, *(AudioStreamPacketDescription **)isWritable, inStartingPacket, &ioNumPackets, *(void **)(*(_QWORD *)ioDataSize + 16));
                  if (PropertyInfo)
                    goto LABEL_5;
                  if (xdict)
                  {
                    xpc_dictionary_set_uint64(xdict, "numbytes", ioNumBytes);
                    if (xdict)
                      xpc_dictionary_set_uint64(xdict, "numpackets", ioNumPackets);
                  }
                  v14 = fd;
                  if (fd)
                  {
                    v15 = xdict;
                    if (xdict)
                    {
                      xpc_dictionary_set_uint64(xdict, "bufsize", HIDWORD(value));
                      v15 = xdict;
                    }
                    xpc_dictionary_set_fd(v15, "bufFD", v14);
                  }
LABEL_79:
                  PropertyInfo = 0;
                  goto LABEL_5;
                }
              }
            }
          }
LABEL_57:
          PropertyInfo = -50;
          goto LABEL_5;
        default:
          goto LABEL_5;
      }
    }
    PropertyInfo = 560951410;
    goto LABEL_5;
  }
  v38 = 1;
  xdict = 0;
LABEL_8:
  v9 = v3[1];
  if (v9)
    xpc_connection_send_message(v9, xdict);
  XPC_Dictionary::~XPC_Dictionary((XPC_Dictionary *)&v36);
  XPC_Dictionary::~XPC_Dictionary((XPC_Dictionary *)&v39);
}

void sub_1000055B0(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  uint64_t v30;
  uint64_t v32;

  XPC_Dictionary::~XPC_Dictionary((XPC_Dictionary *)&v32);
  XPC_Dictionary::~XPC_Dictionary((XPC_Dictionary *)(v30 - 72));
  __cxa_begin_catch(a1);
  __cxa_end_catch();
}

uint64_t sub_100005648(const char *a1, CFURLRef *a2)
{
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  CFURLRef v7;
  const __CFString *v8;

  if (!a1)
    return 4294967246;
  if (strncmp(a1, "ipod-library", 0xCuLL))
    return 4294967253;
  v5 = CFStringCreateWithCString(kCFAllocatorDefault, a1, 0x201u);
  if (!v5)
    return 4294967246;
  v6 = v5;
  v7 = CFURLCreateWithString(kCFAllocatorDefault, v5, 0);
  CFRelease(v6);
  if (!v7)
    return 4294967246;
  if (!PUTIsPersistentURL(v7))
  {
    CFRelease(v7);
    return 4294967253;
  }
  v8 = (const __CFString *)PUTCreatePathForPersistentURL(v7, 0);
  CFRelease(v7);
  v4 = 4294967253;
  if (v8)
  {
    *a2 = CFURLCreateWithString(kCFAllocatorDefault, v8, 0);
    CFRelease(v8);
    if (*a2)
      return 0;
    else
      return 4294967253;
  }
  return v4;
}

uint64_t sub_100005740(uint64_t result, const char *a2, _DWORD *a3)
{
  void *v4;

  if (result)
  {
    result = (uint64_t)xpc_dictionary_get_value((xpc_object_t)result, a2);
    if (result)
    {
      v4 = (void *)result;
      if (xpc_get_type((xpc_object_t)result) == (xpc_type_t)&_xpc_type_uint64)
      {
        *a3 = xpc_uint64_get_value(v4);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_100005798(int a1)
{
  uint64_t result;
  int v3;

  result = 1;
  if (a1 <= 1718775914)
  {
    if (a1 <= 1684434291)
    {
      if (a1 <= 1652125802)
      {
        if (a1 == 1650683508)
          return result;
        v3 = 1651663220;
        goto LABEL_31;
      }
      if (a1 == 1652125803 || a1 == 1667787108)
        return result;
      v3 = 1668112752;
    }
    else if (a1 > 1701082481)
    {
      if (a1 == 1701082482 || a1 == 1717988724)
        return result;
      v3 = 1718383476;
    }
    else
    {
      if (a1 == 1684434292 || a1 == 1685022310)
        return result;
      v3 = 1685289589;
    }
LABEL_31:
    if (a1 != v3)
      return 0;
    return result;
  }
  if (a1 > 1886086769)
  {
    if (a1 > 1886616164)
    {
      if (a1 == 1886616165 || a1 == 1920168566)
        return result;
      v3 = 1935832164;
    }
    else
    {
      if (a1 == 1886086770 || a1 == 1886090594)
        return result;
      v3 = 1886283375;
    }
    goto LABEL_31;
  }
  if (a1 > 1869640812)
  {
    if (a1 == 1869640813 || a1 == 1885564532)
      return result;
    v3 = 1886085753;
    goto LABEL_31;
  }
  if (a1 != 1718775915 && a1 != 1768174452)
  {
    v3 = 1835493731;
    goto LABEL_31;
  }
  return result;
}

uint64_t sub_100005970(uint64_t a1)
{
  const void *v2;

  if (*(_BYTE *)(a1 + 8))
  {
    v2 = *(const void **)a1;
    if (*(_QWORD *)a1)
      CFRelease(v2);
  }
  return a1;
}

_QWORD *sub_1000059A8(_QWORD *a1, size_t size)
{
  void *v4;
  std::bad_alloc *exception;
  std::bad_alloc *v7;

  *a1 = 0;
  v4 = malloc_type_malloc(size, 0x7C51E058uLL);
  if (size && !v4)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v7 = std::bad_alloc::bad_alloc(exception);
  }
  *a1 = v4;
  return a1;
}

uint64_t sub_100005A0C(uint64_t result, int64_t *a2)
{
  void *v3;

  if (result)
  {
    result = (uint64_t)xpc_dictionary_get_value((xpc_object_t)result, "startingPacket");
    if (result)
    {
      v3 = (void *)result;
      if (xpc_get_type((xpc_object_t)result) == (xpc_type_t)&_xpc_type_int64)
      {
        *a2 = xpc_int64_get_value(v3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_100005A6C(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, unsigned int **a5, unsigned int **a6, uint64_t a7)
{
  uint64_t v14;
  unsigned int v15;
  int v16;
  uint64_t v17;
  unsigned int *v18;
  size_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  size_t v24;
  int v25;
  unsigned int v26;
  unsigned int v27;
  pid_t v28;
  int v29;
  void *v30;
  uint64_t memory_entry_64;
  void *v32;
  vm_size_t v33;
  int v34;
  uint64_t v35;
  xpc_object_t v36;
  void *v37;
  xpc_object_t v38;
  void *v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int *v42;
  int v43;
  unsigned int v44;
  unint64_t v45;
  char *v46;
  const void **v47;
  unsigned int v48;
  unsigned int *v49;
  unsigned int *v50;
  _DWORD *v51;
  uint64_t v52;
  unsigned int *v53;
  unsigned int **v54;
  unsigned int v55;
  uint64_t v56;
  unsigned int v57;
  unsigned int *v58;
  _DWORD *exception;
  std::bad_alloc *v61;
  std::bad_alloc *v62;
  int *v63;
  memory_object_size_t size;
  _BYTE __str[12];
  __int16 v66;
  int v67;

  v14 = sub_1000060BC(*(unsigned __int8 *)(a1 + 56));
  v15 = *(_DWORD *)(a2 + 28);
  if ((*(_BYTE *)(a2 + 12) & 0x20) != 0)
  {
    if (v15 - 65 <= 0xFFFFFFBF)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__str = 136315394;
        *(_QWORD *)&__str[4] = "SharedAudioBufferList.h";
        v66 = 1024;
        v67 = 90;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d  STACK_ABL: invalid number of buffers", __str, 0x12u);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(_QWORD *)exception = &off_100008828;
      exception[2] = -50;
    }
    v16 = 1;
  }
  else
  {
    v16 = *(_DWORD *)(a2 + 28);
    v15 = 1;
  }
  __chkstk_darwin(v14);
  v18 = (unsigned int *)((char *)&v63 - v17);
  bzero((char *)&v63 - v17, v19);
  *v18 = v15;
  v20 = v18 + 4;
  v21 = v15;
  do
  {
    *v20 = 0;
    *((_DWORD *)v20 - 2) = v16;
    *((_DWORD *)v20 - 1) = a3;
    v20 += 2;
    --v21;
  }
  while (v21);
  if ((a3 & 0xF) != 0)
    v22 = 16 - (a3 & 0xF);
  else
    v22 = 0;
  sub_1000060BC(*(unsigned __int8 *)(a1 + 56));
  v23 = (v22 + a3) * v15 + 16 * a4 + 32;
  if (HIDWORD(v23))
    return 4294967188;
  sub_1000060BC(*(unsigned __int8 *)(a1 + 56));
  if (*(_QWORD *)(a1 + 16) < (unint64_t)v23)
  {
    v24 = -(int)vm_page_size & (v23 + vm_page_size - 1);
    (*(void (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
    v25 = *(_DWORD *)(a7 + 8);
    if (v25)
    {
      if (v25 == 1)
      {
        *(_QWORD *)(a1 + 16) = v24;
        v32 = mmap(0, v24, 3, 4097, -1, 0);
        *(_QWORD *)(a1 + 24) = v32;
        if ((unint64_t)v32 + 1 > 1)
        {
          *(_WORD *)(a1 + 8) = 257;
          v36 = xpc_shmem_create(v32, *(_QWORD *)(a1 + 16));
          if (!v36)
            v36 = xpc_null_create();
          v37 = *(void **)(a1 + 48);
          *(_QWORD *)(a1 + 48) = v36;
          xpc_release(v37);
          *(_DWORD *)(a7 + 12) = *(_QWORD *)(a1 + 16);
          v38 = *(xpc_object_t *)(a1 + 48);
          if (v38)
            xpc_retain(*(xpc_object_t *)(a1 + 48));
          else
            v38 = xpc_null_create();
          v39 = *(void **)(a7 + 16);
          *(_QWORD *)(a7 + 16) = v38;
          xpc_release(v39);
          goto LABEL_40;
        }
        memory_entry_64 = *__error();
        sub_100006684((uint64_t)"mmap");
        goto LABEL_28;
      }
      if (v25 != 2)
        goto LABEL_40;
      do
      {
        v26 = __ldxr(&dword_10000C06C);
        v27 = v26 + 1;
      }
      while (__stxr(v26 + 1, &dword_10000C06C));
      *(_DWORD *)(a1 + 40) = v27;
      v28 = getpid();
      snprintf(__str, 0x40uLL, "AppleABL.%x.%x", v28, v27);
      v29 = shm_open(__str, 514, 511);
      *(_DWORD *)(a1 + 36) = v29;
      if (v29 == -1)
      {
        sub_100006684((uint64_t)"shm_open");
        memory_entry_64 = *__error();
LABEL_28:
        if ((_DWORD)memory_entry_64)
          return memory_entry_64;
        goto LABEL_40;
      }
      ftruncate(v29, v24);
      *(_QWORD *)(a1 + 16) = v24;
      v30 = mmap(0, v24, 3, 1, *(_DWORD *)(a1 + 36), 0);
      *(_QWORD *)(a1 + 24) = v30;
      if ((unint64_t)v30 + 1 <= 1)
      {
        memory_entry_64 = *__error();
        sub_100006684((uint64_t)"mmap");
        close(*(_DWORD *)(a1 + 36));
        *(_DWORD *)(a1 + 36) = -1;
        shm_unlink(__str);
        goto LABEL_28;
      }
      *(_WORD *)(a1 + 8) = 257;
      *(_DWORD *)(a7 + 12) = *(_QWORD *)(a1 + 16);
      v34 = *(_DWORD *)(a1 + 36);
    }
    else
    {
      *(_QWORD *)__str = 0;
      v33 = (v24 + vm_page_size - 1) & -(uint64_t)vm_page_size;
      if (v33)
      {
        memory_entry_64 = vm_allocate(mach_task_self_, (vm_address_t *)__str, v33, 1);
        if ((_DWORD)memory_entry_64)
        {
          sub_1000065A4((uint64_t)"vm_allocate", memory_entry_64);
          return memory_entry_64;
        }
        size = v33;
        v63 = (int *)(a1 + 32);
        memory_entry_64 = mach_make_memory_entry_64(mach_task_self_, &size, *(memory_object_offset_t *)__str, 3, (mach_port_t *)(a1 + 32), 0);
        if ((_DWORD)memory_entry_64)
        {
          vm_deallocate(mach_task_self_, *(vm_address_t *)__str, v33);
          sub_1000065A4((uint64_t)"mach_make_memory_entry_64", memory_entry_64);
          return memory_entry_64;
        }
        ++dword_10000C068;
        v35 = *(_QWORD *)__str;
        **(_DWORD **)__str = dword_10000C068;
        v34 = *v63;
      }
      else
      {
        v34 = 0;
        v35 = 0;
        *(_DWORD *)(a1 + 32) = 0;
      }
      *(_WORD *)(a1 + 8) = 257;
      *(_QWORD *)(a1 + 16) = v33;
      *(_QWORD *)(a1 + 24) = v35;
      *(_DWORD *)(a7 + 12) = v33;
    }
    *(_DWORD *)(a7 + 16) = v34;
  }
LABEL_40:
  v40 = v18[2];
  v41 = v18[3];
  v42 = *(unsigned int **)(a1 + 24);
  *v42 = v15;
  v42[1] = v40;
  if ((v41 & 0xF) != 0)
    v43 = 16 - (v41 & 0xF);
  else
    v43 = 0;
  v44 = v43 + v41;
  v42[2] = v44;
  v42[3] = v41;
  v42[4] = a4;
  if (v15)
  {
    v45 = 0;
    v46 = (char *)(v42 + 8);
    v47 = (const void **)(v18 + 4);
    do
    {
      if (*v47)
      {
        memcpy(v46, *v47, v42[3]);
        v44 = v42[2];
      }
      v46 += v44;
      ++v45;
      v47 += 2;
    }
    while (v45 < v15);
    v42 = *(unsigned int **)(a1 + 24);
    if (!v42)
      return 4294967246;
  }
  v48 = *v42;
  v49 = *(unsigned int **)(a1 + 64);
  if (v49)
  {
    if (*v49 >= v48)
      goto LABEL_54;
    free(v49);
    *(_QWORD *)(a1 + 64) = 0;
  }
  v49 = (unsigned int *)malloc_type_malloc(16 * (v48 - 1) + 24, 0x7C51E058uLL);
  if (!v49)
  {
    v61 = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v62 = std::bad_alloc::bad_alloc(v61);
  }
  *(_QWORD *)(a1 + 64) = v49;
  *v49 = v48;
LABEL_54:
  *a5 = v49;
  v50 = *(unsigned int **)(a1 + 24);
  v51 = *(_DWORD **)(a1 + 64);
  v52 = *v50;
  if ((v52 - 1) >= *v51)
    return 4294967246;
  v53 = v50 + 8;
  *v51 = v52;
  v54 = (unsigned int **)(v51 + 4);
  v56 = v50[2];
  v55 = v50[3];
  v57 = v50[1];
  do
  {
    *v54 = v53;
    v53 = (unsigned int *)((char *)v53 + v56);
    *((_DWORD *)v54 - 2) = v57;
    *((_DWORD *)v54 - 1) = v55;
    v54 += 2;
    --v52;
  }
  while (v52);
  memory_entry_64 = 0;
  if (v50[4])
    v58 = v53;
  else
    v58 = 0;
  *a6 = v58;
  return memory_entry_64;
}

void sub_100006098(_Unwind_Exception *a1, int a2)
{
  if (a2)
    sub_100004734(a1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000060BC(uint64_t result)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  if (!(_BYTE)result)
  {
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      v1 = 136315394;
      v2 = "SharedAudioBufferList.h";
      v3 = 1024;
      v4 = 194;
      _os_log_impl((void *)&_mh_execute_header, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d ASSERTION FAILURE [(mIsServer) != 0 is false]: ", (uint8_t *)&v1, 0x12u);
    }
    __break(1u);
  }
  return result;
}

void sub_10000616C()
{
  operator delete();
}

uint64_t sub_100006180(_QWORD *a1)
{
  void *v2;

  *a1 = off_1000087A0;
  v2 = (void *)a1[8];
  if (v2)
  {
    free(v2);
    a1[8] = 0;
  }
  return sub_1000061BC((uint64_t)a1);
}

uint64_t sub_1000061BC(uint64_t a1)
{
  *(_QWORD *)a1 = off_100008870;
  sub_1000063EC(a1);
  xpc_release(*(xpc_object_t *)(a1 + 48));
  *(_QWORD *)(a1 + 48) = 0;
  return a1;
}

void sub_100006204(_QWORD *a1)
{
  sub_100006180(a1);
  operator delete();
}

void sub_100006228(XPC_Connection *a1)
{
  void *v2;
  OpaqueAudioFileID *v3;
  void *v4;

  *(_QWORD *)a1 = off_100008778;
  v2 = (void *)*((_QWORD *)a1 + 24);
  if (v2)
  {
    os_release(v2);
    *((_QWORD *)a1 + 24) = 0;
  }
  v3 = (OpaqueAudioFileID *)*((_QWORD *)a1 + 6);
  if (v3)
  {
    AudioFileClose(v3);
    v4 = (void *)*((_QWORD *)a1 + 24);
    if (v4)
    {
      os_release(v4);
      *((_QWORD *)a1 + 24) = 0;
    }
  }
  sub_100006180((_QWORD *)a1 + 7);
  XPC_Connection::~XPC_Connection(a1);
}

void sub_100006290(XPC_Connection *a1)
{
  void *v2;
  OpaqueAudioFileID *v3;
  void *v4;

  *(_QWORD *)a1 = off_100008778;
  v2 = (void *)*((_QWORD *)a1 + 24);
  if (v2)
  {
    os_release(v2);
    *((_QWORD *)a1 + 24) = 0;
  }
  v3 = (OpaqueAudioFileID *)*((_QWORD *)a1 + 6);
  if (v3)
  {
    AudioFileClose(v3);
    v4 = (void *)*((_QWORD *)a1 + 24);
    if (v4)
    {
      os_release(v4);
      *((_QWORD *)a1 + 24) = 0;
    }
  }
  sub_100006180((_QWORD *)a1 + 7);
  XPC_Connection::~XPC_Connection(a1);
  operator delete();
}

uint64_t sub_10000630C(uint64_t *a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t result;

  v2 = a1[1];
  a1[1] = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  v3 = a1[2];
  if (v3)
  {
    dispatch_release(v3);
    a1[2] = 0;
  }
  result = *a1;
  *a1 = 0;
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

xpc_type_t sub_100006370(uint64_t a1, xpc_object_t object)
{
  _QWORD *v3;
  xpc_type_t result;

  v3 = *(_QWORD **)(a1 + 32);
  result = xpc_get_type(object);
  if (result == (xpc_type_t)&_xpc_type_connection)
    return (xpc_type_t)(*(uint64_t (**)(_QWORD, xpc_object_t))(*(_QWORD *)*v3 + 16))(*v3, object);
  return result;
}

void sub_1000063C8(uint64_t a1)
{
  sub_1000061BC(a1);
  operator delete();
}

void sub_1000063EC(uint64_t a1)
{
  vm_address_t v2;
  uint64_t v3;
  mach_port_name_t v4;
  uint64_t v5;
  xpc_object_t v6;
  void *v7;
  int v8;
  pid_t v9;
  char __str[64];

  v2 = *(_QWORD *)(a1 + 24);
  if (v2)
  {
    if (*(_BYTE *)(a1 + 9))
    {
      if (*(_DWORD *)(a1 + 32))
      {
        v3 = vm_deallocate(mach_task_self_, v2, *(_QWORD *)(a1 + 16));
        if ((_DWORD)v3)
          sub_1000065A4((uint64_t)"vm_deallocate", v3);
        v4 = *(_DWORD *)(a1 + 32);
        if (v4)
        {
          v5 = mach_port_deallocate(mach_task_self_, v4);
          if ((_DWORD)v5)
            sub_1000065A4((uint64_t)"mach_port_deallocate", v5);
        }
        *(_BYTE *)(a1 + 9) = 0;
        *(_DWORD *)(a1 + 32) = 0;
      }
      else if (xpc_get_type(*(xpc_object_t *)(a1 + 48)) == (xpc_type_t)&_xpc_type_null)
      {
        if (*(_DWORD *)(a1 + 36) != -1)
        {
          if (munmap(*(void **)(a1 + 24), *(_QWORD *)(a1 + 16)))
            sub_100006684((uint64_t)"munmap");
          if (close(*(_DWORD *)(a1 + 36)))
            sub_100006684((uint64_t)"close");
          if (*(_BYTE *)(a1 + 8))
          {
            v8 = *(_DWORD *)(a1 + 40);
            v9 = getpid();
            snprintf(__str, 0x40uLL, "AppleABL.%x.%x", v9, v8);
            if (shm_unlink(__str))
              sub_100006684((uint64_t)"shm_unlink");
          }
          *(_DWORD *)(a1 + 36) = -1;
        }
      }
      else
      {
        v6 = xpc_null_create();
        v7 = *(void **)(a1 + 48);
        *(_QWORD *)(a1 + 48) = v6;
        xpc_release(v7);
        if (munmap(*(void **)(a1 + 24), *(_QWORD *)(a1 + 16)))
          sub_100006684((uint64_t)"munmap");
      }
    }
    else if (*(_BYTE *)(a1 + 8))
    {
      free(*(void **)(a1 + 24));
    }
  }
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
}

void sub_100006594(_Unwind_Exception *a1, int a2)
{
  if (a2)
    sub_100004734(a1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000065A4(uint64_t a1, uint64_t a2)
{
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  char *v14;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v5 = 136316162;
    v6 = "SharableMemory.cpp";
    v7 = 1024;
    v8 = 52;
    v9 = 2080;
    v10 = a1;
    v11 = 1024;
    v12 = a2;
    v13 = 2080;
    v14 = mach_error_string(a2);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d %s failed: 0x%x (%s)", (uint8_t *)&v5, 0x2Cu);
  }
  return a2;
}

void sub_100006684(uint64_t a1)
{
  int v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  int v10;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v2 = *__error();
    v3 = 136315906;
    v4 = "SharableMemory.cpp";
    v5 = 1024;
    v6 = 58;
    v7 = 2080;
    v8 = a1;
    v9 = 1024;
    v10 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d %s failed: errno %d", (uint8_t *)&v3, 0x22u);
  }
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__setFileNameLocalizationEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setFileNameLocalizationEnabled:");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_initWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTimeIntervalSinceNow:");
}

id objc_msgSend_runMode_beforeDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runMode:beforeDate:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}
