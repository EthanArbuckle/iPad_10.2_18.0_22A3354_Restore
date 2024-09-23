@implementation AudioDeviceManager

+ (id)sharedManager
{
  if (qword_100991F88 != -1)
    dispatch_once(&qword_100991F88, &stru_100929BF8);
  return (id)qword_100991F80;
}

- (AudioDeviceManager)init
{
  AudioDeviceManager *v2;
  NSObject *v3;
  NSObject *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AudioDeviceManager;
  v2 = -[AudioDeviceManager init](&v6, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INTERACTIVE, -1);
    v2->_queue = (dispatch_queue_s *)dispatch_queue_create("AudioDeviceManager", v4);
    -[AudioDeviceManager configureXPCListener](v2, "configureXPCListener");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v2;

  self->_audioSkywalkProvider = 0;
  v2.receiver = self;
  v2.super_class = (Class)AudioDeviceManager;
  -[AudioDeviceManager dealloc](&v2, "dealloc");
}

- (void)configureXPCListener
{
  _xpc_connection_s *mach_service;
  _QWORD handler[5];

  mach_service = xpc_connection_create_mach_service("com.apple.BTAudioHALPlugin.xpc", (dispatch_queue_t)self->_queue, 1uLL);
  self->_listener = mach_service;
  if (mach_service)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100359D78;
    handler[3] = &unk_100929C20;
    handler[4] = self;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_connection_resume(self->_listener);
  }
}

- (void)handleListenerEvent:(void *)a3
{
  xpc_type_t type;
  char *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const char *string;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  void *v23;

  type = xpc_get_type(a3);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    v13 = qword_1009997E0;
    if (os_log_type_enabled((os_log_t)qword_1009997E0, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 134217984;
      v23 = a3;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "AudioDeviceManager received new xpc connection from %p", (uint8_t *)&v22, 0xCu);
    }
    operator new();
  }
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    string = xpc_dictionary_get_string(a3, _xpc_error_key_description);
    v15 = qword_1009997E0;
    if (os_log_type_enabled((os_log_t)qword_1009997E0, OS_LOG_TYPE_ERROR))
      sub_1006E2CF4((uint64_t)string, v15, v16, v17, v18, v19, v20, v21);
  }
  else
  {
    v5 = xpc_copy_description(a3);
    v6 = qword_1009997E0;
    if (os_log_type_enabled((os_log_t)qword_1009997E0, OS_LOG_TYPE_ERROR))
      sub_1006E2D58((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
    free(v5);
  }
}

- (void)publishAndRegisterDevice:(int)a3 withArgs:(void *)a4 uid:()basic_string<char device:()std:(std::allocator<char>> *)a5 :char_traits<char>
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  unint64_t var1;
  NSObject *v12;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *var0;
  void *__p[2];
  uint64_t v15;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *v16;
  _BYTE buf[22];

  v6 = v5;
  v9 = *(_QWORD *)&a3;
  if (*((char *)&a5->var0.var0.var0.var1 + 23) < 0)
    var1 = a5->var0.var0.var0.var1.var1;
  else
    var1 = *((unsigned __int8 *)&a5->var0.var0.var0.var1 + 23);
  v12 = qword_1009997E0;
  if (!var1 && os_log_type_enabled((os_log_t)qword_1009997E0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "[AudioDeviceManager publishAndRegisterDevice:] uid is empty", buf, 2u);
    v12 = qword_1009997E0;
    if (v6)
      goto LABEL_9;
  }
  else if (v6)
  {
    goto LABEL_9;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "[AudioDeviceManager publishAndRegisterDevice:] device is nil", buf, 2u);
    v12 = qword_1009997E0;
  }
LABEL_9:
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    var0 = a5;
    if (*((char *)&a5->var0.var0.var0.var1 + 23) < 0)
      var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a5->var0.var0.var0.var1.var0;
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = var0;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[AudioDeviceManager publishAndRegisterDevice:] Register audio device %{public}s with XpcAudioPluginDevice: %p", buf, 0x16u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = 0;
  sub_10003415C((uint64_t)buf, (uint64_t)&self->audioDeviceMapMutex);
  v16 = a5;
  sub_10035AD0C((uint64_t **)&self->audioDevices, (const void **)a5, (uint64_t)&unk_100740F58, (__int128 **)&v16)[7] = v6;
  if (*((char *)&a5->var0.var0.var0.var1 + 23) < 0)
  {
    sub_10003430C(__p, a5->var0.var0.var0.var1.var0, a5->var0.var0.var0.var1.var1);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a5->var0.var0.var0.var0.var0;
    v15 = *((_QWORD *)&a5->var0.var0.var0.var1 + 2);
  }
  -[AudioDeviceManager sendMsg:withArgs:uid:](self, "sendMsg:withArgs:uid:", v9, a4, __p);
  if (SHIBYTE(v15) < 0)
    operator delete(__p[0]);
  sub_100034234((uint64_t)buf);
}

