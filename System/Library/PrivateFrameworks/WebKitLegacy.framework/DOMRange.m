@implementation DOMRange

- (CGRect)boundingBox
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  WTF *v15;
  WebCore::Node *v16;
  WebCore::Node *v17;
  CGRect result;

  WebCore::makeSimpleRange();
  WebCore::Document::updateLayout();
  WebCore::RenderObject::absoluteTextRects();
  WebCore::unionRect();
  WebCore::IntRect::operator CGRect();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (v15)
    WTF::fastFree(v15, v2);
  if (v17)
  {
    if (*((_DWORD *)v17 + 6) == 2)
    {
      if ((*((_WORD *)v17 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v17);
    }
    else
    {
      *((_DWORD *)v17 + 6) -= 2;
    }
  }
  if (v16)
  {
    if (*((_DWORD *)v16 + 6) == 2)
    {
      if ((*((_WORD *)v16 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v16);
    }
    else
    {
      *((_DWORD *)v16 + 6) -= 2;
    }
  }
  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGImage)renderedImageForcingBlackText:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v4;
  WebCore *v5;
  unsigned int *v6;
  unsigned int v7;
  CGImage *v8;
  unsigned int v9;
  unsigned int v10;
  WebCore::Node *v11;
  WebCore::Node *v12;
  _QWORD *v14;
  CFTypeRef v15;
  WebCore::Node *v16;
  WebCore::Node *v17;
  void *v18;

  v3 = a3;
  WebCore::makeSimpleRange();
  v4 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)v16 + 5) + 8) + 528);
  if (v4 && (v5 = *(WebCore **)(v4 + 8)) != 0)
  {
    v6 = (unsigned int *)((char *)v5 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 + 1, v6));
    WebCore::createDragImageForRange(v5, (WebCore::LocalFrame *)&v16, (const WebCore::SimpleRange *)v3);
    if (v18)
    {
      CFAutorelease(v18);
      v8 = (CGImage *)v18;
    }
    else
    {
      v8 = 0;
    }
    do
    {
      v9 = __ldaxr(v6);
      v10 = v9 - 1;
    }
    while (__stlxr(v10, v6));
    if (!v10)
    {
      atomic_store(1u, v6);
      v14 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      *v14 = off_1E9D6A4D8;
      v14[1] = v6;
      v18 = v14;
      WTF::ensureOnMainThread();
      v15 = v18;
      v18 = 0;
      if (v15)
        (*(void (**)(CFTypeRef))(*(_QWORD *)v15 + 8))(v15);
    }
  }
  else
  {
    v8 = 0;
  }
  v11 = v17;
  v17 = 0;
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
  v12 = v16;
  v16 = 0;
  if (!v12)
    return v8;
  if (*((_DWORD *)v12 + 6) != 2)
  {
    *((_DWORD *)v12 + 6) -= 2;
    return v8;
  }
  if ((*((_WORD *)v12 + 15) & 0x400) != 0)
    return v8;
  WebCore::Node::removedLastRef(v12);
  return v8;
}

- (id)textRects
{
  void *v2;
  WTF *v3;
  uint64_t v4;
  uint64_t NSArrayElement;
  void *v6;
  CFTypeRef v7;
  WTF *v9;
  unsigned int v10;
  WebCore::Node *v11;
  WebCore::Node *v12;

  WebCore::makeSimpleRange();
  WebCore::Document::updateLayout();
  WebCore::RenderObject::absoluteTextRects();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v10);
  if (v10)
  {
    v3 = v9;
    v4 = 16 * v10;
    do
    {
      NSArrayElement = WebCore::makeNSArrayElement();
      if (NSArrayElement)
        objc_msgSend(v2, "addObject:", NSArrayElement);
      v3 = (WTF *)((char *)v3 + 16);
      v4 -= 16;
    }
    while (v4);
  }
  v7 = (id)CFMakeCollectable(v2);
  if (v9)
    WTF::fastFree(v9, v6);
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
    return (id)v7;
  if (*((_DWORD *)v11 + 6) != 2)
  {
    *((_DWORD *)v11 + 6) -= 2;
    return (id)v7;
  }
  if ((*((_WORD *)v11 + 15) & 0x400) != 0)
    return (id)v7;
  WebCore::Node::removedLastRef(v11);
  return (id)v7;
}

- (id)description
{
  if (self->super._internal)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<DOMRange: %@ %d %@ %d>"), -[DOMRange startContainer](self, "startContainer"), -[DOMRange startOffset](self, "startOffset"), -[DOMRange endContainer](self, "endContainer"), -[DOMRange endOffset](self, "endOffset"));
  else
    return CFSTR("<DOMRange: null>");
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
      if (*((_DWORD *)internal + 2) == 1)
        (*(void (**)(DOMObjectInternal *))(*(_QWORD *)internal + 8))(internal);
      else
        --*((_DWORD *)internal + 2);
    }
    v5.receiver = self;
    v5.super_class = (Class)DOMRange;
    -[DOMObject dealloc](&v5, sel_dealloc);
  }
}

