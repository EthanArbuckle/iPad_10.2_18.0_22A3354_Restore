@implementation SABlockingInfo

- (SABlockingInfo)init
{
  int v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  SABlockingInfo *result;
  uint8_t v11[16];

  v2 = *__error();
  _sa_logt();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v11 = 0;
    _os_log_error_impl(&dword_1B9BE0000, v3, OS_LOG_TYPE_ERROR, "Must use a subclass of SABlockingInfo, not SABlockingInfo directly", v11, 2u);
  }

  *__error() = v2;
  _SASetCrashLogMessage(1833, "Must use a subclass of SABlockingInfo, not SABlockingInfo directly", v4, v5, v6, v7, v8, v9, v11[0]);
  result = (SABlockingInfo *)_os_crash();
  __break(1u);
  return result;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SABlockingInfo;
  return -[SABlockingInfo init](&v3, sel_init);
}

- (unint64_t)blockingTid
{
  int v3;
  NSObject *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t result;
  uint8_t buf[4];
  const char *ClassName;

  v3 = *__error();
  _sa_logt();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    ClassName = object_getClassName(self);
    _os_log_error_impl(&dword_1B9BE0000, v4, OS_LOG_TYPE_ERROR, "SABlockingInfo subclass %s doesn't implement blockingTid", buf, 0xCu);
  }

  *__error() = v3;
  v5 = object_getClassName(self);
  _SASetCrashLogMessage(1841, "SABlockingInfo subclass %s doesn't implement blockingTid", v6, v7, v8, v9, v10, v11, v5);
  result = _os_crash();
  __break(1u);
  return result;
}

- (int)blockingPid
{
  int v3;
  NSObject *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int result;
  uint8_t buf[4];
  const char *ClassName;

  v3 = *__error();
  _sa_logt();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    ClassName = object_getClassName(self);
    _os_log_error_impl(&dword_1B9BE0000, v4, OS_LOG_TYPE_ERROR, "SABlockingInfo subclass %s doesn't implement blockingPid", buf, 0xCu);
  }

  *__error() = v3;
  v5 = object_getClassName(self);
  _SASetCrashLogMessage(1845, "SABlockingInfo subclass %s doesn't implement blockingPid", v6, v7, v8, v9, v10, v11, v5);
  result = _os_crash();
  __break(1u);
  return result;
}

- (NSString)portName
{
  return 0;
}

- (unint64_t)portFlags
{
  return 0;
}

- (unint64_t)portDomain
{
  return 0;
}

- (BOOL)hasMatchingBlocker:(id)a3
{
  void *v3;
  id v5;
  unint64_t v6;
  uint64_t v7;
  char v8;
  int v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a3;
  v6 = -[SABlockingInfo blockingTid](self, "blockingTid");
  v7 = objc_msgSend(v5, "blockingTid");
  if (v6 | v7)
  {
    if (v6 != v7)
    {
      v8 = 0;
      goto LABEL_18;
    }
LABEL_6:
    -[SABlockingInfo portName](self, "portName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(v5, "portName");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
        v8 = 1;
LABEL_16:

        goto LABEL_17;
      }
    }
    -[SABlockingInfo portName](self, "portName");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      objc_msgSend(v5, "portName");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = (void *)v14;
        -[SABlockingInfo portName](self, "portName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "portName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v16, "isEqualToString:", v17);

        if (!v11)
          goto LABEL_16;
LABEL_17:

        goto LABEL_18;
      }

    }
    v8 = 0;
    if (!v11)
      goto LABEL_16;
    goto LABEL_17;
  }
  v9 = -[SABlockingInfo blockingPid](self, "blockingPid");
  v10 = objc_msgSend(v5, "blockingPid");
  v8 = 0;
  if ((v9 & v10) != 0xFFFFFFFF && v9 == v10)
    goto LABEL_6;
LABEL_18:

  return v8;
}

@end
