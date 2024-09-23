@implementation DOMHTMLOptionsCollection

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
    v5.super_class = (Class)DOMHTMLOptionsCollection;
    -[DOMObject dealloc](&v5, sel_dealloc);
  }
}

- (int)selectedIndex
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = WebCore::HTMLOptionsCollection::selectedIndex(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (void)setSelectedIndex:(int)selectedIndex
{
  void *v4;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLOptionsCollection::setSelectedIndex(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (unsigned)length
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = WebCore::HTMLOptionsCollection::length(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (void)setLength:(unsigned int)length
{
  void *v4;
  char v5;
  uint64_t v6;
  char v7;
  _BYTE v8[88];
  uint64_t v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLOptionsCollection::setLength(self->super._internal);
  if (v7)
  {
    v8[80] = v5;
    v9 = v6;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
}

- (DOMNode)namedItem:(NSString *)name
{
  const __CFString *v4;
  WebCore::Node *v5;
  StringImpl *v6;
  DOMNode *v7;
  WTF::StringImpl *v9;
  _BYTE v10[80];
  WTF::StringImpl *v11;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)name, v4);
  v9 = v11;
  v5 = (WebCore::Node *)WebCore::HTMLOptionsCollection::namedItem();
  v7 = (DOMNode *)kit(v5);
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
      WTF::StringImpl::destroy(v9, v6);
    else
      *(_DWORD *)v9 -= 2;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v6);
  return v7;
}

- (void)add:(DOMHTMLOptionElement *)option index:(unsigned int)index
{
  DOMObjectInternal *internal;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  int v10;
  char v11;
  DOMObjectInternal *v12;
  int v13;
  char v14;
  uint64_t v15;
  char v16;
  _BYTE v17[80];
  _BYTE v18[8];
  uint64_t v19;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17);
  if (!option)
    raiseTypeErrorException();
  internal = option->super.super.super.super._internal;
  if (internal)
    *((_DWORD *)internal + 6) += 2;
  v12 = internal;
  v13 = 0;
  v9 = index;
  v10 = 1;
  v11 = 1;
  WebCore::HTMLOptionsCollection::add();
  if (v16)
  {
    v18[0] = v14;
    v8 = v15;
    v15 = 0;
    v19 = v8;
    raiseDOMErrorException();
  }
  ((void (*)(_BYTE *, unsigned int *))off_1E9D6AE60[v10])(v18, &v9);
  if (v13 != -1)
    ((void (*)(unsigned int *, DOMObjectInternal **))off_1E9D6AE70[v13])(&v9, &v12);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17, v7);
}

- (void)remove:(unsigned int)index
{
  void *v4;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLOptionsCollection::remove(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (DOMNode)item:(unsigned int)index
{
  WebCore::Node *v4;
  DOMNode *v5;
  void *v6;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  v4 = (WebCore::Node *)WebCore::HTMLOptionsCollection::item(self->super._internal);
  v5 = (DOMNode *)kit(v4);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
  return v5;
}

@end
