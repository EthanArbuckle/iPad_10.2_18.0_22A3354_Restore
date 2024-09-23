@implementation TSWPLayoutManager

+ (void)fixColumnBoundsForTarget:(id)a3 storage:(id)a4 charIndex:(unint64_t)a5 firstColumnIndex:(unint64_t)a6 precedingHeight:(double)a7 height:(double)a8 alreadyHasMargins:(BOOL)a9 styleProvider:(id)a10 vertical:(BOOL)a11
{
  void *v18;
  int v19;
  unint64_t v20;
  BOOL v21;
  void *v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  char v36;
  void *v37;
  uint64_t v38;
  void *v39;
  double v40;
  uint64_t v41;
  double v42;
  uint64_t v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  int v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  int v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double MaxY;
  _BOOL4 v64;
  double v65;
  _BOOL4 v66;
  double v67;
  double v68;
  TSWPColumn *v69;
  int v70;
  unint64_t v71;
  unint64_t v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  uint64_t v79;
  unint64_t v80;
  id v81;
  char v82;
  void *v83;
  uint64_t v84;
  double v85;
  __int128 v86;
  CGRect v87;

  v86 = *MEMORY[0x24BEB3BF0];
  v18 = (void *)objc_msgSend(a3, "columnMetricsForCharIndex:outRange:", a5, &v86);
  v19 = objc_msgSend(v18, "columnsAreLeftToRight");
  if (v18)
    v20 = objc_msgSend(v18, "columnCount");
  else
    v20 = 1;
  v21 = (unint64_t)v86 < a5 || a9;
  v82 = v21;
  v81 = +[TSWPPadding padding](TSWPPadding, "padding");
  v83 = (void *)objc_msgSend(a3, "columns");
  if (!v83)
  {
    v22 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v23 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSWPLayoutManager fixColumnBoundsForTarget:storage:charIndex:firstColumnIndex:precedingHeight:height:alreadyHasMargins:styleProvider:vertical:]");
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayoutManager.mm"), 484, CFSTR("invalid nil value for '%s'"), "columnsArray");
  }
  objc_msgSend(a3, "currentSize");
  v76 = v25;
  v77 = v24;
  if (a11)
    v24 = v25;
  v75 = v24;
  if (v18)
  {
    objc_msgSend(v18, "adjustedInsets");
    v27 = v26;
    v29 = v28;
  }
  else
  {
    v27 = *MEMORY[0x24BDBF148];
    v29 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  v80 = objc_msgSend(v83, "count");
  if (objc_msgSend(a4, "allowsElementKind:", 32))
    v79 = objc_msgSend(a3, "pageNumber");
  else
    v79 = 0x7FFFFFFFFFFFFFFFLL;
  v30 = v75 - TSDMultiplySizeScalar(v27, v29, 2.0);
  v32 = a8 - v31;
  v33 = 0.0;
  if (v30 >= 0.0)
    v34 = v30;
  else
    v34 = 0.0;
  if (v32 >= 0.0)
    v35 = v32;
  else
    v35 = 0.0;
  if (a6)
    v36 = v82;
  else
    v36 = 1;
  if ((v36 & 1) == 0)
  {
    objc_opt_class();
    objc_msgSend((id)objc_msgSend(a3, "columns"), "objectAtIndexedSubscript:", a6 - 1);
    v37 = (void *)TSUDynamicCast();
    if (!v37)
    {
      v73 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v38 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSWPLayoutManager fixColumnBoundsForTarget:storage:charIndex:firstColumnIndex:precedingHeight:height:alreadyHasMargins:styleProvider:vertical:]");
      objc_msgSend(v73, "handleFailureInFunction:file:lineNumber:description:", v38, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayoutManager.mm"), 519, CFSTR("invalid nil value for '%s'"), "column");
    }
    v39 = (void *)objc_msgSend((id)objc_msgSend(a3, "columnMetricsForCharIndex:outRange:", objc_msgSend(v37, "range"), 0), "layoutMargins");
    if (v39)
    {
      objc_msgSend(v39, "bottomInset");
      v33 = v40;
    }
  }
  v72 = v20 + a6;
  if (v20 + a6 > a6)
  {
    v41 = 0;
    v42 = v29 + a7;
    v74 = v29 + a7;
    do
    {
      v85 = v34;
      v84 = 0;
      v43 = objc_msgSend(v18, "layoutMargins");
      if (v43)
        v44 = (void *)v43;
      else
        v44 = v81;
      if (a11)
      {
        objc_msgSend(v44, "topInset");
        v46 = v76 - v45;
        objc_msgSend(v44, "bottomInset");
      }
      else
      {
        objc_msgSend(v44, "leftInset");
        v46 = v77 - v48;
        objc_msgSend(v44, "rightInset");
      }
      v49 = v46 - v47;
      v50 = objc_msgSend(a4, "wpKind");
      v51 = fmax(v49, 36.0);
      if (!v50)
        v49 = v51;
      if (a11)
      {
        objc_msgSend(v44, "topInset");
      }
      else if (v19)
      {
        objc_msgSend(v44, "leftInset");
      }
      else
      {
        objc_msgSend(v44, "rightInset");
      }
      v53 = v52;
      if (v18)
      {
        objc_msgSend(v18, "positionForColumnIndex:bodyWidth:outWidth:outGap:", v41, &v85, &v84, v49);
        if (v19)
          goto LABEL_48;
      }
      else
      {
        v54 = 0.0;
        if (v19)
        {
LABEL_48:
          v55 = v53 + v54;
          goto LABEL_51;
        }
      }
      v55 = v49 - v53 - v54 - v85;
LABEL_51:
      v56 = objc_msgSend(a4, "wpKind");
      v57 = v85;
      if (!v56)
      {
        v57 = fmax(v85, 18.0);
        v85 = v57;
        if (v75 + (float)((float)v20 * -18.0) < v55)
          v55 = v75 + (float)((float)v20 * -18.0);
      }
      v58 = v35;
      v59 = v42;
      if ((v82 & 1) == 0)
      {
        if (a11)
          objc_msgSend(v44, "rightInset");
        else
          objc_msgSend(v44, "topInset");
        v59 = v42 + v33 + v60;
        objc_msgSend(a3, "maxSize");
        v62 = v61;
        v87.origin.x = v55;
        v87.origin.y = v59;
        v87.size.width = v57;
        v87.size.height = v35;
        MaxY = CGRectGetMaxY(v87);
        if (a6 || MaxY <= v62)
        {
          v58 = v35;
        }
        else
        {
          v64 = objc_msgSend(a4, "wpKind") == 0;
          v65 = 36.0;
          v66 = v62 - v59 < 36.0;
          v67 = v62 + -36.0;
          if (!v64 || !v66)
            v65 = v62 - v59;
          v42 = v74;
          if (!v64 || !v66)
            v67 = v59;
          v68 = v62 + -1.0;
          if (v65 < 1.0)
            v58 = 1.0;
          else
            v58 = v65;
          if (v65 < 1.0)
            v59 = v68;
          else
            v59 = v67;
        }
      }
      if (a6 + v41 >= v80)
      {
        v69 = -[TSWPColumn initWithStorage:frameBounds:]([TSWPColumn alloc], "initWithStorage:frameBounds:", a4, v55, v59, v57, v58);
        -[TSWPColumn setStyleProvider:](v69, "setStyleProvider:", a10);
        -[TSWPColumn setColumnIndex:](v69, "setColumnIndex:", a6 + v41);
        objc_msgSend(v83, "addObject:", v69);

      }
      else
      {
        v69 = (TSWPColumn *)objc_msgSend(v83, "objectAtIndexedSubscript:", a6 + v41);
        -[TSWPColumn setWpBounds:](v69, "setWpBounds:", v55, v59, v57, v58);
      }
      -[TSWPColumn setTextIsVertical:](v69, "setTextIsVertical:", objc_msgSend(a3, "textIsVertical"));
      -[TSWPColumn setPageNumber:](v69, "setPageNumber:", v79);
      ++v41;
      --v20;
    }
    while (v20);
  }
  v70 = objc_msgSend(a4, "wpKind");
  if (!a6 && v70)
  {
    v71 = objc_msgSend(v83, "count");
    if (v71 > v72)
      objc_msgSend(v83, "removeObjectsInRange:", v72, v71 - v72);
  }
}

