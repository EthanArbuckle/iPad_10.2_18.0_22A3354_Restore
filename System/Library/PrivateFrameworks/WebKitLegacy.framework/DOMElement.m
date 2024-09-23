@implementation DOMElement

- (__CTFont)_font
{
  uint64_t v2;
  WebCore::FontCascade *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  WTF *v9;
  WTF *v11;
  WTF *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  WTF *v20;
  WTF *v21;
  uint64_t v22;
  _DWORD *v23;
  WTF *v24;
  void *v25;
  uint64_t v26;
  WTF *v27;

  v2 = core((uint64_t)self);
  if ((*(_QWORD *)(v2 + 64) & 0xFFFFFFFFFFFFLL) == 0)
    return 0;
  if ((*(_BYTE *)((*(_QWORD *)(v2 + 64) & 0xFFFFFFFFFFFFLL) + 0x2D) & 2) != 0)
  {
LABEL_54:
    __break(0xC471u);
    JUMPOUT(0x1D7FD8520);
  }
  v3 = (WebCore::FontCascade *)WebCore::RenderStyle::fontCascade((WebCore::RenderStyle *)((*(_QWORD *)(v2 + 64) & 0xFFFFFFFFFFFFLL)
                                                                                        + 80));
  WebCore::FontCascade::protectedFonts(v3);
  v4 = *(_QWORD *)(v26 + 104);
  if (v4 && *(_QWORD *)(v4 + 8))
    goto LABEL_45;
  v5 = WebCore::FontCascadeFonts::realizeFallbackRangesAt();
  WebCore::FontRanges::glyphDataForCharacter();
  if (!v27 || (v7 = *((_QWORD *)v27 + 1)) == 0)
  {
    v8 = 0;
    goto LABEL_15;
  }
  v8 = *(_QWORD *)(v7 + 8);
  if (!v8)
  {
    v8 = WTF::fastCompactMalloc((WTF *)0x10);
    *(_DWORD *)v8 = 1;
    *(_QWORD *)(v8 + 8) = v7;
    v9 = *(WTF **)(v7 + 8);
    *(_QWORD *)(v7 + 8) = v8;
    if (v9)
    {
      if (*(_DWORD *)v9 == 1)
      {
        WTF::fastFree(v9, v6);
        v8 = *(_QWORD *)(v7 + 8);
        if (!v8)
          goto LABEL_15;
      }
      else
      {
        --*(_DWORD *)v9;
      }
    }
  }
  ++*(_DWORD *)v8;
LABEL_15:
  v11 = *(WTF **)(v26 + 104);
  *(_QWORD *)(v26 + 104) = v8;
  if (v11)
  {
    if (*(_DWORD *)v11 == 1)
    {
      WTF::fastFree(v11, v6);
      v12 = v27;
      if (!v27)
        goto LABEL_23;
      goto LABEL_21;
    }
    --*(_DWORD *)v11;
  }
  v12 = v27;
  if (!v27)
  {
LABEL_23:
    v13 = *(_QWORD *)(v26 + 104);
    if (!v13)
      goto LABEL_32;
    goto LABEL_26;
  }
LABEL_21:
  if (*(_DWORD *)v12 != 1)
  {
    --*(_DWORD *)v12;
    goto LABEL_23;
  }
  WTF::fastFree(v12, v6);
  v13 = *(_QWORD *)(v26 + 104);
  if (!v13)
    goto LABEL_32;
LABEL_26:
  v14 = *(_QWORD *)(v13 + 8);
  if (v14)
  {
    if ((*(_BYTE *)(v14 + 256) & 2) != 0 && *(_DWORD *)(WebCore::FontCascadeFonts::realizeFallbackRangesAt() + 12))
    {
      v15 = 2;
      do
      {
        WebCore::FontRanges::glyphDataForCharacter();
        ++v15;
      }
      while (*(_DWORD *)(WebCore::FontCascadeFonts::realizeFallbackRangesAt() + 12));
    }
    goto LABEL_45;
  }
LABEL_32:
  if (!*(_DWORD *)(v5 + 12))
    goto LABEL_54;
  v16 = WebCore::FontRanges::Range::font();
  v18 = v16;
  if (v16)
  {
    v19 = *(_QWORD *)(v16 + 8);
    if (v19)
      goto LABEL_40;
    v19 = WTF::fastCompactMalloc((WTF *)0x10);
    *(_DWORD *)v19 = 1;
    *(_QWORD *)(v19 + 8) = v18;
    v20 = *(WTF **)(v18 + 8);
    *(_QWORD *)(v18 + 8) = v19;
    if (!v20)
      goto LABEL_40;
    if (*(_DWORD *)v20 != 1)
    {
      --*(_DWORD *)v20;
LABEL_40:
      ++*(_DWORD *)v19;
      goto LABEL_41;
    }
    WTF::fastFree(v20, v17);
    v19 = *(_QWORD *)(v18 + 8);
    if (v19)
      goto LABEL_40;
  }
  else
  {
    v19 = 0;
  }
LABEL_41:
  v21 = *(WTF **)(v26 + 104);
  *(_QWORD *)(v26 + 104) = v19;
  if (!v21)
    goto LABEL_46;
  if (*(_DWORD *)v21 == 1)
    WTF::fastFree(v21, v17);
  else
    --*(_DWORD *)v21;
LABEL_45:
  v19 = *(_QWORD *)(v26 + 104);
LABEL_46:
  if (v19)
  {
    v22 = *(_QWORD *)(v19 + 8);
    v23 = (_DWORD *)v26;
    if (!v26)
      goto LABEL_53;
LABEL_50:
    if (*v23 == 1)
    {
      v24 = (WTF *)MEMORY[0x1D82A4FD0]();
      WTF::fastFree(v24, v25);
    }
    else
    {
      --*v23;
    }
    goto LABEL_53;
  }
  v22 = 0;
  v23 = (_DWORD *)v26;
  if (v26)
    goto LABEL_50;
LABEL_53:
  WebCore::FontCascadeDescription::resolveFontSizeAdjustFromFontIfNeeded();
  return *(__CTFont **)(v22 + 88);
}

