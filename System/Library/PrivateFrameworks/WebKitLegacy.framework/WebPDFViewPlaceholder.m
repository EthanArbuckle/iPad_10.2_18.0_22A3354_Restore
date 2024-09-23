@implementation WebPDFViewPlaceholder

- (CGPDFDocument)document
{
  CGPDFDocument *document;

  objc_sync_enter(self);
  document = self->_document;
  objc_sync_exit(self);
  if (document)
    return document;
  -[WebPDFViewPlaceholder delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (CGPDFDocument *)-[WebPDFViewPlaceholderDelegate cgPDFDocument](-[WebPDFViewPlaceholder delegate](self, "delegate"), "cgPDFDocument");
  else
    return 0;
}

- (void)setDocument:(CGPDFDocument *)a3
{
  objc_sync_enter(self);
  CGPDFDocumentRetain(a3);
  CGPDFDocumentRelease(self->_document);
  self->_document = a3;
  objc_sync_exit(self);
}

- (void)clearDocument
{
  -[WebPDFViewPlaceholder setDocument:](self, "setDocument:", 0);
}

- (unint64_t)totalPages
{
  return CGPDFDocumentGetNumberOfPages(-[WebPDFViewPlaceholder document](self, "document"));
}

+ (void)setAsPDFDocRepAndView
{
  +[WebView _setPDFRepresentationClass:](WebView, "_setPDFRepresentationClass:", objc_opt_class());
  +[WebView _setPDFViewClass:](WebView, "_setPDFViewClass:", objc_opt_class());
}

+ (Class)_representationClassForWebFrame:(id)a3
{
  return +[WebPDFView _representationClassForWebFrame:](WebPDFView, "_representationClassForWebFrame:", a3);
}

- (void)dealloc
{
  objc_super v3;

  -[WebPDFViewPlaceholder delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[WebPDFViewPlaceholderDelegate viewWillClose](-[WebPDFViewPlaceholder delegate](self, "delegate"), "viewWillClose");
  -[WebPDFViewPlaceholder setTitle:](self, "setTitle:", 0);
  -[WebPDFViewPlaceholder setPageRects:](self, "setPageRects:", 0);
  -[WebPDFViewPlaceholder setPageYOrigins:](self, "setPageYOrigins:", 0);
  -[WebPDFViewPlaceholder setDocument:](self, "setDocument:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WebPDFViewPlaceholder;
  -[WebPDFViewPlaceholder dealloc](&v3, sel_dealloc);
}

+ (id)supportedMIMETypes
{
  return +[WebPDFView supportedMIMETypes](WebPDFView, "supportedMIMETypes");
}

- (void)setDataSource:(id)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;

  -[WebPDFViewPlaceholder dataSourceUpdated:](self, "dataSourceUpdated:");
  if (objc_msgSend(a3, "request"))
    -[WebPDFViewPlaceholder _updateTitleForURL:](self, "_updateTitleForURL:", objc_msgSend((id)objc_msgSend(a3, "request"), "URL"));
  v5 = (void *)-[WebPDFViewPlaceholder superview](self, "superview");
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "bounds");
    -[WebPDFViewPlaceholder convertRect:fromView:](self, "convertRect:fromView:", v6);
    -[WebPDFViewPlaceholder setBoundsSize:](self, "setBoundsSize:", v7, v8);
  }
}

- (void)_notifyDidCompleteLayout
{
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    -[WebPDFViewPlaceholder delegate](self, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[WebPDFViewPlaceholderDelegate didCompleteLayout](-[WebPDFViewPlaceholder delegate](self, "delegate"), "didCompleteLayout");
  }
  else
  {
    -[WebPDFViewPlaceholder performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__notifyDidCompleteLayout, 0, 0);
  }
}

- (void)dataSourceUpdated:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void)layout
{
  if (self->_didFinishLoad && !-[WebPDFViewPlaceholder pageRects](self, "pageRects"))
  {
    -[WebPDFViewPlaceholder _computePageRects:](self, "_computePageRects:", self->_document);
    -[WebPDFViewPlaceholder setBoundsSize:](self, "setBoundsSize:");
    self->_didCompleteLayout = 1;
    -[WebPDFViewPlaceholder _notifyDidCompleteLayout](self, "_notifyDidCompleteLayout");
  }
}

- (void)_doPostLoadOrUnlockTasks
{
  if (self->_document)
  {
    -[WebPDFViewPlaceholder _updateTitleForDocumentIfAvailable](self, "_updateTitleForDocumentIfAvailable");
    -[WebPDFViewPlaceholder _evaluateJSForDocument:](self, "_evaluateJSForDocument:", self->_document);
    -[WebPDFViewPlaceholder layout](self, "layout");
  }
}

