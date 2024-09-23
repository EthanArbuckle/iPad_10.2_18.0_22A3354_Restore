@implementation WebInterruptionObserverHelper

- (WebInterruptionObserverHelper)initWithCallback:(void *)a3
{
  WebInterruptionObserverHelper *v4;
  WebInterruptionObserverHelper *v5;
  PAL *v6;
  PAL *AVFoundation_AVAudioSessionInterruptionNotification;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WebInterruptionObserverHelper;
  v4 = -[WebInterruptionObserverHelper init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_callback = a3;
    v6 = (PAL *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    AVFoundation_AVAudioSessionInterruptionNotification = (PAL *)PAL::get_AVFoundation_AVAudioSessionInterruptionNotification(v6);
    -[PAL addObserver:selector:name:object:](v6, "addObserver:selector:name:object:", v5, sel_interruption_, AVFoundation_AVAudioSessionInterruptionNotification, objc_msgSend((id)PAL::getAVAudioSessionClass(AVFoundation_AVAudioSessionInterruptionNotification), "sharedInstance"));
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)WebInterruptionObserverHelper;
  -[WebInterruptionObserverHelper dealloc](&v3, sel_dealloc);
}

- (void)clearCallback
{
  self->_callback = 0;
}

- (void)interruption:(id)a3
{
  void *v5;
  void *v6;

  if (self->_callback)
  {
    v5 = (void *)objc_msgSend(a3, "userInfo");
    if (!objc_msgSend((id)objc_msgSend(v5, "objectForKey:", PAL::get_AVFoundation_AVAudioSessionInterruptionTypeKey((PAL *)v5)), "unsignedIntegerValue"))
    {
      v6 = (void *)objc_msgSend(a3, "userInfo");
      objc_msgSend((id)objc_msgSend(v6, "objectForKey:", PAL::get_AVFoundation_AVAudioSessionInterruptionOptionKey((PAL *)v6)), "unsignedIntegerValue");
    }
    CFRetain(self);
    CFRetain(self);
    WTF::callOnWebThreadOrDispatchAsyncOnMainThread();
    CFRelease(self);
    if (self)
      CFRelease(self);
  }
}

uint64_t __46__WebInterruptionObserverHelper_interruption___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (result)
  {
    if (*(_QWORD *)(a1 + 40) == 1)
      return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 168))(result);
    else
      return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)result + 176))(result, *(unsigned __int8 *)(a1 + 48));
  }
  return result;
}

@end