- (id)_getURLAttribute:(id)a3
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;

  core((uint64_t)self);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, v4);
  WebCore::Element::getAttribute();
  WebCore::Document::completeURL();
  v6 = (void *)WTF::URL::operator NSURL *();
  if (!v10)
  {
LABEL_4:
    v7 = v9;
    if (!v9)
      return v6;
    goto LABEL_7;
  }
  if (*(_DWORD *)v10 != 2)
  {
    *(_DWORD *)v10 -= 2;
    goto LABEL_4;
  }
  WTF::StringImpl::destroy(v10, v5);
  v7 = v9;
  if (!v9)
    return v6;
LABEL_7:
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
    return v6;
  }
  WTF::StringImpl::destroy(v7, v5);
  return v6;
}

- (BOOL)isFocused
{
  uint64_t v2;

  v2 = core((uint64_t)self);
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 1248) == v2;
}

- (NSString)tagName
{
  DOMObjectInternal *internal;
  StringImpl *v4;
  const __CFString *v5;
  WTF::StringImpl *v6;
  NSString *result;
  WTF::StringImpl *v8;
  _BYTE v9[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) != 0)
  {
    (*(void (**)(WTF::StringImpl **__return_ptr))(*(_QWORD *)internal + 104))(&v8);
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

- (DOMCSSStyleDeclaration)style
{
  void *v3;
  DOMObjectInternal *internal;
  __int16 v5;
  DOMObjectInternal *v6;
  DOMCSSStyleDeclaration *v7;
  DOMCSSStyleDeclaration *result;
  _BYTE v9[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  internal = self->super.super._internal;
  v5 = *((_WORD *)internal + 14);
  if ((v5 & 8) != 0)
  {
    if ((v5 & 0x70) != 0)
    {
      v6 = (DOMObjectInternal *)WebCore::StyledElement::cssomStyle(internal);
      v7 = (DOMCSSStyleDeclaration *)kit(v6);
    }
    else
    {
      v7 = 0;
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v3);
    return v7;
  }
  else
  {
    result = (DOMCSSStyleDeclaration *)96;
    __break(0xC471u);
  }
  return result;
}

- (int)offsetLeft
{
  DOMObjectInternal *internal;
  int v4;
  void *v5;
  int result;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) != 0)
  {
    v4 = WebCore::Element::offsetLeftForBindings(internal);
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

- (int)offsetTop
{
  DOMObjectInternal *internal;
  int v4;
  void *v5;
  int result;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) != 0)
  {
    v4 = WebCore::Element::offsetTopForBindings(internal);
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

- (int)offsetWidth
{
  DOMObjectInternal *internal;
  int v4;
  void *v5;
  int result;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) != 0)
  {
    v4 = WebCore::Element::offsetWidth(internal);
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

- (int)offsetHeight
{
  DOMObjectInternal *internal;
  int v4;
  void *v5;
  int result;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) != 0)
  {
    v4 = WebCore::Element::offsetHeight(internal);
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

- (int)clientLeft
{
  DOMObjectInternal *internal;
  int v4;
  void *v5;
  int result;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) != 0)
  {
    v4 = WebCore::Element::clientLeft(internal);
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

- (int)clientTop
{
  DOMObjectInternal *internal;
  int v4;
  void *v5;
  int result;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) != 0)
  {
    v4 = WebCore::Element::clientTop(internal);
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

- (int)clientWidth
{
  DOMObjectInternal *internal;
  int v4;
  void *v5;
  int result;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) != 0)
  {
    v4 = WebCore::Element::clientWidth(internal);
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

- (int)clientHeight
{
  DOMObjectInternal *internal;
  int v4;
  void *v5;
  int result;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) != 0)
  {
    v4 = WebCore::Element::clientHeight(internal);
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

- (int)scrollLeft
{
  DOMObjectInternal *internal;
  int v4;
  void *v5;
  int result;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) != 0)
  {
    v4 = (*(uint64_t (**)(DOMObjectInternal *))(*(_QWORD *)internal + 400))(internal);
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

- (void)setScrollLeft:(int)scrollLeft
{
  uint64_t v3;
  DOMObjectInternal *internal;
  void *v6;
  _BYTE v7[80];

  v3 = *(_QWORD *)&scrollLeft;
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) != 0)
  {
    (*(void (**)(DOMObjectInternal *, uint64_t))(*(_QWORD *)internal + 416))(internal, v3);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v6);
  }
  else
  {
    __break(0xC471u);
  }
}

- (int)scrollTop
{
  DOMObjectInternal *internal;
  int v4;
  void *v5;
  int result;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) != 0)
  {
    v4 = (*(uint64_t (**)(DOMObjectInternal *))(*(_QWORD *)internal + 408))(internal);
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

- (void)setScrollTop:(int)scrollTop
{
  uint64_t v3;
  DOMObjectInternal *internal;
  void *v6;
  _BYTE v7[80];

  v3 = *(_QWORD *)&scrollTop;
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) != 0)
  {
    (*(void (**)(DOMObjectInternal *, uint64_t))(*(_QWORD *)internal + 424))(internal, v3);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v6);
  }
  else
  {
    __break(0xC471u);
  }
}

- (int)scrollWidth
{
  DOMObjectInternal *internal;
  int v4;
  void *v5;
  int result;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) != 0)
  {
    v4 = (*(uint64_t (**)(DOMObjectInternal *))(*(_QWORD *)internal + 432))(internal);
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

- (int)scrollHeight
{
  DOMObjectInternal *internal;
  int v4;
  void *v5;
  int result;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) != 0)
  {
    v4 = (*(uint64_t (**)(DOMObjectInternal *))(*(_QWORD *)internal + 440))(internal);
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

- (DOMElement)offsetParent
{
  DOMObjectInternal *internal;
  void *v4;
  DOMElement *v5;
  DOMElement *result;
  WebCore::Node *v7;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) != 0)
  {
    WebCore::Element::offsetParentForBindings(internal);
    v5 = (DOMElement *)kit(v7);
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
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
    return v5;
  }
  else
  {
    result = (DOMElement *)96;
    __break(0xC471u);
  }
  return result;
}

