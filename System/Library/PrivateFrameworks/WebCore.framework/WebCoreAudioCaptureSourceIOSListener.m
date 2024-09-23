@implementation WebCoreAudioCaptureSourceIOSListener

- (WebCoreAudioCaptureSourceIOSListener)initWithCallback:(void *)a3
{
  WebCoreAudioCaptureSourceIOSListener *v4;
  WebCoreAudioCaptureSourceIOSListener *v5;
  PAL *v6;
  PAL *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WebCoreAudioCaptureSourceIOSListener;
  v4 = -[WebCoreAudioCaptureSourceIOSListener init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_callback = a3;
    v6 = (PAL *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (PAL *)objc_msgSend((id)PAL::getAVAudioSessionClass(v6), "sharedInstance");
    -[PAL addObserver:selector:name:object:](v6, "addObserver:selector:name:object:", v5, sel_sessionMediaServicesWereReset_, PAL::get_AVFoundation_AVAudioSessionMediaServicesWereResetNotification(v7), v7);
  }
  return v5;
}

- (void)invalidate
{
  self->_callback = 0;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);
}

- (void)sessionMediaServicesWereReset:(id)a3
{
  _QWORD *v3;
  _QWORD *v4;

  if (self->_callback)
  {
    v3 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v3 = off_1E341B9D0;
    v4 = v3;
    WTF::ensureOnMainThread();
    if (v4)
      (*(void (**)(_QWORD *))(*v4 + 8))(v4);
  }
}

@end