- (void)sendMsg:(int)a3 withArgs:(void *)a4 uid:()basic_string<char
{
  basic_string<char, std::char_traits<char>, std::allocator<char>> *var0;
  size_t v10;
  xpc_object_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  AudioDeviceManager *v21;
  void *left;
  uint64_t v23;
  NSObject *v24;
  unint64_t value;
  void *v26;
  uint64_t *begin;
  XpcAudioPluginClient **end;
  _xpc_connection_s *v29;
  NSObject *v30;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *v31;
  _QWORD block[5];
  _QWORD v33[2];
  uint8_t buf[4];
  _BYTE v35[18];
  __int16 v36;
  unint64_t v37;
  xpc_object_t values;
  xpc_object_t object;
  void *v40;
  char *keys[2];
  const char *v42;

  *(_OWORD *)keys = *(_OWORD *)off_100929C40;
  v42 = "kBTAudioMsgArgs";
  values = xpc_int64_create(a3);
  var0 = a5;
  if (*((char *)&a5->var0.var0.var0.var1 + 23) < 0)
    var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a5->var0.var0.var0.var1.var0;
  object = xpc_string_create((const char *)var0);
  v40 = a4;
  if (a4)
    v10 = 3;
  else
    v10 = 2;
  v11 = xpc_dictionary_create((const char *const *)keys, &values, v10);
  v12 = qword_1009997E0;
  if (os_log_type_enabled((os_log_t)qword_1009997E0, OS_LOG_TYPE_DEBUG))
  {
    v31 = a5;
    if (*((char *)&a5->var0.var0.var0.var1 + 23) < 0)
      v31 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a5->var0.var0.var0.var1.var0;
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v35 = a3;
    *(_WORD *)&v35[4] = 2082;
    *(_QWORD *)&v35[6] = v31;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Sending XPC message %d for %{public}s", buf, 0x12u);
  }
  if (a3 == 4)
  {
    if (*((char *)&a5->var0.var0.var0.var1 + 23) < 0)
    {
      if (!a5->var0.var0.var0.var1.var1)
        goto LABEL_12;
    }
    else if (!*((_BYTE *)&a5->var0.var0.var0.var1 + 23))
    {
LABEL_12:
      v13 = qword_1009997E0;
      if (os_log_type_enabled((os_log_t)qword_1009997E0, OS_LOG_TYPE_FAULT))
        sub_1006E2DF8(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    v33[0] = 0;
    v33[1] = 0;
    sub_10003415C((uint64_t)v33, (uint64_t)&self->audioDeviceMapMutex);
    v21 = (AudioDeviceManager *)sub_10001F2AC((uint64_t)&self->audioDevices, (const void **)a5);
    if (&self->audioDevices.__tree_.__pair1_ != (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, BT::XpcAudioPluginDevice *>, void *>>> *)v21)
    {
      left = v21->audioDevices.__tree_.__pair1_.__value_.__left_;
      v23 = sub_10035AE5C((uint64_t **)&self->audioDevices, (const void **)a5);
      v24 = qword_1009997E0;
      if (os_log_type_enabled((os_log_t)qword_1009997E0, OS_LOG_TYPE_DEFAULT))
      {
        if (*((char *)&a5->var0.var0.var0.var1 + 23) < 0)
          a5 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a5->var0.var0.var0.var1.var0;
        value = self->audioDevices.__tree_.__pair3_.__value_;
        *(_DWORD *)buf = 134218498;
        *(_QWORD *)v35 = v23;
        *(_WORD *)&v35[8] = 2082;
        *(_QWORD *)&v35[10] = a5;
        v36 = 2048;
        v37 = value;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Erased %lu audio device %{public}s from audio device map. Map now has %lu devices", buf, 0x20u);
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[AudioDeviceManager sharedManager](AudioDeviceManager, "sharedManager"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10035A540;
      block[3] = &unk_100917378;
      block[4] = left;
      dispatch_async((dispatch_queue_t)objc_msgSend(v26, "getXpcQueue"), block);

    }
    sub_100034264((uint64_t)v33);
    sub_100034234((uint64_t)v33);
  }
  begin = (uint64_t *)self->xpcClients.__begin_;
  end = self->xpcClients.__end_;
  if (begin == (uint64_t *)end)
    goto LABEL_24;
  do
  {
    v29 = (_xpc_connection_s *)sub_1002516A8(*begin);
    xpc_connection_send_message(v29, v11);
    ++begin;
  }
  while (begin != (uint64_t *)end);
  if (self->xpcClients.__end_ == self->xpcClients.__begin_)
  {
LABEL_24:
    v30 = qword_1009997E0;
    if (os_log_type_enabled((os_log_t)qword_1009997E0, OS_LOG_TYPE_ERROR))
      sub_1006E2DBC(v30);
  }
  xpc_release(v11);
  xpc_release(object);
  xpc_release(values);
}

- (void)republishAllAudioDevices
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, BT::XpcAudioPluginDevice *>, void *>>> *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, BT::XpcAudioPluginDevice *>, void *>>> *p_pair1;
  NSObject *v4;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, BT::XpcAudioPluginDevice *>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, BT::XpcAudioPluginDevice *>, void *>>> *v6;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, BT::XpcAudioPluginDevice *>, void *>>> *v7;
  BOOL v8;
  uint8_t buf[4];
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, BT::XpcAudioPluginDevice *>, void *>>> *v10;

  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, BT::XpcAudioPluginDevice *>, void *>>> *)self->audioDevices.__tree_.__begin_node_;
  p_pair1 = &self->audioDevices.__tree_.__pair1_;
  if (begin_node != &self->audioDevices.__tree_.__pair1_)
  {
    do
    {
      v4 = qword_1009997E0;
      if (os_log_type_enabled((os_log_t)qword_1009997E0, OS_LOG_TYPE_DEFAULT))
      {
        left = begin_node + 4;
        if (SHIBYTE(begin_node[6].__value_.__left_) < 0)
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, BT::XpcAudioPluginDevice *>, void *>>> *)left->__value_.__left_;
        *(_DWORD *)buf = 136315138;
        v10 = left;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Republishing %s", buf, 0xCu);
      }
      sub_1002FA48C((uint64_t)begin_node[7].__value_.__left_);
      v6 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, BT::XpcAudioPluginDevice *>, void *>>> *)begin_node[1].__value_.__left_;
      if (v6)
      {
        do
        {
          v7 = v6;
          v6 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, BT::XpcAudioPluginDevice *>, void *>>> *)v6->__value_.__left_;
        }
        while (v6);
      }
      else
      {
        do
        {
          v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, BT::XpcAudioPluginDevice *>, void *>>> *)begin_node[2].__value_.__left_;
          v8 = v7->__value_.__left_ == begin_node;
          begin_node = v7;
        }
        while (!v8);
      }
      begin_node = v7;
    }
    while (v7 != p_pair1);
  }
}

