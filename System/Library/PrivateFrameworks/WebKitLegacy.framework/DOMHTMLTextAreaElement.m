@implementation DOMHTMLTextAreaElement

- (BOOL)_isEdited
{
  WebCore::HTMLTextFormControlElement *v2;

  v2 = (WebCore::HTMLTextFormControlElement *)core((uint64_t)self);
  return WebCore::HTMLTextFormControlElement::lastChangeWasUserEdit(v2);
}

- (int)_autocapitalizeType
{
  WebCore::HTMLFormControlElement *v2;
  char v3;

  v2 = (WebCore::HTMLFormControlElement *)core((uint64_t)self);
  v3 = WebCore::HTMLFormControlElement::autocapitalizeType(v2);
  if (((v3 - 1) & 0xFC) != 0)
    return 0;
  else
    return (v3 - 1) + 1;
}

- (BOOL)autofocus
{
  void *v3;
  DOMObjectInternal *internal;
  uint64_t v5;
  unsigned int v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  BOOL result;
  _BYTE v13[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    v5 = *((_QWORD *)internal + 13);
    if (v5)
    {
      v6 = *(_DWORD *)(v5 + 4);
      if ((v6 & 1) == 0)
      {
        v7 = (uint64_t *)(v5 + 32);
        LODWORD(v8) = v6 >> 5;
        if (!(_DWORD)v8)
          goto LABEL_14;
LABEL_8:
        v9 = *MEMORY[0x1E0DD5E28];
        v8 = v8;
        while (1)
        {
          v10 = *v7;
          if (*v7 == v9
            || *(_QWORD *)(v10 + 24) == *(_QWORD *)(v9 + 24) && *(_QWORD *)(v10 + 32) == *(_QWORD *)(v9 + 32))
          {
            break;
          }
          v7 += 2;
          if (!--v8)
            goto LABEL_14;
        }
        v11 = 1;
        goto LABEL_15;
      }
      v7 = *(uint64_t **)(v5 + 40);
      LODWORD(v8) = *(_DWORD *)(v5 + 52);
      if ((_DWORD)v8)
        goto LABEL_8;
    }
LABEL_14:
    v11 = 0;
LABEL_15:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v3);
    return v11;
  }
  result = 96;
  __break(0xC471u);
  return result;
}

- (void)setAutofocus:(BOOL)autofocus
{
  DOMObjectInternal *internal;
  void *v5;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    WebCore::Element::setBooleanAttribute();
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v5);
  }
  else
  {
    __break(0xC471u);
  }
}

- (id)dirName
{
  DOMObjectInternal *internal;
  void *v4;
  const __CFString *v5;
  id result;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    if (*(_QWORD *)WebCore::Element::getAttribute())
      v5 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v5 = &stru_1E9D6EC48;
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v4);
    return (id)v5;
  }
  else
  {
    result = (id)96;
    __break(0xC471u);
  }
  return result;
}

- (void)setDirName:(id)a3
{
  const __CFString *v5;
  DOMObjectInternal *internal;
  StringImpl *v7;
  void *v8;
  WTF::StringImpl *v9;
  _BYTE v10[80];
  WTF::StringImpl *v11;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, v5);
    v9 = v11;
    WebCore::Element::setAttributeWithoutSynchronization();
    if (!v9)
    {
LABEL_6:
      WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v7);
      return;
    }
    if (*(_DWORD *)v9 != 2)
    {
      *(_DWORD *)v9 -= 2;
      goto LABEL_6;
    }
    WTF::StringImpl::destroy(v9, v7);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v8);
  }
  else
  {
    __break(0xC471u);
  }
}

- (BOOL)disabled
{
  void *v3;
  DOMObjectInternal *internal;
  uint64_t v5;
  unsigned int v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  BOOL result;
  _BYTE v13[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    v5 = *((_QWORD *)internal + 13);
    if (v5)
    {
      v6 = *(_DWORD *)(v5 + 4);
      if ((v6 & 1) == 0)
      {
        v7 = (uint64_t *)(v5 + 32);
        LODWORD(v8) = v6 >> 5;
        if (!(_DWORD)v8)
          goto LABEL_14;
LABEL_8:
        v9 = *MEMORY[0x1E0DD5DC8];
        v8 = v8;
        while (1)
        {
          v10 = *v7;
          if (*v7 == v9
            || *(_QWORD *)(v10 + 24) == *(_QWORD *)(v9 + 24) && *(_QWORD *)(v10 + 32) == *(_QWORD *)(v9 + 32))
          {
            break;
          }
          v7 += 2;
          if (!--v8)
            goto LABEL_14;
        }
        v11 = 1;
        goto LABEL_15;
      }
      v7 = *(uint64_t **)(v5 + 40);
      LODWORD(v8) = *(_DWORD *)(v5 + 52);
      if ((_DWORD)v8)
        goto LABEL_8;
    }
LABEL_14:
    v11 = 0;
LABEL_15:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v3);
    return v11;
  }
  result = 96;
  __break(0xC471u);
  return result;
}

