@implementation WebItemProviderPasteboard

+ (id)sharedInstance
{
  if ((_MergedGlobals_298 & 1) == 0)
  {
    qword_1ECE86BE8 = 0;
    _MergedGlobals_298 = 1;
  }
  if (qword_1ECE86BF0 != -1)
    dispatch_once(&qword_1ECE86BF0, &__block_literal_global_50);
  return (id)qword_1ECE86BE8;
}

void __43__WebItemProviderPasteboard_sharedInstance__block_invoke()
{
  WebItemProviderPasteboard *v0;
  const void *v1;

  v0 = objc_alloc_init(WebItemProviderPasteboard);
  v1 = (const void *)qword_1ECE86BE8;
  qword_1ECE86BE8 = (uint64_t)v0;
  if (v1)
    CFRelease(v1);
}

- (WebItemProviderPasteboard)init
{
  WebItemProviderPasteboard *v2;
  void *v3;
  id v4;
  void *m_ptr;
  void *v6;
  void *v7;
  const void ***p_loadResults;
  uint64_t m_size;
  const void **v10;
  uint64_t v11;
  const void *v12;
  WTF *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WebItemProviderPasteboard;
  v2 = -[WebItemProviderPasteboard init](&v15, sel_init);
  if (v2)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    m_ptr = v2->_itemProviders.m_ptr;
    v2->_itemProviders.m_ptr = v4;
    if (m_ptr)
      CFRelease(m_ptr);
    v2->_changeCount = 0;
    v2->_pendingOperationCount = 0;
    v6 = v2->_supportedTypeIdentifiers.m_ptr;
    v2->_supportedTypeIdentifiers.m_ptr = 0;
    if (v6)
      CFRelease(v6);
    v7 = v2->_stagedRegistrationInfoLists.m_ptr;
    v2->_stagedRegistrationInfoLists.m_ptr = 0;
    if (v7)
      CFRelease(v7);
    p_loadResults = (const void ***)&v2->_loadResults;
    m_size = v2->_loadResults.m_size;
    if ((_DWORD)m_size)
    {
      v10 = *p_loadResults;
      v11 = 8 * m_size;
      do
      {
        v12 = *v10;
        *v10 = 0;
        if (v12)
          CFRelease(v12);
        ++v10;
        v11 -= 8;
      }
      while (v11);
    }
    v13 = (WTF *)*p_loadResults;
    if (*p_loadResults)
    {
      v2->_loadResults.m_buffer = 0;
      v2->_loadResults.m_capacity = 0;
      WTF::fastFree(v13, v3);
    }
    *p_loadResults = 0;
    *(_QWORD *)&v2->_loadResults.m_capacity = 0;
  }
  return v2;
}

- (void)updateSupportedTypeIdentifiers:(id)a3
{
  void *m_ptr;

  if (a3)
    CFRetain(a3);
  m_ptr = self->_supportedTypeIdentifiers.m_ptr;
  self->_supportedTypeIdentifiers.m_ptr = a3;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id)pasteboardTypes
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = self->_itemProviders.m_ptr;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v10 = (void *)objc_msgSend(v9, "registeredTypeIdentifiers");
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v19;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v19 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j);
              if ((objc_msgSend(v3, "containsObject:", v15) & 1) == 0)
              {
                objc_msgSend(v3, "addObject:", v15);
                objc_msgSend(v4, "addObject:", v15);
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v12);
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }
  return v4;
}

- (NSArray)itemProviders
{
  return (NSArray *)self->_itemProviders.m_ptr;
}

- (void)setItemProviders:(id)a3 dropSession:(id)a4
{
  id v5;
  id m_ptr;
  id Weak;
  void *v9;
  void *v10;
  void *v11;
  Vector<WTF::RetainPtr<WebItemProviderLoadResult>, 0UL, WTF::CrashOnOverflow, 16UL, WTF::FastMalloc> *p_loadResults;
  uint64_t m_size;
  const void **m_buffer;
  uint64_t v15;
  const void *v16;
  WTF *v17;

  if (a3)
    v5 = a3;
  else
    v5 = (id)MEMORY[0x1E0C9AA60];
  m_ptr = self->_itemProviders.m_ptr;
  if (m_ptr != v5 && (objc_msgSend(m_ptr, "isEqualToArray:", v5) & 1) == 0)
  {
    Weak = objc_loadWeak((id *)&self->_dropSession);
    if (!a4 || Weak != a4)
      ++self->_changeCount;
    objc_storeWeak((id *)&self->_dropSession, a4);
    v9 = (void *)objc_msgSend(v5, "copy");
    v10 = self->_itemProviders.m_ptr;
    self->_itemProviders.m_ptr = v9;
    if (v10)
      CFRelease(v10);
    if (!objc_msgSend(v5, "count"))
    {
      p_loadResults = &self->_loadResults;
      m_size = self->_loadResults.m_size;
      if ((_DWORD)m_size)
      {
        m_buffer = (const void **)p_loadResults->m_buffer;
        v15 = 8 * m_size;
        do
        {
          v16 = *m_buffer;
          *m_buffer = 0;
          if (v16)
            CFRelease(v16);
          ++m_buffer;
          v15 -= 8;
        }
        while (v15);
      }
      v17 = (WTF *)p_loadResults->m_buffer;
      if (p_loadResults->m_buffer)
      {
        self->_loadResults.m_buffer = 0;
        self->_loadResults.m_capacity = 0;
        WTF::fastFree(v17, v11);
      }
      p_loadResults->m_buffer = 0;
      *(_QWORD *)&self->_loadResults.m_capacity = 0;
    }
  }
}

