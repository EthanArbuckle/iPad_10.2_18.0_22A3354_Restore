@implementation DOMNode

- (NSString)description
{
  NSString *v3;
  void *v4;
  uint64_t v5;
  NSString *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (!self->super._internal)
    return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: null>"), objc_msgSend((id)objc_opt_class(), "description"), v8, v9, v10);
  v3 = -[DOMNode nodeValue](self, "nodeValue");
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_msgSend((id)objc_opt_class(), "description");
  v6 = -[DOMNode nodeName](self, "nodeName");
  if (v3)
    return (NSString *)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ [%@]: %p '%@'>"), v5, v6, self->super._internal, v3);
  else
    return (NSString *)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ [%@]: %p>"), v5, v6, self->super._internal, v10);
}

- (RootObject)_rootObject
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)self->super._internal + 5) + 8) + 528);
  if (v2 && (v3 = *(_QWORD *)(v2 + 8)) != 0)
    return (RootObject *)WebCore::ScriptController::bindingRootObject(*(WebCore::ScriptController **)(v3 + 304));
  else
    return 0;
}

- (NSRect)boundingBox
{
  DOMObjectInternal *internal;
  WebCore::RenderObject *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  NSRect result;

  internal = self->super._internal;
  WebCore::Document::updateLayout();
  v3 = (WebCore::RenderObject *)(*((_QWORD *)internal + 8) & 0xFFFFFFFFFFFFLL);
  if (v3)
  {
    WebCore::RenderObject::absoluteBoundingBoxRect(v3, 1, 0);
    WebCore::IntRect::operator CGRect();
  }
  else
  {
    v4 = *MEMORY[0x1E0C9D648];
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (_WKQuad)absoluteQuad
{
  if (self)
    return (_WKQuad *)-[_WKQuad absoluteQuadAndInsideFixedPosition:](self, "absoluteQuadAndInsideFixedPosition:", 0);
  retstr->p3 = 0u;
  retstr->p4 = 0u;
  retstr->p1 = 0u;
  retstr->p2 = 0u;
  return self;
}

- (_WKQuad)absoluteQuadAndInsideFixedPosition:(SEL)a3
{
  DOMObjectInternal *internal;
  _WKQuad *result;
  void *v8;
  CGPoint v9;
  CGPoint v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  BOOL v25;
  WTF *v26;
  uint64_t v27;

  internal = self->super._internal;
  WebCore::Document::updateLayout();
  result = (_WKQuad *)(*((_QWORD *)internal + 8) & 0xFFFFFFFFFFFFLL);
  if (result)
  {
    v26 = 0;
    v27 = 0;
    v25 = 0;
    (*(void (**)(_WKQuad *, WTF **, BOOL *))(*(_QWORD *)&result->p1.x + 392))(result, &v26, &v25);
    if (a4)
      *a4 = v25;
    if (HIDWORD(v27) == 1)
    {
      WebCore::FloatPoint::operator CGPoint();
      retstr->p1.x = v11;
      retstr->p1.y = v12;
      WebCore::FloatPoint::operator CGPoint();
      retstr->p2.x = v13;
      retstr->p2.y = v14;
      WebCore::FloatPoint::operator CGPoint();
      retstr->p3.x = v15;
      retstr->p3.y = v16;
      WebCore::FloatPoint::operator CGPoint();
    }
    else
    {
      if (!HIDWORD(v27))
      {
        v9 = (CGPoint)*MEMORY[0x1E0C9D538];
        retstr->p1 = (CGPoint)*MEMORY[0x1E0C9D538];
        retstr->p2 = v9;
        retstr->p3 = v9;
        retstr->p4 = v9;
        result = (_WKQuad *)v26;
        if (!v26)
          return result;
LABEL_14:
        v26 = 0;
        LODWORD(v27) = 0;
        return (_WKQuad *)WTF::fastFree((WTF *)result, v8);
      }
      WebCore::unitedBoundingBoxes();
      WebCore::FloatPoint::operator CGPoint();
      retstr->p1.x = v19;
      retstr->p1.y = v20;
      WebCore::FloatPoint::operator CGPoint();
      retstr->p2.x = v21;
      retstr->p2.y = v22;
      WebCore::FloatPoint::operator CGPoint();
      retstr->p3.x = v23;
      retstr->p3.y = v24;
      WebCore::FloatPoint::operator CGPoint();
    }
    retstr->p4.x = v17;
    retstr->p4.y = v18;
    result = (_WKQuad *)v26;
    if (v26)
      goto LABEL_14;
  }
  else
  {
    if (a4)
      *a4 = 0;
    v10 = (CGPoint)*MEMORY[0x1E0C9D538];
    retstr->p1 = (CGPoint)*MEMORY[0x1E0C9D538];
    retstr->p2 = v10;
    retstr->p3 = v10;
    retstr->p4 = v10;
  }
  return result;
}

- (CGRect)boundingBoxUsingTransforms
{
  DOMObjectInternal *internal;
  WebCore::RenderObject *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  internal = self->super._internal;
  WebCore::Document::updateLayout();
  v3 = (WebCore::RenderObject *)(*((_QWORD *)internal + 8) & 0xFFFFFFFFFFFFLL);
  if (v3)
  {
    WebCore::RenderObject::absoluteBoundingBoxRect(v3, 1, 0);
    WebCore::IntRect::operator CGRect();
  }
  else
  {
    v4 = *MEMORY[0x1E0C9D648];
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)lineBoxQuads
{
  DOMObjectInternal *internal;
  uint64_t v3;
  id v4;
  void *v5;
  WTF *v6;
  WTF *v7;
  WKQuadObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  WKQuadObject *v18;
  void *v19;
  CFTypeRef v20;
  WTF *v21;
  WTF *v23;
  uint64_t v24;
  _QWORD v25[8];

  internal = self->super._internal;
  WebCore::Document::updateLayout();
  v3 = *((_QWORD *)internal + 8) & 0xFFFFFFFFFFFFLL;
  if (!v3)
    return 0;
  v23 = 0;
  v24 = 0;
  (*(void (**)(uint64_t, WTF **, _QWORD))(*(_QWORD *)v3 + 392))(v3, &v23, 0);
  v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v5 = (void *)objc_msgSend(v4, "initWithCapacity:", HIDWORD(v24));
  if (HIDWORD(v24))
  {
    v6 = v23;
    v7 = (WTF *)((char *)v23 + 32 * HIDWORD(v24));
    do
    {
      v8 = [WKQuadObject alloc];
      WebCore::FloatPoint::operator CGPoint();
      v25[0] = v9;
      v25[1] = v10;
      WebCore::FloatPoint::operator CGPoint();
      v25[2] = v11;
      v25[3] = v12;
      WebCore::FloatPoint::operator CGPoint();
      v25[4] = v13;
      v25[5] = v14;
      v15 = (char *)v6 + 24;
      WebCore::FloatPoint::operator CGPoint();
      v25[6] = v16;
      v25[7] = v17;
      v18 = -[WKQuadObject initWithQuad:](v8, "initWithQuad:", v25);
      if (v18)
      {
        objc_msgSend(v5, "addObject:", v18);
        CFRelease(v18);
      }
      v6 = (WTF *)(v15 + 8);
    }
    while (v6 != v7);
  }
  v20 = (id)CFMakeCollectable(v5);
  v21 = v23;
  if (v23)
  {
    v23 = 0;
    LODWORD(v24) = 0;
    WTF::fastFree(v21, v19);
  }
  return (id)v20;
}

- (void)_linkElement
{
  if (self)
  {
    for (self = (void *)*((_QWORD *)self + 2); self; self = (void *)*((_QWORD *)self + 4))
    {
      if ((*((_WORD *)self + 14) & 8) != 0 && (*((_WORD *)self + 15) & 1) != 0)
        break;
    }
  }
  return self;
}

- (id)hrefURL
{
  StringImpl *v2;
  void *v3;
  WTF::StringImpl *v5;

  if (!-[DOMNode _linkElement](self, "_linkElement"))
    return 0;
  WebCore::Element::getAttribute();
  WebCore::Document::completeURL();
  v3 = (void *)WTF::URL::operator NSURL *();
  if (!v5)
    return v3;
  if (*(_DWORD *)v5 != 2)
  {
    *(_DWORD *)v5 -= 2;
    return v3;
  }
  WTF::StringImpl::destroy(v5, v2);
  return v3;
}

- (id)hrefTarget
{
  id result;

  result = -[DOMNode _linkElement](self, "_linkElement");
  if (result)
  {
    if (*(_QWORD *)WebCore::Element::getAttribute())
      return (id)WTF::StringImpl::operator NSString *();
    else
      return &stru_1E9D6EC48;
  }
  return result;
}

- (CGRect)hrefFrame
{
  _QWORD *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  WebCore::RenderObject *v7;
  CGRect result;

  v2 = -[DOMNode _linkElement](self, "_linkElement");
  if (v2 && (v7 = (WebCore::RenderObject *)(v2[8] & 0xFFFFFFFFFFFFLL)) != 0)
  {
    if ((*((_BYTE *)v7 + 45) & 2) != 0)
    {
      __break(0xC471u);
    }
    else
    {
      WebCore::RenderObject::absoluteBoundingBoxRect(v7, 1, 0);
      WebCore::IntRect::operator CGRect();
    }
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D648];
    v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)hrefLabel
{
  WebCore::Node *v2;
  StringImpl *v3;
  void *v4;
  WTF::StringImpl *v6;

  v2 = -[DOMNode _linkElement](self, "_linkElement");
  if (!v2)
    return 0;
  WebCore::Node::textContent(v2);
  if (!v6)
    return &stru_1E9D6EC48;
  v4 = (void *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v6 == 2)
  {
    WTF::StringImpl::destroy(v6, v3);
    return v4;
  }
  else
  {
    *(_DWORD *)v6 -= 2;
    return v4;
  }
}

- (id)hrefTitle
{
  _WORD *v2;
  const __CFString *v3;
  WebCore::Document *v5;
  StringImpl *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;

  v2 = -[DOMNode _linkElement](self, "_linkElement");
  if (!v2 || (v2[14] & 0x10) == 0)
    return 0;
  v5 = *(WebCore::Document **)(*((_QWORD *)v2 + 5) + 8);
  WebCore::HTMLElement::title((WebCore::HTMLElement *)v2);
  WebCore::Document::displayStringModifiedByEncoding(v5, (const WTF::String *)&v9);
  if (v10)
  {
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
    v7 = v10;
    v10 = 0;
    if (v7)
    {
      if (*(_DWORD *)v7 == 2)
      {
        WTF::StringImpl::destroy(v7, v6);
        v8 = v9;
        v9 = 0;
        if (!v8)
          return (id)v3;
      }
      else
      {
        *(_DWORD *)v7 -= 2;
        v8 = v9;
        v9 = 0;
        if (!v8)
          return (id)v3;
      }
      goto LABEL_12;
    }
  }
  else
  {
    v10 = 0;
    v3 = &stru_1E9D6EC48;
  }
  v8 = v9;
  v9 = 0;
  if (!v8)
    return (id)v3;
LABEL_12:
  if (*(_DWORD *)v8 == 2)
    WTF::StringImpl::destroy(v8, v6);
  else
    *(_DWORD *)v8 -= 2;
  return (id)v3;
}

- (_WKQuad)innerFrameQuad
{
  DOMObjectInternal *internal;
  _WKQuad *result;
  CGPoint v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;

  internal = self->super._internal;
  WebCore::Document::updateLayout();
  result = (_WKQuad *)(*((_QWORD *)internal + 8) & 0xFFFFFFFFFFFFLL);
  if (result)
  {
    WebCore::RenderObject::absoluteBoundingBoxRect((WebCore::RenderObject *)result, 1, 0);
    WebCore::FloatRect::FloatRect();
    WebCore::FloatPoint::operator CGPoint();
    retstr->p1.x = v7;
    retstr->p1.y = v8;
    WebCore::FloatPoint::operator CGPoint();
    retstr->p2.x = v9;
    retstr->p2.y = v10;
    WebCore::FloatPoint::operator CGPoint();
    retstr->p3.x = v11;
    retstr->p3.y = v12;
    result = (_WKQuad *)WebCore::FloatPoint::operator CGPoint();
    retstr->p4.x = v13;
    retstr->p4.y = v14;
  }
  else
  {
    v6 = (CGPoint)*MEMORY[0x1E0C9D538];
    retstr->p1 = (CGPoint)*MEMORY[0x1E0C9D538];
    retstr->p2 = v6;
    retstr->p3 = v6;
    retstr->p4 = v6;
  }
  return result;
}

- (float)computedFontSize
{
  uint64_t v2;

  v2 = *((_QWORD *)self->super._internal + 8) & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return 0.0;
  if ((*(_BYTE *)((*((_QWORD *)self->super._internal + 8) & 0xFFFFFFFFFFFFLL) + 0x2D) & 2) != 0)
  {
    v2 = *(_QWORD *)((*((_QWORD *)self->super._internal + 8) & 0xFFFFFFFFFFFFLL) + 0x20);
    if (v2)
      v2 = *(_QWORD *)(v2 + 8);
  }
  return *(float *)(WebCore::RenderStyle::fontDescription((WebCore::RenderStyle *)(v2 + 80)) + 156);
}

- (id)nextFocusNode
{
  DOMObjectInternal *internal;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  WebCore::Node *FocusableElement;

  internal = self->super._internal;
  v3 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)internal + 5) + 8) + 528);
  if (!v3)
    return 0;
  v4 = *(_QWORD *)(v3 + 8);
  if (!v4)
    return 0;
  v5 = *(_QWORD *)(v4 + 24);
  if (!v5)
    return 0;
  v6 = *(_QWORD *)(v5 + 8);
  if (!v6)
    return 0;
  FocusableElement = (WebCore::Node *)WebCore::FocusController::nextFocusableElement(*(WebCore::FocusController **)(v6 + 72), (Node *)internal);
  return kit(FocusableElement);
}

