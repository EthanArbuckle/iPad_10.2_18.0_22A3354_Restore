@implementation DOMMediaError

- (void)dealloc
{
  objc_class *v3;
  StringImpl *v4;
  DOMObjectInternal *internal;
  WTF::StringImpl *v6;
  objc_super v7;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    internal = self->super._internal;
    if (internal)
    {
      if (*(_DWORD *)internal == 1)
      {
        v6 = (WTF::StringImpl *)*((_QWORD *)internal + 1);
        *((_QWORD *)internal + 1) = 0;
        if (v6)
        {
          if (*(_DWORD *)v6 == 2)
            WTF::StringImpl::destroy(v6, v4);
          else
            *(_DWORD *)v6 -= 2;
        }
        WTF::fastFree(internal, v4);
      }
      else
      {
        --*(_DWORD *)internal;
      }
    }
    v7.receiver = self;
    v7.super_class = (Class)DOMMediaError;
    -[DOMObject dealloc](&v7, sel_dealloc);
  }
}

- (unsigned)code
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOWORD(self) = *((_WORD *)self->super._internal + 2);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (unsigned __int16)self;
}

@end