- (NSString)innerHTML
{
  DOMObjectInternal *internal;
  StringImpl *v4;
  const __CFString *v5;
  NSString *result;
  WTF::StringImpl *v7;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) != 0)
  {
    WebCore::Element::innerHTML(internal);
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

- (void)setInnerHTML:(NSString *)innerHTML
{
  void *v5;
  uint64_t v6;
  _BYTE v7[8];
  int v8;
  char v9;
  uint64_t v10;
  char v11;
  _BYTE v12[80];
  _BYTE v13[8];
  uint64_t v14;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  if ((*((_WORD *)self->super.super._internal + 14) & 8) == 0)
  {
    __break(0xC471u);
    JUMPOUT(0x1D7FF88D0);
  }
  MEMORY[0x1D82A3998](v7, innerHTML);
  v8 = 1;
  WebCore::Element::setInnerHTML();
  if (v11)
  {
    v13[0] = v9;
    v6 = v10;
    v10 = 0;
    v14 = v6;
    raiseDOMErrorException();
  }
  if (v8 != -1)
    ((void (*)(_BYTE *, _BYTE *))off_1E9D6ADF8[v8])(v13, v7);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v5);
}

- (NSString)outerHTML
{
  DOMObjectInternal *internal;
  StringImpl *v4;
  const __CFString *v5;
  NSString *result;
  WTF::StringImpl *v7;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) != 0)
  {
    WebCore::Element::outerHTML(internal);
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

- (void)setOuterHTML:(NSString *)outerHTML
{
  void *v5;
  uint64_t v6;
  _BYTE v7[8];
  int v8;
  char v9;
  uint64_t v10;
  char v11;
  _BYTE v12[80];
  _BYTE v13[8];
  uint64_t v14;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  if ((*((_WORD *)self->super.super._internal + 14) & 8) == 0)
  {
    __break(0xC471u);
    JUMPOUT(0x1D7FF8B34);
  }
  MEMORY[0x1D82A3998](v7, outerHTML);
  v8 = 1;
  WebCore::Element::setOuterHTML();
  if (v11)
  {
    v13[0] = v9;
    v6 = v10;
    v10 = 0;
    v14 = v6;
    raiseDOMErrorException();
  }
  if (v8 != -1)
    ((void (*)(_BYTE *, _BYTE *))off_1E9D6ADF8[v8])(v13, v7);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v5);
}

- (NSString)className
{
  void *v3;
  const __CFString *v4;
  NSString *result;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if ((*((_WORD *)self->super.super._internal + 14) & 8) != 0)
  {
    if (*(_QWORD *)WebCore::Element::getAttribute())
      v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v4 = &stru_1E9D6EC48;
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
    return &v4->isa;
  }
  else
  {
    result = (NSString *)96;
    __break(0xC471u);
  }
  return result;
}

- (void)setClassName:(NSString *)className
{
  const __CFString *v5;
  StringImpl *v6;
  void *v7;
  WTF::StringImpl *v8;
  _BYTE v9[80];
  WTF::StringImpl *v10;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  if ((*((_WORD *)self->super.super._internal + 14) & 8) != 0)
  {
    WTF::AtomStringImpl::add((WTF::AtomStringImpl *)className, v5);
    v8 = v10;
    WebCore::Element::setAttributeWithoutSynchronization();
    if (!v8)
    {
LABEL_5:
      WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v6);
      return;
    }
    if (*(_DWORD *)v8 != 2)
    {
      *(_DWORD *)v8 -= 2;
      goto LABEL_5;
    }
    WTF::StringImpl::destroy(v8, v6);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v7);
  }
  else
  {
    __break(0xC471u);
  }
}

- (id)classList
{
  DOMObjectInternal *internal;
  DOMObjectInternal *v4;
  DOMObjectInternal *v5;
  void *v6;
  id result;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) != 0)
  {
    v4 = (DOMObjectInternal *)WebCore::Element::classList(internal);
    v5 = kit(v4);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
    return v5;
  }
  else
  {
    result = (id)96;
    __break(0xC471u);
  }
  return result;
}

- (NSString)innerText
{
  DOMObjectInternal *internal;
  StringImpl *v4;
  const __CFString *v5;
  NSString *result;
  WTF::StringImpl *v7;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) != 0)
  {
    WebCore::Element::innerText(internal);
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

- (id)uiactions
{
  void *v3;
  const __CFString *v4;
  id result;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if ((*((_WORD *)self->super.super._internal + 14) & 8) != 0)
  {
    if (*(_QWORD *)WebCore::Element::getAttribute())
      v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v4 = &stru_1E9D6EC48;
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
    return (id)v4;
  }
  else
  {
    result = (id)96;
    __break(0xC471u);
  }
  return result;
}

- (void)setUiactions:(id)a3
{
  const __CFString *v5;
  StringImpl *v6;
  void *v7;
  WTF::StringImpl *v8;
  _BYTE v9[80];
  WTF::StringImpl *v10;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  if ((*((_WORD *)self->super.super._internal + 14) & 8) != 0)
  {
    WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, v5);
    v8 = v10;
    WebCore::Element::setAttributeWithoutSynchronization();
    if (!v8)
    {
LABEL_5:
      WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v6);
      return;
    }
    if (*(_DWORD *)v8 != 2)
    {
      *(_DWORD *)v8 -= 2;
      goto LABEL_5;
    }
    WTF::StringImpl::destroy(v8, v6);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v7);
  }
  else
  {
    __break(0xC471u);
  }
}

- (DOMElement)previousElementSibling
{
  DOMObjectInternal *internal;
  WebCore::Node *v4;
  DOMElement *v5;
  void *v6;
  DOMElement *result;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) != 0)
  {
    v4 = (WebCore::Node *)WebCore::Node::previousElementSibling(internal);
    v5 = (DOMElement *)kit(v4);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
    return v5;
  }
  else
  {
    result = (DOMElement *)96;
    __break(0xC471u);
  }
  return result;
}

- (DOMElement)nextElementSibling
{
  DOMObjectInternal *internal;
  WebCore::Node *ElementSibling;
  DOMElement *v5;
  void *v6;
  DOMElement *result;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) != 0)
  {
    ElementSibling = (WebCore::Node *)WebCore::Node::nextElementSibling(internal);
    v5 = (DOMElement *)kit(ElementSibling);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
    return v5;
  }
  else
  {
    result = (DOMElement *)96;
    __break(0xC471u);
  }
  return result;
}

- (id)children
{
  DOMObjectInternal *internal;
  void *v4;
  id v5;
  id result;
  DOMObjectInternal *v7;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) != 0)
  {
    WebCore::ContainerNode::children(internal);
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

- (DOMElement)firstElementChild
{
  DOMObjectInternal *internal;
  WebCore::Node *ElementChild;
  DOMElement *v5;
  void *v6;
  DOMElement *result;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) != 0)
  {
    ElementChild = (WebCore::Node *)WebCore::ContainerNode::firstElementChild(internal);
    v5 = (DOMElement *)kit(ElementChild);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
    return v5;
  }
  else
  {
    result = (DOMElement *)96;
    __break(0xC471u);
  }
  return result;
}