- (id)previousFocusNode
{
  DOMObjectInternal *internal;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  WebCore::Node *v7;

  internal = self->super._internal;
  v3 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)internal + 5) + 8) + 528);
  if (!v3)
    return 0;
  v4 = *(_QWORD *)(v3 + 8);
  if (!v4)
    return 0;
  v5 = *(_QWORD *)(v4 + 24);
  if (!v5)
    return 0;
  v6 = *(_QWORD *)(v5 + 8);
  if (!v6)
    return 0;
  v7 = (WebCore::Node *)WebCore::FocusController::previousFocusableElement(*(WebCore::FocusController **)(v6 + 72), (Node *)internal);
  return kit(v7);
}

- (id)textRects
{
  DOMObjectInternal *internal;
  Node *v3;
  void *v4;
  WTF *v5;
  uint64_t v6;
  uint64_t NSArrayElement;
  void *v8;
  CFTypeRef v9;
  WebCore::Node *v11;
  WebCore::Node *v12;
  WTF *v13;
  unsigned int v14;

  internal = self->super._internal;
  WebCore::Document::updateLayout();
  if ((*((_QWORD *)internal + 8) & 0xFFFFFFFFFFFFLL) == 0)
    return 0;
  WebCore::makeRangeSelectingNodeContents(internal, v3);
  WebCore::RenderObject::absoluteTextRects();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v14);
  if (v14)
  {
    v5 = v13;
    v6 = 16 * v14;
    do
    {
      NSArrayElement = WebCore::makeNSArrayElement();
      if (NSArrayElement)
        objc_msgSend(v4, "addObject:", NSArrayElement);
      v5 = (WTF *)((char *)v5 + 16);
      v6 -= 16;
    }
    while (v6);
  }
  v9 = (id)CFMakeCollectable(v4);
  if (v13)
    WTF::fastFree(v13, v8);
  if (v12)
  {
    if (*((_DWORD *)v12 + 6) == 2)
    {
      if ((*((_WORD *)v12 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v12);
    }
    else
    {
      *((_DWORD *)v12 + 6) -= 2;
    }
  }
  if (!v11)
    return (id)v9;
  if (*((_DWORD *)v11 + 6) != 2)
  {
    *((_DWORD *)v11 + 6) -= 2;
    return (id)v9;
  }
  if ((*((_WORD *)v11 + 15) & 0x400) != 0)
    return (id)v9;
  WebCore::Node::removedLastRef(v11);
  return (id)v9;
}

+ (id)_nodeFromJSWrapper:(OpaqueJSValue *)a3
{
  if (*((unsigned __int8 *)a3 + 5) < 0xF0u)
    return 0;
  else
    return kit(*((WebCore::Node **)a3 + 3));
}

- (void)getPreviewSnapshotImage:(CGImage *)a3 andRects:(id *)a4
{
  DOMObjectInternal *internal;
  float v7;
  int32x2_t v8;
  WebCore::Node *v9;
  WebCore::Node *Ref;
  float32x2_t v11;
  uint64_t v12;
  CFTypeRef *v13;
  void *v14;
  void *v15;
  WebCore::Node *v16;
  uint64_t v17;
  float32x2_t v19;
  void *v20;
  uint64_t v21;
  float32x2_t v22;
  uint64_t v23;
  WebCore::Node *v24;
  uint64_t v25;
  float64_t v26;
  float64x2_t v27;
  const CGRect *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t NSArrayElement;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  int v37;
  uint64_t v38;
  WebCore::RenderBox *v39;
  unint64_t v40;
  const FloatRect *v41;
  __int128 v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  const FloatRect *v47;
  float32x2_t v48;
  unint64_t v49;
  WebCore::Node *v50;
  WTF *v51;
  void *v52;
  int32x2_t v53;
  float64x2_t v54;
  __int128 v55;
  float32x2_t *v56;
  __int128 v57;
  uint64_t v58;
  unint64_t v59;
  WebCore::Node *v60[2];
  WebCore::Node *v61;
  uint64_t v62;
  _QWORD v63[2];

  v63[1] = *MEMORY[0x1E0C80C00];
  if (!a3 || !a4)
    return;
  *a3 = 0;
  *a4 = 0;
  if (self)
    internal = self->super._internal;
  else
    internal = 0;
  v7 = *(float *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)internal + 5) + 8) + 528)
                                                    + 8)
                                        + 24)
                            + 8)
                + 356);
  WebCore::makeRangeSelectingNodeContents(internal, (Node *)a2);
  *(float *)v8.i32 = 4.0 / v7;
  v53 = v8;
  WebCore::TextIndicator::createWithRange();
  v9 = v61;
  v61 = 0;
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
  Ref = v60[0];
  v60[0] = 0;
  if (Ref)
  {
    if (*((_DWORD *)Ref + 6) == 2)
    {
      if ((*((_WORD *)Ref + 15) & 0x400) == 0)
        Ref = (WebCore::Node *)WebCore::Node::removedLastRef(Ref);
    }
    else
    {
      *((_DWORD *)Ref + 6) -= 2;
    }
  }
  if (v56)
  {
    v11 = v56[12];
    if (v11)
    {
      v12 = WebCore::DestinationColorSpace::SRGB(Ref);
      (*(void (**)(WebCore::Node **__return_ptr, float32x2_t, uint64_t))(**(_QWORD **)&v11 + 288))(v60, v11, v12);
      v13 = (CFTypeRef *)WebCore::NativeImage::platformImage(v60[0]);
      v15 = (void *)*v13;
      if (*v13)
        CFRetain(*v13);
      v16 = v60[0];
      v60[0] = 0;
      if (!v16)
      {
LABEL_44:
        if (v15)
          CFAutorelease(v15);
        *a3 = (CGImage *)v15;
        if (!v15)
          goto LABEL_47;
LABEL_24:
        v19 = v56[3];
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v56[8].u32[1]);
        v21 = v56[8].u32[1];
        if ((_DWORD)v21)
        {
          v22 = v56[7];
          v54 = vcvtq_f64_f32(v19);
          v23 = 16 * v21;
          do
          {
            WebCore::FloatRect::operator CGRect();
            v61 = v24;
            v62 = v25;
            v27.f64[1] = v26;
            *(float64x2_t *)v60 = vaddq_f64(v27, v54);
            *(_QWORD *)&v57 = WebCore::enclosingIntRect((WebCore *)v60, v28);
            *((_QWORD *)&v57 + 1) = v29;
            v58 = WebCore::ScrollView::contentsToWindow();
            v59 = v30;
            NSArrayElement = WebCore::makeNSArrayElement();
            if (NSArrayElement)
              objc_msgSend(v20, "addObject:", NSArrayElement);
            *(_QWORD *)&v22 += 16;
            v23 -= 16;
          }
          while (v23);
        }
        v32 = (id)CFMakeCollectable(v20);
        goto LABEL_53;
      }
      v17 = *((_QWORD *)v16 + 1);
      if (__ldaxr((unsigned __int8 *)v17))
      {
        __clrex();
      }
      else if (!__stxr(1u, (unsigned __int8 *)v17))
      {
        goto LABEL_32;
      }
      MEMORY[0x1D82A3914](v17);
LABEL_32:
      v33 = *(_QWORD *)(v17 + 8);
      v34 = v33 - 1;
      *(_QWORD *)(v17 + 8) = v33 - 1;
      if (v33 == 1)
      {
        v38 = *(_QWORD *)(v17 + 16);
        v35 = *(_QWORD *)(v17 + 24);
        *(_QWORD *)(v17 + 24) = 0;
        v36 = v38 != 0;
        LODWORD(v38) = __ldxr((unsigned __int8 *)v17);
        if ((_DWORD)v38 == 1)
        {
LABEL_34:
          if (!__stlxr(0, (unsigned __int8 *)v17))
          {
            if (v34)
              goto LABEL_44;
LABEL_40:
            if (v35)
              (*(void (**)(uint64_t))(*(_QWORD *)v35 + 8))(v35);
            if (!v36)
              WTF::fastFree((WTF *)v17, v14);
            goto LABEL_44;
          }
LABEL_39:
          WTF::Lock::unlockSlow((WTF::Lock *)v17);
          if (v34)
            goto LABEL_44;
          goto LABEL_40;
        }
      }
      else
      {
        v35 = 0;
        v36 = 1;
        v37 = __ldxr((unsigned __int8 *)v17);
        if (v37 == 1)
          goto LABEL_34;
      }
      __clrex();
      goto LABEL_39;
    }
  }
  if (*a3)
    goto LABEL_24;
