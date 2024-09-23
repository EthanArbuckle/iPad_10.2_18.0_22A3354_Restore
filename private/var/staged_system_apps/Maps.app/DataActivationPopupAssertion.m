@implementation DataActivationPopupAssertion

- (id)initAndTakeAssertion:(BOOL)a3
{
  _BOOL4 v3;
  DataActivationPopupAssertion *v4;
  DataActivationPopupAssertion *v5;
  DataActivationPopupAssertion *v6;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DataActivationPopupAssertion;
  v4 = -[DataActivationPopupAssertion init](&v8, "init");
  v5 = v4;
  if (v4)
  {
    v4->_active = 1;
    if (v3)
      -[DataActivationPopupAssertion _takeAssertion](v4, "_takeAssertion");
    v6 = v5;
  }

  return v5;
}

- (DataActivationPopupAssertion)init
{
  return (DataActivationPopupAssertion *)-[DataActivationPopupAssertion initAndTakeAssertion:](self, "initAndTakeAssertion:", 1);
}

- (void)dealloc
{
  objc_super v3;

  -[DataActivationPopupAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)DataActivationPopupAssertion;
  -[DataActivationPopupAssertion dealloc](&v3, "dealloc");
}

- (void)_takeAssertion
{
  __CTServerConnection *v3;
  unint64_t v4;

  if (self->_active)
  {
    if (self->_telephonyServerConnection
      || (v3 = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue(0, CFSTR("com.apple.Maps.DataActivationPopupAssertion"), &_dispatch_main_q, 0), (self->_telephonyServerConnection = v3) != 0))
    {
      if (!self->_dataActivationPopupAssertion)
      {
        v4 = _CTServerConnectionDataActivationPopupAssertionCreate();
        if ((_DWORD)v4)
          NSLog(CFSTR("Failed to create data activation popup assertion: %i, %i"), v4, HIDWORD(v4));
      }
    }
  }
}

- (void)_releaseAssertion
{
  void *dataActivationPopupAssertion;
  __CTServerConnection *telephonyServerConnection;

  dataActivationPopupAssertion = self->_dataActivationPopupAssertion;
  if (dataActivationPopupAssertion)
  {
    CFRelease(dataActivationPopupAssertion);
    self->_dataActivationPopupAssertion = 0;
  }
  telephonyServerConnection = self->_telephonyServerConnection;
  if (telephonyServerConnection)
  {
    CFRelease(telephonyServerConnection);
    self->_telephonyServerConnection = 0;
  }
}

- (void)invalidate
{
  -[DataActivationPopupAssertion _releaseAssertion](self, "_releaseAssertion");
  self->_active = 0;
}

@end
