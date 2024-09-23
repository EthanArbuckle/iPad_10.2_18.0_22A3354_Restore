@implementation DOMHTMLCanvasElement

- (int)width
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super.super.super.super._internal + 30);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (void)setWidth:(int)a3
{
  StringImpl *v4;
  void *v5;
  WTF::StringImpl *v6;
  char v7;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLCanvasElement::setWidth(self->super.super.super.super._internal);
  if (!v7 || !v6)
    goto LABEL_5;
  if (*(_DWORD *)v6 != 2)
  {
    *(_DWORD *)v6 -= 2;
LABEL_5:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
    return;
  }
  WTF::StringImpl::destroy(v6, v4);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v5);
}

- (int)height
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super.super.super.super._internal + 31);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (void)setHeight:(int)a3
{
  StringImpl *v4;
  void *v5;
  WTF::StringImpl *v6;
  char v7;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLCanvasElement::setHeight(self->super.super.super.super._internal);
  if (!v7 || !v6)
    goto LABEL_5;
  if (*(_DWORD *)v6 != 2)
  {
    *(_DWORD *)v6 -= 2;
LABEL_5:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
    return;
  }
  WTF::StringImpl::destroy(v6, v4);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v5);
}

- (id)toDataURL:(id)a3
{
  DOMObjectInternal *internal;
  StringImpl *v6;
  WTF::StringImpl *v7;
  unsigned int v8;
  WTF::StringImpl *v9;
  StringImpl *v10;
  const __CFString *v11;
  uint64_t v12;
  id result;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15[2];
  WTF::StringImpl *v16;
  WTF::StringImpl *v17;
  unsigned int v18;
  _BYTE v19[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v19);
  internal = self->super.super.super.super._internal;
  MEMORY[0x1D82A3998](v15, a3);
  WebCore::HTMLCanvasElement::toDataURL(internal, (const WTF::String *)v15);
  v7 = v15[0];
  v15[0] = 0;
  if (!v7)
  {
LABEL_4:
    v8 = v18;
    if (!v18)
      goto LABEL_5;
    goto LABEL_13;
  }
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
    goto LABEL_4;
  }
  WTF::StringImpl::destroy(v7, v6);
  v8 = v18;
  if (!v18)
  {
LABEL_5:
    v9 = v16;
    v16 = 0;
    if (v9)
    {
      v11 = (const __CFString *)WTF::StringImpl::operator NSString *();
      if (*(_DWORD *)v9 == 2)
      {
        WTF::StringImpl::destroy(v9, v10);
        v12 = v18;
        if (v18 == -1)
          goto LABEL_11;
      }
      else
      {
        *(_DWORD *)v9 -= 2;
        v12 = v18;
        if (v18 == -1)
          goto LABEL_11;
      }
    }
    else
    {
      v11 = &stru_1E9D6EC48;
      v12 = v18;
    }
    ((void (*)(WTF::StringImpl **, WTF::StringImpl **))off_1E9D6AE30[v12])(v15, &v16);
LABEL_11:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v19, v10);
    return (id)v11;
  }
LABEL_13:
  if (v8 == 1)
  {
    LOBYTE(v15[0]) = (_BYTE)v16;
    v14 = v17;
    v17 = 0;
    v15[1] = v14;
    raiseDOMErrorException();
  }
  result = (id)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

@end