LABEL_47:
  v39 = (WebCore::RenderBox *)(*((_QWORD *)internal + 8) & 0xFFFFFFFFFFFFLL);
  if (!v39)
    goto LABEL_54;
  if ((*(_BYTE *)((*((_QWORD *)internal + 8) & 0xFFFFFFFFFFFFLL) + 0x34) & 7) == 3
    && (*(_BYTE *)((*((_QWORD *)internal + 8) & 0xFFFFFFFFFFFFLL) + 0x35) & 1) != 0)
  {
    WebCore::RenderBox::absoluteContentQuad(v39);
    WebCore::FloatQuad::boundingBox((WebCore::FloatQuad *)v60);
    v58 = __PAIR64__(v44, v43);
    v59 = __PAIR64__(v46, v45);
    WebCore::enclosingIntRect((WebCore *)&v58, v47);
    WebCore::FloatRect::FloatRect();
    v42 = v55;
  }
  else
  {
    v58 = WebCore::RenderObject::absoluteBoundingBoxRect(v39, 1, 0);
    v59 = v40;
    WebCore::FloatRect::FloatRect();
    v42 = *(_OWORD *)v60;
  }
  v57 = v42;
  v48 = (float32x2_t)vdup_lane_s32(v53, 0);
  *(float32x2_t *)&v57 = vsub_f32(*(float32x2_t *)&v57, v48);
  *((float32x2_t *)&v57 + 1) = vadd_f32(v48, vadd_f32(v48, *(float32x2_t *)((char *)&v57 + 8)));
  v58 = WebCore::enclosingIntRect((WebCore *)&v57, v41);
  v59 = v49;
  v60[0] = (WebCore::Node *)WebCore::ScrollView::contentsToWindow();
  v60[1] = v50;
  v63[0] = WebCore::makeNSArrayElement();
  v32 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 1);
LABEL_53:
  *a4 = v32;
LABEL_54:
  if (v56)
  {
    if (v56->i32[0] == 1)
    {
      v51 = (WTF *)MEMORY[0x1D82A4514]();
      WTF::fastFree(v51, v52);
    }
    else
    {
      --v56->i32[0];
    }
  }
}

- (void)dealloc
{
  objc_class *v3;
  DOMObjectInternal *internal;
  objc_super v5;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    internal = self->super._internal;
    if (internal)
    {
      if (*((_DWORD *)internal + 6) == 2)
      {
        if ((*((_WORD *)internal + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(internal);
      }
      else
      {
        *((_DWORD *)internal + 6) -= 2;
      }
    }
    v5.receiver = self;
    v5.super_class = (Class)DOMNode;
    -[DOMObject dealloc](&v5, sel_dealloc);
  }
}

- (NSString)nodeName
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v7;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  (*(void (**)(WTF::StringImpl **__return_ptr))(*(_QWORD *)self->super._internal + 104))(&v7);
  if (v7)
  {
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
    v5 = v7;
    v7 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2)
        WTF::StringImpl::destroy(v5, v3);
      else
        *(_DWORD *)v5 -= 2;
    }
  }
  else
  {
    v4 = &stru_1E9D6EC48;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return &v4->isa;
}

- (NSString)nodeValue
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v7;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  (*(void (**)(WTF::StringImpl **__return_ptr))(*(_QWORD *)self->super._internal + 112))(&v7);
  if (v7)
  {
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
    v5 = v7;
    v7 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2)
        WTF::StringImpl::destroy(v5, v3);
      else
        *(_DWORD *)v5 -= 2;
    }
  }
  else
  {
    v4 = &stru_1E9D6EC48;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return &v4->isa;
}

