@implementation WebDataSource

- (void)_setRepresentation:(id)a3
{
  _QWORD *v5;
  const void *v6;

  v5 = self->_private;
  if (a3)
    CFRetain(a3);
  v6 = (const void *)v5[1];
  v5[1] = a3;
  if (v6)
    CFRelease(v6);
  *((_BYTE *)self->_private + 16) = 0;
}

+ (Class)_representationClassForMIMEType:(id)a3 allowingPlugins:(BOOL)a4
{
  objc_class *v5;

  v5 = 0;
  if (+[WebView _viewClass:andRepresentationClass:forMIMEType:allowingPlugins:](WebView, "_viewClass:andRepresentationClass:forMIMEType:allowingPlugins:", 0, &v5, a3, a4))
  {
    return v5;
  }
  else
  {
    return 0;
  }
}

+ (void)initialize
{
  objc_opt_class();
}

- (id)_mainDocumentError
{
  JUMPOUT(0x1D82A7BC8);
}

- (void)_addSubframeArchives:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(a3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7), "_coreLegacyWebArchive");
        WebCore::DocumentLoader::addAllArchiveResources();
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (id)_responseMIMEType
{
  return -[NSURLResponse MIMEType](-[WebDataSource response](self, "response"), "MIMEType");
}

- (void)_setDeferMainResourceDataLoad:(BOOL)a3
{
  *(_BYTE *)(*(_QWORD *)self->_private + 3535) = a3;
}

- (void)_setOverrideTextEncodingName:(id)a3
{
  uint64_t v3;
  StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;

  v3 = *(_QWORD *)self->_private;
  MEMORY[0x1D82A3998](&v7, a3);
  v5 = v7;
  if (v7)
    *(_DWORD *)v7 += 2;
  v6 = *(WTF::StringImpl **)(v3 + 1624);
  *(_QWORD *)(v3 + 1624) = v5;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
    {
      WTF::StringImpl::destroy(v6, v4);
      v5 = v7;
      v7 = 0;
      if (!v5)
        return;
      goto LABEL_9;
    }
    *(_DWORD *)v6 -= 2;
  }
  v7 = 0;
  if (!v5)
    return;
LABEL_9:
  if (*(_DWORD *)v5 == 2)
    WTF::StringImpl::destroy(v5, v4);
  else
    *(_DWORD *)v5 -= 2;
}

- (id)dataSourceDelegate
{
  return 0;
}

- (NSDictionary)_quickLookContent
{
  return (NSDictionary *)*((_QWORD *)self->_private + 4);
}

- (void)_finishedLoading
{
  *((_BYTE *)self->_private + 16) = 1;
  objc_msgSend(-[WebDataSource representation](self, "representation"), "finishedLoadingWithDataSource:", self);
}

- (void)_receivedData:(id)a3
{
  if (self)
    CFRetain(self);
  objc_msgSend(-[WebDataSource representation](self, "representation"), "receivedData:withDataSource:", a3, self);
  -[NSView dataSourceUpdated:](-[WebFrameView documentView](-[WebFrame frameView](-[WebDataSource webFrame](self, "webFrame"), "frameView"), "documentView"), "dataSourceUpdated:", self);
  if (self)
    CFRelease(self);
}

- (void)_setMainDocumentError:(id)a3
{
  _BYTE *v3;

  v3 = self->_private;
  if (!v3[16])
  {
    v3[16] = 1;
    objc_msgSend(-[WebDataSource representation](self, "representation"), "receivedError:withDataSource:", a3, self);
  }
}

- (void)_revertToProvisionalState
{
  -[WebDataSource _setRepresentation:](self, "_setRepresentation:", 0);
}