- (void)setDisabled:(BOOL)disabled
{
  DOMObjectInternal *internal;
  void *v5;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    WebCore::Element::setBooleanAttribute();
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v5);
  }
  else
  {
    __break(0xC471u);
  }
}

- (DOMHTMLFormElement)form
{
  DOMObjectInternal *internal;
  uint64_t v4;
  WebCore::Node *v5;
  DOMHTMLFormElement *v6;
  void *v7;
  DOMHTMLFormElement *result;
  _BYTE v9[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    v4 = *((_QWORD *)internal + 15);
    if (v4)
      v5 = *(WebCore::Node **)(v4 + 8);
    else
      v5 = 0;
    v6 = (DOMHTMLFormElement *)kit(v5);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v7);
    return v6;
  }
  else
  {
    result = (DOMHTMLFormElement *)96;
    __break(0xC471u);
  }
  return result;
}

- (int)maxLength
{
  void *v3;
  DOMObjectInternal *internal;
  int v5;
  int result;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    v5 = *((_DWORD *)internal + 43);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
    return v5;
  }
  else
  {
    result = 96;
    __break(0xC471u);
  }
  return result;
}

- (void)setMaxLength:(int)a3
{
  DOMObjectInternal *internal;
  void *v5;
  char v6;
  uint64_t v7;
  char v8;
  _BYTE v9[88];
  uint64_t v10;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) == 0
    || *(_QWORD *)(*((_QWORD *)internal + 12) + 24) != *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    __break(0xC471u);
    JUMPOUT(0x1D80225A8);
  }
  WebCore::HTMLTextFormControlElement::setMaxLength(internal);
  if (v8)
  {
    v9[80] = v6;
    v10 = v7;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v5);
}

- (NSString)name
{
  void *v3;
  DOMObjectInternal *internal;
  uint64_t v5;
  unsigned int v6;
  const __CFString *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSString *result;
  _BYTE v13[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    v5 = *((_QWORD *)internal + 13);
    if (!v5 || (v6 = *(_DWORD *)(v5 + 4), (v6 & 2) == 0))
    {
      if (*MEMORY[0x1E0CBF2F8])
      {
LABEL_6:
        v7 = (const __CFString *)WTF::StringImpl::operator NSString *();
LABEL_20:
        WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v3);
        return &v7->isa;
      }
LABEL_19:
      v7 = &stru_1E9D6EC48;
      goto LABEL_20;
    }
    if ((v6 & 1) != 0)
    {
      v8 = *(uint64_t **)(v5 + 40);
      LODWORD(v9) = *(_DWORD *)(v5 + 52);
      if (!(_DWORD)v9)
      {
LABEL_17:
        v8 = 0;
        goto LABEL_18;
      }
    }
    else
    {
      v8 = (uint64_t *)(v5 + 32);
      LODWORD(v9) = v6 >> 5;
      if (!(_DWORD)v9)
        goto LABEL_17;
    }
    v10 = *MEMORY[0x1E0DD60E0];
    v9 = v9;
    while (1)
    {
      v11 = *v8;
      if (*v8 == v10
        || *(_QWORD *)(v11 + 24) == *(_QWORD *)(v10 + 24) && *(_QWORD *)(v11 + 32) == *(_QWORD *)(v10 + 32))
      {
        break;
      }
      v8 += 2;
      if (!--v9)
        goto LABEL_17;
    }
LABEL_18:
    if (v8[1])
      goto LABEL_6;
    goto LABEL_19;
  }
  result = (NSString *)96;
  __break(0xC471u);
  return result;
}

- (void)setName:(NSString *)name
{
  const __CFString *v5;
  DOMObjectInternal *internal;
  StringImpl *v7;
  void *v8;
  WTF::StringImpl *v9;
  _BYTE v10[80];
  WTF::StringImpl *v11;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    WTF::AtomStringImpl::add((WTF::AtomStringImpl *)name, v5);
    v9 = v11;
    WebCore::Element::setAttributeWithoutSynchronization();
    if (!v9)
    {
LABEL_6:
      WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v7);
      return;
    }
    if (*(_DWORD *)v9 != 2)
    {
      *(_DWORD *)v9 -= 2;
      goto LABEL_6;
    }
    WTF::StringImpl::destroy(v9, v7);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v8);
  }
  else
  {
    __break(0xC471u);
  }
}

