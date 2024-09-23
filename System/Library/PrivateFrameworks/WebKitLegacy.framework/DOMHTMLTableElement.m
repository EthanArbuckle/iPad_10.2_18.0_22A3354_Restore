@implementation DOMHTMLTableElement

- (DOMHTMLTableCaptionElement)caption
{
  void *v3;
  DOMHTMLTableCaptionElement *v4;
  WebCore::Node *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::HTMLTableElement::caption(self->super.super.super.super._internal);
  v4 = (DOMHTMLTableCaptionElement *)kit(v6);
  if (v6)
  {
    if (*((_DWORD *)v6 + 6) == 2)
    {
      if ((*((_WORD *)v6 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v6);
    }
    else
    {
      *((_DWORD *)v6 + 6) -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return v4;
}

- (void)setCaption:(DOMHTMLTableCaptionElement *)caption
{
  DOMObjectInternal *internal;
  void *v5;
  void *v6;
  WebCore::Node *v7;
  char v8;
  uint64_t v9;
  char v10;
  _BYTE v11[88];
  uint64_t v12;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  if (caption)
  {
    internal = caption->super.super.super.super._internal;
    if (internal)
      *((_DWORD *)internal + 6) += 2;
  }
  else
  {
    internal = 0;
  }
  v7 = internal;
  WebCore::HTMLTableElement::setCaption();
  if (v10)
  {
    v11[80] = v8;
    v12 = v9;
    raiseDOMErrorException();
  }
  if (!v7)
    goto LABEL_9;
  if (*((_DWORD *)v7 + 6) != 2)
  {
    *((_DWORD *)v7 + 6) -= 2;
LABEL_9:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v5);
    return;
  }
  if ((*((_WORD *)v7 + 15) & 0x400) != 0)
    goto LABEL_9;
  WebCore::Node::removedLastRef(v7);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v6);
}

- (DOMHTMLTableSectionElement)tHead
{
  void *v3;
  DOMHTMLTableSectionElement *v4;
  WebCore::Node *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::HTMLTableElement::tHead(self->super.super.super.super._internal);
  v4 = (DOMHTMLTableSectionElement *)kit(v6);
  if (v6)
  {
    if (*((_DWORD *)v6 + 6) == 2)
    {
      if ((*((_WORD *)v6 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v6);
    }
    else
    {
      *((_DWORD *)v6 + 6) -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return v4;
}

- (void)setTHead:(DOMHTMLTableSectionElement *)tHead
{
  DOMObjectInternal *internal;
  void *v5;
  void *v6;
  WebCore::Node *v7;
  char v8;
  uint64_t v9;
  char v10;
  _BYTE v11[88];
  uint64_t v12;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  if (tHead)
  {
    internal = tHead->super.super.super.super._internal;
    if (internal)
      *((_DWORD *)internal + 6) += 2;
  }
  else
  {
    internal = 0;
  }
  v7 = internal;
  WebCore::HTMLTableElement::setTHead();
  if (v10)
  {
    v11[80] = v8;
    v12 = v9;
    raiseDOMErrorException();
  }
  if (!v7)
    goto LABEL_9;
  if (*((_DWORD *)v7 + 6) != 2)
  {
    *((_DWORD *)v7 + 6) -= 2;
LABEL_9:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v5);
    return;
  }
  if ((*((_WORD *)v7 + 15) & 0x400) != 0)
    goto LABEL_9;
  WebCore::Node::removedLastRef(v7);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v6);
}

- (DOMHTMLTableSectionElement)tFoot
{
  void *v3;
  DOMHTMLTableSectionElement *v4;
  WebCore::Node *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::HTMLTableElement::tFoot(self->super.super.super.super._internal);
  v4 = (DOMHTMLTableSectionElement *)kit(v6);
  if (v6)
  {
    if (*((_DWORD *)v6 + 6) == 2)
    {
      if ((*((_WORD *)v6 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v6);
    }
    else
    {
      *((_DWORD *)v6 + 6) -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return v4;
}

- (void)setTFoot:(DOMHTMLTableSectionElement *)tFoot
{
  DOMObjectInternal *internal;
  void *v5;
  void *v6;
  WebCore::Node *v7;
  char v8;
  uint64_t v9;
  char v10;
  _BYTE v11[88];
  uint64_t v12;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  if (tFoot)
  {
    internal = tFoot->super.super.super.super._internal;
    if (internal)
      *((_DWORD *)internal + 6) += 2;
  }
  else
  {
    internal = 0;
  }
  v7 = internal;
  WebCore::HTMLTableElement::setTFoot();
  if (v10)
  {
    v11[80] = v8;
    v12 = v9;
    raiseDOMErrorException();
  }
  if (!v7)
    goto LABEL_9;
  if (*((_DWORD *)v7 + 6) != 2)
  {
    *((_DWORD *)v7 + 6) -= 2;
LABEL_9:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v5);
    return;
  }
  if ((*((_WORD *)v7 + 15) & 0x400) != 0)
    goto LABEL_9;
  WebCore::Node::removedLastRef(v7);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v6);
}

- (DOMHTMLCollection)rows
{
  void *v3;
  DOMHTMLCollection *v4;
  DOMObjectInternal *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::HTMLTableElement::rows(self->super.super.super.super._internal);
  v4 = (DOMHTMLCollection *)kit(v6);
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

- (DOMHTMLCollection)tBodies
{
  void *v3;
  DOMHTMLCollection *v4;
  DOMObjectInternal *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::HTMLTableElement::tBodies(self->super.super.super.super._internal);
  v4 = (DOMHTMLCollection *)kit(v6);
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

- (NSString)bgColor
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

- (void)setBgColor:(NSString *)bgColor
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)bgColor, v4);
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

- (NSString)border
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

- (void)setBorder:(NSString *)border
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)border, v4);
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

- (NSString)cellPadding
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

- (void)setCellPadding:(NSString *)cellPadding
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)cellPadding, v4);
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

- (NSString)cellSpacing
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

- (void)setCellSpacing:(NSString *)cellSpacing
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)cellSpacing, v4);
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