- (DOMElement)lastElementChild
{
  DOMObjectInternal *internal;
  WebCore::Node *ElementChild;
  DOMElement *v5;
  void *v6;
  DOMElement *result;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) != 0)
  {
    ElementChild = (WebCore::Node *)WebCore::ContainerNode::lastElementChild(internal);
    v5 = (DOMElement *)kit(ElementChild);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
    return v5;
  }
  else
  {
    result = (DOMElement *)96;
    __break(0xC471u);
  }
  return result;
}

- (unsigned)childElementCount
{
  DOMObjectInternal *internal;
  unsigned int v4;
  void *v5;
  unsigned int result;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) != 0)
  {
    v4 = WebCore::ContainerNode::childElementCount(internal);
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

- (CGRect)boundsInRootViewSpace
{
  double v3;
  double v4;
  double v5;
  double v6;
  DOMObjectInternal *internal;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _BYTE v14[80];
  CGRect result;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) != 0)
  {
    v8 = WebCore::Element::boundsInRootViewSpace(internal);
    v10 = (double)(int)v9;
    v11 = (double)SHIDWORD(v8);
    v12 = (double)(int)v8;
    v13 = (double)SHIDWORD(v9);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v9);
    v3 = v12;
    v4 = v11;
    v5 = v10;
    v6 = v13;
  }
  else
  {
    __break(0xC471u);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (NSString)getAttribute:(NSString *)name
{
  const __CFString *v5;
  StringImpl *v6;
  const __CFString *v7;
  WTF::StringImpl *v8;
  NSString *result;
  WTF::StringImpl *v10;
  _BYTE v11[80];
  WTF::StringImpl *v12;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  if ((*((_WORD *)self->super.super._internal + 14) & 8) != 0)
  {
    WTF::AtomStringImpl::add((WTF::AtomStringImpl *)name, v5);
    v10 = v12;
    if (*(_QWORD *)WebCore::Element::getAttribute())
    {
      v7 = (const __CFString *)WTF::StringImpl::operator NSString *();
      v8 = v10;
      if (!v10)
        goto LABEL_9;
    }
    else
    {
      v7 = &stru_1E9D6EC48;
      v8 = v10;
      if (!v10)
      {
LABEL_9:
        WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v6);
        return &v7->isa;
      }
    }
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy(v8, v6);
    else
      *(_DWORD *)v8 -= 2;
    goto LABEL_9;
  }
  result = (NSString *)96;
  __break(0xC471u);
  return result;
}

- (void)setAttribute:(NSString *)name value:(NSString *)value
{
  const __CFString *v7;
  const __CFString *v8;
  StringImpl *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  char v13;
  uint64_t v14;
  char v15;
  _BYTE v16[80];
  WTF::StringImpl *v17;
  uint64_t v18;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16);
  if ((*((_WORD *)self->super.super._internal + 14) & 8) == 0)
  {
    __break(0xC471u);
    JUMPOUT(0x1D7FF97C0);
  }
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)name, v7);
  v12 = v17;
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)value, v8);
  v11 = v17;
  WebCore::Element::setAttribute();
  if (v15)
  {
    LOBYTE(v17) = v13;
    v18 = v14;
    raiseDOMErrorException();
  }
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
    {
      WTF::StringImpl::destroy(v11, v9);
      v10 = v12;
      if (!v12)
        goto LABEL_12;
      goto LABEL_9;
    }
    *(_DWORD *)v11 -= 2;
  }
  v10 = v12;
  if (!v12)
    goto LABEL_12;
LABEL_9:
  if (*(_DWORD *)v10 == 2)
    WTF::StringImpl::destroy(v10, v9);
  else
    *(_DWORD *)v10 -= 2;
LABEL_12:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16, v9);
}

- (void)removeAttribute:(NSString *)name
{
  const __CFString *v5;
  StringImpl *v6;
  void *v7;
  WTF::StringImpl *v8;
  _BYTE v9[80];
  WTF::StringImpl *v10;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  if ((*((_WORD *)self->super.super._internal + 14) & 8) != 0)
  {
    WTF::AtomStringImpl::add((WTF::AtomStringImpl *)name, v5);
    v8 = v10;
    WebCore::Element::removeAttribute();
    if (!v8)
    {
LABEL_5:
      WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v6);
      return;
    }
    if (*(_DWORD *)v8 != 2)
    {
      *(_DWORD *)v8 -= 2;
      goto LABEL_5;
    }
    WTF::StringImpl::destroy(v8, v6);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v7);
  }
  else
  {
    __break(0xC471u);
  }
}

- (DOMAttr)getAttributeNode:(NSString *)name
{
  const __CFString *v5;
  StringImpl *v6;
  DOMAttr *v7;
  DOMAttr *result;
  WTF::StringImpl *v9;
  WebCore::Node *v10;
  _BYTE v11[80];
  WTF::StringImpl *v12;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  if ((*((_WORD *)self->super.super._internal + 14) & 8) != 0)
  {
    WTF::AtomStringImpl::add((WTF::AtomStringImpl *)name, v5);
    v9 = v12;
    WebCore::Element::getAttributeNode();
    v7 = (DOMAttr *)kit(v10);
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
      if (*(_DWORD *)v9 == 2)
        WTF::StringImpl::destroy(v9, v6);
      else
        *(_DWORD *)v9 -= 2;
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v6);
    return v7;
  }
  else
  {
    result = (DOMAttr *)96;
    __break(0xC471u);
  }
  return result;
}

- (DOMAttr)setAttributeNode:(DOMAttr *)newAttr
{
  DOMObjectInternal *internal;
  WebCore::Node *v6;
  void *v7;
  DOMAttr *v8;
  uint64_t v10;
  WebCore::Node *v11;
  uint64_t v12;
  int v13;
  _BYTE v14[80];
  _BYTE v15[8];
  uint64_t v16;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14);
  if (!newAttr)
    raiseTypeErrorException();
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) == 0)
  {
    __break(0xC471u);
    goto LABEL_17;
  }
  WebCore::Element::setAttributeNode(internal, newAttr->super.super._internal);
  if (v13)
  {
    if (v13 == 1)
    {
      v15[0] = (_BYTE)v11;
      v10 = v12;
      v12 = 0;
      v16 = v10;
      raiseDOMErrorException();
    }
    std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
LABEL_17:
    JUMPOUT(0x1D7FF9C14);
  }
  v6 = v11;
  v11 = 0;
  v8 = (DOMAttr *)kit(v6);
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
  if (v13 != -1)
    ((void (*)(_BYTE *, WebCore::Node **))off_1E9D6AE08[v13])(v15, &v11);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v7);
  return v8;
}

