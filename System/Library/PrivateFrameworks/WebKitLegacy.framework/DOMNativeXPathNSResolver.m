@implementation DOMNativeXPathNSResolver

- (void)dealloc
{
  DOMObjectInternal *internal;
  objc_super v4;

  internal = self->super._internal;
  if (internal)
  {
    if (*((_DWORD *)internal + 2) == 1)
      (*(void (**)(DOMObjectInternal *, SEL))(*(_QWORD *)internal + 8))(internal, a2);
    else
      --*((_DWORD *)internal + 2);
  }
  v4.receiver = self;
  v4.super_class = (Class)DOMNativeXPathNSResolver;
  -[DOMObject dealloc](&v4, sel_dealloc);
}

- (id)lookupNamespaceURI:(id)a3
{
  DOMObjectInternal *internal;
  StringImpl *v4;
  const __CFString *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;

  internal = self->super._internal;
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, (const __CFString *)a2);
  (*(void (**)(WTF::StringImpl **__return_ptr, DOMObjectInternal *, WTF::StringImpl **))(*(_QWORD *)internal
                                                                                                  + 16))(&v10, internal, &v9);
  if (v10)
  {
    v5 = (const __CFString *)WTF::StringImpl::operator NSString *();
    v6 = v10;
    v10 = 0;
    if (v6)
    {
      if (*(_DWORD *)v6 == 2)
      {
        WTF::StringImpl::destroy(v6, v4);
        v7 = v9;
        v9 = 0;
        if (!v7)
          return (id)v5;
      }
      else
      {
        *(_DWORD *)v6 -= 2;
        v7 = v9;
        v9 = 0;
        if (!v7)
          return (id)v5;
      }
      goto LABEL_8;
    }
  }
  else
  {
    v10 = 0;
    v5 = &stru_1E9D6EC48;
  }
  v7 = v9;
  v9 = 0;
  if (!v7)
    return (id)v5;
LABEL_8:
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
    return (id)v5;
  }
  WTF::StringImpl::destroy(v7, v4);
  return (id)v5;
}

@end
