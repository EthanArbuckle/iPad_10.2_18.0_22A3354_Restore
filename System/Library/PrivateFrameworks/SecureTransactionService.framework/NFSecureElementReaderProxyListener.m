@implementation NFSecureElementReaderProxyListener

- (NFSecureElementReaderProxyListener)initWithSTSReaderSession:(id)a3
{
  id v4;
  NFSecureElementReaderProxyListener *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NFHardwareSecureElementInfo *seInfo;
  NFSecureElementReaderProxyListener *v10;
  uint64_t v11;
  NFSecureElementManagerSession *seSession;
  id v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NFSecureElementReaderProxyListener;
  v5 = -[NFSecureElementReaderProxyListener init](&v15, sel_init);
  if (!v5)
    goto LABEL_5;
  v14 = 0;
  objc_msgSend(MEMORY[0x24BE6B5B8], "embeddedSecureElementWithError:", &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;
  objc_msgSend(v6, "info");
  v8 = objc_claimAutoreleasedReturnValue();
  seInfo = v5->_seInfo;
  v5->_seInfo = (NFHardwareSecureElementInfo *)v8;

  if (!v7)
  {
    objc_msgSend(v4, "proxyReaderSESession");
    v11 = objc_claimAutoreleasedReturnValue();
    seSession = v5->_seSession;
    v5->_seSession = (NFSecureElementManagerSession *)v11;

LABEL_5:
    v10 = v5;
    goto LABEL_6;
  }

  v10 = 0;
LABEL_6:

  return v10;
}

- (id)transceiveWithData:(id)a3 outError:(id *)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[NFSecureElementReaderProxyListener transceiveWithData:outError:]", 64, self, CFSTR("data = %@"), v8, v9, (uint64_t)v7);
  -[NFSecureElementReaderProxyListener seSession](self, "seSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NFSecureElementReaderProxyListener seSession](self, "seSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFSecureElementReaderProxyListener seInfo](self, "seInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "serialNumber");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "transceive:forSEID:error:", v7, v13, a4);
    a4 = (id *)objc_claimAutoreleasedReturnValue();

  }
  else if (a4)
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Hardware Not Available");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v16;
    v22[1] = &unk_24D3B2930;
    v21[1] = CFSTR("Line");
    v21[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v17;
    v21[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 69);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[3] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 12, v19);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

- (NFSecureElementManagerSession)seSession
{
  return self->_seSession;
}

- (void)setSeSession:(id)a3
{
  objc_storeStrong((id *)&self->_seSession, a3);
}

- (NFHardwareSecureElementInfo)seInfo
{
  return self->_seInfo;
}

- (void)setSeInfo:(id)a3
{
  objc_storeStrong((id *)&self->_seInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seInfo, 0);
  objc_storeStrong((id *)&self->_seSession, 0);
}

@end