- (DOMAttr)removeAttributeNode:(DOMAttr *)oldAttr
{
  DOMObjectInternal *internal;
  WebCore::Node *v6;
  void *v7;
  DOMAttr *v8;
  uint64_t v10;
  WebCore::Node *v11;
  uint64_t v12;
  int v13;
  WebCore::Node *v14;
  _BYTE v15[80];
  _BYTE v16[8];
  uint64_t v17;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  if (!oldAttr)
    raiseTypeErrorException();
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) == 0)
  {
    __break(0xC471u);
    goto LABEL_17;
  }
  WebCore::Element::removeAttributeNode(internal, oldAttr->super.super._internal);
  if (v13)
  {
    if (v13 == 1)
    {
      v16[0] = (_BYTE)v11;
      v10 = v12;
      v12 = 0;
      v17 = v10;
      raiseDOMErrorException();
    }
    std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
LABEL_17:
    JUMPOUT(0x1D7FF9DF0);
  }
  v6 = v11;
  v11 = 0;
  v14 = v6;
  v8 = (DOMAttr *)kit(v6);
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
  if (v13 != -1)
    ((void (*)(_BYTE *, WebCore::Node **))off_1E9D6AD68[v13])(v16, &v11);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v7);
  return v8;
}

- (DOMNodeList)getElementsByTagName:(NSString *)name
{
  DOMNodeList *v3;
  const __CFString *v5;
  StringImpl *v6;
  void *v7;
  DOMNodeList *result;
  WTF::StringImpl *v9;
  DOMObjectInternal *v10;
  _BYTE v11[80];
  WTF::StringImpl *v12;

  v3 = (DOMNodeList *)name;
  if (!name)
    return v3;
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  if ((*((_WORD *)self->super.super._internal + 14) & 8) != 0)
  {
    WTF::AtomStringImpl::add((WTF::AtomStringImpl *)v3, v5);
    v9 = v12;
    WebCore::ContainerNode::getElementsByTagName();
    if (v9)
    {
      if (*(_DWORD *)v9 == 2)
        WTF::StringImpl::destroy(v9, v6);
      else
        *(_DWORD *)v9 -= 2;
    }
    v3 = (DOMNodeList *)kit(v10);
    if (v10)
    {
      if (*((_DWORD *)v10 + 4) == 1)
        (*(void (**)())(*(_QWORD *)v10 + 8))();
      else
        --*((_DWORD *)v10 + 4);
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v7);
    return v3;
  }
  result = (DOMNodeList *)96;
  __break(0xC471u);
  return result;
}

- (NSString)getAttributeNS:(NSString *)namespaceURI localName:(NSString *)localName
{
  const __CFString *v7;
  const __CFString *v8;
  StringImpl *v9;
  const __CFString *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  NSString *result;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  _BYTE v16[80];
  WTF::StringImpl *v17;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16);
  if ((*((_WORD *)self->super.super._internal + 14) & 8) != 0)
  {
    WTF::AtomStringImpl::add((WTF::AtomStringImpl *)namespaceURI, v7);
    v15 = v17;
    WTF::AtomStringImpl::add((WTF::AtomStringImpl *)localName, v8);
    v14 = v17;
    if (*(_QWORD *)WebCore::Element::getAttributeNS())
    {
      v10 = (const __CFString *)WTF::StringImpl::operator NSString *();
      v11 = v14;
      if (!v14)
        goto LABEL_8;
    }
    else
    {
      v10 = &stru_1E9D6EC48;
      v11 = v14;
      if (!v14)
        goto LABEL_8;
    }
    if (*(_DWORD *)v11 == 2)
    {
      WTF::StringImpl::destroy(v11, v9);
      v12 = v15;
      if (!v15)
      {
LABEL_14:
        WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16, v9);
        return &v10->isa;
      }
LABEL_11:
      if (*(_DWORD *)v12 == 2)
        WTF::StringImpl::destroy(v12, v9);
      else
        *(_DWORD *)v12 -= 2;
      goto LABEL_14;
    }
    *(_DWORD *)v11 -= 2;
LABEL_8:
    v12 = v15;
    if (!v15)
      goto LABEL_14;
    goto LABEL_11;
  }
  result = (NSString *)96;
  __break(0xC471u);
  return result;
}

- (void)setAttributeNS:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName value:(NSString *)value
{
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  StringImpl *v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  WTF::StringImpl *v17;
  char v18;
  uint64_t v19;
  char v20;
  _BYTE v21[80];
  WTF::StringImpl *v22;
  uint64_t v23;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v21);
  if ((*((_WORD *)self->super.super._internal + 14) & 8) == 0)
  {
    __break(0xC471u);
    JUMPOUT(0x1D7FFA364);
  }
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)namespaceURI, v9);
  v17 = v22;
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)qualifiedName, v10);
  v16 = v22;
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)value, v11);
  v15 = v22;
  WebCore::Element::setAttributeNS();
  if (v20)
  {
    LOBYTE(v22) = v18;
    v23 = v19;
    raiseDOMErrorException();
  }
  if (!v15)
  {
LABEL_6:
    v13 = v16;
    if (!v16)
      goto LABEL_11;
    goto LABEL_9;
  }
  if (*(_DWORD *)v15 != 2)
  {
    *(_DWORD *)v15 -= 2;
    goto LABEL_6;
  }
  WTF::StringImpl::destroy(v15, v12);
  v13 = v16;
  if (!v16)
    goto LABEL_11;
LABEL_9:
  if (*(_DWORD *)v13 == 2)
  {
    WTF::StringImpl::destroy(v13, v12);
    v14 = v17;
    if (!v17)
      goto LABEL_17;
    goto LABEL_14;
  }
  *(_DWORD *)v13 -= 2;
LABEL_11:
  v14 = v17;
  if (!v17)
    goto LABEL_17;
