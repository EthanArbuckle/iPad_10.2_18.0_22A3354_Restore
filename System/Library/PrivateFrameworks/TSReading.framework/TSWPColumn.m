@implementation TSWPColumn

- (unint64_t)logicalLineCount
{
  return TSWPLineFragmentArray::logicalLineCount(self->_lineFragmentArray.__ptr_);
}

- (_NSRange)lineFragmentRangeForLogicalLineIndex:(unint64_t)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = TSWPLineFragmentArray::lineFragmentRangeForLogicalLineIndex(self->_lineFragmentArray.__ptr_, a3);
  result.length = v4;
  result.location = v3;
  return result;
}

- (unint64_t)scaleTextPercent
{
  return self->_scaleTextPercent;
}

- (void)setTextIsVertical:(BOOL)a3
{
  self->_textIsVertical = a3;
}

- (void)setPageNumber:(unint64_t)a3
{
  self->_pageNumber = a3;
}

- (void)setWpBounds:(CGRect)a3
{
  self->_frameBounds = a3;
}

- (void)setColumnIndex:(unint64_t)a3
{
  self->_columnIndex = a3;
}

- (void)setStyleProvider:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 184);
}

- (double)topOfCapForLogicalLineIndex:(unint64_t)a3
{
  return TSWPLineFragmentArray::topOfCapForLogicalLineIndex(self->_lineFragmentArray.__ptr_, a3);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 24) = 0;
  *((_QWORD *)self + 25) = 0;
  return self;
}

- (void).cxx_destruct
{
  std::shared_ptr<EQKit::StemStretch::Glyph>::~shared_ptr[abi:nn180100]((uint64_t)&self->_lineFragmentArray);
}

- (double)baselineOfLineFragmentAtIndex:(unint64_t)a3
{
  uint64_t v3;

  v3 = TSWPLineFragmentArray::objectAtIndex(self->_lineFragmentArray.__ptr_, a3);
  return *(double *)(v3 + 32) + *(double *)(v3 + 40);
}

- (void)renderWithRenderer:(id)a3 currentSelection:(id)a4 limitSelection:(id)a5 listRange:(_NSRange)a6 rubyGlyphRange:(_NSRange)a7 isCanvasInteractive:(BOOL)a8 spellChecker:(id)a9 suppressedMisspellingRange:(_NSRange)a10 blackAndWhite:(BOOL)a11 dictationInterpretations:(const void *)a12 autocorrections:(const void *)a13 markedRange:(_NSRange)a14 markedText:(id)a15 renderMode:(int)a16 pageCount:(unint64_t)a17 suppressInvisibles:(BOOL)a18 currentCanvasSelection:(id)a19
{
  NSUInteger length;
  NSUInteger location;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t scaleTextPercent;
  char v31;
  BOOL v32;
  void *v33;
  uint64_t v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double x;
  double y;
  double width;
  double height;
  uint64_t v55;
  NSUInteger v56;
  TSWPLineFragmentArray *ptr;
  NSUInteger **v58;
  NSUInteger **v59;
  NSUInteger v60;
  TSWPLineFragmentArray *v61;
  NSUInteger **v62;
  NSUInteger **v63;
  int v64;
  int v65;
  uint64_t v66;
  NSUInteger *v67;
  NSUInteger v68;
  id v70;
  CGAffineTransform v71;
  _BYTE v72[96];
  CFTypeRef cf;
  CGColorRef color;
  CGColorRef v75;
  _QWORD v76[7];
  id v77;
  unint64_t v78;
  CGColorRef v79;
  BOOL v80;
  BOOL v81;
  char v82;
  char v83;
  BOOL v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _NSRange v88;
  const void *v89;
  const void *v90;
  NSUInteger v91;
  NSUInteger v92;
  _NSRange v93;
  unint64_t v94;
  _NSRange v95;
  id v96;
  id v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;

  length = a6.length;
  location = a6.location;
  v86 = 0u;
  v87 = 0u;
  v85 = 0u;
  bzero(v76, 0xF8uLL);
  v76[0] = self->_storage;
  v76[1] = self;
  -[TSWPColumn wpBounds](self, "wpBounds");
  v25 = 0;
  v76[2] = v26;
  v76[3] = v27;
  v76[4] = v28;
  v76[5] = v29;
  scaleTextPercent = self->_scaleTextPercent;
  v76[6] = a4;
  v77 = a5;
  v78 = scaleTextPercent;
  v91 = location;
  v92 = length;
  v93 = a7;
  if (a8 && !a18)
    v25 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "BOOLForKey:", CFSTR("ShowInvisibles"));
  v82 = v25;
  v79 = CGColorRetain((CGColorRef)objc_msgSend(+[TSWPUserDefaults invisiblesColor](TSWPUserDefaults, "invisiblesColor"), "CGColor"));
  v88 = a10;
  v80 = a11;
  v89 = a12;
  v90 = a13;
  v95 = a14;
  v96 = a15;
  v94 = a17;
  -[TSWPStorage parentInfo](self->_storage, "parentInfo");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v31 = -[TSDContainerInfo shouldHideEmptyBullets](-[TSWPStorage parentInfo](self->_storage, "parentInfo"), "shouldHideEmptyBullets");
  else
    v31 = 0;
  v83 = v31;
  v81 = a8;
  v32 = (objc_msgSend(a3, "preventClipToColumn") & 1) != 0 || -[TSWPStorage wpKind](self->_storage, "wpKind") == 5;
  v84 = v32;
  v97 = a19;
  bzero(v72, 0x98uLL);
  if (!a5 && (a7.location != *MEMORY[0x24BEB3BF0] || a7.length != *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8)))
  {
    v33 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v34 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPColumn renderWithRenderer:currentSelection:limitSelection:listRange:rubyGlyphRange:isCanvasInteractive:spellChecker:suppressedMisspellingRange:blackAndWhite:dictationInterpretations:autocorrections:markedRange:markedText:renderMode:pageCount:suppressInvisibles:currentCanvasSelection:]");
    objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 2549, CFSTR("ruby glyph range is meaningless without limitSelection"));
  }
  objc_msgSend(a3, "willRenderFragmentsWithDrawingState:", v76);
  objc_msgSend(a3, "getClipBoundingBox");
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;
  -[TSWPColumn erasableBounds:](self, "erasableBounds:", 0);
  v44 = v43;
  v46 = v45;
  v48 = v47;
  v50 = v49;
  -[TSWPColumn transformToWP](self, "transformToWP");
  v98.origin.x = v44;
  v98.origin.y = v46;
  v98.size.width = v48;
  v98.size.height = v50;
  v101 = CGRectApplyAffineTransform(v98, &v71);
  v99.origin.x = v36;
  v99.origin.y = v38;
  v99.size.width = v40;
  v99.size.height = v42;
  v100 = CGRectIntersection(v99, v101);
  x = v100.origin.x;
  y = v100.origin.y;
  width = v100.size.width;
  height = v100.size.height;
  v70 = a15;
  if (v83 && objc_msgSend(a4, "isInsertionPoint"))
  {
    v55 = objc_msgSend(a4, "start");
    v56 = length;
  }
  else
  {
    v56 = length;
    v55 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ((a16 & 2) != 0)
  {
    objc_msgSend(a3, "drawAdornmentRects:forColumn:foreground:", self->_paragraphAdornments, self, 0);
    ptr = self->_lineFragmentArray.__ptr_;
    v58 = *(NSUInteger ***)ptr;
    v59 = (NSUInteger **)*((_QWORD *)ptr + 1);
    if (*(NSUInteger ***)ptr != v59)
    {
      do
      {
        v60 = **v58;
        if (location > v60 || location + v56 < (*v58)[1] + v60)
          objc_msgSend(a3, "drawFragment:updateRect:drawingState:runState:lineDrawFlags:", x, y, width, height, v70);
        v58 += 2;
      }
      while (v58 != v59);
    }
  }
  if ((a16 & 1) != 0)
  {
    v61 = self->_lineFragmentArray.__ptr_;
    v62 = *(NSUInteger ***)v61;
    v63 = (NSUInteger **)*((_QWORD *)v61 + 1);
    if (*(NSUInteger ***)v61 != v63)
    {
      if ((a16 & 4) != 0)
        v64 = 65538;
      else
        v64 = 2;
      if (a9)
        v65 = v64 | 0x18;
      else
        v65 = v64;
      if (*((_QWORD *)a12 + 1) != *(_QWORD *)a12)
        v65 |= 0x200u;
      if (*((_QWORD *)a13 + 1) != *(_QWORD *)a13)
        v65 |= 0x800u;
      if (v70)
        LODWORD(v66) = v65 | 0x400;
      else
        LODWORD(v66) = v65;
      do
      {
        v67 = *v62;
        v68 = **v62;
        if (location > v68 || location + v56 < (*v62)[1] + v68)
        {
          v66 = v66 & 0xFFFFFEFF | ((v68 == v55) << 8);
          if (!v77 || objc_msgSend(v77, "intersectsRange:"))
            objc_msgSend(a3, "drawFragment:updateRect:drawingState:runState:lineDrawFlags:", v67, v76, v72, v66, x, y, width, height, v70);
        }
        v62 += 2;
      }
      while (v62 != v63);
    }
    objc_msgSend(a3, "drawAdornmentRects:forColumn:foreground:", self->_paragraphAdornments, self, 1, v70);
  }
  objc_msgSend(a3, "didRenderFragments", v70);
  if (cf)
    CFRelease(cf);
  if (color)
    CGColorRelease(color);
  if (v75)
    CGColorRelease(v75);
  if (v79)
    CGColorRelease(v79);
  if (*((_QWORD *)&v86 + 1))
  {
    *(_QWORD *)&v87 = *((_QWORD *)&v86 + 1);
    operator delete(*((void **)&v86 + 1));
  }
  if ((_QWORD)v85)
  {
    *((_QWORD *)&v85 + 1) = v85;
    operator delete((void *)v85);
  }
}

- (CGRect)wpBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frameBounds.origin.x;
  y = self->_frameBounds.origin.y;
  width = self->_frameBounds.size.width;
  height = self->_frameBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)erasableBounds:(unsigned int)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  __int128 v11;
  CGAffineTransform v12;
  CGRect v13;
  CGRect v14;
  CGRect v16;

  x = self->_frameBounds.origin.x;
  y = self->_frameBounds.origin.y;
  width = self->_frameBounds.size.width;
  height = self->_frameBounds.size.height;
  v16.origin.x = TSWPLineFragmentArray::erasableBounds(self->_lineFragmentArray.__ptr_, a3, (TSWPStorage *)self);
  v16.origin.y = v8;
  v16.size.width = v9;
  v16.size.height = v10;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  v14 = CGRectUnion(v13, v16);
  v11 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v12.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v12.c = v11;
  *(_OWORD *)&v12.tx = *(_OWORD *)&self->_transform.tx;
  return CGRectApplyAffineTransform(v14, &v12);
}

- (void)setStartCharIndex:(unint64_t)a3
{
  self->_startCharIndex = a3;
}

- (void)setScaleTextPercent:(unint64_t)a3
{
  self->_scaleTextPercent = a3;
}

- (CGSize)maxSize
{
  double width;
  double height;
  CGSize result;

  width = self->_frameBounds.size.width;
  height = self->_frameBounds.size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unint64_t)countLines
{
  return TSWPLineFragmentArray::count(self->_lineFragmentArray.__ptr_);
}

- (CGAffineTransform)transformToWP
{
  __int128 v3;
  CGAffineTransform v5;

  v3 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v5.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v5.c = v3;
  *(_OWORD *)&v5.tx = *(_OWORD *)&self->_transform.tx;
  return CGAffineTransformInvert(retstr, &v5);
}

+ (CGColor)computeSingleColorWithColumns:(id)a3
{
  CGColor *v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t i;
  uint64_t v9;
  TSWPLineFragmentArray *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  CGColor *v17;
  unint64_t *v18;
  unint64_t v19;
  TSWPLineFragmentArray *v21;
  std::__shared_weak_count *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = 0;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v24;
    LOBYTE(v7) = 1;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(a3);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "lineFragmentArray", v21);
        v10 = *(TSWPLineFragmentArray **)v9;
        v11 = *(std::__shared_weak_count **)(v9 + 8);
        v21 = *(TSWPLineFragmentArray **)v9;
        v22 = v11;
        if (v11)
        {
          p_shared_owners = (unint64_t *)&v11->__shared_owners_;
          do
            v13 = __ldxr(p_shared_owners);
          while (__stxr(v13 + 1, p_shared_owners));
        }
        if (v10)
        {
          v14 = TSWPLineFragmentArray::count(v10);
          if (v14)
          {
            v15 = 0;
            while (1)
            {
              v16 = TSWPLineFragmentArray::objectAtIndex(v21, v15);
              if ((*(_BYTE *)(v16 + 27) & 8) == 0)
                break;
              v17 = (CGColor *)TSWPLineFragment::singleColor((TSWPLineFragment *)v16);
              if (!v7 || v17 == 0)
                break;
              if (v4)
              {
                v7 = CGColorEqualToColor(v4, v17);
                if (!v7)
                  v17 = v4;
              }
              else
              {
                LOBYTE(v7) = 1;
              }
              ++v15;
              v4 = v17;
              if (v14 == v15)
                goto LABEL_22;
            }
            v17 = 0;
            LOBYTE(v7) = 0;
LABEL_22:
            v11 = v22;
            v4 = v17;
          }
        }
        if (v11)
        {
          v18 = (unint64_t *)&v11->__shared_owners_;
          do
            v19 = __ldaxr(v18);
          while (__stlxr(v19 - 1, v18));
          if (!v19)
          {
            ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
            std::__shared_weak_count::__release_weak(v11);
          }
        }
      }
      v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v5);
  }
  return v4;
}

- (_NSRange)range
{
  NSUInteger characterCount;
  NSUInteger startCharIndex;
  _NSRange result;

  characterCount = self->_characterCount;
  startCharIndex = self->_startCharIndex;
  result.length = characterCount;
  result.location = startCharIndex;
  return result;
}

- (_NSRange)anchoredRange
{
  NSUInteger anchoredCharCount;
  NSUInteger startAnchoredCharIndex;
  _NSRange result;

  anchoredCharCount = self->_anchoredCharCount;
  startAnchoredCharIndex = self->_startAnchoredCharIndex;
  result.length = anchoredCharCount;
  result.location = startAnchoredCharIndex;
  return result;
}

- (void)setLineFragmentArray:(const void *)a3
{
  std::shared_ptr<EQKit::StemStretch::Glyph>::operator=[abi:nn180100](&self->_lineFragmentArray.__ptr_, (uint64_t *)a3);
}

- (double)contentBottom
{
  return self->_contentBottom;
}

- (int)layoutResultFlags
{
  return self->_layoutResultFlags;
}

- (TSWPStorage)storage
{
  return self->_storage;
}

- (const)lineFragmentArray
{
  return &self->_lineFragmentArray;
}

- (void)setTransformFromWP:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tx = v4;
  *(_OWORD *)&self->_transform.a = v3;
}

- (unint64_t)columnIndex
{
  return self->_columnIndex;
}

- (void)clearAdornments
{
  uint64_t *paragraphAdornments;
  uint64_t v3;
  uint64_t v4;

  paragraphAdornments = (uint64_t *)self->_paragraphAdornments;
  v4 = *paragraphAdornments;
  v3 = paragraphAdornments[1];
  if (v3 != *paragraphAdornments)
  {
    do
    {
      v3 -= 56;
      std::allocator<TSWPAdornmentRect>::destroy[abi:ne180100]((uint64_t)(paragraphAdornments + 2), v3);
    }
    while (v3 != v4);
  }
  paragraphAdornments[1] = v4;
}

- (_NSRange)rangeOfLineFragmentAtIndex:(unint64_t)a3
{
  NSUInteger *v3;
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  v3 = (NSUInteger *)TSWPLineFragmentArray::objectAtIndex(self->_lineFragmentArray.__ptr_, a3);
  v4 = v3[1];
  v5 = *v3;
  result.length = v4;
  result.location = v5;
  return result;
}

- (CGRect)typographicBoundsOfLineFragmentAtIndex:(unint64_t)a3
{
  uint64_t v4;
  double x;
  double v6;
  CGFloat y;
  double v8;
  CGFloat width;
  double v10;
  CGFloat height;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGAffineTransform v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v21;

  v4 = TSWPLineFragmentArray::objectAtIndex(self->_lineFragmentArray.__ptr_, a3);
  x = TSWPLineFragment::textRect((TSWPLineFragment *)v4, 0);
  y = v6;
  width = v8;
  height = v10;
  if (*(_QWORD *)(v4 + 176))
  {
    TSWPLineFragment::labelRect((TSWPLineFragment *)v4);
    v21.origin.x = v12;
    v21.origin.y = v13;
    v21.size.width = v14;
    v21.size.height = v15;
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    v18 = CGRectUnion(v17, v21);
    x = v18.origin.x;
    y = v18.origin.y;
    width = v18.size.width;
    height = v18.size.height;
  }
  -[TSWPColumn transformFromWP](self, "transformFromWP");
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  return CGRectApplyAffineTransform(v19, &v16);
}

- (CGAffineTransform)transformFromWP
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].tx;
  return self;
}

- (BOOL)isTruncatedLineFragmentAtIndex:(unint64_t)a3
{
  return *(unsigned __int8 *)(TSWPLineFragmentArray::objectAtIndex(self->_lineFragmentArray.__ptr_, a3) + 26) >> 7;
}

- (unint64_t)truncatedCharIndexForLineFragmentAtIndex:(unint64_t)a3
{
  TSWPLineFragment *v3;

  v3 = (TSWPLineFragment *)TSWPLineFragmentArray::objectAtIndex(self->_lineFragmentArray.__ptr_, a3);
  return TSWPLineFragment::truncatedCharIndex(v3);
}

- (TSWPStyleProvider)styleProvider
{
  if (self->_styleProvider)
    return self->_styleProvider;
  else
    return (TSWPStyleProvider *)+[TSWPStorageStyleProvider styleProviderForStorage:](TSWPStorageStyleProvider, "styleProviderForStorage:", self->_storage);
}

- (unint64_t)pageNumber
{
  return self->_pageNumber;
}

- (CGRect)frameBounds
{
  __int128 v2;
  CGAffineTransform v3;
  CGRect frameBounds;

  frameBounds = self->_frameBounds;
  v2 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v3.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v3.c = v2;
  *(_OWORD *)&v3.tx = *(_OWORD *)&self->_transform.tx;
  return CGRectApplyAffineTransform(frameBounds, &v3);
}

- (void)setLayoutResultFlags:(int)a3
{
  self->_layoutResultFlags = a3;
}

- (unint64_t)startCharIndex
{
  return self->_startCharIndex;
}

- (void)setStartAnchoredCharIndex:(unint64_t)a3
{
  self->_startAnchoredCharIndex = a3;
}

- (void)setNextWidowPullsDownFromCharIndex:(unint64_t)a3
{
  self->_nextWidowPullsDownFromCharIndex = a3;
}

- (void)setContentBottom:(double)a3
{
  self->_contentBottom = a3;
}