- (void)setItemProviders:(id)a3
{
  -[WebItemProviderPasteboard setItemProviders:dropSession:](self, "setItemProviders:dropSession:", a3, 0);
}

- (int64_t)numberOfItems
{
  return objc_msgSend(self->_itemProviders.m_ptr, "count");
}

- (id)_preLoadedDataConformingToType:(id)a3 forItemProviderAtIndex:(unint64_t)a4
{
  id m_size;
  id result;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  m_size = (id)self->_loadResults.m_size;
  result = (id)objc_msgSend(self->_itemProviders.m_ptr, "count");
  if (result != m_size)
    return 0;
  if (self->_loadResults.m_size <= a4)
  {
    __break(0xC471u);
  }
  else
  {
    v9 = (void *)*((_QWORD *)self->_loadResults.m_buffer + a4);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = (void *)objc_msgSend(v9, "loadedTypeIdentifiers", 0);
    result = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (result)
    {
      v11 = result;
      v12 = *(_QWORD *)v16;
LABEL_5:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v10);
        v14 = *(const __CFString **)(*((_QWORD *)&v15 + 1) + 8 * v13);
        if (UTTypeConformsTo(v14, (CFStringRef)a3))
        {
          result = (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", objc_msgSend(v9, "fileURLForType:", v14), 1, 0);
          if (result)
            break;
        }
        if (v11 == (id)++v13)
        {
          v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          result = 0;
          if (v11)
            goto LABEL_5;
          return result;
        }
      }
    }
  }
  return result;
}

- (id)dataForPasteboardType:(id)a3
{
  return (id)objc_msgSend(-[WebItemProviderPasteboard dataForPasteboardType:inItemSet:](self, "dataForPasteboardType:inItemSet:", a3, objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, -[WebItemProviderPasteboard numberOfItems](self, "numberOfItems"))), "firstObject");
}

- (id)dataForPasteboardType:(id)a3 inItemSet:(id)a4
{
  id v7;
  CFTypeRef v8;
  _QWORD v10[4];
  CFTypeRef v11;
  id v12;
  CFTypeRef cf;

  if (!self->_loadResults.m_size)
    return (id)MEMORY[0x1E0C9AA60];
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  CFRetain(self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3321888768;
  v10[2] = __61__WebItemProviderPasteboard_dataForPasteboardType_inItemSet___block_invoke;
  v10[3] = &__block_descriptor_56_e8_32c74_ZTSKZ61__WebItemProviderPasteboard_dataForPasteboardType_inItemSet__E3__2_e12_v24__0Q8_B16l;
  CFRetain(self);
  if (v7)
    CFRetain(v7);
  v11 = self;
  CFRetain(self);
  v12 = a3;
  cf = v7;
  if (v7)
    CFRetain(v7);
  objc_msgSend(a4, "enumerateIndexesUsingBlock:", v10);
  if (v7)
    CFRelease(v7);
  CFRelease(self);
  v8 = (id)CFMakeCollectable(v7);
  if (cf)
    CFRelease(cf);
  if (v11)
    CFRelease(v11);
  CFRelease(self);
  return (id)v8;
}

uint64_t __61__WebItemProviderPasteboard_dataForPasteboardType_inItemSet___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "itemProviderAtIndex:", a2);
  if (result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "_preLoadedDataConformingToType:forItemProviderAtIndex:", *(_QWORD *)(a1 + 40), a2);
    if (result)
      return objc_msgSend(*(id *)(a1 + 48), "addObject:", result);
  }
  return result;
}

