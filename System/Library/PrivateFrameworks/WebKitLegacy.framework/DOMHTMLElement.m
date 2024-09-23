@implementation DOMHTMLElement

- (int)scrollXOffset
{
  uint64_t v2;
  char v3;

  v2 = *((_QWORD *)self->super.super.super._internal + 8) & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    v3 = *(_BYTE *)(v2 + 45);
    if ((v3 & 2) != 0)
    {
      LODWORD(v2) = 105;
      __break(0xC471u);
    }
    else
    {
      if ((*(_BYTE *)(v2 + 52) & 7) != 1)
      {
        v2 = WebCore::RenderObject::containingBlock((WebCore::RenderObject *)v2);
        v3 = *(_BYTE *)(v2 + 45);
      }
      if ((v3 & 4) != 0)
      {
        if ((*(_BYTE *)(v2 + 22) & 1) != 0)
        {
          v2 = *(_QWORD *)(v2 + 144);
          if (v2)
          {
            v2 = WebCore::RenderLayer::scrollableArea((WebCore::RenderLayer *)v2);
            if (v2)
              LODWORD(v2) = WebCore::ScrollableArea::scrollOffset((WebCore::ScrollableArea *)v2);
          }
        }
        else
        {
          LODWORD(v2) = 0;
        }
      }
      else
      {
        LODWORD(v2) = 0;
      }
    }
  }
  return v2;
}

- (int)scrollYOffset
{
  uint64_t v2;
  char v3;

  v2 = *((_QWORD *)self->super.super.super._internal + 8) & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    v3 = *(_BYTE *)(v2 + 45);
    if ((v3 & 2) != 0)
    {
      LODWORD(v2) = 105;
      __break(0xC471u);
    }
    else
    {
      if ((*(_BYTE *)(v2 + 52) & 7) != 1)
      {
        v2 = WebCore::RenderObject::containingBlock((WebCore::RenderObject *)v2);
        v3 = *(_BYTE *)(v2 + 45);
      }
      if ((v3 & 4) != 0)
      {
        if ((*(_BYTE *)(v2 + 22) & 1) != 0)
        {
          v2 = *(_QWORD *)(v2 + 144);
          if (v2)
          {
            v2 = WebCore::RenderLayer::scrollableArea((WebCore::RenderLayer *)v2);
            if (v2)
              return (unint64_t)WebCore::ScrollableArea::scrollOffset((WebCore::ScrollableArea *)v2) >> 32;
          }
        }
        else
        {
          LODWORD(v2) = 0;
        }
      }
      else
      {
        LODWORD(v2) = 0;
      }
    }
  }
  return v2;
}

- (void)setScrollXOffset:(int)a3 scrollYOffset:(int)a4
{
  -[DOMHTMLElement setScrollXOffset:scrollYOffset:adjustForIOSCaret:](self, "setScrollXOffset:scrollYOffset:adjustForIOSCaret:", *(_QWORD *)&a3, *(_QWORD *)&a4, 0);
}

- (void)setScrollXOffset:(int)a3 scrollYOffset:(int)a4 adjustForIOSCaret:(BOOL)a5
{
  uint64_t v5;
  WebCore::RenderLayer *v6;

  v5 = *((_QWORD *)self->super.super.super._internal + 8) & 0xFFFFFFFFFFFFLL;
  if (v5)
  {
    if ((*(_BYTE *)(v5 + 45) & 2) != 0)
    {
      __break(0xC471u);
    }
    else
    {
      if ((*(_BYTE *)(v5 + 52) & 7) != 1)
        v5 = WebCore::RenderObject::containingBlock((WebCore::RenderObject *)v5);
      if ((*(_BYTE *)(v5 + 22) & 1) != 0 && (*(_BYTE *)(v5 + 45) & 4) != 0)
      {
        v6 = *(WebCore::RenderLayer **)(v5 + 144);
        if (v6)
        {
          WebCore::RenderLayer::ensureLayerScrollableArea(v6);
          WebCore::RenderLayerScrollableArea::scrollToOffset();
        }
      }
    }
  }
}