- (void).cxx_destruct
{
  TSWPTopicNumberHints::~TSWPTopicNumberHints(&self->_cachedTopicNumbers);
}

- (TSWPCTTypesetterCache)typesetterCache
{
  int v3;
  BOOL v4;
  TSWPCTTypesetterCache *result;

  v3 = objc_msgSend(-[TSWPStorage documentRoot](self->_storage, "documentRoot"), "useLigatures");
  if (self->_useLigatures != v3)
  {
    v4 = v3;
    -[TSWPLayoutManager clearTypesetterCache](self, "clearTypesetterCache");
    self->_useLigatures = v4;
  }
  result = self->_typesetterCache;
  if (!result)
  {
    result = objc_alloc_init(TSWPCTTypesetterCache);
    self->_typesetterCache = result;
  }
  return result;
}

- (id).cxx_construct
{
  TSWPTopicNumberHints::TSWPTopicNumberHints(&self->_cachedTopicNumbers, 0);
  return self;
}

- (void)willRemoveAttachmentLayout:(id)a3
{
  uint64_t v4;
  TSWPStorage *storage;
  TSWPParagraphEnumerator v6;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "info"), "owningAttachment"), "findCharIndex");
  storage = self->_storage;
  if (storage)
    -[TSWPStorage paragraphEnumeratorAtCharIndex:styleProvider:](storage, "paragraphEnumeratorAtCharIndex:styleProvider:", v4, 0);
  else
    memset(&v6, 0, sizeof(v6));
  -[TSWPCTTypesetterCache removeTypesetterForParagraphIndex:](self->_typesetterCache, "removeTypesetterForParagraphIndex:", TSWPParagraphEnumerator::relevantParagraphIndex(&v6));
  TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v6);
}

- (void)layoutIntoTarget:(id)a3 withLayoutState:(void *)a4 outSync:(BOOL *)a5
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  unint64_t charIndex;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSUInteger v20;
  NSUInteger location;
  NSUInteger v22;
  int64_t delta;

  v9 = (void *)-[TSWPLayoutOwner lineHintsForTarget:](self->_owner, "lineHintsForTarget:");
  if (v9 && (v10 = objc_msgSend(v9, "hints")) != 0)
  {
    v11 = v10;
    if (a4)
      -[TSWPLayoutManager destroyLayoutState:](self, "destroyLayoutState:", a4);
    a4 = (void *)operator new();
    TSWPLayoutChore::TSWPLayoutChore((uint64_t)a4, self->_storage, self->_owner, self, *(_QWORD *)(v11 + 32), 0, self->_dirtyRange.location, self->_dirtyRange.length, self->_delta, 0);
  }
  else if (!a4)
  {
    v12 = -[TSWPLayoutManager p_layoutConfigFlagsForTarget:](self, "p_layoutConfigFlagsForTarget:", a3);
    a4 = (void *)operator new();
    TSWPLayoutChore::TSWPLayoutChore((uint64_t)a4, self->_storage, self->_owner, self, 0, v12, self->_dirtyRange.location, self->_dirtyRange.length, self->_delta, 0);
  }
  TSWPTopicNumberHints::reset(&self->_cachedTopicNumbers);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a3, "setAnchoredDrawablesForRelayout:", objc_msgSend(MEMORY[0x24BDBCEB8], "array"));
    v13 = TSWPLayoutChore::layoutIntoTarget((NSUInteger)a4, a3, 1, (char *)a5);
    objc_msgSend(a3, "setAnchoredDrawablesForRelayout:", 0);
  }
  else
  {
    v13 = TSWPLayoutChore::layoutIntoTarget((NSUInteger)a4, a3, 1, (char *)a5);
  }
  TSWPTopicNumberHints::operator=(&self->_cachedTopicNumbers, (TSWPTopicNumberHints *)a4 + 17);
  if (objc_msgSend((id)objc_msgSend(a3, "columns"), "count"))
  {
    charIndex = self->_cachedTopicNumbers._charIndex;
    if (charIndex != 0x7FFFFFFFFFFFFFFFLL
      && charIndex >= objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "columns"), "firstObject"), "range"))
    {
      v15 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPLayoutManager layoutIntoTarget:withLayoutState:outSync:]");
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayoutManager.mm"), 311, CFSTR("topic numbers are out of sync with layout"));
    }
  }
  if (v13)
  {
    if (self->_dirtyRange.location != 0x7FFFFFFFFFFFFFFFLL)
    {
      v17 = (void *)objc_msgSend((id)objc_msgSend(a3, "columns"), "lastObject");
      if (v17)
      {
        v18 = objc_msgSend(v17, "range");
        v20 = v18 + v19;
        location = self->_dirtyRange.location;
        if (v18 + v19 > location)
        {
          v22 = self->_dirtyRange.length + location;
          if (v22 > v20)
          {
            self->_dirtyRange.location = v20;
            self->_dirtyRange.length = v22 - v20;
          }
          else
          {
            delta = self->_delta;
            self->_dirtyRange.length = 0;
            *(_OWORD *)&self->_delta = xmmword_217C2AC80;
            TSWPLayoutChore::clearDelta((uint64_t)a4);
            -[TSWPLayoutOwner layoutManager:didClearDirtyRangeWithDelta:afterCharIndex:](self->_owner, "layoutManager:didClearDirtyRangeWithDelta:afterCharIndex:", self, delta, v22);
          }
        }
      }
    }
  }
  else
  {
    (*(void (**)(void *))(*(_QWORD *)a4 + 8))(a4);
    a4 = 0;
    self->_dirtyRange.length = 0;
    *(_OWORD *)&self->_delta = xmmword_217C2AC80;
  }
  return a4;
}

