@implementation DOMCSSRuleList

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
      (*(void (**)(DOMObjectInternal *))(*(_QWORD *)internal + 24))(internal);
    v5.receiver = self;
    v5.super_class = (Class)DOMCSSRuleList;
    -[DOMObject dealloc](&v5, sel_dealloc);
  }
}

- (unsigned)length
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = (*(uint64_t (**)(DOMObjectInternal *))(*(_QWORD *)self->super._internal + 32))(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (DOMCSSRule)item:(unsigned int)index
{
  uint64_t v3;
  WebCore::CSSRule *v5;
  DOMCSSRule *v6;
  void *v7;
  _BYTE v9[80];

  v3 = *(_QWORD *)&index;
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  v5 = (WebCore::CSSRule *)(*(uint64_t (**)(DOMObjectInternal *, uint64_t))(*(_QWORD *)self->super._internal
                                                                                   + 40))(self->super._internal, v3);
  v6 = (DOMCSSRule *)kit(v5);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v7);
  return v6;
}

@end
