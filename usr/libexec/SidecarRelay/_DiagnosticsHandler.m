@implementation _DiagnosticsHandler

- (_DiagnosticsHandler)initWithSubsystem:(const char *)a3 category:(const char *)a4 provider:(id)a5
{
  id v8;
  _DiagnosticsHandler *v9;
  id v10;
  id provider;
  _DiagnosticsHandler *v12;
  dispatch_source_t v13;
  OS_dispatch_source *signal;
  NSObject *v15;
  _DiagnosticsHandler *v16;
  id v17;
  _DiagnosticsHandler *v18;
  _DiagnosticsHandler *v19;
  _QWORD handler[4];
  _DiagnosticsHandler *v22;
  id v23;
  _QWORD v24[4];
  _DiagnosticsHandler *v25;
  objc_super v26;

  v8 = a5;
  v26.receiver = self;
  v26.super_class = (Class)_DiagnosticsHandler;
  v9 = -[_DiagnosticsHandler init](&v26, "init");
  asprintf(&v9->_path, "%s-%s", a3, a4);
  asprintf(&v9->_title, "%s:%s", a3, a4);
  v10 = objc_msgSend(v8, "copy");
  provider = v9->_provider;
  v9->_provider = v10;

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10006B76C;
  v24[3] = &unk_10008A278;
  v12 = v9;
  v25 = v12;
  v12->_handle = os_state_add_handler(&_dispatch_main_q, v24);
  ::signal(30, (void (__cdecl *)(int))1);
  v13 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1EuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  signal = v12->_signal;
  v12->_signal = (OS_dispatch_source *)v13;

  v15 = v12->_signal;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10006B778;
  handler[3] = &unk_10008A2A0;
  v23 = v8;
  v16 = v12;
  v22 = v16;
  v17 = v8;
  dispatch_source_set_event_handler(v15, handler);
  dispatch_activate((dispatch_object_t)v12->_signal);
  v18 = v22;
  v19 = v16;

  return v19;
}

- (void)dealloc
{
  objc_super v3;

  os_state_remove_handler(self->_handle, a2);
  dispatch_source_cancel((dispatch_source_t)self->_signal);
  free(self->_title);
  v3.receiver = self;
  v3.super_class = (Class)_DiagnosticsHandler;
  -[_DiagnosticsHandler dealloc](&v3, "dealloc");
}

- (os_state_data_s)handler:(os_state_hints_s *)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  os_state_data_s *v7;
  size_t v8;

  if (a3->var2 != 3)
    return 0;
  v4 = (*((uint64_t (**)(void))self->_provider + 2))();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (uint64_t)objc_msgSend(v5, "length");
  v7 = 0;
  if (v5)
  {
    v8 = v6;
    if (v6 <= 0x8000)
    {
      v7 = (os_state_data_s *)malloc_type_calloc(v6 + 200, 1uLL, 0xE624A9AFuLL);
      v7->var0 = 1;
      v7->var1.var1 = v8;
      __strlcpy_chk(v7->var3, self->_title, 64, 64);
      memcpy(v7->var4, objc_msgSend(objc_retainAutorelease(v5), "bytes"), v8);
    }
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signal, 0);
  objc_storeStrong(&self->_provider, 0);
}

+ (id)tmpDir
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  unsigned __int8 v7;
  _BYTE v8[1024];

  v7 = 0;
  if (qword_10009A170)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    if ((objc_msgSend(v2, "fileExistsAtPath:isDirectory:", qword_10009A170, &v7) & 1) != 0)
    {
      v3 = v7;

      if (v3)
        return (id)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", qword_10009A170, 1, 0));
    }
    else
    {

    }
  }
  v4 = _dirhelper(1, v8, 1024);
  if (v4)
    v4 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v8));
  v5 = (void *)qword_10009A170;
  qword_10009A170 = v4;

  return (id)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", qword_10009A170, 1, 0));
}

@end