- (id)styleProvider
{
  id result;

  if (!self->_owner)
    return +[TSWPStorageStyleProvider styleProviderForStorage:](TSWPStorageStyleProvider, "styleProviderForStorage:", self->_storage);
  objc_opt_class();
  TSUDynamicCast();
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return +[TSWPStorageStyleProvider styleProviderForStorage:](TSWPStorageStyleProvider, "styleProviderForStorage:", self->_storage);
  result = (id)-[TSWPLayoutOwner styleProvider](self->_owner, "styleProvider");
  if (!result)
    return +[TSWPStorageStyleProvider styleProviderForStorage:](TSWPStorageStyleProvider, "styleProviderForStorage:", self->_storage);
  return result;
}

- (int)p_layoutConfigFlagsForTarget:(id)a3
{
  int v4;

  if (objc_msgSend(a3, "textIsVertical"))
    v4 = 16;
  else
    v4 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(a3, "allowsLastLineTruncation"))
    v4 |= 0x20u;
  if ((objc_opt_respondsToSelector() & 1) != 0 && !objc_msgSend(a3, "allowsDescendersToClip"))
    v4 |= 4u;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(a3, "pushAscendersIntoColumn"))
    return v4 | 0x40;
  return v4;
}

- (TSWPLayoutManager)initWithStorage:(id)a3 owner:(id)a4
{
  TSWPLayoutManager *v6;
  TSWPStorage *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSWPLayoutManager;
  v6 = -[TSWPLayoutManager init](&v9, sel_init);
  if (v6)
  {
    v7 = (TSWPStorage *)a3;
    v6->_owner = (TSWPLayoutOwner *)a4;
    v6->_storage = v7;
    if (objc_msgSend(a4, "caresAboutStorageChanges"))
    {
      -[TSWPStorage addObserver:](v6->_storage, "addObserver:", v6);
      v6->_isObservingStorage = 1;
    }
    v6->_dirtyRange.location = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[TSWPLayoutManager clearOwner](self, "clearOwner");

  v3.receiver = self;
  v3.super_class = (Class)TSWPLayoutManager;
  -[TSWPLayoutManager dealloc](&v3, sel_dealloc);
}

- (void)clearOwner
{
  self->_owner = 0;
  if (self->_isObservingStorage)
    -[TSWPStorage removeObserver:](self->_storage, "removeObserver:", self);
}

- (void)resetTopicNumbers
{
  TSWPTopicNumberHints::resetWithStyleProvider((uint64_t)&self->_cachedTopicNumbers, -[TSWPLayoutManager styleProvider](self, "styleProvider"));
}

- (void)clearTypesetterCache
{
  -[TSWPCTTypesetterCache clearCache](self->_typesetterCache, "clearCache");
}

- (void)storage:(id)a3 didChangeRange:(_NSRange)a4 delta:(int64_t)a5 broadcastKind:(int)a6
{
  NSUInteger length;
  NSUInteger location;
  NSRange v12;
  NSUInteger v13;
  TSWPParagraphEnumerator v14;

  length = a4.length;
  location = a4.location;
  v12.location = self->_dirtyRange.location;
  if (v12.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_dirtyRange = a4;
    self->_delta = a5;
  }
  else
  {
    if (a4.location + a4.length <= v12.location)
    {
      v12.location += a5;
      self->_dirtyRange.location = v12.location;
      v12.length = self->_dirtyRange.length;
    }
    else
    {
      v12.length = self->_dirtyRange.length;
      if (a4.location < v12.length + v12.location)
      {
        v12.length += a5;
        self->_dirtyRange.length = v12.length;
      }
    }
    self->_dirtyRange = NSUnionRange(v12, a4);
    self->_delta += a5;
  }
  if (a6 != 1 || a5 != (int)length)
  {
LABEL_16:
    -[TSWPCTTypesetterCache clearCache](self->_typesetterCache, "clearCache");
    goto LABEL_17;
  }
  if (location < location + length)
  {
    v13 = location;
    while (!IsParagraphBreakingCharacter(objc_msgSend(a3, "characterAtIndex:", v13)))
    {
      ++v13;
      if (!--length)
        goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_14:
  if (a3)
    objc_msgSend(a3, "paragraphEnumeratorAtCharIndex:styleProvider:", location, 0);
  else
    memset(&v14, 0, sizeof(v14));
  -[TSWPCTTypesetterCache removeTypesetterForParagraphIndex:](self->_typesetterCache, "removeTypesetterForParagraphIndex:", TSWPParagraphEnumerator::relevantParagraphIndex(&v14));
  TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v14);
LABEL_17:
  -[TSWPLayoutOwner layoutManagerNeedsLayout:](self->_owner, "layoutManagerNeedsLayout:", self, *(_OWORD *)&v14.var0, *(_OWORD *)&v14.var2, *(_OWORD *)&v14.var4, *(_QWORD *)&v14.var6);
}

- (BOOL)needsLayoutInColumn:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  NSUInteger location;
  unint64_t v8;
  unsigned int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v15[2];

  v4 = objc_msgSend(a3, "range");
  v6 = 0;
  if (v5)
  {
    location = self->_dirtyRange.location;
    if (location <= 0x7FFFFFFFFFFFFFFELL)
    {
      v8 = v4 + v5;
      if (!(v4 + v5))
        return 0;
      v9 = -[TSWPStorage characterAtIndex:](self->_storage, "characterAtIndex:", v8 - 1) - 4;
      if (v9 < 0xC && ((0x907u >> v9) & 1) != 0)
      {
        return 0;
      }
      else
      {
        v10 = (void *)objc_msgSend(-[TSWPLayoutManager styleProvider](self, "styleProvider"), "paragraphStyleAtParIndex:effectiveRange:", -[TSWPStorage paragraphIndexAtCharIndex:](self->_storage, "paragraphIndexAtCharIndex:", location), v15);
        v11 = v10;
        v12 = v15[0];
        v6 = v15[0] <= v8 && objc_msgSend(v10, "intValueForProperty:", 92) != 0;
        if (v12 == v8 && !v6)
          v6 = objc_msgSend(v11, "intValueForProperty:", 89) != 0;
        if (!v6 && v15[0] > v8)
        {
          v6 = 0;
          do
          {
            v13 = -[TSWPLayoutManager styleProvider](self, "styleProvider");
            if (!objc_msgSend((id)objc_msgSend(v13, "paragraphStyleAtParIndex:effectiveRange:", -[TSWPStorage paragraphIndexAtCharIndex:](self->_storage, "paragraphIndexAtCharIndex:", v15[0] - 1), v15), "intValueForProperty:", 90))break;
            v6 = v15[0] == v8;
          }
          while (v15[0] > v8);
        }
      }
    }
  }
  return v6;
}

- (double)layoutIntoTarget:(id)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  double v8;
  CGFloat v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  void *v15;
  uint64_t v16;
  NSRange v17;
  NSUInteger v18;
  int v19;
  _DWORD *v20;
  TSWPStorage *storage;
  double MinY;
  double Height;
  id v24;
  void *v25;
  double v26;
  double v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSString *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  NSUInteger v36;
  NSUInteger v37;
  NSUInteger v38;
  int64_t delta;
  double v40;
  double v41;
  uint64_t v43;
  TSWPTopicNumberHints v44;
  NSRange v45;
  NSRange v46;
  NSRange v47;
  NSRange v48;
  CGRect v49;
  CGRect v50;

  length = a4.length;
  location = a4.location;
  objc_msgSend(a3, "currentSize");
  v9 = v8;
  v10 = length;
  v11 = location;
  if (location + length < -[TSWPStorage length](self->_storage, "length"))
  {
    v12 = -[TSWPStorage textRangeForParagraphAtCharIndex:](self->_storage, "textRangeForParagraphAtCharIndex:", location + length);
    v14 = v13;
    if (v12 + v13 <= location + length)
    {
      v15 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPLayoutManager layoutIntoTarget:withRange:]");
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayoutManager.mm"), 372, CFSTR("this isn't the next paragraph range"));
    }
    v45.location = location;
    v45.length = length;
    v48.location = v12;
    v48.length = v14;
    v17 = NSUnionRange(v45, v48);
    v11 = v17.location;
    v10 = v17.length;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = objc_msgSend(a3, "expandedRangeForLayoutRange:styleProvider:", v11, v10, -[TSWPLayoutManager styleProvider](self, "styleProvider"));
    v10 = v18;
  }
  TSWPTopicNumberHints::TSWPTopicNumberHints(&v44, -[TSWPLayoutManager styleProvider](self, "styleProvider"));
  v19 = -[TSWPLayoutManager p_layoutConfigFlagsForTarget:](self, "p_layoutConfigFlagsForTarget:", a3);
  v20 = (_DWORD *)operator new();
  TSWPLayoutColumnChore::TSWPLayoutColumnChore((uint64_t)v20, self->_storage, self->_owner, self, v19, v11, v10, (void *)(v10 + v11), &v44);
  storage = self->_storage;
  v49.origin.x = 0.0;
  v49.origin.y = 0.0;
  v49.size.width = v9;
  v49.size.height = 1.79769313e308;
  MinY = CGRectGetMinY(v49);
  v50.origin.x = 0.0;
  v50.origin.y = 0.0;
  v50.size.width = v9;
  v50.size.height = 1.79769313e308;
  Height = CGRectGetHeight(v50);
  v24 = -[TSWPLayoutManager styleProvider](self, "styleProvider");
  LOBYTE(v43) = (v20[8] & 0x10) != 0;
  +[TSWPLayoutManager fixColumnBoundsForTarget:storage:charIndex:firstColumnIndex:precedingHeight:height:alreadyHasMargins:styleProvider:vertical:](TSWPLayoutManager, "fixColumnBoundsForTarget:storage:charIndex:firstColumnIndex:precedingHeight:height:alreadyHasMargins:styleProvider:vertical:", a3, storage, v11, 0, 1, v24, MinY, Height, v43);
  v25 = (void *)objc_msgSend((id)objc_msgSend(a3, "columns"), "objectAtIndex:", 0);
  objc_msgSend(v25, "setRange:", v11, v10);
  objc_msgSend(v25, "setAnchoredRange:", v11, v10);
  TSWPLayoutColumnChore::layoutColumnsIntoTarget((NSUInteger)v20, a3, 0, 1, 0);
  objc_msgSend(v25, "trimFromCharIndex:inTarget:layoutChore:", location, a3, v20);
  objc_msgSend(v25, "trimToCharIndex:inTarget:", location + length, a3);
  v27 = v26;
  if (objc_msgSend(v25, "countLines") && location)
    TSWPLineFragmentArray::disableClippingForObjectAtIndex(*(TSWPLineFragmentArray **)objc_msgSend(v25, "lineFragmentArray"), 0);
  TSWPLayoutChore::postProcessDrawableAttachments((uint64_t)v20, a3);
  (*(void (**)(_DWORD *))(*(_QWORD *)v20 + 8))(v20);
  if (location != objc_msgSend(v25, "range") || length != v28)
  {
    v29 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v30 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPLayoutManager layoutIntoTarget:withRange:]");
    v31 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayoutManager.mm");
    v46.location = objc_msgSend(v25, "range");
    v32 = NSStringFromRange(v46);
    v47.location = location;
    v47.length = length;
    objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, v31, 413, CFSTR("column range doesn't match requested range: %@ vs %@"), v32, NSStringFromRange(v47));
  }
  if (self->_dirtyRange.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    v33 = (void *)objc_msgSend((id)objc_msgSend(a3, "columns"), "lastObject");
    if (v33)
    {
      v34 = objc_msgSend(v33, "range");
      v36 = v34 + v35;
      v37 = self->_dirtyRange.location;
      if (v34 + v35 > v37)
      {
        v38 = self->_dirtyRange.length + v37;
        if (v38 > v36)
        {
          self->_dirtyRange.location = v36;
          self->_dirtyRange.length = v38 - v36;
        }
        else
        {
          delta = self->_delta;
          self->_dirtyRange.length = 0;
          *(_OWORD *)&self->_delta = xmmword_217C2AC80;
          -[TSWPLayoutOwner layoutManager:didClearDirtyRangeWithDelta:afterCharIndex:](self->_owner, "layoutManager:didClearDirtyRangeWithDelta:afterCharIndex:", self, delta);
        }
      }
    }
  }
  objc_msgSend(v25, "textHeight");
  v41 = v27 + v40;
  TSWPTopicNumberHints::~TSWPTopicNumberHints(&v44);
  return v41;
}