- (id)placeholder
{
  DOMObjectInternal *internal;
  void *v4;
  const __CFString *v5;
  id result;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    if (*(_QWORD *)WebCore::Element::getAttribute())
      v5 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v5 = &stru_1E9D6EC48;
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v4);
    return (id)v5;
  }
  else
  {
    result = (id)96;
    __break(0xC471u);
  }
  return result;
}

- (void)setPlaceholder:(id)a3
{
  const __CFString *v5;
  DOMObjectInternal *internal;
  StringImpl *v7;
  void *v8;
  WTF::StringImpl *v9;
  _BYTE v10[80];
  WTF::StringImpl *v11;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, v5);
    v9 = v11;
    WebCore::Element::setAttributeWithoutSynchronization();
    if (!v9)
    {
LABEL_6:
      WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v7);
      return;
    }
    if (*(_DWORD *)v9 != 2)
    {
      *(_DWORD *)v9 -= 2;
      goto LABEL_6;
    }
    WTF::StringImpl::destroy(v9, v7);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v8);
  }
  else
  {
    __break(0xC471u);
  }
}

- (BOOL)readOnly
{
  void *v3;
  DOMObjectInternal *internal;
  uint64_t v5;
  unsigned int v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  BOOL result;
  _BYTE v13[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    v5 = *((_QWORD *)internal + 13);
    if (v5)
    {
      v6 = *(_DWORD *)(v5 + 4);
      if ((v6 & 1) == 0)
      {
        v7 = (uint64_t *)(v5 + 32);
        LODWORD(v8) = v6 >> 5;
        if (!(_DWORD)v8)
          goto LABEL_14;
LABEL_8:
        v9 = *MEMORY[0x1E0DD5DF8];
        v8 = v8;
        while (1)
        {
          v10 = *v7;
          if (*v7 == v9
            || *(_QWORD *)(v10 + 24) == *(_QWORD *)(v9 + 24) && *(_QWORD *)(v10 + 32) == *(_QWORD *)(v9 + 32))
          {
            break;
          }
          v7 += 2;
          if (!--v8)
            goto LABEL_14;
        }
        v11 = 1;
        goto LABEL_15;
      }
      v7 = *(uint64_t **)(v5 + 40);
      LODWORD(v8) = *(_DWORD *)(v5 + 52);
      if ((_DWORD)v8)
        goto LABEL_8;
    }
LABEL_14:
    v11 = 0;
LABEL_15:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v3);
    return v11;
  }
  result = 96;
  __break(0xC471u);
  return result;
}

- (void)setReadOnly:(BOOL)readOnly
{
  DOMObjectInternal *internal;
  void *v5;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    WebCore::Element::setBooleanAttribute();
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v5);
  }
  else
  {
    __break(0xC471u);
  }
}

- (BOOL)required
{
  void *v3;
  DOMObjectInternal *internal;
  uint64_t v5;
  unsigned int v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  BOOL result;
  _BYTE v13[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    v5 = *((_QWORD *)internal + 13);
    if (v5)
    {
      v6 = *(_DWORD *)(v5 + 4);
      if ((v6 & 1) == 0)
      {
        v7 = (uint64_t *)(v5 + 32);
        LODWORD(v8) = v6 >> 5;
        if (!(_DWORD)v8)
          goto LABEL_14;
LABEL_8:
        v9 = *MEMORY[0x1E0DD5E00];
        v8 = v8;
        while (1)
        {
          v10 = *v7;
          if (*v7 == v9
            || *(_QWORD *)(v10 + 24) == *(_QWORD *)(v9 + 24) && *(_QWORD *)(v10 + 32) == *(_QWORD *)(v9 + 32))
          {
            break;
          }
          v7 += 2;
          if (!--v8)
            goto LABEL_14;
        }
        v11 = 1;
        goto LABEL_15;
      }
      v7 = *(uint64_t **)(v5 + 40);
      LODWORD(v8) = *(_DWORD *)(v5 + 52);
      if ((_DWORD)v8)
        goto LABEL_8;
    }
LABEL_14:
    v11 = 0;
LABEL_15:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v3);
    return v11;
  }
  result = 96;
  __break(0xC471u);
  return result;
}