- (void)setCharacterCount:(unint64_t)a3
{
  self->_characterCount = a3;
}

- (void)setAnchoredCharCount:(unint64_t)a3
{
  self->_anchoredCharCount = a3;
}

- (TSWPColumn)initWithStorage:(id)a3 frameBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  TSWPColumn *v9;
  _OWORD *v10;
  __int128 v11;
  _OWORD *v12;
  _QWORD *v13;
  objc_super v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)TSWPColumn;
  v9 = -[TSWPColumn init](&v15, sel_init);
  if (v9)
  {
    v9->_storage = (TSWPStorage *)a3;
    v9->_frameBounds.origin.x = x;
    v9->_frameBounds.origin.y = y;
    v10 = (_OWORD *)MEMORY[0x24BDBD8B8];
    v9->_frameBounds.size.width = width;
    v9->_frameBounds.size.height = height;
    v11 = v10[1];
    *(_OWORD *)&v9->_transform.a = *v10;
    *(_OWORD *)&v9->_transform.c = v11;
    *(_OWORD *)&v9->_transform.tx = v10[2];
    v9->_startAnchoredCharIndex = 0x7FFFFFFFFFFFFFFFLL;
    v9->_scaleTextPercent = 100;
    v12 = (_OWORD *)operator new();
    *v12 = 0u;
    v12[1] = 0u;
    std::shared_ptr<TSWPLineFragmentArray>::reset[abi:ne180100]<TSWPLineFragmentArray,void>(&v9->_lineFragmentArray.__ptr_, (uint64_t)v12);
    v13 = (_QWORD *)operator new();
    v13[1] = 0;
    v13[2] = 0;
    *v13 = 0;
    v9->_paragraphAdornments = v13;
  }
  return v9;
}

- (void)dealloc
{
  void *paragraphAdornments;
  objc_super v4;
  void **v5;

  self->_styleProvider = 0;
  std::shared_ptr<TSWPLineFragmentArray>::reset[abi:ne180100](&self->_lineFragmentArray.__ptr_);
  paragraphAdornments = self->_paragraphAdornments;
  if (paragraphAdornments)
  {
    v5 = (void **)self->_paragraphAdornments;
    std::vector<TSWPAdornmentRect>::__destroy_vector::operator()[abi:ne180100](&v5);
    MEMORY[0x219A153B8](paragraphAdornments, 0x20C40960023A9);
  }
  v4.receiver = self;
  v4.super_class = (Class)TSWPColumn;
  -[TSWPColumn dealloc](&v4, sel_dealloc);
}

+ (CGRect)caretRectForInsertionPoint:(id)a3 withColumns:(id)a4
{
  CGRect *v6;
  CGFloat v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  CGRect v30;
  CGRect result;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = (CGRect *)MEMORY[0x24BDBF070];
  v7 = *MEMORY[0x24BDBF070];
  v8 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v9 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v10 = *(double *)(MEMORY[0x24BDBF070] + 24);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(a4);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "caretRectForSelection:", a3);
        v7 = v16;
        v8 = v17;
        v9 = v15;
        v10 = v18;
        if (v18 > 0.0)
        {
          v9 = fmax(v15, 1.0);
          goto LABEL_11;
        }
      }
      v12 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_11:
  v30.origin.x = v7;
  v30.origin.y = v8;
  v30.size.width = v9;
  v30.size.height = v10;
  if (!CGRectEqualToRect(v30, *v6))
  {
    v19 = +[TSWPColumn columnForCharIndex:eol:withColumns:](TSWPColumn, "columnForCharIndex:eol:withColumns:", objc_msgSend(a3, "start"), 1, a4);
    if (v19)
    {
      objc_msgSend(v19, "lineMetricsAtCharIndex:allowEndOfLine:", objc_msgSend(a3, "start", 0), 1);
      v8 = 0.0;
    }
  }
  v20 = v7;
  v21 = v8;
  v22 = v9;
  v23 = v10;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

+ (CGRect)rectForSelection:(id)a3 withColumns:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  objc_msgSend(a1, "rectForSelection:withColumns:useParagraphModeRects:", a3, a4, 1);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (CGRect)rectForSelection:(id)a3 withColumns:(id)a4 useParagraphModeRects:(BOOL)a5
{
  id v6;
  CGFloat x;
  CGFloat y;
  double width;
  CGFloat height;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  NSRange v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  _BOOL4 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t i;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  double v58;
  double v59;
  double v60;
  int v61;
  uint64_t v62;
  void *v63;
  _BOOL4 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;
  NSRange v76;
  NSRange v77;
  CGRect v78;
  CGRect v79;
  CGRect result;

  v64 = a5;
  v6 = a3;
  v75 = *MEMORY[0x24BDAC8D0];
  x = *MEMORY[0x24BDBF070];
  y = *(double *)(MEMORY[0x24BDBF070] + 8);
  width = *(double *)(MEMORY[0x24BDBF070] + 16);
  height = *(double *)(MEMORY[0x24BDBF070] + 24);
  if (objc_msgSend(a3, "isValid"))
  {
    v63 = (void *)objc_msgSend((id)objc_msgSend(a4, "firstObject"), "storage");
    if (v63)
    {
      if (objc_msgSend(v6, "isInsertionPoint"))
      {
        v61 = 1;
        v11 = objc_msgSend(v63, "wordAtCharIndex:includePreviousWord:", objc_msgSend(v6, "range"), 1);
        if (v11 == 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_10:
          v71 = 0u;
          v72 = 0u;
          v69 = 0u;
          v70 = 0u;
          v18 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
          if (!v18)
            goto LABEL_49;
          v19 = v18;
          v20 = *(_QWORD *)v70;
          while (1)
          {
            v21 = 0;
            v62 = v19;
            do
            {
              if (*(_QWORD *)v70 != v20)
                objc_enumerationMutation(a4);
              v22 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v21);
              v23 = objc_msgSend(v22, "range");
              v25 = v24;
              objc_msgSend(v22, "frameBounds");
              v27 = v26;
              v29 = v28;
              if (!objc_msgSend(v6, "isInsertionPoint"))
              {
                v76.location = objc_msgSend(v6, "range");
                v77.location = v23;
                v77.length = v25;
                v34 = NSIntersectionRange(v76, v77);
                if (!v34.length)
                  goto LABEL_40;
                v35 = v20;
                v36 = a4;
                v37 = (void *)objc_msgSend(v22, "rectsForSelection:", v6);
                v38 = objc_msgSend(v63, "selectedParagraphBreakCount:", v34.location, v34.length);
                if (objc_msgSend(v63, "emptyParagraphCount:", v34.location, v34.length))
                  v39 = -1;
                else
                  v39 = 0;
                objc_msgSend(v63, "paragraphIndexRangeForCharRange:", v34.location, v34.length);
                if (v64 && (v41 = v40, objc_msgSend(v6, "type") != 3))
                {
                  v42 = 0;
                  if (objc_msgSend(v6, "type") != 5 && v41 >= 2)
                  {
                    if (!(v38 + v39))
                      goto LABEL_24;
                    v42 = v38 + v39 != 1 || (unint64_t)objc_msgSend(v37, "count") > 2;
                  }
                }
                else
                {
LABEL_24:
                  v42 = 0;
                }
                v67 = 0u;
                v68 = 0u;
                v65 = 0u;
                v66 = 0u;
                v43 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
                if (v43)
                {
                  v44 = v43;
                  v45 = *(_QWORD *)v66;
                  v46 = v61 & v42;
                  a4 = v36;
                  v20 = v35;
                  v19 = v62;
                  do
                  {
                    for (i = 0; i != v44; ++i)
                    {
                      if (*(_QWORD *)v66 != v45)
                        objc_enumerationMutation(v37);
                      objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "CGRectValue");
                      v51 = v50;
                      v53 = v52;
                      if (v46)
                        v54 = v27;
                      else
                        v54 = v48;
                      if (v46)
                        v55 = v29;
                      else
                        v55 = v49;
                      v78.origin.x = x;
                      v78.origin.y = y;
                      v78.size.width = width;
                      v78.size.height = height;
                      v79 = CGRectUnion(v78, *(CGRect *)(&v51 - 1));
                      x = v79.origin.x;
                      y = v79.origin.y;
                      width = v79.size.width;
                      height = v79.size.height;
                    }
                    v44 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
                  }
                  while (v44);
                }
                else
                {
                  a4 = v36;
                  v20 = v35;
                  v19 = v62;
                }
                goto LABEL_40;
              }
              objc_msgSend(v22, "caretRectForSelection:", v6);
              x = v31;
              y = v32;
              width = v30;
              height = v33;
              if (v33 > 0.0)
              {
                width = fmax(v30, 1.0);
                goto LABEL_49;
              }
LABEL_40:
              ++v21;
            }
            while (v21 != v19);
            v56 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
            v19 = v56;
            if (!v56)
              goto LABEL_49;
          }
        }
        v13 = v11;
        v14 = v12;
        v15 = +[TSWPColumn columnForCharIndex:eol:withColumns:](TSWPColumn, "columnForCharIndex:eol:withColumns:", objc_msgSend(v6, "range"), objc_msgSend(v6, "isAtEndOfLine"), a4);
        if (v15)
        {
          v16 = v15;
          v17 = objc_msgSend(v15, "lineIndexForCharIndex:eol:", objc_msgSend(v6, "range"), objc_msgSend(v6, "isAtEndOfLine"));
          if (v17 == objc_msgSend(v16, "lineIndexForCharIndex:eol:", v13, 0)
            && v17 == objc_msgSend(v16, "lineIndexForCharIndex:eol:", v13 + v14, objc_msgSend(v6, "isAtEndOfLine")))
          {
            v6 = (id)objc_msgSend(v6, "copyWithNewRange:", v13, v14);
            v61 = 0;
            goto LABEL_10;
          }
        }
      }
      v61 = 1;
      goto LABEL_10;
    }
  }
LABEL_49:
  v57 = x;
  v58 = y;
  v59 = width;
  v60 = height;
  result.size.height = v60;
  result.size.width = v59;
  result.origin.y = v58;
  result.origin.x = v57;
  return result;
}

+ (id)closestColumnInColumnsArray:(id)a3 forPoint:(CGPoint)a4 ignoreEmptyColumns:(BOOL)a5 ignoreDrawableOnlyColumns:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  double y;
  double x;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  double v15;
  uint64_t i;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;
  CGPoint v36;
  CGRect v37;

  v6 = a6;
  v7 = a5;
  y = a4.y;
  x = a4.x;
  v35 = *MEMORY[0x24BDAC8D0];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (!v11)
    return 0;
  v12 = v11;
  v13 = 0;
  v14 = *(_QWORD *)v31;
  v15 = INFINITY;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v31 != v14)
        objc_enumerationMutation(a3);
      v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
      objc_msgSend(v17, "frameBounds");
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;
      if ((!v7 || objc_msgSend(v17, "countLines"))
        && (!v6
         || objc_msgSend(v17, "countLines") != 1
         || (*(_BYTE *)(objc_msgSend(v17, "lineFragmentAtIndex:", 0) + 24) & 0x40) == 0))
      {
        v37.origin.x = v19;
        v37.origin.y = v21;
        v37.size.width = v23;
        v37.size.height = v25;
        v36.x = x;
        v36.y = y;
        if (CGRectContainsPoint(v37, v36))
          return v17;
        v26 = TSDClampPointInRect();
        v28 = TSDDistanceSquared(x, y, v26, v27);
        if (v28 < v15)
        {
          v13 = v17;
          v15 = v28;
        }
      }
    }
    v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    v17 = v13;
  }
  while (v12);
  return v17;
}

+ (unint64_t)charIndexForPoint:(CGPoint)a3 inColumnsArray:(id)a4 allowPastBreak:(BOOL)a5 allowNotFound:(BOOL)a6 isAtEndOfLine:(BOOL *)a7 leadingEdge:(BOOL *)a8
{
  return objc_msgSend(a1, "charIndexForPoint:inColumnsArray:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:leadingEdge:", a4, a5, a6, 1, a7, a8, a3.x, a3.y);
}

+ (unint64_t)charIndexForPoint:(CGPoint)a3 inColumnsArray:(id)a4 allowPastBreak:(BOOL)a5 allowNotFound:(BOOL)a6 pastCenterGoesToNextChar:(BOOL)a7 isAtEndOfLine:(BOOL *)a8 leadingEdge:(BOOL *)a9
{
  _BOOL8 v11;
  _BOOL8 v12;
  _BOOL8 v13;
  double y;
  double x;
  void *v16;
  void *v17;
  CGPoint v19;
  CGRect v20;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  y = a3.y;
  x = a3.x;
  v16 = (void *)objc_msgSend(a1, "closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:", a4, 0, 1);
  v17 = v16;
  if (v12 && (objc_msgSend(v16, "frameBounds"), v19.x = x, v19.y = y, !CGRectContainsPoint(v20, v19)))
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return objc_msgSend(v17, "charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:isAtEndOfLine:leadingEdge:", v13, v11, v12, a8, a9, x, y);
}

+ (unint64_t)charIndexForTopicDragAtPoint:(CGPoint)a3 inColumnsArray:(id)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSUInteger v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  double v18;
  double v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  uint64_t v32;
  uint64_t v33;
  double *v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  double v39;
  double v40;
  double MinY;
  double v42;
  double Height;
  double v44;
  double v45;
  double MaxY;
  uint64_t v48;
  double v49;
  double v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  TSWPParagraphEnumerator v56;
  _BYTE v57[128];
  uint64_t v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  y = a3.y;
  x = a3.x;
  v58 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_msgSend(a1, "closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:", a4, 0, 1);
  if (!v7)
    return 0x7FFFFFFFFFFFFFFFLL;
  v8 = v7;
  v9 = objc_msgSend(v7, "charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:isAtEndOfLine:outFragment:leadingEdge:", 0, 1, 0, 0, 0, 0, x, y);
  v10 = (void *)objc_msgSend(v8, "storage");
  if (v10)
    objc_msgSend(v10, "paragraphEnumeratorAtCharIndex:styleProvider:", v9, 0);
  else
    memset(&v56, 0, sizeof(v56));
  v11 = TSWPParagraphEnumerator::paragraphTextRange(&v56);
  v13 = v12;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v14 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  v51 = v8;
  v49 = y;
  v48 = v13;
  if (v14)
  {
    v15 = *(_QWORD *)v53;
    v16 = v11 + v13;
    v50 = 0.0;
    v17 = 1;
    v18 = 0.0;
    v19 = 0.0;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v53 != v15)
          objc_enumerationMutation(a4);
        v21 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        v22 = objc_msgSend(v21, "range", v48);
        if (v22 + v23 > v11)
        {
          if (objc_msgSend(v21, "range") >= v16)
            goto LABEL_35;
          objc_msgSend(v21, "frameBounds");
          v25 = v24;
          v27 = v26;
          v29 = v28;
          v31 = v30;
          v32 = objc_msgSend(v21, "lineFragmentForCharIndex:knobTag:selectionType:", v11, 11, 0);
          v33 = objc_msgSend(v21, "lineFragmentForCharIndex:knobTag:selectionType:", v16, 10, 0);
          v34 = (double *)v33;
          if (v21 == v51)
          {
            if (v32)
            {
              MinY = CGRectGetMinY(*(CGRect *)(v32 + 48));
              if (v34)
              {
                v25 = v34[6];
                v27 = v34[7];
                v29 = v34[8];
                v31 = v34[9];
              }
              v42 = *(double *)(v32 + 112);
              v59.origin.x = v25;
              v59.origin.y = v27;
              v59.size.width = v29;
              v59.size.height = v31;
              v49 = v49 - (MinY + v42);
              Height = CGRectGetMaxY(v59) - (MinY + v42);
            }
            else if (v33)
            {
              MaxY = CGRectGetMaxY(*(CGRect *)(v33 + 48));
              v61.origin.x = v25;
              v61.origin.y = v27;
              v61.size.width = v29;
              v61.size.height = v31;
              Height = MaxY - CGRectGetMinY(v61);
            }
            else
            {
              v63.origin.x = v25;
              v63.origin.y = v27;
              v63.size.width = v29;
              v63.size.height = v31;
              Height = CGRectGetHeight(v63);
            }
            v17 = 0;
            v18 = v18 + Height;
          }
          else if ((v17 & 1) != 0)
          {
            v35 = v25;
            v36 = v27;
            v37 = v29;
            v38 = v31;
            if (v32)
            {
              v39 = CGRectGetMaxY(*(CGRect *)&v35);
              v40 = v39 - CGRectGetMinY(*(CGRect *)(v32 + 48));
            }
            else
            {
              v40 = CGRectGetHeight(*(CGRect *)&v35);
            }
            v19 = v19 + v40;
            v17 = 1;
          }
          else
          {
            if (v33)
            {
              v44 = CGRectGetMaxY(*(CGRect *)(v33 + 48));
              v60.origin.x = v25;
              v60.origin.y = v27;
              v60.size.width = v29;
              v60.size.height = v31;
              v17 = 0;
              v45 = v44 - CGRectGetMinY(v60);
            }
            else
            {
              v62.origin.x = v25;
              v62.origin.y = v27;
              v62.size.width = v29;
              v62.size.height = v31;
              v45 = CGRectGetHeight(v62);
              v17 = 0;
            }
            v50 = v50 + v45;
          }
        }
      }
      v14 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    }
    while (v14);
  }
  else
  {
    v50 = 0.0;
    v18 = 0.0;
    v19 = 0.0;
  }
LABEL_35:
  if (v49 + v19 > (v50 + v18 + v19) * 0.5)
  {
    if (v11 + v48)
      v11 = v11 + v48 - (v11 + v48 != objc_msgSend((id)objc_msgSend(v51, "storage", v49 + v19), "length"));
    else
      v11 = 0;
  }
  TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v56);
  return v11;
}

+ (id)smartFieldWithAttributeKind:(unsigned int)a3 inColumnArray:(id)a4 atPoint:(CGPoint)a5
{
  double y;
  double x;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  CGPoint v12;
  CGRect v13;

  y = a5.y;
  x = a5.x;
  v7 = *(_QWORD *)&a3;
  v8 = +[TSWPColumn closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:](TSWPColumn, "closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:", a4, 0, 1);
  if (v8
    && (v9 = v8, objc_msgSend(v8, "frameBounds"), v12.x = x, v12.y = y, CGRectContainsPoint(v13, v12))
    && (v10 = objc_msgSend(v9, "charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:isAtEndOfLine:leadingEdge:", 0, 0, 1, 0, 0, x, y), v10 != 0x7FFFFFFFFFFFFFFFLL))
  {
    return (id)objc_msgSend(v9, "smartFieldAtCharIndex:attributeKind:", v10, v7);
  }
  else
  {
    return 0;
  }
}

