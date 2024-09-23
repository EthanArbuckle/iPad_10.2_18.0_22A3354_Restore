@implementation DOMMutationEvent

- (DOMNode)relatedNode
{
  DOMNode *v3;
  void *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMNode *)kit(*((WebCore::Node **)self->super.super._internal + 9));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (NSString)prevValue
{
  StringImpl *v3;
  WTF::StringImpl *v4;
  const __CFString *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v4 = (WTF::StringImpl *)*((_QWORD *)self->super.super._internal + 10);
  if (v4)
  {
    *(_DWORD *)v4 += 2;
    v5 = (const __CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v4 == 2)
      WTF::StringImpl::destroy(v4, v3);
    else
      *(_DWORD *)v4 -= 2;
  }
  else
  {
    v5 = &stru_1E9D6EC48;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return &v5->isa;
}

- (NSString)newValue
{
  StringImpl *v3;
  WTF::StringImpl *v4;
  const __CFString *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v4 = (WTF::StringImpl *)*((_QWORD *)self->super.super._internal + 11);
  if (v4)
  {
    *(_DWORD *)v4 += 2;
    v5 = (const __CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v4 == 2)
      WTF::StringImpl::destroy(v4, v3);
    else
      *(_DWORD *)v4 -= 2;
  }
  else
  {
    v5 = &stru_1E9D6EC48;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return &v5->isa;
}

- (NSString)attrName
{
  StringImpl *v3;
  WTF::StringImpl *v4;
  const __CFString *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v4 = (WTF::StringImpl *)*((_QWORD *)self->super.super._internal + 12);
  if (v4)
  {
    *(_DWORD *)v4 += 2;
    v5 = (const __CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v4 == 2)
      WTF::StringImpl::destroy(v4, v3);
    else
      *(_DWORD *)v4 -= 2;
  }
  else
  {
    v5 = &stru_1E9D6EC48;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return &v5->isa;
}

- (unsigned)attrChange
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOWORD(self) = *((_WORD *)self->super.super._internal + 52);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (unsigned __int16)self;
}

- (void)initMutationEvent:(NSString *)type canBubble:(BOOL)canBubble cancelable:(BOOL)cancelable relatedNode:(DOMNode *)relatedNode prevValue:(NSString *)prevValue newValue:(NSString *)newValue attrName:(NSString *)attrName attrChange:(unsigned __int16)attrChange
{
  const __CFString *v13;
  StringImpl *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  WTF::StringImpl *v19;
  WTF::StringImpl *v20;
  WTF::StringImpl *v21;
  _BYTE v22[80];
  WTF::StringImpl *v23;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v22);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)type, v13);
  v21 = v23;
  MEMORY[0x1D82A3998](&v23, prevValue);
  MEMORY[0x1D82A3998](&v20, newValue);
  MEMORY[0x1D82A3998](&v19, attrName);
  WebCore::MutationEvent::initMutationEvent();
  v15 = v19;
  v19 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2)
    {
      WTF::StringImpl::destroy(v15, v14);
      v16 = v20;
      v20 = 0;
      if (!v16)
        goto LABEL_9;
      goto LABEL_7;
    }
    *(_DWORD *)v15 -= 2;
  }
  v16 = v20;
  v20 = 0;
  if (!v16)
  {
LABEL_9:
    v17 = v23;
    v23 = 0;
    if (!v17)
      goto LABEL_14;
    goto LABEL_12;
  }
LABEL_7:
  if (*(_DWORD *)v16 != 2)
  {
    *(_DWORD *)v16 -= 2;
    goto LABEL_9;
  }
  WTF::StringImpl::destroy(v16, v14);
  v17 = v23;
  v23 = 0;
  if (!v17)
    goto LABEL_14;
LABEL_12:
  if (*(_DWORD *)v17 == 2)
  {
    WTF::StringImpl::destroy(v17, v14);
    v18 = v21;
    v21 = 0;
    if (!v18)
      goto LABEL_20;
    goto LABEL_17;
  }
  *(_DWORD *)v17 -= 2;
LABEL_14:
  v18 = v21;
  v21 = 0;
  if (!v18)
    goto LABEL_20;
LABEL_17:
  if (*(_DWORD *)v18 == 2)
    WTF::StringImpl::destroy(v18, v14);
  else
    *(_DWORD *)v18 -= 2;
LABEL_20:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v22, v14);
}

- (void)initMutationEvent:(NSString *)type :(BOOL)canBubble :(BOOL)cancelable :(DOMNode *)relatedNode :(NSString *)prevValue :(NSString *)newValue :(NSString *)attrName :(unsigned __int16)attrChange
{
  -[DOMMutationEvent initMutationEvent:canBubble:cancelable:relatedNode:prevValue:newValue:attrName:attrChange:](self, "initMutationEvent:canBubble:cancelable:relatedNode:prevValue:newValue:attrName:attrChange:", type, canBubble, cancelable, relatedNode, prevValue, newValue);
}

@end