- (void)absolutePosition:(int *)a3 :(int *)a4 :(int *)a5 :(int *)a6
{
  uint64_t v10;
  float v11;
  int v12;
  int v13;
  float v14;
  int v15;
  float v16;
  float v17;

  if (self)
    self = (DOMHTMLElement *)self->super.super.super._internal;
  v10 = WebCore::Node::renderBox((WebCore::Node *)self);
  if (v10)
  {
    if (a5)
      *a5 = *(_DWORD *)(v10 + 160) / 64;
    if (a6)
      *a6 = *(_DWORD *)(v10 + 160) / 64;
    if (a3 && a4)
    {
      v16 = (float)*a3;
      v17 = (float)*a4;
      WebCore::RenderObject::localToAbsolute();
      v11 = roundf(v16);
      if (v11 > -2147500000.0)
        v12 = (int)v11;
      else
        v12 = 0x80000000;
      if (v11 < 2147500000.0)
        v13 = v12;
      else
        v13 = 0x7FFFFFFF;
      v14 = roundf(v17);
      if (v14 >= 2147500000.0)
      {
        v15 = 0x7FFFFFFF;
      }
      else if (v14 <= -2147500000.0)
      {
        v15 = 0x80000000;
      }
      else
      {
        v15 = (int)v14;
      }
      *a3 = v13;
      *a4 = v15;
    }
  }
}

- (NSString)title
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

- (void)setTitle:(NSString *)title
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)title, v4);
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

- (NSString)lang
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

- (void)setLang:(NSString *)lang
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)lang, v4);
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