- (void)setRequired:(BOOL)a3
{
  DOMObjectInternal *internal;
  void *v5;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    WebCore::Element::setBooleanAttribute();
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v5);
  }
  else
  {
    __break(0xC471u);
  }
}

- (int)rows
{
  void *v3;
  DOMObjectInternal *internal;
  int v5;
  int result;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    v5 = *((_DWORD *)internal + 52);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
    return v5;
  }
  else
  {
    result = 96;
    __break(0xC471u);
  }
  return result;
}

- (void)setRows:(int)rows
{
  DOMObjectInternal *internal;
  void *v5;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    WebCore::HTMLTextAreaElement::setRows(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v5);
  }
  else
  {
    __break(0xC471u);
  }
}

- (int)cols
{
  void *v3;
  DOMObjectInternal *internal;
  int v5;
  int result;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    v5 = *((_DWORD *)internal + 53);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
    return v5;
  }
  else
  {
    result = 96;
    __break(0xC471u);
  }
  return result;
}

- (void)setCols:(int)cols
{
  DOMObjectInternal *internal;
  void *v5;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    WebCore::HTMLTextAreaElement::setCols(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v5);
  }
  else
  {
    __break(0xC471u);
  }
}

- (id)wrap
{
  DOMObjectInternal *internal;
  void *v4;
  const __CFString *v5;
  id result;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    if (*(_QWORD *)WebCore::Element::getAttribute())
      v5 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v5 = &stru_1E9D6EC48;
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v4);
    return (id)v5;
  }
  else
  {
    result = (id)96;
    __break(0xC471u);
  }
  return result;
}

- (void)setWrap:(id)a3
{
  const __CFString *v5;
  DOMObjectInternal *internal;
  StringImpl *v7;
  void *v8;
  WTF::StringImpl *v9;
  _BYTE v10[80];
  WTF::StringImpl *v11;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, v5);
    v9 = v11;
    WebCore::Element::setAttributeWithoutSynchronization();
    if (!v9)
    {
LABEL_6:
      WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v7);
      return;
    }
    if (*(_DWORD *)v9 != 2)
    {
      *(_DWORD *)v9 -= 2;
      goto LABEL_6;
    }
    WTF::StringImpl::destroy(v9, v7);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v8);
  }
  else
  {
    __break(0xC471u);
  }
}

- (NSString)type
{
  DOMObjectInternal *internal;
  void *v4;
  const __CFString *v5;
  NSString *result;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    if (*(_QWORD *)(*(uint64_t (**)(uint64_t))(*((_QWORD *)internal + 14) + 328))((uint64_t)internal + 112))
      v5 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v5 = &stru_1E9D6EC48;
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v4);
    return &v5->isa;
  }
  else
  {
    result = (NSString *)96;
    __break(0xC471u);
  }
  return result;
}

- (NSString)defaultValue
{
  DOMObjectInternal *internal;
  StringImpl *v4;
  const __CFString *v5;
  WTF::StringImpl *v6;
  NSString *result;
  WTF::StringImpl *v8;
  _BYTE v9[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    MEMORY[0x1D82A8420](&v8);
    if (v8)
    {
      v5 = (const __CFString *)WTF::StringImpl::operator NSString *();
      v6 = v8;
      v8 = 0;
      if (v6)
      {
        if (*(_DWORD *)v6 == 2)
          WTF::StringImpl::destroy(v6, v4);
        else
          *(_DWORD *)v6 -= 2;
      }
    }
    else
    {
      v5 = &stru_1E9D6EC48;
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v4);
    return &v5->isa;
  }
  else
  {
    result = (NSString *)96;
    __break(0xC471u);
  }
  return result;
}

- (void)setDefaultValue:(NSString *)defaultValue
{
  DOMObjectInternal *internal;
  StringImpl *v6;
  WTF::StringImpl *v7;
  void *v8;
  WTF::StringImpl *v9;
  _BYTE v10[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    MEMORY[0x1D82A3998](&v9, defaultValue);
    WebCore::HTMLTextAreaElement::setDefaultValue();
    v7 = v9;
    v9 = 0;
    if (!v7)
    {
LABEL_6:
      WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v6);
      return;
    }
    if (*(_DWORD *)v7 != 2)
    {
      *(_DWORD *)v7 -= 2;
      goto LABEL_6;
    }
    WTF::StringImpl::destroy(v7, v6);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v8);
  }
  else
  {
    __break(0xC471u);
  }
}