- (id)valuesForPasteboardType:(id)a3 inItemSet:(id)a4
{
  id v7;
  CFTypeRef v8;
  _QWORD v10[4];
  CFTypeRef v11;
  id v12;
  CFTypeRef cf;

  if (!self->_loadResults.m_size)
    return (id)MEMORY[0x1E0C9AA60];
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  CFRetain(self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3321888768;
  v10[2] = __63__WebItemProviderPasteboard_valuesForPasteboardType_inItemSet___block_invoke;
  v10[3] = &__block_descriptor_56_e8_32c76_ZTSKZ63__WebItemProviderPasteboard_valuesForPasteboardType_inItemSet__E3__3_e12_v24__0Q8_B16l;
  CFRetain(self);
  if (v7)
    CFRetain(v7);
  v11 = self;
  CFRetain(self);
  v12 = a3;
  cf = v7;
  if (v7)
    CFRetain(v7);
  objc_msgSend(a4, "enumerateIndexesUsingBlock:", v10);
  if (v7)
    CFRelease(v7);
  CFRelease(self);
  v8 = (id)CFMakeCollectable(v7);
  if (cf)
    CFRelease(cf);
  if (v11)
    CFRelease(v11);
  CFRelease(self);
  return (id)v8;
}

uint64_t __63__WebItemProviderPasteboard_valuesForPasteboardType_inItemSet___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  PAL *v17[6];

  v17[5] = *(PAL **)MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "itemProviderAtIndex:", a2);
  if (result)
  {
    v5 = *(void **)(a1 + 40);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    PAL::getUIColorClass((PAL *)result);
    v17[0] = (PAL *)objc_opt_class();
    PAL::getUIImageClass[0](v17[0]);
    v17[1] = (PAL *)objc_opt_class();
    v17[2] = (PAL *)objc_opt_class();
    v17[3] = (PAL *)objc_opt_class();
    v17[4] = (PAL *)objc_opt_class();
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 5, 0);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        result = objc_msgSend((id)objc_msgSend(v11, "readableTypeIdentifiersForItemProvider"), "containsObject:", v5);
        if ((result & 1) != 0)
          break;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v8)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      result = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CA5B78]);
      if ((result & 1) == 0)
        return result;
      v5 = (void *)*MEMORY[0x1E0CA5C20];
      result = objc_opt_class();
      v11 = (void *)result;
    }
    if (v11)
    {
      result = objc_msgSend(*(id *)(a1 + 32), "_preLoadedDataConformingToType:forItemProviderAtIndex:", *(_QWORD *)(a1 + 40), a2);
      if (result)
      {
        result = objc_msgSend(v11, "objectWithItemProviderData:typeIdentifier:error:", result, v5, 0);
        if (result)
          return objc_msgSend(*(id *)(a1 + 48), "addObject:", result);
      }
    }
  }
  return result;
}

- (int64_t)changeCount
{
  return self->_changeCount;
}

- (id)fileUploadURLsAtIndex:(unint64_t)a3 fileTypes:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  CFTypeRef v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  if (self->_loadResults.m_size <= a3)
  {
    v16 = (CFTypeRef)MEMORY[0x1E0C9AA60];
    goto LABEL_19;
  }
  v9 = (void *)*((_QWORD *)self->_loadResults.m_buffer + a3);
  if (v9)
    CFRetain(v9);
  if ((objc_msgSend(v9, "canBeRepresentedAsFileUpload") & 1) == 0)
  {
    v16 = (CFTypeRef)MEMORY[0x1E0C9AA60];
    if (!v9)
      goto LABEL_19;
    goto LABEL_18;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = (void *)objc_msgSend((id)objc_msgSend(v9, "itemProvider", 0), "web_fileUploadContentTypes");
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v10);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v15 = objc_msgSend(v9, "fileURLForType:", v14);
        if (v15)
        {
          objc_msgSend(v7, "addObject:", v14);
          objc_msgSend(v8, "addObject:", v15);
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }
  *a4 = (id)(id)CFMakeCollectable(v7);
  v7 = 0;
  v16 = (id)CFMakeCollectable(v8);
  v8 = 0;
  if (v9)
LABEL_18:
    CFRelease(v9);
LABEL_19:
  if (v8)
    CFRelease(v8);
  if (v7)
    CFRelease(v7);
  return (id)v16;
}

- (NSArray)allDroppedFileURLs
{
  NSArray *v3;
  uint64_t m_size;
  id *m_buffer;
  uint64_t v6;

  v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  m_size = self->_loadResults.m_size;
  if ((_DWORD)m_size)
  {
    m_buffer = (id *)self->_loadResults.m_buffer;
    v6 = 8 * m_size;
    do
    {
      if (objc_msgSend(*m_buffer, "canBeRepresentedAsFileUpload"))
        -[NSArray addObjectsFromArray:](v3, "addObjectsFromArray:", objc_msgSend(*m_buffer, "loadedFileURLs"));
      ++m_buffer;
      v6 -= 8;
    }
    while (v6);
  }
  return v3;
}

