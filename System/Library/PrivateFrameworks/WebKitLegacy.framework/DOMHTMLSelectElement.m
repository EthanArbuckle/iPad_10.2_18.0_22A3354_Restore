@implementation DOMHTMLSelectElement

- (void)_activateItemAtIndex:(int)a3
{
  DOMObjectInternal *internal;

  if (self)
  {
    internal = self->super.super.super.super._internal;
    if (internal)
      WebCore::HTMLSelectElement::optionSelectedByUser(internal);
  }
}

- (void)_activateItemAtIndex:(int)a3 allowMultipleSelection:(BOOL)a4
{
  DOMObjectInternal *internal;

  if (self)
  {
    internal = self->super.super.super.super._internal;
    if (internal)
      WebCore::HTMLSelectElement::optionSelectedByUser(internal);
  }
}

- (BOOL)autofocus
{
  void *v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  _BYTE v12[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  v4 = *((_QWORD *)self->super.super.super.super._internal + 13);
  if (!v4)
    goto LABEL_12;
  v5 = *(_DWORD *)(v4 + 4);
  if ((v5 & 1) != 0)
  {
    v6 = *(uint64_t **)(v4 + 40);
    LODWORD(v7) = *(_DWORD *)(v4 + 52);
    if (!(_DWORD)v7)
    {
LABEL_12:
      v10 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    v6 = (uint64_t *)(v4 + 32);
    LODWORD(v7) = v5 >> 5;
    if (!(_DWORD)v7)
      goto LABEL_12;
  }
  v8 = *MEMORY[0x1E0DD5E28];
  v7 = v7;
  while (1)
  {
    v9 = *v6;
    if (*v6 == v8 || *(_QWORD *)(v9 + 24) == *(_QWORD *)(v8 + 24) && *(_QWORD *)(v9 + 32) == *(_QWORD *)(v8 + 32))
      break;
    v6 += 2;
    if (!--v7)
      goto LABEL_12;
  }
  v10 = 1;
LABEL_13:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v3);
  return v10;
}

- (void)setAutofocus:(BOOL)autofocus
{
  void *v3;
  _BYTE v4[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::Element::setBooleanAttribute();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (BOOL)disabled
{
  void *v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  _BYTE v12[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  v4 = *((_QWORD *)self->super.super.super.super._internal + 13);
  if (!v4)
    goto LABEL_12;
  v5 = *(_DWORD *)(v4 + 4);
  if ((v5 & 1) != 0)
  {
    v6 = *(uint64_t **)(v4 + 40);
    LODWORD(v7) = *(_DWORD *)(v4 + 52);
    if (!(_DWORD)v7)
    {
LABEL_12:
      v10 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    v6 = (uint64_t *)(v4 + 32);
    LODWORD(v7) = v5 >> 5;
    if (!(_DWORD)v7)
      goto LABEL_12;
  }
  v8 = *MEMORY[0x1E0DD5DC8];
  v7 = v7;
  while (1)
  {
    v9 = *v6;
    if (*v6 == v8 || *(_QWORD *)(v9 + 24) == *(_QWORD *)(v8 + 24) && *(_QWORD *)(v9 + 32) == *(_QWORD *)(v8 + 32))
      break;
    v6 += 2;
    if (!--v7)
      goto LABEL_12;
  }
  v10 = 1;
LABEL_13:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v3);
  return v10;
}

- (void)setDisabled:(BOOL)disabled
{
  void *v3;
  _BYTE v4[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::Element::setBooleanAttribute();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

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

- (BOOL)multiple
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = *((_BYTE *)self->super.super.super.super._internal + 297);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (void)setMultiple:(BOOL)multiple
{
  void *v3;
  _BYTE v4[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::Element::setBooleanAttribute();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (NSString)name
{
  void *v3;
  uint64_t v4;
  unsigned int v5;
  const __CFString *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v12[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  v4 = *((_QWORD *)self->super.super.super.super._internal + 13);
  if (v4)
  {
    v5 = *(_DWORD *)(v4 + 4);
    if ((v5 & 2) != 0)
    {
      if ((v5 & 1) != 0)
      {
        v7 = *(uint64_t **)(v4 + 40);
        LODWORD(v8) = *(_DWORD *)(v4 + 52);
        if (!(_DWORD)v8)
        {
LABEL_15:
          v7 = 0;
          goto LABEL_16;
        }
      }
      else
      {
        v7 = (uint64_t *)(v4 + 32);
        LODWORD(v8) = v5 >> 5;
        if (!(_DWORD)v8)
          goto LABEL_15;
      }
      v9 = *MEMORY[0x1E0DD60E0];
      v8 = v8;
      while (1)
      {
        v10 = *v7;
        if (*v7 == v9 || *(_QWORD *)(v10 + 24) == *(_QWORD *)(v9 + 24) && *(_QWORD *)(v10 + 32) == *(_QWORD *)(v9 + 32))
          break;
        v7 += 2;
        if (!--v8)
          goto LABEL_15;
      }
LABEL_16:
      if (v7[1])
        goto LABEL_4;
LABEL_17:
      v6 = &stru_1E9D6EC48;
      goto LABEL_18;
    }
  }
  if (!*MEMORY[0x1E0CBF2F8])
    goto LABEL_17;
LABEL_4:
  v6 = (const __CFString *)WTF::StringImpl::operator NSString *();
LABEL_18:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v3);
  return &v6->isa;
}

- (void)setName:(NSString *)name
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)name, v4);
  v7 = v9;
  WebCore::Element::setAttributeWithoutSynchronization();
  if (!v7)
    goto LABEL_4;
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
LABEL_4:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v5);
    return;
  }
  WTF::StringImpl::destroy(v7, v5);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
}

- (int)size
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super.super.super.super._internal + 70);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (void)setSize:(int)size
{
  void *v4;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLSelectElement::setSize(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (NSString)type
{
  void *v3;
  const __CFString *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(_QWORD *)(*(uint64_t (**)(char *))(*((_QWORD *)self->super.super.super.super._internal + 14) + 328))((char *)self->super.super.super.super._internal + 112))
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v4 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (DOMHTMLOptionsCollection)options
{
  void *v3;
  DOMHTMLOptionsCollection *v4;
  WebCore::HTMLOptionsCollection *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::HTMLSelectElement::options(self->super.super.super.super._internal);
  v4 = (DOMHTMLOptionsCollection *)kit(v6);
  if (v6)
  {
    if (*((_DWORD *)v6 + 4) == 1)
      (*(void (**)())(*(_QWORD *)v6 + 8))();
    else
      --*((_DWORD *)v6 + 4);
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return v4;
}

- (int)length
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = WebCore::HTMLSelectElement::length(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (int)selectedIndex
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = WebCore::HTMLSelectElement::selectedIndex(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (void)setSelectedIndex:(int)selectedIndex
{
  void *v4;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLSelectElement::setSelectedIndex(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (NSString)value
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::HTMLSelectElement::value(self->super.super.super.super._internal);
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

- (void)setValue:(NSString *)value
{
  DOMObjectInternal *internal;
  StringImpl *v6;
  WTF::StringImpl *v7;
  void *v8;
  WTF::StringImpl *v9;
  _BYTE v10[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super.super.super._internal;
  MEMORY[0x1D82A3998](&v9, value);
  WebCore::HTMLSelectElement::setValue(internal, (const WTF::String *)&v9);
  v7 = v9;
  v9 = 0;
  if (!v7)
    goto LABEL_4;
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
LABEL_4:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v6);
    return;
  }
  WTF::StringImpl::destroy(v7, v6);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v8);
}

- (BOOL)willValidate
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = (*(uint64_t (**)(char *))(*((_QWORD *)self->super.super.super.super._internal + 14) + 272))((char *)self->super.super.super.super._internal + 112);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (DOMNode)item:(unsigned int)index
{
  WebCore::Node *v4;
  DOMNode *v5;
  void *v6;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  v4 = (WebCore::Node *)WebCore::HTMLSelectElement::item(self->super.super.super.super._internal);
  v5 = (DOMNode *)kit(v4);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
  return v5;
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
  v5 = (WebCore::Node *)WebCore::HTMLSelectElement::namedItem();
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

- (void)add:(DOMHTMLElement *)element before:(DOMHTMLElement *)before
{
  DOMObjectInternal *internal;
  uint64_t v7;
  DOMObjectInternal *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  DOMObjectInternal *v13;
  int v14;
  char v15;
  _BYTE v16[8];
  uint64_t v17;
  char v18;
  DOMObjectInternal *v19;
  int v20;
  _BYTE v21[80];
  _BYTE v22[8];
  uint64_t v23;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v21);
  if (!element)
    raiseTypeErrorException();
  internal = element->super.super.super._internal;
  v19 = 0;
  v20 = 0;
  v7 = *(_QWORD *)(*((_QWORD *)internal + 12) + 24);
  if (v7 != *(_QWORD *)(*MEMORY[0x1E0DD6200] + 24))
  {
    if (v7 != *(_QWORD *)(*MEMORY[0x1E0DD5D68] + 24))
      raiseTypeErrorException();
    *((_DWORD *)internal + 6) += 2;
    v19 = internal;
    v20 = 1;
    if (before)
      goto LABEL_5;
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  *((_DWORD *)internal + 6) += 2;
  v19 = internal;
  if (!before)
    goto LABEL_8;
LABEL_5:
  v8 = before->super.super.super._internal;
  if (v8)
    *((_DWORD *)v8 + 6) += 2;
LABEL_9:
  v12 = 0;
  v11 = 0;
  v13 = v8;
  v14 = 0;
  v15 = 1;
  WebCore::HTMLSelectElement::add();
  if (v18)
  {
    v22[0] = v16[0];
    v10 = v17;
    v17 = 0;
    v23 = v10;
    raiseDOMErrorException();
  }
  ((void (*)(_BYTE *, DOMObjectInternal **))off_1E9D6AE80[v14])(v22, &v13);
  v14 = -1;
  ((void (*)(_BYTE *, uint64_t *))off_1E9D6AE80[v12])(v22, &v11);
  if (v20 != -1)
    ((void (*)(_BYTE *, DOMObjectInternal **))off_1E9D6AE90[v20])(v16, &v19);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v21, v9);
}

- (void)remove:(int)index
{
  void *v4;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLSelectElement::remove(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (int)structuralComplexityContribution
{
  return 0x7FFFFFFF;
}

- (unsigned)completeLength
{
  if (self)
    self = (DOMHTMLSelectElement *)self->super.super.super.super._internal;
  return *(_DWORD *)(WebCore::HTMLSelectElement::listItems((WebCore::HTMLSelectElement *)self) + 12);
}

- (id)listItemAtIndex:(int)a3
{
  id result;
  uint64_t v5;
  WebCore::Node *v6;

  if (self)
    self = (DOMHTMLSelectElement *)self->super.super.super.super._internal;
  result = (id)WebCore::HTMLSelectElement::listItems((WebCore::HTMLSelectElement *)self);
  if (*((unsigned int *)result + 3) <= (unint64_t)a3)
  {
    __break(0xC471u);
  }
  else
  {
    v5 = *(_QWORD *)(*(_QWORD *)result + 8 * a3);
    if (v5)
      v6 = *(WebCore::Node **)(v5 + 8);
    else
      v6 = 0;
    return kit(v6);
  }
  return result;
}

@end
