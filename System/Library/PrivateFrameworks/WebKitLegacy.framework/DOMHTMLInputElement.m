@implementation DOMHTMLInputElement

- (BOOL)_isTextField
{
  if (self)
    self = (DOMHTMLInputElement *)self->super.super.super.super._internal;
  return WebCore::HTMLInputElement::isTextField((WebCore::HTMLInputElement *)self);
}

- (BOOL)_isEdited
{
  if (self)
    self = (DOMHTMLInputElement *)self->super.super.super.super._internal;
  return WebCore::HTMLTextFormControlElement::lastChangeWasUserEdit((WebCore::HTMLTextFormControlElement *)self);
}

- (int)_autocapitalizeType
{
  char v2;

  if (self)
    self = (DOMHTMLInputElement *)self->super.super.super.super._internal;
  v2 = WebCore::HTMLFormControlElement::autocapitalizeType((WebCore::HTMLFormControlElement *)self);
  if (((v2 - 1) & 0xFC) != 0)
    return 0;
  else
    return (v2 - 1) + 1;
}

- (void)setValueWithChangeEvent:(id)a3
{
  StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  void *v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  char v10;
  _BYTE v11[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  MEMORY[0x1D82A3998](&v8, a3);
  WebCore::HTMLInputElement::setValue();
  if (v10)
  {
    v5 = v9;
    v9 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2)
      {
        WTF::StringImpl::destroy(v5, v4);
        v6 = v8;
        v8 = 0;
        if (!v6)
          goto LABEL_8;
        goto LABEL_6;
      }
      *(_DWORD *)v5 -= 2;
    }
  }
  v6 = v8;
  v8 = 0;
  if (!v6)
  {
LABEL_8:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v4);
    return;
  }
LABEL_6:
  if (*(_DWORD *)v6 != 2)
  {
    *(_DWORD *)v6 -= 2;
    goto LABEL_8;
  }
  WTF::StringImpl::destroy(v6, v4);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v7);
}

- (void)setValueAsNumberWithChangeEvent:(double)a3
{
  StringImpl *v3;
  WTF::StringImpl *v4;
  char v5;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  WebCore::HTMLInputElement::setValueAsNumber();
  if (v5 && v4)
  {
    if (*(_DWORD *)v4 == 2)
      WTF::StringImpl::destroy(v4, v3);
    else
      *(_DWORD *)v4 -= 2;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
}

- (NSString)accept
{
  void *v2;
  const __CFString *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(_QWORD *)WebCore::Element::getAttribute())
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v3 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return &v3->isa;
}

- (void)setAccept:(NSString *)accept
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)accept, v4);
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

- (NSString)alt
{
  void *v2;
  const __CFString *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(_QWORD *)WebCore::Element::getAttribute())
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v3 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return &v3->isa;
}

- (void)setAlt:(NSString *)alt
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)alt, v4);
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

- (id)autocomplete
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::HTMLFormControlElement::autocomplete(self->super.super.super.super._internal);
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
  return (id)v4;
}

- (void)setAutocomplete:(id)a3
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, v4);
  v7 = v9;
  WebCore::HTMLFormControlElement::setAutocomplete();
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

- (BOOL)defaultChecked
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
  v8 = *MEMORY[0x1E0DD5D10];
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