- (NSString)frameBorders
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

- (void)setFrameBorders:(NSString *)frameBorders
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)frameBorders, v4);
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

- (NSString)rules
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

- (void)setRules:(NSString *)rules
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)rules, v4);
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

- (NSString)summary
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

- (void)setSummary:(NSString *)summary
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)summary, v4);
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

- (NSString)width
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

- (void)setWidth:(NSString *)width
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)width, v4);
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

- (DOMHTMLElement)createTHead
{
  void *v3;
  DOMHTMLElement *v4;
  WebCore::Node *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::HTMLTableElement::createTHead(self->super.super.super.super._internal);
  v4 = (DOMHTMLElement *)kit(v6);
  if (v6)
  {
    if (*((_DWORD *)v6 + 6) == 2)
    {
      if ((*((_WORD *)v6 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v6);
    }
    else
    {
      *((_DWORD *)v6 + 6) -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return v4;
}

- (void)deleteTHead
{
  void *v3;
  _BYTE v4[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::HTMLTableElement::deleteTHead(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (DOMHTMLElement)createTFoot
{
  void *v3;
  DOMHTMLElement *v4;
  WebCore::Node *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::HTMLTableElement::createTFoot(self->super.super.super.super._internal);
  v4 = (DOMHTMLElement *)kit(v6);
  if (v6)
  {
    if (*((_DWORD *)v6 + 6) == 2)
    {
      if ((*((_WORD *)v6 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v6);
    }
    else
    {
      *((_DWORD *)v6 + 6) -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return v4;
}

- (void)deleteTFoot
{
  void *v3;
  _BYTE v4[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::HTMLTableElement::deleteTFoot(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (id)createTBody
{
  void *v3;
  WebCore::Node *v4;
  WebCore::Node *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::HTMLTableElement::createTBody(self->super.super.super.super._internal);
  v4 = kit(v6);
  if (v6)
  {
    if (*((_DWORD *)v6 + 6) == 2)
    {
      if ((*((_WORD *)v6 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v6);
    }
    else
    {
      *((_DWORD *)v6 + 6) -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return v4;
}

- (DOMHTMLElement)createCaption
{
  void *v3;
  DOMHTMLElement *v4;
  WebCore::Node *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::HTMLTableElement::createCaption(self->super.super.super.super._internal);
  v4 = (DOMHTMLElement *)kit(v6);
  if (v6)
  {
    if (*((_DWORD *)v6 + 6) == 2)
    {
      if ((*((_WORD *)v6 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v6);
    }
    else
    {
      *((_DWORD *)v6 + 6) -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return v4;
}

- (void)deleteCaption
{
  void *v3;
  _BYTE v4[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::HTMLTableElement::deleteCaption(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (DOMHTMLElement)insertRow:(int)index
{
  WebCore::Node *v4;
  void *v5;
  DOMHTMLElement *v6;
  DOMHTMLElement *result;
  uint64_t v8;
  WebCore::Node *v9;
  uint64_t v10;
  int v11;
  WebCore::Node *v12;
  _BYTE v13[80];
  _BYTE v14[8];
  uint64_t v15;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  WebCore::HTMLTableElement::insertRow(self->super.super.super.super._internal);
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
    result = (DOMHTMLElement *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    v4 = v9;
    v9 = 0;
    v12 = v4;
    v6 = (DOMHTMLElement *)kit(v4);
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
      ((void (*)(_BYTE *, WebCore::Node **))off_1E9D6AEA0[v11])(v14, &v9);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v5);
    return v6;
  }
  return result;
}

- (void)deleteRow:(int)index
{
  void *v4;
  char v5;
  uint64_t v6;
  char v7;
  _BYTE v8[88];
  uint64_t v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLTableElement::deleteRow(self->super.super.super.super._internal);
  if (v7)
  {
    v8[80] = v5;
    v9 = v6;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
}

- (int)structuralComplexityContribution
{
  return 0x7FFFFFFF;
}

@end
