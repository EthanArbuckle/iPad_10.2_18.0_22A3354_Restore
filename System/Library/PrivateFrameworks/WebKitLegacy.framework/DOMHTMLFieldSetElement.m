@implementation DOMHTMLFieldSetElement

- (DOMHTMLFormElement)form
{
  uint64_t v3;
  WebCore::Node *v4;
  DOMHTMLFormElement *v5;
  void *v6;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  v3 = *((_QWORD *)self->super.super.super.super._internal + 15);
  if (v3)
    v4 = *(WebCore::Node **)(v3 + 8);
  else
    v4 = 0;
  v5 = (DOMHTMLFormElement *)kit(v4);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
  return v5;
}

@end