- (void)setDefaultChecked:(BOOL)defaultChecked
{
  void *v3;
  _BYTE v4[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::Element::setBooleanAttribute();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (BOOL)checked
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOWORD(self) = *((_WORD *)self->super.super.super.super._internal + 115) & 1;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (void)setChecked:(BOOL)checked
{
  void *v3;
  _BYTE v4[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::HTMLInputElement::setChecked();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (id)dirName
{
  void *v2;
  const __CFString *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(_QWORD *)WebCore::Element::getAttribute())
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v3 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return (id)v3;
}

- (void)setDirName:(id)a3
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, v4);
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

- (DOMFileList)files
{
  DOMObjectInternal *v3;
  DOMFileList *v4;
  void *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (DOMObjectInternal *)WebCore::HTMLInputElement::files(self->super.super.super.super._internal);
  v4 = (DOMFileList *)kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (void)setFiles:(DOMFileList *)files
{
  DOMObjectInternal *internal;
  void *v5;
  uint64_t v6;
  _DWORD **v7;
  uint64_t v8;
  _DWORD *v9;
  WTF *v10;
  DOMObjectInternal *v11;
  _BYTE v12[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  if (files)
  {
    internal = files->super._internal;
    if (internal)
      ++*((_DWORD *)internal + 2);
  }
  else
  {
    internal = 0;
  }
  v11 = internal;
  WebCore::HTMLInputElement::setFiles();
  if (v11)
  {
    if (*((_DWORD *)v11 + 2) == 1)
    {
      v6 = *((unsigned int *)v11 + 7);
      if ((_DWORD)v6)
      {
        v7 = (_DWORD **)*((_QWORD *)v11 + 2);
        v8 = 8 * v6;
        do
        {
          v9 = *v7;
          *v7 = 0;
          if (v9)
          {
            if (v9[4] == 1)
              (*(void (**)(_DWORD *))(*(_QWORD *)v9 + 8))(v9);
            else
              --v9[4];
          }
          ++v7;
          v8 -= 8;
        }
        while (v8);
      }
      v10 = (WTF *)*((_QWORD *)v11 + 2);
      if (v10)
      {
        *((_QWORD *)v11 + 2) = 0;
        *((_DWORD *)v11 + 6) = 0;
        WTF::fastFree(v10, v5);
      }
      if (*(_QWORD *)v11)
      {
        *(_QWORD *)(*(_QWORD *)v11 + 8) = 3;
        *(_QWORD *)v11 = 0;
      }
      MEMORY[0x1D82A6E48](v11);
    }
    else
    {
      --*((_DWORD *)v11 + 2);
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v5);
}

- (id)formAction
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::HTMLFormControlElement::formAction(self->super.super.super.super._internal);
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
  return (id)v4;
}

- (void)setFormAction:(id)a3
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, v4);
  v7 = v9;
  WebCore::HTMLFormControlElement::setFormAction();
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

- (id)formEnctype
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::HTMLFormControlElement::formEnctype(self->super.super.super.super._internal);
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
  return (id)v4;
}

- (void)setFormEnctype:(id)a3
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, v4);
  v7 = v9;
  WebCore::HTMLFormControlElement::setFormEnctype();
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

- (id)formMethod
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::HTMLFormControlElement::formMethod(self->super.super.super.super._internal);
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
  return (id)v4;
}

- (void)setFormMethod:(id)a3
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, v4);
  v7 = v9;
  WebCore::HTMLFormControlElement::setFormMethod();
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

- (BOOL)formNoValidate
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
  v8 = *MEMORY[0x1E0DD5ED0];
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

- (void)setFormNoValidate:(BOOL)a3
{
  void *v3;
  _BYTE v4[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::Element::setBooleanAttribute();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (id)formTarget
{
  void *v2;
  const __CFString *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(_QWORD *)WebCore::Element::getAttribute())
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v3 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return (id)v3;
}

- (void)setFormTarget:(id)a3
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, v4);
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

- (unsigned)height
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = WebCore::HTMLInputElement::height(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (void)setHeight:(unsigned int)a3
{
  void *v4;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLInputElement::setHeight(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (BOOL)indeterminate
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = (*((unsigned __int16 *)self->super.super.super.super._internal + 115) >> 3) & 1;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (void)setIndeterminate:(BOOL)indeterminate
{
  void *v4;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLInputElement::setIndeterminate(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (id)list
{
  void *v3;
  WebCore::Node *v4;
  WebCore::Node *v5;
  WebCore::Node *v7;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  MEMORY[0x1D82A7FDC](&v7, self->super.super.super.super._internal);
  v4 = kit(v7);
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*((_DWORD *)v5 + 6) == 2)
    {
      if ((*((_WORD *)v5 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v5);
    }
    else
    {
      *((_DWORD *)v5 + 6) -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return v4;
}

- (id)max
{
  void *v2;
  const __CFString *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(_QWORD *)WebCore::Element::getAttribute())
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v3 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return (id)v3;
}

- (void)setMax:(id)a3
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, v4);
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

- (int)maxLength
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super.super.super.super._internal + 43);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (void)setMaxLength:(int)maxLength
{
  void *v4;
  char v5;
  uint64_t v6;
  char v7;
  _BYTE v8[88];
  uint64_t v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLTextFormControlElement::setMaxLength(self->super.super.super.super._internal);
  if (v7)
  {
    v8[80] = v5;
    v9 = v6;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
}

- (id)min
{
  void *v2;
  const __CFString *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(_QWORD *)WebCore::Element::getAttribute())
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v3 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return (id)v3;
}

- (void)setMin:(id)a3
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, v4);
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

- (BOOL)multiple
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
  v8 = *MEMORY[0x1E0DD5DE8];
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

- (id)pattern
{
  void *v2;
  const __CFString *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(_QWORD *)WebCore::Element::getAttribute())
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v3 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return (id)v3;
}

- (void)setPattern:(id)a3
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, v4);
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

- (id)placeholder
{
  void *v2;
  const __CFString *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(_QWORD *)WebCore::Element::getAttribute())
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v3 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return (id)v3;
}