+ (id)_repTypesAllowImageTypeOmission:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  if (_MergedGlobals_9 == 1)
  {
    v4 = (void *)qword_1ECEC9798;
    if ((byte_1ECEC9791 & 1) != 0)
      return v4;
  }
  else
  {
    +[WebDataSource(WebInternal) _repTypesAllowImageTypeOmission:]::$_3::operator()(&v10);
    v4 = (void *)v10;
    qword_1ECEC9798 = v10;
    _MergedGlobals_9 = 1;
    if ((byte_1ECEC9791 & 1) != 0)
      return v4;
  }
  if (!a3)
  {
    v5 = objc_opt_class();
    v6 = (void *)objc_msgSend(+[WebHTMLRepresentation supportedImageMIMETypes](WebHTMLRepresentation, "supportedImageMIMETypes"), "objectEnumerator");
    v7 = objc_msgSend(v6, "nextObject");
    if (v7)
    {
      v8 = v7;
      do
      {
        if (!objc_msgSend(v4, "objectForKey:", v8))
          objc_msgSend(v4, "setObject:forKey:", v5, v8);
        v8 = objc_msgSend(v6, "nextObject");
      }
      while (v8);
    }
    byte_1ECEC9791 = 1;
    return (id)qword_1ECEC9798;
  }
  return v4;
}

- (void)_replaceSelectionWithArchive:(id)a3 selectReplacement:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = -[WebDataSource _documentFragmentWithArchive:](self, "_documentFragmentWithArchive:", a3);
  if (v6)
    -[WebFrame _replaceSelectionWithFragment:selectReplacement:smartReplace:matchStyle:](-[WebDataSource webFrame](self, "webFrame"), "_replaceSelectionWithFragment:selectReplacement:smartReplace:matchStyle:", v6, v4, 0, 0);
}

- (id)_documentFragmentWithArchive:(id)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  const void *v8;
  const WTF::String *v9;
  StringImpl *v10;
  int isSupportedImageMIMEType;
  WTF::StringImpl *v12;
  WTF::StringImpl *v14;

  v5 = (void *)objc_msgSend(a3, "mainResource");
  v6 = v5;
  if (!v5)
    return v6;
  v7 = objc_msgSend(v5, "MIMEType");
  if (!+[WebView canShowMIMETypeAsHTML:](WebView, "canShowMIMETypeAsHTML:", v7))
  {
    MEMORY[0x1D82A3998](&v14, v7);
    isSupportedImageMIMEType = WebCore::MIMETypeRegistry::isSupportedImageMIMEType((WebCore::MIMETypeRegistry *)&v14, v9);
    v12 = v14;
    v14 = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2)
      {
        WTF::StringImpl::destroy(v12, v10);
        if (isSupportedImageMIMEType)
          return -[WebDataSource _documentFragmentWithImageResource:](self, "_documentFragmentWithImageResource:", v6);
        return 0;
      }
      *(_DWORD *)v12 -= 2;
    }
    if (isSupportedImageMIMEType)
      return -[WebDataSource _documentFragmentWithImageResource:](self, "_documentFragmentWithImageResource:", v6);
    return 0;
  }
  v8 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", objc_msgSend(v6, "data"), 4);
  objc_msgSend(a3, "_coreLegacyWebArchive");
  WebCore::DocumentLoader::addAllArchiveResources();
  v6 = -[WebFrame _documentFragmentWithMarkupString:baseURLString:](-[WebDataSource webFrame](self, "webFrame"), "_documentFragmentWithMarkupString:baseURLString:", v8, objc_msgSend((id)objc_msgSend(v6, "URL"), "_web_originalDataAsString"));
  if (v8)
    CFRelease(v8);
  return v6;
}

- (id)_documentFragmentWithImageResource:(id)a3
{
  id v4;
  id v5;
  DOMDocumentFragment *v6;

  v4 = -[WebDataSource _imageElementWithImageResource:](self, "_imageElementWithImageResource:", a3);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = -[DOMDocument createDocumentFragment](-[WebFrame DOMDocument](-[WebDataSource webFrame](self, "webFrame"), "DOMDocument"), "createDocumentFragment");
  -[DOMNode appendChild:](v6, "appendChild:", v5);
  return v6;
}