+ (id)footnoteMarkAttachmentInColumnArray:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id v6;
  void *v7;
  uint64_t v8;
  CGPoint v10;
  CGRect v11;

  y = a4.y;
  x = a4.x;
  v6 = +[TSWPColumn closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:](TSWPColumn, "closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:", a3, 0, 1);
  if (v6
    && (v7 = v6, objc_msgSend((id)objc_msgSend(v6, "storage"), "wpKind") == 2)
    && (objc_msgSend(v7, "frameBounds"), v10.x = x, v10.y = y, CGRectContainsPoint(v11, v10))
    && (v8 = objc_msgSend(v7, "charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:isAtEndOfLine:leadingEdge:", 0, 0, 1, 0, 0, x, y), v8 != 0x7FFFFFFFFFFFFFFFLL))
  {
    return (id)objc_msgSend((id)objc_msgSend(v7, "storage"), "footnoteMarkAtCharIndex:", v8);
  }
  else
  {
    return 0;
  }
}

+ (id)footnoteReferenceAttachmentInColumnArray:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id v6;
  void *v7;
  uint64_t v8;
  CGPoint v10;
  CGRect v11;

  y = a4.y;
  x = a4.x;
  v6 = +[TSWPColumn closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:](TSWPColumn, "closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:", a3, 0, 1);
  if (v6
    && (v7 = v6, !objc_msgSend((id)objc_msgSend(v6, "storage"), "wpKind"))
    && (objc_msgSend(v7, "frameBounds"), v10.x = x, v10.y = y, CGRectContainsPoint(v11, v10))
    && (v8 = objc_msgSend(v7, "charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:isAtEndOfLine:leadingEdge:", 0, 0, 1, 0, 0, x, y), v8 != 0x7FFFFFFFFFFFFFFFLL))
  {
    return (id)objc_msgSend((id)objc_msgSend(v7, "storage"), "footnoteReferenceAtCharIndex:", v8);
  }
  else
  {
    return 0;
  }
}

+ (id)pathForHighlightWithRange:(_NSRange)a3 columnArray:(id)a4 pathStyle:(int)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  id obj;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;
  CGRect v33;
  CGRect v34;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = a4;
  v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v8)
  {
    v9 = v8;
    v20 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v12 = (void *)objc_msgSend(v11, "rectsForSelectionRange:selectionType:forParagraphMode:includeRuby:", a3.location, a3.length, 0, 0, a5 == 1);
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v23;
          do
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v23 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
              objc_msgSend(v17, "CGRectValue");
              if (a5 == 2)
              {
                objc_msgSend(v17, "CGRectValue");
                v34 = CGRectInset(v33, -3.0, -3.0);
                objc_msgSend(v7, "appendBezierPath:", +[TSDBezierPath bezierPathWithRoundedRect:cornerRadius:](TSDBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v34.origin.x, v34.origin.y, v34.size.width, v34.size.height, 3.0));
              }
              else
              {
                objc_msgSend(v7, "appendBezierPathWithRect:");
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v14);
        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v9);
  }
  return v7;
}

+ (CGRect)boundsRectForSelection:(id)a3 columnArray:(id)a4 includeRuby:(BOOL)a5
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  _BOOL8 v9;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;
  CGRect v43;
  CGRect v44;
  CGRect result;
  CGRect v46;

  v42 = *MEMORY[0x24BDAC8D0];
  x = *MEMORY[0x24BDBF070];
  y = *(double *)(MEMORY[0x24BDBF070] + 8);
  width = *(double *)(MEMORY[0x24BDBF070] + 16);
  height = *(double *)(MEMORY[0x24BDBF070] + 24);
  if (a3)
  {
    v9 = a5;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v12 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v37;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v37 != v14)
            objc_enumerationMutation(a4);
          v16 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v15);
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v17 = objc_msgSend(a3, "range", 0);
          v19 = (void *)objc_msgSend(v16, "rectsForSelectionRange:selectionType:forParagraphMode:includeRuby:", v17, v18, objc_msgSend(a3, "type"), 0, v9);
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v33;
            do
            {
              v23 = 0;
              do
              {
                if (*(_QWORD *)v33 != v22)
                  objc_enumerationMutation(v19);
                objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v23), "CGRectValue");
                v46.origin.x = v24;
                v46.origin.y = v25;
                v46.size.width = v26;
                v46.size.height = v27;
                v43.origin.x = x;
                v43.origin.y = y;
                v43.size.width = width;
                v43.size.height = height;
                v44 = CGRectUnion(v43, v46);
                x = v44.origin.x;
                y = v44.origin.y;
                width = v44.size.width;
                height = v44.size.height;
                ++v23;
              }
              while (v21 != v23);
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
            }
            while (v21);
          }
          ++v15;
        }
        while (v15 != v13);
        v13 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v13);
    }
  }
  v28 = x;
  v29 = y;
  v30 = width;
  v31 = height;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

+ (id)columnForCharIndex:(unint64_t)a3 eol:(BOOL)a4 withColumns:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend((id)objc_msgSend(a5, "firstObject"), "storage");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = a5;
  v8 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v8)
    return 0;
  v9 = v8;
  v10 = 0;
  v11 = *(_QWORD *)v22;
LABEL_3:
  v12 = 0;
  while (1)
  {
    if (*(_QWORD *)v22 != v11)
      objc_enumerationMutation(obj);
    v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v12);
    if (v7 != objc_msgSend(v13, "storage"))
    {
      v14 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSWPColumn columnForCharIndex:eol:withColumns:]");
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 462, CFSTR("unexpected column storage"));
    }
    v16 = objc_msgSend(v13, "range");
    if (v16 + v17 > a3 && a4)
      return v13;
    if (v16 + v17 > a3)
      v10 = v13;
    if (v9 == ++v12)
    {
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v13 = v10;
      if (v9)
        goto LABEL_3;
      return v13;
    }
  }
}

- (double)logicalBoundsTop
{
  return CGRectGetMinY(self->_frameBounds);
}

- (double)logicalBoundsBottom
{
  return CGRectGetMaxY(self->_frameBounds);
}

- (void)setRange:(_NSRange)a3
{
  NSUInteger length;

  length = a3.length;
  -[TSWPColumn setStartCharIndex:](self, "setStartCharIndex:", a3.location);
  -[TSWPColumn setCharacterCount:](self, "setCharacterCount:", length);
}

- (void)setAnchoredRange:(_NSRange)a3
{
  NSUInteger length;

  length = a3.length;
  -[TSWPColumn setStartAnchoredCharIndex:](self, "setStartAnchoredCharIndex:", a3.location);
  -[TSWPColumn setAnchoredCharCount:](self, "setAnchoredCharCount:", length);
}

- (void)incrementRanges:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  unint64_t startAnchoredCharIndex;
  void *v8;
  uint64_t v9;
  unint64_t startCharIndex;
  int64_t v11;

  if ((int64_t)-self->_startCharIndex > a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPColumn incrementRanges:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 561, CFSTR("Bad delta"));
  }
  startAnchoredCharIndex = self->_startAnchoredCharIndex;
  if (-(uint64_t)startAnchoredCharIndex > a3)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPColumn incrementRanges:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 562, CFSTR("Bad delta"));
    startAnchoredCharIndex = self->_startAnchoredCharIndex;
  }
  startCharIndex = self->_startCharIndex;
  if (-(uint64_t)startCharIndex > a3)
    v11 = -(uint64_t)startCharIndex;
  else
    v11 = a3;
  self->_startCharIndex = v11 + startCharIndex;
  self->_startAnchoredCharIndex = startAnchoredCharIndex + v11;
  TSWPLineFragmentArray::incrementStartCharIndexes(self->_lineFragmentArray.__ptr_, v11);
}

- (void)setStorage:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  uint64_t v7;
  TSWPStorage *v8;
  unint64_t characterCount;
  void *v10;
  uint64_t v11;

  length = a4.length;
  v7 = a4.location - self->_startCharIndex;

  v8 = (TSWPStorage *)a3;
  self->_storage = v8;
  TSWPLineFragmentArray::setStorage(self->_lineFragmentArray.__ptr_, v8, v7);
  characterCount = self->_characterCount;
  self->_startCharIndex += v7;
  self->_startAnchoredCharIndex += v7;
  if (characterCount != length)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPColumn setStorage:range:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 588, CFSTR("Shouldn't be changing character count here"));
  }
}

- (double)trimToCharIndex:(unint64_t)a3 inTarget:(id)a4
{
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  double v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t LineIndexForCharIndex;
  double v16;
  BOOL v17;
  NSUInteger v18;
  NSUInteger v19;
  uint64_t v20;
  uint64_t v21;
  double MinY;
  double *Object;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _NSRange v29;

  if (self->_nextWidowPullsDownFromCharIndex < a3)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPColumn trimToCharIndex:inTarget:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 611, CFSTR("Bad charIndex"));
  }
  v9 = -[TSWPColumn range](self, "range");
  v11 = v9 + v10;
  if (a3 < v9 || v11 < a3)
  {
    v25 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v26 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPColumn trimToCharIndex:inTarget:]");
    objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 616, CFSTR("Bad charIndex"));
    if (a4)
      goto LABEL_6;
LABEL_19:
    v27 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v28 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPColumn trimToCharIndex:inTarget:]");
    objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 618, CFSTR("invalid nil value for '%s'"), "target");
    goto LABEL_6;
  }
  if (!a4)
    goto LABEL_19;
LABEL_6:
  v12 = 0.0;
  if (a3 >= v9 && v11 > a3)
  {
    self->_characterCount = a3 - v9;
    v13 = TSWPLineFragmentArray::count(self->_lineFragmentArray.__ptr_);
    if (v13)
    {
      v14 = v13;
      LineIndexForCharIndex = TSWPLineFragmentArray::findLineIndexForCharIndex(self->_lineFragmentArray.__ptr_, a3);
      v16 = 0.0;
      v17 = v14 > LineIndexForCharIndex;
      v18 = v14 - LineIndexForCharIndex;
      if (v17)
      {
        v19 = LineIndexForCharIndex;
        if (LineIndexForCharIndex)
        {
          v20 = TSWPLineFragmentArray::objectAtIndex(self->_lineFragmentArray.__ptr_, LineIndexForCharIndex);
          v21 = TSWPLineFragmentArray::objectAtIndex(self->_lineFragmentArray.__ptr_, v19 - 1);
          MinY = CGRectGetMinY(*(CGRect *)(v20 + 48));
          v12 = MinY - CGRectGetMaxY(*(CGRect *)(v21 + 48)) + *(double *)(v20 + 112);
        }
        v29.location = v19;
        v29.length = v18;
        TSWPLineFragmentArray::removeObjectsInRange(self->_lineFragmentArray.__ptr_, v29);
      }
      Object = (double *)TSWPLineFragmentArray::lastObject(self->_lineFragmentArray.__ptr_);
      if (Object)
        v16 = Object[4] + Object[5] + Object[17];
      -[TSWPColumn setContentBottom:](self, "setContentBottom:", v16);
      -[TSWPColumn clearAdornments](self, "clearAdornments");
      TSWPLayoutChore::addParagraphAdornmentsToColumn(self, (void *)objc_msgSend(a4, "columnMetricsForCharIndex:outRange:", a3, 0), 0);
      TSWPLayoutChore::addChangeBarAdornmentsToColumn(self, (void *)objc_msgSend(a4, "columnMetricsForCharIndex:outRange:", a3, 0));
    }
  }
  self->_nextWidowPullsDownFromCharIndex = a3;
  return v12;
}

- (void)trimFromCharIndex:(unint64_t)a3 inTarget:(id)a4 layoutChore:(void *)a5
{
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  shared_ptr<TSWPLineFragmentArray> *p_lineFragmentArray;
  NSUInteger LineIndexForCharIndex;
  _NSRange v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t Object;
  double *v22;
  uint64_t v23;
  double MinY;
  double v25;
  double v26;
  double *v27;
  double v28;
  CGPoint v29;
  CGRect v30;

  if (self->_nextWidowPullsDownFromCharIndex < a3)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPColumn trimFromCharIndex:inTarget:layoutChore:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 658, CFSTR("Bad charIndex"));
  }
  v11 = -[TSWPColumn range](self, "range");
  v13 = v11 + v12;
  if (v11 > a3 || v13 < a3)
  {
    v17 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v18 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPColumn trimFromCharIndex:inTarget:layoutChore:]");
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 661, CFSTR("Bad charIndex"));
    if (a4)
      goto LABEL_6;
LABEL_13:
    v19 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v20 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPColumn trimFromCharIndex:inTarget:layoutChore:]");
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 663, CFSTR("invalid nil value for '%s'"), "target");
    goto LABEL_6;
  }
  if (!a4)
    goto LABEL_13;
LABEL_6:
  if (v11 < a3 && v13 >= a3)
  {
    p_lineFragmentArray = &self->_lineFragmentArray;
    if (TSWPLineFragmentArray::count(self->_lineFragmentArray.__ptr_))
    {
      LineIndexForCharIndex = TSWPLineFragmentArray::findLineIndexForCharIndex(p_lineFragmentArray->__ptr_, a3);
      if (LineIndexForCharIndex)
      {
        v16.length = LineIndexForCharIndex;
        if (LineIndexForCharIndex != 0x7FFFFFFFFFFFFFFFLL)
        {
          self->_startCharIndex = a3;
          self->_characterCount = v13 - a3;
          v16.location = 0;
          TSWPLineFragmentArray::removeObjectsInRange(self->_lineFragmentArray.__ptr_, v16);
          Object = TSWPLineFragmentArray::firstObject(self->_lineFragmentArray.__ptr_);
          v22 = (double *)MEMORY[0x24BDBEFB0];
          if (Object)
          {
            v23 = Object;
            -[TSWPColumn frameBounds](self, "frameBounds");
            MinY = CGRectGetMinY(v30);
            v25 = MinY - CGRectGetMinY(*(CGRect *)(v23 + 48));
            v26 = 0.0;
          }
          else
          {
            v26 = *MEMORY[0x24BDBEFB0];
            v25 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
          }
          v29.x = v26;
          v29.y = v25;
          TSWPLineFragmentArray::offsetLineFragmentsBy(p_lineFragmentArray->__ptr_, v29);
          if (v26 != *v22 || v25 != v22[1])
            TSWPLayoutChore::pPostProcessAttachments((uint64_t)a5, (TSWPLineFragment ****)&self->_lineFragmentArray);
          v27 = (double *)TSWPLineFragmentArray::lastObject(p_lineFragmentArray->__ptr_);
          if (v27)
            v28 = v27[4] + v27[5] + v27[17];
          else
            v28 = 0.0;
          -[TSWPColumn setContentBottom:](self, "setContentBottom:", v28);
          -[TSWPColumn clearAdornments](self, "clearAdornments");
          TSWPLayoutChore::addParagraphAdornmentsToColumn(self, (void *)objc_msgSend(a4, "columnMetricsForCharIndex:outRange:", a3, 0), 0);
          TSWPLayoutChore::addChangeBarAdornmentsToColumn(self, (void *)objc_msgSend(a4, "columnMetricsForCharIndex:outRange:", a3, 0));
        }
      }
    }
  }
}

- (double)minimumHeightForLayoutOnPage
{
  uint64_t v3;
  double MinY;
  double v5;
  double v6;
  double result;
  double contentBottom;
  double v9;

  if (-[TSWPColumn countLines](self, "countLines"))
  {
    v3 = TSWPLineFragmentArray::objectAtIndex(self->_lineFragmentArray.__ptr_, 0);
    MinY = CGRectGetMinY(*(CGRect *)(v3 + 48));
    -[TSWPColumn logicalBoundsTop](self, "logicalBoundsTop");
    v6 = v5;
    result = 0.0;
    if (MinY > v6)
      return result;
    contentBottom = *(double *)(v3 + 32) + *(double *)(v3 + 40) + *(double *)(v3 + 136);
  }
  else
  {
    contentBottom = self->_contentBottom;
  }
  -[TSWPColumn logicalBoundsTop](self, "logicalBoundsTop");
  return contentBottom - v9;
}

- (double)textBottom
{
  double v3;
  double v4;
  uint64_t Object;

  -[TSWPColumn logicalBoundsTop](self, "logicalBoundsTop");
  v4 = v3;
  Object = TSWPLineFragmentArray::lastObject(self->_lineFragmentArray.__ptr_);
  if (Object)
    return CGRectGetMaxY(*(CGRect *)(Object + 48));
  else
    return v4;
}

- (double)textHeight
{
  double v3;
  double v4;
  double v5;

  -[TSWPColumn textBottom](self, "textBottom");
  v4 = v3;
  -[TSWPColumn logicalBoundsTop](self, "logicalBoundsTop");
  return v4 - v5;
}

- (BOOL)requiresGlyphVectorsForHeightMeasurement
{
  TSWPLineFragmentArray **v2;
  uint64_t v3;
  unint64_t v4;
  TSWPLineFragment *v5;
  unint64_t v6;
  unint64_t v7;
  TSWPLineFragment *v8;
  _BOOL4 v9;

  v2 = -[TSWPColumn lineFragmentArray](self, "lineFragmentArray");
  v3 = TSWPLineFragmentArray::count(*v2);
  if (v3)
  {
    v4 = v3;
    v5 = (TSWPLineFragment *)TSWPLineFragmentArray::objectAtIndex(*v2, 0);
    if (TSWPLineFragment::requiresGlyphVectorsForHeightMeasurement(v5))
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      v6 = 1;
      do
      {
        v7 = v6;
        if (v4 == v6)
          break;
        v8 = (TSWPLineFragment *)TSWPLineFragmentArray::objectAtIndex(*v2, v6);
        v9 = TSWPLineFragment::requiresGlyphVectorsForHeightMeasurement(v8);
        v6 = v7 + 1;
      }
      while (!v9);
      LOBYTE(v3) = v7 < v4;
    }
  }
  return v3;
}

- (void)addAdornmentRect:(const TSWPAdornmentRect *)a3
{
  uint64_t *paragraphAdornments;
  unint64_t v4;
  uint64_t v5;

  paragraphAdornments = (uint64_t *)self->_paragraphAdornments;
  v4 = paragraphAdornments[1];
  if (v4 >= paragraphAdornments[2])
  {
    v5 = std::vector<TSWPAdornmentRect>::__push_back_slow_path<TSWPAdornmentRect const&>(paragraphAdornments, (uint64_t)a3);
  }
  else
  {
    std::vector<TSWPAdornmentRect>::__construct_one_at_end[abi:ne180100]<TSWPAdornmentRect const&>((uint64_t)paragraphAdornments, (uint64_t)a3);
    v5 = v4 + 56;
  }
  paragraphAdornments[1] = v5;
}

- (const)lineFragmentAtIndex:(unint64_t)a3
{
  return (const void *)TSWPLineFragmentArray::objectAtIndex(self->_lineFragmentArray.__ptr_, a3);
}

- (void)normalizeLineFragmentOrigins:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;

  y = a3.y;
  x = a3.x;
  -[TSWPColumn frameBounds](self, "frameBounds");
  -[TSWPColumn offsetLineFragmentsByPoint:](self, "offsetLineFragmentsByPoint:", v6 - x, v7 - y);
}

- (void)offsetLineFragmentsByPoint:(CGPoint)a3
{
  uint64_t v4;

  if (a3.x != 0.0 || a3.y != 0.0)
  {
    v4 = *(_QWORD *)&a3.y;
    TSWPLineFragmentArray::offsetLineFragmentsBy(self->_lineFragmentArray.__ptr_, a3);
    *(float64x2_t *)&self->_contentBottom = vaddq_f64((float64x2_t)vdupq_lane_s64(v4, 0), *(float64x2_t *)&self->_contentBottom);
  }
}

