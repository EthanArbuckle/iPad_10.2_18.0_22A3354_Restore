@implementation WebAVAudioSessionAvailableInputsListener

- (WebAVAudioSessionAvailableInputsListener)initWithCallback:(void *)a3 audioSession:(id)a4
{
  WebAVAudioSessionAvailableInputsListener *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WebAVAudioSessionAvailableInputsListener;
  v6 = -[WebAVAudioSessionAvailableInputsListener init](&v9, sel_init);
  if (v6)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel_routeDidChange_, PAL::get_AVFoundation_AVAudioSessionRouteChangeNotification((PAL *)v7), a4);
    v6->_callback = a3;
  }
  return v6;
}

- (void)invalidate
{
  self->_callback = 0;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);
}

- (void)routeDidChange:(id)a3
{
  if (self->_callback)
  {
    CFRetain(self);
    CFRetain(self);
    WTF::callOnWebThreadOrDispatchAsyncOnMainThread();
    CFRelease(self);
    if (self)
      CFRelease(self);
  }
}

_QWORD *__59__WebAVAudioSessionAvailableInputsListener_routeDidChange___block_invoke(_QWORD *result)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v1 = *(_QWORD *)(result[4] + 8);
  if (v1)
  {
    v2 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v2 = off_1E31F6DB0;
    v3 = *(_QWORD *)(v1 + 88);
    v4 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
    *v4 = &off_1E31F6E00;
    v4[1] = v1;
    v4[2] = v2;
    v5 = v4;
    (*(void (**)(uint64_t, _QWORD **))(*(_QWORD *)v3 + 32))(v3, &v5);
    result = v5;
    v5 = 0;
    if (result)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*result + 8))(result);
  }
  return result;
}

@end
