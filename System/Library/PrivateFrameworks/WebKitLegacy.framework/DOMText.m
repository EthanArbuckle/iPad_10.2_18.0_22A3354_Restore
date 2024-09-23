@implementation DOMText

- (NSString)wholeText
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::Text::wholeText(self->super.super.super._internal);
  if (v6)
  {
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v3);
    else
      *(_DWORD *)v6 -= 2;
  }
  else
  {
    v4 = &stru_1E9D6EC48;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return &v4->isa;
}

- (DOMText)splitText:(unsigned int)offset
{
  WebCore::Node *v4;
  void *v5;
  DOMText *v6;
  DOMText *result;
  uint64_t v8;
  WebCore::Node *v9;
  uint64_t v10;
  int v11;
  WebCore::Node *v12;
  _BYTE v13[80];
  _BYTE v14[8];
  uint64_t v15;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  WebCore::Text::splitText(self->super.super.super._internal);
  if (v11)
  {
    if (v11 == 1)
    {
      v14[0] = (_BYTE)v9;
      v8 = v10;
      v10 = 0;
      v15 = v8;
      raiseDOMErrorException();
    }
    result = (DOMText *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    v4 = v9;
    v9 = 0;
    v12 = v4;
    v6 = (DOMText *)kit(v4);
    if (v4)
    {
      if (*((_DWORD *)v4 + 6) == 2)
      {
        if ((*((_WORD *)v4 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v4);
      }
      else
      {
        *((_DWORD *)v4 + 6) -= 2;
      }
    }
    if (v11 != -1)
      ((void (*)(_BYTE *, WebCore::Node **))off_1E9D6AFA0[v11])(v14, &v9);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v5);
    return v6;
  }
  return result;
}

- (DOMText)replaceWholeText:(NSString *)content
{
  DOMObjectInternal *internal;
  StringImpl *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v9;
  _BYTE v10[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super.super._internal;
  if (internal)
    *((_DWORD *)internal + 6) += 2;
  MEMORY[0x1D82A3998](&v9, content);
  WebCore::Text::replaceWholeText(internal, (const WTF::String *)&v9);
  v7 = v9;
  v9 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v6);
      if (!internal)
        goto LABEL_13;
      goto LABEL_9;
    }
    *(_DWORD *)v7 -= 2;
  }
  if (!internal)
    goto LABEL_13;
LABEL_9:
  if (*((_DWORD *)internal + 6) == 2)
  {
    if ((*((_WORD *)internal + 15) & 0x400) == 0)
      WebCore::Node::removedLastRef(internal);
  }
  else
  {
    *((_DWORD *)internal + 6) -= 2;
  }
LABEL_13:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v6);
  return self;
}

@end
