@implementation UIPDFSelection

- (UIPDFSelection)init
{
  UIPDFSelection *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIPDFSelection;
  result = -[UIPDFSelection init](&v3, sel_init);
  if (result)
  {
    result->_dirty = 0;
    result->_cachedStartIndex = -1;
    result->_cachedEndIndex = -1;
    result->_string = 0;
    result->_cgSelection = 0;
  }
  return result;
}

- (UIPDFSelection)initWithPage:(id)a3 fromArchive:(id)a4
{
  UIPDFSelection *v6;
  uint64_t v7;
  void *v8;
  UIPDFParserDelegate *v9;
  const CGPath *MutableCopy;

  v6 = -[UIPDFSelection init](self, "init");
  if (v6)
  {
    v6->_page = (UIPDFPage *)a3;
    v7 = objc_msgSend(a4, "dataUsingEncoding:", 4);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B28]), "initWithData:", v7);
    v9 = objc_alloc_init(UIPDFParserDelegate);
    objc_msgSend(v8, "setDelegate:", v9);
    objc_msgSend(v8, "parse");
    if (-[UIPDFParserDelegate parserError](v9, "parserError"))
      MutableCopy = 0;
    else
      MutableCopy = CGPathCreateMutableCopy(-[UIPDFParserDelegate path](v9, "path"));

    if (MutableCopy)
    {
      objc_msgSend(a3, "CGPage");
      v6->_cgSelection = (CGPDFSelection *)CGPDFSelectionCreateInPath();
      CGPathRelease(MutableCopy);
    }
  }
  return v6;
}

- (UIPDFSelection)initWithSelection:(id)a3
{
  UIPDFSelection *v4;

  v4 = -[UIPDFSelection init](self, "init");
  if (v4)
  {
    v4->_page = (UIPDFPage *)(id)objc_msgSend(a3, "page");
    objc_msgSend(a3, "CGSelection");
    v4->_cgSelection = (CGPDFSelection *)CGPDFSelectionCreateFromSelection();
  }
  return v4;
}

- (UIPDFSelection)initWithPage:(id)a3 fromIndex:(unint64_t)a4 toIndex:(unint64_t)a5
{
  UIPDFSelection *v6;

  v6 = -[UIPDFSelection init](self, "init");
  if (v6)
  {
    v6->_page = (UIPDFPage *)a3;
    objc_msgSend(a3, "CGPage");
    v6->_cgSelection = (CGPDFSelection *)CGPDFSelectionCreateForRange();
  }
  return v6;
}

- (id)page
{
  return self->_page;
}

- (CGAffineTransform)transform
{
  CGAffineTransform *result;
  CGAffineTransform *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  CGAffineTransform v11;
  CGAffineTransform t1;
  CGAffineTransform v13[2];

  result = (CGAffineTransform *)self->_cgSelection;
  if (!result || (result = (CGAffineTransform *)CGPDFSelectionGetNumberOfRectsAndTransforms(), (uint64_t)result < 1))
  {
LABEL_8:
    v9 = MEMORY[0x1E0C9BAA8];
    v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->c = v10;
    v8 = *(_OWORD *)(v9 + 32);
    goto LABEL_9;
  }
  v5 = result;
  memset(&v13[1], 0, sizeof(CGAffineTransform));
  result = (CGAffineTransform *)CGPDFSelectionGetRectAndTransform();
  if (v5 != (CGAffineTransform *)1)
  {
    v6 = 1;
    do
    {
      memset(v13, 0, 48);
      CGPDFSelectionGetRectAndTransform();
      t1 = v13[1];
      v11 = v13[0];
      result = (CGAffineTransform *)CGAffineTransformEqualToTransform(&t1, &v11);
      if ((result & 1) == 0)
        goto LABEL_8;
    }
    while (v5 != (CGAffineTransform *)++v6);
  }
  v7 = *(_OWORD *)&v13[1].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v13[1].a;
  *(_OWORD *)&retstr->c = v7;
  v8 = *(_OWORD *)&v13[1].tx;
LABEL_9:
  *(_OWORD *)&retstr->tx = v8;
  return result;
}

