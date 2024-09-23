@implementation SXTextTangierStorage

- (SXTextTangierStorage)initWithContext:(id)a3 stylesheet:(id)a4 storageKind:(int)a5 string:(id)a6 locale:(id)a7
{
  uint64_t v9;
  id v13;
  objc_class *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  SXTextTangierStorage *v20;
  NSCache *v21;
  NSCache *tokenizersCache;
  objc_super v24;

  v9 = *(_QWORD *)&a5;
  v13 = a7;
  v14 = (objc_class *)MEMORY[0x24BEB3B58];
  v15 = a6;
  v16 = a4;
  v17 = a3;
  v18 = (void *)objc_msgSend([v14 alloc], "initWithContext:", v17);
  objc_msgSend(MEMORY[0x24BEB3B50], "defaultStyleWithContext:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)SXTextTangierStorage;
  v20 = -[TSWPStorage initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:](&v24, sel_initWithContext_string_kind_stylesheet_paragraphStyle_listStyle_section_columnStyle_, v17, v15, v9, v16, v18, v19, 0, 0);

  if (v20)
  {
    objc_storeStrong((id *)&v20->_locale, a7);
    v21 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    tokenizersCache = v20->_tokenizersCache;
    v20->_tokenizersCache = v21;

    v20->_unfairLock._os_unfair_lock_opaque = 0;
  }

  return v20;
}

- (BOOL)supportsSections
{
  return 0;
}

- (void)setRangedExclusionPaths:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  uint64_t i;
  double *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  double *v31;
  void *v32;
  _BOOL4 IsRect;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  id v38;
  void *v39;
  SXTextTangierAttachmentInfo *v40;
  void *v41;
  SXTextTangierAttachmentInfo *v42;
  _BOOL8 v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  id obj;
  uint64_t v53;
  SXTextTangierStorage *v54;
  uint64_t v55;
  CGRect rect;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v51 = a3;
  objc_storeStrong((id *)&self->_rangedExclusionPaths, a3);
  -[SXTextTangierStorage attachments](self, "attachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[SXTextTangierStorage setAttachments:](self, "setAttachments:", v6);

  }
  -[SXTextTangierStorage attachments](self, "attachments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 - 1 >= 0)
  {
    do
    {
      --v8;
      -[SXTextTangierStorage attachments](self, "attachments");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      objc_msgSend(v10, "drawable");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      TSUDynamicCast();
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = objc_msgSend(v12, "actualRange");
        -[TSWPStorage deleteRange:undoTransaction:](self, "deleteRange:undoTransaction:", v13, v14, 0);
      }

    }
    while (v8 > 0);
  }
  -[SXTextTangierStorage attachments](self, "attachments");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeAllObjects");

  -[SXTextTangierStorage rangedExclusionPaths](self, "rangedExclusionPaths");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sortedArrayUsingComparator:", &__block_literal_global_34);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v18;
  v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
  if (v55)
  {
    v53 = *(_QWORD *)v62;
    v19 = *MEMORY[0x24BDBEFB0];
    v20 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v54 = self;
    do
    {
      for (i = 0; i != v55; ++i)
      {
        if (*(_QWORD *)v62 != v53)
          objc_enumerationMutation(obj);
        v22 = *(double **)(*((_QWORD *)&v61 + 1) + 8 * i);
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        -[SXTextTangierStorage attachments](self, "attachments");
        v23 = (id)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v58;
          while (2)
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v58 != v26)
                objc_enumerationMutation(v23);
              v28 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
              objc_opt_class();
              objc_msgSend(v28, "drawable");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              TSUDynamicCast();
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              if (v30)
              {
                objc_msgSend(v30, "exclusionPath");
                v31 = (double *)objc_claimAutoreleasedReturnValue();

                if (v31 == v22)
                {
                  self = v54;
                  goto LABEL_31;
                }
              }
            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
            if (v25)
              continue;
            break;
          }
        }

        -[SXTextExclusionPath path](v22);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        memset(&rect, 0, sizeof(rect));
        v23 = objc_retainAutorelease(v32);
        IsRect = CGPathIsRect((CGPathRef)objc_msgSend(v23, "CGPath"), &rect);
        if (!IsRect)
        {
          objc_msgSend(v23, "bounds");
          rect.origin.x = v34;
          rect.origin.y = v35;
          rect.size.width = v36;
          rect.size.height = v37;
        }
        v38 = objc_alloc(MEMORY[0x24BEB3A88]);
        v39 = (void *)objc_msgSend(v38, "initWithPosition:size:", v19, v20, rect.size.width, rect.size.height);
        v40 = [SXTextTangierAttachmentInfo alloc];
        self = v54;
        -[TSPObject context](v54, "context");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = -[TSDDrawableInfo initWithContext:geometry:](v40, "initWithContext:geometry:", v41, v39);

        v43 = !IsRect;
        v44 = 1;
        objc_msgSend(MEMORY[0x24BEB3A78], "exteriorTextWrapWithIsHTMLWrap:type:direction:fitType:margin:alphaThreshold:", 0, 1, 2, v43, 0.0, 0.0);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[TSDDrawableInfo setExteriorTextWrap:](v42, "setExteriorTextWrap:", v45);

        -[SXTextTangierAttachmentInfo setExclusionPath:](v42, "setExclusionPath:", v22);
        if (-[SXTextExclusionPath lineVerticalAlignment]((uint64_t)v22) != 1)
        {
          if (-[SXTextExclusionPath lineVerticalAlignment]((uint64_t)v22) == 2)
          {
            v44 = 2;
          }
          else if (-[SXTextExclusionPath lineVerticalAlignment]((uint64_t)v22) == 3)
          {
            v44 = 3;
          }
          else
          {
            v44 = 4 * (-[SXTextExclusionPath lineVerticalAlignment]((uint64_t)v22) == 4);
          }
        }
        v46 = objc_alloc(MEMORY[0x24BEB3B00]);
        -[TSPObject context](v54, "context");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = (void *)objc_msgSend(v46, "initWithContext:drawable:", v47, v42);

        objc_msgSend(v48, "setHOffset:", -[SXTextExclusionPath position]((uint64_t)v22));
        objc_msgSend(v48, "setVOffset:", 0.0);
        objc_msgSend(v48, "setVAlignment:", v44);
        objc_msgSend(v48, "setAttachmentAnchorY:", -[SXTextExclusionPath verticalAlignmentFactor]((uint64_t)v22));
        v49 = -[SXTextTangierStorage insertAttachmentOrFootnote:range:](v54, "insertAttachmentOrFootnote:range:", v48, -[SXTextExclusionPath range]((uint64_t)v22), 0);
        -[SXTextTangierAttachmentInfo setActualRange:](v42, "setActualRange:", v49, v50);

LABEL_31:
      }
      v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    }
    while (v55);
  }

}

