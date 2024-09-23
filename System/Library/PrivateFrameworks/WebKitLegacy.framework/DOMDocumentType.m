@implementation DOMDocumentType

- (NSString)name
{
  void *v3;
  const __CFString *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*((_QWORD *)self->super.super._internal + 10))
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v4 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (DOMNamedNodeMap)entities
{
  return 0;
}

- (DOMNamedNodeMap)notations
{
  return 0;
}

- (NSString)publicId
{
  void *v3;
  const __CFString *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*((_QWORD *)self->super.super._internal + 11))
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v4 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (NSString)systemId
{
  void *v3;
  const __CFString *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*((_QWORD *)self->super.super._internal + 12))
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v4 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (NSString)internalSubset
{
  return (NSString *)&stru_1E9D6EC48;
}

- (void)remove
{
  void *v3;
  char v4;
  uint64_t v5;
  char v6;
  _BYTE v7[88];
  uint64_t v8;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::Node::remove(self->super.super._internal);
  if (v6)
  {
    v7[80] = v4;
    v8 = v5;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
}

@end