- (id)_imageElementWithImageResource:(id)a3
{
  DOMElement *v5;
  void *v6;
  uint64_t v7;

  if (!a3)
    return 0;
  -[WebDataSource addSubresource:](self, "addSubresource:");
  v5 = -[DOMDocument createElement:](-[WebFrame DOMDocument](-[WebDataSource webFrame](self, "webFrame"), "DOMDocument"), "createElement:", CFSTR("img"));
  v6 = (void *)objc_msgSend(a3, "URL");
  if (objc_msgSend(v6, "isFileURL"))
    v7 = objc_msgSend(v6, "absoluteString");
  else
    v7 = objc_msgSend(v6, "_web_originalDataAsString");
  -[DOMElement setAttribute:value:](v5, "setAttribute:value:", CFSTR("src"), v7);
  return v5;
}

- (id)_URL
{
  uint64_t v2;

  v2 = WebCore::ResourceRequestBase::url((WebCore::ResourceRequestBase *)(*(_QWORD *)self->_private + 872));
  if (*(_QWORD *)v2 && *(_DWORD *)(*(_QWORD *)v2 + 4))
    return (id)WTF::URL::operator NSURL *();
  else
    return 0;
}

- (id)_webView
{
  return -[WebFrame webView](-[WebDataSource webFrame](self, "webFrame"), "webView");
}

- (BOOL)_isDocumentHTML
{
  return +[WebView canShowMIMETypeAsHTML:](WebView, "canShowMIMETypeAsHTML:", -[WebDataSource _responseMIMEType](self, "_responseMIMEType"));
}

- (void)_makeRepresentation
{
  id v3;
  WebCore::DocumentLoader *v4;
  StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;

  v3 = (id)objc_msgSend((id)objc_opt_class(), "_representationClassForMIMEType:allowingPlugins:", -[WebDataSource _responseMIMEType](self, "_responseMIMEType"), 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = (id)objc_msgSend(v3, "_representationClassForWebFrame:", -[WebDataSource webFrame](self, "webFrame"));
  -[WebDataSource representation](self, "representation");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v3)
      v3 = objc_alloc_init((Class)v3);
    -[WebDataSource _setRepresentation:](self, "_setRepresentation:", v3);
    if (v3)
      CFRelease(v3);
  }
  objc_msgSend(*((id *)self->_private + 1), "setDataSource:", self);
  v4 = *(WebCore::DocumentLoader **)self->_private;
  MEMORY[0x1D82A3998](&v7, -[WebDataSource _responseMIMEType](self, "_responseMIMEType"));
  WebCore::DocumentLoader::setResponseMIMEType(v4, (const WTF::String *)&v7);
  v6 = v7;
  v7 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v5);
    else
      *(_DWORD *)v6 -= 2;
  }
}

- (NakedPtr<WebCore::DocumentLoader>)_documentLoader
{
  _QWORD *v2;

  *v2 = *(_QWORD *)self->_private;
  return (NakedPtr<WebCore::DocumentLoader>)self;
}

- (id)_initWithDocumentLoader:(void *)a3
{
  WebDataSource *v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WebDataSource;
  v4 = -[WebDataSource init](&v9, sel_init);
  if (v4)
  {
    v5 = operator new();
    v6 = *(_QWORD *)a3;
    *(_QWORD *)a3 = 0;
    *(_QWORD *)v5 = v6;
    *(_QWORD *)(v5 + 8) = 0;
    *(_WORD *)(v5 + 16) = 0;
    *(_QWORD *)(v5 + 32) = 0;
    *(_QWORD *)(v5 + 40) = 0;
    *(_QWORD *)(v5 + 24) = 0;
    v4->_private = (void *)v5;
    v7 = -[WebFrame _isIncludedInWebKitStatistics](-[WebDataSource webFrame](v4, "webFrame"), "_isIncludedInWebKitStatistics");
    *((_BYTE *)v4->_private + 17) = v7;
    if (v7)
      ++WebDataSourceCount;
  }
  return v4;
}