uint64_t __48__SXTextTangierStorage_setRangedExclusionPaths___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = -[SXTextExclusionPath range]((uint64_t)v4);
  if (v6 <= -[SXTextExclusionPath range]((uint64_t)v5))
  {
    v8 = -[SXTextExclusionPath range]((uint64_t)v4);
    v7 = v8 < -[SXTextExclusionPath range]((uint64_t)v5);
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (_NSRange)insertAttachmentOrFootnote:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  id v8;
  NSUInteger v9;
  NSUInteger v10;
  void *v11;
  NSUInteger v12;
  NSUInteger v13;
  objc_super v14;
  _NSRange result;

  length = a4.length;
  location = a4.location;
  v14.receiver = self;
  v14.super_class = (Class)SXTextTangierStorage;
  v7 = a3;
  v8 = -[TSWPStorage insertAttachmentOrFootnote:range:](&v14, sel_insertAttachmentOrFootnote_range_, v7, location, length);
  v10 = v9;
  -[SXTextTangierStorage attachments](self, "attachments", v14.receiver, v14.super_class);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v7);

  v12 = (NSUInteger)v8;
  v13 = v10;
  result.length = v13;
  result.location = v12;
  return result;
}

- (_NSRange)wordAtCharIndex:(unint64_t)a3 includePreviousWord:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  NSUInteger v10;
  __CFString *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  NSUInteger v22;
  NSUInteger v23;
  int v24;
  void *v25;
  void *v26;
  __CFStringTokenizer *v27;
  void *v28;
  CFStringTokenizerTokenType v29;
  CFIndex length;
  CFIndex location;
  CFRange CurrentTokenRange;
  NSUInteger v33;
  NSUInteger v34;
  NSUInteger v35;
  NSUInteger v36;
  _NSRange result;
  CFRange v38;

  v4 = a4;
  v7 = -[TSWPStorage textRangeForParagraphAtCharIndex:](self, "textRangeForParagraphAtCharIndex:");
  v9 = v8;
  v10 = *MEMORY[0x24BEB3BF0];
  v35 = *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8);
  -[TSWPStorage string](self, "string");
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v12 = -[TSWPStorage length](self, "length");
  v13 = v7 + v9;
  v36 = v10;
  if (a3 >= v7 && a3 - v7 < v9)
  {
    if (v12 < v13)
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SXTextTangierStorage wordAtCharIndex:includePreviousWord:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/FeldsparServicesUI/Modules/silex/Silex/Text/Tangier/SXTextTangierStorage.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, v16, 174, CFSTR("Specified range is out of range of string"));