- (DOMNode)startContainer
{
  DOMNode *v3;
  void *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMNode *)kit(*((WebCore::Node **)self->super._internal + 4));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (int)startOffset
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super._internal + 10);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (DOMNode)endContainer
{
  DOMNode *v3;
  void *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMNode *)kit(*((WebCore::Node **)self->super._internal + 7));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (int)endOffset
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super._internal + 16);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (BOOL)collapsed
{
  void *v3;
  DOMObjectInternal *internal;
  int v5;
  int v6;
  BOOL v7;
  BOOL v8;
  _BYTE v10[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super._internal;
  v7 = *((_QWORD *)internal + 4) == *((_QWORD *)internal + 7);
  v5 = *((_DWORD *)internal + 10);
  v6 = *((_DWORD *)internal + 16);
  v7 = v7 && v5 == v6;
  v8 = v7;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v3);
  return v8;
}

- (DOMNode)commonAncestorContainer
{
  WebCore::Node *v3;
  DOMNode *v4;
  void *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (WebCore::Node *)WebCore::Range::commonAncestorContainer(self->super._internal);
  v4 = (DOMNode *)kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (NSString)text
{
  StringImpl *v2;
  const __CFString *v3;
  WebCore::Node *v4;
  WTF::StringImpl *v6;
  WebCore::Node *v7;
  WebCore::Node *v8;
  _BYTE v9[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  WebCore::makeSimpleRange();
  WebCore::Document::updateLayout();
  WebCore::plainText();
  if (v6)
  {
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v6 == 2)
    {
      WTF::StringImpl::destroy(v6, v2);
      v4 = v8;
      if (!v8)
        goto LABEL_11;
    }
    else
    {
      *(_DWORD *)v6 -= 2;
      v4 = v8;
      if (!v8)
        goto LABEL_11;
    }
  }
  else
  {
    v3 = &stru_1E9D6EC48;
    v4 = v8;
    if (!v8)
      goto LABEL_11;
  }
  if (*((_DWORD *)v4 + 6) == 2)
  {
    if ((*((_WORD *)v4 + 15) & 0x400) == 0)
      WebCore::Node::removedLastRef(v4);
  }
  else
  {
    *((_DWORD *)v4 + 6) -= 2;
  }
LABEL_11:
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
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v2);
  return &v3->isa;
}

- (void)setStart:(DOMNode *)refNode offset:(int)offset
{
  DOMObjectInternal *internal;
  void *v6;
  WebCore::Node *v7;
  char v8;
  uint64_t v9;
  char v10;
  _BYTE v11[88];
  uint64_t v12;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  if (!refNode)
    raiseTypeErrorException();
  internal = refNode->super._internal;
  *((_DWORD *)internal + 6) += 2;
  v7 = internal;
  WebCore::Range::setStart();
  if (v10)
  {
    v11[80] = v8;
    v12 = v9;
    raiseDOMErrorException();
  }
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
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v6);
}

- (void)setEnd:(DOMNode *)refNode offset:(int)offset
{
  DOMObjectInternal *internal;
  void *v6;
  WebCore::Node *v7;
  char v8;
  uint64_t v9;
  char v10;
  _BYTE v11[88];
  uint64_t v12;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  if (!refNode)
    raiseTypeErrorException();
  internal = refNode->super._internal;
  *((_DWORD *)internal + 6) += 2;
  v7 = internal;
  WebCore::Range::setEnd();
  if (v10)
  {
    v11[80] = v8;
    v12 = v9;
    raiseDOMErrorException();
  }
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
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v6);
}

- (void)setStartBefore:(DOMNode *)refNode
{
  void *v5;
  char v6;
  uint64_t v7;
  char v8;
  _BYTE v9[88];
  uint64_t v10;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  if (!refNode)
    raiseTypeErrorException();
  WebCore::Range::setStartBefore(self->super._internal, refNode->super._internal);
  if (v8)
  {
    v9[80] = v6;
    v10 = v7;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v5);
}

- (void)setStartAfter:(DOMNode *)refNode
{
  void *v5;
  char v6;
  uint64_t v7;
  char v8;
  _BYTE v9[88];
  uint64_t v10;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  if (!refNode)
    raiseTypeErrorException();
  WebCore::Range::setStartAfter(self->super._internal, refNode->super._internal);
  if (v8)
  {
    v9[80] = v6;
    v10 = v7;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v5);
}

- (void)setEndBefore:(DOMNode *)refNode
{
  void *v5;
  char v6;
  uint64_t v7;
  char v8;
  _BYTE v9[88];
  uint64_t v10;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  if (!refNode)
    raiseTypeErrorException();
  WebCore::Range::setEndBefore(self->super._internal, refNode->super._internal);
  if (v8)
  {
    v9[80] = v6;
    v10 = v7;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v5);
}

- (void)setEndAfter:(DOMNode *)refNode
{
  void *v5;
  char v6;
  uint64_t v7;
  char v8;
  _BYTE v9[88];
  uint64_t v10;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  if (!refNode)
    raiseTypeErrorException();
  WebCore::Range::setEndAfter(self->super._internal, refNode->super._internal);
  if (v8)
  {
    v9[80] = v6;
    v10 = v7;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v5);
}

