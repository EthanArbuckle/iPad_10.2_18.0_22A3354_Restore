@implementation SDHeadphoneEngravingRequest

- (SDHeadphoneEngravingRequest)initWithBluetoothAddress:(id)a3
{
  id v3;
  SDHeadphoneEngravingRequest *v4;
  NSString *v5;
  NSString *bluetoothAddressString;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  OS_dispatch_queue *dispatchQueue;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SDHeadphoneEngravingRequest;
  v3 = a3;
  v4 = -[SDHeadphoneEngravingRequest init](&v13, "init");
  v5 = (NSString *)objc_msgSend(v3, "copy", v13.receiver, v13.super_class);

  bluetoothAddressString = v4->_bluetoothAddressString;
  v4->_bluetoothAddressString = v5;

  v9 = SFMainQueue(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  dispatchQueue = v4->_dispatchQueue;
  v4->_dispatchQueue = (OS_dispatch_queue *)v10;

  return v4;
}

- (void)start
{
  SDHeadphoneEngravingRequest *v3;
  void (*v4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *);
  uint64_t v5;
  uint64_t v6;
  int v7;
  __int16 v8;
  void (*v9)(NSObject *, int, int, void *);

  if (dword_1007B1300 <= 30 && (dword_1007B1300 != -1 || _LogCategory_Initialize(&dword_1007B1300, 30)))
    LogPrintF(&dword_1007B1300, "-[SDHeadphoneEngravingRequest start]", 30, "starting engraving request for device with address:%d", self->_bluetoothAddressString);
  v9 = sub_1000BE678;
  v3 = self;
  if (BTSessionAttachWithQueue("com.apple.sharing.digitalengraving", &v9, v3, v3->_dispatchQueue))
    CFRelease(v3);
  v8 = 0;
  v7 = 0;
  BTDeviceAddressFromString(-[NSString UTF8String](v3->_bluetoothAddressString, "UTF8String"), &v7);
  v6 = 0;
  BTDeviceFromAddress(v3->_btSession, &v7, &v6);
  v5 = 0;
  BTAccessoryManagerGetDefault(v3->_btSession, &v5);
  v4 = sub_1000BE8E4;
  if (BTAccessoryManagerRegisterCustomMessageClient(v5, &v4, 0x800000, v3))
  {
    if (dword_1007B1300 <= 90
      && (dword_1007B1300 != -1 || _LogCategory_Initialize(&dword_1007B1300, 90)))
    {
      LogPrintF(&dword_1007B1300, "-[SDHeadphoneEngravingRequest start]", 90, "BTAccessoryManagerRegisterCustomMessageClient for engraving request result:%d");
    }
  }
  else if (BTAccessoryManagerSendCustomMessage(v5, 0x800000, v6, 0, 0)
         && dword_1007B1300 <= 90
         && (dword_1007B1300 != -1 || _LogCategory_Initialize(&dword_1007B1300, 90)))
  {
    LogPrintF(&dword_1007B1300, "-[SDHeadphoneEngravingRequest start]", 90, "BTAccessoryManagerSendCustomMessage for engraving request result:%d");
  }
}

- (void)cancel
{
  BTSessionDetachWithQueue(&self->_btSession);
}

- (void)handleEngravingData:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[SDHeadphoneEngravingRequest completion](self, "completion"));
  ((void (**)(_QWORD, id))v5)[2](v5, v4);

  -[SDHeadphoneEngravingRequest cancel](self, "cancel");
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)bluetoothAddressString
{
  return self->_bluetoothAddressString;
}

- (BTSessionImpl)btSession
{
  return self->_btSession;
}

- (void)setBtSession:(BTSessionImpl *)a3
{
  self->_btSession = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (BOOL)btSessionAttaching
{
  return self->_btSessionAttaching;
}

- (void)setBtSessionAttaching:(BOOL)a3
{
  self->_btSessionAttaching = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_bluetoothAddressString, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end
