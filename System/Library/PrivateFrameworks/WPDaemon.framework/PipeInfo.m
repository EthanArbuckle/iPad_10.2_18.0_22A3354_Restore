@implementation PipeInfo

- (void)dealloc
{
  NSObject *v3;
  CBScalablePipe *pipe;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  OS_voucher *voucher;
  CBScalablePipe *v18;
  NSObject *pipeReadSource;
  PipeDataTransfer *pipeDataTransfer;
  objc_super v21;
  uint8_t buf[16];

  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_218_3);
  v3 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2175D1000, v3, OS_LOG_TYPE_DEFAULT, "WPPM: PipeInfo dealloc", buf, 2u);
  }
  pipe = self->_pipe;
  if (pipe)
  {
    -[CBScalablePipe input](pipe, "input");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[CBScalablePipe output](self->_pipe, "output");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[CBScalablePipe input](self->_pipe, "input");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *MEMORY[0x24BDBCA90];
        objc_msgSend(v8, "removeFromRunLoop:forMode:", v9, *MEMORY[0x24BDBCA90]);

        -[CBScalablePipe output](self->_pipe, "output");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeFromRunLoop:forMode:", v12, v10);

        -[CBScalablePipe input](self->_pipe, "input");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setDelegate:", 0);

        -[CBScalablePipe output](self->_pipe, "output");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setDelegate:", 0);

        -[CBScalablePipe input](self->_pipe, "input");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "close");

        -[CBScalablePipe output](self->_pipe, "output");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "close");

      }
    }
  }
  voucher = self->_voucher;
  if (voucher)
  {
    self->_voucher = 0;

  }
  v18 = self->_pipe;
  self->_pipe = 0;

  -[PipeInfo releaseQOSOverride](self, "releaseQOSOverride");
  pipeReadSource = self->_pipeReadSource;
  if (pipeReadSource)
    dispatch_source_cancel(pipeReadSource);
  pipeDataTransfer = self->_pipeDataTransfer;
  if (pipeDataTransfer)
  {
    self->_pipeDataTransfer = 0;

  }
  v21.receiver = self;
  v21.super_class = (Class)PipeInfo;
  -[PipeInfo dealloc](&v21, sel_dealloc);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[CBScalablePipe name](self->_pipe, "name");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = CFSTR("YES");
  if (self->_qosOverride)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (!self->_socketThreadQOSOverride)
    v6 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PipeInfo: pipe %@, voucher %@, newProtocol %d, vSent %d, vReceived %d, connSent %d, connPDU %d, QOS override %@, socket QOS override %@"), v4, self->_voucher, self->_newProtocol, self->_versionInfoSent, self->_versionInfoReceived, self->_pipeDidConnectSent, self->_useConnectStatusPDU, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (OS_dispatch_source)pipeReadSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPipeReadSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (CBScalablePipe)pipe
{
  return (CBScalablePipe *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPipe:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (OS_voucher)voucher
{
  return (OS_voucher *)objc_getProperty(self, a2, 56, 1);
}

- (void)setVoucher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)newProtocol
{
  return self->_newProtocol;
}

- (void)setNewProtocol:(BOOL)a3
{
  self->_newProtocol = a3;
}

- (BOOL)versionInfoSent
{
  return self->_versionInfoSent;
}

- (void)setVersionInfoSent:(BOOL)a3
{
  self->_versionInfoSent = a3;
}

- (BOOL)versionInfoReceived
{
  return self->_versionInfoReceived;
}

- (void)setVersionInfoReceived:(BOOL)a3
{
  self->_versionInfoReceived = a3;
}

- (BOOL)pipeDidConnectSent
{
  return self->_pipeDidConnectSent;
}

- (void)setPipeDidConnectSent:(BOOL)a3
{
  self->_pipeDidConnectSent = a3;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned __int8)a3
{
  self->_version = a3;
}

- (unsigned)supportedFeatures
{
  return self->_supportedFeatures;
}

- (void)setSupportedFeatures:(unsigned int)a3
{
  self->_supportedFeatures = a3;
}

- (PipeDataTransfer)pipeDataTransfer
{
  return (PipeDataTransfer *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPipeDataTransfer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PipeDataTransfer)ackData
{
  return (PipeDataTransfer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAckData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (unsigned)localVersion
{
  return self->_localVersion;
}

- (void)setLocalVersion:(unsigned __int8)a3
{
  self->_localVersion = a3;
}

- (unsigned)localSupportedFeatures
{
  return self->_localSupportedFeatures;
}

- (void)setLocalSupportedFeatures:(unsigned int)a3
{
  self->_localSupportedFeatures = a3;
}

- (BOOL)useConnectStatusPDU
{
  return self->_useConnectStatusPDU;
}

- (void)setUseConnectStatusPDU:(BOOL)a3
{
  self->_useConnectStatusPDU = a3;
}

- (BOOL)connectionInitiator
{
  return self->_connectionInitiator;
}

- (void)setConnectionInitiator:(BOOL)a3
{
  self->_connectionInitiator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ackData, 0);
  objc_storeStrong((id *)&self->_pipeDataTransfer, 0);
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_pipe, 0);
  objc_storeStrong((id *)&self->_pipeReadSource, 0);
}

@end
