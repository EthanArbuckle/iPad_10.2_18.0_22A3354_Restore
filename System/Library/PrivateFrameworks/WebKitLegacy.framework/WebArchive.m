@implementation WebArchive

- (WebArchive)init
{
  WebArchive *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WebArchive;
  v2 = -[WebArchive init](&v4, sel_init);
  if (v2)
    v2->_private = objc_alloc_init(WebArchivePrivate);
  return v2;
}

- (WebArchive)initWithMainResource:(WebResource *)mainResource subresources:(NSArray *)subresources subframeArchives:(NSArray *)subframeArchives
{
  WebArchive *v8;
  WebArchivePrivate *v9;
  void *m_ptr;
  WebArchivePrivate *v11;
  NSUInteger v12;
  uint64_t v13;
  WebArchivePrivate *v14;
  void *v15;
  NSUInteger v16;
  uint64_t v17;
  WebArchivePrivate *v18;
  void *v19;
  WebArchive *v20;
  WebArchivePrivate *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  WTF *v32;
  WTF *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  WTF *v44;
  WTF *v45;
  void *v46;
  WebArchivePrivate *v47;
  uint64_t v48;
  void *v49;
  _DWORD *v50;
  _DWORD *v51;
  WTF *v52;
  uint64_t v53;
  _DWORD *v54;
  WTF *v55;
  WTF *v56;
  uint64_t v57;
  _DWORD *v58;
  WTF *v59;
  WebResource *v60;
  void *v61;
  WebArchive *v62;
  _DWORD *v63;
  _DWORD *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  WTF *v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  WTF *v75;
  uint64_t v76;
  objc_super v77;
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v77.receiver = self;
  v77.super_class = (Class)WebArchive;
  v8 = -[WebArchive init](&v77, sel_init);
  if (!v8)
    return 0;
  v9 = objc_alloc_init(WebArchivePrivate);
  v8->_private = v9;
  if (mainResource)
    CFRetain(mainResource);
  m_ptr = v9->cachedMainResource.m_ptr;
  v9->cachedMainResource.m_ptr = mainResource;
  if (m_ptr)
    CFRelease(m_ptr);
  v11 = v8->_private;
  if (!v11->cachedMainResource.m_ptr)
    goto LABEL_27;
  if (!subresources)
  {
    v15 = v11->cachedSubresources.m_ptr;
    v11->cachedSubresources.m_ptr = 0;
    if (!v15)
      goto LABEL_19;
    goto LABEL_18;
  }
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_27;
  v12 = -[NSArray count](subresources, "count");
  if (v12)
  {
    v13 = 0;
    do
    {
      -[NSArray objectAtIndex:](subresources, "objectAtIndex:", v13);
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_27;
    }
    while (v12 != ++v13);
  }
  v14 = v8->_private;
  CFRetain(subresources);
  v15 = v14->cachedSubresources.m_ptr;
  v14->cachedSubresources.m_ptr = subresources;
  if (v15)
LABEL_18:
    CFRelease(v15);
LABEL_19:
  if (!subframeArchives)
  {
    v22 = v8->_private;
    v19 = v22->cachedSubframeArchives.m_ptr;
    v22->cachedSubframeArchives.m_ptr = 0;
    if (!v19)
      goto LABEL_32;
    goto LABEL_31;
  }
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_27:

    return 0;
  }
  v16 = -[NSArray count](subframeArchives, "count");
  if (v16)
  {
    v17 = 0;
    do
    {
      -[NSArray objectAtIndex:](subframeArchives, "objectAtIndex:", v17);
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_27;
    }
    while (v16 != ++v17);
  }
  v18 = v8->_private;
  CFRetain(subframeArchives);
  v19 = v18->cachedSubframeArchives.m_ptr;
  v18->cachedSubframeArchives.m_ptr = subframeArchives;
  if (v19)
LABEL_31:
    CFRelease(v19);