- (int64_t)numberOfFiles
{
  void *m_ptr;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  m_ptr = self->_itemProviders.m_ptr;
  v3 = objc_msgSend(m_ptr, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v11;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v11 != v6)
        objc_enumerationMutation(m_ptr);
      v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
      if (objc_msgSend(v8, "preferredPresentationStyle") != 1)
      {
        if (objc_msgSend(v8, "preferredPresentationStyle") == 2)
        {
          ++v5;
        }
        else if (objc_msgSend((id)objc_msgSend(v8, "web_fileUploadContentTypes"), "count"))
        {
          ++v5;
        }
      }
    }
    v4 = objc_msgSend(m_ptr, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v4);
  return v5;
}

- (id)typeIdentifiersToLoad:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t i;
  const __CFString *v12;
  void *m_ptr;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  const __CFString *v25;
  uint64_t k;
  __CFString *v27;
  const __CFString *v28;
  uint64_t m;
  __CFString *v30;
  void *v31;
  uint64_t v33;
  const __CFString *v34;
  const __CFString *inConformsToUTI;
  uint64_t v37;
  id obj;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v39 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v4 = (void *)objc_msgSend(a3, "registeredTypeIdentifiers");
  v5 = objc_msgSend(a3, "web_containsFileURLAndFileUploadContent");
  v6 = objc_msgSend(v4, "containsObject:", *MEMORY[0x1E0CA5B50]);
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  obj = v4;
  v8 = 0;
  v9 = 0;
  if (v7)
  {
    v10 = *(_QWORD *)v45;
    inConformsToUTI = (const __CFString *)*MEMORY[0x1E0CA5C90];
    v37 = *MEMORY[0x1E0CA5C48];
    v33 = *(_QWORD *)v45;
    v34 = (const __CFString *)*MEMORY[0x1E0CA5B18];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v45 != v10)
          objc_enumerationMutation(v4);
        v12 = *(const __CFString **)(*((_QWORD *)&v44 + 1) + 8 * i);
        if ((!(_DWORD)v6 || (objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "isEqualToString:", v37) & 1) == 0)
          && (!(_DWORD)v5 || !UTTypeConformsTo(v12, inConformsToUTI)))
        {
          if (v8)
          {
            if (v9)
              continue;
LABEL_24:
            if (UTTypeConformsTo(v12, v34))
              v9 = v12;
            else
              v9 = 0;
            continue;
          }
          m_ptr = self->_supportedTypeIdentifiers.m_ptr;
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v14 = objc_msgSend(m_ptr, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
          v15 = v6;
          v16 = v9;
          v17 = v5;
          if (v14)
          {
            v18 = *(_QWORD *)v49;
            while (2)
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v49 != v18)
                  objc_enumerationMutation(m_ptr);
                if (UTTypeConformsTo(v12, *(CFStringRef *)(*((_QWORD *)&v48 + 1) + 8 * j)))
                {
                  v8 = v12;
                  goto LABEL_23;
                }
              }
              v14 = objc_msgSend(m_ptr, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
              if (v14)
                continue;
              break;
            }
          }
          v8 = 0;
LABEL_23:
          v4 = obj;
          v5 = v17;
          v9 = v16;
          v6 = v15;
          v10 = v33;
          if (!v9)
            goto LABEL_24;
        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    }
    while (v7);
  }
  v20 = v5;
  v21 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.WebKit.custom-pasteboard-data");
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v22 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v41;
    v24 = (const __CFString *)*MEMORY[0x1E0CA5B78];
    v25 = (const __CFString *)*MEMORY[0x1E0CA5C20];
    if ((v20 & 1) != 0)
    {
      do
      {
        for (k = 0; k != v22; ++k)
        {
          if (*(_QWORD *)v41 != v23)
            objc_enumerationMutation(obj);
          v27 = *(__CFString **)(*((_QWORD *)&v40 + 1) + 8 * k);
          if ((-[__CFString isEqualToString:](v27, "isEqualToString:", v9) & 1) != 0
            || (-[__CFString isEqualToString:](v27, "isEqualToString:", v8) & 1) != 0
            || (-[__CFString isEqualToString:](v27, "isEqualToString:", v21) & 1) != 0
            || UTTypeConformsTo(v27, v24)
            || UTTypeConformsTo(v27, v25))
          {
            objc_msgSend(v39, "addObject:", v27);
          }
        }
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
      }
      while (v22);
    }
    else
    {
      v28 = (const __CFString *)*MEMORY[0x1E0CA5C90];
      do
      {
        for (m = 0; m != v22; ++m)
        {
          if (*(_QWORD *)v41 != v23)
            objc_enumerationMutation(obj);
          v30 = *(__CFString **)(*((_QWORD *)&v40 + 1) + 8 * m);
          if ((-[__CFString isEqualToString:](v30, "isEqualToString:", v9) & 1) != 0
            || (-[__CFString isEqualToString:](v30, "isEqualToString:", v8) & 1) != 0
            || (-[__CFString isEqualToString:](v30, "isEqualToString:", v21) & 1) != 0
            || UTTypeConformsTo(v30, v28)
            || UTTypeConformsTo(v30, v24)
            || UTTypeConformsTo(v30, v25))
          {
            objc_msgSend(v39, "addObject:", v30);
          }
        }
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
      }
      while (v22);
    }
  }
  v31 = (void *)objc_msgSend(v39, "array");
  if (v39)
    CFRelease(v39);
  return v31;
}