- (void)finishedLoadingWithDataSource:(id)a3
{
  CGDataProvider *v5;
  CGDataProvider *v6;

  -[WebPDFViewPlaceholder dataSourceUpdated:](self, "dataSourceUpdated:");
  self->_didFinishLoad = 1;
  v5 = CGDataProviderCreateWithCFData((CFDataRef)objc_msgSend(a3, "data"));
  if (v5)
  {
    v6 = v5;
    self->_document = CGPDFDocumentCreateWithProvider(v5);
    -[WebPDFViewPlaceholder _doPostLoadOrUnlockTasks](self, "_doPostLoadOrUnlockTasks");
    CFRelease(v6);
  }
}

- (BOOL)canProvideDocumentSource
{
  return 0;
}

- (id)documentSource
{
  return 0;
}

- (void)_evaluateJSForDocument:(CGPDFDocument *)a3
{
  void *v5;
  const OpaqueJSContext *v6;
  id Weak;
  OpaqueJSClass *v8;
  OpaqueJSValue *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  StringImpl *v13;
  unsigned int *v14;
  unsigned int v15;
  unsigned int v16;
  WTF::StringImpl *v17;
  WTF *v18;
  void *v19;
  WTF::StringImpl *v20;
  JSStringRef script;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (CGPDFDocumentIsUnlocked(a3))
    {
      v5 = allScriptsInPDFDocument(a3);
      if (objc_msgSend(v5, "count"))
      {
        v6 = JSGlobalContextCreate(0);
        Weak = objc_loadWeak((id *)&self->_dataSource);
        {
          v8 = (OpaqueJSClass *)jsPDFDocClass(void)::jsPDFDocClass;
        }
        else
        {
          v8 = JSClassCreate(&jsPDFDocClass(void)::jsPDFDocClassDefinition);
          jsPDFDocClass(void)::jsPDFDocClass = (uint64_t)v8;
        }
        v9 = JSObjectMake(v6, v8, Weak);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v23;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v23 != v11)
                objc_enumerationMutation(v5);
              MEMORY[0x1D82A3998](&v20, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
              OpaqueJSString::tryCreate();
              JSEvaluateScript(v6, script, v9, 0, 0, 0);
              v14 = (unsigned int *)script;
              script = 0;
              if (!v14)
                goto LABEL_16;
              do
              {
                v15 = __ldaxr(v14);
                v16 = v15 - 1;
              }
              while (__stlxr(v16, v14));
              if (!v16)
              {
                atomic_store(1u, v14);
                OpaqueJSString::~OpaqueJSString((OpaqueJSString *)v14);
                WTF::fastFree(v18, v19);
                v17 = v20;
                v20 = 0;
                if (!v17)
                  continue;
              }
              else
              {
LABEL_16:
                v17 = v20;
                v20 = 0;
                if (!v17)
                  continue;
              }
              if (*(_DWORD *)v17 == 2)
                WTF::StringImpl::destroy(v17, v13);
              else
                *(_DWORD *)v17 -= 2;
            }
            v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          }
          while (v10);
        }
        JSGlobalContextRelease(v6);
      }
    }
  }
}

- (void)_updateTitleForURL:(id)a3
{
  void *v5;

  v5 = (void *)objc_msgSend(a3, "lastPathComponent");
  if (!objc_msgSend(v5, "length") || objc_msgSend(v5, "isEqualToString:", CFSTR("/")))
    v5 = (void *)objc_msgSend((id)objc_msgSend(a3, "_web_hostString"), "_webkit_decodeHostName");
  -[WebPDFViewPlaceholder setTitle:](self, "setTitle:", v5);
  objc_msgSend(-[WAKView _frame](self, "_frame"), "_dispatchDidReceiveTitle:", v5);
}

- (void)_updateTitleForDocumentIfAvailable
{
  CGPDFDocument *document;
  CGPDFDictionary *Info;
  const __CFString *v5;
  const __CFString *v6;
  CGPDFStringRef value;

  document = self->_document;
  if (document)
  {
    if (CGPDFDocumentIsUnlocked(document))
    {
      Info = CGPDFDocumentGetInfo(self->_document);
      value = 0;
      if (CGPDFDictionaryGetString(Info, "Title", &value))
      {
        v5 = CGPDFStringCopyTextString(value);
        if (v5)
        {
          v6 = v5;
          if (CFStringGetLength(v5))
          {
            -[WebPDFViewPlaceholder setTitle:](self, "setTitle:", v6);
            objc_msgSend(-[WAKView _frame](self, "_frame"), "_dispatchDidReceiveTitle:", v6);
          }
          CFRelease(v6);
        }
      }
    }
  }
}