LABEL_32:
  v62 = v8;
  v75 = 0;
  v76 = 0;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v23 = -[NSArray countByEnumeratingWithState:objects:count:](subresources, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
  v60 = mainResource;
  if (v23)
  {
    v24 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v72 != v24)
          objc_enumerationMutation(subresources);
        v27 = objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * i), "_coreResource", v60);
        v28 = HIDWORD(v76);
        if (HIDWORD(v76) == (_DWORD)v76)
        {
          v29 = HIDWORD(v76) + ((unint64_t)HIDWORD(v76) >> 2);
          if (v29 >= 0x10)
            v30 = v29 + 1;
          else
            v30 = 16;
          if (v30 <= (unint64_t)HIDWORD(v76) + 1)
            v31 = HIDWORD(v76) + 1;
          else
            v31 = v30;
          if (v31 >> 29)
          {
            __break(0xC471u);
            goto LABEL_103;
          }
          v32 = v75;
          v33 = (WTF *)WTF::fastMalloc((WTF *)(8 * v31));
          LODWORD(v76) = v31;
          v75 = v33;
          memcpy(v33, v32, 8 * v28);
          if (v32)
          {
            if (v75 == v32)
            {
              v75 = 0;
              LODWORD(v76) = 0;
            }
            WTF::fastFree(v32, v34);
          }
          LODWORD(v28) = HIDWORD(v76);
          v26 = (uint64_t *)((char *)v75 + 8 * HIDWORD(v76));
        }
        else
        {
          v26 = (uint64_t *)((char *)v75 + 8 * HIDWORD(v76));
        }
        ++*(_DWORD *)(v27 + 8);
        *v26 = v27;
        HIDWORD(v76) = v28 + 1;
      }
      v23 = -[NSArray countByEnumeratingWithState:objects:count:](subresources, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
    }
    while (v23);
  }
  v69 = 0;
  v70 = 0;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v35 = -[NSArray countByEnumeratingWithState:objects:count:](subframeArchives, "countByEnumeratingWithState:objects:count:", &v65, v78, 16, v60);
  if (v35)
  {
    v36 = *(_QWORD *)v66;
    do
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v66 != v36)
          objc_enumerationMutation(subframeArchives);
        v39 = objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * j) + 8), "coreArchive");
        v40 = HIDWORD(v70);
        if (HIDWORD(v70) == (_DWORD)v70)
        {
          v41 = HIDWORD(v70) + ((unint64_t)HIDWORD(v70) >> 2);
          if (v41 >= 0x10)
            v42 = v41 + 1;
          else
            v42 = 16;
          if (v42 <= (unint64_t)HIDWORD(v70) + 1)
            v43 = HIDWORD(v70) + 1;
          else
            v43 = v42;
          if (v43 >> 29)
          {
            __break(0xC471u);
LABEL_103:
            JUMPOUT(0x1D8094574);
          }
          v44 = v69;
          v45 = (WTF *)WTF::fastMalloc((WTF *)(8 * v43));
          LODWORD(v70) = v43;
          v69 = v45;
          memcpy(v45, v44, 8 * v40);
          if (v44)
          {
            if (v69 == v44)
            {
              v69 = 0;
              LODWORD(v70) = 0;
            }
            WTF::fastFree(v44, v46);
          }
          LODWORD(v40) = HIDWORD(v70);
          v38 = (uint64_t *)((char *)v69 + 8 * HIDWORD(v70));
        }
        else
        {
          v38 = (uint64_t *)((char *)v69 + 8 * HIDWORD(v70));
        }
        ++*(_DWORD *)(v39 + 8);
        *v38 = v39;
        HIDWORD(v70) = v40 + 1;
      }
      v35 = -[NSArray countByEnumeratingWithState:objects:count:](subframeArchives, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
    }
    while (v35);
  }
  v20 = v62;
  v47 = v62->_private;
  v48 = objc_msgSend(v61, "_coreResource");
  ++*(_DWORD *)(v48 + 8);
  v63 = (_DWORD *)v48;
  WebCore::LegacyWebArchive::create();
  -[WebArchivePrivate setCoreArchive:](v47, "setCoreArchive:", &v64);
  v50 = v64;
  v64 = 0;
  if (!v50)
  {
LABEL_77:
    v51 = v63;
    if (v63)
      goto LABEL_78;
    goto LABEL_83;
  }
  if (v50[2] != 1)
  {
    --v50[2];
    goto LABEL_77;
  }
  (*(void (**)(_DWORD *))(*(_QWORD *)v50 + 8))(v50);
  v51 = v63;
  if (v63)
  {
LABEL_78:
    if (v51[2] == 1)
      (*(void (**)(_DWORD *))(*(_QWORD *)v51 + 8))(v51);
    else
      --v51[2];
  }