- (void)forwardEvent:(void *)a3 forUid:()basic_string<char
{
  basic_string<char, std::char_traits<char>, std::allocator<char>> *var0;
  char *v7;
  void *v8;
  NSObject *v9;
  int int64;
  void *__p[2];
  uint64_t v12;
  uint8_t buf[4];
  basic_string<char, std::char_traits<char>, std::allocator<char>> *v14;
  __int16 v15;
  int v16;

  var0 = a4;
  v7 = (char *)&a4->var0.var0.var0.var1 + 23;
  if (*((char *)&a4->var0.var0.var0.var1 + 23) < 0)
  {
    sub_10003430C(__p, a4->var0.var0.var0.var1.var0, a4->var0.var0.var0.var1.var1);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a4->var0.var0.var0.var0.var0;
    v12 = *((_QWORD *)&a4->var0.var0.var0.var1 + 2);
  }
  v8 = -[AudioDeviceManager getDeviceForUID:](self, "getDeviceForUID:", __p);
  if (SHIBYTE(v12) < 0)
    operator delete(__p[0]);
  v9 = qword_1009997E0;
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)qword_1009997E0, OS_LOG_TYPE_DEBUG))
      sub_1006E2E28(v7, var0, v9);
    sub_1002FA0CC((uint64_t)v8, a3);
  }
  else if (os_log_type_enabled((os_log_t)qword_1009997E0, OS_LOG_TYPE_ERROR))
  {
    if (*v7 < 0)
      var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)var0->var0.var0.var0.var1.var0;
    int64 = xpc_dictionary_get_int64(a3, "kBTAudioMsgId");
    *(_DWORD *)buf = 136446466;
    v14 = var0;
    v15 = 1024;
    v16 = int64;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "No device found for uid %{public}s to send msg %u", buf, 0x12u);
  }
}