- (NSString)value
{
  DOMObjectInternal *internal;
  StringImpl *v4;
  const __CFString *v5;
  NSString *result;
  WTF::StringImpl *v7;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    WebCore::HTMLTextAreaElement::value(internal);
    if (v7)
    {
      v5 = (const __CFString *)WTF::StringImpl::operator NSString *();
      if (*(_DWORD *)v7 == 2)
        WTF::StringImpl::destroy(v7, v4);
      else
        *(_DWORD *)v7 -= 2;
    }
    else
    {
      v5 = &stru_1E9D6EC48;
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
    return &v5->isa;
  }
  else
  {
    result = (NSString *)96;
    __break(0xC471u);
  }
  return result;
}

- (void)setValue:(NSString *)value
{
  DOMObjectInternal *internal;
  StringImpl *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;
  void *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  char v12;
  _BYTE v13[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) == 0
    || *(_QWORD *)(*((_QWORD *)internal + 12) + 24) != *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    __break(0xC471u);
    return;
  }
  MEMORY[0x1D82A3998](&v10, value);
  WebCore::HTMLTextAreaElement::setValue();
  if (!v12)
    goto LABEL_7;
  v7 = v11;
  v11 = 0;
  if (!v7)
    goto LABEL_7;
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
LABEL_7:
    v8 = v10;
    v10 = 0;
    if (!v8)
    {
LABEL_10:
      WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v6);
      return;
    }
    goto LABEL_8;
  }
  WTF::StringImpl::destroy(v7, v6);
  v8 = v10;
  v10 = 0;
  if (!v8)
    goto LABEL_10;
LABEL_8:
  if (*(_DWORD *)v8 != 2)
  {
    *(_DWORD *)v8 -= 2;
    goto LABEL_10;
  }
  WTF::StringImpl::destroy(v8, v6);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v9);
}

- (unsigned)textLength
{
  DOMObjectInternal *internal;
  StringImpl *v4;
  WTF::StringImpl *v5;
  unsigned int v6;
  unsigned int result;
  _BYTE v8[80];
  unsigned int *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    WebCore::HTMLTextAreaElement::value(internal);
    v5 = (WTF::StringImpl *)v9;
    if (v9)
    {
      v6 = v9[1];
      v9 = 0;
      if (*(_DWORD *)v5 == 2)
        WTF::StringImpl::destroy(v5, v4);
      else
        *(_DWORD *)v5 -= 2;
    }
    else
    {
      v6 = 0;
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
    return v6;
  }
  else
  {
    result = 96;
    __break(0xC471u);
  }
  return result;
}

- (BOOL)willValidate
{
  DOMObjectInternal *internal;
  char v4;
  void *v5;
  BOOL result;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    v4 = WebCore::ValidatedFormListedElement::willValidate((DOMObjectInternal *)((char *)internal + 112));
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
    return v4;
  }
  else
  {
    result = 96;
    __break(0xC471u);
  }
  return result;
}

- (id)labels
{
  DOMObjectInternal *internal;
  void *v4;
  DOMObjectInternal *v5;
  id result;
  DOMObjectInternal *v7;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    WebCore::HTMLElement::labels(internal);
    v5 = kit(v7);
    if (v7)
    {
      if (*((_DWORD *)v7 + 4) == 1)
        (*(void (**)())(*(_QWORD *)v7 + 8))();
      else
        --*((_DWORD *)v7 + 4);
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
    return v5;
  }
  else
  {
    result = (id)96;
    __break(0xC471u);
  }
  return result;
}

- (int)selectionStart
{
  DOMObjectInternal *internal;
  int v4;
  void *v5;
  int result;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    v4 = WebCore::HTMLTextFormControlElement::selectionStart(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
    return v4;
  }
  else
  {
    result = 96;
    __break(0xC471u);
  }
  return result;
}

- (void)setSelectionStart:(int)selectionStart
{
  DOMObjectInternal *internal;
  void *v5;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    WebCore::HTMLTextFormControlElement::setSelectionStart(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v5);
  }
  else
  {
    __break(0xC471u);
  }
}

- (int)selectionEnd
{
  DOMObjectInternal *internal;
  int v4;
  void *v5;
  int result;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    v4 = WebCore::HTMLTextFormControlElement::selectionEnd(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
    return v4;
  }
  else
  {
    result = 96;
    __break(0xC471u);
  }
  return result;
}