- (void)setPlaceholder:(id)a3
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, v4);
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

- (BOOL)readOnly
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
  v8 = *MEMORY[0x1E0DD5DF8];
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

- (void)setReadOnly:(BOOL)readOnly
{
  void *v3;
  _BYTE v4[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::Element::setBooleanAttribute();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (BOOL)required
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
  v8 = *MEMORY[0x1E0DD5E00];
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

- (void)setRequired:(BOOL)a3
{
  void *v3;
  _BYTE v4[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::Element::setBooleanAttribute();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (NSString)size
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WTF::String::number((WTF::String *)*((unsigned int *)self->super.super.super.super._internal + 56));
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

- (void)setSize:(NSString *)size
{
  DOMObjectInternal *internal;
  StringImpl *v6;
  void *v7;
  WTF::StringImpl *v8;
  char v9;
  _BYTE v10[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super.super.super._internal;
  -[NSString intValue](size, "intValue");
  WebCore::HTMLInputElement::setSize(internal);
  if (!v9 || !v8)
    goto LABEL_5;
  if (*(_DWORD *)v8 != 2)
  {
    *(_DWORD *)v8 -= 2;
LABEL_5:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v6);
    return;
  }
  WTF::StringImpl::destroy(v8, v6);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v7);
}

- (NSString)src
{
  StringImpl *v2;
  const __CFString *v3;
  WTF::StringImpl *v5;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  WebCore::Element::getURLAttribute();
  if (v5)
  {
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v2);
    else
      *(_DWORD *)v5 -= 2;
  }
  else
  {
    v3 = &stru_1E9D6EC48;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v2);
  return &v3->isa;
}

- (void)setSrc:(NSString *)src
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)src, v4);
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

- (id)step
{
  void *v2;
  const __CFString *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(_QWORD *)WebCore::Element::getAttribute())
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v3 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return (id)v3;
}

- (void)setStep:(id)a3
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, v4);
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

- (void)setType:(NSString *)type
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)type, v4);
  v7 = v9;
  WebCore::HTMLInputElement::setType();
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

- (NSString)defaultValue
{
  void *v3;
  const __CFString *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(_QWORD *)WebCore::HTMLInputElement::defaultValue(self->super.super.super.super._internal))
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v4 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (void)setDefaultValue:(NSString *)defaultValue
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)defaultValue, v4);
  v7 = v9;
  WebCore::HTMLInputElement::setDefaultValue();
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

- (NSString)value
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::HTMLInputElement::value(self->super.super.super.super._internal);
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
  StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  void *v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  char v10;
  _BYTE v11[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  MEMORY[0x1D82A3998](&v8, value);
  WebCore::HTMLInputElement::setValue();
  if (v10)
  {
    v5 = v9;
    v9 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2)
      {
        WTF::StringImpl::destroy(v5, v4);
        v6 = v8;
        v8 = 0;
        if (!v6)
          goto LABEL_8;
        goto LABEL_6;
      }
      *(_DWORD *)v5 -= 2;
    }
  }
  v6 = v8;
  v8 = 0;
  if (!v6)
  {
LABEL_8:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v4);
    return;
  }
LABEL_6:
  if (*(_DWORD *)v6 != 2)
  {
    *(_DWORD *)v6 -= 2;
    goto LABEL_8;
  }
  WTF::StringImpl::destroy(v6, v4);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v7);
}

