@implementation NFSLAMShim

- (void)log:(id)a3
{
  id v3;
  void (*Logger)(uint64_t, const char *, ...);
  uint64_t v5;
  NSObject *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;

  v3 = a3;
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(0);
  if (Logger)
    Logger(5, "%s:%i %s", "-[NFSLAMShim log:]", 57, (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
  v5 = NFSharedLogGetLogger(0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v8 = "-[NFSLAMShim log:]";
    v9 = 1024;
    v10 = 57;
    v11 = 2080;
    v12 = objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s", buf, 0x1Cu);
  }

}

- (id)transceive:(id)a3 error:(id *)a4
{
  return -[NFSecureElementWrapper transceiveData:toOS:error:](self->_se, "transceiveData:toOS:error:", a3, 0, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_se, 0);
}

@end