- (void)doAfterLoadingProvidedContentIntoFileURLs:(id)a3
{
  -[WebItemProviderPasteboard doAfterLoadingProvidedContentIntoFileURLs:synchronousTimeout:](self, "doAfterLoadingProvidedContentIntoFileURLs:synchronousTimeout:", a3, 0.0);
}

- (void)doAfterLoadingProvidedContentIntoFileURLs:(id)a3 synchronousTimeout:(double)a4
{
  uint64_t m_size;
  const void **m_buffer;
  uint64_t v9;
  const void *v10;
  WTF *v11;
  void *m_ptr;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  CFTypeRef v36;
  CFTypeRef v37;
  CFTypeRef v38;
  uint64_t v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  dispatch_time_t v43;
  void *v44;
  CFTypeRef v45;
  CFTypeRef v46;
  id aBlock;
  int64_t changeCount;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  WebItemProviderPasteboard *v52;
  id obj;
  _QWORD v54[6];
  _QWORD v55[4];
  CFTypeRef v56;
  NSObject *v57;
  CFTypeRef cf;
  CFTypeRef v59;
  NSObject *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[4];
  CFTypeRef v74;
  id v75;
  id v76;
  CFTypeRef v77;
  void *v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  if (self->_loadResults.m_capacity)
  {
    m_size = self->_loadResults.m_size;
    if ((_DWORD)m_size)
    {
      m_buffer = (const void **)self->_loadResults.m_buffer;
      v9 = 8 * m_size;
      do
      {
        v10 = *m_buffer;
        *m_buffer = 0;
        if (v10)
          CFRelease(v10);
        ++m_buffer;
        v9 -= 8;
      }
      while (v9);
      self->_loadResults.m_size = 0;
    }
    v11 = (WTF *)self->_loadResults.m_buffer;
    if (v11)
    {
      self->_loadResults.m_buffer = 0;
      self->_loadResults.m_capacity = 0;
      WTF::fastFree(v11, (void *)a2);
    }
  }
  changeCount = self->_changeCount;
  obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(self->_itemProviders.m_ptr, "count"));
  CFRetain(self);
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v52 = self;
  m_ptr = self->_itemProviders.m_ptr;
  v13 = objc_msgSend(m_ptr, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
  if (!v13)
    goto LABEL_103;
  v14 = 0;
  v15 = *(_QWORD *)v70;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v70 != v15)
        objc_enumerationMutation(m_ptr);
      v17 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i);
      v18 = -[WebItemProviderPasteboard typeIdentifiersToLoad:](v52, "typeIdentifiersToLoad:", v17);
      v19 = objc_msgSend(v18, "count") | v14;
      v14 = v19 != 0;
      objc_msgSend(obj, "addObject:", +[WebItemProviderLoadResult loadResultWithItemProvider:typesToLoad:](WebItemProviderLoadResult, "loadResultWithItemProvider:typesToLoad:", v17, v18));
    }
    v13 = objc_msgSend(m_ptr, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
  }
  while (v13);
  if (!v19)
  {
LABEL_103:
    (*((void (**)(id, _QWORD))a3 + 2))(a3, MEMORY[0x1E0C9AA60]);
    goto LABEL_104;
  }
  v20 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  aBlock = a3;
  v21 = dispatch_group_create();
  v22 = dispatch_group_create();
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v80, 16);
  if (!v23)
    goto LABEL_74;
  v49 = *(_QWORD *)v66;
  do
  {
    v24 = 0;
    v50 = v23;
    do
    {
      if (*(_QWORD *)v66 != v49)
        objc_enumerationMutation(obj);
      v51 = v24;
      v25 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v24);
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v26 = (void *)objc_msgSend(v25, "typesToLoad", aBlock);
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
      if (v27)
      {
        v28 = *(_QWORD *)v62;
        do
        {
          v29 = 0;
          do
          {
            if (*(_QWORD *)v62 != v28)
              objc_enumerationMutation(v26);
            v30 = *(const void **)(*((_QWORD *)&v61 + 1) + 8 * v29);
            dispatch_group_enter(v22);
            dispatch_group_enter(v21);
            v31 = (void *)objc_msgSend(v25, "itemProvider");
            v55[0] = MEMORY[0x1E0C809B0];
            v55[1] = 3321888768;
            v55[2] = __90__WebItemProviderPasteboard_doAfterLoadingProvidedContentIntoFileURLs_synchronousTimeout___block_invoke;
            v55[3] = &__block_descriptor_72_e8_32c103_ZTSKZ90__WebItemProviderPasteboard_doAfterLoadingProvidedContentIntoFileURLs_synchronousTimeout__E3__4_e27_v24__0__NSURL_8__NSError_16l;
            if (v25)
              CFRetain(v25);
            if (v21)
              v32 = v21;
            if (v20)
              CFRetain(v20);
            if (v30)
              CFRetain(v30);
            if (v22)
              v33 = v22;
            v56 = v25;
            if (v25)
              CFRetain(v25);
            v57 = v21;
            if (v21)
              v34 = v21;
            cf = v20;
            if (v20)
              CFRetain(v20);
            v59 = v30;
            if (v30)
              CFRetain(v30);
            v60 = v22;
            if (v22)
              v35 = v22;
            objc_msgSend(v31, "loadFileRepresentationForTypeIdentifier:completionHandler:", v30, v55);
            if (v22)

            if (!v30)
            {
              if (!v20)
                goto LABEL_53;
LABEL_52:
              CFRelease(v20);
              goto LABEL_53;
            }
            CFRelease(v30);
            if (v20)
              goto LABEL_52;
LABEL_53:
            if (v21)

            if (v25)
              CFRelease(v25);
            if (v60)

            v36 = v59;
            v59 = 0;
            if (v36)
              CFRelease(v36);
            v37 = cf;
            cf = 0;
            if (v37)
              CFRelease(v37);
            if (v57)

            v38 = v56;
            v56 = 0;
            if (v38)
              CFRelease(v38);
            ++v29;
          }
          while (v27 != v29);
          v39 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
          v27 = v39;
        }
        while (v39);
      }
      v24 = v51 + 1;
    }
    while (v51 + 1 != v50);
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v80, 16);
  }
  while (v23);
