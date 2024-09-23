@implementation WebDeviceOrientationInternal

- (WebDeviceOrientationInternal)initWithCoreDeviceOrientation:(void *)a3
{
  WebDeviceOrientationInternal *v4;
  void *v5;
  WebDeviceOrientationInternal *v6;
  DeviceOrientationData *v7;
  WTF *m_ptr;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WebDeviceOrientationInternal;
  v4 = -[WebDeviceOrientationInternal init](&v10, sel_init);
  v6 = v4;
  if (!v4)
    return v6;
  v7 = *(DeviceOrientationData **)a3;
  *(_QWORD *)a3 = 0;
  m_ptr = (WTF *)v4->m_orientation.m_ptr;
  v6->m_orientation.m_ptr = v7;
  if (!m_ptr)
    return v6;
  if (*(_DWORD *)m_ptr != 1)
  {
    --*(_DWORD *)m_ptr;
    return v6;
  }
  WTF::fastFree(m_ptr, v5);
  return v6;
}

- (void).cxx_destruct
{
  DeviceOrientationData *m_ptr;

  m_ptr = self->m_orientation.m_ptr;
  self->m_orientation.m_ptr = 0;
  if (m_ptr)
  {
    if (*(_DWORD *)m_ptr == 1)
      WTF::fastFree((WTF *)m_ptr, (void *)a2);
    else
      --*(_DWORD *)m_ptr;
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
