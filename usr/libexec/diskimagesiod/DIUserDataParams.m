@implementation DIUserDataParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIUserDataParams)initWithURL:(id)a3 error:(id *)a4
{
  DIUserDataParams *v4;
  DIUserDataParams *v5;
  NSDictionary *userDict;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DIUserDataParams;
  v4 = -[DIBaseParams initWithURL:error:](&v8, "initWithURL:error:", a3, a4);
  v5 = v4;
  if (v4)
  {
    userDict = v4->_userDict;
    v4->_userDict = (NSDictionary *)&__NSDictionary0__struct;

  }
  return v5;
}

- (BOOL)supportsPstack
{
  return 0;
}

- (DIUserDataParams)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  DIUserDataParams *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSSet *v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSDictionary *userDict;
  id v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)DIUserDataParams;
  v6 = -[DIBaseParams initWithCoder:](&v21, "initWithCoder:", v4);
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v5), CFSTR("userData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (v9)
    {
      v10 = objc_opt_class(NSString, v8);
      v12 = objc_opt_class(NSDictionary, v11);
      v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v12, objc_opt_class(NSData, v13), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v20 = 0;
      v16 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v15, v9, &v20));
      v17 = v20;
      userDict = v6->_userDict;
      v6->_userDict = (NSDictionary *)v16;

      if (!v17)
        goto LABEL_7;
    }
    else
    {
      v17 = (id)objc_claimAutoreleasedReturnValue(+[DIError errorWithPOSIXCode:verboseInfo:](DIError, "errorWithPOSIXCode:verboseInfo:", 22, CFSTR("Failed serializing user dictionary")));
    }
    -[DIBaseParams setDeserializationError:](v6, "setDeserializationError:", v17);
LABEL_7:

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  id v17;
  objc_super v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DIUserDataParams;
  -[DIBaseParams encodeWithCoder:](&v18, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIUserDataParams userDict](self, "userDict"));
  v17 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 0, &v17));
  v7 = v17;

  if (v7)
  {
    v8 = *__error();
    if (sub_1000BF0BC())
    {
      v16 = 0;
      v9 = sub_1000BF044();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        v11 = 3;
      else
        v11 = 2;
      *(_DWORD *)buf = 68158210;
      v20 = 36;
      v21 = 2080;
      v22 = "-[DIUserDataParams encodeWithCoder:]";
      v23 = 2114;
      v24 = v7;
      v15 = 28;
      v12 = (char *)_os_log_send_and_compose_impl(v11, &v16, 0, 0, &_mh_execute_header, v10, 16, "%.*s: Error encoding user dictionary: %{public}@", buf, v15);

      if (v12)
      {
        fprintf(__stderrp, "%s\n", v12);
        free(v12);
      }
    }
    else
    {
      v13 = sub_1000BF044();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68158210;
        v20 = 36;
        v21 = 2080;
        v22 = "-[DIUserDataParams encodeWithCoder:]";
        v23 = 2114;
        v24 = v7;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%.*s: Error encoding user dictionary: %{public}@", buf, 0x1Cu);
      }

    }
    *__error() = v8;
  }
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("userData"));

}

- (BOOL)retrieveWithError:(id *)a3
{
  int v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  char *v9;
  unsigned __int8 v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[8];
  _BYTE v25[24];
  void (*v26)(uint64_t);
  DIClient2Controller_XPCHandler *v27;

  if (!-[DIBaseParams openExistingImageWithFlags:error:](self, "openExistingImageWithFlags:error:", 0, a3))
    return 0;
  v5 = *__error();
  if (sub_1000BF0BC())
  {
    v18 = 0;
    v6 = sub_1000BF044();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      v8 = 3;
    else
      v8 = 2;
    *(_DWORD *)buf = 68158210;
    *(_DWORD *)&buf[4] = 38;
    *(_WORD *)v25 = 2080;
    *(_QWORD *)&v25[2] = "-[DIUserDataParams retrieveWithError:]";
    *(_WORD *)&v25[10] = 2114;
    *(_QWORD *)&v25[12] = self;
    v9 = (char *)_os_log_send_and_compose_impl(v8, &v18, 0, 0, &_mh_execute_header, v7, 0, "%.*s: entry: %{public}@", buf, 28);

    if (v9)
    {
      fprintf(__stderrp, "%s\n", v9);
      free(v9);
    }
  }
  else
  {
    v11 = sub_1000BF044();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      *(_DWORD *)&buf[4] = 38;
      *(_WORD *)v25 = 2080;
      *(_QWORD *)&v25[2] = "-[DIUserDataParams retrieveWithError:]";
      *(_WORD *)&v25[10] = 2114;
      *(_QWORD *)&v25[12] = self;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%.*s: entry: %{public}@", buf, 0x1Cu);
    }

  }
  *__error() = v5;
  *(_QWORD *)buf = 0;
  *(_QWORD *)v25 = buf;
  *(_QWORD *)&v25[8] = 0x3032000000;
  *(_QWORD *)&v25[16] = sub_10002F804;
  v26 = sub_10002F814;
  v27 = objc_alloc_init(DIClient2Controller_XPCHandler);
  if ((objc_msgSend(*(id *)(*(_QWORD *)v25 + 40), "connectWithError:", a3) & 1) != 0
    && -[DIBaseParams prepareImageWithXpcHandler:fileMode:error:](self, "prepareImageWithXpcHandler:fileMode:error:", *(_QWORD *)(*(_QWORD *)v25 + 40), 2, a3))
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = sub_10002F804;
    v22 = sub_10002F814;
    v23 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)v25 + 40), "remoteProxy"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002F81C;
    v17[3] = &unk_100170E10;
    v17[4] = &v18;
    v17[5] = buf;
    objc_msgSend(v13, "retrieveUserDataWithParams:reply:", self, v17);

    v10 = objc_msgSend(*(id *)(*(_QWORD *)v25 + 40), "completeCommandWithError:", a3);
    if ((v10 & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v19[5], "userDict"));
      if (v14)
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v19[5], "userDict"));
      else
        v15 = &__NSDictionary0__struct;
      -[DIUserDataParams setUserDict:](self, "setUserDict:", v15);
      if (v14)

    }
    _Block_object_dispose(&v18, 8);

  }
  else
  {
    v10 = 0;
  }
  _Block_object_dispose(buf, 8);

  return v10;
}