- (CGRect)_getPDFPageBounds:(CGPDFPage *)a3
{
  double x;
  double y;
  double width;
  double height;
  double v8;
  float v9;
  double v10;
  float v11;
  double v12;
  float v13;
  double v14;
  float v15;
  double v16;
  CGAffineTransform v17;
  CGRect BoxRect;
  CGRect v19;
  CGRect v20;
  CGRect result;

  if (a3)
  {
    BoxRect = CGPDFPageGetBoxRect(a3, kCGPDFCropBox);
    x = BoxRect.origin.x;
    y = BoxRect.origin.y;
    width = BoxRect.size.width;
    height = BoxRect.size.height;
    v8 = (double)CGPDFPageGetRotationAngle(a3) * 0.0174532925;
    if (v8 != 0.0)
    {
      CGAffineTransformMakeRotation(&v17, v8);
      v19.origin.x = x;
      v19.origin.y = y;
      v19.size.width = width;
      v19.size.height = height;
      v20 = CGRectApplyAffineTransform(v19, &v17);
      x = v20.origin.x;
      y = v20.origin.y;
      width = v20.size.width;
      height = v20.size.height;
    }
    v9 = x;
    v10 = roundf(v9);
    v11 = y;
    v12 = roundf(v11);
    v13 = width;
    v14 = roundf(v13);
    v15 = height;
    v16 = roundf(v15);
  }
  else
  {
    v10 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v16;
  result.size.width = v14;
  result.origin.y = v12;
  result.origin.x = v10;
  return result;
}

- (CGSize)_computePageRects:(CGPDFDocument *)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  size_t NumberOfPages;
  size_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  size_t v15;
  WTF *v16;
  unsigned int v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  _OWORD *v22;
  size_t v23;
  void *v24;
  CGPDFPageRef Page;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _OWORD *v30;
  int v31;
  _OWORD *v32;
  __int128 v33;
  size_t v34;
  uint64_t v35;
  double width;
  double v37;
  double v38;
  uint64_t v39;
  double v40;
  float v41;
  CGFloat v42;
  float v43;
  CGFloat v44;
  float v45;
  CGFloat v46;
  void *v47;
  CGFloat MinY;
  float v49;
  float v50;
  __int128 v51;
  __int128 v52;
  WTF *v53;
  uint64_t v54;
  CGSize result;
  CGRect v56;

  if (-[WebPDFViewPlaceholder pageRects](self, "pageRects"))
  {
    -[WebPDFViewPlaceholder bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
LABEL_10:
    v19 = v6;
    v20 = v8;
    goto LABEL_29;
  }
  if (!a3
    || !CGPDFDocumentIsUnlocked(a3)
    || (NumberOfPages = CGPDFDocumentGetNumberOfPages(a3)) == 0
    || (v10 = NumberOfPages, (v11 = objc_msgSend(MEMORY[0x1E0C99DE8], "array")) == 0)
    || (v12 = (void *)v11, (v13 = objc_msgSend(MEMORY[0x1E0C99DE8], "array")) == 0))
  {
    v6 = *MEMORY[0x1E0C9D820];
    v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    goto LABEL_10;
  }
  v14 = (void *)v13;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v53 = 0;
  v54 = 0;
  v18 = 0.0;
  while (1)
  {
    Page = CGPDFDocumentGetPage(a3, v15 + 1);
    if (!Page)
      break;
    -[WebPDFViewPlaceholder _getPDFPageBounds:](self, "_getPDFPageBounds:", Page, 0, 0, 0, 0);
    *(_QWORD *)&v51 = v27;
    *((_QWORD *)&v51 + 1) = v28;
    *(double *)&v52 = v26;
    *((_QWORD *)&v52 + 1) = v29;
    if (v18 < v26)
      v18 = v26;
    if (v17 == (_DWORD)v54)
    {
      v30 = (_OWORD *)WTF::Vector<CGRect,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v53, v17 + 1, (unint64_t)&v51);
      v31 = HIDWORD(v54);
      v16 = v53;
      v32 = (_OWORD *)((char *)v53 + 32 * HIDWORD(v54));
      v33 = v30[1];
      *v32 = *v30;
      v32[1] = v33;
      v17 = v31 + 1;
      HIDWORD(v54) = v17;
      v34 = v15 + 2;
      ++v15;
      if (v34 > v10)
      {
LABEL_17:
        v15 = v10;
        break;
      }
    }
    else
    {
      v21 = v52;
      v22 = (_OWORD *)((char *)v16 + 32 * v17);
      *v22 = v51;
      v22[1] = v21;
      HIDWORD(v54) = ++v17;
      v23 = v15 + 2;
      ++v15;
      if (v23 > v10)
        goto LABEL_17;
    }
  }
  if (!v15)
  {
    v6 = *MEMORY[0x1E0C9D820];
    v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (v16)
    {
LABEL_27:
      v53 = 0;
      LODWORD(v54) = 0;
      WTF::fastFree(v16, v24);
    }
    goto LABEL_10;
  }
  v35 = 0;
  width = self->_containerSize.width;
  v20 = width / v18;
  if (width >= 0.00000011920929)
    v37 = width / v18;
  else
    v37 = 1.0;
  v19 = v18 + 16.0;
  v38 = (v18 + 16.0) * v37;
  v39 = 32 * v17;
  v40 = 8.0;
  while (v39 != v35)
  {
    v41 = v37 * *(double *)((char *)v16 + v35 + 16);
    v42 = roundf(v41);
    v43 = v37 * *(double *)((char *)v16 + v35 + 24);
    v44 = roundf(v43);
    v45 = (v38 - v42) * 0.5;
    v46 = roundf(v45);
    objc_msgSend(v12, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "_web_valueWithCGRect:", Page, v46, v40, v42, v44));
    v47 = (void *)MEMORY[0x1E0CB37E8];
    v56.origin.x = v46;
    v56.origin.y = v40;
    v56.size.width = v42;
    v56.size.height = v44;
    MinY = CGRectGetMinY(v56);
    *(float *)&MinY = MinY;
    objc_msgSend(v14, "addObject:", objc_msgSend(v47, "numberWithFloat:", MinY));
    v19 = v44 + 8.0;
    v40 = v40 + v44 + 8.0;
    v35 += 32;
    if (!--v15)
    {
      -[WebPDFViewPlaceholder setPageRects:](self, "setPageRects:", v12);
      -[WebPDFViewPlaceholder setPageYOrigins:](self, "setPageYOrigins:", v14);
      v49 = v38;
      v6 = roundf(v49);
      v50 = v40;
      v8 = roundf(v50);
      goto LABEL_27;
    }
  }
  __break(0xC471u);