- (unint64_t)lineFragmentCountForBaseline:(double)a3
{
  return TSWPLineFragmentArray::lineFragmentCountForBaseline(self->_lineFragmentArray.__ptr_, a3);
}

- (void)makeEmpty:(unint64_t)a3 layoutResultFlags:(int)a4
{
  self->_startCharIndex = a3;
  self->_characterCount = 0;
  self->_startAnchoredCharIndex = a3;
  self->_anchoredCharCount = 0;
  self->_contentBottom = 0.0;
  self->_erasableContentBottom = 0.0;
  self->_layoutResultFlags = a4;
  self->_nextWidowPullsDownFromCharIndex = a3;
  TSWPLineFragmentArray::removeAllObjects(self->_lineFragmentArray.__ptr_);
  -[TSWPColumn clearAdornments](self, "clearAdornments");
}

- (CGRect)boundsOfLineFragmentAtIndex:(unint64_t)a3
{
  double *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v3 = (double *)TSWPLineFragmentArray::objectAtIndex(self->_lineFragmentArray.__ptr_, a3);
  v4 = v3[6];
  v5 = v3[7];
  v6 = v3[8];
  v7 = v3[9];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)labelBoundsOfLineFragmentAtIndex:(unint64_t)a3
{
  TSWPLineFragment *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v3 = (TSWPLineFragment *)TSWPLineFragmentArray::objectAtIndex(self->_lineFragmentArray.__ptr_, a3);
  TSWPLineFragment::labelRect(v3);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (double)typographicGlyphExtentOfLineFragmentAtIndex:(unint64_t)a3
{
  return *(double *)(TSWPLineFragmentArray::objectAtIndex(self->_lineFragmentArray.__ptr_, a3) + 216);
}

- (BOOL)isEmptyLineFragmentAtIndex:(unint64_t)a3
{
  return (*(unsigned __int8 *)(TSWPLineFragmentArray::objectAtIndex(self->_lineFragmentArray.__ptr_, a3) + 25) >> 6) & 1;
}

- (BOOL)isDropCapFragmentAtIndex:(unint64_t)a3
{
  return (*(unsigned __int8 *)(TSWPLineFragmentArray::objectAtIndex(self->_lineFragmentArray.__ptr_, a3) + 27) >> 1) & 1;
}

- ($8502DCEA08BBBE1AB2005217B3838BBD)heightInfoOfLineFragmentAtIndex:(SEL)a3
{
  $8502DCEA08BBBE1AB2005217B3838BBD *result;
  __int128 v6;
  __int128 v7;

  result = ($8502DCEA08BBBE1AB2005217B3838BBD *)TSWPLineFragmentArray::objectAtIndex(self->_lineFragmentArray.__ptr_, a4);
  v6 = *(_OWORD *)&result[2].var0;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&result[1].var6;
  *(_OWORD *)&retstr->var2 = v6;
  v7 = *(_OWORD *)&result[2].var4;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&result[2].var2;
  *(_OWORD *)&retstr->var6 = v7;
  return result;
}

- (double)baselineOfLineFragmentAtCharIndex:(unint64_t)a3
{
  TSWPLineFragmentArray *ptr;
  unint64_t **v4;
  unint64_t **v5;
  double result;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;

  ptr = self->_lineFragmentArray.__ptr_;
  v4 = *(unint64_t ***)ptr;
  v5 = (unint64_t **)*((_QWORD *)ptr + 1);
  result = 0.0;
  while (v4 != v5)
  {
    v7 = **v4;
    v9 = a3 >= v7;
    v8 = a3 - v7;
    v9 = !v9 || v8 >= (*v4)[1];
    if (!v9)
      return *((double *)*v4 + 4) + *((double *)*v4 + 5);
    v4 += 2;
  }
  return result;
}

- ($67DC2B40F188BF54E27CB16063B1C8C0)lineMetricsAtCharIndex:(SEL)a3 allowEndOfLine:(unint64_t)a4
{
  $67DC2B40F188BF54E27CB16063B1C8C0 *result;
  TSWPLineFragment *v9;
  CGSize v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t i;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  const __CTFont *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  BOOL v29;
  _BYTE v30[128];
  uint64_t v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v31 = *MEMORY[0x24BDAC8D0];
  *retstr = *($67DC2B40F188BF54E27CB16063B1C8C0 *)TSWPEmptyLineMetrics;
  result = -[TSWPColumn lineIndexForCharIndex:eol:](self, "lineIndexForCharIndex:eol:", a4, a5);
  if (result != ($67DC2B40F188BF54E27CB16063B1C8C0 *)0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = -[TSWPColumn lineFragmentAtIndex:](self, "lineFragmentAtIndex:", result);
    v29 = 0;
    v10 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
    retstr->var0.origin = (CGPoint)*MEMORY[0x24BDBF070];
    retstr->var0.size = v10;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v11 = -[TSWPColumn rectsForSelectionRange:selectionType:forParagraphMode:includeRuby:](self, "rectsForSelectionRange:selectionType:forParagraphMode:includeRuby:", *(_QWORD *)v9, *((_QWORD *)v9 + 1), 0, 0, 0, 0);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v26;
      x = retstr->var0.origin.x;
      y = retstr->var0.origin.y;
      width = retstr->var0.size.width;
      height = retstr->var0.size.height;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "CGRectValue");
          v34.origin.x = v20;
          v34.origin.y = v21;
          v34.size.width = v22;
          v34.size.height = v23;
          v32.origin.x = x;
          v32.origin.y = y;
          v32.size.width = width;
          v32.size.height = height;
          v33 = CGRectUnion(v32, v34);
          x = v33.origin.x;
          y = v33.origin.y;
          width = v33.size.width;
          height = v33.size.height;
          retstr->var0 = v33;
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v13);
    }
    retstr->var1 = *((double *)v9 + 4) + *((double *)v9 + 5);
    *(_OWORD *)&retstr->var2 = *((_OWORD *)v9 + 8);
    v24 = (const __CTFont *)TSWPLineFragment::fontAtCharIndex(v9, a4, &v29);
    retstr->var4 = CTFontGetXHeight(v24);
  }
  return result;
}

- (double)horizontalOffsetForCharIndex:(unint64_t)a3 lineFragmentIndex:(unint64_t)a4 bumpPastHyphen:(BOOL)a5 allowPastLineBounds:(BOOL)a6
{
  TSWPLineFragment *v9;

  v9 = (TSWPLineFragment *)TSWPLineFragmentArray::objectAtIndex(self->_lineFragmentArray.__ptr_, a4);
  return TSWPLineFragment::wpOffsetForCharIndex(v9, a3, a5, a6, 0);
}

- (const)lineFragmentClosestToPoint:(CGPoint)a3 knobTag:(unint64_t)a4
{
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  TSWPLineFragmentArray **v11;
  uint64_t v12;
  uint64_t v13;
  double *v14;
  unint64_t v15;
  double v16;
  double v17;
  double *v18;
  double v19;
  double v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;

  y = a3.y;
  x = a3.x;
  if (self)
  {
    -[TSWPColumn transformToWP](self, "transformToWP");
    v8 = *((double *)&v22 + 1);
    v9 = *((double *)&v23 + 1);
    v10 = *((double *)&v24 + 1);
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v22 = 0u;
    v10 = 0.0;
    v9 = 0.0;
    v8 = 0.0;
  }
  v11 = -[TSWPColumn lineFragmentArray](self, "lineFragmentArray", v22, v23, v24);
  v12 = TSWPLineFragmentArray::count(*v11);
  if (!v12)
    return 0;
  v13 = v12;
  v14 = 0;
  v15 = 0;
  v16 = v10 + y * v9 + v8 * x;
  v17 = INFINITY;
  do
  {
    v18 = (double *)TSWPLineFragmentArray::objectAtIndex(*v11, v15);
    TSDPositionOfKnobOnRectangle(a4, v18[6], v18[7], v18[8], v18[9]);
    v20 = vabdd_f64(v16, v19);
    if (v20 < v17)
    {
      v14 = v18;
      v17 = v20;
    }
    ++v15;
  }
  while (v13 != v15);
  return v14;
}

- (const)lineFragmentForCharIndex:(unint64_t)a3 knobTag:(unint64_t)a4 selectionType:(int)a5
{
  unint64_t v8;
  unint64_t v9;
  TSWPLineFragmentArray **v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  BOOL v17;
  _BOOL4 v18;
  unint64_t v19;
  uint64_t v20;
  _BOOL4 v21;
  BOOL v22;
  int v24;
  int v25;
  uint64_t v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  uint64_t v34;
  int v35;

  v8 = -[TSWPStorage selectionRangeMaxForCharIndex:](self->_storage, "selectionRangeMaxForCharIndex:");
  v9 = v8;
  v35 = 0;
  if (a3 && v8 == a3)
    v35 = IsParagraphBreakingCharacter(-[TSWPStorage characterAtIndex:](self->_storage, "characterAtIndex:", a3 - 1));
  v10 = -[TSWPColumn lineFragmentArray](self, "lineFragmentArray");
  v11 = TSWPLineFragmentArray::count(*v10);
  if (!v11)
    return 0;
  v12 = v11;
  v13 = 0;
  v34 = v11 - 1;
  while (1)
  {
    v14 = TSWPLineFragmentArray::objectAtIndex(*v10, v13);
    v15 = *(_DWORD *)(v14 + 24);
    if ((v15 & 0x40) == 0)
    {
      v16 = v14;
      v17 = (v15 & 0x1000) != 0 && a5 == 7;
      v18 = !v17;
      v20 = *(_QWORD *)v14;
      v19 = *(_QWORD *)(v14 + 8);
      v21 = a3 - *(_QWORD *)v14 < v19 && a3 >= *(_QWORD *)v14;
      v22 = a3 == v20 && v9 == a3;
      if (!v22 && !v21)
      {
        v25 = 0;
      }
      else
      {
        v24 = (v15 >> 9) & 1;
        if (a3 != v20)
          v24 = 1;
        if (a4 != 11)
          v24 = 1;
        v25 = (v15 & 1) != 0 ? v24 : 1;
      }
      if (a5 == 7)
      {
        v27 = (a4 == 11) ^ v18 ^ 1;
        v20 = TSWPLineFragment::leftMostCharIndex((TSWPLineFragment *)v14);
        v26 = TSWPLineFragment::rightMostCharIndex((TSWPLineFragment *)v16);
      }
      else
      {
        v26 = v19 + v20;
        v27 = a4 == 11;
      }
      LOBYTE(v28) = 0;
      v29 = v27 ^ 1;
      if (v9 != a3)
        v29 = 1;
      if (v26 == a3)
      {
        v30 = v27;
      }
      else
      {
        v29 = 1;
        v30 = 1;
      }
      v31 = v30 ^ 1;
      v32 = v29 | v35 ? v31 : v34 == v13;
      if (v27 && v20 == a3)
        v28 = (*(unsigned __int8 *)(v16 + 25) >> 1) & 1;
      if (((v25 | v32) & 1) != 0 || (v28 & 1) != 0)
        break;
    }
    if (v12 == ++v13)
      return 0;
  }
  return (const void *)v16;
}

- (unint64_t)lineIndexForCharIndex:(unint64_t)a3 eol:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  TSWPLineFragmentArray **v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  int v19;
  unsigned int v20;
  int v21;
  int v22;
  _BOOL4 v23;
  _BOOL4 v24;
  int v25;
  unint64_t v26;
  int v27;
  unint64_t v28;
  int v29;
  int v30;

  v4 = a4;
  v7 = -[TSWPStorage selectionRangeMaxForCharIndex:](self->_storage, "selectionRangeMaxForCharIndex:");
  if (a3)
  {
    v8 = -[TSWPStorage characterAtIndex:](self->_storage, "characterAtIndex:", a3 - 1);
    v9 = v8;
    v10 = IsParagraphBreakingCharacter(v8);
    if (v9 == 8232)
      v11 = 1;
    else
      v11 = v10;
  }
  else
  {
    v11 = 0;
  }
  if (v7 == a3)
    v12 = 0;
  else
    v12 = objc_msgSend(-[TSWPStorage attachmentAtCharIndex:](self->_storage, "attachmentAtCharIndex:", a3), "isPartitioned");
  v13 = -[TSWPColumn lineFragmentArray](self, "lineFragmentArray");
  v14 = TSWPLineFragmentArray::count(*v13);
  if (!v14)
    return 0x7FFFFFFFFFFFFFFFLL;
  v15 = v14;
  v16 = 0;
  while (1)
  {
    v17 = TSWPLineFragmentArray::objectAtIndex(*v13, v16);
    v18 = *(_QWORD *)(v17 + 8);
    v19 = *(_DWORD *)(v17 + 24);
    v20 = v19 & 0x200;
    if (a3 == *(_QWORD *)v17)
      v21 = v12;
    else
      v21 = 0;
    v22 = v21 & (v20 >> 9);
    v23 = a3 == *(_QWORD *)v17 && v7 == a3;
    v24 = a3 - *(_QWORD *)v17 < v18 && a3 >= *(_QWORD *)v17;
    v25 = v21 ^ 1;
    v26 = v18 + *(_QWORD *)v17;
    v27 = v22 ^ 1;
    if (v26 != a3)
      v27 = 0;
    v28 = v26;
    if ((v11 | v25) == 1)
      v29 = v11 & v22;
    else
      v29 = 0;
    if ((v11 | v25) == 1)
      v27 = 0;
    if (v28 == a3 && (v4 && ((v29 | v22 ^ 1) & 1) != 0 || v7 == a3))
      v30 = (v19 & 0x100) != 0 ? 0 : v11 ^ 1;
    else
      v30 = 0;
    if (((v24 & (v25 | (v20 >> 9)) | v23 | v27 | v29) & 1) != 0 || v30)
      break;
    if (v15 == ++v16)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v16;
}

- (CGRect)caretRectForSelection:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  int v14;
  unint64_t startCharIndex;
  unint64_t characterCount;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  int v25;
  int v26;
  int v27;
  int v28;
  BOOL v29;
  int v30;
  int v31;
  unint64_t v32;
  TSWPLineFragment *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  const __CTFont *FontForStyle;
  id v38;
  void *v39;
  const __CTFont *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  _BOOL4 v46;
  double v47;
  double v48;
  id v49;
  CGAffineTransform v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  BOOL v60;
  CGRect v61;

  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPColumn caretRectForSelection:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 1129, CFSTR("invalid nil value for '%s'"), "selection");
  }
  if ((objc_msgSend(a3, "isInsertionPoint") & 1) == 0)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPColumn caretRectForSelection:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 1130, CFSTR("Caret rect for ranged selection is not meaningful"));
  }
  v9 = *MEMORY[0x24BDBF070];
  v10 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v11 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v12 = *(double *)(MEMORY[0x24BDBF070] + 24);
  v13 = objc_msgSend(a3, "range");
  v49 = a3;
  v14 = objc_msgSend(a3, "caretAffinity");
  startCharIndex = self->_startCharIndex;
  characterCount = self->_characterCount;
  v17 = -[TSWPStorage selectionRangeForCharIndex:](self->_storage, "selectionRangeForCharIndex:", v13);
  v19 = v17 + v18;
  if (v13 < v17 || v13 > v19)
  {
    v21 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v22 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPColumn caretRectForSelection:]");
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 1139, CFSTR("invalid selection"));
  }
  v23 = 0;
  if (v13 > v17 && v13 <= v19)
  {
    v24 = -[TSWPStorage characterAtIndex:](self->_storage, "characterAtIndex:", v13 - 1);
    v25 = v24;
    v26 = IsParagraphBreakingCharacter(v24);
    if (v25 == 8232)
      v23 = 1;
    else
      v23 = v26;
  }
  if (v13 == v19)
    v27 = 0;
  else
    v27 = objc_msgSend(-[TSWPStorage attachmentAtCharIndex:](self->_storage, "attachmentAtCharIndex:", v13), "isPartitioned");
  if (v14 == 1)
    v28 = 1;
  else
    v28 = v27;
  if (v13 >= startCharIndex && v13 - startCharIndex < characterCount)
  {
    v29 = v13 > startCharIndex || v13 == v17;
    v30 = v28 ^ 1;
    if (v29)
      v30 = 1;
    if (((v30 | v23) & 1) != 0)
      goto LABEL_61;
  }
  if (v23)
    v31 = v27;
  else
    v31 = v28;
  if (v13 == v19)
    v31 = 1;
  if (v13 == characterCount + startCharIndex && v31)
  {
LABEL_61:
    v32 = -[TSWPColumn lineIndexForCharIndex:eol:](self, "lineIndexForCharIndex:eol:", v13);
    if (v32 < -[TSWPColumn countLines](self, "countLines"))
    {
      v33 = -[TSWPColumn lineFragmentAtIndex:](self, "lineFragmentAtIndex:", v32);
      if (!v33)
      {
        v34 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v35 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPColumn caretRectForSelection:]");
        objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 1163, CFSTR("invalid nil value for '%s'"), "lineFragment");
      }
      v60 = 0;
      if (v13 > v17)
        v36 = v23 ^ 1u;
      else
        v36 = 0;
      FontForStyle = (const __CTFont *)TSWPLineFragment::fontAtCharIndex(v33, v13 - v36, &v60);
      v38 = -[TSWPStorage characterStyleAtCharIndex:left:effectiveRange:](self->_storage, "characterStyleAtCharIndex:left:effectiveRange:", v13, v23 ^ 1u, 0);
      v39 = (void *)-[TSWPStyleProvider paragraphStyleAtParIndex:effectiveRange:](-[TSWPColumn styleProvider](self, "styleProvider"), "paragraphStyleAtParIndex:effectiveRange:", -[TSWPStorage paragraphIndexAtCharIndex:](self->_storage, "paragraphIndexAtCharIndex:", v13), 0);
      if (FontForStyle)
      {
        v40 = 0;
      }
      else
      {
        FontForStyle = TSWPFastCreateFontForStyle((uint64_t)v38, v39, self->_scaleTextPercent);
        v40 = FontForStyle;
        if (!FontForStyle)
          goto LABEL_58;
      }
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      TSWPFontHeightInfoForFont(FontForStyle, &v56);
      v41 = (void *)TSWPResolvePropertyForStyles((uint64_t)v38, (uint64_t)v39, 33, 0);
      if (v41)
      {
        objc_msgSend(v41, "doubleValue");
        v43 = v42;
      }
      else
      {
        v43 = 0.0;
      }
      TSWPLineFragment::wpOffsetForInsertionPoint(v33, objc_msgSend(v49, "insertionChar"), objc_msgSend(v49, "leadingEdge"), objc_msgSend(v49, "isVisual"), 0);
      v9 = v44;
      v45 = *((double *)v33 + 4) + *((double *)v33 + 5) - v43;
      v54 = 0.0;
      v55 = 0.0;
      v52 = 0.0;
      v53 = 0.0;
      v51 = 0.0;
      if (TSWPLineFragment::isInsideTateChuYokoLineAtCharIndex(v33, v13, &v55, &v54, &v53, &v52, &v51))
      {
        v10 = floor(v45 + v54 * 0.5 - v55);
        v11 = v53 + v52 + v51;
        v9 = v9 - v11;
        v12 = 0.0;
        if (!v40)
          goto LABEL_58;
        goto LABEL_57;
      }
      v46 = -[TSWPColumn textIsVertical](self, "textIsVertical");
      v47 = *((double *)&v57 + 1);
      v48 = *(double *)&v57;
      if (v46 && !v60)
      {
        v47 = (*(double *)&v57 + *((double *)&v57 + 1)) * 0.5;
        *(double *)&v57 = v47;
        *((double *)&v57 + 1) = v47;
        v48 = v47;
      }
      v10 = floor(v45 - v48 - *(double *)&v58);
      v12 = ceil(v45 + v47) - v10;
      v11 = 0.0;
      if (v40)