- (void)setSelectionEnd:(int)selectionEnd
{
  DOMObjectInternal *internal;
  void *v5;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    WebCore::HTMLTextFormControlElement::setSelectionEnd(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v5);
  }
  else
  {
    __break(0xC471u);
  }
}

- (id)selectionDirection
{
  DOMObjectInternal *internal;
  void *v4;
  const __CFString *v5;
  id result;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    if (*(_QWORD *)WebCore::HTMLTextFormControlElement::selectionDirection(internal))
      v5 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v5 = &stru_1E9D6EC48;
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v4);
    return (id)v5;
  }
  else
  {
    result = (id)96;
    __break(0xC471u);
  }
  return result;
}

- (void)setSelectionDirection:(id)a3
{
  DOMObjectInternal *internal;
  StringImpl *v6;
  WTF::StringImpl *v7;
  void *v8;
  WTF::StringImpl *v9;
  _BYTE v10[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    MEMORY[0x1D82A3998](&v9, a3);
    WebCore::HTMLTextFormControlElement::setSelectionDirection(internal, (const WTF::String *)&v9);
    v7 = v9;
    v9 = 0;
    if (!v7)
    {
LABEL_6:
      WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v6);
      return;
    }
    if (*(_DWORD *)v7 != 2)
    {
      *(_DWORD *)v7 -= 2;
      goto LABEL_6;
    }
    WTF::StringImpl::destroy(v7, v6);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v8);
  }
  else
  {
    __break(0xC471u);
  }
}

- (NSString)accessKey
{
  DOMObjectInternal *internal;
  void *v4;
  const __CFString *v5;
  NSString *result;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    if (*(_QWORD *)WebCore::Element::getAttribute())
      v5 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v5 = &stru_1E9D6EC48;
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v4);
    return &v5->isa;
  }
  else
  {
    result = (NSString *)96;
    __break(0xC471u);
  }
  return result;
}

- (void)setAccessKey:(NSString *)accessKey
{
  const __CFString *v5;
  DOMObjectInternal *internal;
  StringImpl *v7;
  void *v8;
  WTF::StringImpl *v9;
  _BYTE v10[80];
  WTF::StringImpl *v11;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    WTF::AtomStringImpl::add((WTF::AtomStringImpl *)accessKey, v5);
    v9 = v11;
    WebCore::Element::setAttributeWithoutSynchronization();
    if (!v9)
    {
LABEL_6:
      WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v7);
      return;
    }
    if (*(_DWORD *)v9 != 2)
    {
      *(_DWORD *)v9 -= 2;
      goto LABEL_6;
    }
    WTF::StringImpl::destroy(v9, v7);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v8);
  }
  else
  {
    __break(0xC471u);
  }
}

- (id)autocomplete
{
  DOMObjectInternal *internal;
  StringImpl *v4;
  const __CFString *v5;
  id result;
  WTF::StringImpl *v7;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    WebCore::HTMLFormControlElement::autocomplete(internal);
    if (v7)
    {
      v5 = (const __CFString *)WTF::StringImpl::operator NSString *();
      if (*(_DWORD *)v7 == 2)
        WTF::StringImpl::destroy(v7, v4);
      else
        *(_DWORD *)v7 -= 2;
    }
    else
    {
      v5 = &stru_1E9D6EC48;
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
    return (id)v5;
  }
  else
  {
    result = (id)96;
    __break(0xC471u);
  }
  return result;
}

- (void)setAutocomplete:(id)a3
{
  const __CFString *v5;
  DOMObjectInternal *internal;
  StringImpl *v7;
  void *v8;
  WTF::StringImpl *v9;
  _BYTE v10[80];
  WTF::StringImpl *v11;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, v5);
    v9 = v11;
    WebCore::HTMLFormControlElement::setAutocomplete();
    if (!v9)
    {
LABEL_6:
      WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v7);
      return;
    }
    if (*(_DWORD *)v9 != 2)
    {
      *(_DWORD *)v9 -= 2;
      goto LABEL_6;
    }
    WTF::StringImpl::destroy(v9, v7);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v8);
  }
  else
  {
    __break(0xC471u);
  }
}

- (void)select
{
  DOMObjectInternal *internal;
  void *v4;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    WebCore::HTMLTextFormControlElement::select();
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
  }
  else
  {
    __break(0xC471u);
  }
}

