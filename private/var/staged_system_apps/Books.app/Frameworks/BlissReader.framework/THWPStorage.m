@implementation THWPStorage

- (BOOL)usesApplicationFontScaling
{
  return self->mUsesApplicationFontScaling;
}

- (void)setUsesApplicationFontScaling:(BOOL)a3
{
  -[THWPStorage willModify](self, "willModify");
  self->mUsesApplicationFontScaling = a3;
}

- (THWPStorage)initWithContext:(id)a3
{
  THWPStorage *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWPStorage;
  result = -[THWPStorage initWithContext:](&v4, "initWithContext:", a3);
  if (result)
  {
    result->_fontSize = 0x7FFFFFFFFFFFFFFFLL;
    result->_applyTheme = 1;
  }
  return result;
}

- (unint64_t)wordCountInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  const __CFString *v6;
  CFStringTokenizerRef v7;
  __CFStringTokenizer *v8;
  unint64_t v9;
  CFRange v11;

  if (a3.location == 0x7FFFFFFFFFFFFFFFLL || a3.length == 0)
    return 0;
  length = a3.length;
  location = a3.location;
  v6 = (const __CFString *)-[THWPStorage string](self, "string");
  v11.location = location;
  v11.length = length;
  v7 = CFStringTokenizerCreate(0, v6, v11, 0, 0);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = -1;
  do
    ++v9;
  while (CFStringTokenizerAdvanceToNextToken(v8));
  CFRelease(v8);
  return v9;
}