- (CGRect)bounds
{
  uint64_t NumberOfRectsAndTransforms;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  _BOOL4 IsIdentity;
  _BOOL4 v9;
  uint64_t i;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v15;
  double v16;
  double v17;
  double v18;
  _BYTE v19[128];
  CGAffineTransform v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect result;

  if (self->_cgSelection)
  {
    NumberOfRectsAndTransforms = CGPDFSelectionGetNumberOfRectsAndTransforms();
    v4 = *MEMORY[0x1E0C9D628];
    v5 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v7 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    -[UIPDFSelection transform](self, "transform");
    IsIdentity = CGAffineTransformIsIdentity(&v20);
    if (NumberOfRectsAndTransforms >= 1)
    {
      v9 = IsIdentity;
      for (i = 0; i != NumberOfRectsAndTransforms; ++i)
      {
        memset(&v19[48], 0, 80);
        CGPDFSelectionGetRectAndTransform();
        y = *(double *)&v19[104];
        x = *(double *)&v19[96];
        height = *(double *)&v19[120];
        width = *(double *)&v19[112];
        if (v9)
        {
          *(CGAffineTransform *)v19 = *(CGAffineTransform *)&v19[48];
          v21 = CGRectApplyAffineTransform(*(CGRect *)&v19[96], (CGAffineTransform *)v19);
          x = v21.origin.x;
          y = v21.origin.y;
          width = v21.size.width;
          height = v21.size.height;
          *(CGRect *)&v19[96] = v21;
        }
        v22.origin.x = v4;
        v22.origin.y = v5;
        v22.size.width = v6;
        v22.size.height = v7;
        v23 = CGRectUnion(v22, *(CGRect *)&x);
        v4 = v23.origin.x;
        v5 = v23.origin.y;
        v6 = v23.size.width;
        v7 = v23.size.height;
      }
    }
  }
  else
  {
    v4 = *MEMORY[0x1E0C9D628];
    v5 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v7 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v15 = v4;
  v16 = v5;
  v17 = v6;
  v18 = v7;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)string
{
  _BOOL4 dirty;
  id result;

  dirty = self->_dirty;
  result = self->_string;
  if (dirty)
  {
    if (result)
    {
      CFRelease(result);
      self->_string = 0;
    }
  }
  else if (result)
  {
    goto LABEL_7;
  }
  result = self->_cgSelection;
  if (result)
  {
    result = (id)CGPDFSelectionCreateString();
    self->_string = (__CFString *)result;
  }
LABEL_7:
  self->_dirty = 0;
  return result;
}

- (id)attributedStringAtIndex:(unint64_t)a3
{
  uint64_t v3;
  void *AttributedString;

  CGPDFSelectionGetRangeForRectIndex();
  if (!v3)
    return 0;
  CGPDFSelectionGetPage();
  CGPDFSelectionCreateForRange();
  AttributedString = (void *)CGPDFSelectionCreateAttributedString();
  CGPDFSelectionRelease();
  return AttributedString;
}

- (BOOL)isEmpty
{
  if (self->_cgSelection)
    return CGPDFSelectionIsEmpty();
  else
    return 1;
}

- (BOOL)isNonEmpty
{
  CGPDFSelection *cgSelection;

  cgSelection = self->_cgSelection;
  if (cgSelection)
    LOBYTE(cgSelection) = CGPDFSelectionIsEmpty() ^ 1;
  return (char)cgSelection;
}

- (id)selectionExtendedToLineBoundaries
{
  const __CFArray *SelectionsByLine;
  const __CFArray *v4;
  CFIndex Count;
  CFIndex v6;
  const void *ValueAtIndex;
  const void *v8;
  uint64_t v9;
  UIPDFSelection *v10;

  if (!self->_cgSelection)
    return 0;
  SelectionsByLine = (const __CFArray *)CGPDFSelectionCreateSelectionsByLine();
  if (!SelectionsByLine)
    return 0;
  v4 = SelectionsByLine;
  Count = CFArrayGetCount(SelectionsByLine);
  if (!Count
    || (v6 = Count,
        ValueAtIndex = CFArrayGetValueAtIndex(v4, 0),
        v8 = CFArrayGetValueAtIndex(v4, v6 - 1),
        !ValueAtIndex)
    || !v8
    || !CGPDFSelectionCreateContainingSelection())
  {
LABEL_12:
    CFRelease(v4);
    return 0;
  }
  if (!CGPDFSelectionCreateContainingSelection())
  {
    CGPDFSelectionRelease();
    goto LABEL_12;
  }
  objc_msgSend(-[UIPDFSelection page](self, "page"), "CGPage");
  CGPDFSelectionGetTextRange();
  if (CGPDFSelectionGetNumberOfTextRanges() >= 1
    && (CGPDFSelectionGetTextRange(), (v9 = CGPDFSelectionCreateForRange()) != 0))
  {
    v10 = -[UIPDFSelection initWithPage:cgSelection:]([UIPDFSelection alloc], "initWithPage:cgSelection:", -[UIPDFSelection page](self, "page"), v9);
    CGPDFSelectionRelease();
  }
  else
  {
    v10 = 0;
  }
  CGPDFSelectionRelease();
  CGPDFSelectionRelease();
  CFRelease(v4);
  return v10;
}

- (id)containingTextLine
{
  id result;
  uint64_t ContainingSelection;
  UIPDFSelection *v5;

  result = self->_cgSelection;
  if (result)
  {
    ContainingSelection = CGPDFSelectionCreateContainingSelection();
    if (ContainingSelection)
    {
      v5 = -[UIPDFSelection initWithPage:cgSelection:]([UIPDFSelection alloc], "initWithPage:cgSelection:", -[UIPDFSelection page](self, "page"), ContainingSelection);
      CGPDFSelectionRelease();
    }
    else
    {
      v5 = 0;
    }
    return v5;
  }
  return result;
}

- (BOOL)isWord
{
  CGPDFSelection *cgSelection;

  cgSelection = self->_cgSelection;
  if (cgSelection)
    LOBYTE(cgSelection) = CGPDFSelectionIsWord();
  return (char)cgSelection;
}

- (unint64_t)numberOfRectangles
{
  unint64_t result;

  result = (unint64_t)self->_cgSelection;
  if (result)
    return CGPDFSelectionGetNumberOfRectsAndTransforms();
  return result;
}

- (BOOL)getBounds:(CGRect *)a3 transform:(CGAffineTransform *)a4 index:(unint64_t)a5
{
  CGPDFSelection *cgSelection;
  CGSize v6;
  uint64_t v7;
  __int128 v8;

  cgSelection = self->_cgSelection;
  if (cgSelection)
  {
    LOBYTE(cgSelection) = CGPDFSelectionGetRectAndTransform();
  }
  else
  {
    v6 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    a3->origin = (CGPoint)*MEMORY[0x1E0C9D648];
    a3->size = v6;
    v7 = MEMORY[0x1E0C9BAA8];
    v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&a4->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&a4->c = v8;
    *(_OWORD *)&a4->tx = *(_OWORD *)(v7 + 32);
  }
  return (char)cgSelection;
}

- (id)textAtIndex:(unint64_t)a3
{
  uint64_t v3;
  void *PlainText;
  id v5;

  CGPDFSelectionGetRangeForRectIndex();
  if (!v3)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "string");
  CGPDFSelectionGetPage();
  CGPDFSelectionCreateForStringRange();
  CGPDFArchiveCreate();
  CGPDFArchiveAddSelection();
  PlainText = (void *)CGPDFArchiveGetPlainText();
  v5 = PlainText;
  CGPDFArchiveRelease();
  CGPDFSelectionRelease();
  return PlainText;
}