LABEL_14:
  if (*(_DWORD *)v14 == 2)
    WTF::StringImpl::destroy(v14, v12);
  else
    *(_DWORD *)v14 -= 2;
LABEL_17:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v21, v12);
}

- (void)removeAttributeNS:(NSString *)namespaceURI localName:(NSString *)localName
{
  const __CFString *v7;
  const __CFString *v8;
  StringImpl *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  _BYTE v13[80];
  WTF::StringImpl *v14;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  if ((*((_WORD *)self->super.super._internal + 14) & 8) != 0)
  {
    WTF::AtomStringImpl::add((WTF::AtomStringImpl *)namespaceURI, v7);
    v12 = v14;
    WTF::AtomStringImpl::add((WTF::AtomStringImpl *)localName, v8);
    v11 = v14;
    WebCore::Element::removeAttributeNS();
    if (v11)
    {
      if (*(_DWORD *)v11 == 2)
      {
        WTF::StringImpl::destroy(v11, v9);
        v10 = v12;
        if (!v12)
        {
LABEL_11:
          WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v9);
          return;
        }
LABEL_8:
        if (*(_DWORD *)v10 == 2)
          WTF::StringImpl::destroy(v10, v9);
        else
          *(_DWORD *)v10 -= 2;
        goto LABEL_11;
      }
      *(_DWORD *)v11 -= 2;
    }
    v10 = v12;
    if (!v12)
      goto LABEL_11;
    goto LABEL_8;
  }
  __break(0xC471u);
}

- (DOMNodeList)getElementsByTagNameNS:(NSString *)namespaceURI localName:(NSString *)localName
{
  DOMNodeList *v4;
  const __CFString *v7;
  const __CFString *v8;
  StringImpl *v9;
  WTF::StringImpl *v10;
  void *v11;
  DOMNodeList *result;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  DOMObjectInternal *v15;
  _BYTE v16[80];
  WTF::StringImpl *v17;

  v4 = (DOMNodeList *)localName;
  if (!localName)
    return v4;
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16);
  if ((*((_WORD *)self->super.super._internal + 14) & 8) != 0)
  {
    WTF::AtomStringImpl::add((WTF::AtomStringImpl *)namespaceURI, v7);
    v14 = v17;
    WTF::AtomStringImpl::add((WTF::AtomStringImpl *)v4, v8);
    v13 = v17;
    WebCore::ContainerNode::getElementsByTagNameNS();
    if (v13)
    {
      if (*(_DWORD *)v13 == 2)
      {
        WTF::StringImpl::destroy(v13, v9);
        v10 = v14;
        if (!v14)
        {
LABEL_12:
          v4 = (DOMNodeList *)kit(v15);
          if (v15)
          {
            if (*((_DWORD *)v15 + 4) == 1)
              (*(void (**)())(*(_QWORD *)v15 + 8))();
            else
              --*((_DWORD *)v15 + 4);
          }
          WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16, v11);
          return v4;
        }
LABEL_9:
        if (*(_DWORD *)v10 == 2)
          WTF::StringImpl::destroy(v10, v9);
        else
          *(_DWORD *)v10 -= 2;
        goto LABEL_12;
      }
      *(_DWORD *)v13 -= 2;
    }
    v10 = v14;
    if (!v14)
      goto LABEL_12;
    goto LABEL_9;
  }
  result = (DOMNodeList *)96;
  __break(0xC471u);
  return result;
}

- (DOMAttr)getAttributeNodeNS:(NSString *)namespaceURI localName:(NSString *)localName
{
  const __CFString *v7;
  const __CFString *v8;
  StringImpl *v9;
  DOMAttr *v10;
  WTF::StringImpl *v11;
  DOMAttr *result;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  WebCore::Node *v15;
  _BYTE v16[80];
  WTF::StringImpl *v17;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16);
  if ((*((_WORD *)self->super.super._internal + 14) & 8) != 0)
  {
    WTF::AtomStringImpl::add((WTF::AtomStringImpl *)namespaceURI, v7);
    v14 = v17;
    WTF::AtomStringImpl::add((WTF::AtomStringImpl *)localName, v8);
    v13 = v17;
    WebCore::Element::getAttributeNodeNS();
    v10 = (DOMAttr *)kit(v15);
    if (v15)
    {
      if (*((_DWORD *)v15 + 6) == 2)
      {
        if ((*((_WORD *)v15 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v15);
      }
      else
      {
        *((_DWORD *)v15 + 6) -= 2;
      }
    }
    if (v13)
    {
      if (*(_DWORD *)v13 == 2)
      {
        WTF::StringImpl::destroy(v13, v9);
        v11 = v14;
        if (!v14)
        {
LABEL_16:
          WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16, v9);
          return v10;
        }
LABEL_13:
        if (*(_DWORD *)v11 == 2)
          WTF::StringImpl::destroy(v11, v9);
        else
          *(_DWORD *)v11 -= 2;
        goto LABEL_16;
      }
      *(_DWORD *)v13 -= 2;
    }
    v11 = v14;
    if (!v14)
      goto LABEL_16;
    goto LABEL_13;
  }
  result = (DOMAttr *)96;
  __break(0xC471u);
  return result;
}

- (DOMAttr)setAttributeNodeNS:(DOMAttr *)newAttr
{
  DOMObjectInternal *internal;
  WebCore::Node *v6;
  void *v7;
  DOMAttr *v8;
  uint64_t v10;
  WebCore::Node *v11;
  uint64_t v12;
  int v13;
  _BYTE v14[80];
  _BYTE v15[8];
  uint64_t v16;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14);
  if (!newAttr)
    raiseTypeErrorException();
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) == 0)
  {
    __break(0xC471u);
    goto LABEL_17;
  }
  WebCore::Element::setAttributeNodeNS(internal, newAttr->super.super._internal);
  if (v13)
  {
    if (v13 == 1)
    {
      v15[0] = (_BYTE)v11;
      v10 = v12;
      v12 = 0;
      v16 = v10;
      raiseDOMErrorException();
    }
    std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
LABEL_17:
    JUMPOUT(0x1D7FFAAECLL);
  }
  v6 = v11;
  v11 = 0;
  v8 = (DOMAttr *)kit(v6);
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
  if (v13 != -1)
    ((void (*)(_BYTE *, WebCore::Node **))off_1E9D6AE08[v13])(v15, &v11);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v7);
  return v8;
}

