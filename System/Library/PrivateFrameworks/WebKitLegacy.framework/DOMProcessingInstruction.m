@implementation DOMProcessingInstruction

- (NSString)target
{
  void *v3;
  const __CFString *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*((_QWORD *)self->super.super.super._internal + 13))
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v4 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (DOMStyleSheet)sheet
{
  DOMStyleSheet *v3;
  void *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMStyleSheet *)kit(*((DOMObjectInternal **)self->super.super.super._internal + 18));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

@end