- (id)htmlAtIndex:(unint64_t)a3
{
  uint64_t v3;
  void *HTML;
  id v5;

  CGPDFSelectionGetRangeForRectIndex();
  if (!v3)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "string");
  CGPDFSelectionGetPage();
  CGPDFSelectionCreateForRange();
  CGPDFArchiveCreate();
  CGPDFArchiveAddSelection();
  HTML = (void *)CGPDFArchiveGetHTML();
  v5 = HTML;
  CGPDFArchiveRelease();
  CGPDFSelectionRelease();
  return HTML;
}

- ($88E5F8DBFD3EF82B558D000E19B2526A)rectangleAtIndex:(SEL)a3 scale:(unint64_t)a4 inset:(double)a5
{
  $88E5F8DBFD3EF82B558D000E19B2526A *result;
  double MidX;
  CGFloat MidY;
  double v14;
  double v15;
  double x;
  double y;
  CGFloat width;
  CGFloat height;
  double v20;
  CGFloat v21;
  double MinX;
  double MaxY;
  double MaxX;
  double v25;
  double MinY;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  retstr->var2 = 0u;
  retstr->var3 = 0u;
  retstr->var0 = 0u;
  retstr->var1 = 0u;
  result = -[UIPDFSelection numberOfRectangles](self, "numberOfRectangles");
  if ((unint64_t)result > a4)
  {
    memset(&v38, 0, sizeof(v38));
    memset(&v37, 0, sizeof(v37));
    -[UIPDFSelection getBounds:transform:index:](self, "getBounds:transform:index:", &v38, &v37, a4);
    v38 = CGRectInset(v38, -1.0, -1.0);
    MidX = CGRectGetMidX(v38);
    MidY = CGRectGetMidY(v38);
    v14 = v37.tx + MidX * v37.a + MidY * v37.c;
    v15 = v37.ty + MidX * v37.b + MidY * v37.d;
    memset(&v36, 0, sizeof(v36));
    CGAffineTransformMakeScale(&v36, a5, a5);
    v35 = v36;
    v39 = CGRectApplyAffineTransform(v38, &v35);
    x = v39.origin.x;
    y = v39.origin.y;
    width = v39.size.width;
    height = v39.size.height;
    if (a6 != 0.0)
    {
      v40 = CGRectInset(v39, a6, a6);
      x = v40.origin.x;
      y = v40.origin.y;
      width = v40.size.width;
      height = v40.size.height;
    }
    v41.origin.x = x;
    v41.origin.y = y;
    v41.size.width = width;
    v41.size.height = height;
    v20 = CGRectGetMidX(v41);
    v42.origin.x = x;
    v42.origin.y = y;
    v42.size.width = width;
    v42.size.height = height;
    v21 = CGRectGetMidY(v42);
    v30 = v37.ty + v20 * v37.b + v21 * v37.d - v15;
    v31 = v37.tx + v20 * v37.a + v21 * v37.c - v14;
    retstr->var0.x = x;
    retstr->var0.y = y;
    v43.origin.x = x;
    v43.origin.y = y;
    v43.size.width = width;
    v43.size.height = height;
    MinX = CGRectGetMinX(v43);
    v44.origin.x = x;
    v44.origin.y = y;
    v44.size.width = width;
    v44.size.height = height;
    MaxY = CGRectGetMaxY(v44);
    retstr->var1.x = MinX;
    retstr->var1.y = MaxY;
    v45.origin.x = x;
    v45.origin.y = y;
    v45.size.width = width;
    v45.size.height = height;
    MaxX = CGRectGetMaxX(v45);
    v46.origin.x = x;
    v46.origin.y = y;
    v46.size.width = width;
    v46.size.height = height;
    v25 = CGRectGetMaxY(v46);
    retstr->var2.x = MaxX;
    retstr->var2.y = v25;
    v47.origin.x = x;
    v47.origin.y = y;
    v47.size.width = width;
    v47.size.height = height;
    v32 = CGRectGetMaxX(v47);
    v48.origin.x = x;
    v48.origin.y = y;
    v48.size.width = width;
    v48.size.height = height;
    MinY = CGRectGetMinY(v48);
    CGAffineTransformMakeTranslation(&t2, -v31, -v30);
    t1 = v37;
    result = ($88E5F8DBFD3EF82B558D000E19B2526A *)CGAffineTransformConcat(&v35, &t1, &t2);
    v27 = *(_OWORD *)&v35.a;
    v28 = *(_OWORD *)&v35.c;
    v29 = *(_OWORD *)&v35.tx;
    retstr->var0.x = v35.tx + x * v35.a + y * v35.c;
    retstr->var0.y = *((double *)&v29 + 1) + x * *((double *)&v27 + 1) + y * *((double *)&v28 + 1);
    retstr->var1.x = *(double *)&v29 + MinX * *(double *)&v27 + MaxY * *(double *)&v28;
    retstr->var1.y = *((double *)&v29 + 1) + MinX * *((double *)&v27 + 1) + MaxY * *((double *)&v28 + 1);
    retstr->var2.x = *(double *)&v29 + MaxX * *(double *)&v27 + v25 * *(double *)&v28;
    retstr->var2.y = *((double *)&v29 + 1) + MaxX * *((double *)&v27 + 1) + v25 * *((double *)&v28 + 1);
    retstr->var3.x = *(double *)&v29 + v32 * *(double *)&v27 + MinY * *(double *)&v28;
    retstr->var3.y = *((double *)&v29 + 1) + v32 * *((double *)&v27 + 1) + MinY * *((double *)&v28 + 1);
  }
  return result;
}

