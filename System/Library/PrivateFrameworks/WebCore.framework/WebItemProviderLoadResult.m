@implementation WebItemProviderLoadResult

+ (id)loadResultWithItemProvider:(id)a3 typesToLoad:(id)a4
{
  return (id)(id)CFMakeCollectable((CFTypeRef)objc_msgSend(objc_alloc((Class)a1), "initWithItemProvider:typesToLoad:", a3, a4));
}

- (WebItemProviderLoadResult)initWithItemProvider:(id)a3 typesToLoad:(id)a4
{
  WebItemProviderLoadResult *v6;
  id v7;
  void *m_ptr;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WebItemProviderLoadResult;
  v6 = -[WebItemProviderLoadResult init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    m_ptr = v6->_fileURLs.m_ptr;
    v6->_fileURLs.m_ptr = v7;
    if (m_ptr)
      CFRelease(m_ptr);
    if (a3)
      CFRetain(a3);
    v9 = v6->_itemProvider.m_ptr;
    v6->_itemProvider.m_ptr = a3;
    if (v9)
      CFRelease(v9);
    if (a4)
      CFRetain(a4);
    v10 = v6->_typesToLoad.m_ptr;
    v6->_typesToLoad.m_ptr = a4;
    if (v10)
      CFRelease(v10);
  }
  return v6;
}

- (BOOL)canBeRepresentedAsFileUpload
{
  return (objc_msgSend(self->_itemProvider.m_ptr, "web_containsFileURLAndFileUploadContent") & 1) != 0
      || objc_msgSend(self->_itemProvider.m_ptr, "preferredPresentationStyle") != 1;
}

- (NSArray)typesToLoad
{
  return (NSArray *)self->_typesToLoad.m_ptr;
}

- (id)fileURLForType:(id)a3
{
  return (id)objc_msgSend(self->_fileURLs.m_ptr, "objectForKey:", a3);
}

- (void)setFileURL:(id)a3 forType:(id)a4
{
  objc_msgSend(self->_fileURLs.m_ptr, "setObject:forKey:", a3, a4);
}

- (NSArray)loadedFileURLs
{
  return (NSArray *)objc_msgSend(self->_fileURLs.m_ptr, "allValues");
}

- (NSArray)loadedTypeIdentifiers
{
  return (NSArray *)objc_msgSend(self->_fileURLs.m_ptr, "allKeys");
}

- (NSItemProvider)itemProvider
{
  return (NSItemProvider *)self->_itemProvider.m_ptr;
}

- (id)description
{
  void *m_ptr;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[7];
  _QWORD v9[4];
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__6;
  v15 = __Block_byref_object_dispose__6;
  v16 = 0;
  v16 = objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  objc_msgSend((id)v12[5], "appendFormat:", CFSTR("<%@: %p typesToLoad: [ "), objc_opt_class(), self);
  m_ptr = self->_typesToLoad.m_ptr;
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__WebItemProviderLoadResult_description__block_invoke;
  v10[3] = &unk_1E34864B8;
  v10[4] = self;
  v10[5] = &v11;
  objc_msgSend(m_ptr, "enumerateObjectsUsingBlock:", v10);
  objc_msgSend((id)v12[5], "appendFormat:", CFSTR(" ] fileURLs: { "));
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  v5 = self->_fileURLs.m_ptr;
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __40__WebItemProviderLoadResult_description__block_invoke_2;
  v8[3] = &unk_1E34864E0;
  v8[5] = &v11;
  v8[6] = v9;
  v8[4] = self;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);
  objc_msgSend((id)v12[5], "appendFormat:", CFSTR(" }>"));
  v6 = (void *)v12[5];
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(&v11, 8);
  return v6;
}

unint64_t __40__WebItemProviderLoadResult_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "appendString:", a2);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
  if (a3 + 1 < result)
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "appendString:", CFSTR(", "));
  return result;
}

unint64_t __40__WebItemProviderLoadResult_description__block_invoke_2(_QWORD *a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "appendFormat:", CFSTR("%@ => \"%@\"), a2, objc_msgSend(a3, "path"));
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(_QWORD *)(v4 + 24) + 1;
  *(_QWORD *)(v4 + 24) = v5;
  result = objc_msgSend(*(id *)(a1[4] + 8), "count");
  if (v5 < result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "appendString:", CFSTR(", "));
  return result;
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  void *v5;

  m_ptr = self->_typesToLoad.m_ptr;
  self->_typesToLoad.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_itemProvider.m_ptr;
  self->_itemProvider.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  v5 = self->_fileURLs.m_ptr;
  self->_fileURLs.m_ptr = 0;
  if (v5)
    CFRelease(v5);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
