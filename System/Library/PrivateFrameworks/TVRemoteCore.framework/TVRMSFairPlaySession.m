@implementation TVRMSFairPlaySession

- (void)dealloc
{
  objc_super v3;

  -[TVRMSFairPlaySession invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)TVRMSFairPlaySession;
  -[TVRMSFairPlaySession dealloc](&v3, sel_dealloc);
}

- (id)handshakeData
{
  int v3;
  int v4;
  NSObject *v5;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[TVRMSFairPlaySession _getHardwareInfo:](self, "_getHardwareInfo:", &self->_hardwareInfo);
  cp2g1b9ro();
  if (v3)
  {
    v4 = v3;
    _TVRCRMSLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = v4;
      _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "RemoteServices: FairPlaySAPInit failed with error: %d.", (uint8_t *)v7, 8u);
    }

    return 0;
  }
  else
  {
    -[TVRMSFairPlaySession handshakeIterationWithData:](self, "handshakeIterationWithData:", 0);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)handshakeIterationWithData:(id)a3
{
  id v3;
  int v4;
  int v5;
  NSObject *v6;
  uint8_t buf[4];
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = objc_retainAutorelease(a3);
  objc_msgSend(v3, "bytes");
  objc_msgSend(v3, "length");

  Mib5yocT();
  if (v4)
  {
    v5 = v4;
    _TVRCRMSLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v9 = v5;
      _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "RemoteServices: FairPlaySAPExchange failed with error: %d.", buf, 8u);
    }
  }
  else
  {
    _TVRCRMSLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "RemoteServices: FairPlaySAPExchange failed.", buf, 2u);
    }
  }

  return 0;
}

- (id)headerForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 *v9;
  id v10;
  int v11;
  int v12;
  NSObject *v13;
  void *v14;
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v5, "rangeOfString:", v6));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (unsigned __int8 *)malloc_type_malloc(0x10uLL, 0x13DB2599uLL);
  v10 = objc_retainAutorelease(v8);
  CC_MD5((const void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), v9);
  U4HBs();
  v12 = v11;
  free(v9);
  if (v12)
  {
    _TVRCRMSLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v17 = v12;
      _os_log_impl(&dword_21A51B000, v13, OS_LOG_TYPE_DEFAULT, "RemoteServices: FairPlaySAPEncrypt failed with error: %d.", buf, 8u);
    }
    v14 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:", 0, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    -[TVRMSFairPlaySession _hexStringForData:](self, "_hexStringForData:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (void)invalidate
{
  self->_handshakeComplete = 0;
  if (self->_sessionToken)
  {
    IPaI1oem5iL();
    self->_sessionToken = 0;
  }
}

- (BOOL)_getHardwareInfo:(FairPlayHWInfo_ *)a3
{
  FairPlayHWInfo_ *v3;
  void *v4;
  void *v5;
  CFTypeID v6;
  CFIndex Length;

  v3 = a3;
  if (a3)
  {
    v4 = (void *)MGCopyAnswer();
    if (v4)
    {
      v5 = v4;
      v6 = CFGetTypeID(v4);
      if (v6 == CFDataGetTypeID() && (Length = CFDataGetLength((CFDataRef)v5), Length <= 20))
      {
        v3->IDLength = Length;
        objc_msgSend(v5, "getBytes:length:", v3->ID);
        LOBYTE(v3) = 1;
      }
      else
      {
        LOBYTE(v3) = 0;
      }
      CFRelease(v5);
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return (char)v3;
}

- (id)_hexStringForData:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  unsigned __int8 *v8;
  unsigned int v9;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", 2 * objc_msgSend(v3, "length"));
  v5 = objc_msgSend(v3, "length");
  v6 = objc_retainAutorelease(v3);
  v7 = objc_msgSend(v6, "bytes");
  if (v5)
  {
    v8 = (unsigned __int8 *)v7;
    do
    {
      v9 = *v8++;
      objc_msgSend(v4, "appendFormat:", CFSTR("%02X"), v9);
      --v5;
    }
    while (v5);
  }

  return v4;
}

- (BOOL)isHandshakeComplete
{
  return self->_handshakeComplete;
}

@end