- (void)_quickLookPreviewLoaderClient
{
  return (void *)*((_QWORD *)self->_private + 5);
}

- (void)_setQuickLookContent:(id)a3
{
  uint64_t v4;
  _QWORD *v5;
  const void *v6;

  v4 = objc_msgSend(a3, "copy");
  v5 = self->_private;
  v6 = (const void *)v5[4];
  v5[4] = v4;
  if (v6)
    CFRelease(v6);
}

- (void)_setQuickLookPreviewLoaderClient:(void *)a3
{
  _QWORD *v3;
  _DWORD *v4;

  v3 = self->_private;
  if (a3)
    ++*((_DWORD *)a3 + 2);
  v4 = (_DWORD *)v3[5];
  v3[5] = a3;
  if (v4)
  {
    if (v4[2] == 1)
      (*(void (**)(_DWORD *))(*(_QWORD *)v4 + 8))(v4);
    else
      --v4[2];
  }
}

- (WebDataSource)initWithRequest:(NSURLRequest *)request
{
  WebDocumentLoaderMac *v4;
  StringImpl *v5;
  WebDataSource *v6;
  WebDocumentLoaderMac *v7;
  StringImpl *v8;
  _OWORD v10[19];
  uint64_t v11;
  _BYTE v12[200];
  WebDocumentLoaderMac *v13;

  MEMORY[0x1D82A4D48](v12, request);
  v11 = 0;
  memset(v10, 0, sizeof(v10));
  WebCore::SubstituteData::SubstituteData((WebCore::SubstituteData *)v10);
  v4 = (WebDocumentLoaderMac *)WTF::fastMalloc((WTF *)0xE10);
  WebDocumentLoaderMac::WebDocumentLoaderMac(v4, (const WebCore::ResourceRequest *)v12, (const WebCore::SubstituteData *)v10);
  v13 = v4;
  v6 = -[WebDataSource _initWithDocumentLoader:](self, "_initWithDocumentLoader:", &v13);
  v7 = v13;
  v13 = 0;
  if (v7)
  {
    if (*((_DWORD *)v7 + 6) == 1)
      (*(void (**)(WebDocumentLoaderMac *))(*(_QWORD *)v7 + 24))(v7);
    else
      --*((_DWORD *)v7 + 6);
  }
  WebCore::SubstituteData::~SubstituteData((WebCore::SubstituteData *)v10, v5);
  WebCore::ResourceRequest::~ResourceRequest((WebCore::ResourceRequest *)v12, v8);
  return v6;
}

- (void)dealloc
{
  objc_class *v3;
  _BYTE *v4;
  NSURL *v5;
  NSURL *v6;
  _QWORD *v7;
  _DWORD *v8;
  const void *v9;
  const void *v10;
  _DWORD *v11;
  objc_super v12;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    v4 = self->_private;
    if (v4 && v4[17])
      --WebDataSourceCount;
    v5 = -[NSURLResponse URL](-[WebDataSource response](self, "response"), "URL");
    if (v5)
      WebCore::removeQLPreviewConverterForURL((WebCore *)v5, v6);
    v7 = self->_private;
    if (!v7)
      goto LABEL_22;
    *(_QWORD *)(*v7 + 3560) = 0;
    v8 = (_DWORD *)v7[5];
    v7[5] = 0;
    if (v8)
    {
      if (v8[2] == 1)
      {
        (*(void (**)(_DWORD *))(*(_QWORD *)v8 + 8))(v8);
        v9 = (const void *)v7[4];
        v7[4] = 0;
        if (!v9)
          goto LABEL_13;
        goto LABEL_12;
      }
      --v8[2];
    }
    v9 = (const void *)v7[4];
    v7[4] = 0;
    if (!v9)
    {
LABEL_13:
      v10 = (const void *)v7[1];
      v7[1] = 0;
      if (v10)
        CFRelease(v10);
      v11 = (_DWORD *)*v7;
      *v7 = 0;
      if (v11)
      {
        if (v11[6] == 1)
          (*(void (**)(_DWORD *))(*(_QWORD *)v11 + 24))(v11);
        else
          --v11[6];
      }
      MEMORY[0x1D82A8D20](v7, 0x10E0C4010F12D8CLL);
LABEL_22:
      v12.receiver = self;
      v12.super_class = (Class)WebDataSource;
      -[WebDataSource dealloc](&v12, sel_dealloc);
      return;
    }
LABEL_12:
    CFRelease(v9);
    goto LABEL_13;
  }
}