- (void)contextualStringsForSelection:(_NSRange)a3 prefix:(id *)a4 suffix:(id *)a5
{
  NSUInteger length;
  NSUInteger location;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _BOOL4 v14;
  char *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  NSUInteger v24;
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;

  if (a3.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    length = a3.length;
    if (a3.length <= 0x100)
    {
      if ((unint64_t)a4 | (unint64_t)a5)
      {
        location = a3.location;
        v10 = (char *)-[THWPStorage selectionRangeForCharIndex:](self, "selectionRangeForCharIndex:");
        if (v10 != (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          v12 = v11;
          if (v11)
          {
            v13 = v10;
            if (-[THWPStorage wordCountInRange:](self, "wordCountInRange:", location, length) >= 9)
            {
              v17 = -[THWPStorage paragraphIndexRangeForCharRange:](self, "paragraphIndexRangeForCharRange:", location, length);
              if (v17 == (id)0x7FFFFFFFFFFFFFFFLL || v18 != 1)
                return;
              v15 = (char *)-[THWPStorage textRangeForParagraphAtIndex:](self, "textRangeForParagraphAtIndex:", v17);
              v16 = v19;
              v14 = v19 != 0;
            }
            else
            {
              v14 = 1;
              v15 = v13;
              v16 = v12;
            }
            if (v15 != (char *)0x7FFFFFFFFFFFFFFFLL && v14)
            {
              if (a4)
              {
                v20 = location <= (unint64_t)(v15 + 64) ? v15 : (char *)(location - 64);
                if ((unint64_t)v20 < location)
                {
                  v21 = (char *)-[THWPStorage wordAtCharIndex:includePreviousWord:](self, "wordAtCharIndex:includePreviousWord:", v20, 0);
                  if (v21 != (char *)0x7FFFFFFFFFFFFFFFLL
                    || (v21 = (char *)-[THWPStorage nextWordFromIndex:forward:](self, "nextWordFromIndex:forward:", v20, 1), v21 != (char *)0x7FFFFFFFFFFFFFFFLL))
                  {
                    v23 = v21;
                    if (v21 < v20)
                      v23 = (char *)-[THWPStorage nextWordFromIndex:forward:](self, "nextWordFromIndex:forward:", v21, 1);
                    if (v23 != (char *)0x7FFFFFFFFFFFFFFFLL && v23 >= v15 && (unint64_t)&v23[v22] <= location)
                      *a4 = -[THWPStorage substringWithRange:](self, "substringWithRange:", v23, location - (_QWORD)v23);
                  }
                }
              }
              if (a5)
              {
                v24 = location + length;
                v25 = v24 + 64 >= (unint64_t)&v15[v16] ? &v15[v16] : (char *)(v24 + 64);
                if ((unint64_t)v25 > v24 && v25 <= &v13[v12])
                {
                  v26 = (char *)-[THWPStorage wordAtCharIndex:includePreviousWord:](self, "wordAtCharIndex:includePreviousWord:", v25, 1);
                  if (v26 != (char *)0x7FFFFFFFFFFFFFFFLL
                    || (v26 = (char *)-[THWPStorage nextWordFromIndex:forward:](self, "nextWordFromIndex:forward:", v25, 0), v26 != (char *)0x7FFFFFFFFFFFFFFFLL))
                  {
                    v28 = &v26[v27];
                    if (&v26[v27] > v25)
                    {
                      v26 = (char *)-[THWPStorage nextWordFromIndex:forward:](self, "nextWordFromIndex:forward:");
                      if (v26 == (char *)0x7FFFFFFFFFFFFFFFLL)
                        return;
                      v28 = &v26[v29];
                    }
                    if ((unint64_t)v26 >= v24 && v28 <= &v15[v16])
                      *a5 = -[THWPStorage substringWithRange:](self, "substringWithRange:", v24, &v28[-v24]);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

- (void)p_freeAnnotationRanges
{
  _NSRange *mAnnotationRanges;

  self->mAnnotationCount = 0;
  mAnnotationRanges = self->mAnnotationRanges;
  if (mAnnotationRanges)
  {
    free(mAnnotationRanges);
    self->mAnnotationRanges = 0;
  }
}

- (void)dealloc
{
  objc_super v3;

  -[THWPAnnotationSource removeInterest:](self->mAnnotationSource, "removeInterest:", self);

  self->mAnnotationSource = 0;
  -[THWPStorage p_freeAnnotationRanges](self, "p_freeAnnotationRanges");
  v3.receiver = self;
  v3.super_class = (Class)THWPStorage;
  -[THWPStorage dealloc](&v3, "dealloc");
}

- (void)updateAnnotationSourceWithContentNode:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  THCoreDataAnnotationSource *v9;

  if (!self->_annotationSourceOnceToken)
  {
    objc_sync_enter(self);
    if (!self->_annotationSourceOnceToken)
    {
      v6 = objc_opt_class(THDocumentRoot, v5);
      v7 = (void *)TSUDynamicCast(v6, objc_msgSend(-[THWPStorage context](self, "context"), "documentRoot"));
      v8 = objc_msgSend(a3, "annotationIDForInfo:", self);
      if (v8)
      {
        v9 = -[THCoreDataAnnotationSource initWithAnnotationController:contentNode:storageId:storageLength:]([THCoreDataAnnotationSource alloc], "initWithAnnotationController:contentNode:storageId:storageLength:", objc_msgSend(v7, "annotationController"), a3, v8, -[THWPStorage length](self, "length"));
        -[THWPStorage setAnnotationSource:](self, "setAnnotationSource:", v9);

        self->_annotationSourceOnceToken = 1;
      }
    }
    objc_sync_exit(self);
  }
}

- (THWPAnnotationSource)annotationSource
{
  return self->mAnnotationSource;
}

- (void)setAnnotationSource:(id)a3
{
  THWPAnnotationSource *mAnnotationSource;
  THWPAnnotationSource *v5;

  mAnnotationSource = self->mAnnotationSource;
  if (mAnnotationSource != a3)
  {
    v5 = (THWPAnnotationSource *)a3;
    self->mAnnotationSource = v5;
    -[THWPAnnotationSource addInterest:](v5, "addInterest:", self);
    if (mAnnotationSource)
    {
      -[THWPAnnotationSource removeInterest:](mAnnotationSource, "removeInterest:", self);

    }
    -[THWPStorage p_reloadAnnotations](self, "p_reloadAnnotations");
  }
}

- (void)annotationsChangedInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;

  length = a3.length;
  location = a3.location;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPStorage annotationsChangedInRange:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THWPStorage.mm"), 234, CFSTR("This operation must only be performed on the main thread."));
  if (length)
  {
    -[THWPStorage p_reloadAnnotations](self, "p_reloadAnnotations");
    -[THWPStorage styleDidChangeInRange:](self, "styleDidChangeInRange:", location, length);
  }
}

- (void)p_reloadAnnotations
{
  THWPAnnotationSource *v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  _NSRange *v10;
  uint64_t v11;
  NSUInteger *p_length;
  id v13;
  unsigned int v14;
  NSUInteger v15;
  uint64_t v16;

  objc_sync_enter(self);
  -[THWPStorage p_freeAnnotationRanges](self, "p_freeAnnotationRanges");
  v3 = -[THWPStorage annotationSource](self, "annotationSource");
  v4 = -[THWPStorage rangeOfInterest](self, "rangeOfInterest");
  v6 = -[THWPAnnotationSource annotationsForRange:](v3, "annotationsForRange:", v4, v5);
  v7 = v6;
  if (v6)
  {
    v8 = (unint64_t)objc_msgSend(v6, "count");
    v9 = v8;
    if (v8)
    {
      v10 = (_NSRange *)malloc_type_malloc(16 * v8, 0x1000040451B5BE8uLL);
      v11 = 0;
      p_length = &v10->length;
      do
      {
        v13 = objc_msgSend(v7, "objectAtIndex:", v11);
        v14 = objc_msgSend(v13, "annotationStyle");
        v15 = 0;
        v16 = 0x7FFFFFFFFFFFFFFFLL;
        if (v14 && v14 != 6)
          v16 = (uint64_t)objc_msgSend(v13, "annotationStorageRange");
        *(p_length - 1) = v16;
        *p_length = v15;
        ++v11;
        p_length += 2;
      }
      while (v9 != v11);
      self->mAnnotationCount = v9;
      self->mAnnotationRanges = v10;
    }
  }
  objc_sync_exit(self);
}

- (_NSRange)rangeOfInterest
{
  id v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[THWPStorage length](self, "length");
  v3 = 0;
  result.length = (NSUInteger)v2;
  result.location = v3;
  return result;
}

- (double)p_applicationFontScaleWithFilterDelegate:(id)a3
{
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  id v10;
  double result;

  if (a3 && (objc_opt_respondsToSelector(a3, "fontSizeForTextSource:") & 1) != 0)
  {
    v5 = objc_msgSend(a3, "fontSizeForTextSource:", self);
    v6 = +[THApplicationSettings sharedSettings](THApplicationSettings, "sharedSettings");
    v7 = (unint64_t)v5;
  }
  else
  {
    v8 = -[THWPStorage fontSize](self, "fontSize");
    v9 = +[THApplicationSettings sharedSettings](THApplicationSettings, "sharedSettings");
    v10 = v9;
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v9, "flowFontScale");
      return result;
    }
    v7 = -[THWPStorage fontSize](self, "fontSize");
    v6 = v10;
  }
  objc_msgSend(v6, "flowFontScaleForFontSize:", v7);
  return result;
}

- (double)filteredCoreTextAttributesFontScaleEffectiveRange:(_NSRange *)a3 filterDelegate:(id)a4
{
  unsigned int v7;
  double result;

  if (a4)
  {
    v7 = objc_msgSend(a4, "shouldFilterTextSource:", self);
    if (!a3)
      return 1.0;
  }
  else
  {
    v7 = 1;
    if (!a3)
      return 1.0;
  }
  if (v7
    && a3->length
    && (-[THWPStorage usesApplicationFontScaling](self, "usesApplicationFontScaling")
     || a4
     && (objc_opt_respondsToSelector(a4, "useApplicationFontScaleForTextSource:") & 1) != 0
     && objc_msgSend(a4, "useApplicationFontScaleForTextSource:", self)))
  {
    -[THWPStorage p_applicationFontScaleWithFilterDelegate:](self, "p_applicationFontScaleWithFilterDelegate:", a4);
    return result;
  }
  return 1.0;
}

- (__CFDictionary)createFilteredCoreTextAttributes:(__CFDictionary *)a3 effectiveRange:(_NSRange *)a4 filterDelegate:(id)a5
{
  unsigned int v9;
  double v10;
  double v11;
  const __CTFont *v12;
  const __CTFont *v13;
  double v14;
  __CFString *v15;
  uint64_t v16;
  unint64_t v17;
  _NSRange *mAnnotationRanges;
  NSRange v19;
  NSUInteger location;
  NSRange v21;
  NSUInteger length;
  NSUInteger v23;
  id v24;
  __CFDictionary *MutableCopy;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  TSUColor *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *value;

  if (a5)
  {
    v9 = objc_msgSend(a5, "shouldFilterTextSource:", self);
    if (!a4)
      goto LABEL_40;
  }
  else
  {
    v9 = 1;
    if (!a4)
    {
LABEL_40:
      CFRetain(a3);
      return a3;
    }
  }
  if (!v9 || !a4->length)
    goto LABEL_40;
  if ((-[THWPStorage usesApplicationFontScaling](self, "usesApplicationFontScaling")
     || a5
     && (objc_opt_respondsToSelector(a5, "useApplicationFontScaleForTextSource:") & 1) != 0
     && objc_msgSend(a5, "useApplicationFontScaleForTextSource:", self))
    && (-[THWPStorage p_applicationFontScaleWithFilterDelegate:](self, "p_applicationFontScaleWithFilterDelegate:", a5),
        v11 = v10,
        v10 != 1.0)
    && (v12 = (const __CTFont *)CFDictionaryGetValue(a3, kCTFontAttributeName)) != 0)
  {
    v13 = v12;
    v14 = v11 * CTFontGetSize(v12);
    v15 = (__CFString *)CTFontCopyPostScriptName(v13);
    value = (void *)TSWPCreateFontWithName(v14);

  }
  else
  {
    value = 0;
  }
  objc_sync_enter(self);
  if (self->mAnnotationCount)
  {
    v16 = 0;
    v17 = 0;
    do
    {
      mAnnotationRanges = self->mAnnotationRanges;
      v19.length = mAnnotationRanges[v16].length;
      if (v19.length)
      {
        location = mAnnotationRanges[v16].location;
        v19.location = location;
        v21 = NSIntersectionRange(*a4, v19);
        if (v21.length)
        {
          if (a4->location >= location)
            length = v21.length;
          else
            length = 0;
          v23 = v21.location + length - a4->location;
          if (v23)
            a4->length = v23;
          else
            objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPStorage createFilteredCoreTextAttributes:effectiveRange:filterDelegate:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THWPStorage.mm"), 370, CFSTR("Bad effective range calculation."));
        }
      }
      ++v17;
      ++v16;
    }
    while (v17 < self->mAnnotationCount);
  }
  objc_sync_exit(self);
  v24 = (id)CFDictionaryGetValue(a3, kCTForegroundColorAttributeName);
  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, a3);
  v27 = objc_opt_class(THDocumentRoot, v26);
  v28 = (void *)TSUDynamicCast(v27, objc_msgSend(-[THWPStorage context](self, "context"), "documentRoot"));
  if (-[THWPStorage applyTheme](self, "applyTheme") && objc_msgSend(v28, "themeProvider"))
  {
    v29 = +[TSUColor colorWithCGColor:](TSUColor, "colorWithCGColor:", v24);
    if ((-[TSUColor isAlmostEqualToColor:](v29, "isAlmostEqualToColor:", +[TSUColor blackColor](TSUColor, "blackColor")) & 1) != 0|| (objc_msgSend(objc_msgSend(v28, "themeProvider"), "forceThemeColors") & 1) != 0)
    {
      goto LABEL_36;
    }
    -[TSUColor relativeLuminance](+[TSUColor colorWithCGColor:](TSUColor, "colorWithCGColor:", objc_msgSend(objc_msgSend(v28, "themeProvider"), "backgroundColor")), "relativeLuminance");
    v31 = v30;
    -[TSUColor relativeLuminance](v29, "relativeLuminance");
    if (v32 <= v31)
      v33 = v31;
    else
      v33 = v32;
    v34 = v33 + 0.05;
    if (v32 >= v31)
      v32 = v31;
    if (v34 / (v32 + 0.05) < 1.4)
LABEL_36:
      v24 = objc_msgSend(objc_msgSend(v28, "themeProvider"), "textColor");
  }
  CFDictionarySetValue(MutableCopy, kCTForegroundColorAttributeName, v24);
  if (value)
  {
    CFDictionarySetValue(MutableCopy, kCTFontAttributeName, value);
    CFRelease(value);
  }
  if (!MutableCopy)
    goto LABEL_40;
  return MutableCopy;
}

- (BOOL)supportsSections
{
  return 0;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(THWPLayout, a2);
}

- (Class)repClass
{
  return (Class)objc_opt_class(THWPRep, a2);
}

- (id)documentRoot
{
  return objc_msgSend(-[THWPStorage context](self, "context"), "documentRoot");
}

- (_NSRange)p_closestMatchForString:(id)a3 startCharIndex:(unint64_t)a4
{
  unint64_t v4;
  id v7;
  id v8;
  char *v9;
  _BYTE *v10;
  char *v11;
  char *v12;
  char *v13;
  id v14;
  unint64_t v15;
  char *v16;
  char *v17;
  NSUInteger v18;
  NSUInteger v19;
  _NSRange result;

  v4 = a4;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPStorage p_closestMatchForString:startCharIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THWPStorage.mm"), 446, CFSTR("invalid start range"));
  v7 = -[THWPStorage string](self, "string");
  v8 = objc_msgSend(a3, "length");
  if (v8 <= objc_msgSend(v7, "length") && objc_msgSend(a3, "length") && objc_msgSend(v7, "length"))
  {
    v9 = (char *)objc_msgSend(a3, "length");
    if (&v9[v4] > objc_msgSend(v7, "length"))
    {
      v10 = objc_msgSend(v7, "length");
      v4 = v10 - (_BYTE *)objc_msgSend(a3, "length");
    }
    if ((objc_msgSend(objc_msgSend(v7, "substringWithRange:", v4, v9), "isEqualToString:", a3) & 1) == 0)
    {
      v11 = (char *)objc_msgSend(v7, "rangeOfString:options:range:", a3, 1, v4, (char *)objc_msgSend(v7, "length") - v4);
      v13 = v12;
      v14 = objc_msgSend(v7, "rangeOfString:options:range:", a3, 5, 0, &v9[v4]);
      v15 = (unint64_t)v14;
      v9 = v16;
      if (v11 == (char *)0x7FFFFFFFFFFFFFFFLL || v14 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        if (v11 == (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          v4 = (unint64_t)v14;
        }
        else
        {
          v9 = v13;
          v4 = (unint64_t)v11;
        }
      }
      else
      {
        v17 = (char *)(v4 - (_QWORD)v14);
        if (v4 < (unint64_t)v14 || (unint64_t)v11 < v4)
          objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPStorage p_closestMatchForString:startCharIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THWPStorage.mm"), 473, CFSTR("backward and forward ranges shouldn't cross the startCharIndex"));
        if (&v11[-v4] > v17)
        {
          v4 = v15;
        }
        else
        {
          v9 = v13;
          v4 = (unint64_t)v11;
        }
      }
    }
  }
  else
  {
    v9 = 0;
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v18 = v4;
  v19 = (NSUInteger)v9;
  result.length = v19;
  result.location = v18;
  return result;
}

- (_NSRange)closestMatchForString:(id)a3 leftContext:(id)a4 rightContext:(id)a5 startCharIndex:(unint64_t)a6
{
  id v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  id v19;
  char *v20;
  NSUInteger v21;
  NSUInteger v22;
  NSUInteger v23;
  NSUInteger v24;
  _NSRange result;

  if (a6 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPStorage closestMatchForString:leftContext:rightContext:startCharIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THWPStorage.mm"), 499, CFSTR("invalid start range"));
  if (!a3)
    a3 = &stru_43D7D8;
  if (!a4)
    a4 = &stru_43D7D8;
  if (!a5)
    a5 = &stru_43D7D8;
  if (!objc_msgSend(a4, "length") && !objc_msgSend(a5, "length"))
    goto LABEL_21;
  v11 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@%@%@"), a4, a3, a5);
  if ((unint64_t)objc_msgSend(a4, "length") >= a6)
    v12 = 0;
  else
    v12 = a6 - (_QWORD)objc_msgSend(a4, "length");
  v13 = (char *)-[THWPStorage p_closestMatchForString:startCharIndex:](self, "p_closestMatchForString:startCharIndex:", v11, v12);
  if (v13 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {

    goto LABEL_21;
  }
  v15 = v13;
  v16 = v14;
  if (v14 != objc_msgSend(v11, "length"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPStorage closestMatchForString:leftContext:rightContext:startCharIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THWPStorage.mm"), 517, CFSTR("match range should match context string length"));
  v17 = (char *)objc_msgSend(a4, "length");
  if (v16 < &v17[(_QWORD)objc_msgSend(a5, "length")])
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPStorage closestMatchForString:leftContext:rightContext:startCharIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THWPStorage.mm"), 518, CFSTR("can't subtract context from match range"));
  v18 = &v15[(_QWORD)objc_msgSend(a4, "length")];
  v19 = objc_msgSend(a4, "length");
  v20 = (char *)objc_msgSend(a5, "length");

  if (v18 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_21:
    v18 = (char *)-[THWPStorage p_closestMatchForString:startCharIndex:](self, "p_closestMatchForString:startCharIndex:", a3, a6);
    v22 = v21;
    v23 = 0x7FFFFFFFFFFFFFFFLL;
    if (v18 == (char *)0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_27;
    goto LABEL_24;
  }
  v22 = v16 - &v20[(_QWORD)v19];
LABEL_24:
  if (&v18[v22] > -[THWPStorage length](self, "length"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPStorage closestMatchForString:leftContext:rightContext:startCharIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THWPStorage.mm"), 532, CFSTR("bogus match range"));
  v23 = (NSUInteger)v18;
LABEL_27:
  v24 = v22;
  result.length = v24;
  result.location = v23;
  return result;
}

- (BOOL)rangeContainsAttachment:(_NSRange)a3
{
  uint64_t v3;

  -[THWPStorage attachmentIndexRangeForTextRange:](self, "attachmentIndexRangeForTextRange:", a3.location, a3.length);
  return v3 != 0;
}

- (BOOL)preventHighlighting
{
  return self->mPreventHighlighting;
}

- (void)setPreventHighlighting:(BOOL)a3
{
  self->mPreventHighlighting = a3;
}

- (unint64_t)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(unint64_t)a3
{
  self->_fontSize = a3;
}

- (BOOL)applyTheme
{
  return self->_applyTheme;
}

- (void)setApplyTheme:(BOOL)a3
{
  self->_applyTheme = a3;
}

@end
