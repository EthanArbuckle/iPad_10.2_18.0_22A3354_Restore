@implementation DOMFileList

- (void)dealloc
{
  objc_class *v3;
  void *v4;
  DOMObjectInternal *internal;
  uint64_t v6;
  _DWORD **v7;
  uint64_t v8;
  _DWORD *v9;
  WTF *v10;
  objc_super v11;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    internal = self->super._internal;
    if (internal)
    {
      if (*((_DWORD *)internal + 2) == 1)
      {
        v6 = *((unsigned int *)internal + 7);
        if ((_DWORD)v6)
        {
          v7 = (_DWORD **)*((_QWORD *)internal + 2);
          v8 = 8 * v6;
          do
          {
            v9 = *v7;
            *v7 = 0;
            if (v9)
            {
              if (v9[4] == 1)
                (*(void (**)(_DWORD *))(*(_QWORD *)v9 + 8))(v9);
              else
                --v9[4];
            }
            ++v7;
            v8 -= 8;
          }
          while (v8);
        }
        v10 = (WTF *)*((_QWORD *)internal + 2);
        if (v10)
        {
          *((_QWORD *)internal + 2) = 0;
          *((_DWORD *)internal + 6) = 0;
          WTF::fastFree(v10, v4);
        }
        if (*(_QWORD *)internal)
        {
          *(_QWORD *)(*(_QWORD *)internal + 8) = 3;
          *(_QWORD *)internal = 0;
        }
        MEMORY[0x1D82A6E48](internal);
      }
      else
      {
        --*((_DWORD *)internal + 2);
      }
    }
    v11.receiver = self;
    v11.super_class = (Class)DOMFileList;
    -[DOMObject dealloc](&v11, sel_dealloc);
  }
}

- (unsigned)length
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super._internal + 7);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (DOMFile)item:(unsigned int)index
{
  DOMObjectInternal *v4;
  DOMFile *v5;
  void *v6;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  v4 = (DOMObjectInternal *)WebCore::FileList::item(self->super._internal);
  v5 = (DOMFile *)kit(v4);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
  return v5;
}

@end
