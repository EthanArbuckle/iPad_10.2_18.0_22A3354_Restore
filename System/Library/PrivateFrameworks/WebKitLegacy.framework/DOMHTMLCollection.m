@implementation DOMHTMLCollection

- (void)dealloc
{
  objc_class *v3;
  DOMObjectInternal *internal;
  objc_super v5;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    internal = self->super._internal;
    if (internal)
    {
      if (*((_DWORD *)internal + 4) == 1)
        (*(void (**)(DOMObjectInternal *))(*(_QWORD *)internal + 8))(internal);
      else
        --*((_DWORD *)internal + 4);
    }
    v5.receiver = self;
    v5.super_class = (Class)DOMHTMLCollection;
    -[DOMObject dealloc](&v5, sel_dealloc);
  }
}

- (unsigned)length
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = (*(uint64_t (**)(DOMObjectInternal *))(*(_QWORD *)self->super._internal + 16))(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (DOMNode)item:(unsigned int)index
{
  uint64_t v3;
  WebCore::Node *v5;
  DOMNode *v6;
  void *v7;
  _BYTE v9[80];

  v3 = *(_QWORD *)&index;
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  v5 = (WebCore::Node *)(*(uint64_t (**)(DOMObjectInternal *, uint64_t))(*(_QWORD *)self->super._internal + 24))(self->super._internal, v3);
  v6 = (DOMNode *)kit(v5);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v7);
  return v6;
}

- (DOMNode)namedItem:(NSString *)name
{
  DOMObjectInternal *internal;
  const __CFString *v6;
  WebCore::Node *v7;
  StringImpl *v8;
  DOMNode *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v12;
  _BYTE v13[80];
  WTF::StringImpl *v14;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  internal = self->super._internal;
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)name, v6);
  v12 = v14;
  v7 = (WebCore::Node *)(*(uint64_t (**)(DOMObjectInternal *, WTF::StringImpl **))(*(_QWORD *)internal + 64))(internal, &v12);
  v9 = (DOMNode *)kit(v7);
  v10 = v12;
  v12 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy(v10, v8);
    else
      *(_DWORD *)v10 -= 2;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v8);
  return v9;
}

- (DOMNodeList)tags:(NSString *)name
{
  const __CFString *v4;
  StringImpl *v5;
  DOMNodeList *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v9;
  DOMObjectInternal *v10;
  _BYTE v11[80];
  WTF::StringImpl *v12;

  if (!name)
    return 0;
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)name, v4);
  v9 = v12;
  WebCore::ContainerNode::getElementsByTagName();
  v6 = (DOMNodeList *)kit(v10);
  if (!v10)
  {
LABEL_5:
    v7 = v9;
    if (v9)
      goto LABEL_6;
    goto LABEL_10;
  }
  if (*((_DWORD *)v10 + 4) != 1)
  {
    --*((_DWORD *)v10 + 4);
    goto LABEL_5;
  }
  (*(void (**)())(*(_QWORD *)v10 + 8))();
  v7 = v9;
  if (v9)
  {
LABEL_6:
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v5);
    else
      *(_DWORD *)v7 -= 2;
  }
LABEL_10:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v5);
  return v6;
}

@end