- (void)getDeviceForUID:()basic_string<char
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[2];

  v15[0] = 0;
  v15[1] = 0;
  sub_10003415C((uint64_t)v15, (uint64_t)&self->audioDeviceMapMutex);
  if (*((char *)&a3->var0.var0.var0.var1 + 23) < 0)
  {
    if (a3->var0.var0.var0.var1.var1)
      goto LABEL_7;
  }
  else if (*((_BYTE *)&a3->var0.var0.var0.var1 + 23))
  {
    goto LABEL_7;
  }
  v5 = qword_1009997E0;
  if (os_log_type_enabled((os_log_t)qword_1009997E0, OS_LOG_TYPE_FAULT))
    sub_1006E2EA8(v5, v6, v7, v8, v9, v10, v11, v12);
LABEL_7:
  if (&self->audioDevices.__tree_.__pair1_ == (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, BT::XpcAudioPluginDevice *>, void *>>> *)sub_10001F2AC((uint64_t)&self->audioDevices, (const void **)a3))
    v13 = 0;
  else
    v13 = *(void **)sub_10034983C((uint64_t)&self->audioDevices, (const void **)a3);
  sub_100034234((uint64_t)v15);
  return v13;
}

- (AudioSkywalkProvider)getAudioSkywalkProvider
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10035A940;
  block[3] = &unk_1009172A0;
  block[4] = self;
  if (qword_100991F90 != -1)
    dispatch_once(&qword_100991F90, block);
  return self->_audioSkywalkProvider;
}

- (basic_string<char,)getClientBundleIDs
{
  basic_string<char, std::char_traits<char>, std::allocator<char>> *result;
  char **v2;
  unint64_t i;
  std::string *v5;
  __int128 v6;
  void **v7;
  std::string::size_type v8;
  std::string v9;
  void *__p[2];
  int64_t v11;

  *(_OWORD *)retstr->var0.var0.var0.var0.var0 = 0uLL;
  *((_QWORD *)&retstr->var0.var0.var0.var1 + 2) = 0;
  v2 = (char **)result->var0.var1.var0[0];
  for (i = result->var0.var1.var0[1]; v2 != (char **)i; ++v2)
  {
    sub_1005380BC(*v2, (uint64_t)&v9);
    v5 = std::string::append(&v9, ",");
    v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
    v11 = v5->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v6;
    v5->__r_.__value_.__l.__size_ = 0;
    v5->__r_.__value_.__r.__words[2] = 0;
    v5->__r_.__value_.__r.__words[0] = 0;
    if (v11 >= 0)
      v7 = __p;
    else
      v7 = (void **)__p[0];
    if (v11 >= 0)
      v8 = HIBYTE(v11);
    else
      v8 = (std::string::size_type)__p[1];
    result = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)std::string::append((std::string *)retstr, (const std::string::value_type *)v7, v8);
    if (SHIBYTE(v11) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v9.__r_.__value_.__l.__data_);
  }
  return result;
}

- (void)removeXpcClient:(void *)a3
{
  NSObject *v5;
  XpcAudioPluginClient **v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;

  v7 = a3;
  v5 = qword_1009997E0;
  if (os_log_type_enabled((os_log_t)qword_1009997E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v9 = sub_1002516A8((uint64_t)a3);
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "AudioDeviceManager removing xpc client for connection %p", buf, 0xCu);
  }
  v6 = (XpcAudioPluginClient **)sub_10035AC24(self->xpcClients.__begin_, self->xpcClients.__end_, &v7);
  if (self->xpcClients.__end_ != v6)
    self->xpcClients.__end_ = v6;
  if (v7)
  {
    sub_100538050();
    operator delete();
  }
}

- (dispatch_queue_s)getXpcQueue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  XpcAudioPluginClient **begin;

  sub_100069BDC(&self->audioDeviceMapMutex);
  sub_100056BAC((uint64_t)&self->audioDevices, (char *)self->audioDevices.__tree_.__pair1_.__value_.__left_);
  begin = self->xpcClients.__begin_;
  if (begin)
  {
    self->xpcClients.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  self->xpcClients.__begin_ = 0;
  self->xpcClients.__end_ = 0;
  self->audioDevices.__tree_.__pair3_.__value_ = 0;
  self->audioDevices.__tree_.__pair1_.__value_.__left_ = 0;
  self->xpcClients.__end_cap_.__value_ = 0;
  self->audioDevices.__tree_.__begin_node_ = &self->audioDevices.__tree_.__pair1_;
  sub_1000160D0(&self->audioDeviceMapMutex);
  return self;
}

@end