- (void)setRangeText:(id)a3
{
  DOMObjectInternal *internal;
  StringImpl *v6;
  WTF::StringImpl *v7;
  void *v8;
  uint64_t v9;
  WTF::StringImpl *v10;
  char v11;
  uint64_t v12;
  char v13;
  _BYTE v14[88];
  uint64_t v15;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) == 0
    || *(_QWORD *)(*((_QWORD *)internal + 12) + 24) != *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    __break(0xC471u);
    JUMPOUT(0x1D80245F0);
  }
  MEMORY[0x1D82A3998](&v10, a3);
  WebCore::HTMLTextFormControlElement::setRangeText();
  if (v13)
  {
    v14[80] = v11;
    v9 = v12;
    v12 = 0;
    v15 = v9;
    raiseDOMErrorException();
  }
  v7 = v10;
  v10 = 0;
  if (!v7)
    goto LABEL_7;
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
LABEL_7:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v6);
    return;
  }
  WTF::StringImpl::destroy(v7, v6);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v8);
}

- (void)setRangeText:(id)a3 start:(unsigned int)a4 end:(unsigned int)a5 selectionMode:(id)a6
{
  DOMObjectInternal *internal;
  StringImpl *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  uint64_t v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  char v16;
  uint64_t v17;
  char v18;
  _BYTE v19[88];
  uint64_t v20;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v19);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) == 0
    || *(_QWORD *)(*((_QWORD *)internal + 12) + 24) != *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    __break(0xC471u);
    JUMPOUT(0x1D8024808);
  }
  MEMORY[0x1D82A3998](&v15, a3);
  MEMORY[0x1D82A3998](&v14, a6);
  WebCore::HTMLTextFormControlElement::setRangeText();
  if (v18)
  {
    v19[80] = v16;
    v13 = v17;
    v17 = 0;
    v20 = v13;
    raiseDOMErrorException();
  }
  v11 = v14;
  v14 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
    {
      WTF::StringImpl::destroy(v11, v10);
      v12 = v15;
      v15 = 0;
      if (!v12)
        goto LABEL_13;
      goto LABEL_10;
    }
    *(_DWORD *)v11 -= 2;
  }
  v12 = v15;
  v15 = 0;
  if (!v12)
    goto LABEL_13;
LABEL_10:
  if (*(_DWORD *)v12 == 2)
    WTF::StringImpl::destroy(v12, v10);
  else
    *(_DWORD *)v12 -= 2;
LABEL_13:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v19, v10);
}

- (void)setSelectionRange:(int)start end:(int)end
{
  DOMObjectInternal *internal;
  void *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    WebCore::HTMLTextFormControlElement::setSelectionRange();
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v6);
  }
  else
  {
    __break(0xC471u);
  }
}

- (BOOL)canShowPlaceholder
{
  void *v3;
  DOMObjectInternal *internal;
  _BOOL4 v5;
  BOOL result;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    v5 = (*((unsigned __int8 *)internal + 169) >> 4) & 1;
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
    return v5;
  }
  else
  {
    result = 96;
    __break(0xC471u);
  }
  return result;
}

- (void)setCanShowPlaceholder:(BOOL)a3
{
  DOMObjectInternal *internal;
  void *v5;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 14) & 0x10) != 0
    && *(_QWORD *)(*((_QWORD *)internal + 12) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD5D90] + 24))
  {
    WebCore::HTMLTextFormControlElement::setCanShowPlaceholder(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v5);
  }
  else
  {
    __break(0xC471u);
  }
}

- (int)structuralComplexityContribution
{
  return 0x7FFFFFFF;
}

