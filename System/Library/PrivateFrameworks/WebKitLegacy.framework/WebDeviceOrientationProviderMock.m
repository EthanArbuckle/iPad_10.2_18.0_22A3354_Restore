@implementation WebDeviceOrientationProviderMock

+ (id)shared
{
  id result;

  if (_MergedGlobals_14 == 1)
    return (id)qword_1ECEC9868;
  result = objc_alloc_init(WebDeviceOrientationProviderMock);
  qword_1ECEC9868 = (uint64_t)result;
  _MergedGlobals_14 = 1;
  return result;
}

- (WebDeviceOrientationProviderMock)init
{
  WebDeviceOrientationProviderMock *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WebDeviceOrientationProviderMock;
  v2 = -[WebDeviceOrientationProviderMock init](&v4, sel_init);
  if (v2)
    v2->m_internal = objc_alloc_init(WebDeviceOrientationProviderMockInternal);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WebDeviceOrientationProviderMock;
  -[WebDeviceOrientationProviderMock dealloc](&v3, sel_dealloc);
}

- (void)setOrientation:(id)a3
{
  -[WebDeviceOrientationProviderMockInternal setOrientation:](self->m_internal, "setOrientation:", a3);
}

- (void)startUpdating
{
  -[WebDeviceOrientationProviderMockInternal startUpdating](self->m_internal, "startUpdating");
}

- (void)stopUpdating
{
  -[WebDeviceOrientationProviderMockInternal stopUpdating](self->m_internal, "stopUpdating");
}

- (id)lastOrientation
{
  return -[WebDeviceOrientationProviderMockInternal lastOrientation](self->m_internal, "lastOrientation");
}

- (void)setController:(DeviceOrientationController *)a3
{
  -[WebDeviceOrientationProviderMockInternal setController:](self->m_internal, "setController:", a3);
}

@end