- (void)collapse:(BOOL)toStart
{
  void *v4;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::Range::collapse(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (void)selectNode:(DOMNode *)refNode
{
  void *v5;
  char v6;
  uint64_t v7;
  char v8;
  _BYTE v9[88];
  uint64_t v10;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  if (!refNode)
    raiseTypeErrorException();
  WebCore::Range::selectNode(self->super._internal, refNode->super._internal);
  if (v8)
  {
    v9[80] = v6;
    v10 = v7;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v5);
}

- (void)selectNodeContents:(DOMNode *)refNode
{
  void *v5;
  char v6;
  uint64_t v7;
  char v8;
  _BYTE v9[88];
  uint64_t v10;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  if (!refNode)
    raiseTypeErrorException();
  WebCore::Range::selectNodeContents(self->super._internal, refNode->super._internal);
  if (v8)
  {
    v9[80] = v6;
    v10 = v7;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v5);
}

- (__int16)compareBoundaryPoints:(unsigned __int16)how sourceRange:(DOMRange *)sourceRange
{
  uint64_t v5;
  void *v7;
  __int16 result;
  __int16 v9;
  uint64_t v10;
  int v11;
  _BYTE v12[88];
  uint64_t v13;

  v5 = how;
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  if (!sourceRange)
    raiseTypeErrorException();
  WebCore::Range::compareBoundaryPoints(self->super._internal, v5, sourceRange->super._internal);
  if (v11)
  {
    if (v11 == 1)
    {
      v12[80] = v9;
      v13 = v10;
      raiseDOMErrorException();
    }
    result = std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v7);
    return v9;
  }
  return result;
}

- (void)deleteContents
{
  void *v3;
  char v4;
  uint64_t v5;
  char v6;
  _BYTE v7[88];
  uint64_t v8;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::Range::deleteContents(self->super._internal);
  if (v6)
  {
    v7[80] = v4;
    v8 = v5;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
}

- (DOMDocumentFragment)extractContents
{
  WebCore::Node *v3;
  void *v4;
  DOMDocumentFragment *v5;
  DOMDocumentFragment *result;
  uint64_t v7;
  WebCore::Node *v8;
  uint64_t v9;
  int v10;
  WebCore::Node *v11;
  _BYTE v12[80];
  _BYTE v13[8];
  uint64_t v14;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  WebCore::Range::extractContents(self->super._internal);
  if (v10)
  {
    if (v10 == 1)
    {
      v13[0] = (_BYTE)v8;
      v7 = v9;
      v9 = 0;
      v14 = v7;
      raiseDOMErrorException();
    }
    result = (DOMDocumentFragment *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    v3 = v8;
    v8 = 0;
    v11 = v3;
    v5 = (DOMDocumentFragment *)kit(v3);
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
    if (v10 != -1)
      ((void (*)(_BYTE *, WebCore::Node **))off_1E9D6AF60[v10])(v13, &v8);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v4);
    return v5;
  }
  return result;
}

- (DOMDocumentFragment)cloneContents
{
  WebCore::Node *v3;
  void *v4;
  DOMDocumentFragment *v5;
  DOMDocumentFragment *result;
  uint64_t v7;
  WebCore::Node *v8;
  uint64_t v9;
  int v10;
  WebCore::Node *v11;
  _BYTE v12[80];
  _BYTE v13[8];
  uint64_t v14;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  WebCore::Range::cloneContents(self->super._internal);
  if (v10)
  {
    if (v10 == 1)
    {
      v13[0] = (_BYTE)v8;
      v7 = v9;
      v9 = 0;
      v14 = v7;
      raiseDOMErrorException();
    }
    result = (DOMDocumentFragment *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    v3 = v8;
    v8 = 0;
    v11 = v3;
    v5 = (DOMDocumentFragment *)kit(v3);
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
    if (v10 != -1)
      ((void (*)(_BYTE *, WebCore::Node **))off_1E9D6AF60[v10])(v13, &v8);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v4);
    return v5;
  }
  return result;
}

- (void)insertNode:(DOMNode *)newNode
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
  if (!newNode)
    raiseTypeErrorException();
  internal = newNode->super._internal;
  *((_DWORD *)internal + 6) += 2;
  v7 = internal;
  WebCore::Range::insertNode();
  if (v10)
  {
    v11[80] = v8;
    v12 = v9;
    raiseDOMErrorException();
  }
  if (!v7)
    goto LABEL_6;
  if (*((_DWORD *)v7 + 6) != 2)
  {
    *((_DWORD *)v7 + 6) -= 2;
LABEL_6:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v5);
    return;
  }
  if ((*((_WORD *)v7 + 15) & 0x400) != 0)
    goto LABEL_6;
  WebCore::Node::removedLastRef(v7);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v6);
}

- (void)surroundContents:(DOMNode *)newParent
{
  void *v5;
  char v6;
  uint64_t v7;
  char v8;
  _BYTE v9[88];
  uint64_t v10;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  if (!newParent)
    raiseTypeErrorException();
  WebCore::Range::surroundContents(self->super._internal, newParent->super._internal);
  if (v8)
  {
    v9[80] = v6;
    v10 = v7;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v5);
}