LABEL_83:
  if (HIDWORD(v70))
  {
    v52 = v69;
    v53 = 8 * HIDWORD(v70);
    do
    {
      v54 = *(_DWORD **)v52;
      *(_QWORD *)v52 = 0;
      if (v54)
      {
        if (v54[2] == 1)
          (*(void (**)(_DWORD *))(*(_QWORD *)v54 + 8))(v54);
        else
          --v54[2];
      }
      v52 = (WTF *)((char *)v52 + 8);
      v53 -= 8;
    }
    while (v53);
  }
  v55 = v69;
  if (v69)
  {
    v69 = 0;
    LODWORD(v70) = 0;
    WTF::fastFree(v55, v49);
  }
  if (HIDWORD(v76))
  {
    v56 = v75;
    v57 = 8 * HIDWORD(v76);
    do
    {
      v58 = *(_DWORD **)v56;
      *(_QWORD *)v56 = 0;
      if (v58)
      {
        if (v58[2] == 1)
          (*(void (**)(_DWORD *))(*(_QWORD *)v58 + 8))(v58);
        else
          --v58[2];
      }
      v56 = (WTF *)((char *)v56 + 8);
      v57 -= 8;
    }
    while (v57);
  }
  v59 = v75;
  if (v75)
  {
    v75 = 0;
    LODWORD(v76) = 0;
    WTF::fastFree(v59, v49);
  }
  return v20;
}

- (WebArchive)initWithData:(NSData *)data
{
  WebArchive *v4;
  NSData *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  WebArchivePrivate *v9;
  _DWORD *v10;
  _DWORD *v11;
  uint64_t v13;
  _DWORD *v14;
  objc_super v15;
  _DWORD *v16;

  v15.receiver = self;
  v15.super_class = (Class)WebArchive;
  v4 = -[WebArchive init](&v15, sel_init);
  if (!v4)
    return v4;
  v4->_private = objc_alloc_init(WebArchivePrivate);
  WebCore::FragmentedSharedBuffer::create((WebCore::FragmentedSharedBuffer *)data, v5);
  v6 = WTF::fastMalloc((WTF *)0x38);
  MEMORY[0x1D82A42EC](v6, &v16);
  v13 = v6;
  WTF::Ref<WebCore::FragmentedSharedBuffer,WTF::RawPtrTraits<WebCore::FragmentedSharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::FragmentedSharedBuffer>>::~Ref(&v16, v7);
  WebCore::LegacyWebArchive::create();
  WTF::Ref<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>::~Ref(&v13, v8);
  if (v14)
  {
    v9 = v4->_private;
    v16 = v14;
    v14 = 0;
    -[WebArchivePrivate setCoreArchive:](v9, "setCoreArchive:", &v16);
    v10 = v16;
    v16 = 0;
    if (v10)
    {
      if (v10[2] == 1)
      {
        (*(void (**)(_DWORD *))(*(_QWORD *)v10 + 8))(v10);
        v11 = v14;
        v14 = 0;
        if (!v11)
          return v4;
      }
      else
      {
        --v10[2];
        v11 = v14;
        v14 = 0;
        if (!v11)
          return v4;
      }
      goto LABEL_9;
    }
  }
  else
  {

    v4 = 0;
  }
  v11 = v14;
  v14 = 0;
  if (!v11)
    return v4;
LABEL_9:
  if (v11[2] != 1)
  {
    --v11[2];
    return v4;
  }
  (*(void (**)(_DWORD *))(*(_QWORD *)v11 + 8))(v11);
  return v4;
}

- (WebArchive)initWithCoder:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v5 = objc_msgSend(a3, "decodeObjectForKey:", CFSTR("WebMainResource"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    v5 = 0;
  v6 = (void *)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("WebSubresources"));
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_msgSend(v6, "count");
    if (!v7)
      goto LABEL_10;
    v8 = 0;
    while (1)
    {
      objc_msgSend(v6, "objectAtIndex:", v8);
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      if (v7 == ++v8)
        goto LABEL_10;
    }
  }
  v6 = 0;
