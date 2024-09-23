@implementation UIWebPDFSearchOperation

- (UIWebPDFSearchOperation)init
{
  UIWebPDFSearchOperation *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIWebPDFSearchOperation;
  v2 = -[UIWebPDFSearchOperation init](&v4, sel_init);
  if (v2)
  {
    v2->_results = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[UIWebPDFSearchOperation setResultLimit:](v2, "setResultLimit:", 101);
    -[UIWebPDFSearchOperation setDocumentScale:](v2, "setDocumentScale:", 1.0);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[UIWebPDFSearchOperation setDocumentToSearch:](self, "setDocumentToSearch:", 0);
  -[UIWebPDFSearchOperation setSearchString:](self, "setSearchString:", 0);

  v3.receiver = self;
  v3.super_class = (Class)UIWebPDFSearchOperation;
  -[UIWebPDFSearchOperation dealloc](&v3, sel_dealloc);
}

- (BOOL)_hitSearchLimit
{
  unint64_t totalResultsCount;

  totalResultsCount = self->_totalResultsCount;
  return totalResultsCount >= -[UIWebPDFSearchOperation resultLimit](self, "resultLimit");
}

- (void)_notifyDelegateOfStatus
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__UIWebPDFSearchOperation__notifyDelegateOfStatus__block_invoke;
  block[3] = &unk_1E16B41B8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __50__UIWebPDFSearchOperation__notifyDelegateOfStatus__block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  v3 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(*(id *)(v3 + 312), "searchWasCancelled:");
    return objc_msgSend(*(id *)(a1 + 32), "setSearchDelegate:", 0);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280) = objc_msgSend(*(id *)(v3 + 248), "count");
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v5 + 280))
    {
      objc_msgSend(*(id *)(v5 + 312), "search:hasPartialResults:", v5, *(_QWORD *)(v5 + 248));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "removeAllObjects");
      v5 = *(_QWORD *)(a1 + 32);
    }
    if (*(_BYTE *)(v5 + 288))
    {
      return objc_msgSend(*(id *)(v5 + 312), "searchDidFinish:");
    }
    else
    {
      result = objc_msgSend((id)v5, "_hitSearchLimit");
      if ((_DWORD)result)
        return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "searchLimitHit:");
    }
  }
  return result;
}