- (void)setNodeValue:(NSString *)nodeValue
{
  DOMObjectInternal *internal;
  StringImpl *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;
  void *v9;
  WTF::StringImpl *v10;
  uint64_t v11;
  WTF::StringImpl *v12;
  char v13;
  _BYTE v14[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14);
  internal = self->super._internal;
  MEMORY[0x1D82A3998](&v10, nodeValue);
  (*(void (**)(uint64_t *__return_ptr, DOMObjectInternal *, WTF::StringImpl **))(*(_QWORD *)internal + 120))(&v11, internal, &v10);
  if (v13)
  {
    v7 = v12;
    v12 = 0;
    if (v7)
    {
      if (*(_DWORD *)v7 == 2)
      {
        WTF::StringImpl::destroy(v7, v6);
        v8 = v10;
        v10 = 0;
        if (!v8)
          goto LABEL_8;
        goto LABEL_6;
      }
      *(_DWORD *)v7 -= 2;
    }
  }
  v8 = v10;
  v10 = 0;
  if (!v8)
  {
LABEL_8:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v6);
    return;
  }
LABEL_6:
  if (*(_DWORD *)v8 != 2)
  {
    *(_DWORD *)v8 -= 2;
    goto LABEL_8;
  }
  WTF::StringImpl::destroy(v8, v6);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v9);
}

- (unsigned)nodeType
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((unsigned __int16 *)self->super._internal + 14) >> 12;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (unsigned __int16)self;
}

- (DOMNode)parentNode
{
  DOMNode *v3;
  void *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMNode *)kit(*((WebCore::Node **)self->super._internal + 4));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (DOMNodeList)childNodes
{
  void *v3;
  DOMNodeList *v4;
  DOMObjectInternal *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::Node::childNodes(self->super._internal);
  v4 = (DOMNodeList *)kit(v6);
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

- (DOMNode)firstChild
{
  DOMObjectInternal *internal;
  BOOL v4;
  WebCore::Node *v5;
  DOMNode *v6;
  void *v7;
  _BYTE v9[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  internal = self->super._internal;
  if (internal)
    v4 = (*((_WORD *)internal + 14) & 4) == 0;
  else
    v4 = 1;
  if (v4)
    v5 = 0;
  else
    v5 = (WebCore::Node *)*((_QWORD *)internal + 10);
  v6 = (DOMNode *)kit(v5);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v7);
  return v6;
}

- (DOMNode)lastChild
{
  DOMObjectInternal *internal;
  BOOL v4;
  WebCore::Node *v5;
  DOMNode *v6;
  void *v7;
  _BYTE v9[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  internal = self->super._internal;
  if (internal)
    v4 = (*((_WORD *)internal + 14) & 4) == 0;
  else
    v4 = 1;
  if (v4)
    v5 = 0;
  else
    v5 = (WebCore::Node *)*((_QWORD *)internal + 11);
  v6 = (DOMNode *)kit(v5);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v7);
  return v6;
}

- (DOMNode)previousSibling
{
  DOMNode *v3;
  void *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMNode *)kit((WebCore::Node *)(*((_QWORD *)self->super._internal + 6) & 0xFFFFFFFFFFFFLL));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (DOMNode)nextSibling
{
  DOMNode *v3;
  void *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMNode *)kit(*((WebCore::Node **)self->super._internal + 7));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (DOMDocument)ownerDocument
{
  DOMDocument *v3;
  void *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMDocument *)kit(*(WebCore::Node **)(*((_QWORD *)self->super._internal + 5) + 8));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (NSString)namespaceURI
{
  void *v3;
  const __CFString *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(_QWORD *)(*(uint64_t (**)(DOMObjectInternal *))(*(_QWORD *)self->super._internal + 152))(self->super._internal))
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v4 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (NSString)prefix
{
  void *v3;
  const __CFString *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(_QWORD *)(*(uint64_t (**)(DOMObjectInternal *))(*(_QWORD *)self->super._internal + 160))(self->super._internal))
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v4 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (void)setPrefix:(NSString *)prefix
{
  DOMObjectInternal *internal;
  const __CFString *v6;
  StringImpl *v7;
  WTF::StringImpl *v8;
  void *v9;
  uint64_t v10;
  WTF::StringImpl *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  _BYTE v15[80];
  WTF::StringImpl *v16;
  uint64_t v17;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  internal = self->super._internal;
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)prefix, v6);
  v11 = v16;
  (*(void (**)(uint64_t *__return_ptr, DOMObjectInternal *, WTF::StringImpl **))(*(_QWORD *)internal + 168))(&v12, internal, &v11);
  if (v14)
  {
    LOBYTE(v16) = v12;
    v10 = v13;
    v13 = 0;
    v17 = v10;
    raiseDOMErrorException();
  }
  v8 = v11;
  v11 = 0;
  if (!v8)
    goto LABEL_5;
  if (*(_DWORD *)v8 != 2)
  {
    *(_DWORD *)v8 -= 2;
LABEL_5:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v7);
    return;
  }
  WTF::StringImpl::destroy(v8, v7);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v9);
}

- (NSString)localName
{
  void *v3;
  const __CFString *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(_QWORD *)(*(uint64_t (**)(DOMObjectInternal *))(*(_QWORD *)self->super._internal + 144))(self->super._internal))
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v4 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (DOMNamedNodeMap)attributes
{
  DOMObjectInternal *internal;
  BOOL v4;
  DOMObjectInternal *v5;
  DOMNamedNodeMap *v6;
  void *v7;
  _BYTE v9[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  internal = self->super._internal;
  if (internal)
    v4 = (*((_WORD *)internal + 14) & 8) == 0;
  else
    v4 = 1;
  if (v4)
    v5 = 0;
  else
    v5 = (DOMObjectInternal *)WebCore::Element::attributes(internal);
  v6 = (DOMNamedNodeMap *)kit(v5);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v7);
  return v6;
}

- (NSString)baseURI
{
  void *v3;
  const __CFString *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(_QWORD *)WebCore::Node::baseURI(self->super._internal))
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v4 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (NSString)textContent
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::Node::textContent(self->super._internal);
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

- (void)setTextContent:(NSString *)textContent
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
  MEMORY[0x1D82A3998](&v8, textContent);
  WebCore::Node::setTextContent();
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