- (NSData)data
{
  NSData *v2;
  void *v3;
  void *v4;
  WebCore::FragmentedSharedBuffer *v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int *v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  WTF *v16;
  uint64_t v18;
  uint64_t v19;
  WTF *v20;
  WebCore::SharedBuffer *v21;
  CFTypeRef cf;
  WebCore::FragmentedSharedBuffer *v23;

  WebCore::DocumentLoader::mainResourceData(*(WebCore::DocumentLoader **)self->_private);
  if (!v23)
    return 0;
  WebCore::FragmentedSharedBuffer::makeContiguous(v23);
  WebCore::SharedBuffer::createNSData(v21);
  v2 = (id)CFMakeCollectable(cf);
  cf = 0;
  WTF::Ref<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>::~Ref(&v21, v3);
  v5 = v23;
  v23 = 0;
  if (!v5)
    return v2;
  do
  {
    v6 = __ldaxr((unsigned int *)v5);
    v7 = v6 - 1;
  }
  while (__stlxr(v7, (unsigned int *)v5));
  if (v7)
    return v2;
  atomic_store(1u, (unsigned int *)v5);
  v9 = *((unsigned int *)v5 + 5);
  if ((_DWORD)v9)
  {
    v10 = *((_QWORD *)v5 + 1);
    v11 = v10 + 16 * v9;
    do
    {
      v12 = *(unsigned int **)(v10 + 8);
      *(_QWORD *)(v10 + 8) = 0;
      if (v12)
      {
        do
        {
          v13 = __ldaxr(v12);
          v14 = v13 - 1;
        }
        while (__stlxr(v14, v12));
        if (!v14)
        {
          v18 = v10;
          v19 = v11;
          atomic_store(1u, v12);
          v20 = (WTF *)v12;
          v15 = v12[6];
          if ((_DWORD)v15 != -1)
            ((void (*)(CFTypeRef *, unsigned int *))off_1E9D6B8A0[v15])(&cf, v12 + 2);
          *((_DWORD *)v20 + 6) = -1;
          WTF::fastFree(v20, v4);
          v10 = v18;
          v11 = v19;
        }
      }
      v10 += 16;
    }
    while (v10 != v11);
  }
  v16 = (WTF *)*((_QWORD *)v5 + 1);
  if ((WebCore::FragmentedSharedBuffer *)((char *)v5 + 24) != v16 && v16 != 0)
  {
    *((_QWORD *)v5 + 1) = 0;
    *((_DWORD *)v5 + 4) = 0;
    WTF::fastFree(v16, v4);
  }
  WTF::fastFree(v5, v4);
  return v2;
}

- (id)representation
{
  return (id)*((_QWORD *)self->_private + 1);
}

- (WebFrame)webFrame
{
  uint64_t v2;
  uint64_t v3;
  WebFrame **v4;

  v2 = *(_QWORD *)(*(_QWORD *)self->_private + 16);
  if (v2
    && (v3 = *(_QWORD *)(v2 + 8)) != 0
    && (v4 = *(WebFrame ***)(*(_QWORD *)(v3 + 280) + 16),
        (((uint64_t (*)(WebFrame **, SEL))(*v4)[67].super.isa)(v4, a2) & 1) == 0))
  {
    return v4[2];
  }
  else
  {
    return 0;
  }
}

- (NSURLRequest)initialRequest
{
  return (NSURLRequest *)WebCore::ResourceRequest::nsURLRequest();
}