- (id)archive
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<UIPDFSelection pageIndex=\"%lu\" count=\"%lu\">"), objc_msgSend(-[UIPDFSelection page](self, "page"), "pageIndex"), -[UIPDFSelection numberOfRectangles](self, "numberOfRectangles"));
  objc_msgSend(v3, "appendString:", v4);

  if (-[UIPDFSelection numberOfRectangles](self, "numberOfRectangles"))
  {
    v5 = 0;
    do
    {
      if (self)
        -[UIPDFSelection rectangleAtIndex:scale:inset:](self, "rectangleAtIndex:scale:inset:", v5, 1.0, -1.0);
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<Rectangle><Point id=\"bottomLeft\" x=\"%g\" y=\"%g\"/><Point id=\"topLeft\" x=\"%g\" y=\"%g\"/><Point id=\"topRight\" x=\"%g\" y=\"%g\"/><Point id=\"bottomRight\" x=\"%g\" y=\"%g\"/></Rectangle>"), (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0);
      objc_msgSend(v3, "appendString:", v6);

      ++v5;
    }
    while (v5 < -[UIPDFSelection numberOfRectangles](self, "numberOfRectangles"));
  }
  objc_msgSend(v3, "appendString:", CFSTR("</UIPDFSelection>"));
  return v3;
}