LABEL_57:
        CFRelease(v40);
    }
  }
LABEL_58:
  -[TSWPColumn transformFromWP](self, "transformFromWP");
  v61.origin.x = v9;
  v61.origin.y = v10;
  v61.size.width = v11;
  v61.size.height = v12;
  return CGRectApplyAffineTransform(v61, &v50);
}

- (CGRect)glyphRectForRange:(_NSRange)a3 includingLabel:(BOOL)a4
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  TSWPLineFragmentArray *ptr;
  uint64_t **v11;
  TSWPLineFragment *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  BOOL v19;
  NSUInteger v20;
  NSUInteger v21;
  NSRange v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v34;
  double MaxX;
  id v36;
  id v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  id v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  uint64_t **v52;
  TSWPLineFragment *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  uint64_t v62;
  const __CTLine *v63;
  CGContext *FakeContext;
  double v65;
  CGFloat v66;
  double v67;
  double v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  uint64_t v78;
  NSUInteger v79;
  uint64_t **v81;
  uint64_t **v82;
  NSUInteger range2;
  CGFloat range2_8;
  CGFloat v85;
  CGFloat v86;
  CGFloat v87;
  CGAffineTransform v88;
  void *__p[3];
  NSRange v90;
  char v91[152];
  uint64_t v92;
  _QWORD v93[4];
  NSRange v94;
  NSRange v95;
  NSRange v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect ImageBounds;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect result;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;

  length = a3.length;
  location = a3.location;
  v93[2] = *MEMORY[0x24BDAC8D0];
  v86 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v87 = *MEMORY[0x24BDBF070];
  range2_8 = *(double *)(MEMORY[0x24BDBF070] + 24);
  v85 = *(double *)(MEMORY[0x24BDBF070] + 16);
  -[TSWPColumn range](self, "range");
  range2 = location;
  v7 = length;
  v8 = TSUIntersectionRangeWithEdge();
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    ptr = self->_lineFragmentArray.__ptr_;
    v11 = *(uint64_t ***)ptr;
    v81 = (uint64_t **)*((_QWORD *)ptr + 1);
    if (*(uint64_t ***)ptr != v81)
    {
      v78 = v8 + v9;
      v79 = location + length;
      do
      {
        v82 = v11;
        v12 = (TSWPLineFragment *)*v11;
        v13 = **v11;
        v14 = (*v11)[1];
        v15 = TSUIntersectionRangeWithEdge();
        v17 = v15;
        v18 = v16;
        if (v15 != 0x7FFFFFFFFFFFFFFFLL || (!v14 ? (v19 = v13 == v78) : (v19 = 0), v19))
        {
          if (v15 + v16 >= v79)
            v20 = v79;
          else
            v20 = v15 + v16;
          if (v15 < v20)
          {
            v21 = v15;
            do
            {
              v92 = 0x1000000;
              v93[0] = 0;
              *(_DWORD *)((char *)v93 + 7) = 0;
              -[TSWPStorage attributesAtCharIndex:attributesOfInterest:attributesTable:effectiveRange:](self->_storage, "attributesAtCharIndex:attributesOfInterest:attributesTable:effectiveRange:", v21, &v92, v91, &v90, v78);
              v94.location = v17;
              v94.length = v18;
              v95 = NSIntersectionRange(v94, v90);
              v96.location = range2;
              v96.length = v7;
              v22 = NSIntersectionRange(v95, v96);
              if (v22.length)
              {
                v23 = TSWPLineFragment::glyphRectForLineRange(v12, v22, (TSWPStorage *)self, 1);
                v25 = v24;
                v27 = v26;
                v29 = v28;
                TSWPLineFragment::emphasisMarkRectForLineRange(v12, v22);
                x = v97.origin.x;
                y = v97.origin.y;
                width = v97.size.width;
                height = v97.size.height;
                if (!CGRectIsEmpty(v97))
                {
                  v98.origin.x = v23;
                  v98.origin.y = v25;
                  v98.size.width = v27;
                  v98.size.height = v29;
                  v116.origin.x = x;
                  v116.origin.y = y;
                  v116.size.width = width;
                  v116.size.height = height;
                  v99 = CGRectUnion(v98, v116);
                  v23 = v99.origin.x;
                  v25 = v99.origin.y;
                  v27 = v99.size.width;
                  v29 = v99.size.height;
                }
                v100.origin.x = v23;
                v100.origin.y = v25;
                v100.size.width = v27;
                v100.size.height = v29;
                if (!CGRectIsEmpty(v100))
                {
                  v101.origin.x = v23;
                  v101.origin.y = v25;
                  v101.size.width = v27;
                  v101.size.height = v29;
                  v102 = CGRectIntegral(v101);
                  v23 = v102.origin.x;
                  v25 = v102.origin.y;
                  v34 = v102.size.width;
                  v29 = v102.size.height;
                  MaxX = CGRectGetMaxX(v102);
                  if (MaxX == rint(CGRectGetMaxX(self->_frameBounds)) + -1.0)
                    v27 = v34 + 1.0;
                  else
                    v27 = v34;
                }
                v36 = -[TSWPStorage valueForProperty:atCharIndex:effectiveRange:](self->_storage, "valueForProperty:atCharIndex:effectiveRange:", 22, v22.location, 0);
                v37 = v36;
                if (!v36 || !objc_msgSend(v36, "unsignedIntValue"))
                  v37 = -[TSWPStorage valueForProperty:atCharIndex:effectiveRange:](self->_storage, "valueForProperty:atCharIndex:effectiveRange:", 26, v22.location, 0);
                if (objc_msgSend(v37, "unsignedIntValue"))
                {
                  TSWPLineFragment::rectsForLineRange(v12, v22, 0, 1, 1, 0, (double **)__p);
                  TSWPUnionRects((CGRect **)__p);
                  v39 = v38;
                  v41 = v40;
                  v43 = v42;
                  v45 = v44;
                  if (__p[0])
                  {
                    __p[1] = __p[0];
                    operator delete(__p[0]);
                  }
                  v103.origin.x = v23;
                  v103.origin.y = v25;
                  v103.size.width = v27;
                  v103.size.height = v29;
                  v117.origin.x = v39;
                  v117.origin.y = v41;
                  v117.size.width = v43;
                  v117.size.height = v45;
                  v104 = CGRectUnion(v103, v117);
                  v23 = v104.origin.x;
                  v25 = v104.origin.y;
                  v27 = v104.size.width;
                  v29 = v104.size.height;
                }
                if ((*((_BYTE *)v12 + 24) & 0x20) != 0)
                {
                  v46 = -[TSWPStorage valueForProperty:atCharIndex:effectiveRange:](self->_storage, "valueForProperty:atCharIndex:effectiveRange:", 40, v22.location, 0);
                  v47 = v46;
                  if (v46)
                  {
                    if (objc_msgSend(v46, "isEnabled"))
                    {
                      objc_msgSend(v47, "shadowBoundsForRect:", v23, v25, v27, v29);
                      v23 = v48;
                      v25 = v49;
                      v27 = v50;
                      v29 = v51;
                    }
                  }
                }
                v105.origin.x = v23;
                v105.origin.y = v25;
                v105.size.width = v27;
                v105.size.height = v29;
                v118.origin.y = v86;
                v118.origin.x = v87;
                v118.size.height = range2_8;
                v118.size.width = v85;
                v106 = CGRectUnion(v105, v118);
                v86 = v106.origin.y;
                v87 = v106.origin.x;
                range2_8 = v106.size.height;
                v85 = v106.size.width;
              }
              if (v21 + 1 > v90.length + v90.location)
                ++v21;
              else
                v21 = v90.length + v90.location;
            }
            while (v21 < v20);
          }
          if ((*((_BYTE *)v12 + 25) & 0x10) != 0)
            TSWPLineFragment::rightMostCharIndex(v12);
          else
            TSWPLineFragment::leftMostCharIndex(v12);
          v52 = v82;
          if (!a4 || !*((_QWORD *)v12 + 22))
            goto LABEL_50;
          if (TSUIntersectionRangeWithEdge() != 0x7FFFFFFFFFFFFFFFLL)
          {
            TSWPLineFragment::labelRect(v12);
            v55 = v54;
            v57 = v56;
            v59 = v58;
            v61 = v60;
            v62 = *((_QWORD *)v12 + 22);
            v63 = *(const __CTLine **)(v62 + 16);
            if (v63)
            {
              FakeContext = (CGContext *)TSWPLineFragment::GetFakeContext(v53);
              ImageBounds = CTLineGetImageBounds(v63, FakeContext);
              v65 = ImageBounds.origin.y;
              v66 = ImageBounds.size.width;
              v67 = ImageBounds.size.height;
              v119.origin.x = TSWPLineFragment::labelTextPosition(v12) + ImageBounds.origin.x;
              v119.origin.y = v68 - v65 - v67;
              v108.origin.x = v55;
              v108.origin.y = v57;
              v108.size.width = v59;
              v108.size.height = v61;
              v119.size.width = v66;
              v119.size.height = v67;
              v109 = CGRectUnion(v108, v119);
              v55 = v109.origin.x;
              v57 = v109.origin.y;
              v59 = v109.size.width;
              v61 = v109.size.height;
            }
            v69 = *(void **)(v62 + 32);
            if (objc_msgSend(v69, "isEnabled", v78))
            {
              objc_msgSend(v69, "shadowBoundsForRect:", v55, v57, v59, v61);
              v55 = v70;
              v57 = v71;
              v59 = v72;
              v61 = v73;
            }
            v110.origin.y = v86;
            v110.origin.x = v87;
            v110.size.height = range2_8;
            v110.size.width = v85;
            v120.origin.x = v55;
            v120.origin.y = v57;
            v120.size.width = v59;
            v120.size.height = v61;
            v111 = CGRectUnion(v110, v120);
            v86 = v111.origin.y;
            v87 = v111.origin.x;
            range2_8 = v111.size.height;
            v85 = v111.size.width;
          }
        }
        v52 = v82;
LABEL_50:
        v11 = v52 + 2;
      }
      while (v11 != v81);
    }
    v112.origin.y = v86;
    v112.origin.x = v87;
    v112.size.height = range2_8;
    v112.size.width = v85;
    if (!CGRectIsNull(v112))
    {
      if (self)
        -[TSWPColumn transformFromWP](self, "transformFromWP");
      else
        memset(&v88, 0, sizeof(v88));
      v113.origin.y = v86;
      v113.origin.x = v87;
      v113.size.height = range2_8;
      v113.size.width = v85;
      v114 = CGRectApplyAffineTransform(v113, &v88);
      v86 = v114.origin.y;
      v87 = v114.origin.x;
      range2_8 = v114.size.height;
      v85 = v114.size.width;
    }
  }
  v75 = v86;
  v74 = v87;
  v77 = range2_8;
  v76 = v85;
  result.size.height = v77;
  result.size.width = v76;
  result.origin.y = v75;
  result.origin.x = v74;
  return result;
}

- (CGRect)glyphRectForRubyFieldAtCharIndex:(unint64_t)a3 glyphRange:(_NSRange)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  TSWPLineFragmentArray *ptr;
  TSWPLineFragment **v9;
  TSWPLineFragment **v10;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;
  CGRect result;

  v4 = *MEMORY[0x24BDBF070];
  v5 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF070] + 24);
  ptr = self->_lineFragmentArray.__ptr_;
  v9 = *(TSWPLineFragment ***)ptr;
  v10 = (TSWPLineFragment **)*((_QWORD *)ptr + 1);
  while (v9 != v10)
  {
    v11 = *(_QWORD *)*v9;
    v13 = a3 >= v11;
    v12 = a3 - v11;
    v13 = !v13 || v12 >= *((_QWORD *)*v9 + 1);
    if (!v13)
    {
      v4 = TSWPLineFragment::glyphRectForRubyField(*v9, a3, a4);
      break;
    }
    v9 += 2;
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (unint64_t)glyphCountForRubyFieldAtCharIndex:(unint64_t)a3
{
  TSWPLineFragmentArray *ptr;
  unint64_t **v4;
  unint64_t **v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  unint64_t i;

  ptr = self->_lineFragmentArray.__ptr_;
  v4 = *(unint64_t ***)ptr;
  v5 = (unint64_t **)*((_QWORD *)ptr + 1);
  while (v4 != v5)
  {
    v6 = *v4;
    v7 = **v4;
    v9 = a3 >= v7;
    v8 = a3 - v7;
    v9 = !v9 || v8 >= (*v4)[1];
    if (!v9)
    {
      for (i = v6[28]; i != v6[29]; i += 48)
      {
        if (*(_QWORD *)(i + 24) == a3)
          return CTLineGetGlyphCount(*(CTLineRef *)i);
      }
      return 0;
    }
    v4 += 2;
  }
  return 0;
}

- (CGRect)columnRectForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  TSWPLineFragmentArray *ptr;
  NSRange **v11;
  NSRange **v12;
  NSRange *v13;
  NSRange v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *__p[3];
  NSRange v28;
  NSRange v29;
  NSRange v30;
  CGRect v31;
  CGRect v32;
  CGRect result;
  CGRect v34;

  length = a3.length;
  location = a3.location;
  x = *MEMORY[0x24BDBF070];
  y = *(double *)(MEMORY[0x24BDBF070] + 8);
  width = *(double *)(MEMORY[0x24BDBF070] + 16);
  height = *(double *)(MEMORY[0x24BDBF070] + 24);
  v30 = *(NSRange *)&self->_startCharIndex;
  v28.location = location;
  v28.length = length;
  if (NSIntersectionRange(v28, v30).length)
  {
    ptr = self->_lineFragmentArray.__ptr_;
    v11 = *(NSRange ***)ptr;
    v12 = (NSRange **)*((_QWORD *)ptr + 1);
    while (v11 != v12)
    {
      v13 = *v11;
      v29.location = location;
      v29.length = length;
      v14 = NSIntersectionRange(v29, **v11);
      if (v14.length)
      {
        TSWPLineFragment::rectsForLineRange((TSWPLineFragment *)v13, v14, 0, 1, 1, 0, (double **)__p);
        TSWPUnionRects((CGRect **)__p);
        v16 = v15;
        v18 = v17;
        v20 = v19;
        v22 = v21;
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        v31.origin.x = x;
        v31.origin.y = y;
        v31.size.width = width;
        v31.size.height = height;
        v34.origin.x = v16;
        v34.origin.y = v18;
        v34.size.width = v20;
        v34.size.height = v22;
        v32 = CGRectUnion(v31, v34);
        x = v32.origin.x;
        y = v32.origin.y;
        width = v32.size.width;
        height = v32.size.height;
      }
      v11 += 2;
    }
  }
  v23 = self->_frameBounds.origin.x;
  v24 = self->_frameBounds.size.width;
  v25 = y;
  v26 = height;
  result.size.height = v26;
  result.size.width = v24;
  result.origin.y = v25;
  result.origin.x = v23;
  return result;
}

- (double)topOfLineAtCharIndex:(unint64_t)a3
{
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  unint64_t v9;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  TSWPLineFragment *Object;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *__p[3];
  _NSRange v24;
  CGRect v25;

  v5 = *MEMORY[0x24BDBF090];
  v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v9 = -[TSWPColumn range](self, "range");
  if (a3 < v9 || a3 - v9 >= v10)
  {
    if (v9 + v10 == a3)
    {
      Object = (TSWPLineFragment *)TSWPLineFragmentArray::lastObject(self->_lineFragmentArray.__ptr_);
      if (Object)
      {
        v24.location = a3;
        v24.length = 0;
        TSWPLineFragment::rectsForLineRange(Object, v24, 0, 1, 1, 0, (double **)__p);
        TSWPUnionRects((CGRect **)__p);
        v5 = v16;
        v6 = v17;
        v7 = v18;
        v8 = v19;
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
      }
      else
      {
        v20 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v21 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPColumn topOfLineAtCharIndex:]");
        objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 1448, CFSTR("should have a line fragment, even in an empty column"));
      }
    }
  }
  else
  {
    -[TSWPColumn columnRectForRange:](self, "columnRectForRange:", a3, 1);
    v5 = v11;
    v6 = v12;
    v7 = v13;
    v8 = v14;
  }
  v25.origin.x = v5;
  v25.origin.y = v6;
  v25.size.width = v7;
  v25.size.height = v8;
  return CGRectGetMinY(v25);
}

- (CGRect)typographicBounds
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  TSWPLineFragmentArray *ptr;
  TSWPLineFragment **v8;
  TSWPLineFragment **v9;
  TSWPLineFragment *v10;
  double x;
  double v12;
  CGFloat y;
  double v14;
  CGFloat width;
  double v16;
  CGFloat height;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGAffineTransform v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v29;
  CGRect v30;

  v3 = *MEMORY[0x24BDBF070];
  v4 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF070] + 24);
  ptr = self->_lineFragmentArray.__ptr_;
  v8 = *(TSWPLineFragment ***)ptr;
  v9 = (TSWPLineFragment **)*((_QWORD *)ptr + 1);
  if (*(TSWPLineFragment ***)ptr == v9)
    goto LABEL_6;
  do
  {
    v10 = *v8;
    x = TSWPLineFragment::textRect(*v8, 0);
    y = v12;
    width = v14;
    height = v16;
    if (*((_QWORD *)v10 + 22))
    {
      TSWPLineFragment::labelRect(v10);
      v29.origin.x = v18;
      v29.origin.y = v19;
      v29.size.width = v20;
      v29.size.height = v21;
      v23.origin.x = x;
      v23.origin.y = y;
      v23.size.width = width;
      v23.size.height = height;
      v24 = CGRectUnion(v23, v29);
      x = v24.origin.x;
      y = v24.origin.y;
      width = v24.size.width;
      height = v24.size.height;
    }
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    v30.origin.x = v3;
    v30.origin.y = v4;
    v30.size.width = v5;
    v30.size.height = v6;
    v26 = CGRectUnion(v25, v30);
    v3 = v26.origin.x;
    v4 = v26.origin.y;
    v5 = v26.size.width;
    v6 = v26.size.height;
    v8 += 2;
  }
  while (v8 != v9);
  if (self)