- (DOMRange)cloneRange
{
  void *v3;
  DOMObjectInternal *v4;
  WebCore::Range *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::Range::cloneRange(self->super._internal);
  v4 = kit(v6);
  if (v6)
  {
    if (*((_DWORD *)v6 + 2) == 1)
      (*(void (**)())(*(_QWORD *)v6 + 8))();
    else
      --*((_DWORD *)v6 + 2);
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return (DOMRange *)v4;
}

- (NSString)toString
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::Range::toString(self->super._internal);
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

- (void)detach
{
  void *v2;
  _BYTE v3[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v3, v2);
}

- (DOMDocumentFragment)createContextualFragment:(NSString *)html
{
  WebCore::Node *v4;
  void *v5;
  DOMDocumentFragment *v6;
  DOMDocumentFragment *result;
  uint64_t v8;
  uint64_t v9;
  int v10;
  WebCore::Node *v11;
  uint64_t v12;
  int v13;
  WebCore::Node *v14;
  _BYTE v15[80];
  _BYTE v16[8];
  uint64_t v17;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  MEMORY[0x1D82A3998](&v9, html);
  v10 = 1;
  WebCore::Range::createContextualFragment();
  if (v13)
  {
    if (v13 == 1)
    {
      v16[0] = (_BYTE)v11;
      v8 = v12;
      v12 = 0;
      v17 = v8;
      raiseDOMErrorException();
    }
    result = (DOMDocumentFragment *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    v4 = v11;
    v11 = 0;
    v14 = v4;
    v6 = (DOMDocumentFragment *)kit(v4);
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
    if (v13 != -1)
      ((void (*)(_BYTE *, WebCore::Node **))off_1E9D6AF60[v13])(v16, &v11);
    v13 = -1;
    if (v10 != -1)
      ((void (*)(_BYTE *, uint64_t *))off_1E9D6AF70[v10])(v16, &v9);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v5);
    return v6;
  }
  return result;
}

- (__int16)compareNode:(DOMNode *)refNode
{
  void *v5;
  __int16 result;
  unsigned __int8 v7;
  uint64_t v8;
  int v9;
  _BYTE v10[88];
  uint64_t v11;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  if (!refNode)
    raiseTypeErrorException();
  WebCore::Range::compareNode(self->super._internal, refNode->super._internal);
  if (v9)
  {
    if (v9 == 1)
    {
      v10[80] = v7;
      v11 = v8;
      raiseDOMErrorException();
    }
    result = std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v5);
    return v7;
  }
  return result;
}

- (BOOL)intersectsNode:(DOMNode *)refNode
{
  char v5;
  void *v6;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  if (!refNode)
    raiseTypeErrorException();
  v5 = WebCore::Range::intersectsNode(self->super._internal, refNode->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
  return v5;
}

- (__int16)comparePoint:(DOMNode *)refNode offset:(int)offset
{
  void *v6;
  __int16 result;
  __int16 v8;
  uint64_t v9;
  int v10;
  _BYTE v11[88];
  uint64_t v12;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  if (!refNode)
    raiseTypeErrorException();
  WebCore::Range::comparePoint(self->super._internal, refNode->super._internal);
  if (v10)
  {
    if (v10 == 1)
    {
      v11[80] = v8;
      v12 = v9;
      raiseDOMErrorException();
    }
    result = std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v6);
    return v8;
  }
  return result;
}

- (BOOL)isPointInRange:(DOMNode *)refNode offset:(int)offset
{
  void *v6;
  BOOL result;
  BOOL v8;
  uint64_t v9;
  int v10;
  _BYTE v11[88];
  uint64_t v12;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  if (!refNode)
    raiseTypeErrorException();
  WebCore::Range::isPointInRange(self->super._internal, refNode->super._internal);
  if (v10)
  {
    if (v10 == 1)
    {
      v11[80] = v8;
      v12 = v9;
      raiseDOMErrorException();
    }
    result = std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v6);
    return v8;
  }
  return result;
}

- (void)expand:(id)a3
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
  internal = self->super._internal;
  MEMORY[0x1D82A3998](&v10, a3);
  WebCore::Range::expand(internal, (const WTF::String *)&v10);
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

- (void)move:(unsigned int)a3 inDirection:(int)a4
{
  WebCore::Node *v6;
  WebCore::Node *v7;
  uint64_t v8;
  StringImpl *v9;
  WebCore::Node *v10;
  uint64_t v11;
  StringImpl *v12;
  WebCore::Node *v13;
  WebCore::Node *v14;
  WebCore::Node *v15;
  WTF::StringImpl *v16;
  char v17;
  WebCore::Node *v18;
  WebCore::Node *v19;
  WTF::StringImpl *v20;
  char v21;
  WebCore::Node *v22;
  WebCore::Node *v23;
  WebCore::Node *v24;
  _BYTE v25[120];
  uint64_t v26;
  uint64_t v27;

  MEMORY[0x1D82A4748](v25, 0);
  WebCore::makeSimpleRange();
  WebCore::VisibleSelection::VisibleSelection();
  WebCore::FrameSelection::setSelection();
  WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)&v24);
  v6 = v23;
  v23 = 0;
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
  v7 = v22;
  v22 = 0;
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
  if (a4 == 4)
  {
    if (!a3)
      goto LABEL_19;
  }
  else if (a4 == 5)
  {
    if (!a3)
      goto LABEL_19;
  }
  else if (!a3)
  {
    goto LABEL_19;
  }
  do
  {
    WebCore::FrameSelection::modify();
    --a3;
  }
  while (a3);
LABEL_19:
  WebCore::Position::parentAnchoredEquivalent((WebCore::Position *)&v26);
  WebCore::Position::parentAnchoredEquivalent((WebCore::Position *)&v27);
  if (!WebCore::Position::containerNode((WebCore::Position *)&v24))
    goto LABEL_30;
  v8 = WebCore::Position::containerNode((WebCore::Position *)&v24);
  *(_DWORD *)(v8 + 24) += 2;
  v18 = (WebCore::Node *)v8;
  WebCore::Range::setStart();
  if (v21 && v20)
  {
    if (*(_DWORD *)v20 == 2)
    {
      WTF::StringImpl::destroy(v20, v9);
      v10 = v18;
      if (!v18)
        goto LABEL_30;
      goto LABEL_25;
    }
    *(_DWORD *)v20 -= 2;
  }
  v10 = v18;
  if (!v18)
    goto LABEL_30;