- (unint64_t)extendAtStart:(unint64_t)a3
{
  self->_dirty = 1;
  self->_cachedStartIndex = -1;
  self->_cachedEndIndex = -1;
  return CGPDFSelectionExtendAtStart();
}

- (unint64_t)extendAtEnd:(unint64_t)a3
{
  self->_dirty = 1;
  self->_cachedStartIndex = -1;
  self->_cachedEndIndex = -1;
  return CGPDFSelectionExtendAtEnd();
}

- (void)copyToPasteboard
{
  uint64_t PlainText;
  void *WebArchiveData;
  void *v4;

  CGPDFArchiveCreate();
  CGPDFArchiveAddSelection();
  PlainText = CGPDFArchiveGetPlainText();
  WebArchiveData = (void *)CGPDFArchiveGetWebArchiveData();
  if (WebArchiveData)
  {
    v4 = WebArchiveData;
    if (objc_msgSend(WebArchiveData, "length"))
      -[UIPasteboard setValue:forPasteboardType:](+[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard"), "setValue:forPasteboardType:", v4, CFSTR("Apple Web Archive pasteboard type"));
  }
  if (PlainText)
    -[UIPasteboard setString:](+[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard"), "setString:", PlainText);
  CGPDFArchiveRelease();
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)extent
{
  uint64_t FirstIndex;
  uint64_t LastIndex;
  BOOL v4;
  int64_t v5;
  int64_t v6;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  FirstIndex = CGPDFSelectionGetFirstIndex();
  LastIndex = CGPDFSelectionGetLastIndex();
  v4 = FirstIndex == -1 || LastIndex == -1;
  if (v4)
    v5 = 0;
  else
    v5 = LastIndex - FirstIndex + 1;
  if (v4)
    v6 = 0;
  else
    v6 = FirstIndex;
  result.var1 = v5;
  result.var0 = v6;
  return result;
}

- (double)baseLineAtIndex:(unint64_t)a3
{
  double result;

  -[UIPDFPage CGPage](self->_page, "CGPage");
  CGPDFPageGetLayout();
  CGPDFLayoutGetRootNode();
  CGPDFSelectionGetRangeForRectIndex();
  CGPDFNodeGetNodeContainingTextRange();
  CGPDFNodeGetBaseline();
  return result;
}

- (unint64_t)startIndex
{
  unint64_t result;

  if (!self->_cgSelection)
    return 0;
  result = self->_cachedStartIndex;
  if (result == -1)
  {
    result = CGPDFSelectionGetStartIndex();
    self->_cachedStartIndex = result;
  }
  return result;
}

- (unint64_t)endIndex
{
  unint64_t result;

  if (!self->_cgSelection)
    return 0;
  result = self->_cachedEndIndex;
  if (result == -1)
  {
    result = CGPDFSelectionGetEndIndex();
    self->_cachedEndIndex = result;
  }
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)stringRange
{
  int64_t length;
  int64_t location;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  length = self->stringRange.length;
  location = self->stringRange.location;
  result.var1 = length;
  result.var0 = location;
  return result;
}

- (void)setStringRange:(id)a3
{
  self->stringRange = ($5CFEE62CA76FAE445C6F9DBCEE669C70)a3;
}

- (UIPDFSelection)initWithPage:(id)a3 cgSelection:(CGPDFSelection *)a4
{
  UIPDFSelection *v5;

  v5 = -[UIPDFSelection init](self, "init");
  if (v5)
  {
    v5->_page = (UIPDFPage *)a3;
    v5->_cgSelection = (CGPDFSelection *)CGPDFSelectionRetain();
  }
  return v5;
}

- (void)dealloc
{
  __CFString *string;
  objc_super v4;

  string = self->_string;
  if (string)
    CFRelease(string);
  CGPDFSelectionRelease();

  v4.receiver = self;
  v4.super_class = (Class)UIPDFSelection;
  -[UIPDFSelection dealloc](&v4, sel_dealloc);
}

- (CGPDFSelection)CGSelection
{
  return self->_cgSelection;
}

- (void)extendToParagraph
{
  uint64_t ContainingSelection;
  CGPDFSelection *v4;

  if (self->_cgSelection)
  {
    ContainingSelection = CGPDFSelectionCreateContainingSelection();
    if (ContainingSelection)
    {
      v4 = (CGPDFSelection *)ContainingSelection;
      CGPDFSelectionRelease();
      self->_cgSelection = v4;
    }
  }
}

- (id)description
{
  uint64_t NumberOfTextRanges;
  uint64_t v3;
  uint64_t TextRange;
  uint64_t v5;

  NumberOfTextRanges = CGPDFSelectionGetNumberOfTextRanges();
  if (!NumberOfTextRanges)
    return CFSTR("[]");
  v3 = NumberOfTextRanges;
  TextRange = CGPDFSelectionGetTextRange();
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%ld:%ld,%ld]"), v3, TextRange, v5);
}

@end