- (BOOL)hasAttribute:(NSString *)name
{
  const __CFString *v5;
  StringImpl *v6;
  char hasAttribute;
  BOOL result;
  WTF::StringImpl *v9;
  _BYTE v10[80];
  WTF::StringImpl *v11;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  if ((*((_WORD *)self->super.super._internal + 14) & 8) != 0)
  {
    WTF::AtomStringImpl::add((WTF::AtomStringImpl *)name, v5);
    v9 = v11;
    hasAttribute = WebCore::Element::hasAttribute();
    if (v9)
    {
      if (*(_DWORD *)v9 == 2)
        WTF::StringImpl::destroy(v9, v6);
      else
        *(_DWORD *)v9 -= 2;
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v6);
    return hasAttribute;
  }
  else
  {
    result = 96;
    __break(0xC471u);
  }
  return result;
}

- (BOOL)hasAttributeNS:(NSString *)namespaceURI localName:(NSString *)localName
{
  const __CFString *v7;
  const __CFString *v8;
  StringImpl *v9;
  char hasAttributeNS;
  WTF::StringImpl *v11;
  BOOL result;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  _BYTE v15[80];
  WTF::StringImpl *v16;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  if ((*((_WORD *)self->super.super._internal + 14) & 8) != 0)
  {
    WTF::AtomStringImpl::add((WTF::AtomStringImpl *)namespaceURI, v7);
    v14 = v16;
    WTF::AtomStringImpl::add((WTF::AtomStringImpl *)localName, v8);
    v13 = v16;
    hasAttributeNS = WebCore::Element::hasAttributeNS();
    if (v13)
    {
      if (*(_DWORD *)v13 == 2)
      {
        WTF::StringImpl::destroy(v13, v9);
        v11 = v14;
        if (!v14)
        {
LABEL_11:
          WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v9);
          return hasAttributeNS;
        }
LABEL_8:
        if (*(_DWORD *)v11 == 2)
          WTF::StringImpl::destroy(v11, v9);
        else
          *(_DWORD *)v11 -= 2;
        goto LABEL_11;
      }
      *(_DWORD *)v13 -= 2;
    }
    v11 = v14;
    if (!v14)
      goto LABEL_11;
    goto LABEL_8;
  }
  result = 96;
  __break(0xC471u);
  return result;
}

- (void)focus
{
  DOMObjectInternal *internal;
  void *v4;
  int v5;
  __int16 v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) != 0)
  {
    v6 = 0;
    v5 = 0;
    (*(void (**)(DOMObjectInternal *, int *))(*(_QWORD *)internal + 656))(internal, &v5);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v4);
  }
  else
  {
    __break(0xC471u);
  }
}

- (void)blur
{
  DOMObjectInternal *internal;
  void *v4;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) != 0)
  {
    (*(void (**)(DOMObjectInternal *))(*(_QWORD *)internal + 688))(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
  }
  else
  {
    __break(0xC471u);
  }
}

- (void)scrollIntoView:(BOOL)alignWithTop
{
  DOMObjectInternal *internal;
  void *v5;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) != 0)
  {
    WebCore::Element::scrollIntoView(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v5);
  }
  else
  {
    __break(0xC471u);
  }
}

- (void)scrollIntoViewIfNeeded:(BOOL)centerIfNeeded
{
  DOMObjectInternal *internal;
  void *v5;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) != 0)
  {
    WebCore::Element::scrollIntoViewIfNeeded(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v5);
  }
  else
  {
    __break(0xC471u);
  }
}

- (DOMNodeList)getElementsByClassName:(NSString *)name
{
  const __CFString *v5;
  StringImpl *v6;
  void *v7;
  DOMNodeList *v8;
  DOMNodeList *result;
  WTF::StringImpl *v10;
  DOMObjectInternal *v11;
  _BYTE v12[80];
  WTF::StringImpl *v13;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  if ((*((_WORD *)self->super.super._internal + 14) & 8) != 0)
  {
    WTF::AtomStringImpl::add((WTF::AtomStringImpl *)name, v5);
    v10 = v13;
    WebCore::ContainerNode::getElementsByClassName();
    if (v10)
    {
      if (*(_DWORD *)v10 == 2)
        WTF::StringImpl::destroy(v10, v6);
      else
        *(_DWORD *)v10 -= 2;
    }
    v8 = (DOMNodeList *)kit(v11);
    if (v11)
    {
      if (*((_DWORD *)v11 + 4) == 1)
        (*(void (**)())(*(_QWORD *)v11 + 8))();
      else
        --*((_DWORD *)v11 + 4);
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v7);
    return v8;
  }
  else
  {
    result = (DOMNodeList *)96;
    __break(0xC471u);
  }
  return result;
}

- (BOOL)matches:(id)a3
{
  DOMObjectInternal *internal;
  StringImpl *v6;
  int v7;
  WTF::StringImpl *v8;
  uint64_t v10;
  WTF::StringImpl *v11;
  unsigned __int8 v12;
  uint64_t v13;
  int v14;
  _BYTE v15[88];
  uint64_t v16;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) == 0)
  {
    __break(0xC471u);
    goto LABEL_12;
  }
  MEMORY[0x1D82A3998](&v11, a3);
  WebCore::Element::matches(internal, (const WTF::String *)&v11);
  if (v14)
  {
    if (v14 == 1)
    {
      v15[80] = v12;
      v10 = v13;
      v13 = 0;
      v16 = v10;
      raiseDOMErrorException();
    }
    std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
LABEL_12:
    JUMPOUT(0x1D7FFB304);
  }
  v7 = v12;
  v14 = -1;
  v8 = v11;
  v11 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy(v8, v6);
    else
      *(_DWORD *)v8 -= 2;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v6);
  return v7 != 0;
}

- (id)closest:(id)a3
{
  DOMObjectInternal *internal;
  StringImpl *v6;
  WebCore::Node *v7;
  WTF::StringImpl *v8;
  uint64_t v10;
  WTF::StringImpl *v11;
  WebCore::Node *v12;
  uint64_t v13;
  int v14;
  _BYTE v15[80];
  _BYTE v16[8];
  uint64_t v17;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) == 0)
  {
    __break(0xC471u);
    goto LABEL_14;
  }
  MEMORY[0x1D82A3998](&v11, a3);
  WebCore::Element::closest(internal, (const WTF::String *)&v11);
  if (v14)
  {
    if (v14 == 1)
    {
      v16[0] = (_BYTE)v12;
      v10 = v13;
      v13 = 0;
      v17 = v10;
      raiseDOMErrorException();
    }
    std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
LABEL_14:
    JUMPOUT(0x1D7FFB4D8);
  }
  v7 = kit(v12);
  if (v14 != -1)
    ((void (*)(_BYTE *, WebCore::Node **))off_1E9D6ADD8[v14])(v16, &v12);
  v14 = -1;
  v8 = v11;
  v11 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy(v8, v6);
    else
      *(_DWORD *)v8 -= 2;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v6);
  return v7;
}