- (double)valueAsDate
{
  double v3;
  double v4;
  void *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::HTMLInputElement::valueAsDate(self->super.super.super.super._internal);
  v4 = v3 + -978307200.0;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (void)setValueAsDate:(double)a3
{
  void *v3;
  char v4;
  uint64_t v5;
  char v6;
  _BYTE v7[88];
  uint64_t v8;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::HTMLInputElement::setValueAsDate();
  if (v6)
  {
    v7[80] = v4;
    v8 = v5;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
}

- (double)valueAsNumber
{
  double v3;
  double v4;
  void *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::HTMLInputElement::valueAsNumber(self->super.super.super.super._internal);
  v4 = v3;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (void)setValueAsNumber:(double)a3
{
  void *v3;
  char v4;
  uint64_t v5;
  char v6;
  _BYTE v7[88];
  uint64_t v8;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::HTMLInputElement::setValueAsNumber();
  if (v6)
  {
    v7[80] = v4;
    v8 = v5;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
}

- (unsigned)width
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = WebCore::HTMLInputElement::width(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (void)setWidth:(unsigned int)a3
{
  void *v4;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLInputElement::setWidth(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (BOOL)willValidate
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = WebCore::ValidatedFormListedElement::willValidate((WebCore::ValidatedFormListedElement *)((char *)self->super.super.super.super._internal + 112));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (id)validationMessage
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::HTMLInputElement::validationMessage(self->super.super.super.super._internal);
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
  return (id)v4;
}

- (id)labels
{
  void *v3;
  DOMObjectInternal *v4;
  DOMObjectInternal *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::HTMLElement::labels(self->super.super.super.super._internal);
  v4 = kit(v6);
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

- (int)selectionStart
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = WebCore::HTMLTextFormControlElement::selectionStart(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (void)setSelectionStart:(int)selectionStart
{
  void *v4;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLTextFormControlElement::setSelectionStart(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (int)selectionEnd
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = WebCore::HTMLTextFormControlElement::selectionEnd(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (void)setSelectionEnd:(int)selectionEnd
{
  void *v4;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLTextFormControlElement::setSelectionEnd(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (id)selectionDirection
{
  void *v3;
  const __CFString *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(_QWORD *)WebCore::HTMLTextFormControlElement::selectionDirection(self->super.super.super.super._internal))
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v4 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return (id)v4;
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
  MEMORY[0x1D82A3998](&v9, a3);
  WebCore::HTMLTextFormControlElement::setSelectionDirection(internal, (const WTF::String *)&v9);
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

- (NSString)align
{
  void *v2;
  const __CFString *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(_QWORD *)WebCore::Element::getAttribute())
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v3 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return &v3->isa;
}

- (void)setAlign:(NSString *)align
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)align, v4);
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

- (NSString)useMap
{
  void *v2;
  const __CFString *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(_QWORD *)WebCore::Element::getAttribute())
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v3 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return &v3->isa;
}

- (void)setUseMap:(NSString *)useMap
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)useMap, v4);
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

- (BOOL)incremental
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
  v8 = *MEMORY[0x1E0DD5EA0];
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

- (void)setIncremental:(BOOL)a3
{
  void *v3;
  _BYTE v4[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::Element::setBooleanAttribute();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (NSString)accessKey
{
  void *v2;
  const __CFString *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(_QWORD *)WebCore::Element::getAttribute())
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v3 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return &v3->isa;
}

- (void)setAccessKey:(NSString *)accessKey
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)accessKey, v4);
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

- (NSString)altDisplayString
{
  const Node *v3;
  StringImpl *v4;
  const __CFString *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  _BYTE v11[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  WebCore::HTMLInputElement::alt(self->super.super.super.super._internal);
  WebCore::displayString((WebCore *)&v9, self->super.super.super.super._internal, v3);
  if (!v10)
  {
    v10 = 0;
    v5 = &stru_1E9D6EC48;
LABEL_7:
    v7 = v9;
    v9 = 0;
    if (!v7)
      goto LABEL_11;
    goto LABEL_8;
  }
  v5 = (const __CFString *)WTF::StringImpl::operator NSString *();
  v6 = v10;
  v10 = 0;
  if (!v6)
    goto LABEL_7;
  if (*(_DWORD *)v6 == 2)
  {
    WTF::StringImpl::destroy(v6, v4);
    v7 = v9;
    v9 = 0;
    if (!v7)
      goto LABEL_11;
  }
  else
  {
    *(_DWORD *)v6 -= 2;
    v7 = v9;
    v9 = 0;
    if (!v7)
      goto LABEL_11;
  }
LABEL_8:
  if (*(_DWORD *)v7 == 2)
    WTF::StringImpl::destroy(v7, v4);
  else
    *(_DWORD *)v7 -= 2;
LABEL_11:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v4);
  return &v5->isa;
}

- (NSURL)absoluteImageURL
{
  void *v3;
  uint64_t v4;
  NSURL *v5;
  NSURL *result;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v4 = *((_QWORD *)self->super.super.super.super._internal + 8);
  if ((v4 & 0xFFFFFFFFFFFFLL) == 0)
    goto LABEL_5;
  if ((*(_BYTE *)((v4 & 0xFFFFFFFFFFFFLL) + 0x2D) & 2) == 0)
  {
    if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)(v4 & 0xFFFFFFFFFFFFLL) + 152))(v4 & 0xFFFFFFFFFFFFLL) & 1) != 0)
    {
      v5 = -[DOMElement _getURLAttribute:](self, "_getURLAttribute:", CFSTR("src"));
LABEL_6:
      WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
      return v5;
    }
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  result = (NSURL *)105;
  __break(0xC471u);
  return result;
}

- (BOOL)capture
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
  v8 = *MEMORY[0x1E0DD5CF8];
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

- (void)setCapture:(BOOL)a3
{
  void *v3;
  _BYTE v4[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::Element::setBooleanAttribute();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (void)stepUp:(int)a3
{
  void *v4;
  char v5;
  uint64_t v6;
  char v7;
  _BYTE v8[88];
  uint64_t v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLInputElement::stepUp(self->super.super.super.super._internal);
  if (v7)
  {
    v8[80] = v5;
    v9 = v6;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
}

- (void)stepDown:(int)a3
{
  void *v4;
  char v5;
  uint64_t v6;
  char v7;
  _BYTE v8[88];
  uint64_t v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLInputElement::stepDown(self->super.super.super.super._internal);
  if (v7)
  {
    v8[80] = v5;
    v9 = v6;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
}

- (BOOL)checkValidity
{
  char v2;
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  v2 = WebCore::ValidatedFormListedElement::checkValidity();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return v2;
}

- (void)setCustomValidity:(id)a3
{
  DOMObjectInternal *internal;
  StringImpl *v6;
  WTF::StringImpl *v7;
  void *v8;
  WTF::StringImpl *v9;
  _BYTE v10[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super.super.super._internal;
  MEMORY[0x1D82A3998](&v9, a3);
  WebCore::ValidatedFormListedElement::setCustomValidity((DOMObjectInternal *)((char *)internal + 112), (const WTF::String *)&v9);
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

- (void)select
{
  void *v2;
  _BYTE v3[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v3);
  WebCore::HTMLTextFormControlElement::select();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v3, v2);
}

- (void)setRangeText:(id)a3
{
  StringImpl *v4;
  WTF::StringImpl *v5;
  void *v6;
  uint64_t v7;
  WTF::StringImpl *v8;
  char v9;
  uint64_t v10;
  char v11;
  _BYTE v12[88];
  uint64_t v13;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  MEMORY[0x1D82A3998](&v8, a3);
  WebCore::HTMLTextFormControlElement::setRangeText();
  if (v11)
  {
    v12[80] = v9;
    v7 = v10;
    v10 = 0;
    v13 = v7;
    raiseDOMErrorException();
  }
  v5 = v8;
  v8 = 0;
  if (!v5)
    goto LABEL_5;
  if (*(_DWORD *)v5 != 2)
  {
    *(_DWORD *)v5 -= 2;
LABEL_5:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v4);
    return;
  }
  WTF::StringImpl::destroy(v5, v4);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v6);
}

- (void)setRangeText:(id)a3 start:(unsigned int)a4 end:(unsigned int)a5 selectionMode:(id)a6
{
  StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  uint64_t v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  char v14;
  uint64_t v15;
  char v16;
  _BYTE v17[88];
  uint64_t v18;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17);
  MEMORY[0x1D82A3998](&v13, a3);
  MEMORY[0x1D82A3998](&v12, a6);
  WebCore::HTMLInputElement::setRangeText();
  if (v16)
  {
    v17[80] = v14;
    v11 = v15;
    v15 = 0;
    v18 = v11;
    raiseDOMErrorException();
  }
  v9 = v12;
  v12 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
    {
      WTF::StringImpl::destroy(v9, v8);
      v10 = v13;
      v13 = 0;
      if (!v10)
        goto LABEL_11;
      goto LABEL_8;
    }
    *(_DWORD *)v9 -= 2;
  }
  v10 = v13;
  v13 = 0;
  if (!v10)
    goto LABEL_11;
LABEL_8:
  if (*(_DWORD *)v10 == 2)
    WTF::StringImpl::destroy(v10, v8);
  else
    *(_DWORD *)v10 -= 2;
LABEL_11:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17, v8);
}

- (void)setSelectionRange:(int)start end:(int)end
{
  void *v4;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLTextFormControlElement::setSelectionRange();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (void)click
{
  void *v3;
  _BYTE v4[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::HTMLElement::click(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (void)setValueForUser:(id)a3
{
  StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  void *v7;
  WTF::StringImpl *v8;
  _BYTE v9[80];
  WTF::StringImpl *v10;
  char v11;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  MEMORY[0x1D82A3998](&v8, a3);
  WebCore::HTMLInputElement::setValue();
  if (v11)
  {
    v5 = v10;
    v10 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2)
      {
        WTF::StringImpl::destroy(v5, v4);
        v6 = v8;
        v8 = 0;
        if (!v6)
          goto LABEL_8;
        goto LABEL_6;
      }
      *(_DWORD *)v5 -= 2;
    }
  }
  v6 = v8;
  v8 = 0;
  if (!v6)
  {
LABEL_8:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v4);
    return;
  }
LABEL_6:
  if (*(_DWORD *)v6 != 2)
  {
    *(_DWORD *)v6 -= 2;
    goto LABEL_8;
  }
  WTF::StringImpl::destroy(v6, v4);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v7);
}

- (id)_autofillContext
{
  DOMObjectInternal *internal;
  void *v4;
  uint64_t v5;
  void *v6;
  WebCore::Node *v8;
  WebCore::Node *v9;
  WebCore::Node *v10;
  WebCore::Node *v11;
  char v12;
  _BYTE v13[80];
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  internal = self->super.super.super.super._internal;
  *((_DWORD *)internal + 6) += 2;
  v8 = internal;
  WebCore::AutofillElements::computeAutofillElements();
  if (v12)
  {
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
    if (v10)
    {
      if (*((_DWORD *)v10 + 6) == 2)
      {
        if ((*((_WORD *)v10 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v10);
      }
      else
      {
        *((_DWORD *)v10 + 6) -= 2;
      }
    }
    if (v9)
    {
      if (*((_DWORD *)v9 + 6) == 2)
      {
        if ((*((_WORD *)v9 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v9);
      }
      else
      {
        *((_DWORD *)v9 + 6) -= 2;
      }
    }
  }
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
  if (v12
    && (v5 = objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", -[DOMDocument URL](-[DOMNode ownerDocument](self, "ownerDocument", 0), "URL"))) != 0)
  {
    v14 = CFSTR("_WebViewURL");
    v15[0] = v5;
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  }
  else
  {
    v6 = 0;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v4);
  return v6;
}

- (void)insertTextSuggestion:(id)a3
{
  StringImpl *v5;
  DOMObjectInternal *internal;
  WebCore::Node *v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  WebCore::Node *v10;
  WebCore::Node *v11;
  WebCore::Node *v12;
  void *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  WebCore::Node *v16;
  WebCore::Node *v17;
  WebCore::Node *v18;
  WebCore::Node *v19;
  char v20;
  _BYTE v21[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v21);
  internal = self->super.super.super.super._internal;
  if (!internal)
    goto LABEL_16;
  *((_DWORD *)internal + 6) += 2;
  v16 = internal;
  WebCore::AutofillElements::computeAutofillElements();
  v7 = v16;
  v16 = 0;
  if (*((_DWORD *)v7 + 6) == 2)
  {
    if ((*((_WORD *)v7 + 15) & 0x400) == 0)
      WebCore::Node::removedLastRef(v7);
  }
  else
  {
    *((_DWORD *)v7 + 6) -= 2;
  }
  if (!v20)
    goto LABEL_16;
  MEMORY[0x1D82A3998](&v15, objc_msgSend(a3, "username"));
  MEMORY[0x1D82A3998](&v14, objc_msgSend(a3, "password"));
  WebCore::AutofillElements::autofill();
  v8 = v14;
  v14 = 0;
  if (!v8)
  {
LABEL_10:
    v9 = v15;
    v15 = 0;
    if (!v9)
      goto LABEL_15;
    goto LABEL_13;
  }
  if (*(_DWORD *)v8 != 2)
  {
    *(_DWORD *)v8 -= 2;
    goto LABEL_10;
  }
  WTF::StringImpl::destroy(v8, v5);
  v9 = v15;
  v15 = 0;
  if (!v9)
    goto LABEL_15;
LABEL_13:
  if (*(_DWORD *)v9 == 2)
  {
    WTF::StringImpl::destroy(v9, v5);
    if (!v20)
      goto LABEL_16;
    goto LABEL_18;
  }
  *(_DWORD *)v9 -= 2;
LABEL_15:
  if (!v20)
  {
LABEL_16:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v21, v5);
    return;
  }
LABEL_18:
  v10 = v19;
  v19 = 0;
  if (v10)
  {
    if (*((_DWORD *)v10 + 6) == 2)
    {
      if ((*((_WORD *)v10 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v10);
    }
    else
    {
      *((_DWORD *)v10 + 6) -= 2;
    }
  }
  v11 = v18;
  v18 = 0;
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
  v12 = v17;
  v17 = 0;
  if (!v12)
    goto LABEL_16;
  if (*((_DWORD *)v12 + 6) == 2)
  {
    if ((*((_WORD *)v12 + 15) & 0x400) != 0)
      goto LABEL_16;
    WebCore::Node::removedLastRef(v12);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v21, v13);
  }
  else
  {
    *((_DWORD *)v12 + 6) -= 2;
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v21, v5);
  }
}

- (BOOL)canShowPlaceholder
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = (*((unsigned __int8 *)self->super.super.super.super._internal + 169) >> 4) & 1;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (void)setCanShowPlaceholder:(BOOL)a3
{
  void *v4;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLTextFormControlElement::setCanShowPlaceholder(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (int)structuralComplexityContribution
{
  return 0x7FFFFFFF;
}

- (BOOL)_isAutofilled
{
  uint64_t v2;
  int v3;

  v2 = core((uint64_t)self);
  if (!v2
    || (*(_WORD *)(v2 + 28) & 0x10) != 0
    && *(_QWORD *)(*(_QWORD *)(v2 + 96) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD60B8] + 24))
  {
    return HIBYTE(*(unsigned __int16 *)(v2 + 230)) & 1;
  }
  else
  {
    LOBYTE(v3) = 105;
    __break(0xC471u);
  }
  return v3;
}

- (BOOL)_isAutoFilledAndViewable
{
  uint64_t v2;
  int v3;

  v2 = core((uint64_t)self);
  if (!v2
    || (*(_WORD *)(v2 + 28) & 0x10) != 0
    && *(_QWORD *)(*(_QWORD *)(v2 + 96) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD60B8] + 24))
  {
    return (*(unsigned __int16 *)(v2 + 230) >> 9) & 1;
  }
  else
  {
    LOBYTE(v3) = 105;
    __break(0xC471u);
  }
  return v3;
}

- (void)_setAutofilled:(BOOL)a3
{
  uint64_t v3;

  v3 = core((uint64_t)self);
  if (!v3
    || (*(_WORD *)(v3 + 28) & 0x10) != 0
    && *(_QWORD *)(*(_QWORD *)(v3 + 96) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD60B8] + 24))
  {
    WebCore::HTMLInputElement::setAutoFilled((WebCore::HTMLInputElement *)v3);
  }
  else
  {
    __break(0xC471u);
  }
}

- (void)_setAutoFilledAndViewable:(BOOL)a3
{
  uint64_t v3;

  v3 = core((uint64_t)self);
  if (!v3
    || (*(_WORD *)(v3 + 28) & 0x10) != 0
    && *(_QWORD *)(*(_QWORD *)(v3 + 96) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD60B8] + 24))
  {
    WebCore::HTMLInputElement::setAutoFilledAndViewable((WebCore::HTMLInputElement *)v3);
  }
  else
  {
    __break(0xC471u);
  }
}

- (id)startPosition
{
  BOOL v2;
  id v3;
  WebCore::HTMLTextFormControlElement *v5;
  WebCore::Node *v6;
  WebCore::Node *v7;
  WebCore::Node *v8;
  WebCore::Node *v9;
  int v10;
  char v11;
  char v12;
  WebCore::Node *v13;
  int v14;
  char v15;
  char v16;
  objc_super v17;

  if ((*((_QWORD *)self->super.super.super.super._internal + 8) & 0xFFFFFFFFFFFFLL) == 0
    || ((*(_BYTE *)((*((_QWORD *)self->super.super.super.super._internal + 8) & 0xFFFFFFFFFFFFLL) + 0x34) & 7) == 1
      ? (v2 = (*(_BYTE *)((*((_QWORD *)self->super.super.super.super._internal + 8) & 0xFFFFFFFFFFFFLL) + 0x35) & 4) == 0)
      : (v2 = 1),
        v2))
  {
    v17.receiver = self;
    v17.super_class = (Class)DOMHTMLInputElement;
    return -[DOMNode startPosition](&v17, sel_startPosition);
  }
  v5 = (WebCore::HTMLTextFormControlElement *)WebCore::RenderTextControl::textFormControlElement((WebCore::RenderTextControl *)(*((_QWORD *)self->super.super.super.super._internal + 8) & 0xFFFFFFFFFFFFLL));
  WebCore::HTMLTextFormControlElement::visiblePositionForIndex(v5);
  v6 = v13;
  if (v13)
    *((_DWORD *)v13 + 6) += 2;
  v9 = v6;
  v10 = v14;
  v11 = v15;
  v12 = v16;
  v3 = +[WebVisiblePosition _wrapVisiblePosition:](WebVisiblePosition, "_wrapVisiblePosition:", &v9);
  v7 = v9;
  v9 = 0;
  if (v7)
  {
    if (*((_DWORD *)v7 + 6) == 2)
    {
      if ((*((_WORD *)v7 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v7);
    }
    else
    {
      *((_DWORD *)v7 + 6) -= 2;
    }
  }
  v8 = v13;
  v13 = 0;
  if (!v8)
    return v3;
  if (*((_DWORD *)v8 + 6) != 2)
  {
    *((_DWORD *)v8 + 6) -= 2;
    return v3;
  }
  if ((*((_WORD *)v8 + 15) & 0x400) != 0)
    return v3;
  WebCore::Node::removedLastRef(v8);
  return v3;
}

- (id)endPosition
{
  WebCore::RenderTextControl *v2;
  BOOL v3;
  id v4;
  WebCore::HTMLTextFormControlElement *v6;
  uint64_t v7;
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
  if (!v2
    || ((*(_BYTE *)((*((_QWORD *)self->super.super.super.super._internal + 8) & 0xFFFFFFFFFFFFLL) + 0x34) & 7) == 1
      ? (v3 = (*(_BYTE *)((*((_QWORD *)self->super.super.super.super._internal + 8) & 0xFFFFFFFFFFFFLL) + 0x35) & 4) == 0)
      : (v3 = 1),
        v3))
  {
    v22.receiver = self;
    v22.super_class = (Class)DOMHTMLInputElement;
    return -[DOMNode endPosition](&v22, sel_endPosition);
  }
  v6 = (WebCore::HTMLTextFormControlElement *)WebCore::RenderTextControl::textFormControlElement((WebCore::RenderTextControl *)(*((_QWORD *)self->super.super.super.super._internal + 8) & 0xFFFFFFFFFFFFLL));
  v7 = WebCore::RenderTextControl::textFormControlElement(v2);
  (*(void (**)(WTF::StringImpl **__return_ptr))(*(_QWORD *)v7 + 1392))(&v17);
  WebCore::HTMLTextFormControlElement::visiblePositionForIndex(v6);
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
  if (v18)
LABEL_13:
    *((_DWORD *)v10 + 6) += 2;
LABEL_14:
  v13 = v10;
  v14 = v19;
  v15 = v20;
  v16 = v21;
  v4 = +[WebVisiblePosition _wrapVisiblePosition:](WebVisiblePosition, "_wrapVisiblePosition:", &v13);
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
  if (!v12)
    return v4;
  if (*((_DWORD *)v12 + 6) != 2)
  {
    *((_DWORD *)v12 + 6) -= 2;
    return v4;
  }
  if ((*((_WORD *)v12 + 15) & 0x400) != 0)
    return v4;
  WebCore::Node::removedLastRef(v12);
  return v4;
}

@end