LABEL_6:
    -[TSWPColumn transformFromWP](self, "transformFromWP");
  else
    memset(&v22, 0, sizeof(v22));
  v27.origin.x = v3;
  v27.origin.y = v4;
  v27.size.width = v5;
  v27.size.height = v6;
  return CGRectApplyAffineTransform(v27, &v22);
}

- (CGRect)typographicBoundsForCell
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  TSWPLineFragmentArray *ptr;
  TSWPLineFragment **v8;
  TSWPLineFragment **v9;
  TSWPLineFragment *v10;
  double x;
  double v12;
  CGFloat y;
  double v14;
  CGFloat width;
  double v16;
  CGFloat height;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGAffineTransform v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v29;
  CGRect v30;

  v3 = *MEMORY[0x24BDBF070];
  v4 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF070] + 24);
  ptr = self->_lineFragmentArray.__ptr_;
  v8 = *(TSWPLineFragment ***)ptr;
  v9 = (TSWPLineFragment **)*((_QWORD *)ptr + 1);
  if (*(TSWPLineFragment ***)ptr == v9)
    goto LABEL_6;
  do
  {
    v10 = *v8;
    x = TSWPLineFragment::textRect(*v8, 0);
    y = v12;
    width = v14;
    height = v16;
    if (*((_QWORD *)v10 + 22))
    {
      TSWPLineFragment::labelRect(v10);
      v29.origin.x = v18;
      v29.origin.y = v19;
      v29.size.width = v20;
      v29.size.height = v21;
      v23.origin.x = x;
      v23.origin.y = y;
      v23.size.width = width;
      v23.size.height = height;
      v24 = CGRectUnion(v23, v29);
      x = v24.origin.x;
      y = v24.origin.y;
      width = v24.size.width;
      height = v24.size.height;
    }
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    v30.origin.x = v3;
    v30.origin.y = v4;
    v30.size.width = v5;
    v30.size.height = v6;
    v26 = CGRectUnion(v25, v30);
    v3 = v26.origin.x;
    v4 = v26.origin.y;
    v5 = v26.size.width;
    v6 = v26.size.height;
    v8 += 2;
  }
  while (v8 != v9);
  if (self)
LABEL_6:
    -[TSWPColumn transformFromWP](self, "transformFromWP");
  else
    memset(&v22, 0, sizeof(v22));
  v27.origin.x = v3;
  v27.origin.y = v4;
  v27.size.width = v5;
  v27.size.height = v6;
  return CGRectApplyAffineTransform(v27, &v22);
}

- (id)lineSelectionsForSelection:(id)a3
{
  void *v5;
  NSUInteger startCharIndex;
  NSUInteger characterCount;
  NSRange v8;
  TSWPLineFragmentArray *ptr;
  NSRange **v10;
  NSRange **v11;
  NSUInteger v12;
  NSUInteger location;
  NSUInteger length;
  TSWPSelection *v17;
  TSWPSelection *v18;
  NSRange v19;
  TSWPSelection *v20;
  BOOL v21;
  TSWPSelection *v23;
  NSRange v24;
  TSWPSelection *v25;
  NSRange v27;
  NSRange v28;
  NSRange v29;
  NSRange v30;

  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
  startCharIndex = self->_startCharIndex;
  characterCount = self->_characterCount;
  v27.location = objc_msgSend(a3, "range");
  v28.location = startCharIndex;
  v28.length = characterCount;
  v8 = NSIntersectionRange(v27, v28);
  if (v8.length)
  {
    ptr = self->_lineFragmentArray.__ptr_;
    v10 = *(NSRange ***)ptr;
    v11 = (NSRange **)*((_QWORD *)ptr + 1);
    if (*(NSRange ***)ptr != v11)
    {
      v12 = v8.length + v8.location - 1;
      while (1)
      {
        while (1)
        {
          location = (*v10)->location;
          length = (*v10)->length;
          if (v8.location < location || v8.location - location >= length)
            break;
          v18 = [TSWPSelection alloc];
          v29.location = location;
          v29.length = length;
          v19 = NSIntersectionRange(v8, v29);
          v20 = -[TSWPSelection initWithRange:](v18, "initWithRange:", v19.location, v19.length);
          objc_msgSend(v5, "addObject:", v20);

          v21 = v12 - location < length && v12 >= location;
          v10 += 2;
          if (v21 || v10 == v11)
            return v5;
        }
        if (v12 >= location && v12 - location < length)
          break;
        if (NSIntersectionRange(v8, **v10).length)
        {
          v17 = -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", location, length);
          objc_msgSend(v5, "addObject:", v17);

        }
        v10 += 2;
        if (v10 == v11)
          return v5;
      }
      v23 = [TSWPSelection alloc];
      v30.location = location;
      v30.length = length;
      v24 = NSIntersectionRange(v8, v30);
      v25 = -[TSWPSelection initWithRange:](v23, "initWithRange:", v24.location, v24.length);
      objc_msgSend(v5, "addObject:", v25);

    }
  }
  return v5;
}

- (CGRect)firstRectForSelection:(id)a3 includeSpaceAfter:(BOOL)a4 includeSpaceBefore:(BOOL)a5 includeLeading:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  CGRect result;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v11 = *MEMORY[0x24BDBF070];
  v12 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v13 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v14 = *(double *)(MEMORY[0x24BDBF070] + 24);
  v15 = objc_msgSend(a3, "range");
  LOWORD(v26) = 0;
  v17 = -[TSWPColumn pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:inranges:outranges:](self, "pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:inranges:outranges:", v15, v16, objc_msgSend(a3, "type"), v8, v7, v6, v26, 0, 0);
  if (objc_msgSend(v17, "count"))
  {
    objc_msgSend((id)objc_msgSend(v17, "firstObject"), "CGRectValue");
    v11 = v18;
    v12 = v19;
    v13 = v20;
    v14 = v21;
  }
  v22 = v11;
  v23 = v12;
  v24 = v13;
  v25 = v14;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (id)rectsForSelection:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((objc_msgSend(a3, "isValid") & 1) == 0)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPColumn rectsForSelection:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 1565, CFSTR("invalid text selection"));
  }
  v7 = objc_msgSend(a3, "range");
  return -[TSWPColumn rectsForSelectionRange:selectionType:](self, "rectsForSelectionRange:selectionType:", v7, v8, objc_msgSend(a3, "type"));
}

- (id)rectsForSelectionRange:(_NSRange)a3
{
  return -[TSWPColumn rectsForSelectionRange:selectionType:](self, "rectsForSelectionRange:selectionType:", a3.location, a3.length, 0);
}

- (const)pColumnEndingPartitionedLineFragmentInSelectionRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  const void *result;

  length = a3.length;
  location = a3.location;
  result = -[TSWPColumn countLines](self, "countLines");
  if (result)
  {
    result = -[TSWPColumn lineFragmentAtIndex:](self, "lineFragmentAtIndex:", (char *)result - 1);
    if ((*((_DWORD *)result + 6) & 0x101) == 1)
    {
      if (*(_QWORD *)result - location >= length || *(_QWORD *)result < location)
        return 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)pMutableRectsForSelectionRange:(_NSRange)a3 selectionType:(int)a4 includeSpaceAfter:(BOOL)a5 includeSpaceBefore:(BOOL)a6 includeLeading:(BOOL)a7 forParagraphMode:(BOOL)a8 includeRuby:(BOOL)a9 inranges:(id)a10 outranges:(id *)a11
{
  NSUInteger length;
  void *v13;
  double v14;
  NSRange v15;
  int v16;
  TSWPLineFragmentArray *ptr;
  NSUInteger **v18;
  NSArray **v19;
  double v20;
  NSUInteger *v21;
  CGFloat MaxY;
  double v23;
  NSRange v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  NSUInteger v30;
  NSRange v31;
  _NSRange v32;
  BOOL v33;
  BOOL v34;
  char *v35;
  char *v36;
  unint64_t v37;
  _BYTE *v38;
  _BYTE *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  double *v43;
  double *v44;
  unsigned int v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  _BYTE *v58;
  _BYTE *v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  double y;
  double height;
  BOOL v70;
  unint64_t v72;
  unint64_t j;
  unint64_t v74;
  _QWORD *v75;
  TSWPLineFragment *v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  uint64_t v84;
  double v85;
  uint64_t v86;
  uint64_t k;
  double v88;
  CGFloat v89;
  double v90;
  CGFloat v91;
  double v92;
  CGFloat v93;
  double v94;
  CGFloat v95;
  NSUInteger v97;
  TSWPColumn *v98;
  void *v99;
  NSUInteger v100;
  uint64_t v101;
  double v102;
  NSUInteger **v103;
  NSUInteger **v104;
  NSUInteger v105;
  NSUInteger v106;
  void *v108;
  NSUInteger v109;
  id obj;
  NSUInteger range1;
  _BOOL4 range1_12;
  _BOOL4 v113;
  CGAffineTransform v115;
  double *v116[3];
  uint64_t v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  void *__p;
  void *__dst;
  uint64_t v124;
  _BYTE v125[128];
  uint64_t v126;
  NSRange v127;
  NSRange v128;
  NSRange v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;

  range1_12 = a6;
  v113 = a5;
  length = a3.length;
  range1 = a3.location;
  v126 = *MEMORY[0x24BDAC8D0];
  v13 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
  if (a11)
  {
    v108 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
    *a11 = v108;
  }
  else
  {
    v108 = 0;
  }
  v127.location = range1;
  v97 = length;
  v127.length = length;
  v15 = NSIntersectionRange(v127, *(NSRange *)&self->_startCharIndex);
  if (v15.length)
  {
    obj = a10;
    if (a10)
    {
      v16 = a4;
      if (a4 == 7)
        v16 = 0;
      a4 = v16;
    }
    else
    {
      obj = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", range1, length));
    }
    ptr = self->_lineFragmentArray.__ptr_;
    v18 = *(NSUInteger ***)ptr;
    v103 = (NSUInteger **)*((_QWORD *)ptr + 1);
    if (*(NSUInteger ***)ptr != v103)
    {
      v101 = 0;
      v109 = length + range1 - 1;
      if (v108)
        v19 = (NSArray **)&v117;
      else
        v19 = 0;
      v99 = v13;
      v100 = v15.length + v15.location - 1;
      v20 = -1.0;
      v102 = 0.0;
      v98 = self;
      do
      {
        while (1)
        {
          v21 = *v18;
          v106 = **v18;
          v104 = v18;
          v105 = (*v18)[1];
          if (*((double *)*v18 + 4) + *((double *)*v18 + 5) != v20)
          {
            v101 = objc_msgSend(v13, "count");
            MaxY = CGRectGetMaxY(*(CGRect *)(v21 + 6));
            v20 = *((double *)v21 + 4) + *((double *)v21 + 5);
            v23 = MaxY - (v20 + *((double *)v21 + 17));
            if (*((double *)v21 + 19) < v23)
              v23 = *((double *)v21 + 19);
            v102 = fmax(v23, 0.0);
          }
          v128.length = v105;
          v128.location = v106;
          v24 = NSIntersectionRange(v15, v128);
          if (v24.length)
            break;
          v18 = v104 + 2;
          if (v104 + 2 == v103)
            goto LABEL_77;
        }
        if (a8)
        {
          objc_msgSend(v13, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", *((double *)v21 + 6), *((double *)v21 + 7), *((double *)v21 + 8), *((double *)v21 + 9)));
          if (v108)
            objc_msgSend(v108, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", *v21, v21[1]));
        }
        else
        {
          v25 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          __p = 0;
          __dst = 0;
          v124 = 0;
          v118 = 0u;
          v119 = 0u;
          v120 = 0u;
          v121 = 0u;
          v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v118, v125, 16);
          if (v26)
          {
            v27 = *(_QWORD *)v119;
            do
            {
              for (i = 0; i != v26; ++i)
              {
                if (*(_QWORD *)v119 != v27)
                  objc_enumerationMutation(obj);
                v29 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * i);
                v117 = 0;
                v129.location = objc_msgSend(v29, "rangeValue");
                v129.length = v30;
                v31 = NSIntersectionRange(v24, v129);
                v32.length = v31.length;
                if (v31.length)
                {
                  if (a4 != 7
                    || (range1 >= v31.location ? (v33 = range1 - v31.location >= v31.length) : (v33 = 1),
                        v33 && (v109 >= v31.location ? (v34 = v109 - v31.location >= v31.length) : (v34 = 1), v34)))
                  {
                    v32.location = v31.location;
                    TSWPLineFragment::rectsForLineRange((TSWPLineFragment *)v21, v32, v19, v113, range1_12, a9, v116);
                  }
                  else
                  {
                    v32.location = v31.location;
                    TSWPLineFragment::rectsForVisualRange((TSWPLineFragment *)v21, v32, range1, v109, v113, range1_12, a9, v116, v19);
                  }
                  v35 = (char *)v116[0];
                  v36 = (char *)v116[1];
                  objc_msgSend(v25, "addObjectsFromArray:", v117);
                  std::vector<CGRect>::__insert_with_size[abi:ne180100]<std::__wrap_iter<CGRect*>,std::__wrap_iter<CGRect*>>((uint64_t)&__p, (uint64_t)__dst, v35, v36, (v36 - v35) >> 5);
                  if (v35)
                    operator delete(v35);
                }
              }
              v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v118, v125, 16);
            }
            while (v26);
          }
          v13 = v99;
          v37 = objc_msgSend(v99, "count");
          if (v108)
          {
            v39 = __p;
            v38 = __dst;
            if (objc_msgSend(v25, "count") != (v38 - v39) >> 5)
            {
              v40 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
              v41 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPColumn pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:inranges:outranges:]");
              v42 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm");
              objc_msgSend(v40, "handleFailureInFunction:file:lineNumber:description:", v41, v42, 1689, CFSTR("Mismatch between rect & range count: %lu vs. %lu"), v37, ((_BYTE *)__dst - (_BYTE *)__p) >> 5);
            }
          }
          v43 = (double *)__p;
          v44 = (double *)__dst;
          if (__p != __dst)
          {
            v45 = 0;
            do
            {
              v46 = *v43;
              v47 = v43[1];
              v49 = v43[2];
              v48 = v43[3];
              if (a7)
              {
                v50 = *((double *)v21 + 4);
                v51 = *((double *)v21 + 5);
                v52 = *((double *)v21 + 17);
                v53 = *((double *)v21 + 19);
                v54 = *v43;
                v55 = *((_QWORD *)v43 + 1);
                v56 = *((_QWORD *)v43 + 2);
                v57 = CGRectGetMaxY(*(CGRect *)(&v48 - 3));
                if (v57 < v50 + v51 + v52 + v53)
                  v57 = v50 + v51 + v52 + v53;
                v48 = v57 - v47;
              }
              objc_msgSend(v99, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v46, v47, v49, v48));
              if (v108)
              {
                v59 = __p;
                v58 = __dst;
                if (objc_msgSend(v25, "count") == (v58 - v59) >> 5)
                  objc_msgSend(v108, "addObject:", objc_msgSend(v25, "objectAtIndexedSubscript:", v45++));
              }
              v43 += 4;
            }
            while (v43 != v44);
          }
          if (a4 == 2)
          {
            TSWPLineFragment::labelRect((TSWPLineFragment *)v21);
            self = v98;
            v61 = v60;
            v63 = v62;
            v65 = v64;
            v67 = v66;
          }
          else
          {
            v61 = *MEMORY[0x24BDBF070];
            v63 = *(double *)(MEMORY[0x24BDBF070] + 8);
            v65 = *(double *)(MEMORY[0x24BDBF070] + 16);
            v67 = *(double *)(MEMORY[0x24BDBF070] + 24);
            self = v98;
          }
          v130.origin.x = v61;
          v130.origin.y = v63;
          v130.size.width = v65;
          v130.size.height = v67;
          if (!CGRectIsEmpty(v130) && v37 < objc_msgSend(v99, "count"))
          {
            objc_msgSend((id)objc_msgSend(v99, "objectAtIndexedSubscript:", v37), "CGRectValue");
            y = v131.origin.y;
            height = v131.size.height;
            v135.origin.x = v61;
            v135.origin.y = v63;
            v135.size.width = v65;
            v135.size.height = v67;
            v132 = CGRectUnion(v131, v135);
            objc_msgSend(v99, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v132.origin.x, y, v132.size.width, height), v37);
          }
          if (__p)
          {
            __dst = __p;
            operator delete(__p);
          }
        }
        v70 = v100 - v106 < v105 && v100 >= v106;
        v18 = v104 + 2;
      }
      while (!v70 && v18 != v103);
LABEL_77:
      v14 = v102;
      if (v102 > 0.0 && v113)
      {
        v72 = objc_msgSend(v13, "count", v102);
        for (j = v101; j < v72; j = v74 + 1)
        {
          v74 = j;
          objc_msgSend((id)objc_msgSend(v13, "objectAtIndexedSubscript:"), "CGRectValue");
          objc_msgSend(v13, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:"), v74);
          v72 = objc_msgSend(v13, "count");
        }
      }
    }
  }
  v75 = -[TSWPColumn pColumnEndingPartitionedLineFragmentInSelectionRange:](self, "pColumnEndingPartitionedLineFragmentInSelectionRange:", range1, v97, v14);
  v76 = (TSWPLineFragment *)v75;
  if (v75)
  {
    v77 = *((double *)v75 + 7);
    v78 = *((double *)v75 + 9);
    if (a8)
    {
      v79 = *((double *)v75 + 6);
      v80 = *((double *)v75 + 8);
    }
    else
    {
      v81 = v113
          ? *((double *)v75 + 9)
          : *((double *)v75 + 17) + *((double *)v75 + 16) + *((double *)v75 + 14) + *((double *)v75 + 18);
      v82 = range1_12 ? -0.0 : *((double *)v75 + 14);
      v83 = range1_12 ? 0.0 : *((double *)v75 + 14);
      v84 = *v75;
      v79 = TSWPLineFragment::wpOffsetForCharIndex((TSWPLineFragment *)v75, *v75, 1, 1, 0);
      v85 = TSWPLineFragment::wpOffsetForCharIndex(v76, v84 + 1, 1, 1, 0);
      v77 = v77 + v82;
      v78 = v81 - v83;
      v80 = v85 - v79;
    }
    objc_msgSend(v13, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v79, v77, v80, v78));
    if (v108)
      objc_msgSend(v108, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", *(_QWORD *)v76, *((_QWORD *)v76 + 1)));
  }
  if (-[TSWPColumn textIsVertical](self, "textIsVertical"))
  {
    v86 = objc_msgSend(v13, "count");
    if (v86)
    {
      for (k = 0; k != v86; ++k)
      {
        objc_msgSend((id)objc_msgSend(v13, "objectAtIndexedSubscript:", k), "CGRectValue");
        v89 = v88;
        v91 = v90;
        v93 = v92;
        v95 = v94;
        if (self)
          -[TSWPColumn transformFromWP](self, "transformFromWP");
        else
          memset(&v115, 0, sizeof(v115));
        v133.origin.x = v89;
        v133.origin.y = v91;
        v133.size.width = v93;
        v133.size.height = v95;
        v134 = CGRectApplyAffineTransform(v133, &v115);
        objc_msgSend(v13, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v134.origin.x, v134.origin.y, v134.size.width, v134.size.height), k);
      }
    }
  }
  return v13;
}