- (BOOL)webkitMatchesSelector:(id)a3
{
  DOMObjectInternal *internal;
  StringImpl *v6;
  int v7;
  WTF::StringImpl *v8;
  uint64_t v10;
  WTF::StringImpl *v11;
  unsigned __int8 v12;
  uint64_t v13;
  int v14;
  _BYTE v15[88];
  uint64_t v16;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) == 0)
  {
    __break(0xC471u);
    goto LABEL_12;
  }
  MEMORY[0x1D82A3998](&v11, a3);
  WebCore::Element::matches(internal, (const WTF::String *)&v11);
  if (v14)
  {
    if (v14 == 1)
    {
      v15[80] = v12;
      v10 = v13;
      v13 = 0;
      v16 = v10;
      raiseDOMErrorException();
    }
    std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
LABEL_12:
    JUMPOUT(0x1D7FFB688);
  }
  v7 = v12;
  v14 = -1;
  v8 = v11;
  v11 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy(v8, v6);
    else
      *(_DWORD *)v8 -= 2;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v6);
  return v7 != 0;
}

- (void)webkitRequestFullScreen:(unsigned __int16)flags
{
  DOMObjectInternal *internal;
  void *v5;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) != 0)
  {
    WebCore::Element::webkitRequestFullscreen(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v5);
  }
  else
  {
    __break(0xC471u);
  }
}

- (void)webkitRequestFullscreen
{
  DOMObjectInternal *internal;
  void *v4;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) != 0)
  {
    WebCore::Element::webkitRequestFullscreen(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
  }
  else
  {
    __break(0xC471u);
  }
}

- (void)remove
{
  DOMObjectInternal *internal;
  void *v4;
  char v5;
  uint64_t v6;
  char v7;
  _BYTE v8[88];
  uint64_t v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) == 0)
  {
    __break(0xC471u);
    JUMPOUT(0x1D7FFB8E4);
  }
  WebCore::Node::remove(internal);
  if (v7)
  {
    v8[80] = v5;
    v9 = v6;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
}

- (DOMElement)querySelector:(NSString *)selectors
{
  DOMObjectInternal *internal;
  StringImpl *v6;
  DOMElement *v7;
  WTF::StringImpl *v8;
  uint64_t v10;
  WTF::StringImpl *v11;
  WebCore::Node *v12;
  uint64_t v13;
  int v14;
  _BYTE v15[80];
  _BYTE v16[8];
  uint64_t v17;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) == 0)
  {
    __break(0xC471u);
    goto LABEL_14;
  }
  MEMORY[0x1D82A3998](&v11, selectors);
  WebCore::ContainerNode::querySelector(internal, (const WTF::String *)&v11);
  if (v14)
  {
    if (v14 == 1)
    {
      v16[0] = (_BYTE)v12;
      v10 = v13;
      v13 = 0;
      v17 = v10;
      raiseDOMErrorException();
    }
    std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
LABEL_14:
    JUMPOUT(0x1D7FFBA44);
  }
  v7 = (DOMElement *)kit(v12);
  if (v14 != -1)
    ((void (*)(_BYTE *, WebCore::Node **))off_1E9D6ADD8[v14])(v16, &v12);
  v14 = -1;
  v8 = v11;
  v11 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy(v8, v6);
    else
      *(_DWORD *)v8 -= 2;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v6);
  return v7;
}

- (DOMNodeList)querySelectorAll:(NSString *)selectors
{
  DOMObjectInternal *internal;
  DOMObjectInternal *v6;
  StringImpl *v7;
  DOMNodeList *v8;
  uint64_t v9;
  WTF::StringImpl *v10;
  uint64_t v12;
  WTF::StringImpl *v13;
  DOMObjectInternal *v14;
  uint64_t v15;
  unsigned int v16;
  _BYTE v17[80];
  char v18[8];
  uint64_t v19;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 14) & 8) == 0)
  {
    __break(0xC471u);
    goto LABEL_19;
  }
  MEMORY[0x1D82A3998](&v13, selectors);
  WebCore::ContainerNode::querySelectorAll(internal, (const WTF::String *)&v13);
  if (v16)
  {
    if (v16 == 1)
    {
      v18[0] = (char)v14;
      v12 = v15;
      v15 = 0;
      v19 = v12;
      raiseDOMErrorException();
    }
    std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
LABEL_19:
    JUMPOUT(0x1D7FFBC54);
  }
  v6 = v14;
  v14 = 0;
  v8 = (DOMNodeList *)kit(v6);
  if (!v6)
    goto LABEL_6;
  if (*((_DWORD *)v6 + 4) != 1)
  {
    --*((_DWORD *)v6 + 4);
LABEL_6:
    v9 = v16;
    if (v16 == -1)
      goto LABEL_8;
    goto LABEL_7;
  }
  (*(void (**)(DOMObjectInternal *))(*(_QWORD *)v6 + 8))(v6);
  v9 = v16;
  if (v16 != -1)
LABEL_7:
    ((void (*)(char *, DOMObjectInternal **))off_1E9D6ADE8[v9])(v18, &v14);
LABEL_8:
  v16 = -1;
  v10 = v13;
  v13 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy(v10, v7);
    else
      *(_DWORD *)v10 -= 2;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17, v7);
  return v8;
}

- (int)structuralComplexityContribution
{
  return 0;
}

+ (id)_DOMElementFromJSContext:(OpaqueJSContext *)a3 value:(OpaqueJSValue *)a4
{
  WebCore::Node *v4;
  WebCore::Node *v5;
  _BYTE v7[8];

  v4 = 0;
  if (a3 && a4)
  {
    JSC::JSLockHolder::JSLockHolder();
    v5 = (WebCore::Node *)WebCore::JSElement::toWrapped();
    v4 = kit(v5);
    MEMORY[0x1D82A33C8](v7);
  }
  return v4;
}

@end