LABEL_29:
  result.height = v20;
  result.width = v19;
  return result;
}

- (CGRect)rectForPageNumber:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  if (a3 && -[NSArray count](self->_pageRects, "count") >= a3)
  {
    objc_msgSend(-[NSArray objectAtIndex:](self->_pageRects, "objectAtIndex:", a3 - 1), "_web_CGRectValue");
  }
  else
  {
    v5 = *MEMORY[0x1E0C9D628];
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)simulateClickOnLinkToURL:(id)a3
{
  WebPDFViewPlaceholder *v4;
  uint64_t v5;
  WebPDFViewPlaceholder *v6;
  uint64_t v7;
  uint64_t v8;
  _DWORD *v9;
  uint64_t v10;
  _DWORD *v11;
  StringImpl *v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  StringImpl *v15;
  WTF::StringImpl *v16;
  StringImpl *v17;
  WebCore::Node *v18;
  StringImpl *v19;
  WTF::StringImpl *v20;
  _DWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[148];
  char v25;
  uint64_t v26;
  _DWORD *v27;
  uint64_t v28;
  char v29;
  char v30;
  char v31;
  uint64_t v32;
  char v33;
  WTF::StringImpl *v34;
  WTF::StringImpl *v35;
  WTF::StringImpl *v36[5];
  WebCore::Node *v37;
  WebCore::WindowProxy *v38[68];
  char v39;
  _DWORD *v40;

  if (a3)
  {
    v4 = self;
    v5 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 736);
    if (!v5 || (v6 = *(WebPDFViewPlaceholder **)(v5 + 96)) == 0)
    {
      self = (WebPDFViewPlaceholder *)WebCore::threadGlobalDataSlow((WebCore *)self);
      v6 = self;
    }
    if (!v6->super.viewContext.willRemoveSubviewCallback)
      self = (WebPDFViewPlaceholder *)WebCore::ThreadGlobalData::initializeEventNames((WebCore::ThreadGlobalData *)v6);
    WTF::MonotonicTime::now((WTF::MonotonicTime *)self);
    v36[0] = 0;
    BYTE2(v23) = 1;
    LOWORD(v23) = 256;
    WORD1(v22) = 0;
    LOBYTE(v22) = 0;
    WebCore::MouseEvent::create();
    v38[0] = 0;
    v7 = objc_msgSend(objc_loadWeak((id *)&v4->_dataSource), "webFrame", 0, v22, 0, v23, 0);
    if (v7)
      v8 = *(_QWORD *)(*(_QWORD *)(v7 + 8) + 8);
    else
      v8 = 0;
    v9 = *(_DWORD **)(v8 + 296);
    v9[6] += 2;
    v37 = (WebCore::Node *)v9;
    v10 = WebCore::SecurityContext::securityOrigin((WebCore::SecurityContext *)(v9 + 48));
    MEMORY[0x1D82A38F0](v36, a3);
    WebCore::ResourceRequestBase::RequestData::RequestData((uint64_t)v24, (uint64_t)v36, 0);
    v26 = 0;
    v11 = (_DWORD *)*MEMORY[0x1E0CBF738];
    if (*MEMORY[0x1E0CBF738])
      *v11 += 2;
    v27 = v11;
    v28 = 0;
    v29 = 0;
    v30 = 0;
    v31 = v31 & 0xE0 | 5;
    v25 |= 2u;
    v32 = 0;
    v34 = 0;
    v35 = 0;
    MEMORY[0x1D82A4FDC](v38, &v37, v10, v24, &v35, 1, &v34);
    v13 = v34;
    v34 = 0;
    if (v13)
    {
      if (*(_DWORD *)v13 == 2)
      {
        WTF::StringImpl::destroy(v13, v12);
        v14 = v35;
        v35 = 0;
        if (!v14)
          goto LABEL_20;
LABEL_18:
        if (*(_DWORD *)v14 == 2)
        {
          WTF::StringImpl::destroy(v14, v12);
          WebCore::ResourceRequest::~ResourceRequest((WebCore::ResourceRequest *)v24, v17);
          v16 = v36[0];
          v36[0] = 0;
          if (!v16)
            goto LABEL_25;
LABEL_23:
          if (*(_DWORD *)v16 == 2)
          {
            WTF::StringImpl::destroy(v16, v15);
            v18 = v37;
            v37 = 0;
            if (!v18)
              goto LABEL_32;
LABEL_28:
            if (*((_DWORD *)v18 + 6) == 2)
            {
              if ((*((_WORD *)v18 + 15) & 0x400) == 0)
                WebCore::Node::removedLastRef(v18);
            }
            else
            {
              *((_DWORD *)v18 + 6) -= 2;
            }
LABEL_32:
            v39 = 1;
            v36[0] = 0;
            v24[0] = 0;
            v33 = 0;
            WebCore::FrameLoader::loadFrameRequest();
            if (v33)
              WebCore::PrivateClickMeasurement::~PrivateClickMeasurement((WebCore::PrivateClickMeasurement *)v24, v19);
            v20 = v36[0];
            v36[0] = 0;
            if (v20)
            {
              if (*((_DWORD *)v20 + 6) == 1)
              {
                (*(void (**)(WTF::StringImpl *))(*(_QWORD *)v20 + 24))(v20);
                MEMORY[0x1D82A4FF4](v38);
                v21 = v40;
                v40 = 0;
                if (!v21)
                  return;
                goto LABEL_38;
              }
              --*((_DWORD *)v20 + 6);
            }
            MEMORY[0x1D82A4FF4](v38);
            v21 = v40;
            v40 = 0;
            if (!v21)
              return;
LABEL_38:
            if (v21[4] == 1)
              (*(void (**)(_DWORD *))(*(_QWORD *)v21 + 8))(v21);
            else
              --v21[4];
            return;
          }
          *(_DWORD *)v16 -= 2;
LABEL_25:
          v18 = v37;
          v37 = 0;
          if (!v18)
            goto LABEL_32;
          goto LABEL_28;
        }
        *(_DWORD *)v14 -= 2;
LABEL_20:
        WebCore::ResourceRequest::~ResourceRequest((WebCore::ResourceRequest *)v24, v12);
        v16 = v36[0];
        v36[0] = 0;
        if (!v16)
          goto LABEL_25;
        goto LABEL_23;
      }
      *(_DWORD *)v13 -= 2;
    }
    v14 = v35;
    v35 = 0;
    if (!v14)
      goto LABEL_20;
    goto LABEL_18;
  }
}

- (WebPDFViewPlaceholderDelegate)delegate
{
  return (WebPDFViewPlaceholderDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)pageRects
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPageRects:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSArray)pageYOrigins
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPageYOrigins:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (CGSize)containerSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_containerSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setContainerSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_containerSize, &v3, 16, 1, 0);
}

- (BOOL)didCompleteLayout
{
  return self->_didCompleteLayout;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