LABEL_25:
  if (*((_DWORD *)v10 + 6) == 2)
  {
    if ((*((_WORD *)v10 + 15) & 0x400) == 0)
      WebCore::Node::removedLastRef(v10);
  }
  else
  {
    *((_DWORD *)v10 + 6) -= 2;
  }
LABEL_30:
  if (!WebCore::Position::containerNode((WebCore::Position *)&v22))
    goto LABEL_41;
  v11 = WebCore::Position::containerNode((WebCore::Position *)&v22);
  *(_DWORD *)(v11 + 24) += 2;
  v19 = (WebCore::Node *)v11;
  WebCore::Range::setEnd();
  if (v17 && v16)
  {
    if (*(_DWORD *)v16 == 2)
    {
      WTF::StringImpl::destroy(v16, v12);
      v13 = v19;
      if (!v19)
        goto LABEL_41;
      goto LABEL_36;
    }
    *(_DWORD *)v16 -= 2;
  }
  v13 = v19;
  if (!v19)
    goto LABEL_41;
LABEL_36:
  if (*((_DWORD *)v13 + 6) == 2)
  {
    if ((*((_WORD *)v13 + 15) & 0x400) == 0)
      WebCore::Node::removedLastRef(v13);
  }
  else
  {
    *((_DWORD *)v13 + 6) -= 2;
  }