LABEL_10:
  v9 = (void *)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("WebSubframeArchives"));
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_16:
    v9 = 0;
    return -[WebArchive initWithMainResource:subresources:subframeArchives:](self, "initWithMainResource:subresources:subframeArchives:", v5, v6, v9);
  }
  v10 = objc_msgSend(v9, "count");
  if (v10)
  {
    v11 = 0;
    while (1)
    {
      objc_msgSend(v9, "objectAtIndex:", v11);
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      if (v10 == ++v11)
        return -[WebArchive initWithMainResource:subresources:subframeArchives:](self, "initWithMainResource:subresources:subframeArchives:", v5, v6, v9);
    }
    goto LABEL_16;
  }
  return -[WebArchive initWithMainResource:subresources:subframeArchives:](self, "initWithMainResource:subresources:subframeArchives:", v5, v6, v9);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[WebArchive mainResource](self, "mainResource"), CFSTR("WebMainResource"));
  objc_msgSend(a3, "encodeObject:forKey:", -[WebArchive subresources](self, "subresources"), CFSTR("WebSubresources"));
  objc_msgSend(a3, "encodeObject:forKey:", -[WebArchive subframeArchives](self, "subframeArchives"), CFSTR("WebSubframeArchives"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WebArchive;
  -[WebArchive dealloc](&v3, sel_dealloc);
}

- (WebResource)mainResource
{
  WebArchivePrivate *v3;
  WebArchivePrivate *v4;
  void *v5;
  uint64_t v7;
  _DWORD *v8;
  WebResource *v9;
  uint64_t v10;
  WebArchivePrivate *v11;
  void *m_ptr;
  _DWORD *v13;
  _DWORD *v14;

  v3 = self->_private;
  if (!v3->cachedMainResource.m_ptr)
  {
    v7 = -[WebArchivePrivate coreArchive](v3, "coreArchive");
    if (v7)
    {
      v8 = *(_DWORD **)(v7 + 16);
      if (v8)
      {
        v9 = [WebResource alloc];
        ++v8[2];
        v14 = v8;
        v10 = -[WebResource _initWithCoreResource:](v9, "_initWithCoreResource:", &v14);
        v11 = self->_private;
        m_ptr = v11->cachedMainResource.m_ptr;
        v11->cachedMainResource.m_ptr = (void *)v10;
        if (m_ptr)
          CFRelease(m_ptr);
        v13 = v14;
        v14 = 0;
        if (v13)
        {
          if (v13[2] == 1)
            (*(void (**)(_DWORD *))(*(_QWORD *)v13 + 8))(v13);
          else
            --v13[2];
        }
      }
    }
  }
  v4 = self->_private;
  v5 = v4->cachedMainResource.m_ptr;
  if (v5)
    CFRetain(v4->cachedMainResource.m_ptr);
  return (WebResource *)(id)CFMakeCollectable(v5);
}

- (NSArray)subresources
{
  WebArchivePrivate *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  WebResource *v10;
  _DWORD *v11;
  id v12;
  _DWORD *v13;
  WebArchivePrivate *v14;
  void *m_ptr;
  NSArray *result;
  WebArchivePrivate *v17;
  void *v18;
  id v19;
  WebArchivePrivate *v20;
  _DWORD *v21;

  v3 = self->_private;
  if (!v3->cachedSubresources.m_ptr)
  {
    v4 = -[WebArchivePrivate coreArchive](v3, "coreArchive");
    if (v4)
    {
      v5 = v4;
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(unsigned int *)(v4 + 36));
      v7 = *(unsigned int *)(v5 + 36);
      if ((_DWORD)v7)
      {
        v8 = *(_QWORD *)(v5 + 24);
        for (i = 8 * v7; i; i -= 8)
        {
          v10 = [WebResource alloc];
          v11 = *(_DWORD **)v8;
          v11[2] = *(_DWORD *)(*(_QWORD *)v8 + 8) + 1;
          v21 = v11;
          v12 = -[WebResource _initWithCoreResource:](v10, "_initWithCoreResource:", &v21);
          v13 = v21;
          v21 = 0;
          if (v13)
          {
            if (v13[2] == 1)
            {
              (*(void (**)(_DWORD *))(*(_QWORD *)v13 + 8))(v13);
              if (!v12)
                goto LABEL_5;
LABEL_10:
              objc_msgSend(v6, "addObject:", v12);
              CFRelease(v12);
              goto LABEL_5;
            }
            --v13[2];
          }
          if (v12)
            goto LABEL_10;
LABEL_5:
          v8 += 8;
        }
      }
      v14 = self->_private;
      m_ptr = v14->cachedSubresources.m_ptr;
      v14->cachedSubresources.m_ptr = v6;
      if (m_ptr)
        goto LABEL_14;
    }
    else
    {
      v19 = objc_alloc_init(MEMORY[0x1E0C99D20]);
      v20 = self->_private;
      m_ptr = v20->cachedSubresources.m_ptr;
      v20->cachedSubresources.m_ptr = v19;
      if (m_ptr)
LABEL_14:
        CFRelease(m_ptr);
    }
  }
  result = (NSArray *)objc_msgSend(self->_private->cachedSubresources.m_ptr, "count");
  if (result)
  {
    v17 = self->_private;
    v18 = v17->cachedSubresources.m_ptr;
    if (v18)
      CFRetain(v17->cachedSubresources.m_ptr);
    return (NSArray *)(id)CFMakeCollectable(v18);
  }
  return result;
}

