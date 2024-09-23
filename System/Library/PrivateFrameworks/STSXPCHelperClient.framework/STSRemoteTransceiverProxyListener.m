@implementation STSRemoteTransceiverProxyListener

- (void)dealloc
{
  uint64_t v2;
  STSRemoteTransceiverProxyListener *v3;
  objc_super v4;

  v3 = self;
  if (self)
    self = (STSRemoteTransceiverProxyListener *)self->_xpcListener;
  objc_msgSend_invalidate(self, a2, v2);
  v4.receiver = v3;
  v4.super_class = (Class)STSRemoteTransceiverProxyListener;
  -[STSRemoteTransceiverProxyListener dealloc](&v4, sel_dealloc);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  OS_dispatch_queue *workQueue;
  OS_dispatch_queue *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v32;
  _QWORD v33[5];
  id v34;
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  v10 = objc_msgSend_processIdentifier(v7, v8, v9);
  sub_20A02B138(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSRemoteTransceiverProxyListener listener:shouldAcceptNewConnection:]", 74, self, CFSTR("Accepting new connection from pid %d"), v11, v12, v10);
  if (!self || !self->_disableEntitlements)
  {
    v14 = sub_20A02F250([STSXPCHelperClientEntitlementChecker alloc], v7);
    v17 = v14;
    if (!v14 || !v14[8])
    {
      sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSRemoteTransceiverProxyListener listener:shouldAcceptNewConnection:]", 80, self, CFSTR("Missing xpcHelperClientTransceiveProxyListenerAccess entitlement"), v15, v16, v32);

      v30 = 0;
      goto LABEL_11;
    }

  }
  objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], v13, (uint64_t)&unk_2545C9F90);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setExportedInterface_(v7, v19, (uint64_t)v18);

  if (self)
    objc_msgSend_addObject_(self->_xpcConnections, v20, (uint64_t)v7);
  else
    objc_msgSend_addObject_(0, v20, (uint64_t)v7);
  objc_msgSend_setExportedObject_(v7, v21, (uint64_t)self);
  objc_initWeak(&location, v7);
  objc_initWeak(&from, self);
  v22 = MEMORY[0x24BDAC760];
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = sub_20A02C5F4;
  v36[3] = &unk_24C2B34C8;
  v36[4] = self;
  objc_copyWeak(&v37, &from);
  objc_copyWeak(&v38, &location);
  objc_msgSend_setInvalidationHandler_(v7, v23, (uint64_t)v36);
  v33[0] = v22;
  v33[1] = 3221225472;
  v33[2] = sub_20A02C688;
  v33[3] = &unk_24C2B34C8;
  v33[4] = self;
  objc_copyWeak(&v34, &from);
  objc_copyWeak(&v35, &location);
  objc_msgSend_setInterruptionHandler_(v7, v24, (uint64_t)v33);
  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  v26 = workQueue;
  objc_msgSend__setQueue_(v7, v27, (uint64_t)v26);

  objc_msgSend_resume(v7, v28, v29);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  v30 = 1;
LABEL_11:

  return v30;
}

- (void)transceive:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void (**v9)(id, void *, id);
  id WeakRetained;
  const char *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v9 = (void (**)(id, void *, id))a4;
  if (self && (WeakRetained = objc_loadWeakRetained((id *)&self->_delegate)) != 0)
  {
    v12 = WeakRetained;
    v19 = 0;
    objc_msgSend_transceiveWithData_outError_(WeakRetained, v11, (uint64_t)v6, &v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v19;
    v9[2](v9, v13, v14);

  }
  else
  {
    sub_20A02B138(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSRemoteTransceiverProxyListener transceive:completion:]", 125, self, CFSTR("Invalid state"), v7, v8, (uint64_t)v19);
    v15 = (void *)MEMORY[0x24BDD1540];
    v20 = *MEMORY[0x24BDD0FC8];
    v21[0] = off_2545C7C38;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v16, (uint64_t)v21, &v20, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v15, v18, (uint64_t)CFSTR("STSXPCHelperErrorDomain"), 2, v17);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v9[2](v9, 0, v14);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