- (id)rectsForSelectionRanges:(id)a3 selectionType:(int)a4
{
  uint64_t *v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t location;
  NSUInteger length;
  NSRange v17;
  NSRange v19;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  NSRange v29;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = (uint64_t *)MEMORY[0x24BEB3BF0];
  v7 = *MEMORY[0x24BEB3BF0];
  v8 = *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(a3);
        v14 = *v6;
        v13 = v6[1];
        location = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v12), "rangeValue");
        v17.location = location;
        v17.length = length;
        if (v7 != v14 || v8 != v13)
        {
          v29.location = v7;
          v29.length = v8;
          v19 = NSUnionRange(v29, v17);
          length = v19.length;
          location = v19.location;
        }
        v7 = location;
        v8 = length;
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }
  LOWORD(v21) = 0;
  return -[TSWPColumn pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:inranges:outranges:](self, "pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:inranges:outranges:", v7, v8, a4, 1, 1, 0, v21, a3, 0);
}

- (id)rectsForSelectionRange:(_NSRange)a3 selectionType:(int)a4
{
  return -[TSWPColumn rectsForSelectionRange:selectionType:forParagraphMode:](self, "rectsForSelectionRange:selectionType:forParagraphMode:", a3.location, a3.length, *(_QWORD *)&a4, 0);
}

- (id)rectsForSelectionRange:(_NSRange)a3 selectionType:(int)a4 forParagraphMode:(BOOL)a5
{
  uint64_t v6;

  LOWORD(v6) = a5;
  return -[TSWPColumn pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:inranges:outranges:](self, "pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:inranges:outranges:", a3.location, a3.length, *(_QWORD *)&a4, 1, 1, 0, v6, 0, 0);
}

- (id)rectsForSelectionRange:(_NSRange)a3 selectionType:(int)a4 forParagraphMode:(BOOL)a5 includeRuby:(BOOL)a6
{
  uint64_t v7;

  BYTE1(v7) = a6;
  LOBYTE(v7) = a5;
  return -[TSWPColumn pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:inranges:outranges:](self, "pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:inranges:outranges:", a3.location, a3.length, *(_QWORD *)&a4, 1, 1, 0, v7, 0, 0);
}

- (id)rectsForSelectionRange:(_NSRange)a3 selectionType:(int)a4 includeSpaceAfter:(BOOL)a5 includeSpaceBefore:(BOOL)a6 includeLeading:(BOOL)a7 forParagraphMode:(BOOL)a8 includeRuby:(BOOL)a9
{
  uint64_t v10;

  LOWORD(v10) = __PAIR16__(a9, a8);
  return -[TSWPColumn pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:inranges:outranges:](self, "pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:inranges:outranges:", a3.location, a3.length, *(_QWORD *)&a4, a5, a6, a7, v10, 0, 0);
}

- (id)rectsForSelection:(id)a3 ranges:(id *)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v7 = objc_msgSend(a3, "range");
  LOWORD(v10) = 0;
  return -[TSWPColumn pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:inranges:outranges:](self, "pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:inranges:outranges:", v7, v8, objc_msgSend(a3, "type"), 1, 1, 0, v10, 0, a4);
}

- (CGRect)erasableRectForSelectionRange:(_NSRange)a3
{
  NSUInteger location;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  NSRange v9;
  TSWPLineFragmentArray *ptr;
  NSRange **v11;
  NSRange **v12;
  NSRange *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  NSRange v18;
  NSRange v19;
  CGRect v20;
  CGRect result;
  CGRect v22;

  v18.length = a3.length;
  location = a3.location;
  x = *MEMORY[0x24BDBF070];
  y = *(double *)(MEMORY[0x24BDBF070] + 8);
  width = *(double *)(MEMORY[0x24BDBF070] + 16);
  height = *(double *)(MEMORY[0x24BDBF070] + 24);
  v19 = *(NSRange *)&self->_startCharIndex;
  v18.location = location;
  v9 = NSIntersectionRange(v18, v19);
  if (v9.length)
  {
    ptr = self->_lineFragmentArray.__ptr_;
    v11 = *(NSRange ***)ptr;
    v12 = (NSRange **)*((_QWORD *)ptr + 1);
    if (*(NSRange ***)ptr != v12)
    {
      do
      {
        v13 = *v11;
        if (NSIntersectionRange(v9, **v11).length)
        {
          v22.origin.x = x;
          v22.origin.y = y;
          v22.size.width = width;
          v22.size.height = height;
          v20 = CGRectUnion(*(CGRect *)&v13[5].location, v22);
          x = v20.origin.x;
          y = v20.origin.y;
          width = v20.size.width;
          height = v20.size.height;
        }
        v11 += 2;
      }
      while (v11 != v12);
    }
  }
  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)drawableIntersectionRectsForSelection:(id)a3 inTarget:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double MinX;
  double v23;
  unint64_t v24;
  CGFloat x;
  CGFloat v26;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  unint64_t v30;
  double MaxX;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  double MinY;
  double v49;
  uint64_t v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double MaxY;
  double v57;
  double rect;
  double recta;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  v7 = objc_msgSend(a3, "range");
  LOWORD(v51) = 0;
  v9 = -[TSWPColumn pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:inranges:outranges:](self, "pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:inranges:outranges:", v7, v8, objc_msgSend(a3, "type"), 1, 1, 0, v51, 0, 0);
  v10 = objc_msgSend(v9, "count");
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = 1;
    do
    {
      objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", v12), "CGRectValue");
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      if (v12 || objc_msgSend(a3, "start") < self->_startCharIndex)
      {
        v60.origin.x = v15;
        v60.origin.y = v17;
        v60.size.width = v19;
        v60.size.height = v21;
        MinX = CGRectGetMinX(v60);
        v23 = MinX - CGRectGetMinX(self->_frameBounds);
        v15 = v15 - v23;
        v19 = v19 + v23;
      }
      v24 = v12 + 1;
      if (v12 + 1 < v11)
      {
        while (1)
        {
          objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", v12 + 1), "CGRectValue");
          x = v61.origin.x;
          v26 = v21;
          y = v61.origin.y;
          width = v61.size.width;
          height = v61.size.height;
          rect = CGRectGetMinY(v61);
          v62.origin.x = v15;
          v62.origin.y = v17;
          v62.size.width = v19;
          v62.size.height = v26;
          if (rect != CGRectGetMinY(v62))
            break;
          v63.origin.x = v15;
          v63.origin.y = v17;
          v63.size.width = v19;
          v63.size.height = v26;
          v71.origin.x = x;
          v71.origin.y = y;
          v71.size.width = width;
          v71.size.height = height;
          v64 = CGRectUnion(v63, v71);
          v15 = v64.origin.x;
          v17 = v64.origin.y;
          v19 = v64.size.width;
          v21 = v64.size.height;
          objc_msgSend(v9, "removeObjectAtIndex:", v12 + 1);
          if (v24 >= --v11)
          {
            v11 = v13;
            goto LABEL_11;
          }
        }
        v21 = v26;
      }
LABEL_11:
      if (v12 != v11 - 1 || (v30 = self->_characterCount + self->_startCharIndex, v30 <= objc_msgSend(a3, "end")))
      {
        MaxX = CGRectGetMaxX(self->_frameBounds);
        v65.origin.x = v15;
        v65.origin.y = v17;
        v65.size.width = v19;
        v65.size.height = v21;
        v19 = v19 + MaxX - CGRectGetMaxX(v65);
      }
      objc_msgSend(a4, "rectInRoot:", v15, v17, v19, v21);
      objc_msgSend(v9, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:"), v12);
      ++v13;
      ++v12;
    }
    while (v24 < v11);
  }
  if ((unint64_t)objc_msgSend(v9, "count") > 1)
  {
    objc_msgSend((id)objc_msgSend(v9, "firstObject"), "CGRectValue");
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v39 = v38;
    objc_msgSend((id)objc_msgSend(v9, "lastObject"), "CGRectValue");
    v54 = v41;
    v55 = v40;
    v53 = v42;
    recta = v43;
    objc_msgSend(a4, "rectInRoot:", self->_frameBounds.origin.x, self->_frameBounds.origin.y, self->_frameBounds.size.width, self->_frameBounds.size.height);
    v44 = v66.origin.x;
    v45 = v66.origin.y;
    v46 = v66.size.width;
    v47 = v66.size.height;
    v57 = CGRectGetMinX(v66);
    v67.origin.x = v33;
    v67.origin.y = v35;
    v67.size.width = v37;
    v67.size.height = v39;
    MaxY = CGRectGetMaxY(v67);
    v68.origin.x = v44;
    v68.origin.y = v45;
    v68.size.width = v46;
    v68.size.height = v47;
    v52 = CGRectGetWidth(v68);
    v69.origin.x = v55;
    v69.origin.y = v54;
    v69.size.width = v53;
    v69.size.height = recta;
    MinY = CGRectGetMinY(v69);
    v70.origin.x = v33;
    v70.origin.y = v35;
    v70.size.width = v37;
    v70.size.height = v39;
    v49 = MinY - CGRectGetMaxY(v70);
    objc_msgSend(v9, "removeAllObjects");
    objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v33, v35, v37, v39));
    objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v57, MaxY, v52, v49));
    objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v55, v54, v53, recta));
  }
  return v9;
}

- (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 pastCenterGoesToNextChar:(BOOL)a5 allowNotFound:(BOOL)a6 isAtEndOfLine:(BOOL *)a7 leadingEdge:(BOOL *)a8
{
  return -[TSWPColumn charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:isAtEndOfLine:outFragment:leadingEdge:](self, "charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:isAtEndOfLine:outFragment:leadingEdge:", a4, a5, a6, a7, 0, a8, a3.x, a3.y);
}

- (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 pastCenterGoesToNextChar:(BOOL)a5 allowNotFound:(BOOL)a6 isAtEndOfLine:(BOOL *)a7 outFragment:(const TSWPLineFragment *)a8 leadingEdge:(BOOL *)a9
{
  _BOOL8 v12;
  _BOOL8 v13;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  int v28;
  int v30;
  TSWPLineFragment *v31;
  uint64_t v32;
  void **p_storage;
  uint64_t v34;
  CGFloat y;
  CGFloat x;
  TSWPLineFragment *v37;
  float64x2_t v38;
  float64x2_t v39;
  float64x2_t v40;
  BOOL v41;

  v12 = a6;
  v13 = a5;
  v41 = 1;
  if (self)
  {
    y = a3.y;
    x = a3.x;
    -[TSWPColumn transformToWP](self, "transformToWP");
    a3.y = y;
    a3.x = x;
    v17 = v38;
    v16 = v39;
    v18 = v40;
  }
  else
  {
    v18 = 0uLL;
    v39 = 0u;
    v40 = 0u;
    v38 = 0u;
    v17 = 0uLL;
    v16 = 0uLL;
  }
  v19 = vaddq_f64(v18, vmlaq_n_f64(vmulq_n_f64(v16, a3.y), v17, a3.x));
  v37 = 0;
  if (a7)
    *a7 = 0;
  v20 = -[TSWPColumn charIndexFromWPPoint:pastCenterGoesToNextChar:allowNotFound:outFragment:leadingEdge:](self, "charIndexFromWPPoint:pastCenterGoesToNextChar:allowNotFound:outFragment:leadingEdge:", v13, v12, &v37, &v41, *(_OWORD *)&v19);
  v21 = v20;
  if (v37 && v20 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v22 = *((_QWORD *)v37 + 1);
    if (v41)
      v23 = v20;
    else
      v23 = v20 + 1;
    if (v22 && v23 == v22 + *(_QWORD *)v37)
    {
      v24 = v23 - 1;
      v25 = -[TSWPStorage characterAtIndex:](self->_storage, "characterAtIndex:", v23 - 1);
      v26 = v25;
      v27 = IsParagraphBreakingCharacter(v25);
      if (v26 == 8232)
        v28 = 1;
      else
        v28 = v27;
      if (v28 != 1 || a4)
      {
        if (a7)
          *a7 = 1;
      }
      else
      {
        v41 = 1;
        v21 = v24;
      }
    }
    if (a8)
      *a8 = v37;
  }
  if (a9)
  {
    *a9 = v41;
    return v21;
  }
  if (!v41 && v21 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!v37)
    {
      p_storage = (void **)&self->_storage;
      goto LABEL_37;
    }
    v30 = TSWPLineFragment::writingDirectionForCharIndex(v37, v21);
    v31 = v37;
    if (a4
      || ((*((_BYTE *)v37 + 25) & 0x10) != 0
        ? (v32 = TSWPLineFragment::rightMostCharIndex(v37))
        : (v32 = TSWPLineFragment::leftMostCharIndex(v37)),
          (v34 = v32, v31 = v37, v21 != v34) || (v30 != 1) != (*((_BYTE *)v37 + 25) & 0x10) >> 4))
    {
      p_storage = (void **)((char *)v31 + 184);
LABEL_37:
      if (*p_storage)
        return TSWPNextCharFromTextSource(v21, *p_storage);
    }
  }
  return v21;
}

- (unint64_t)charIndexForSelectionFromPoint:(CGPoint)a3 isTail:(BOOL)a4
{
  _BOOL4 v4;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  unint64_t result;
  void *v10;
  uint64_t v11;
  TSWPLineFragmentArray *ptr;
  unint64_t **v13;
  unint64_t **v14;
  unint64_t v15;
  unint64_t *p_startCharIndex;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  int v21;
  double v22;
  double v23;
  unint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t **v27;
  double MinY;
  CGFloat v29;
  unint64_t **v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  int v40;
  double v41;
  double v42;
  unint64_t v43;
  unint64_t v44;
  BOOL v45;
  unint64_t v46;
  int v48;
  unint64_t *p_characterCount;
  CGFloat y;
  CGFloat x;
  float64x2_t v52;
  float64x2_t v53;
  float64x2_t v54;
  float64x2_t v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  v4 = a4;
  if (self)
  {
    y = a3.y;
    x = a3.x;
    -[TSWPColumn transformToWP](self, "transformToWP");
    a3.y = y;
    a3.x = x;
    v7 = v53;
    v6 = v54;
    v8 = v55;
  }
  else
  {
    v8 = 0uLL;
    v7 = 0uLL;
    v6 = 0uLL;
  }
  v52 = vaddq_f64(v8, vmlaq_n_f64(vmulq_n_f64(v6, a3.y), v7, a3.x));
  if (v52.f64[1] < CGRectGetMinY(self->_frameBounds))
  {
    result = self->_startCharIndex;
    if (result == 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPColumn charIndexForSelectionFromPoint:isTail:]");
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 2023, CFSTR("column has unexpected start"));
      goto LABEL_54;
    }
    return result;
  }
  ptr = self->_lineFragmentArray.__ptr_;
  v14 = *(unint64_t ***)ptr;
  v13 = (unint64_t **)*((_QWORD *)ptr + 1);
  if (*(unint64_t ***)ptr == v13)
    goto LABEL_54;
  v15 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    p_startCharIndex = *v14;
    v18 = *((double *)*v14 + 6);
    v17 = *((double *)*v14 + 7);
    v20 = *((double *)*v14 + 8);
    v19 = *((double *)*v14 + 9);
    if ((*((_BYTE *)*v14 + 27) & 2) != 0)
    {
      v21 = -[TSWPStorage isWritingDirectionRightToLeftForParagraphAtCharIndex:](self->_storage, "isWritingDirectionRightToLeftForParagraphAtCharIndex:", *p_startCharIndex) ^ v4 ^ 1;
      TSDDistanceToRect(v52.f64[0], v52.f64[1], v18, v17, v20, v19);
      v23 = v22;
      v15 = TSWPLineFragment::charIndexForWPOffsetWithDirection((TSWPLineFragment *)p_startCharIndex, v21, 0, v52.f64[0]);
      if (v23 == 0.0)
        goto LABEL_51;
      v24 = v14[2];
      v14 += 2;
      p_startCharIndex = v24;
      v18 = *((double *)v24 + 6);
      v17 = *((double *)v24 + 7);
      v20 = *((double *)v24 + 8);
      v19 = *((double *)v24 + 9);
    }
    v25 = 16;
    while (1)
    {
      v26 = v25;
      v27 = (unint64_t **)((char *)v14 + v25);
      if (v27 == v13)
        break;
      MinY = CGRectGetMinY(*(CGRect *)(*v27 + 6));
      v56.origin.x = v18;
      v56.origin.y = v17;
      v56.size.width = v20;
      v56.size.height = v19;
      v29 = CGRectGetMinY(v56);
      v25 = v26 + 16;
      if (MinY != v29)
      {
        v30 = (unint64_t **)((char *)v14 + v26);
        goto LABEL_17;
      }
    }
    v30 = v13;
LABEL_17:
    v57.origin.x = v18;
    v57.origin.y = v17;
    v57.size.width = v20;
    v57.size.height = v19;
    if (v52.f64[1] < CGRectGetMinY(v57))
      goto LABEL_51;
    v58.origin.x = v18;
    v58.origin.y = v17;
    v58.size.width = v20;
    v58.size.height = v19;
    if (v52.f64[1] <= CGRectGetMaxY(v58))
      break;
    v31 = p_startCharIndex[1];
    v32 = v31 + *p_startCharIndex;
    if (v15 <= v32)
      v33 = v31 + *p_startCharIndex;
    else
      v33 = v15;
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
      v15 = v32;
    else
      v15 = v33;
    if (v4)
      v15 = -[TSWPStorage previousCharacterIndex:](self->_storage, "previousCharacterIndex:", v15);
    v14 += 2;
    if (v14 == v13)
      goto LABEL_51;
  }
  v34 = 0x7FFFFFFFFFFFFFFFLL;
  if (v14 == v30)
    goto LABEL_50;
  v35 = INFINITY;
  while (1)
  {
    p_startCharIndex = *v14;
    if (((*v14)[3] & 0x40) == 0 && ((*v14)[3] & 0x201) != 1)
      break;
    v44 = v34;
LABEL_47:
    v14 += 2;
    v34 = v44;
    v26 -= 16;
    if (!v26)
      goto LABEL_50;
  }
  v37 = *((double *)p_startCharIndex + 8);
  v36 = *((double *)p_startCharIndex + 9);
  v39 = *((double *)p_startCharIndex + 6);
  v38 = *((double *)p_startCharIndex + 7);
  v40 = -[TSWPStorage isWritingDirectionRightToLeftForParagraphAtCharIndex:](self->_storage, "isWritingDirectionRightToLeftForParagraphAtCharIndex:", *p_startCharIndex);
  TSDDistanceToRect(v52.f64[0], v52.f64[1], v39, v38, v37, v36);
  v42 = v41;
  v43 = TSWPLineFragment::charIndexForWPOffsetWithDirection((TSWPLineFragment *)p_startCharIndex, v40 ^ v4 ^ 1u, 0, v52.f64[0]);
  v44 = v43;
  if (v42 != 0.0)
  {
    v45 = v42 < v35;
    if (v42 >= v35)
    {
      v46 = v34;
    }
    else
    {
      v35 = v42;
      v46 = v43;
    }
    if (!v45 || !v4)
    {
      v15 = 0x7FFFFFFFFFFFFFFFLL;
      v44 = v46;
    }
    else
    {
      v59.origin.x = v39;
      v59.origin.y = v38;
      v59.size.width = v37;
      v59.size.height = v36;
      v48 = v52.f64[0] <= CGRectGetMaxX(v59);
      if (v40 != v48)
        v44 = -[TSWPStorage previousCharacterIndex:](self->_storage, "previousCharacterIndex:", *p_startCharIndex);
      v15 = 0x7FFFFFFFFFFFFFFFLL;
      v35 = v42;
    }
    goto LABEL_47;
  }
  v15 = v43;