- (NSArray)subframeArchives
{
  WebArchivePrivate *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  WebArchive *v10;
  _DWORD *v11;
  id v12;
  _DWORD *v13;
  WebArchivePrivate *v14;
  void *m_ptr;
  WebArchivePrivate *v16;
  void *v17;
  id v19;
  WebArchivePrivate *v20;
  _DWORD *v21;

  v3 = self->_private;
  if (!v3->cachedSubframeArchives.m_ptr)
  {
    v4 = -[WebArchivePrivate coreArchive](v3, "coreArchive");
    if (v4)
    {
      v5 = v4;
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(unsigned int *)(v4 + 52));
      v7 = *(unsigned int *)(v5 + 52);
      if ((_DWORD)v7)
      {
        v8 = *(_QWORD *)(v5 + 40);
        v9 = 8 * v7;
        while (1)
        {
          v10 = [WebArchive alloc];
          v11 = *(_DWORD **)v8;
          v11[2] = *(_DWORD *)(*(_QWORD *)v8 + 8) + 1;
          v21 = v11;
          v12 = -[WebArchive _initWithCoreLegacyWebArchive:](v10, "_initWithCoreLegacyWebArchive:", &v21);
          v13 = v21;
          v21 = 0;
          if (!v13)
            goto LABEL_9;
          if (v13[2] != 1)
            break;
          (*(void (**)(_DWORD *))(*(_QWORD *)v13 + 8))(v13);
          if (v12)
            goto LABEL_12;
LABEL_5:
          v8 += 8;
          v9 -= 8;
          if (!v9)
            goto LABEL_13;
        }
        --v13[2];
LABEL_9:
        if (!v12)
          goto LABEL_5;
LABEL_12:
        objc_msgSend(v6, "addObject:", v12);
        CFRelease(v12);
        goto LABEL_5;
      }
LABEL_13:
      v14 = self->_private;
      m_ptr = v14->cachedSubframeArchives.m_ptr;
      v14->cachedSubframeArchives.m_ptr = v6;
      if (m_ptr)
        goto LABEL_14;
    }
    else
    {
      v19 = objc_alloc_init(MEMORY[0x1E0C99D20]);
      v20 = self->_private;
      m_ptr = v20->cachedSubframeArchives.m_ptr;
      v20->cachedSubframeArchives.m_ptr = v19;
      if (m_ptr)
LABEL_14:
        CFRelease(m_ptr);
    }
  }
  v16 = self->_private;
  v17 = v16->cachedSubframeArchives.m_ptr;
  if (v17)
    CFRetain(v16->cachedSubframeArchives.m_ptr);
  return (NSArray *)(id)CFMakeCollectable(v17);
}

- (NSData)data
{
  NSData *v2;
  CFTypeRef cf;

  WebCore::LegacyWebArchive::rawDataRepresentation((WebCore::LegacyWebArchive *)-[WebArchivePrivate coreArchive](self->_private, "coreArchive"));
  if (cf)
    CFRetain(cf);
  v2 = (id)CFMakeCollectable(cf);
  if (cf)
    CFRelease(cf);
  return v2;
}

- (id)_initWithCoreLegacyWebArchive:(void *)a3
{
  WebArchive *v4;
  WebArchivePrivate *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WebArchive;
  v4 = -[WebArchive init](&v7, sel_init);
  if (!v4)
    return v4;
  v5 = -[WebArchivePrivate initWithCoreArchive:]([WebArchivePrivate alloc], "initWithCoreArchive:", a3);
  v4->_private = v5;
  if (v5)
    return v4;

  return 0;
}

- (void)_coreLegacyWebArchive
{
  return -[WebArchivePrivate coreArchive](self->_private, "coreArchive");
}

@end