- (NSMutableURLRequest)request
{
  WebCore::FrameLoader *v2;

  v2 = (WebCore::FrameLoader *)WebCore::DocumentLoader::frameLoader(*(WebCore::DocumentLoader **)self->_private);
  if (v2 && WebCore::FrameLoader::frameHasLoaded(v2))
    return (NSMutableURLRequest *)WebCore::ResourceRequest::nsURLRequest();
  else
    return 0;
}

- (NSURLResponse)response
{
  return (NSURLResponse *)WebCore::ResourceResponse::nsURLResponse((WebCore::ResourceResponse *)(*(_QWORD *)self->_private
                                                                                               + 1272));
}

- (NSString)textEncodingName
{
  NSString *result;

  if (!*(_QWORD *)(*(_QWORD *)self->_private + 1624))
    return (NSString *)&stru_1E9D6EC48;
  result = (NSString *)WTF::StringImpl::operator NSString *();
  if (!result)
    return -[NSURLResponse textEncodingName](-[WebDataSource response](self, "response"), "textEncodingName");
  return result;
}

- (BOOL)isLoading
{
  return WebCore::DocumentLoader::isLoadingInAPISense(*(WebCore::DocumentLoader **)self->_private);
}

- (NSString)pageTitle
{
  return (NSString *)objc_msgSend(-[WebDataSource representation](self, "representation"), "title");
}

- (NSURL)unreachableURL
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)self->_private + 368);
  if (v2 && *(_DWORD *)(v2 + 4))
    return (NSURL *)WTF::URL::operator NSURL *();
  else
    return 0;
}

- (WebArchive)webArchive
{
  WebArchive *v3;
  WebFrame *v4;
  WebCore::LocalFrame *v5;
  WebArchive *v6;
  _DWORD *v7;
  _DWORD *v9;

  if (!*(_BYTE *)(*(_QWORD *)self->_private + 3537))
    return 0;
  v3 = [WebArchive alloc];
  v4 = -[WebDataSource webFrame](self, "webFrame");
  WebCore::LegacyWebArchive::create((WebCore::LegacyWebArchive *)v4->_private->coreFrame.m_ptr, v5);
  v6 = (id)CFMakeCollectable(-[WebArchive _initWithCoreLegacyWebArchive:](v3, "_initWithCoreLegacyWebArchive:", &v9));
  v7 = v9;
  v9 = 0;
  if (!v7)
    return v6;
  if (v7[2] != 1)
  {
    --v7[2];
    return v6;
  }
  (*(void (**)(_DWORD *))(*(_QWORD *)v7 + 8))(v7);
  return v6;
}

- (WebResource)mainResource
{
  WebResource *v2;
  _DWORD *v3;
  _DWORD *v4;
  _DWORD *v6;
  _DWORD *v7;

  WebCore::DocumentLoader::mainResource(*(WebCore::DocumentLoader **)self->_private);
  if (!v7)
    return 0;
  v6 = v7;
  v7 = 0;
  v2 = (id)CFMakeCollectable(-[WebResource _initWithCoreResource:]([WebResource alloc], "_initWithCoreResource:", &v6));
  v3 = v6;
  v6 = 0;
  if (!v3)
    goto LABEL_5;
  if (v3[2] != 1)
  {
    --v3[2];
LABEL_5:
    v4 = v7;
    v7 = 0;
    if (!v4)
      return v2;
    goto LABEL_6;
  }
  (*(void (**)(_DWORD *))(*(_QWORD *)v3 + 8))(v3);
  v4 = v7;
  v7 = 0;
  if (!v4)
    return v2;
LABEL_6:
  if (v4[2] != 1)
  {
    --v4[2];
    return v2;
  }
  (*(void (**)(_DWORD *))(*(_QWORD *)v4 + 8))(v4);
  return v2;
}