- (void)layoutStateForLayoutTarget:(id)a3 afterHint:(id *)a4 childHint:(id)a5 topicNumbers:(const void *)a6 textIsVertical:(BOOL)a7
{
  _BOOL4 v7;
  uint64_t v11;
  int v12;
  int v13;
  TSWPLayoutChore *v14;
  void *v15;
  uint64_t v16;

  if (a4)
  {
    v7 = a7;
    v11 = a4->var1.length + a4->var1.location;
    v12 = -[TSWPLayoutManager p_layoutConfigFlagsForTarget:](self, "p_layoutConfigFlagsForTarget:", a3);
    if (v7)
      v13 = v12 | 0x10;
    else
      v13 = v12;
    v14 = (TSWPLayoutChore *)operator new();
    TSWPLayoutChore::TSWPLayoutChore((uint64_t)v14, self->_storage, self->_owner, self, v11, v13, self->_dirtyRange.location, self->_dirtyRange.length, self->_delta, a5);
    TSWPLayoutChore::setTopicNumbers(v14, (TSWPTopicNumberHints *)a6);
  }
  else
  {
    v15 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, 0, a5, a6, a7);
    v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPLayoutManager layoutStateForLayoutTarget:afterHint:childHint:topicNumbers:textIsVertical:]");
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayoutManager.mm"), 448, CFSTR("bad hint"));
    return 0;
  }
  return v14;
}