- (BOOL)embedWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  char *v12;
  unsigned __int8 v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  int v18;
  _QWORD v19[5];
  uint64_t v20;
  uint8_t buf[8];
  _BYTE v22[24];
  void (*v23)(uint64_t);
  DIClient2Controller_XPCHandler *v24;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIUserDataParams userDict](self, "userDict"));
  if (!v5)
    return +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("userDict cannot be nil or empty"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DIUserDataParams userDict](self, "userDict"));
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    return +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("userDict cannot be nil or empty"), a3);
  if (!-[DIBaseParams openExistingImageWithFlags:error:](self, "openExistingImageWithFlags:error:", 2, a3))
    return 0;
  v8 = *__error();
  if (sub_1000BF0BC())
  {
    v20 = 0;
    v9 = sub_1000BF044();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      v11 = 3;
    else
      v11 = 2;
    *(_DWORD *)buf = 68158210;
    *(_DWORD *)&buf[4] = 35;
    *(_WORD *)v22 = 2080;
    *(_QWORD *)&v22[2] = "-[DIUserDataParams embedWithError:]";
    *(_WORD *)&v22[10] = 2114;
    *(_QWORD *)&v22[12] = self;
    v18 = 28;
    v12 = (char *)_os_log_send_and_compose_impl(v11, &v20, 0, 0, &_mh_execute_header, v10, 0, "%.*s: entry: %{public}@", buf, v18);

    if (v12)
    {
      fprintf(__stderrp, "%s\n", v12);
      free(v12);
    }
  }
  else
  {
    v14 = sub_1000BF044();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      *(_DWORD *)&buf[4] = 35;
      *(_WORD *)v22 = 2080;
      *(_QWORD *)&v22[2] = "-[DIUserDataParams embedWithError:]";
      *(_WORD *)&v22[10] = 2114;
      *(_QWORD *)&v22[12] = self;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%.*s: entry: %{public}@", buf, 0x1Cu);
    }

  }
  *__error() = v8;
  *(_QWORD *)buf = 0;
  *(_QWORD *)v22 = buf;
  *(_QWORD *)&v22[8] = 0x3032000000;
  *(_QWORD *)&v22[16] = sub_10002F804;
  v23 = sub_10002F814;
  v24 = objc_alloc_init(DIClient2Controller_XPCHandler);
  if ((objc_msgSend(*(id *)(*(_QWORD *)v22 + 40), "connectWithError:", a3) & 1) != 0
    && -[DIBaseParams prepareImageWithXpcHandler:fileMode:error:](self, "prepareImageWithXpcHandler:fileMode:error:", *(_QWORD *)(*(_QWORD *)v22 + 40), 4, a3))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)v22 + 40), "remoteProxy"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10002FC60;
    v19[3] = &unk_100170E38;
    v19[4] = buf;
    objc_msgSend(v16, "embedUserDataWithParams:reply:", self, v19);

    v13 = objc_msgSend(*(id *)(*(_QWORD *)v22 + 40), "completeCommandWithError:", a3);
  }
  else
  {
    v13 = 0;
  }
  _Block_object_dispose(buf, 8);

  return v13;
}

- (NSDictionary)userDict
{
  return self->_userDict;
}

- (void)setUserDict:(id)a3
{
  objc_storeStrong((id *)&self->_userDict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDict, 0);
}

@end
