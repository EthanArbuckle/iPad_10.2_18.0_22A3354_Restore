@implementation NFBasebandMonitor

- (NFBasebandMonitor)init
{
  NFBasebandMonitor *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NFBasebandMonitor;
  v2 = -[NFBasebandMonitor init](&v4, "init");
  if (v2)
    v2->_bbRef = (__TelephonyBasebandControllerHandle_tag *)TelephonyBasebandCreateController(kCFAllocatorDefault);
  return v2;
}

- (void)dealloc
{
  __TelephonyBasebandControllerHandle_tag *bbRef;
  objc_super v4;

  bbRef = self->_bbRef;
  if (bbRef)
    CFRelease(bbRef);
  v4.receiver = self;
  v4.super_class = (Class)NFBasebandMonitor;
  -[NFBasebandMonitor dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