- (__CTFont)_fontWithPDFFont:(CGPDFFont *)a3 size:(double)a4
{
  CGFont *Font;
  const __CFString *i;
  __CFString *v7;
  const __CTFontDescriptor *v8;
  const __CTFontDescriptor *v9;
  const void *MatchingFontDescriptorsWithOptions;
  __CTFont *result;
  const __CFString *v12;
  char Flags;

  Font = (CGFont *)CGPDFFontGetFont();
  for (i = (id)CGFontCopyPostScriptName(Font);
        ;
        i = (const __CFString *)-[__CFString substringFromIndex:](v7, "substringFromIndex:", 7))
  {
    v7 = (__CFString *)i;
    if (!i)
      break;
    v8 = CTFontDescriptorCreateWithNameAndSize(i, a4);
    if (!v8)
      break;
    v9 = v8;
    MatchingFontDescriptorsWithOptions = (const void *)CTFontDescriptorCreateMatchingFontDescriptorsWithOptions();
    if (MatchingFontDescriptorsWithOptions)
    {
      CFRelease(MatchingFontDescriptorsWithOptions);
      result = CTFontCreateWithFontDescriptor(v9, a4, 0);
      if (result)
        return result;
    }
    if ((unint64_t)-[__CFString length](v7, "length") < 8
      || -[__CFString characterAtIndex:](v7, "characterAtIndex:", 6) != 43)
    {
      break;
    }
  }
  if ((-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("Arial,Bold")) & 1) != 0)
  {
    v12 = CFSTR("Arial-BoldMT");
  }
  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("Arial,BoldItalic")) & 1) != 0)
  {
    v12 = CFSTR("Arial-BoldItalicMT");
  }
  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("Arial,Italic")) & 1) != 0)
  {
    v12 = CFSTR("Arial-ItalicMT");
  }
  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("Helvetica-Black")) & 1) != 0
         || (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("Helvetica-Narrow-Bold")) & 1) != 0)
  {
    v12 = CFSTR("Helvetica-Bold");
  }
  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("HelveticaNeue-Black")) & 1) != 0)
  {
    v12 = CFSTR("HelveticaNeue-Bold");
  }
  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("TimesNewRoman")) & 1) != 0)
  {
    v12 = CFSTR("TimesNewRomanPSMT");
  }
  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("TimesNewRoman,Bold")) & 1) != 0)
  {
    v12 = CFSTR("TimesNewRomanPS-BoldMT");
  }
  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("TimesNewRoman,BoldItalic")) & 1) != 0)
  {
    v12 = CFSTR("TimesNewRomanPS-BoldItalicMT");
  }
  else if ((-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("TimesNewRoman,Italic")) & 1) != 0)
  {
    v12 = CFSTR("TimesNewRomanPS-ItalicMT");
  }
  else
  {
    if (!-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("ZapfDingbats"))
      || (-[UIDevice userInterfaceIdiom](+[UIDevice currentDevice](UIDevice, "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      v12 = 0;
      goto LABEL_19;
    }
    v12 = CFSTR("ZapfDingbatsITC");
  }
  result = CTFontCreateWithName(v12, a4, 0);
  if (result)
    return result;
LABEL_19:
  CGPDFFontGetFontDescriptor();
  Flags = CGPDFFontDescriptorGetFlags();
  if ((Flags & 2) != 0)
  {
    if ((Flags & 1) != 0)
      v12 = CFSTR("Courier");
    else
      v12 = CFSTR("TimesNewRomanPSMT");
  }
  else if ((Flags & 1) != 0)
  {
    if (!v12)
      return CTFontCreateWithName(CFSTR("TimesNewRomanPSMT"), a4, 0);
  }
  else
  {
    v12 = CFSTR("Helvetica");
  }
  result = CTFontCreateWithName(v12, a4, 0);
  if (!result)
    return CTFontCreateWithName(CFSTR("TimesNewRomanPSMT"), a4, 0);
  return result;
}

- (id)sanitizedAttributedStringForAttributedString:(id)a3
{
  id result;
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  __CTFont *v20;
  __CTFont *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;

  if (!a3)
    return 0;
  result = (id)objc_msgSend(a3, "string");
  if (result)
  {
    v6 = result;
    result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", result);
    if (result)
    {
      v7 = result;
      v8 = objc_msgSend(v6, "length");
      if (v8)
      {
        v9 = v8;
        v10 = 0;
        v23 = *MEMORY[0x1E0CA8188];
        v11 = *MEMORY[0x1E0CA86C0];
        v12 = *MEMORY[0x1E0CA8550];
        do
        {
          v26 = 0;
          v27 = 0;
          v13 = objc_msgSend(a3, "attributesAtIndex:effectiveRange:", v10, &v26);
          if (v13)
          {
            v14 = (void *)v13;
            v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
            v16 = (void *)objc_msgSend(v14, "valueForKey:", *MEMORY[0x1E0C9DBE8]);
            v17 = objc_msgSend(v14, "valueForKey:", *MEMORY[0x1E0C9DBE0]);
            if (v17)
              v18 = v16 == 0;
            else
              v18 = 1;
            if (!v18)
            {
              v19 = (void *)v17;
              v25 = 0.0;
              objc_msgSend(v16, "getBytes:range:", &v25, 0, 8);
              v24 = 0;
              objc_msgSend(v19, "getBytes:range:", &v24, 0, 8);
              v20 = -[UIWebPDFSearchOperation _fontWithPDFFont:size:](self, "_fontWithPDFFont:size:", v24, v25);
              if (v20)
              {
                v21 = v20;
                objc_msgSend(v15, "setValue:forKey:", v20, v23);
                CFRelease(v21);
              }
            }
            v22 = objc_msgSend(v7, "length");
            objc_msgSend(v7, "beginEditing");
            objc_msgSend(v7, "removeAttribute:range:", v11, 0, v22);
            objc_msgSend(v7, "addAttribute:value:range:", v12, -[UIColor CGColor](+[UIColor blackColor](UIColor, "blackColor"), "CGColor"), 0, v22);
            objc_msgSend(v7, "endEditing");
            objc_msgSend(v7, "setAttributes:range:", v15, v26, v27);

          }
          v10 = v27 + v26;
        }
        while (v27 + v26 < v9);
      }
      return v7;
    }
  }
  return result;
}

- (void)_search
{
  NSString *v3;
  UIPDFDocument *v4;
  UIPDFDocument *v5;
  uint64_t v6;
  unint64_t pageIndex;
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  int *v12;
  int *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  UIWebPDFSearchResult *v20;
  UIWebPDFSearchResult *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  id v35;
  id v36;
  void *v37;
  long double v38;
  void *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  UIWebPDFSearchResult *v43;
  __int128 v44;
  void *v45;
  CGAffineTransform v46;
  CGAffineTransform v47;
  CGAffineTransform v48;
  CGRect v49;
  CGAffineTransform v50;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v53;
  CGRect v54;
  CGRect v55;

  v3 = -[UIWebPDFSearchOperation searchString](self, "searchString");
  if (-[NSString length](v3, "length")
    && (v4 = -[UIWebPDFSearchOperation documentToSearch](self, "documentToSearch")) != 0
    && (v5 = v4,
        v6 = 256,
        pageIndex = self->_pageIndex,
        pageIndex < -[UIPDFDocument numberOfPages](v4, "numberOfPages"))
    && (v8 = -[UIPDFDocument pageAtIndex:](v5, "pageAtIndex:", self->_pageIndex)) != 0)
  {
    v9 = v8;
    v42 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v44 = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v53.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v53.c = v42;
    v41 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    *(_OWORD *)&v53.tx = v41;
    v10 = objc_msgSend(v8, "rotation");
    if (v10)
    {
      CGAffineTransformMakeRotation(&t2, (double)v10 * -3.14159265 / 180.0);
      *(_OWORD *)&t1.a = v44;
      *(_OWORD *)&t1.c = v42;
      *(_OWORD *)&t1.tx = v41;
      CGAffineTransformConcat(&v53, &t1, &t2);
    }
    if (!self->_complete)
    {
      v11 = 0;
      v12 = &OBJC_IVAR____UIViewServiceViewControllerOperator__screenCaptureAssertion;
      v13 = &OBJC_IVAR____UIViewServiceViewControllerOperator__screenCaptureAssertion;
      v39 = v9;
      v40 = 256;
      do
      {
        if ((-[UIWebPDFSearchOperation isCancelled](self, "isCancelled", v39, v40) & 1) != 0)
          break;
        v14 = v12[882];
        v15 = *(unint64_t *)((char *)&self->super.super.isa + v14);
        if (v15 >= -[UIWebPDFSearchOperation resultLimit](self, "resultLimit"))
          break;
        v16 = objc_msgSend(v9, "findString:fromSelection:options:", v3, v11, 1);
        if (!v16)
        {
          ++*(Class *)((char *)&self->super.super.isa + v6);
          break;
        }
        v17 = v13[887];
        v18 = *(uint64_t *)((char *)&self->super.super.isa + v17);
        if (v18)
        {
          *(Class *)((char *)&self->super.super.isa + v17) = (Class)(v18 - 1);
          v19 = v11;
        }
        else
        {
          v19 = (void *)v16;
          v20 = objc_alloc_init(UIWebPDFSearchResult);
          if (v20)
          {
            v21 = v20;
            -[UIWebPDFSearchResult setPageIndex:](v20, "setPageIndex:", *(Class *)((char *)&self->super.super.isa + v6));
            -[UIWebPDFSearchResult setString:](v21, "setString:", self->searchString);
            objc_msgSend(v19, "bounds");
            v23 = v22;
            v25 = v24;
            v27 = v26;
            v29 = v28;
            objc_msgSend(v19, "transform");
            v54.origin.x = v23;
            v54.origin.y = v25;
            v54.size.width = v27;
            v54.size.height = v29;
            v55 = CGRectApplyAffineTransform(v54, &v50);
            v43 = v21;
            -[UIWebPDFSearchResult setBoundingBox:](v21, "setBoundingBox:", v55.origin.x, v55.origin.y, v55.size.width, v55.size.height);
            v45 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v30 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v31 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v32 = objc_msgSend(v19, "numberOfRectangles");
            if (v32)
            {
              v33 = v32;
              for (i = 0; i != v33; ++i)
              {
                memset(&t1, 0, sizeof(t1));
                memset(&v49, 0, sizeof(v49));
                if ((objc_msgSend(v19, "getBounds:transform:index:", &v49, &t1, i) & 1) == 0)
                {
                  v35 = -[UIWebPDFSearchOperation sanitizedAttributedStringForAttributedString:](self, "sanitizedAttributedStringForAttributedString:", objc_msgSend(v19, "attributedStringAtIndex:", i));
                  if (v35)
                  {
                    v36 = v35;
                    v48 = t1;
                    v49 = CGRectApplyAffineTransform(v49, &v48);
                    v47 = t1;
                    v46 = v53;
                    CGAffineTransformConcat(&v48, &v47, &v46);
                    t1 = v48;
                    v37 = (void *)MEMORY[0x1E0CB37E8];
                    v38 = atan2(v48.b, v48.a);
                    *(float *)&v38 = v38;
                    *(float *)&v38 = -*(float *)&v38;
                    objc_msgSend(v31, "addObject:", objc_msgSend(v37, "numberWithFloat:", (double)v38));
                    objc_msgSend(v45, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", *(_OWORD *)&v49.origin, *(_OWORD *)&v49.size));
                    objc_msgSend(v30, "addObject:", v36);
                  }
                }
              }
            }
            -[UIWebPDFSearchResult setRotationAngles:](v43, "setRotationAngles:", v31);
            -[UIWebPDFSearchResult setRects:](v43, "setRects:", v45);
            -[UIWebPDFSearchResult setStrings:](v43, "setStrings:", v30);
            -[NSMutableArray addObject:](self->_results, "addObject:", v43);

            ++*(Class *)((char *)&self->super.super.isa + v14);
            v9 = v39;
            v6 = v40;
            v12 = &OBJC_IVAR____UIViewServiceViewControllerOperator__screenCaptureAssertion;
            v13 = &OBJC_IVAR____UIViewServiceViewControllerOperator__screenCaptureAssertion;
          }
        }
        v11 = v19;
      }
      while (!self->_complete);
    }

  }
  else
  {
    self->_complete = 1;
  }
}

- (void)main
{
  id v3;
  id v4;
  _QWORD block[5];

  v3 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__UIWebPDFSearchOperation_main__block_invoke;
  block[3] = &unk_1E16B41B8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  while (!self->_complete
       && !-[UIWebPDFSearchOperation _hitSearchLimit](self, "_hitSearchLimit")
       && (-[UIWebPDFSearchOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    -[UIWebPDFSearchOperation _search](self, "_search");
    -[UIWebPDFSearchOperation _notifyDelegateOfStatus](self, "_notifyDelegateOfStatus");
    objc_msgSend(v4, "drain");
  }
  objc_msgSend(v3, "drain");
}

uint64_t __31__UIWebPDFSearchOperation_main__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "searchDidBegin:");
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIWebPDFSearchOperation;
  -[UIWebPDFSearchOperation cancel](&v3, sel_cancel);
  if (!self->_complete)
    -[UIWebPDFSearchOperation _notifyDelegateOfStatus](self, "_notifyDelegateOfStatus");
}

- (unint64_t)currentPageResultCount
{
  return self->_currentPageResultCount;
}

- (unint64_t)startingPageIndex
{
  return self->startingPageIndex;
}

- (void)setStartingPageIndex:(unint64_t)a3
{
  self->startingPageIndex = a3;
}

- (unint64_t)currentPageIndex
{
  return self->_pageIndex;
}

- (UIPDFDocument)documentToSearch
{
  return (UIPDFDocument *)objc_getProperty(self, a2, 304, 1);
}

- (void)setDocumentToSearch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (UIWebPDFSearchOperationDelegate)searchDelegate
{
  return self->searchDelegate;
}

- (void)setSearchDelegate:(id)a3
{
  self->searchDelegate = (UIWebPDFSearchOperationDelegate *)a3;
}

- (double)documentScale
{
  return self->documentScale;
}

- (void)setDocumentScale:(double)a3
{
  self->documentScale = a3;
}

- (unint64_t)numberOfResultsToSkip
{
  return self->_numberOfResultsToSkip;
}

- (void)setNumberOfResultsToSkip:(unint64_t)a3
{
  self->_numberOfResultsToSkip = a3;
}

- (NSString)searchString
{
  return self->searchString;
}

- (void)setSearchString:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 328);
}

- (unint64_t)resultLimit
{
  return self->resultLimit;
}

- (void)setResultLimit:(unint64_t)a3
{
  self->resultLimit = a3;
}

@end
