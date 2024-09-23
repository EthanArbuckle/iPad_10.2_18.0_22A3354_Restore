@implementation WAMessageSubmitter

- (WAMessageSubmitter)initWithMessageGroupType:(int64_t)a3
{
  WAMessageSubmitter *v4;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int64_t v16;

  v10.receiver = self;
  v10.super_class = (Class)WAMessageSubmitter;
  v4 = -[WAMessageSubmitter init](&v10, "init");
  if (!v4)
  {
    v6 = WALogCategoryDefaultHandle();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v12 = "-[WAMessageSubmitter initWithMessageGroupType:]";
      v13 = 1024;
      v14 = 26;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed in super-init", buf, 0x12u);
    }

    v8 = WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v12 = "-[WAMessageSubmitter initWithMessageGroupType:]";
      v13 = 1024;
      v14 = 32;
      v15 = 2048;
      v16 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error configuring groupType: %ld", buf, 0x1Cu);
    }

  }
  return v4;
}

- (id)submitMessage:(id)a3
{
  NSString *v3;
  void *v4;

  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("Never use %@ for WAMessage."), v4);

  return 0;
}

- (int64_t)groupTypeForThisSubmitter
{
  return self->_groupTypeForThisSubmitter;
}

- (void)setGroupTypeForThisSubmitter:(int64_t)a3
{
  self->_groupTypeForThisSubmitter = a3;
}

@end