- (BOOL)isConnected
{
  _BOOL8 v3;
  void *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (*((_QWORD *)self->super._internal + 2) >> 51) & 1;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (DOMElement)parentElement
{
  uint64_t v3;
  WebCore::Node *v4;
  DOMElement *v5;
  void *v6;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  v3 = *((_QWORD *)self->super._internal + 4);
  if (v3)
  {
    if ((*(_WORD *)(v3 + 28) & 8) != 0)
      v4 = (WebCore::Node *)*((_QWORD *)self->super._internal + 4);
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = (DOMElement *)kit(v4);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
  return v5;
}

- (BOOL)isContentEditable
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = WebCore::Node::isContentEditable(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (DOMNode)insertBefore:(DOMNode *)newChild refChild:(DOMNode *)refChild
{
  DOMObjectInternal *internal;
  void *v7;
  WebCore::Node *v9;
  char v10;
  uint64_t v11;
  char v12;
  _BYTE v13[88];
  uint64_t v14;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  if (!newChild)
    raiseTypeErrorException();
  if (refChild)
  {
    internal = refChild->super._internal;
    if (internal)
      *((_DWORD *)internal + 6) += 2;
  }
  else
  {
    internal = 0;
  }
  v9 = internal;
  WebCore::Node::insertBefore();
  if (v12)
  {
    v13[80] = v10;
    v14 = v11;
    raiseDOMErrorException();
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
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v7);
  return newChild;
}

- (DOMNode)replaceChild:(DOMNode *)newChild oldChild:(DOMNode *)oldChild
{
  void *v7;
  char v9;
  uint64_t v10;
  char v11;
  _BYTE v12[88];
  uint64_t v13;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  if (!newChild || !oldChild)
    raiseTypeErrorException();
  WebCore::Node::replaceChild(self->super._internal, newChild->super._internal, oldChild->super._internal);
  if (v11)
  {
    v12[80] = v9;
    v13 = v10;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v7);
  return oldChild;
}

- (DOMNode)removeChild:(DOMNode *)oldChild
{
  void *v5;
  char v7;
  uint64_t v8;
  char v9;
  _BYTE v10[88];
  uint64_t v11;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  if (!oldChild)
    raiseTypeErrorException();
  WebCore::Node::removeChild(self->super._internal, oldChild->super._internal);
  if (v9)
  {
    v10[80] = v7;
    v11 = v8;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v5);
  return oldChild;
}

- (DOMNode)appendChild:(DOMNode *)newChild
{
  void *v5;
  char v7;
  uint64_t v8;
  char v9;
  _BYTE v10[88];
  uint64_t v11;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  if (!newChild)
    raiseTypeErrorException();
  WebCore::Node::appendChild(self->super._internal, newChild->super._internal);
  if (v9)
  {
    v10[80] = v7;
    v11 = v8;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v5);
  return newChild;
}

- (BOOL)hasChildNodes
{
  void *v3;
  DOMObjectInternal *internal;
  BOOL v5;
  BOOL v6;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  internal = self->super._internal;
  if (internal)
    v5 = (*((_WORD *)internal + 14) & 4) == 0;
  else
    v5 = 1;
  v6 = !v5 && *((_QWORD *)internal + 10) != 0;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return v6;
}

- (DOMNode)cloneNode:(BOOL)deep
{
  WebCore::Node *v4;
  void *v5;
  DOMNode *v6;
  DOMNode *result;
  uint64_t v8;
  WebCore::Node *v9;
  uint64_t v10;
  int v11;
  WebCore::Node *v12;
  _BYTE v13[80];
  _BYTE v14[8];
  uint64_t v15;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  WebCore::Node::cloneNodeForBindings(self->super._internal);
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
    result = (DOMNode *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    v4 = v9;
    v9 = 0;
    v12 = v4;
    v6 = (DOMNode *)kit(v4);
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
      ((void (*)(_BYTE *, WebCore::Node **))off_1E9D6AF10[v11])(v14, &v9);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v5);
    return v6;
  }
  return result;
}

- (void)normalize
{
  void *v3;
  _BYTE v4[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::Node::normalize(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (BOOL)isSupported:(NSString *)feature version:(NSString *)version
{
  const WTF::String *v5;
  StringImpl *v6;
  char hasFeatureForLegacyBindings;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;

  MEMORY[0x1D82A3998](&v12, feature);
  MEMORY[0x1D82A3998](&v11, version);
  hasFeatureForLegacyBindings = WebCore::SVGTests::hasFeatureForLegacyBindings((WebCore::SVGTests *)&v12, (const WTF::String *)&v11, v5);
  v8 = v11;
  v11 = 0;
  if (!v8)
  {
LABEL_4:
    v9 = v12;
    v12 = 0;
    if (!v9)
      return hasFeatureForLegacyBindings;
    goto LABEL_7;
  }
  if (*(_DWORD *)v8 != 2)
  {
    *(_DWORD *)v8 -= 2;
    goto LABEL_4;
  }
  WTF::StringImpl::destroy(v8, v6);
  v9 = v12;
  v12 = 0;
  if (!v9)
    return hasFeatureForLegacyBindings;
LABEL_7:
  if (*(_DWORD *)v9 != 2)
  {
    *(_DWORD *)v9 -= 2;
    return hasFeatureForLegacyBindings;
  }
  WTF::StringImpl::destroy(v9, v6);
  return hasFeatureForLegacyBindings;
}

- (BOOL)hasAttributes
{
  void *v3;
  DOMObjectInternal *internal;
  BOOL v5;
  char hasAttributes;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  internal = self->super._internal;
  if (internal)
    v5 = (*((_WORD *)internal + 14) & 8) == 0;
  else
    v5 = 1;
  if (v5)
    hasAttributes = 0;
  else
    hasAttributes = WebCore::Element::hasAttributes(internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return hasAttributes;
}

- (BOOL)isSameNode:(DOMNode *)other
{
  void *v5;
  DOMObjectInternal *internal;
  BOOL v7;
  _BYTE v9[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  if (other)
    internal = other->super._internal;
  else
    internal = 0;
  v7 = self->super._internal == internal;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v5);
  return v7;
}

- (BOOL)isEqualNode:(DOMNode *)other
{
  DOMObjectInternal *internal;
  char isEqualNode;
  void *v7;
  _BYTE v9[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  if (other)
    internal = other->super._internal;
  else
    internal = 0;
  isEqualNode = WebCore::Node::isEqualNode(self->super._internal, internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v7);
  return isEqualNode;
}

- (NSString)lookupPrefix:(NSString *)namespaceURI
{
  const __CFString *v4;
  StringImpl *v5;
  const __CFString *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v9;
  _BYTE v10[80];
  WTF::StringImpl *v11;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)namespaceURI, v4);
  v9 = v11;
  if (*(_QWORD *)WebCore::Node::lookupPrefix())
  {
    v6 = (const __CFString *)WTF::StringImpl::operator NSString *();
    v7 = v9;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v6 = &stru_1E9D6EC48;
    v7 = v9;
    if (!v9)
      goto LABEL_8;
  }
  if (*(_DWORD *)v7 == 2)
    WTF::StringImpl::destroy(v7, v5);
  else
    *(_DWORD *)v7 -= 2;
LABEL_8:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v5);
  return &v6->isa;
}

- (NSString)lookupNamespaceURI:(NSString *)prefix
{
  const __CFString *v4;
  StringImpl *v5;
  const __CFString *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v9;
  _BYTE v10[80];
  WTF::StringImpl *v11;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)prefix, v4);
  v9 = v11;
  if (*(_QWORD *)WebCore::Node::lookupNamespaceURI())
  {
    v6 = (const __CFString *)WTF::StringImpl::operator NSString *();
    v7 = v9;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v6 = &stru_1E9D6EC48;
    v7 = v9;
    if (!v9)
      goto LABEL_8;
  }
  if (*(_DWORD *)v7 == 2)
    WTF::StringImpl::destroy(v7, v5);
  else
    *(_DWORD *)v7 -= 2;
LABEL_8:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v5);
  return &v6->isa;
}

- (BOOL)isDefaultNamespace:(NSString *)namespaceURI
{
  const __CFString *v4;
  StringImpl *v5;
  char isDefaultNamespace;
  WTF::StringImpl *v8;
  _BYTE v9[80];
  WTF::StringImpl *v10;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)namespaceURI, v4);
  v8 = v10;
  isDefaultNamespace = WebCore::Node::isDefaultNamespace();
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy(v8, v5);
    else
      *(_DWORD *)v8 -= 2;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v5);
  return isDefaultNamespace;
}

- (unsigned)compareDocumentPosition:(DOMNode *)other
{
  void *v5;
  unsigned __int16 v6;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  if (other)
    v6 = WebCore::Node::compareDocumentPosition(self->super._internal, other->super._internal);
  else
    v6 = 1;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v5);
  return v6;
}

- (BOOL)contains:(DOMNode *)other
{
  DOMObjectInternal *internal;
  char v6;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  if (other && (internal = other->super._internal) != 0)
    v6 = WebCore::Node::contains(self->super._internal, internal);
  else
    v6 = 0;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, internal);
  return v6;
}

- (void)inspect
{
  void *v3;
  _BYTE v4[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::Node::inspect(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (void)addEventListener:(id)a3 listener:(id)a4 useCapture:(BOOL)a5
{
  const __CFString *v8;
  StringImpl *v9;
  _DWORD *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  WTF::StringImpl *v16;
  _BYTE v17[87];
  char v18;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, v8);
  v16 = v12;
  WebCore::ObjCEventListener::wrap((uint64_t)a4, &v14);
  v15 = v14;
  LOBYTE(v12) = a5;
  v13 = 1;
  WebCore::EventTarget::addEventListenerForBindings();
  ((void (*)(char *, WTF::StringImpl **))_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8sn180100IOZNS0_6__dtorINS0_8__traitsIJN7WebCore23AddEventListenerOptionsEbEEELNS0_6_TraitE1EE9__destroyB8sn180100EvEUlRT_E_JRNS0_6__baseILSB_1EJS9_bEEEEEEDcSD_DpT0_)(&v18, &v12);
  v10 = (_DWORD *)v15;
  v15 = 0;
  if (v10)
  {
    if (v10[4] == 1)
    {
      (*(void (**)(_DWORD *))(*(_QWORD *)v10 + 8))(v10);
      v11 = v16;
      v16 = 0;
      if (!v11)
        goto LABEL_10;
      goto LABEL_7;
    }
    --v10[4];
  }
  v11 = v16;
  v16 = 0;
  if (!v11)
    goto LABEL_10;
LABEL_7:
  if (*(_DWORD *)v11 == 2)
    WTF::StringImpl::destroy(v11, v9);
  else
    *(_DWORD *)v11 -= 2;
LABEL_10:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17, v9);
}

- (void)addEventListener:(id)a3 :(id)a4 :(BOOL)a5
{
  const __CFString *v8;
  StringImpl *v9;
  _DWORD *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  WTF::StringImpl *v16;
  _BYTE v17[87];
  char v18;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, v8);
  v16 = v12;
  WebCore::ObjCEventListener::wrap((uint64_t)a4, &v14);
  v15 = v14;
  LOBYTE(v12) = a5;
  v13 = 1;
  WebCore::EventTarget::addEventListenerForBindings();
  ((void (*)(char *, WTF::StringImpl **))_ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8sn180100IOZNS0_6__dtorINS0_8__traitsIJN7WebCore23AddEventListenerOptionsEbEEELNS0_6_TraitE1EE9__destroyB8sn180100EvEUlRT_E_JRNS0_6__baseILSB_1EJS9_bEEEEEEDcSD_DpT0_)(&v18, &v12);
  v10 = (_DWORD *)v15;
  v15 = 0;
  if (v10)
  {
    if (v10[4] == 1)
    {
      (*(void (**)(_DWORD *))(*(_QWORD *)v10 + 8))(v10);
      v11 = v16;
      v16 = 0;
      if (!v11)
        goto LABEL_10;
      goto LABEL_7;
    }
    --v10[4];
  }
  v11 = v16;
  v16 = 0;
  if (!v11)
    goto LABEL_10;
LABEL_7:
  if (*(_DWORD *)v11 == 2)
    WTF::StringImpl::destroy(v11, v9);
  else
    *(_DWORD *)v11 -= 2;
LABEL_10:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17, v9);
}

