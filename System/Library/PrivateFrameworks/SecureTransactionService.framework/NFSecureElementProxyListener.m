@implementation NFSecureElementProxyListener

- (NFSecureElementProxyListener)initWithSTSSession:(id)a3
{
  id v4;
  NFSecureElementProxyListener *v5;
  uint64_t v6;
  NFSecureElementManagerSession *seSession;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFSecureElementProxyListener;
  v5 = -[NFSecureElementProxyListener init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "masterSESession");
    v6 = objc_claimAutoreleasedReturnValue();
    seSession = v5->_seSession;
    v5->_seSession = (NFSecureElementManagerSession *)v6;

  }
  return v5;
}

- (id)transceiveWithData:(id)a3 outError:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;

  v6 = a3;
  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[NFSecureElementProxyListener transceiveWithData:outError:]", 45, self, CFSTR("data = %@"), v7, v8, (uint64_t)v6);
  v16 = 0;
  objc_msgSend(MEMORY[0x24BE6B5B8], "embeddedSecureElementWithError:", &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;
  objc_msgSend(v9, "info");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v12 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v10);
  }
  else
  {
    -[NFSecureElementProxyListener seSession](self, "seSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serialNumber");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "transceive:forSEID:error:", v6, v14, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (NFSecureElementManagerSession)seSession
{
  return self->_seSession;
}

- (void)setSeSession:(id)a3
{
  objc_storeStrong((id *)&self->_seSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seSession, 0);
}

@end