LABEL_50:
  result = v15;
  v15 = v34;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_51:
    result = v15;
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (p_startCharIndex)
      {
        p_characterCount = p_startCharIndex + 1;
        return *p_characterCount + *p_startCharIndex;
      }
LABEL_54:
      p_startCharIndex = &self->_startCharIndex;
      p_characterCount = &self->_characterCount;
      return *p_characterCount + *p_startCharIndex;
    }
  }
  return result;
}

- (unint64_t)charIndexFromWPPoint:(CGPoint)a3 pastCenterGoesToNextChar:(BOOL)a4 allowNotFound:(BOOL)a5 outFragment:(const TSWPLineFragment *)a6 leadingEdge:(BOOL *)a7
{
  _BOOL4 v9;
  _BOOL4 v10;
  double y;
  double x;
  uint64_t v14;
  unint64_t startCharIndex;
  TSWPLineFragmentArray *ptr;
  uint64_t v17;
  TSWPLineFragment **v18;
  uint64_t v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double MinY;
  int v25;
  double v26;
  TSWPLineFragment **v27;
  TSWPLineFragment *v28;
  double v29;
  CGFloat *v30;
  double v31;
  unint64_t v32;
  unint64_t *p_characterCount;
  unint64_t *p_startCharIndex;
  const TSWPLineFragment **v36;
  BOOL *v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v9 = a5;
  v10 = a4;
  y = a3.y;
  x = a3.x;
  if (a3.y < CGRectGetMinY(self->_frameBounds))
  {
    if (v9)
    {
      v14 = 0;
      startCharIndex = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_37;
    }
    startCharIndex = self->_startCharIndex;
    if (TSWPLineFragmentArray::count(self->_lineFragmentArray.__ptr_))
    {
      v14 = TSWPLineFragmentArray::objectAtIndex(self->_lineFragmentArray.__ptr_, 0);
      goto LABEL_37;
    }
    goto LABEL_24;
  }
  ptr = self->_lineFragmentArray.__ptr_;
  v17 = *(_QWORD *)ptr;
  v18 = (TSWPLineFragment **)*((_QWORD *)ptr + 1);
  startCharIndex = 0x7FFFFFFFFFFFFFFFLL;
  if (*(TSWPLineFragment ***)ptr == v18)
  {
LABEL_24:
    v14 = 0;
    goto LABEL_37;
  }
  v36 = a6;
  v37 = a7;
  v19 = 0;
  while (1)
  {
    v14 = *(_QWORD *)(v17 + v19);
    if ((*(_DWORD *)(v14 + 24) & 0x40) != 0 || (*(_DWORD *)(v14 + 24) & 0x201) == 1)
      goto LABEL_20;
    v21 = *(double *)(v14 + 48);
    v20 = *(double *)(v14 + 56);
    v22 = *(double *)(v14 + 64);
    v23 = *(double *)(v14 + 72);
    v38.origin.x = v21;
    v38.origin.y = v20;
    v38.size.width = v22;
    v38.size.height = v23;
    MinY = CGRectGetMinY(v38);
    v25 = y >= MinY || !v9;
    if (v25 != 1)
    {
LABEL_21:
      startCharIndex = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_36;
    }
    v26 = MinY;
    if ((*(_BYTE *)(v14 + 27) & 2) != 0)
    {
      v39.origin.x = v21;
      v39.origin.y = v20;
      v39.size.width = v22;
      v39.size.height = v23;
      if (y <= CGRectGetMaxY(v39))
      {
        v32 = TSWPLineFragment::charIndexForWPOffset((TSWPLineFragment *)v14, x, v10, 1, v37, 1);
        if (v32 != 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_35;
        goto LABEL_20;
      }
    }
    v40.origin.x = v21;
    v40.origin.y = v20;
    v40.size.width = v22;
    v40.size.height = v23;
    if (y <= CGRectGetMaxY(v40))
      break;
    if (v19)
    {
      if (y < v26)
      {
        v14 = *(_QWORD *)(v17 + v19 - 16);
        v41.origin.x = v21;
        v41.origin.y = v20;
        v41.size.width = v22;
        v41.size.height = v23;
        if (x > CGRectGetMaxX(v41))
        {
          v32 = TSWPLineFragment::charIndexForWPOffset((TSWPLineFragment *)v14, x, v10, v9, v37, 1);
LABEL_35:
          startCharIndex = v32;
LABEL_36:
          a6 = v36;
          goto LABEL_37;
        }
      }
    }
LABEL_20:
    v19 += 16;
    if ((TSWPLineFragment **)(v17 + v19) == v18)
      goto LABEL_21;
  }
  v27 = (TSWPLineFragment **)(v17 + v19);
  startCharIndex = 0x7FFFFFFFFFFFFFFFLL;
  if ((TSWPLineFragment **)(v17 + v19) == v18)
    goto LABEL_36;
  v28 = 0;
  v29 = INFINITY;
  do
  {
    v30 = (CGFloat *)*v27;
    if (*((double *)*v27 + 7) != v20)
      break;
    v32 = TSWPLineFragment::charIndexForWPOffset(*v27, x, v10, 1, v37, 1);
    if (v32 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_35;
    TSDDistanceToRect(x, y, v30[6], v30[7], v30[8], v30[9]);
    if (v31 < v29)
    {
      v28 = (TSWPLineFragment *)v30;
      v29 = v31;
    }
    v27 += 2;
  }
  while (v27 != v18);
  startCharIndex = 0x7FFFFFFFFFFFFFFFLL;
  a6 = v36;
  if (!v9 && v28)
  {
    startCharIndex = TSWPLineFragment::charIndexForWPOffset(v28, x, v10, 0, v37, 1);
    v14 = (uint64_t)v28;
  }
LABEL_37:
  if (a6)
    *a6 = (const TSWPLineFragment *)v14;
  if (!v9 && startCharIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    p_characterCount = (unint64_t *)(v14 + 8);
    p_startCharIndex = &self->_startCharIndex;
    if (v14)
      p_startCharIndex = (unint64_t *)v14;
    else
      p_characterCount = &self->_characterCount;
    return *p_characterCount + *p_startCharIndex;
  }
  return startCharIndex;
}

- (_TSWPCharIndexAndPosition)calcAttachmentPositionForDrawable:(SEL)a3 atPoint:(id)a4 inTextLayoutTarget:(CGPoint)a5 tlBoundsInfluencingWrap:(id)a6 wrapOutset:(CGPoint)a7 wrapMargin:(CGSize)a8 makeInline:(double)a9
{
  double height;
  double y;
  double v14;
  double x;
  _TSWPCharIndexAndPosition *result;
  _TSWPCharIndexAndPosition *v19;
  TSWPLineFragment *v20;
  TSWPLineFragment *v21;
  double MaxY;
  unint64_t v23;
  double v24;
  TSWPLineFragmentArray **v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  TSWPLineFragment *v29;
  unint64_t v30;
  uint64_t v31;
  double MinY;
  uint64_t v33;
  unint64_t v35;
  unint64_t v36;
  TSWPLineFragmentArray **v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  TSWPLineFragment *v41;
  TSWPLineFragmentArray **v42;
  uint64_t LineIndexForCharIndex;
  unint64_t v44;
  NSUInteger v45;
  TSWPStorage *v46;
  TSWPLineFragment *v47;
  NSUInteger v48;
  double v49;
  double v50;
  double v51;
  void *__p[3];
  TSWPLineFragment *v53;
  char v54;
  _NSRange v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  height = a8.height;
  y = a7.y;
  v14 = a5.y;
  x = a5.x;
  retstr->var0 = 0x7FFFFFFFFFFFFFFFLL;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var2 = NAN;
  *(_QWORD *)&retstr->var3 = 0;
  retstr->var4 = NAN;
  v54 = 0;
  v53 = 0;
  result = -[TSWPColumn charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:isAtEndOfLine:outFragment:leadingEdge:](self, "charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:isAtEndOfLine:outFragment:leadingEdge:", 0, 1, 0, &v54, &v53, 0, a7.x, a7.y);
  if (result != (_TSWPCharIndexAndPosition *)0x7FFFFFFFFFFFFFFFLL && v53)
  {
    v19 = result;
    if (a10 || (objc_msgSend((id)objc_opt_class(), "canPartition") & 1) != 0)
    {
      result = (_TSWPCharIndexAndPosition *)objc_msgSend((id)objc_opt_class(), "canPartition");
      if ((_DWORD)result)
      {
        v20 = v53;
        v21 = -[TSWPColumn lineFragmentAtIndex:](self, "lineFragmentAtIndex:", -[TSWPColumn countLines](self, "countLines") - 1);
        v56.origin.x = *((CGFloat *)v53 + 6);
        v56.origin.y = *((CGFloat *)v53 + 7);
        v56.size.width = *((CGFloat *)v53 + 8);
        v56.size.height = *((CGFloat *)v53 + 9);
        MaxY = CGRectGetMaxY(v56);
        if (v20 == v21)
        {
          v23 = *(_QWORD *)v53;
          v33 = *((_QWORD *)v53 + 1);
          if ((*((_BYTE *)v53 + 25) & 8) != 0)
          {
            if (v19 == (_TSWPCharIndexAndPosition *)(v23 + v33 - 1) && y >= MaxY)
            {
              result = (_TSWPCharIndexAndPosition *)-[TSWPStorage characterAtIndex:](-[TSWPColumn storage](self, "storage", MaxY), "characterAtIndex:", v19);
              if (((unsigned __int16)result & 0xFFFE) != 4)
                v19 = (_TSWPCharIndexAndPosition *)((char *)v19 + 1);
              goto LABEL_9;
            }
          }
          else if (v19 == (_TSWPCharIndexAndPosition *)(v33 + v23) && y >= MaxY)
          {
            goto LABEL_9;
          }
        }
        else
        {
          v23 = *(_QWORD *)v53;
        }
        v19 = (_TSWPCharIndexAndPosition *)v23;
      }
LABEL_9:
      retstr->var0 = (unint64_t)v19;
      retstr->var2 = 0.0;
      v24 = 0.0;
LABEL_10:
      retstr->var4 = v24;
      return result;
    }
    v57.origin.x = *((CGFloat *)v53 + 6);
    v57.origin.y = *((CGFloat *)v53 + 7);
    v57.size.width = *((CGFloat *)v53 + 8);
    v57.size.height = *((CGFloat *)v53 + 9);
    if (y < CGRectGetMaxY(v57))
    {
      v25 = -[TSWPColumn lineFragmentArray](self, "lineFragmentArray");
      v26 = TSWPLineFragmentArray::count(*v25);
      if (v26)
      {
        v27 = v26;
        v28 = -1;
        while (1)
        {
          v29 = (TSWPLineFragment *)TSWPLineFragmentArray::objectAtIndex(*v25, v28 + 1);
          if (v29 == v53)
            break;
          v30 = v28 + 2;
          ++v28;
          if (v30 >= v27)
            goto LABEL_33;
        }
        while (v28 != -1)
        {
          v31 = TSWPLineFragmentArray::objectAtIndex(*v25, v28);
          MinY = CGRectGetMinY(*(CGRect *)(v31 + 48));
          v58.origin.x = *((CGFloat *)v53 + 6);
          v58.origin.y = *((CGFloat *)v53 + 7);
          v58.size.width = *((CGFloat *)v53 + 8);
          v58.size.height = *((CGFloat *)v53 + 9);
          --v28;
          if (MinY < CGRectGetMinY(v58))
          {
            v53 = (TSWPLineFragment *)v31;
            break;
          }
        }
      }
    }
LABEL_33:
    v35 = -[TSWPColumn anchoredRange](self, "anchoredRange");
    if (*(_QWORD *)v53 < v35)
    {
      v36 = v35;
      v37 = -[TSWPColumn lineFragmentArray](self, "lineFragmentArray");
      v38 = TSWPLineFragmentArray::count(*v37);
      if (v38)
      {
        v39 = v38;
        v40 = 0;
        while (1)
        {
          v41 = (TSWPLineFragment *)TSWPLineFragmentArray::objectAtIndex(*v37, v40);
          if (*(_QWORD *)v41 >= v36)
            break;
          if (v39 == ++v40)
            goto LABEL_40;
        }
        v53 = v41;
      }
    }
LABEL_40:
    if ((*((_DWORD *)v53 + 6) & 0x301) == 0x101)
    {
      v42 = -[TSWPColumn lineFragmentArray](self, "lineFragmentArray");
      LineIndexForCharIndex = TSWPLineFragmentArray::findLineIndexForCharIndex(*v42, *(_QWORD *)v53);
      if (LineIndexForCharIndex != 0x7FFFFFFFFFFFFFFFLL)
      {
        v44 = LineIndexForCharIndex + 1;
        if (LineIndexForCharIndex + 1 < (unint64_t)TSWPLineFragmentArray::count(*v42))
          v53 = (TSWPLineFragment *)TSWPLineFragmentArray::objectAtIndex(*v42, v44);
      }
    }
    v45 = *(_QWORD *)v53;
    retstr->var0 = *(_QWORD *)v53;
    v46 = -[TSWPColumn storage](self, "storage");
    v47 = v53;
    v48 = *((_QWORD *)v53 + 1) + *(_QWORD *)v53;
    if (v45 < v48)
    {
      while (1)
      {
        objc_opt_class();
        -[TSWPStorage attachmentAtCharIndex:](v46, "attachmentAtCharIndex:", v45);
        if (!objc_msgSend((id)TSUDynamicCast(), "isAnchored"))
          break;
        retstr->var0 = ++v45;
        if (v48 == v45)
        {
          v45 = v48;
          break;
        }
      }
      v47 = v53;
    }
    v55.location = v45;
    v55.length = 0;
    TSWPLineFragment::rectsForLineRange(v47, v55, 0, 0, 1, 0, (double **)__p);
    TSWPUnionRects((CGRect **)__p);
    v50 = v49;
    result = (_TSWPCharIndexAndPosition *)__p[0];
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    retstr->var2 = x;
    v51 = v14 - (height + v50) + *((double *)v53 + 52);
    retstr->var4 = v51;
    if (height + v51 < 0.0)
    {
      objc_opt_class();
      result = (_TSWPCharIndexAndPosition *)TSUDynamicCast();
      if (result)
      {
        retstr->var3 = 1;
        -[_TSWPCharIndexAndPosition frame](result, "frame");
        v24 = v14 + CGRectGetMinY(v59) - (height - a9);
        goto LABEL_10;
      }
    }
  }
  return result;
}

- (void)renderWithRenderer:(id)a3 pageCount:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v8 = 0;
  v9 = 0;
  v10 = 0;
  LOBYTE(v7) = 0;
  LODWORD(v6) = 3;
  LOBYTE(v5) = 0;
  LOBYTE(v4) = 0;
  -[TSWPColumn renderWithRenderer:currentSelection:limitSelection:listRange:rubyGlyphRange:isCanvasInteractive:spellChecker:suppressedMisspellingRange:blackAndWhite:dictationInterpretations:autocorrections:markedRange:markedText:renderMode:pageCount:suppressInvisibles:currentCanvasSelection:](self, "renderWithRenderer:currentSelection:limitSelection:listRange:rubyGlyphRange:isCanvasInteractive:spellChecker:suppressedMisspellingRange:blackAndWhite:dictationInterpretations:autocorrections:markedRange:markedText:renderMode:pageCount:suppressInvisibles:currentCanvasSelection:", a3, 0, 0, *MEMORY[0x24BEB3BF0], *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8), v4, 0, *MEMORY[0x24BEB3BF0], *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8), v5, &v8, &v8, *MEMORY[0x24BEB3BF0], *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8), 0,
    v6,
    a4,
    v7,
    0);
  if (v8)
  {
    v9 = v8;
    operator delete(v8);
  }
}

- (id)smartFieldAtCharIndex:(unint64_t)a3 attributeKind:(unsigned int)a4
{
  return -[TSWPStorage smartFieldAtCharIndex:attributeKind:effectiveRange:](-[TSWPColumn storage](self, "storage"), "smartFieldAtCharIndex:attributeKind:effectiveRange:", a3, *(_QWORD *)&a4, 0);
}

- (id)partitionedLayoutForInfo:(id)a3
{
  TSWPLineFragmentArray *ptr;
  uint64_t v4;
  uint64_t v5;
  void *v7;

  ptr = self->_lineFragmentArray.__ptr_;
  v4 = *(_QWORD *)ptr;
  v5 = *((_QWORD *)ptr + 1);
  if (*(_QWORD *)ptr == v5)
    return 0;
  while (1)
  {
    v7 = *(void **)(*(_QWORD *)v4 + 432);
    if ((id)objc_msgSend(v7, "info") == a3)
      break;
    v4 += 16;
    if (v4 == v5)
      return 0;
  }
  return v7;
}

- (id)singleLinePartitionedInfoAtStart:(BOOL)a3
{
  const void *v5;
  int v6;

  if (-[TSWPColumn countLines](self, "countLines") != 1)
    return 0;
  v5 = -[TSWPColumn lineFragmentAtIndex:](self, "lineFragmentAtIndex:", 0);
  v6 = *((_DWORD *)v5 + 6);
  if ((v6 & 1) == 0)
    return 0;
  if (((v6 & 0x200) != 0 || !a3) && ((v6 & 0x100) != 0 || a3))
    return 0;
  else
    return (id)objc_msgSend(*((id *)v5 + 54), "info");
}

- (BOOL)onlyHasAnchoredDrawable
{
  _BOOL4 v3;

  if (-[TSWPColumn countLines](self, "countLines") == 1)
    return (*(unsigned __int8 *)(-[TSWPColumn lineFragmentAtIndex:](self, "lineFragmentAtIndex:", 0) + 24) >> 6) & 1;
  else
    LOBYTE(v3) = 0;
  return v3;
}

- (unint64_t)characterCount
{
  return self->_characterCount;
}

- (unint64_t)startAnchoredCharIndex
{
  return self->_startAnchoredCharIndex;
}

- (unint64_t)anchoredCharCount
{
  return self->_anchoredCharCount;
}

- (unint64_t)nextWidowPullsDownFromCharIndex
{
  return self->_nextWidowPullsDownFromCharIndex;
}

- (double)erasableContentBottom
{
  return self->_erasableContentBottom;
}

- (void)setErasableContentBottom:(double)a3
{
  self->_erasableContentBottom = a3;
}

- (BOOL)textIsVertical
{
  return self->_textIsVertical;
}

@end
