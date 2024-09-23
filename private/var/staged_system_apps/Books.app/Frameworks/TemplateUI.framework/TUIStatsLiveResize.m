@implementation TUIStatsLiveResize

- (void)beginLiveResize
{
  self->_summary._beginMachTime = mach_absolute_time();
}

- (void)endLiveResize
{
  self->_summary._endMachTime = mach_absolute_time();
  -[TUIStatsLiveResize _dump](self, "_dump");
}

- (void)_dump
{
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  unsigned int v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  TUIStatsLiveResize *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;

  v3 = NSTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v4, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("LiveResizeStats")));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLByAppendingPathExtension:", CFSTR("json")));
  v21 = self;

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v8 = 1;
  for (i = (void *)v7; ; i = (void *)v17)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(i, "path"));
    v11 = objc_msgSend(v22, "fileExistsAtPath:", v10);

    if (!v11)
      break;
    v12 = NSTemporaryDirectory();
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v13, 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%lu"), CFSTR("LiveResizeStats"), v8));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "URLByAppendingPathComponent:", v15));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "URLByAppendingPathExtension:", CFSTR("json")));

    ++v8;
  }
  v18 = sub_136B40(&v21->_summary._components.__table_.__bucket_list_.__ptr_.__value_);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v19, 1, 0));
  objc_msgSend(v20, "writeToURL:atomically:", i, 0);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v24 = i;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "live-resize-stats dumped to: %@", buf, 0xCu);
  }

}

- (void)beginFrame
{
  sub_137328(&self->_summary._components.__table_.__bucket_list_.__ptr_.__value_);
}

- (void)endFrame
{
  *((_QWORD *)self->_summary._frames.__end_ - 1) = mach_absolute_time();
}

- (void)collectStatsFromLayoutController:(id)a3
{
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "instantiateContext"));
  v5 = objc_msgSend(v4, "_context");

  v6 = v5[96];
  if (v6)
    sub_137528(v6, &self->_summary._components.__table_.__bucket_list_.__ptr_.__value_);

}

- (void).cxx_destruct
{
  sub_141048((uint64_t)&self->_summary);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((_DWORD *)self + 30) = 1065353216;
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 16) = 0;
  return self;
}

@end