- (id)startPosition
{
  WebCore::RenderTextControl *v3;
  WebCore::HTMLTextFormControlElement *v5;
  WebCore::Node *v6;
  id v7;
  WebCore::Node *v8;
  id result;
  WebCore::Node *v10;
  WebCore::Node *v11;
  int v12;
  char v13;
  char v14;
  WebCore::Node *v15;
  int v16;
  char v17;
  char v18;
  objc_super v19;

  v3 = (WebCore::RenderTextControl *)(*((_QWORD *)self->super.super.super.super._internal + 8) & 0xFFFFFFFFFFFFLL);
  if (!v3)
  {
    v19.receiver = self;
    v19.super_class = (Class)DOMHTMLTextAreaElement;
    return -[DOMNode startPosition](&v19, sel_startPosition);
  }
  if ((*((_BYTE *)v3 + 52) & 7) == 1 && (*((_BYTE *)v3 + 53) & 4) != 0)
  {
    v5 = (WebCore::HTMLTextFormControlElement *)WebCore::RenderTextControl::textFormControlElement(v3);
    WebCore::HTMLTextFormControlElement::visiblePositionForIndex(v5);
    v6 = v15;
    if (v15)
      *((_DWORD *)v15 + 6) += 2;
    v11 = v6;
    v12 = v16;
    v13 = v17;
    v14 = v18;
    v7 = +[WebVisiblePosition _wrapVisiblePosition:](WebVisiblePosition, "_wrapVisiblePosition:", &v11);
    v8 = v11;
    v11 = 0;
    if (v8)
    {
      if (*((_DWORD *)v8 + 6) == 2)
      {
        if ((*((_WORD *)v8 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v8);
      }
      else
      {
        *((_DWORD *)v8 + 6) -= 2;
      }
    }
    v10 = v15;
    v15 = 0;
    if (v10)
    {
      if (*((_DWORD *)v10 + 6) != 2)
      {
        *((_DWORD *)v10 + 6) -= 2;
        return v7;
      }
      if ((*((_WORD *)v10 + 15) & 0x400) == 0)
      {
        WebCore::Node::removedLastRef(v10);
        return v7;
      }
    }
    return v7;
  }
  result = (id)96;
  __break(0xC471u);
  return result;
}

- (id)endPosition
{
  WebCore::RenderTextControl *v2;
  WebCore::HTMLTextFormControlElement *v4;
  uint64_t v5;
  id v6;
  id result;
  StringImpl *v8;
  WTF::StringImpl *v9;
  WebCore::Node *v10;
  WebCore::Node *v11;
  WebCore::Node *v12;
  WebCore::Node *v13;
  int v14;
  char v15;
  char v16;
  WTF::StringImpl *v17;
  WebCore::Node *v18;
  int v19;
  char v20;
  char v21;
  objc_super v22;

  v2 = (WebCore::RenderTextControl *)(*((_QWORD *)self->super.super.super.super._internal + 8) & 0xFFFFFFFFFFFFLL);
  if (!v2)
  {
    v22.receiver = self;
    v22.super_class = (Class)DOMHTMLTextAreaElement;
    return -[DOMNode endPosition](&v22, sel_endPosition);
  }
  if ((*(_BYTE *)((*((_QWORD *)self->super.super.super.super._internal + 8) & 0xFFFFFFFFFFFFLL) + 0x34) & 7) == 1
    && (*(_BYTE *)((*((_QWORD *)self->super.super.super.super._internal + 8) & 0xFFFFFFFFFFFFLL) + 0x35) & 4) != 0)
  {
    v4 = (WebCore::HTMLTextFormControlElement *)WebCore::RenderTextControl::textFormControlElement((WebCore::RenderTextControl *)(*((_QWORD *)self->super.super.super.super._internal + 8) & 0xFFFFFFFFFFFFLL));
    v5 = WebCore::RenderTextControl::textFormControlElement(v2);
    (*(void (**)(WTF::StringImpl **__return_ptr))(*(_QWORD *)v5 + 1392))(&v17);
    WebCore::HTMLTextFormControlElement::visiblePositionForIndex(v4);
    v9 = v17;
    v17 = 0;
    if (v9)
    {
      if (*(_DWORD *)v9 == 2)
      {
        WTF::StringImpl::destroy(v9, v8);
        v10 = v18;
        if (!v18)
          goto LABEL_14;
        goto LABEL_13;
      }
      *(_DWORD *)v9 -= 2;
    }
    v10 = v18;
    if (!v18)
    {
LABEL_14:
      v13 = v10;
      v14 = v19;
      v15 = v20;
      v16 = v21;
      v6 = +[WebVisiblePosition _wrapVisiblePosition:](WebVisiblePosition, "_wrapVisiblePosition:", &v13);
      v11 = v13;
      v13 = 0;
      if (v11)
      {
        if (*((_DWORD *)v11 + 6) == 2)
        {
          if ((*((_WORD *)v11 + 15) & 0x400) == 0)
            WebCore::Node::removedLastRef(v11);
        }
        else
        {
          *((_DWORD *)v11 + 6) -= 2;
        }
      }
      v12 = v18;
      v18 = 0;
      if (v12)
      {
        if (*((_DWORD *)v12 + 6) != 2)
        {
          *((_DWORD *)v12 + 6) -= 2;
          return v6;
        }
        if ((*((_WORD *)v12 + 15) & 0x400) == 0)
        {
          WebCore::Node::removedLastRef(v12);
          return v6;
        }
      }
      return v6;
    }
LABEL_13:
    *((_DWORD *)v10 + 6) += 2;
    goto LABEL_14;
  }
  result = (id)96;
  __break(0xC471u);
  return result;
}

@end