- (void)removeEventListener:(id)a3 listener:(id)a4 useCapture:(BOOL)a5
{
  const __CFString *v7;
  StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  _BYTE v13[80];
  WTF::StringImpl *v14;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, v7);
  v12 = v14;
  WebCore::ObjCEventListener::wrap((uint64_t)a4, (uint64_t *)&v11);
  v14 = v11;
  WebCore::EventTarget::removeEventListenerForBindings();
  v9 = v14;
  v14 = 0;
  if (v9)
  {
    if (*((_DWORD *)v9 + 4) == 1)
    {
      (*(void (**)(WTF::StringImpl *))(*(_QWORD *)v9 + 8))(v9);
      v10 = v12;
      v12 = 0;
      if (!v10)
        goto LABEL_10;
      goto LABEL_7;
    }
    --*((_DWORD *)v9 + 4);
  }
  v10 = v12;
  v12 = 0;
  if (!v10)
    goto LABEL_10;
LABEL_7:
  if (*(_DWORD *)v10 == 2)
    WTF::StringImpl::destroy(v10, v8);
  else
    *(_DWORD *)v10 -= 2;
LABEL_10:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v8);
}

- (void)removeEventListener:(id)a3 :(id)a4 :(BOOL)a5
{
  const __CFString *v7;
  StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  _BYTE v13[80];
  WTF::StringImpl *v14;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, v7);
  v12 = v14;
  WebCore::ObjCEventListener::wrap((uint64_t)a4, (uint64_t *)&v11);
  v14 = v11;
  WebCore::EventTarget::removeEventListenerForBindings();
  v9 = v14;
  v14 = 0;
  if (v9)
  {
    if (*((_DWORD *)v9 + 4) == 1)
    {
      (*(void (**)(WTF::StringImpl *))(*(_QWORD *)v9 + 8))(v9);
      v10 = v12;
      v12 = 0;
      if (!v10)
        goto LABEL_10;
      goto LABEL_7;
    }
    --*((_DWORD *)v9 + 4);
  }
  v10 = v12;
  v12 = 0;
  if (!v10)
    goto LABEL_10;
LABEL_7:
  if (*(_DWORD *)v10 == 2)
    WTF::StringImpl::destroy(v10, v8);
  else
    *(_DWORD *)v10 -= 2;
LABEL_10:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v8);
}

- (BOOL)dispatchEvent:(id)a3
{
  void *v4;
  BOOL result;
  BOOL v6;
  uint64_t v7;
  int v8;
  _BYTE v9[88];
  uint64_t v10;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  if (!a3)
    raiseTypeErrorException();
  WebCore::EventTarget::dispatchEventForBindings();
  if (v8)
  {
    if (v8 == 1)
    {
      v9[80] = v6;
      v10 = v7;
      raiseDOMErrorException();
    }
    result = std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v4);
    return v6;
  }
  return result;
}

- (id)boundingBoxes
{
  double x;
  double y;
  double width;
  double height;
  NSArray *v7;
  _QWORD v9[2];
  NSRect v10;

  v9[1] = *MEMORY[0x1E0C80C00];
  -[DOMNode boundingBox](self, "boundingBox");
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  if (!NSIsEmptyRect(v10))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!-[NSString isEqualToString:](-[DOMCSSStyleDeclaration getPropertyValue:](-[DOMDocument getComputedStyle:pseudoElement:](-[DOMNode ownerDocument](self, "ownerDocument"), "getComputedStyle:pseudoElement:", self, &stru_1E9D6EC48), "getPropertyValue:", CFSTR("display")), "isEqualToString:", CFSTR("inline")))goto LABEL_4;
LABEL_8:
      v7 = -[DOMNode lineBoxRects](self, "lineBoxRects");
      if (-[NSArray count](v7, "count"))
        return v7;
      goto LABEL_5;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_8;
  }
LABEL_4:
  v7 = 0;
  if (!objc_msgSend(0, "count"))
  {
LABEL_5:
    v9[0] = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", x, y, width, height);
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  }
  return v7;
}

- (id)absoluteQuads
{
  id v3;
  WKQuadObject *v4;
  WKQuadObject *v5;
  _OWORD v7[4];
  _QWORD v8[2];
  NSRect v9;

  v8[1] = *MEMORY[0x1E0C80C00];
  -[DOMNode boundingBox](self, "boundingBox");
  if (NSIsEmptyRect(v9))
    goto LABEL_4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_7;
LABEL_4:
    v3 = 0;
    if (objc_msgSend(0, "count"))
      return v3;
    goto LABEL_8;
  }
  if (!-[NSString isEqualToString:](-[DOMCSSStyleDeclaration getPropertyValue:](-[DOMDocument getComputedStyle:pseudoElement:](-[DOMNode ownerDocument](self, "ownerDocument"), "getComputedStyle:pseudoElement:", self, &stru_1E9D6EC48), "getPropertyValue:", CFSTR("display")), "isEqualToString:", CFSTR("inline")))goto LABEL_4;
LABEL_7:
  v3 = -[DOMNode lineBoxQuads](self, "lineBoxQuads");
  if (objc_msgSend(v3, "count"))
    return v3;
LABEL_8:
  v4 = [WKQuadObject alloc];
  if (self)
    -[DOMNode absoluteQuad](self, "absoluteQuad");
  else
    memset(v7, 0, sizeof(v7));
  v5 = -[WKQuadObject initWithQuad:](v4, "initWithQuad:", v7);
  v8[0] = v5;
  v3 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  if (v5)
    CFRelease(v5);
  return v3;
}

- (id)borderRadii
{
  WebCore::RenderBox *v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v2 = (WebCore::RenderBox *)(*((_QWORD *)self->super._internal + 8) & 0xFFFFFFFFFFFFLL);
  if (v2 && (*((_BYTE *)v2 + 45) & 4) != 0)
  {
    WebCore::RenderBox::borderRadii(v2);
    v5 = (void *)MEMORY[0x1E0CB3B18];
    WebCore::FloatSize::operator CGSize();
    v11[0] = objc_msgSend(v5, "valueWithSize:");
    v6 = (void *)MEMORY[0x1E0CB3B18];
    WebCore::FloatSize::operator CGSize();
    v11[1] = objc_msgSend(v6, "valueWithSize:");
    v7 = (void *)MEMORY[0x1E0CB3B18];
    WebCore::FloatSize::operator CGSize();
    v11[2] = objc_msgSend(v7, "valueWithSize:");
    v8 = (void *)MEMORY[0x1E0CB3B18];
    WebCore::FloatSize::operator CGSize();
    v11[3] = objc_msgSend(v8, "valueWithSize:");
    v3 = (void *)MEMORY[0x1E0C99D20];
    v4 = v11;
  }
  else
  {
    v10[0] = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v10[1] = v10[0];
    v10[2] = v10[0];
    v10[3] = v10[0];
    v3 = (void *)MEMORY[0x1E0C99D20];
    v4 = v10;
  }
  return (id)objc_msgSend(v3, "arrayWithObjects:count:", v4, 4);
}

- (BOOL)containsOnlyInlineObjects
{
  uint64_t v2;
  int v4;

  v2 = *((_QWORD *)self->super._internal + 8) & 0xFFFFFFFFFFFFLL;
  if (!v2
    || (*(_BYTE *)((*((_QWORD *)self->super._internal + 8) & 0xFFFFFFFFFFFFLL) + 0x16) & 4) == 0
    || (*(_BYTE *)((*((_QWORD *)self->super._internal + 8) & 0xFFFFFFFFFFFFLL) + 0x2D) & 0x40) == 0
    || WebCore::RenderBoxModelObject::inlineContinuation((WebCore::RenderBoxModelObject *)(*((_QWORD *)self->super._internal
                                                                                           + 8) & 0xFFFFFFFFFFFFLL)))
  {
    return 0;
  }
  v4 = *(unsigned __int8 *)(v2 + 46);
  return v4 != 35 && v4 != 63;
}