- (BOOL)translate
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = WebCore::HTMLElement::translate(self->super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (void)setTranslate:(BOOL)a3
{
  void *v4;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLElement::setTranslate(self->super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (NSString)dir
{
  void *v3;
  const __CFString *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(_QWORD *)WebCore::HTMLElement::dir(self->super.super.super._internal))
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v4 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (void)setDir:(NSString *)dir
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)dir, v4);
  v7 = v9;
  WebCore::HTMLElement::setDir();
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

- (int)tabIndex
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = (*(uint64_t (**)(DOMObjectInternal *))(*(_QWORD *)self->super.super.super._internal + 584))(self->super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (void)setTabIndex:(int)tabIndex
{
  void *v4;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::Element::setTabIndexForBindings(self->super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (BOOL)draggable
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = (*(uint64_t (**)(DOMObjectInternal *))(*(_QWORD *)self->super.super.super._internal + 1160))(self->super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (void)setDraggable:(BOOL)a3
{
  void *v4;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLElement::setDraggable(self->super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (id)webkitdropzone
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

- (void)setWebkitdropzone:(id)a3
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

- (BOOL)hidden
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
  v4 = *((_QWORD *)self->super.super.super._internal + 13);
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
  v8 = *MEMORY[0x1E0DD5C60];
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

- (void)setHidden:(BOOL)a3
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

- (NSString)innerText
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::Element::innerText(self->super.super.super._internal);
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

- (void)setInnerText:(NSString *)innerText
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
  MEMORY[0x1D82A3998](&v8, innerText);
  WebCore::HTMLElement::setInnerText();
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

- (NSString)outerText
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::Element::innerText(self->super.super.super._internal);
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

- (void)setOuterText:(NSString *)outerText
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
  MEMORY[0x1D82A3998](&v8, outerText);
  WebCore::HTMLElement::setOuterText();
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

- (NSString)contentEditable
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::HTMLElement::contentEditable(self->super.super.super._internal);
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

- (void)setContentEditable:(NSString *)contentEditable
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
  internal = self->super.super.super._internal;
  MEMORY[0x1D82A3998](&v10, contentEditable);
  WebCore::HTMLElement::setContentEditable(internal, (const WTF::String *)&v10);
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
    goto LABEL_5;
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
LABEL_5:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v6);
    return;
  }
  WTF::StringImpl::destroy(v7, v6);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v8);
}

- (BOOL)isContentEditable
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = WebCore::Node::isContentEditable(self->super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (BOOL)spellcheck
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = MEMORY[0x1D82A7814](self->super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (void)setSpellcheck:(BOOL)a3
{
  void *v4;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLElement::setSpellcheck(self->super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (NSString)idName
{
  void *v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t *v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v12[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  v4 = *((_QWORD *)self->super.super.super._internal + 13);
  if (v4 && *(_QWORD *)(v4 + 24))
  {
    v5 = *(_DWORD *)(v4 + 4);
    if ((v5 & 1) != 0)
    {
      v6 = *(uint64_t **)(v4 + 40);
      LODWORD(v7) = *(_DWORD *)(v4 + 52);
      if (!(_DWORD)v7)
      {
LABEL_15:
        v6 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      v6 = (uint64_t *)(v4 + 32);
      LODWORD(v7) = v5 >> 5;
      if (!(_DWORD)v7)
        goto LABEL_15;
    }
    v9 = *MEMORY[0x1E0DD5FA8];
    v7 = v7;
    while (1)
    {
      v10 = *v6;
      if (*v6 == v9 || *(_QWORD *)(v10 + 24) == *(_QWORD *)(v9 + 24) && *(_QWORD *)(v10 + 32) == *(_QWORD *)(v9 + 32))
        break;
      v6 += 2;
      if (!--v7)
        goto LABEL_15;
    }
LABEL_16:
    if (!v6[1])
      goto LABEL_17;
    goto LABEL_7;
  }
  if (!*MEMORY[0x1E0CBF2F8])
  {
LABEL_17:
    v8 = &stru_1E9D6EC48;
    goto LABEL_18;
  }
LABEL_7:
  v8 = (const __CFString *)WTF::StringImpl::operator NSString *();
LABEL_18:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v3);
  return &v8->isa;
}

- (void)setIdName:(NSString *)idName
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)idName, v4);
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

- (DOMHTMLCollection)children
{
  void *v3;
  DOMHTMLCollection *v4;
  DOMObjectInternal *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::ContainerNode::children(self->super.super.super._internal);
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

- (NSString)titleDisplayString
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
  WebCore::HTMLElement::title(self->super.super.super._internal);
  WebCore::displayString((WebCore *)&v9, self->super.super.super._internal, v3);
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

- (id)insertAdjacentElement:(id)a3 element:(id)a4
{
  DOMObjectInternal *internal;
  WebCore::Element *v8;
  StringImpl *v9;
  WebCore::Node *v10;
  WTF::StringImpl *v11;
  id result;
  uint64_t v13;
  WTF::StringImpl *v14;
  WebCore::Node *v15;
  uint64_t v16;
  int v17;
  _BYTE v18[80];
  _BYTE v19[8];
  uint64_t v20;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v18);
  if (!a4)
    raiseTypeErrorException();
  internal = self->super.super.super._internal;
  MEMORY[0x1D82A3998](&v14, a3);
  v8 = (WebCore::Element *)core((uint64_t)a4);
  WebCore::Element::insertAdjacentElement(internal, (const WTF::String *)&v14, v8);
  if (v17)
  {
    if (v17 == 1)
    {
      v19[0] = (_BYTE)v15;
      v13 = v16;
      v16 = 0;
      v20 = v13;
      raiseDOMErrorException();
    }
    result = (id)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    v10 = kit(v15);
    if (v17 != -1)
      ((void (*)(_BYTE *, WebCore::Node **))off_1E9D6AE40[v17])(v19, &v15);
    v17 = -1;
    v11 = v14;
    v14 = 0;
    if (v11)
    {
      if (*(_DWORD *)v11 == 2)
        WTF::StringImpl::destroy(v11, v9);
      else
        *(_DWORD *)v11 -= 2;
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v18, v9);
    return v10;
  }
  return result;
}

- (void)insertAdjacentHTML:(id)a3 html:(id)a4
{
  StringImpl *v6;
  WTF::StringImpl *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  WTF::StringImpl *v11;
  char v12;
  uint64_t v13;
  char v14;
  _BYTE v15[80];
  _BYTE v16[8];
  uint64_t v17;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  MEMORY[0x1D82A3998](&v11, a3);
  MEMORY[0x1D82A3998](&v9, a4);
  v10 = 1;
  WebCore::Element::insertAdjacentHTML();
  if (v14)
  {
    v16[0] = v12;
    v8 = v13;
    v13 = 0;
    v17 = v8;
    raiseDOMErrorException();
  }
  if (v10 != -1)
    ((void (*)(_BYTE *, uint64_t *))off_1E9D6AE50[v10])(v16, &v9);
  v7 = v11;
  v11 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v6);
    else
      *(_DWORD *)v7 -= 2;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v6);
}

- (void)insertAdjacentText:(id)a3 text:(id)a4
{
  StringImpl *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;
  uint64_t v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  char v12;
  uint64_t v13;
  char v14;
  _BYTE v15[88];
  uint64_t v16;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  MEMORY[0x1D82A3998](&v11, a3);
  MEMORY[0x1D82A3998](&v10, a4);
  WebCore::Element::insertAdjacentText();
  if (v14)
  {
    v15[80] = v12;
    v9 = v13;
    v13 = 0;
    v16 = v9;
    raiseDOMErrorException();
  }
  v7 = v10;
  v10 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v6);
      v8 = v11;
      v11 = 0;
      if (!v8)
        goto LABEL_11;
      goto LABEL_8;
    }
    *(_DWORD *)v7 -= 2;
  }
  v8 = v11;
  v11 = 0;
  if (!v8)
    goto LABEL_11;
LABEL_8:
  if (*(_DWORD *)v8 == 2)
    WTF::StringImpl::destroy(v8, v6);
  else
    *(_DWORD *)v8 -= 2;
LABEL_11:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v6);
}