LABEL_41:
  v14 = v22;
  v22 = 0;
  if (v14)
  {
    if (*((_DWORD *)v14 + 6) == 2)
    {
      if ((*((_WORD *)v14 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v14);
    }
    else
    {
      *((_DWORD *)v14 + 6) -= 2;
    }
  }
  v15 = v24;
  v24 = 0;
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
  MEMORY[0x1D82A4754](v25);
}

- (void)extend:(unsigned int)a3 inDirection:(int)a4
{
  WebCore::Node *v5;
  WebCore::Node *v6;
  uint64_t v7;
  StringImpl *v8;
  WebCore::Node *v9;
  uint64_t v10;
  StringImpl *v11;
  WebCore::Node *v12;
  WebCore::Node *v13;
  WebCore::Node *v14;
  WTF::StringImpl *v15;
  char v16;
  WebCore::Node *v17;
  WebCore::Node *v18;
  WTF::StringImpl *v19;
  char v20;
  WebCore::Node *v21;
  WebCore::Node *v22;
  WebCore::Node *v23;
  _BYTE v24[120];
  uint64_t v25;
  uint64_t v26;

  MEMORY[0x1D82A4748](v24, 0);
  WebCore::makeSimpleRange();
  WebCore::VisibleSelection::VisibleSelection();
  WebCore::FrameSelection::setSelection();
  WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)&v23);
  v5 = v22;
  v22 = 0;
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
  v6 = v21;
  v21 = 0;
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
  for (; a3; --a3)
    WebCore::FrameSelection::modify();
  WebCore::Position::parentAnchoredEquivalent((WebCore::Position *)&v25);
  WebCore::Position::parentAnchoredEquivalent((WebCore::Position *)&v26);
  if (WebCore::Position::containerNode((WebCore::Position *)&v23))
  {
    v7 = WebCore::Position::containerNode((WebCore::Position *)&v23);
    *(_DWORD *)(v7 + 24) += 2;
    v17 = (WebCore::Node *)v7;
    WebCore::Range::setStart();
    if (v20 && v19)
    {
      if (*(_DWORD *)v19 == 2)
      {
        WTF::StringImpl::destroy(v19, v8);
        v9 = v17;
        if (!v17)
          goto LABEL_24;
        goto LABEL_19;
      }
      *(_DWORD *)v19 -= 2;
    }
    v9 = v17;
    if (!v17)
      goto LABEL_24;
LABEL_19:
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
LABEL_24:
  if (!WebCore::Position::containerNode((WebCore::Position *)&v21))
    goto LABEL_35;
  v10 = WebCore::Position::containerNode((WebCore::Position *)&v21);
  *(_DWORD *)(v10 + 24) += 2;
  v18 = (WebCore::Node *)v10;
  WebCore::Range::setEnd();
  if (v16 && v15)
  {
    if (*(_DWORD *)v15 == 2)
    {
      WTF::StringImpl::destroy(v15, v11);
      v12 = v18;
      if (!v18)
        goto LABEL_35;
      goto LABEL_30;
    }
    *(_DWORD *)v15 -= 2;
  }
  v12 = v18;
  if (!v18)
    goto LABEL_35;
LABEL_30:
  if (*((_DWORD *)v12 + 6) == 2)
  {
    if ((*((_WORD *)v12 + 15) & 0x400) == 0)
      WebCore::Node::removedLastRef(v12);
  }
  else
  {
    *((_DWORD *)v12 + 6) -= 2;
  }
LABEL_35:
  v13 = v21;
  v21 = 0;
  if (v13)
  {
    if (*((_DWORD *)v13 + 6) == 2)
    {
      if ((*((_WORD *)v13 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v13);
    }
    else
    {
      *((_DWORD *)v13 + 6) -= 2;
    }
  }
  v14 = v23;
  v23 = 0;
  if (v14)
  {
    if (*((_DWORD *)v14 + 6) == 2)
    {
      if ((*((_WORD *)v14 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v14);
    }
    else
    {
      *((_DWORD *)v14 + 6) -= 2;
    }
  }
  MEMORY[0x1D82A4754](v24);
}

- (id)firstNode
{
  WebCore::NodeTraversal *AncestorSibling;
  __int16 v3;
  const Node *v4;
  WebCore::Node *v5;
  WebCore::Node *v6;
  WebCore::NodeTraversal *v8;
  unsigned int v9;
  WebCore::Node *v10;

  WebCore::makeSimpleRange();
  AncestorSibling = v8;
  v3 = *((_WORD *)v8 + 14);
  if ((v3 & 1) == 0)
  {
    v4 = (const Node *)v9;
    if ((v3 & 4) != 0)
    {
      v5 = (WebCore::Node *)WebCore::ContainerNode::traverseToChildAt(v8);
      if (v5)
        goto LABEL_9;
      v4 = (const Node *)v9;
      AncestorSibling = v8;
    }
    if ((_DWORD)v4)
    {
      v5 = (WebCore::Node *)*((_QWORD *)AncestorSibling + 7);
      if (v5)
        goto LABEL_9;
      AncestorSibling = (WebCore::NodeTraversal *)WebCore::NodeTraversal::nextAncestorSibling(AncestorSibling, v4);
    }
  }
  v5 = AncestorSibling;
LABEL_9:
  v6 = kit(v5);
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
  if (!v8)
    return v6;
  if (*((_DWORD *)v8 + 6) != 2)
  {
    *((_DWORD *)v8 + 6) -= 2;
    return v6;
  }
  if ((*((_WORD *)v8 + 15) & 0x400) != 0)
    return v6;
  WebCore::Node::removedLastRef(v8);
  return v6;
}

- (WebArchive)webArchive
{
  WebArchive *v2;
  const WebCore::SimpleRange *v3;
  WebArchive *v4;
  _DWORD *v5;
  WebCore::Node *v6;
  WebCore::Node *v7;
  WebCore::Node *v9;
  WebCore::Node *v10;
  _DWORD *v11;

  v2 = [WebArchive alloc];
  WebCore::makeSimpleRange();
  WebCore::LegacyWebArchive::create((WebCore::LegacyWebArchive *)&v9, v3);
  v4 = (id)CFMakeCollectable(-[WebArchive _initWithCoreLegacyWebArchive:](v2, "_initWithCoreLegacyWebArchive:", &v11));
  v5 = v11;
  v11 = 0;
  if (!v5)
  {
LABEL_4:
    v6 = v10;
    v10 = 0;
    if (!v6)
      goto LABEL_11;
    goto LABEL_7;
  }
  if (v5[2] != 1)
  {
    --v5[2];
    goto LABEL_4;
  }
  (*(void (**)(_DWORD *))(*(_QWORD *)v5 + 8))(v5);
  v6 = v10;
  v10 = 0;
  if (!v6)
    goto LABEL_11;
LABEL_7:
  if (*((_DWORD *)v6 + 6) == 2)
  {
    if ((*((_WORD *)v6 + 15) & 0x400) == 0)
      WebCore::Node::removedLastRef(v6);
  }
  else
  {
    *((_DWORD *)v6 + 6) -= 2;
  }
LABEL_11:
  v7 = v9;
  v9 = 0;
  if (!v7)
    return v4;
  if (*((_DWORD *)v7 + 6) != 2)
  {
    *((_DWORD *)v7 + 6) -= 2;
    return v4;
  }
  if ((*((_WORD *)v7 + 15) & 0x400) != 0)
    return v4;
  WebCore::Node::removedLastRef(v7);
  return v4;
}

- (NSString)markupString
{
  const Document *v2;
  NSString *result;
  int v4;
  int v5;
  unsigned int v6;
  int v7;
  WTF::StringImpl *v8;
  StringImpl *v9;
  NSString *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  WebCore::Node *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  WebCore::Node *v16;
  WebCore::Node *v17;
  WTF::StringImpl *v18;

  WebCore::makeSimpleRange();
  WebCore::documentTypeString(*(WebCore **)(*((_QWORD *)v16 + 5) + 8), v2);
  result = (NSString *)WebCore::serializePreservingVisualAppearance();
  if (v15)
  {
    v4 = *((_DWORD *)v15 + 1);
    if (v14)
      goto LABEL_3;
  }
  else
  {
    v4 = 0;
    if (v14)
    {
LABEL_3:
      v5 = *((_DWORD *)v14 + 1);
      if ((v5 | v4) < 0)
        goto LABEL_40;
      goto LABEL_7;
    }
  }
  v5 = 0;
  if (v4 < 0)
    goto LABEL_40;
LABEL_7:
  result = (NSString *)(v4 + v5);
  if (__OFADD__(v4, v5))
    goto LABEL_40;
  if (!v15)
  {
    if (!v14)
    {
      v7 = 1;
      goto LABEL_15;
    }
LABEL_13:
    v7 = (*((unsigned __int8 *)v14 + 16) >> 2) & 1;
    goto LABEL_15;
  }
  v6 = *((_DWORD *)v15 + 4);
  v7 = (v6 >> 2) & 1;
  if (v14 && (v6 & 4) != 0)
    goto LABEL_13;
LABEL_15:
  result = (NSString *)WTF::tryMakeStringImplFromAdaptersInternal<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((unint64_t)result, v7, (uint64_t)v15, (uint64_t)v14, &v18);
  v8 = v18;
  if (v18)
  {
    v10 = (NSString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v8 == 2)
    {
      WTF::StringImpl::destroy(v8, v9);
      v11 = v14;
      if (!v14)
        goto LABEL_22;
    }
    else
    {
      *(_DWORD *)v8 -= 2;
      v11 = v14;
      if (!v14)
        goto LABEL_22;
    }
    if (*(_DWORD *)v11 == 2)
    {
      WTF::StringImpl::destroy(v11, v9);
      v12 = v15;
      if (!v15)
        goto LABEL_27;
LABEL_25:
      if (*(_DWORD *)v12 == 2)
      {
        WTF::StringImpl::destroy(v12, v9);
        v13 = v17;
        if (!v17)
          goto LABEL_34;
LABEL_30:
        if (*((_DWORD *)v13 + 6) == 2)
        {
          if ((*((_WORD *)v13 + 15) & 0x400) == 0)
            WebCore::Node::removedLastRef(v13);
        }
        else
        {
          *((_DWORD *)v13 + 6) -= 2;
        }
LABEL_34:
        if (v16)
        {
          if (*((_DWORD *)v16 + 6) == 2)
          {
            if ((*((_WORD *)v16 + 15) & 0x400) == 0)
            {
              WebCore::Node::removedLastRef(v16);
              return v10;
            }
          }
          else
          {
            *((_DWORD *)v16 + 6) -= 2;
          }
        }
        return v10;
      }
      *(_DWORD *)v12 -= 2;
LABEL_27:
      v13 = v17;
      if (!v17)
        goto LABEL_34;
      goto LABEL_30;
    }
    *(_DWORD *)v11 -= 2;
LABEL_22:
    v12 = v15;
    if (!v15)
      goto LABEL_27;
    goto LABEL_25;
  }
LABEL_40:
  __break(0xC471u);
  return result;
}

- (id)startPosition
{
  WebCore::Node *v2;
  id v3;
  WebCore::Node *v4;
  WebCore::Node *v6;
  WebCore::Node *v7;
  WebCore::Node *v8;

  v2 = (WebCore::Node *)*((_QWORD *)self->super._internal + 4);
  *((_DWORD *)v2 + 6) += 2;
  v6 = v2;
  WebCore::Position::Position();
  WebCore::VisiblePosition::VisiblePosition();
  v3 = +[WebVisiblePosition _wrapVisiblePosition:](WebVisiblePosition, "_wrapVisiblePosition:", &v8);
  v4 = v8;
  v8 = 0;
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
  if (!v6)
    return v3;
  if (*((_DWORD *)v6 + 6) != 2)
  {
    *((_DWORD *)v6 + 6) -= 2;
    return v3;
  }
  if ((*((_WORD *)v6 + 15) & 0x400) != 0)
    return v3;
  WebCore::Node::removedLastRef(v6);
  return v3;
}

- (id)endPosition
{
  WebCore::Node *v2;
  id v3;
  WebCore::Node *v4;
  WebCore::Node *v6;
  WebCore::Node *v7;
  WebCore::Node *v8;

  v2 = (WebCore::Node *)*((_QWORD *)self->super._internal + 7);
  *((_DWORD *)v2 + 6) += 2;
  v6 = v2;
  WebCore::Position::Position();
  WebCore::VisiblePosition::VisiblePosition();
  v3 = +[WebVisiblePosition _wrapVisiblePosition:](WebVisiblePosition, "_wrapVisiblePosition:", &v8);
  v4 = v8;
  v8 = 0;
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
  if (!v6)
    return v3;
  if (*((_DWORD *)v6 + 6) != 2)
  {
    *((_DWORD *)v6 + 6) -= 2;
    return v3;
  }
  if ((*((_WORD *)v6 + 15) & 0x400) != 0)
    return v3;
  WebCore::Node::removedLastRef(v6);
  return v3;
}

- (id)enclosingWordRange
{
  id v3;
  id v4;
  Node *var0;
  Node *v6;
  id v7;
  WebCore::Node *v8;
  id v9;
  WebCore::Node *v10;
  id v11;
  WebCore::Node *v13;
  WebCore::Node *v14;
  VisiblePosition v15;
  VisiblePosition v16;
  uint64_t v17[12];

  v3 = -[DOMRange startPosition](self, "startPosition");
  if (v3)
    objc_msgSend(v3, "_visiblePosition");
  else
    memset(&v15, 0, sizeof(v15));
  v4 = -[DOMRange endPosition](self, "endPosition");
  if (v4)
    objc_msgSend(v4, "_visiblePosition");
  else
    memset(&v16, 0, sizeof(v16));
  WebCore::VisibleSelection::VisibleSelection((WebCore::VisibleSelection *)v17, &v15, &v16);
  var0 = v16.var0.var0.var0;
  v16.var0.var0.var0 = 0;
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
  v6 = v15.var0.var0.var0;
  v15.var0.var0.var0 = 0;
  if (v6)
  {
    if (*((_DWORD *)v6 + 6) == 2)
    {
      if ((*((_WORD *)v6 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef((WebCore::Node *)v6);
    }
    else
    {
      *((_DWORD *)v6 + 6) -= 2;
    }
  }
  WebCore::FrameSelection::wordSelectionContainingCaretSelection();
  WebCore::VisibleSelection::operator=(v17, (uint64_t *)&v15);
  WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)&v15);
  WebCore::VisiblePosition::VisiblePosition();
  v7 = +[WebVisiblePosition _wrapVisiblePosition:](WebVisiblePosition, "_wrapVisiblePosition:", &v14);
  v8 = v14;
  v14 = 0;
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
  WebCore::VisiblePosition::VisiblePosition();
  v9 = +[WebVisiblePosition _wrapVisiblePosition:](WebVisiblePosition, "_wrapVisiblePosition:", &v13);
  v10 = v13;
  v13 = 0;
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
  v11 = +[DOMRange rangeForFirstPosition:second:](DOMRange, "rangeForFirstPosition:second:", v7, v9);
  WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)v17);
  return v11;
}

+ (id)rangeForFirstPosition:(id)a3 second:(id)a4
{
  const VisiblePosition *v5;
  int v6;
  Node *var0;
  char v8;
  unsigned int var1;
  BOOL v10;
  const VisiblePosition *v11;
  WebCore::Node *v12;
  uint64_t v13;
  DOMObjectInternal *v14;
  DOMObjectInternal *v15;
  WebCore::Node *v16;
  Node *v17;
  WebCore::Node *v19;
  WebCore::Node *v20;
  char v21;
  WebCore::Node *v22;
  uint64_t v23;
  _BOOL8 v24;
  VisiblePosition v25;
  WebCore::Node *v26;
  char v27;
  uint64_t v28;
  char v29;
  DOMObjectInternal *v30;
  WebCore::Node *v31;

  if (!a3)
  {
    memset(&v25, 0, sizeof(v25));
    if (a4)
      goto LABEL_3;
LABEL_5:
    v22 = 0;
    v23 = 0;
    v24 = 0;
    goto LABEL_6;
  }
  objc_msgSend(a3, "_visiblePosition");
  if (!a4)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(a4, "_visiblePosition");
LABEL_6:
  v6 = (char)WebCore::documentOrder((WebCore *)&v22, &v25, (const VisiblePosition *)a3);
  if (v6 != -127 && v6 < 0)
  {
    var0 = v25.var0.var0.var0;
    v8 = *((_BYTE *)&v25.var0 + 12);
    var1 = v25.var0.var1;
    v10 = v25.var1;
    v25.var0.var0.var0 = (Node *)v22;
    v25.var0.var1 = v23;
    *((_BYTE *)&v25.var0 + 12) = BYTE4(v23);
    v25.var1 = v24;
    v22 = (WebCore::Node *)var0;
    LODWORD(v23) = var1;
    BYTE4(v23) = v8;
    LOBYTE(v24) = v10;
  }
  WebCore::makeBoundaryPoint((WebCore *)&v25, v5);
  WebCore::makeBoundaryPoint((WebCore *)&v22, v11);
  if (v29 && v27)
  {
    WebCore::SimpleRange::SimpleRange();
    v19 = v30;
    v20 = v31;
    v21 = 1;
    if (!v27)
      goto LABEL_19;
  }
  else
  {
    LOBYTE(v19) = 0;
    v21 = 0;
    if (!v27)
      goto LABEL_19;
  }
  v12 = v26;
  v26 = 0;
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
LABEL_19:
  if (v29)
  {
    v13 = v28;
    v28 = 0;
    if (v13)
    {
      if (*(_DWORD *)(v13 + 24) == 2)
      {
        if ((*(_WORD *)(v13 + 30) & 0x400) == 0)
          WebCore::Node::removedLastRef((WebCore::Node *)v13);
      }
      else
      {
        *(_DWORD *)(v13 + 24) -= 2;
      }
    }
  }
  WebCore::createLiveRange();
  v14 = kit(v30);
  v15 = v30;
  v30 = 0;
  if (!v15)
  {
LABEL_28:
    if (!v21)
      goto LABEL_41;
    goto LABEL_31;
  }
  if (*((_DWORD *)v15 + 2) != 1)
  {
    --*((_DWORD *)v15 + 2);
    goto LABEL_28;
  }
  (*(void (**)(DOMObjectInternal *))(*(_QWORD *)v15 + 8))(v15);
  if (!v21)
    goto LABEL_41;
LABEL_31:
  if (v20)
  {
    if (*((_DWORD *)v20 + 6) == 2)
    {
      if ((*((_WORD *)v20 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v20);
    }
    else
    {
      *((_DWORD *)v20 + 6) -= 2;
    }
  }
  if (v19)
  {
    if (*((_DWORD *)v19 + 6) == 2)
    {
      if ((*((_WORD *)v19 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v19);
    }
    else
    {
      *((_DWORD *)v19 + 6) -= 2;
    }
  }
LABEL_41:
  v16 = v22;
  v22 = 0;
  if (v16)
  {
    if (*((_DWORD *)v16 + 6) == 2)
    {
      if ((*((_WORD *)v16 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v16);
    }
    else
    {
      *((_DWORD *)v16 + 6) -= 2;
    }
  }
  v17 = v25.var0.var0.var0;
  v25.var0.var0.var0 = 0;
  if (v17)
  {
    if (*((_DWORD *)v17 + 6) == 2)
    {
      if ((*((_WORD *)v17 + 15) & 0x400) == 0)
      {
        WebCore::Node::removedLastRef((WebCore::Node *)v17);
        return v14;
      }
    }
    else
    {
      *((_DWORD *)v17 + 6) -= 2;
    }
  }
  return v14;
}

@end