- (BOOL)isSelectableBlock
{
  WebCore::RenderBoxModelObject *v2;

  v2 = (WebCore::RenderBoxModelObject *)(*((_QWORD *)self->super._internal + 8) & 0xFFFFFFFFFFFFLL);
  if (v2)
    LOBYTE(v2) = (*((_BYTE *)v2 + 52) & 7) == 1
              || (*((_BYTE *)v2 + 45) & 0x40) != 0 && WebCore::RenderBoxModelObject::inlineContinuation(v2) != 0;
  return (char)v2;
}

- (id)rangeOfContainingParagraph
{
  DOMObjectInternal *internal;
  WebCore::Node *v3;
  WebCore::Node *v4;
  DOMObjectInternal *v5;
  DOMObjectInternal *v6;
  WebCore::Node *v7;
  WebCore::Node *v8;
  Node *var0;
  WebCore::Node *v10;
  uint64_t v11;
  VisiblePosition v13;
  WebCore::Node *v14;
  WebCore::Node *v15;
  WebCore::Node *v16;
  char v17;
  uint64_t v18;
  DOMObjectInternal *v19;

  if (self)
  {
    internal = self->super._internal;
    if (internal)
      *((_DWORD *)internal + 6) += 2;
  }
  else
  {
    internal = 0;
  }
  v14 = internal;
  WebCore::Position::Position();
  WebCore::VisiblePosition::VisiblePosition();
  v3 = v15;
  v15 = 0;
  if (v3)
  {
    if (*((_DWORD *)v3 + 6) == 2)
    {
      if ((*((_WORD *)v3 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v3);
    }
    else
    {
      *((_DWORD *)v3 + 6) -= 2;
    }
  }
  v4 = v14;
  v14 = 0;
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
  WebCore::startOfParagraph();
  WebCore::endOfParagraph();
  WebCore::makeSimpleRange<WebCore::VisiblePosition,WebCore::VisiblePosition>((WebCore *)&v14, &v13, (uint64_t)&v15);
  WebCore::createLiveRange();
  v5 = kit(v19);
  v6 = v19;
  v19 = 0;
  if (!v6)
  {
LABEL_18:
    if (!v17)
      goto LABEL_31;
    goto LABEL_21;
  }
  if (*((_DWORD *)v6 + 2) != 1)
  {
    --*((_DWORD *)v6 + 2);
    goto LABEL_18;
  }
  (*(void (**)(DOMObjectInternal *))(*(_QWORD *)v6 + 8))(v6);
  if (!v17)
    goto LABEL_31;
LABEL_21:
  v7 = v16;
  v16 = 0;
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
  v8 = v15;
  v15 = 0;
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
LABEL_31:
  var0 = v13.var0.var0.var0;
  v13.var0.var0.var0 = 0;
  if (var0)
  {
    if (*((_DWORD *)var0 + 6) == 2)
    {
      if ((*((_WORD *)var0 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef((WebCore::Node *)var0);
    }
    else
    {
      *((_DWORD *)var0 + 6) -= 2;
    }
  }
  v10 = v14;
  v14 = 0;
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
  if (!v11)
    return v5;
  if (*(_DWORD *)(v11 + 24) != 2)
  {
    *(_DWORD *)(v11 + 24) -= 2;
    return v5;
  }
  if ((*(_WORD *)(v11 + 30) & 0x400) != 0)
    return v5;
  WebCore::Node::removedLastRef((WebCore::Node *)v11);
  return v5;
}

- (double)textHeight
{
  uint64_t v3;
  float v4;

  if ((*((_QWORD *)self->super._internal + 8) & 0xFFFFFFFFFFFFLL) == 0
    || (*(_BYTE *)((*((_QWORD *)self->super._internal + 8) & 0xFFFFFFFFFFFFLL) + 0x2D) & 2) == 0)
  {
    return 1.79769313e308;
  }
  v3 = *(_QWORD *)((*((_QWORD *)self->super._internal + 8) & 0xFFFFFFFFFFFFLL) + 0x20);
  if (v3)
    v3 = *(_QWORD *)(v3 + 8);
  WebCore::RenderStyle::computedLineHeight((WebCore::RenderStyle *)(v3 + 80));
  return v4;
}

- (id)findExplodedTextNodeAtPoint:(CGPoint)a3
{
  WebCore::RenderBlockFlow *v3;
  id result;
  WebCore::RenderText *v5;
  WebCore::Node *v6;
  _BYTE v7[8];
  CGPoint v8;

  v8 = a3;
  v3 = (WebCore::RenderBlockFlow *)(*((_QWORD *)self->super._internal + 8) & 0xFFFFFFFFFFFFLL);
  if (!v3 || (*(_BYTE *)((*((_QWORD *)self->super._internal + 8) & 0xFFFFFFFFFFFFLL) + 0x34) & 7) != 1)
    return 0;
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v7, &v8);
  result = (id)WebCore::RenderBlockFlow::findClosestTextAtAbsolutePoint(v3, (const WebCore::FloatPoint *)v7);
  if (result)
  {
    v5 = (WebCore::RenderText *)result;
    result = (id)WebCore::RenderText::textNode((WebCore::RenderText *)result);
    if (result)
    {
      v6 = (WebCore::Node *)WebCore::RenderText::textNode(v5);
      return kit(v6);
    }
  }
  return result;
}

- (WebArchive)webArchive
{
  WebArchive *v2;
  WebArchive *v3;
  _DWORD *v4;
  _DWORD *v6;

  v2 = [WebArchive alloc];
  WebCore::LegacyWebArchive::create();
  v3 = (id)CFMakeCollectable(-[WebArchive _initWithCoreLegacyWebArchive:](v2, "_initWithCoreLegacyWebArchive:", &v6));
  v4 = v6;
  v6 = 0;
  if (v4)
  {
    if (v4[2] == 1)
      (*(void (**)(_DWORD *))(*(_QWORD *)v4 + 8))(v4);
    else
      --v4[2];
  }
  return v3;
}

- (id)webArchiveByFilteringSubframes:(id)a3
{
  WebArchive *v4;
  _QWORD *v5;
  id v6;
  _DWORD *v7;
  _QWORD *v9;
  _DWORD *v10;

  v4 = [WebArchive alloc];
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = off_1E9D6B0E8;
  v5[1] = a3;
  v9 = v5;
  WebCore::LegacyWebArchive::create();
  v6 = -[WebArchive _initWithCoreLegacyWebArchive:](v4, "_initWithCoreLegacyWebArchive:", &v10);
  v7 = v10;
  v10 = 0;
  if (v7)
  {
    if (v7[2] == 1)
      (*(void (**)(_DWORD *))(*(_QWORD *)v7 + 8))(v7);
    else
      --v7[2];
  }
  if (v9)
    (*(void (**)(_QWORD *))(*v9 + 8))(v9);
  return (id)(id)CFMakeCollectable(v6);
}

- (BOOL)isHorizontalWritingMode
{
  DOMObjectInternal *internal;
  uint64_t v3;
  int v4;
  char v5;
  BOOL result;

  if (!self)
    return 1;
  internal = self->super._internal;
  if (!internal)
    return 1;
  v3 = *((_QWORD *)internal + 8) & 0xFFFFFFFFFFFFLL;
  if (!v3)
    return 1;
  if ((*(_BYTE *)(v3 + 45) & 2) != 0)
    v3 = *(_QWORD *)(*(_QWORD *)(v3 + 32) + 8);
  v4 = (unsigned __int16)*(_DWORD *)(v3 + 124) >> 13;
  v5 = 2;
  switch(v4)
  {
    case 1:
    case 2:
      goto LABEL_10;
    case 3:
    case 5:
      LOBYTE(v4) = 3;
      goto LABEL_10;
    case 4:
      goto LABEL_11;
    default:
      LOBYTE(v4) = 0;
LABEL_10:
      v5 = v4;
LABEL_11:
      result = (v5 & 6) != 2;
      break;
  }
  return result;
}

- (void)hidePlaceholder
{
  DOMObjectInternal *internal;

  if (self)
  {
    internal = self->super._internal;
    if (internal)
    {
      if ((*((_WORD *)internal + 14) & 8) != 0
        && (*(unsigned int (**)(DOMObjectInternal *, SEL))(*(_QWORD *)internal + 872))(self->super._internal, a2))
      {
        if ((*((_WORD *)internal + 14) & 8) != 0
          && ((*(uint64_t (**)(DOMObjectInternal *))(*(_QWORD *)internal + 872))(internal) & 1) != 0)
        {
          WebCore::HTMLTextFormControlElement::setCanShowPlaceholder(internal);
        }
        else
        {
          __break(0xC471u);
        }
      }
    }
  }
}

- (void)showPlaceholderIfNecessary
{
  DOMObjectInternal *internal;

  if (self)
  {
    internal = self->super._internal;
    if (internal)
    {
      if ((*((_WORD *)internal + 14) & 8) != 0
        && (*(unsigned int (**)(DOMObjectInternal *, SEL))(*(_QWORD *)internal + 872))(self->super._internal, a2))
      {
        if ((*((_WORD *)internal + 14) & 8) != 0
          && ((*(uint64_t (**)(DOMObjectInternal *))(*(_QWORD *)internal + 872))(internal) & 1) != 0)
        {
          WebCore::HTMLTextFormControlElement::setCanShowPlaceholder(internal);
        }
        else
        {
          __break(0xC471u);
        }
      }
    }
  }
}

- (id)markupString
{
  DOMObjectInternal *internal;
  const Document *v3;
  id result;
  WTF::StringImpl *v5;
  int v6;
  int v7;
  unsigned int v8;
  int v9;
  StringImpl *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  StringImpl *v13;
  void *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  WTF *v17[2];
  WTF::StringImpl *v18;

  internal = self->super._internal;
  v17[0] = 0;
  v17[1] = 0;
  WebCore::serializeFragment();
  if ((*((unsigned __int16 *)internal + 14) >> 12) - 11 > 0xFFFFFFFD)
    goto LABEL_32;
  result = (id)WebCore::documentTypeString(*(WebCore **)(*((_QWORD *)internal + 5) + 8), v3);
  v5 = v18;
  if (v18)
    *(_DWORD *)v18 += 2;
  if (v16)
  {
    v6 = *((_DWORD *)v16 + 1);
    if (v5)
      goto LABEL_6;
  }
  else
  {
    v6 = 0;
    if (v5)
    {
LABEL_6:
      v7 = *((_DWORD *)v5 + 1);
      if ((v7 | v6) < 0)
        goto LABEL_40;
      goto LABEL_10;
    }
  }
  v7 = 0;
  if (v6 < 0)
    goto LABEL_40;
LABEL_10:
  result = (id)(v6 + v7);
  if (__OFADD__(v6, v7))
    goto LABEL_40;
  if (!v16)
  {
    if (!v5)
    {
      v9 = 1;
      goto LABEL_18;
    }
LABEL_16:
    v9 = (*((unsigned __int8 *)v5 + 16) >> 2) & 1;
    goto LABEL_18;
  }
  v8 = *((_DWORD *)v16 + 4);
  v9 = (v8 >> 2) & 1;
  if (v5 && (v8 & 4) != 0)
    goto LABEL_16;
LABEL_18:
  result = (id)WTF::tryMakeStringImplFromAdaptersInternal<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((unint64_t)result, v9, (uint64_t)v16, (uint64_t)v5, v17);
  if (v17[0])
  {
    v11 = v18;
    v18 = v17[0];
    if (v11)
    {
      if (*(_DWORD *)v11 == 2)
      {
        WTF::StringImpl::destroy(v11, v10);
        if (!v5)
          goto LABEL_27;
LABEL_25:
        if (*(_DWORD *)v5 == 2)
        {
          WTF::StringImpl::destroy(v5, v10);
          v12 = v16;
          if (!v16)
            goto LABEL_32;
LABEL_30:
          if (*(_DWORD *)v12 == 2)
          {
            WTF::StringImpl::destroy(v12, v10);
            if (v18)
            {
LABEL_33:
              v14 = (void *)WTF::StringImpl::operator NSString *();
              v15 = v18;
              v18 = 0;
              if (v15)
              {
                if (*(_DWORD *)v15 == 2)
                {
                  WTF::StringImpl::destroy(v15, v13);
                  return v14;
                }
                *(_DWORD *)v15 -= 2;
              }
              return v14;
            }
            return &stru_1E9D6EC48;
          }
          *(_DWORD *)v12 -= 2;
LABEL_32:
          if (v18)
            goto LABEL_33;
          return &stru_1E9D6EC48;
        }
        *(_DWORD *)v5 -= 2;
LABEL_27:
        v12 = v16;
        if (!v16)
          goto LABEL_32;
        goto LABEL_30;
      }
      *(_DWORD *)v11 -= 2;
    }
    if (!v5)
      goto LABEL_27;
    goto LABEL_25;
  }
LABEL_40:
  __break(0xC471u);
  return result;
}

- (CGRect)_renderRect:(BOOL *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  if (self)
    self = (DOMNode *)self->super._internal;
  WebCore::Node::absoluteBoundingRect((WebCore::Node *)self, a3);
  WebCore::IntRect::operator CGRect();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)rangeOfContents
{
  DOMRange *v3;

  v3 = -[DOMDocument createRange](-[DOMNode ownerDocument](self, "ownerDocument"), "createRange");
  -[DOMRange setStart:offset:](v3, "setStart:offset:", self, 0);
  -[DOMRange setEnd:offset:](v3, "setEnd:offset:", self, -[DOMNodeList length](-[DOMNode childNodes](self, "childNodes"), "length"));
  return v3;
}

- (id)startPosition
{
  DOMObjectInternal *internal;
  const VisiblePosition *v4;
  id v5;
  uint64_t v6;
  WebCore::Node *v8;
  WebCore::Node *v9;
  WebCore::Node *v10;
  _QWORD v11[3];

  if (!self)
  {
    if (WebCore::Node::isContentEditable(0))
    {
      internal = 0;
      goto LABEL_7;
    }
    return (id)objc_msgSend(-[DOMNode rangeOfContents](self, "rangeOfContents"), "startPosition");
  }
  internal = self->super._internal;
  if ((WebCore::Node::isContentEditable(internal) & 1) == 0)
    return (id)objc_msgSend(-[DOMNode rangeOfContents](self, "rangeOfContents"), "startPosition");
  if (internal)
    *((_DWORD *)internal + 6) += 2;
LABEL_7:
  WebCore::Position::Position();
  WebCore::VisiblePosition::VisiblePosition();
  WebCore::startOfEditableContent((WebCore *)&v10, v4);
  v5 = +[WebVisiblePosition _wrapVisiblePosition:](WebVisiblePosition, "_wrapVisiblePosition:", v11);
  v6 = v11[0];
  v11[0] = 0;
  if (v6)
  {
    if (*(_DWORD *)(v6 + 24) == 2)
    {
      if ((*(_WORD *)(v6 + 30) & 0x400) == 0)
        WebCore::Node::removedLastRef((WebCore::Node *)v6);
    }
    else
    {
      *(_DWORD *)(v6 + 24) -= 2;
    }
  }
  v8 = v10;
  v10 = 0;
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
  if (!internal)
    return v5;
  if (*((_DWORD *)internal + 6) != 2)
  {
    *((_DWORD *)internal + 6) -= 2;
    return v5;
  }
  if ((*((_WORD *)internal + 15) & 0x400) != 0)
    return v5;
  WebCore::Node::removedLastRef(internal);
  return v5;
}

- (id)endPosition
{
  DOMObjectInternal *internal;
  const VisiblePosition *v4;
  id v5;
  uint64_t v6;
  WebCore::Node *v8;
  WebCore::Node *v9;
  WebCore::Node *v10;
  _QWORD v11[3];

  if (!self)
  {
    if (WebCore::Node::isContentEditable(0))
    {
      internal = 0;
      goto LABEL_7;
    }
    return (id)objc_msgSend(-[DOMNode rangeOfContents](self, "rangeOfContents"), "endPosition");
  }
  internal = self->super._internal;
  if ((WebCore::Node::isContentEditable(internal) & 1) == 0)
    return (id)objc_msgSend(-[DOMNode rangeOfContents](self, "rangeOfContents"), "endPosition");
  if (internal)
    *((_DWORD *)internal + 6) += 2;
LABEL_7:
  WebCore::Position::Position();
  WebCore::VisiblePosition::VisiblePosition();
  WebCore::endOfEditableContent((WebCore *)&v10, v4);
  v5 = +[WebVisiblePosition _wrapVisiblePosition:](WebVisiblePosition, "_wrapVisiblePosition:", v11);
  v6 = v11[0];
  v11[0] = 0;
  if (v6)
  {
    if (*(_DWORD *)(v6 + 24) == 2)
    {
      if ((*(_WORD *)(v6 + 30) & 0x400) == 0)
        WebCore::Node::removedLastRef((WebCore::Node *)v6);
    }
    else
    {
      *(_DWORD *)(v6 + 24) -= 2;
    }
  }
  v8 = v10;
  v10 = 0;
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
  if (!internal)
    return v5;
  if (*((_DWORD *)internal + 6) != 2)
  {
    *((_DWORD *)internal + 6) -= 2;
    return v5;
  }
  if ((*((_WORD *)internal + 15) & 0x400) != 0)
    return v5;
  WebCore::Node::removedLastRef(internal);
  return v5;
}

@end