LABEL_74:
  CFRetain(v52);
  v54[0] = v52;
  CFRetain(v52);
  v54[1] = v21;
  if (v21)
    v40 = v21;
  v54[2] = v22;
  if (v22)
    v41 = v22;
  v54[3] = obj;
  if (obj)
    CFRetain(obj);
  v42 = _Block_copy(aBlock);
  v54[4] = v42;
  v54[5] = changeCount;
  if (a4 <= 0.0 || (v43 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0)), dispatch_group_wait(v21, v43)))
  {
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3321888768;
    v73[2] = ___ZZ90__WebItemProviderPasteboard_doAfterLoadingProvidedContentIntoFileURLs_synchronousTimeout__ENK3__5cvU13block_pointerFvvEEv_block_invoke;
    v73[3] = &__block_descriptor_80_e8_32c103_ZTSKZ90__WebItemProviderPasteboard_doAfterLoadingProvidedContentIntoFileURLs_synchronousTimeout__E3__5_e5_v8__0l;
    -[WebItemProviderPasteboard doAfterLoadingProvidedContentIntoFileURLs:synchronousTimeout:]::$_5::$_5(&v74, (uint64_t)v54);
    v44 = (void *)objc_msgSend((id)objc_msgSend(v73, "copy"), "autorelease");
    _Block_release(v78);
    v45 = v77;
    v77 = 0;
    if (v45)
      CFRelease(v45);
    if (v76)

    if (v75)
    v46 = v74;
    v74 = 0;
    if (v46)
      CFRelease(v46);
    dispatch_group_notify(v22, MEMORY[0x1E0C80D38], v44);
  }
  else
  {
    -[WebItemProviderPasteboard doAfterLoadingProvidedContentIntoFileURLs:synchronousTimeout:]::$_5::operator()(v54);
  }
  _Block_release(v42);
  if (obj)
    CFRelease(obj);
  if (v22)

  if (v21)
  CFRelease(v52);
  CFRelease(v52);
  if (v22)

  if (v21)
  if (v20)
    CFRelease(v20);
LABEL_104:
  CFRelease(v52);
  if (obj)
    CFRelease(obj);
}