LABEL_14:
      v23 = v35;
      v22 = v36;
LABEL_32:

      goto LABEL_33;
    }
    goto LABEL_9;
  }
  if (v12 < v13)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SXTextTangierStorage wordAtCharIndex:includePreviousWord:]");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/FeldsparServicesUI/Modules/silex/Silex/Text/Tangier/SXTextTangierStorage.m");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, v19, 174, CFSTR("Specified range is out of range of string"));

    if (v13 == a3)
      goto LABEL_24;
LABEL_13:
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SXTextTangierStorage wordAtCharIndex:includePreviousWord:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/FeldsparServicesUI/Modules/silex/Silex/Text/Tangier/SXTextTangierStorage.m");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, v21, 175, CFSTR("Character index out of range"));

    goto LABEL_14;
  }
  if (v13 != a3)
    goto LABEL_13;
LABEL_9:
  if (CFStringGetLength(v11) <= a3)
  {
    v20 = 0;
  }
  else
  {
    v20 = 0;
    if (CFStringGetCharacterAtIndex(v11, a3) && v13 > a3)
      v20 = IsWhitespaceCharacter() ^ 1;
  }
  if (v4 && a3 > v7)
  {
    CFStringGetCharacterAtIndex(v11, a3 - 1);
    v24 = IsWhitespaceCharacter();
    v20 |= v24 ^ 1;
    if (!v24)
      --a3;
  }
  if (v20 && v9)
  {
    -[TSWPStorage string](self, "string");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "substringWithRange:", v7, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_lock_with_options();
    -[SXTextTangierStorage tokenizersCache](self, "tokenizersCache");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(&self->_unfairLock);
    if (v15)
    {
      CFRetain(v15);
      v27 = (__CFStringTokenizer *)v15;
      v23 = v35;
      v22 = v36;
    }
    else
    {
      v38.location = v7;
      v38.length = v9;
      v27 = CFStringTokenizerCreate(0, v11, v38, 4uLL, 0);
      os_unfair_lock_lock_with_options();
      -[SXTextTangierStorage tokenizersCache](self, "tokenizersCache");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKey:", v27, v14);

      os_unfair_lock_unlock(&self->_unfairLock);
      v23 = v35;
      v22 = v36;
      if (!v27)
        goto LABEL_32;
    }
    v29 = CFStringTokenizerGoToTokenAtIndex(v27, a3);
    length = 0;
    location = -1;
    if (v29 && (v29 & 0x10) == 0)
    {
      CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v27);
      length = CurrentTokenRange.length;
      location = CurrentTokenRange.location;
    }
    if (location != -1 && length != 0)
    {
      v23 = length;
      v22 = location;
    }
    CFRelease(v27);
    goto LABEL_32;
  }
LABEL_24:
  v23 = v35;
  v22 = v36;
LABEL_33:
  v33 = v22;
  v34 = v23;
  result.length = v34;
  result.location = v33;
  return result;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SXTextTangierStorage tokenizersCache](self, "tokenizersCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[SXTextTangierStorage setTokenizersCache:](self, "setTokenizersCache:", 0);
  v4.receiver = self;
  v4.super_class = (Class)SXTextTangierStorage;
  -[TSWPStorage dealloc](&v4, sel_dealloc);
}

- (NSLocale)locale
{
  return self->_locale;
}

- (BOOL)isSelectable
{
  return self->_isSelectable;
}

- (void)setIsSelectable:(BOOL)a3
{
  self->_isSelectable = a3;
}

- (BOOL)shouldHyphenate
{
  return self->_shouldHyphenate;
}

- (void)setShouldHyphenate:(BOOL)a3
{
  self->_shouldHyphenate = a3;
}

- (NSSet)rangedExclusionPaths
{
  return self->_rangedExclusionPaths;
}

- (NSMutableArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_attachments, a3);
}

- (NSCache)tokenizersCache
{
  return self->_tokenizersCache;
}

- (void)setTokenizersCache:(id)a3
{
  objc_storeStrong((id *)&self->_tokenizersCache, a3);
}

- (os_unfair_lock_s)unfairLock
{
  return self->_unfairLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenizersCache, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_rangedExclusionPaths, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