- (void)deflateTarget:(id)a3 intoHints:(void *)a4 childHints:(id)a5[2] anchoredAttachmentPositions:(id *)a6 topicNumbers:(void *)a7 layoutState:(void *)a8
{
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double MaxX;
  double MinX;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  NSUInteger v30;
  NSUInteger v31;
  NSUInteger v32;
  NSUInteger v33;
  NSRange v34;
  unint64_t v35;
  unint64_t v36;
  void *v39;
  uint64_t v40;
  double v41;
  char **v42;
  unint64_t v43;
  char *v44;
  char *v45;
  char *v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  char *v51;
  char *v52;
  char *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t i;
  void *v66;
  uint64_t v67;
  void *v68;
  unint64_t charIndex;
  void *v70;
  uint64_t v71;
  char *v75;
  void *v76;
  unint64_t v77;
  char **v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  uint64_t v85;
  NSRange v86;
  NSRange v87;
  CGRect v88;
  CGRect v89;

  v85 = *MEMORY[0x24BDAC8D0];
  v10 = (void *)objc_msgSend(a3, "columns");
  v79 = (char **)a4;
  v77 = objc_msgSend(v10, "count");
  if (v77)
  {
    v11 = 0;
    v75 = (char *)a4 + 16;
    v76 = v10;
    do
    {
      v12 = (void *)objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
      v13 = (void *)objc_msgSend(a3, "columnMetricsForCharIndex:outRange:", objc_msgSend(v12, "startCharIndex"), 0);
      if (v13)
        v14 = objc_msgSend(v13, "columnCount");
      else
        v14 = 1;
      v11 += v14;
      v15 = (void *)objc_msgSend(v10, "objectAtIndexedSubscript:", v11 - 1);
      objc_msgSend(v12, "frameBounds");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      objc_msgSend(v15, "frameBounds");
      MaxX = CGRectGetMaxX(v88);
      objc_msgSend(v12, "frameBounds");
      MinX = CGRectGetMinX(v89);
      v24 = objc_msgSend(v12, "startCharIndex");
      v25 = objc_msgSend(v15, "startCharIndex");
      v26 = objc_msgSend(v15, "characterCount");
      if (v24 <= v26 + v25)
        v27 = v26 + v25;
      else
        v27 = v24;
      if (v24 >= v26 + v25)
        v28 = v26 + v25;
      else
        v28 = v24;
      v29 = v27 - v28;
      v30 = objc_msgSend(v12, "anchoredRange");
      v32 = v31;
      v87.location = objc_msgSend(v15, "anchoredRange");
      v87.length = v33;
      v86.location = v30;
      v86.length = v32;
      v34 = NSUnionRange(v86, v87);
      v35 = objc_msgSend(v15, "nextWidowPullsDownFromCharIndex");
      v36 = v35;
      if ((v35 - v28 >= v27 - v28 || v35 < v28) && v35 != v27)
      {
        v39 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v40 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPLayoutManager deflateTarget:intoHints:childHints:anchoredAttachmentPositions:topicNumbers:layoutState:]");
        objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayoutManager.mm"), 657, CFSTR("Bad widow location"));
      }
      v41 = MaxX - MinX;
      v42 = v79;
      v44 = v79[1];
      v43 = (unint64_t)v79[2];
      if ((unint64_t)v44 >= v43)
      {
        v46 = *v79;
        v47 = 0xCCCCCCCCCCCCCCCDLL * ((v44 - *v79) >> 4);
        v48 = v47 + 1;
        if (v47 + 1 > 0x333333333333333)
          abort();
        v49 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v43 - (_QWORD)v46) >> 4);
        if (2 * v49 > v48)
          v48 = 2 * v49;
        if (v49 >= 0x199999999999999)
          v50 = 0x333333333333333;
        else
          v50 = v48;
        if (v50)
        {
          v51 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLayoutTable::LayoutRow>>((uint64_t)v75, v50);
          v46 = *v79;
          v44 = v79[1];
        }
        else
        {
          v51 = 0;
        }
        v52 = &v51[80 * v47];
        *(_QWORD *)v52 = v17;
        *((_QWORD *)v52 + 1) = v19;
        *((double *)v52 + 2) = v41;
        *((_QWORD *)v52 + 3) = v21;
        *((_QWORD *)v52 + 4) = v28;
        *((_QWORD *)v52 + 5) = v29;
        *((_QWORD *)v52 + 6) = v36;
        *(NSRange *)(v52 + 56) = v34;
        *((_QWORD *)v52 + 9) = v14;
        v53 = v52;
        if (v44 == v46)
        {
          v42 = v79;
          v10 = v76;
        }
        else
        {
          v42 = v79;
          v10 = v76;
          do
          {
            *((_OWORD *)v53 - 5) = *((_OWORD *)v44 - 5);
            v54 = *((_OWORD *)v44 - 4);
            v55 = *((_OWORD *)v44 - 3);
            v56 = *((_OWORD *)v44 - 1);
            *((_OWORD *)v53 - 2) = *((_OWORD *)v44 - 2);
            *((_OWORD *)v53 - 1) = v56;
            *((_OWORD *)v53 - 4) = v54;
            *((_OWORD *)v53 - 3) = v55;
            v53 -= 80;
            v44 -= 80;
          }
          while (v44 != v46);
          v46 = *v79;
        }
        v45 = v52 + 80;
        *v42 = v53;
        v42[1] = v52 + 80;
        v42[2] = &v51[80 * v50];
        if (v46)
          operator delete(v46);
      }
      else
      {
        *(_QWORD *)v44 = v17;
        *((_QWORD *)v44 + 1) = v19;
        *((double *)v44 + 2) = v41;
        *((_QWORD *)v44 + 3) = v21;
        *((_QWORD *)v44 + 4) = v28;
        *((_QWORD *)v44 + 5) = v29;
        *((_QWORD *)v44 + 6) = v36;
        *(NSRange *)(v44 + 56) = v34;
        v45 = v44 + 80;
        *((_QWORD *)v44 + 9) = v14;
        v10 = v76;
      }
      v42[1] = v45;
    }
    while (v11 < v77);
  }
  *a5 = 0;
  a5[1] = 0;
  v57 = (void *)objc_msgSend(v10, "firstObject");
  if (objc_msgSend(v57, "countLines"))
    *a5 = (id)TSWPLineFragment::hintForAttachmentLayout((TSWPLineFragment *)objc_msgSend(v57, "lineFragmentAtIndex:", 0));
  v58 = (void *)objc_msgSend(v10, "lastObject");
  v59 = objc_msgSend(v58, "countLines");
  if (v59)
  {
    v60 = objc_msgSend(v58, "lineFragmentAtIndex:", v59 - 1);
    if ((*(_BYTE *)(v60 + 25) & 1) == 0)
      a5[1] = (id)TSWPLineFragment::hintForAttachmentLayout((TSWPLineFragment *)v60);
  }
  v61 = (void *)objc_msgSend(a3, "currentAnchoredDrawableLayouts");
  v62 = objc_msgSend(v61, "count");
  if (v62)
  {
    *a6 = (id)objc_msgSend(MEMORY[0x24BEB3D00], "dictionaryWithCapacity:", v62);
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v80, v84, 16);
    if (v63)
    {
      v64 = *(_QWORD *)v81;
      do
      {
        for (i = 0; i != v63; ++i)
        {
          if (*(_QWORD *)v81 != v64)
            objc_enumerationMutation(v61);
          v66 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
          v67 = objc_msgSend((id)objc_msgSend(v66, "info"), "owningAttachment");
          v68 = (void *)MEMORY[0x24BDD1968];
          objc_msgSend(v66, "alignmentFrame");
          objc_msgSend(*a6, "setObject:forUncopiedKey:", objc_msgSend(v68, "valueWithCGPoint:"), v67);
        }
        v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v80, v84, 16);
      }
      while (v63);
    }
  }
  if (v77)
  {
    charIndex = self->_cachedTopicNumbers._charIndex;
    if (charIndex != 0x7FFFFFFFFFFFFFFFLL && charIndex >= *((_QWORD *)*v79 + 4))
    {
      v70 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v71 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPLayoutManager deflateTarget:intoHints:childHints:anchoredAttachmentPositions:topicNumbers:layoutState:]");
      objc_msgSend(v70, "handleFailureInFunction:file:lineNumber:description:", v71, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayoutManager.mm"), 696, CFSTR("topic numbers are out of sync with layout"));
    }
  }
  TSWPTopicNumberHints::operator=((TSWPTopicNumberHints *)a7, &self->_cachedTopicNumbers);
  TSWPTopicNumberHints::reset(&self->_cachedTopicNumbers);
}