void __90__WebItemProviderPasteboard_doAfterLoadingProvidedContentIntoFileURLs_synchronousTimeout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSString *v5;
  void *v6;
  const __CFString *v7;
  uint64_t TemporaryDirectory;
  void *v9;
  int v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  NSObject *v15;
  uint64_t v16;
  int v17;
  BOOL v18;
  uint8_t v19[16];

  v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "itemProvider"), "suggestedName");
  if (a2)
  {
    v6 = (void *)v4;
    v7 = *(const __CFString **)(a1 + 56);
    TemporaryDirectory = WTF::FileSystemImpl::createTemporaryDirectory((WTF::FileSystemImpl *)CFSTR("dropped-data"), v5);
    if (TemporaryDirectory)
    {
      v9 = (void *)TemporaryDirectory;
      v10 = UTTypeConformsTo(v7, (CFStringRef)*MEMORY[0x1E0CA5B58]);
      v11 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      if (!objc_msgSend(v6, "length"))
        v6 = (void *)objc_msgSend(a2, "lastPathComponent");
      if (v10)
        v12 = CFSTR("folder");
      else
        v12 = CFSTR("file");
      if (!objc_msgSend(v6, "length"))
        v6 = (void *)v12;
      v13 = (void *)objc_msgSend(a2, "pathExtension");
      if (!objc_msgSend(v13, "length"))
        v13 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v7), "preferredFilenameExtension");
      if (objc_msgSend(v13, "length"))
      {
        if (objc_msgSend((id)objc_msgSend(v6, "pathExtension"), "caseInsensitiveCompare:", v13) && v10 == 0)
          v6 = (void *)objc_msgSend(v6, "stringByAppendingPathExtension:", v13);
      }
      if (!objc_msgSend(v6, "length"))
      {
        v15 = qword_1ECE7C068;
        if (os_log_type_enabled((os_log_t)qword_1ECE7C068, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v19 = 0;
          _os_log_fault_impl(&dword_1940B8000, v15, OS_LOG_TYPE_FAULT, "Unable to append appropriate file extension to suggested name", v19, 2u);
        }
        v6 = (void *)v12;
      }
      v16 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", objc_msgSend(v9, "stringByAppendingPathComponent:", v6));
      v17 = objc_msgSend(v11, "linkItemAtURL:toURL:error:", a2, v16, 0);
      if (v16)
        v18 = v17 == 0;
      else
        v18 = 1;
      if (!v18)
      {
        objc_msgSend(*(id *)(a1 + 48), "lock");
        objc_msgSend(*(id *)(a1 + 32), "setFileURL:forType:", v16, *(_QWORD *)(a1 + 56));
        objc_msgSend(*(id *)(a1 + 48), "unlock");
      }
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)doAfterLoadingProvidedContentIntoFileURLs:synchronousTimeout:
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  const void *v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  WTF *v14;
  void *v15;
  WTF *v16;
  uint64_t v17;
  WTF *v18;
  const void *v19;
  const void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = a1[5];
  v3 = (_QWORD *)*a1;
  if (v2 != v3[8])
    goto LABEL_32;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = (id)a1[3];
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v4)
    goto LABEL_31;
  v5 = v4;
  v6 = *(_QWORD *)v23;
  while (2)
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v23 != v6)
        objc_enumerationMutation(obj);
      v8 = *(const void **)(*((_QWORD *)&v22 + 1) + 8 * i);
      v9 = (_QWORD *)*a1;
      v10 = *(unsigned int *)(*a1 + 44);
      if ((_DWORD)v10 != *(_DWORD *)(*a1 + 40))
      {
        *(_QWORD *)(v9[4] + 8 * v10) = v8;
        if (!v8)
          goto LABEL_29;
LABEL_28:
        CFRetain(v8);
        LODWORD(v10) = *((_DWORD *)v9 + 11);
        goto LABEL_29;
      }
      v11 = v10 + (v10 >> 2);
      if (v11 >= 0x10)
        v12 = v11 + 1;
      else
        v12 = 16;
      if (v12 <= v10 + 1)
        v13 = v10 + 1;
      else
        v13 = v12;
      if (v13 >> 29)
      {
        __break(0xC471u);
        return;
      }
      v14 = (WTF *)v9[4];
      v16 = (WTF *)WTF::fastMalloc((WTF *)(8 * v13));
      *((_DWORD *)v9 + 10) = v13;
      v9[4] = v16;
      if ((_DWORD)v10)
      {
        v17 = 8 * v10;
        v18 = v14;
        do
        {
          v19 = *(const void **)v18;
          *(_QWORD *)v18 = 0;
          *(_QWORD *)v16 = v19;
          v20 = *(const void **)v18;
          *(_QWORD *)v18 = 0;
          if (v20)
            CFRelease(v20);
          v16 = (WTF *)((char *)v16 + 8);
          v18 = (WTF *)((char *)v18 + 8);
          v17 -= 8;
        }
        while (v17);
        v16 = (WTF *)v9[4];
      }
      if (v14)
      {
        if (v16 == v14)
        {
          v9[4] = 0;
          *((_DWORD *)v9 + 10) = 0;
        }
        WTF::fastFree(v14, v15);
        v16 = (WTF *)v9[4];
      }
      v10 = *((unsigned int *)v9 + 11);
      *((_QWORD *)v16 + v10) = v8;
      if (v8)
        goto LABEL_28;