- (NSArray)subresources
{
  void *v2;
  WTF *v3;
  uint64_t v4;
  id v5;
  void *v6;
  NSArray *v7;
  WTF *v8;
  uint64_t v9;
  _DWORD *v10;
  WTF *v12;
  unsigned int v13;

  WebCore::DocumentLoader::subresources(*(WebCore::DocumentLoader **)self->_private);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v13);
  if (v13)
  {
    v3 = v12;
    v4 = 8 * v13;
    do
    {
      v5 = -[WebResource _initWithCoreResource:]([WebResource alloc], "_initWithCoreResource:", v3);
      if (v5)
      {
        objc_msgSend(v2, "addObject:", v5);
        CFRelease(v5);
      }
      v3 = (WTF *)((char *)v3 + 8);
      v4 -= 8;
    }
    while (v4);
  }
  v7 = (id)CFMakeCollectable(v2);
  if (v13)
  {
    v8 = v12;
    v9 = 8 * v13;
    do
    {
      v10 = *(_DWORD **)v8;
      *(_QWORD *)v8 = 0;
      if (v10)
      {
        if (v10[2] == 1)
          (*(void (**)(_DWORD *))(*(_QWORD *)v10 + 8))(v10);
        else
          --v10[2];
      }
      v8 = (WTF *)((char *)v8 + 8);
      v9 -= 8;
    }
    while (v9);
  }
  if (v12)
    WTF::fastFree(v12, v6);
  return v7;
}

- (WebResource)subresourceForURL:(NSURL *)URL
{
  WebCore::DocumentLoader *v3;
  StringImpl *v4;
  WTF::StringImpl *v5;
  WebResource *v6;
  WebResource *v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v11[5];
  WTF::StringImpl *v12;

  v3 = *(WebCore::DocumentLoader **)self->_private;
  MEMORY[0x1D82A38F0](v11, URL);
  WebCore::DocumentLoader::subresource(v3, (const WTF::URL *)v11);
  v5 = v11[0];
  v11[0] = 0;
  if (!v5)
  {
LABEL_4:
    if (v12)
      goto LABEL_5;
    return 0;
  }
  if (*(_DWORD *)v5 != 2)
  {
    *(_DWORD *)v5 -= 2;
    goto LABEL_4;
  }
  WTF::StringImpl::destroy(v5, v4);
  if (!v12)
    return 0;
LABEL_5:
  v6 = [WebResource alloc];
  v11[0] = v12;
  v12 = 0;
  v7 = (id)CFMakeCollectable(-[WebResource _initWithCoreResource:](v6, "_initWithCoreResource:", v11));
  v8 = v11[0];
  v11[0] = 0;
  if (!v8)
    goto LABEL_8;
  if (*((_DWORD *)v8 + 2) != 1)
  {
    --*((_DWORD *)v8 + 2);
LABEL_8:
    v9 = v12;
    v12 = 0;
    if (!v9)
      return v7;
    goto LABEL_9;
  }
  (*(void (**)(WTF::StringImpl *))(*(_QWORD *)v8 + 8))(v8);
  v9 = v12;
  v12 = 0;
  if (!v9)
    return v7;
LABEL_9:
  if (*((_DWORD *)v9 + 2) != 1)
  {
    --*((_DWORD *)v9 + 2);
    return v7;
  }
  (*(void (**)(WTF::StringImpl *))(*(_QWORD *)v9 + 8))(v9);
  return v7;
}

- (void)addSubresource:(WebResource *)subresource
{
  NakedRef<WebCore::ArchiveResource> v3;
  ArchiveResource *var0;

  v3.var0 = (ArchiveResource *)-[WebResource _coreResource](subresource, "_coreResource");
  ++*((_DWORD *)v3.var0 + 2);
  var0 = v3.var0;
  WebCore::DocumentLoader::addArchiveResource();
  if (var0)
  {
    if (*((_DWORD *)var0 + 2) == 1)
      (*(void (**)(ArchiveResource *))(*(_QWORD *)var0 + 8))(var0);
    else
      --*((_DWORD *)var0 + 2);
  }
}

@end