- (void)click
{
  void *v3;
  _BYTE v4[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::HTMLElement::click(self->super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (BOOL)autocorrect
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = (*(uint64_t (**)(DOMObjectInternal *))(*(_QWORD *)self->super.super.super._internal + 1232))(self->super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (void)setAutocorrect:(BOOL)a3
{
  void *v4;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLElement::setAutocorrect(self->super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (id)autocapitalize
{
  void *v3;
  const __CFString *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(_QWORD *)WebCore::HTMLElement::autocapitalize(self->super.super.super._internal))
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v4 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return (id)v4;
}

- (void)setAutocapitalize:(id)a3
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
  WebCore::HTMLElement::setAutocapitalize();
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

- (int)structuralComplexityContribution
{
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v2 = *((_QWORD *)self->super.super.super._internal + 8) & 0xFFFFFFFFFFFFLL;
  if (!v2)
    goto LABEL_15;
  if ((*(_BYTE *)((*((_QWORD *)self->super.super.super._internal + 8) & 0xFFFFFFFFFFFFLL) + 0x2D) & 2) != 0)
  {
    LODWORD(self) = 105;
    __break(0xC471u);
    return (int)self;
  }
  v3 = *(_DWORD *)((*((_QWORD *)self->super.super.super._internal + 8) & 0xFFFFFFFFFFFFLL) + 0x14);
  LODWORD(self) = 0x7FFFFFFF;
  if ((v3 & 0x800) == 0
    && (v3 & 0x1800000) != 0x1000000
    && ((*(_BYTE *)(v2 + 52) & 7) != 3 || (*(_BYTE *)(v2 + 53) & 4) == 0))
  {
    self = (DOMHTMLElement *)(*(uint64_t (**)(uint64_t, SEL))(*(_QWORD *)v2 + 112))(v2, a2);
    if (self)
    {
      if ((*(_BYTE *)(v2 + 52) & 7) == 1
        || (*(_BYTE *)(v2 + 45) & 0x40) != 0
        && WebCore::RenderBoxModelObject::inlineContinuation((WebCore::RenderBoxModelObject *)v2))
      {
        if ((*(_BYTE *)(v2 + 45) & 4) != 0)
        {
          v5 = *(_QWORD *)(v2 + 32);
          LODWORD(self) = !v5
                       || (v6 = *(_QWORD *)(v5 + 8)) == 0
                       || (*(_BYTE *)(v6 + 45) & 4) == 0
                       || *(_DWORD *)(v2 + 160) != *(_DWORD *)(v6 + 160);
        }
        else
        {
          LODWORD(self) = 1;
        }
        return (int)self;
      }
      v4 = *(_DWORD *)(v2 + 20);
      if ((v4 & 0x20000) != 0)
      {
        if ((*(_BYTE *)(v2 + 45) & 2) != 0)
          v2 = *(_QWORD *)(*(_QWORD *)(v2 + 32) + 8);
        v7 = *(_QWORD *)(v2 + 88);
        if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v7 + 32) + 40) + 20)
          || (v8 = *(_QWORD **)(v7 + 40), v8[41])
          || v8[38]
          || v8[39]
          || (v4 & 0x100000) != 0
          || v8[40])
        {
          LODWORD(self) = 0x7FFFFFFF;
          return (int)self;
        }
      }
LABEL_15:
      LODWORD(self) = 0;
    }
  }
  return (int)self;
}

@end