LABEL_29:
      *((_DWORD *)v9 + 11) = v10 + 1;
    }
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v5)
      continue;
    break;
  }
LABEL_31:
  v3 = (_QWORD *)*a1;
LABEL_32:
  objc_msgSend(v3, "allDroppedFileURLs");
  (*(void (**)(void))(a1[4] + 16))();
}

- (id)itemProviderAtIndex:(unint64_t)a3
{
  if (objc_msgSend(self->_itemProviders.m_ptr, "count") <= a3)
    return 0;
  else
    return (id)objc_msgSend(self->_itemProviders.m_ptr, "objectAtIndex:", a3);
}

- (BOOL)hasPendingOperation
{
  return self->_pendingOperationCount != 0;
}

- (void)incrementPendingOperationCount
{
  ++self->_pendingOperationCount;
}

- (void)decrementPendingOperationCount
{
  --self->_pendingOperationCount;
}

- (void)enumerateItemProvidersWithBlock:(id)a3
{
  objc_msgSend(self->_itemProviders.m_ptr, "enumerateObjectsUsingBlock:", a3);
}

- (void)stageRegistrationLists:(id)a3
{
  void *m_ptr;

  if (a3)
    CFRetain(a3);
  m_ptr = self->_stagedRegistrationInfoLists.m_ptr;
  self->_stagedRegistrationInfoLists.m_ptr = a3;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (void)clearRegistrationLists
{
  void *m_ptr;

  m_ptr = self->_stagedRegistrationInfoLists.m_ptr;
  self->_stagedRegistrationInfoLists.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id)takeRegistrationLists
{
  void *m_ptr;

  m_ptr = self->_stagedRegistrationInfoLists.m_ptr;
  self->_stagedRegistrationInfoLists.m_ptr = 0;
  return (id)(id)CFMakeCollectable(m_ptr);
}

- (void)setNumberOfItems:(int64_t)a3
{
  self->_numberOfItems = a3;
}

- (void)setChangeCount:(int64_t)a3
{
  self->_changeCount = a3;
}

- (int64_t)pendingOperationCount
{
  return self->_pendingOperationCount;
}

- (void)setPendingOperationCount:(int64_t)a3
{
  self->_pendingOperationCount = a3;
}

- (void).cxx_destruct
{
  void *v3;
  uint64_t m_size;
  const void **m_buffer;
  uint64_t v6;
  const void *v7;
  WTF *v8;
  void *m_ptr;
  void *v10;
  void *v11;

  objc_destroyWeak((id *)&self->_dropSession);
  m_size = self->_loadResults.m_size;
  if ((_DWORD)m_size)
  {
    m_buffer = (const void **)self->_loadResults.m_buffer;
    v6 = 8 * m_size;
    do
    {
      v7 = *m_buffer;
      *m_buffer = 0;
      if (v7)
        CFRelease(v7);
      ++m_buffer;
      v6 -= 8;
    }
    while (v6);
  }
  v8 = (WTF *)self->_loadResults.m_buffer;
  if (v8)
  {
    self->_loadResults.m_buffer = 0;
    self->_loadResults.m_capacity = 0;
    WTF::fastFree(v8, v3);
  }
  m_ptr = self->_stagedRegistrationInfoLists.m_ptr;
  self->_stagedRegistrationInfoLists.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v10 = self->_supportedTypeIdentifiers.m_ptr;
  self->_supportedTypeIdentifiers.m_ptr = 0;
  if (v10)
    CFRelease(v10);
  v11 = self->_itemProviders.m_ptr;
  self->_itemProviders.m_ptr = 0;
  if (v11)
    CFRelease(v11);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (_QWORD)doAfterLoadingProvidedContentIntoFileURLs:(_QWORD *)a1 synchronousTimeout:(uint64_t)a2
{
  const void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  const void *v9;
  void *v10;
  uint64_t v11;

  v4 = *(const void **)a2;
  *a1 = *(_QWORD *)a2;
  if (v4)
    CFRetain(v4);
  v5 = *(void **)(a2 + 8);
  a1[1] = v5;
  if (v5)
    v6 = v5;
  v7 = *(void **)(a2 + 16);
  a1[2] = v7;
  if (v7)
    v8 = v7;
  v9 = *(const void **)(a2 + 24);
  a1[3] = v9;
  if (v9)
    CFRetain(v9);
  v10 = _Block_copy(*(const void **)(a2 + 32));
  v11 = *(_QWORD *)(a2 + 40);
  a1[4] = v10;
  a1[5] = v11;
  return a1;
}

@end
