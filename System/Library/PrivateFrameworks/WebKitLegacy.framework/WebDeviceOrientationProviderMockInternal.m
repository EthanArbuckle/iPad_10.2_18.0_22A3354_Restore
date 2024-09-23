@implementation WebDeviceOrientationProviderMockInternal

- (WebDeviceOrientationProviderMockInternal)init
{
  WebDeviceOrientationProviderMockInternal *v2;
  WebCore::DeviceOrientationClientMock *v3;
  DeviceOrientationClientMock *value;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WebDeviceOrientationProviderMockInternal;
  v2 = -[WebDeviceOrientationProviderMockInternal init](&v6, sel_init);
  if (v2)
  {
    v3 = (WebCore::DeviceOrientationClientMock *)WTF::fastMalloc((WTF *)0x60);
    WebCore::DeviceOrientationClientMock::DeviceOrientationClientMock(v3);
    value = v2->m_core.__ptr_.__value_;
    v2->m_core.__ptr_.__value_ = (DeviceOrientationClientMock *)v3;
    if (value)
      (*(void (**)(DeviceOrientationClientMock *))(*(_QWORD *)value + 8))(value);
  }
  return v2;
}

- (void)setOrientation:(id)a3
{
  WTF *v3;
  void *v4;
  WTF *v5;

  if (a3)
  {
    v3 = *(WTF **)(*((_QWORD *)a3 + 1) + 8);
    if (v3)
      ++*(_DWORD *)v3;
  }
  else
  {
    v3 = 0;
  }
  v5 = v3;
  WebCore::DeviceOrientationClientMock::setOrientation();
  if (v5)
  {
    if (*(_DWORD *)v5 == 1)
      WTF::fastFree(v5, v4);
    else
      --*(_DWORD *)v5;
  }
}

- (void)setController:(DeviceOrientationController *)a3
{
  (*(void (**)(DeviceOrientationClientMock *, DeviceOrientationController *))(*(_QWORD *)self->m_core.__ptr_.__value_
                                                                                       + 32))(self->m_core.__ptr_.__value_, a3);
}

- (void)startUpdating
{
  (*(void (**)(DeviceOrientationClientMock *))(*(_QWORD *)self->m_core.__ptr_.__value_ + 16))(self->m_core.__ptr_.__value_);
}

- (void)stopUpdating
{
  (*(void (**)(DeviceOrientationClientMock *))(*(_QWORD *)self->m_core.__ptr_.__value_ + 24))(self->m_core.__ptr_.__value_);
}

- (id)lastOrientation
{
  WebDeviceOrientation *v3;
  WTF *v4;
  void *v5;
  CFTypeRef v6;
  WTF *v7;
  WTF *v9;

  v3 = [WebDeviceOrientation alloc];
  v4 = (WTF *)(*(uint64_t (**)(DeviceOrientationClientMock *))(*(_QWORD *)self->m_core.__ptr_.__value_ + 40))(self->m_core.__ptr_.__value_);
  if (v4)
    ++*(_DWORD *)v4;
  v9 = v4;
  v6 = (id)CFMakeCollectable(-[WebDeviceOrientation initWithCoreDeviceOrientation:](v3, "initWithCoreDeviceOrientation:", &v9));
  v7 = v9;
  v9 = 0;
  if (!v7)
    return (id)v6;
  if (*(_DWORD *)v7 != 1)
  {
    --*(_DWORD *)v7;
    return (id)v6;
  }
  WTF::fastFree(v7, v5);
  return (id)v6;
}

- (void).cxx_destruct
{
  DeviceOrientationClientMock *value;

  value = self->m_core.__ptr_.__value_;
  self->m_core.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(DeviceOrientationClientMock *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