- (void)inflateTarget:(id)a3 fromHints:(const void *)a4 childHint:(id)a5 anchoredAttachmentPositions:(id)a6 topicNumbers:(const void *)a7
{
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  double v31;
  double v32;
  double *v33;
  double v34;
  TSWPStorage *storage;
  uint64_t v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  char HasOverlaps;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSUInteger v52;
  NSUInteger v53;
  uint64_t v54;
  NSUInteger v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  unint64_t v63;
  char *v64;
  char *v65;
  char v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  NSString *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  NSString *v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  uint64_t v89;
  NSUInteger v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  NSUInteger v94;
  uint64_t v97;
  void *v98;
  unint64_t v99;
  TSWPLayoutChore *v100;
  void *v101;
  unint64_t v103;
  unsigned int v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _BYTE v109[128];
  uint64_t v110;
  NSRange v111;
  NSRange v112;
  NSRange v113;
  _NSRange v114;

  v110 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend((id)objc_msgSend(a3, "columns"), "count"))
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPLayoutManager inflateTarget:fromHints:childHint:anchoredAttachmentPositions:topicNumbers:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayoutManager.mm"), 706, CFSTR("Newly created target should have 0 columns"));
  }
  objc_msgSend(a3, "setAnchoredDrawablesForRelayout:", objc_msgSend(MEMORY[0x24BDBCEB8], "array"));
  v85 = *(_QWORD *)a4;
  v86 = *((_QWORD *)a4 + 1);
  v99 = (v86 - *(_QWORD *)a4) / 80;
  v101 = (void *)objc_msgSend(a3, "columns");
  v83 = v99 - 1;
  v11 = (_QWORD *)(*(_QWORD *)a4 + 80 * (v99 - 1));
  v89 = v11[5];
  v90 = *(_QWORD *)(*(_QWORD *)a4 + 32);
  v97 = v11[7];
  v91 = v11[8];
  v93 = v11[4];
  v87 = -[TSWPLayoutManager p_layoutConfigFlagsForTarget:](self, "p_layoutConfigFlagsForTarget:", a3);
  -[TSWPStorage wpKind](self->_storage, "wpKind");
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v12 = (void *)objc_msgSend(a6, "allKeys");
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v105, v109, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v106;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v106 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "drawable");
        v18 = (void *)objc_msgSend(a3, "validatedLayoutForAnchoredDrawable:", v17);
        v19 = (void *)objc_msgSend(a6, "objectForKeyedSubscript:", v16);
        if (v19)
        {
          objc_msgSend(v19, "CGPointValue");
          v21 = v20;
          objc_msgSend(v18, "setInterimPositionX:");
          objc_msgSend(v18, "setInterimPositionY:", v21);
          objc_msgSend(v18, "fixTransformFromInterimPosition");
          objc_msgSend((id)objc_msgSend(a3, "anchoredDrawablesForRelayout"), "addObject:", v17);
        }
        else
        {
          v22 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v23 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPLayoutManager inflateTarget:fromHints:childHint:anchoredAttachmentPositions:topicNumbers:]");
          objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayoutManager.mm"), 730, CFSTR("invalid nil value for '%s'"), "value");
        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v105, v109, 16);
    }
    while (v13);
  }
  v94 = v89 + v93;
  v92 = (char *)(v91 + v97);
  v104 = 0;
  v24 = v99;
  v103 = 0;
  if (v99 <= 1)
    v24 = 1;
  v84 = v24;
  do
  {
    v100 = (TSWPLayoutChore *)operator new();
    TSWPLayoutColumnChore::TSWPLayoutColumnChore((uint64_t)v100, self->_storage, self->_owner, self, v87, v90, v94 - v90, v92, (TSWPTopicNumberHints *)a7);
    if (v86 != v85)
    {
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = v84;
      v29 = a5;
      do
      {
        v98 = v29;
        v30 = *(_QWORD *)a4;
        if ((*((_BYTE *)v100 + 32) & 0x10) != 0)
        {
          objc_msgSend(a3, "currentSize");
          v31 = v32 - CGRectGetMaxX(*(CGRect *)(v30 + v25));
          if ((*((_DWORD *)v100 + 8) & 0x10) != 0)
          {
            v33 = (double *)(v30 + 80 * v26 + 16);
            goto LABEL_23;
          }
        }
        else
        {
          v31 = *(double *)(v30 + v25 + 8);
        }
        v33 = (double *)(v30 + v25 + 24);
LABEL_23:
        v34 = *v33;
        storage = self->_storage;
        v36 = *(_QWORD *)(v30 + v25 + 32);
        v37 = -[TSWPLayoutManager styleProvider](self, "styleProvider");
        LOBYTE(v82) = (*((_DWORD *)v100 + 8) & 0x10) != 0;
        +[TSWPLayoutManager fixColumnBoundsForTarget:storage:charIndex:firstColumnIndex:precedingHeight:height:alreadyHasMargins:styleProvider:vertical:](TSWPLayoutManager, "fixColumnBoundsForTarget:storage:charIndex:firstColumnIndex:precedingHeight:height:alreadyHasMargins:styleProvider:vertical:", a3, storage, v36, v27, 1, v37, v31, v34, v82);
        v38 = objc_msgSend(v101, "count");
        if (v38 - v27 != *(_QWORD *)(v30 + v25 + 72))
        {
          v39 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v40 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPLayoutManager inflateTarget:fromHints:childHint:anchoredAttachmentPositions:topicNumbers:]");
          objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayoutManager.mm"), 762, CFSTR("Column count mismatch"));
        }
        v41 = (void *)objc_msgSend(v101, "objectAtIndexedSubscript:", v27);
        objc_msgSend(v41, "setRange:", *(_QWORD *)(v30 + v25 + 32), *(_QWORD *)(v30 + v25 + 40));
        objc_msgSend(v41, "setAnchoredRange:", *(_QWORD *)(v30 + v25 + 56), *(_QWORD *)(v30 + v25 + 64));
        TSWPLayoutColumnChore::layoutColumnsIntoTarget((NSUInteger)v100, a3, v27, *(_QWORD *)(v30 + v25 + 72), v98);
        objc_msgSend((id)objc_msgSend(v101, "lastObject"), "setNextWidowPullsDownFromCharIndex:", *(_QWORD *)(v30 + v25 + 48));
        if (objc_msgSend((id)objc_msgSend(v101, "lastObject"), "nextWidowPullsDownFromCharIndex") != *(_QWORD *)(v30 + v25 + 48))
        {
          v42 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v43 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPLayoutManager inflateTarget:fromHints:childHint:anchoredAttachmentPositions:topicNumbers:]");
          objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayoutManager.mm"), 775, CFSTR("bad nextWidowPullsDownFromCharIndex after inflation"));
        }
        a5 = 0;
        v29 = 0;
        ++v26;
        v25 += 80;
        v27 = v38;
        --v28;
      }
      while (v28);
    }
    HasOverlaps = TSWPLayoutChore::targetHasOverlaps((uint64_t)v100, &v104, &v103, a3);
    if ((HasOverlaps & 1) != 0)
    {
      v45 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v46 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPLayoutManager inflateTarget:fromHints:childHint:anchoredAttachmentPositions:topicNumbers:]");
      objc_msgSend(v45, "handleFailureInFunction:file:lineNumber:description:", v46, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayoutManager.mm"), 780, CFSTR("Unexpected overlap with anchored attachments"));
    }
    else
    {
      v47 = (void *)objc_msgSend(v101, "lastObject");
      if (!v47)
      {
        v48 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v49 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPLayoutManager inflateTarget:fromHints:childHint:anchoredAttachmentPositions:topicNumbers:]");
        objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", v49, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayoutManager.mm"), 797, CFSTR("invalid nil value for '%s'"), "column");
      }
      v50 = objc_msgSend(v47, "range");
      if (v94 <= v50 + v51)
        v52 = v50 + v51;
      else
        v52 = v94;
      if (v94 >= v50 + v51)
        v53 = v50 + v51;
      else
        v53 = v94;
      v54 = objc_msgSend(v101, "count");
      v55 = v52 - v53;
      if (v54)
      {
        v56 = v54 - 1;
        do
        {
          v57 = (void *)objc_msgSend(v101, "objectAtIndexedSubscript:", v56);
          v58 = objc_msgSend(v57, "range");
          if (v94 >= v58 + v59)
            break;
          objc_msgSend(v57, "trimToCharIndex:inTarget:removeAutoNumberFootnoteCount:", v94, a3, -[TSWPStorage autoNumberFootnoteCountForRange:](self->_storage, "autoNumberFootnoteCountForRange:", v53, v55));
          --v56;
        }
        while (v56 != -1);
      }
      v114.location = v53;
      v114.length = v55;
      TSWPLayoutChore::removeFootnotesInRange((id *)v100, v114);
      v60 = (void *)objc_msgSend(v101, "lastObject");
      if (!v60)
      {
        v61 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v62 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPLayoutManager inflateTarget:fromHints:childHint:anchoredAttachmentPositions:topicNumbers:]");
        objc_msgSend(v61, "handleFailureInFunction:file:lineNumber:description:", v62, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayoutManager.mm"), 819, CFSTR("invalid nil value for '%s'"), "column");
      }
      v63 = objc_msgSend(v60, "anchoredRange");
      if ((unint64_t)v92 >= v63)
        v64 = (char *)v63;
      else
        v64 = v92;
      if ((unint64_t)v92 >= v63)
        v65 = &v92[-v63];
      else
        v65 = 0;
      objc_msgSend(v60, "setAnchoredRange:", v64, v65);
      TSWPLayoutChore::postProcessDrawableAttachments((uint64_t)v100, a3);
    }
    (*(void (**)(TSWPLayoutChore *))(*(_QWORD *)v100 + 8))(v100);
    if (v104 < 2)
      v66 = HasOverlaps;
    else
      v66 = 0;
  }
  while ((v66 & 1) != 0);
  objc_msgSend(a3, "setAnchoredDrawablesForRelayout:", 0);
  v67 = (void *)objc_msgSend(v101, "lastObject");
  if (!v67)
  {
    v68 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v69 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPLayoutManager inflateTarget:fromHints:childHint:anchoredAttachmentPositions:topicNumbers:]");
    objc_msgSend(v68, "handleFailureInFunction:file:lineNumber:description:", v69, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayoutManager.mm"), 839, CFSTR("invalid nil value for '%s'"), "column");
  }
  v70 = objc_msgSend(v67, "range");
  if (v94 != v70 + v71)
  {
    v72 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v73 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPLayoutManager inflateTarget:fromHints:childHint:anchoredAttachmentPositions:topicNumbers:]");
    v74 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayoutManager.mm");
    v111.length = v94 - v90;
    v111.location = v90;
    v75 = NSStringFromRange(v111);
    v112.location = objc_msgSend(v67, "range");
    objc_msgSend(v72, "handleFailureInFunction:file:lineNumber:description:", v73, v74, 840, CFSTR("Inflation didn't match hint: column range mismatch: %@ vs %@"), v75, NSStringFromRange(v112));
  }
  v76 = objc_msgSend(v67, "anchoredRange");
  if (v92 != (char *)(v76 + v77))
  {
    v78 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v79 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPLayoutManager inflateTarget:fromHints:childHint:anchoredAttachmentPositions:topicNumbers:]");
    v80 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLayoutManager.mm");
    v81 = NSStringFromRange(*(NSRange *)(*(_QWORD *)a4 + 80 * v83 + 56));
    v113.location = objc_msgSend(v67, "anchoredRange");
    objc_msgSend(v78, "handleFailureInFunction:file:lineNumber:description:", v79, v80, 851, CFSTR("Inflation didn't match hint: anchor range mismatch: %@ vs %@"), v81, NSStringFromRange(v113));
  }
}

- (void)destroyLayoutState:(void *)a3
{
  if (a3)
    (*(void (**)(void *))(*(_QWORD *)a3 + 8))(a3);
}

- (TSWPLayoutOwner)owner
{
  return self->_owner;
}

- (TSWPStorage)storage
{
  return self->_storage;
}

- (_NSRange)dirtyRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_dirtyRange.length;
  location = self->_dirtyRange.location;
  result.length = length;
  result.location = location;
  return result;
}

@end
