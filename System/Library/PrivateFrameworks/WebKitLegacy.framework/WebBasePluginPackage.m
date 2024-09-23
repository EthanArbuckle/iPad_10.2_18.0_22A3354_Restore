@implementation WebBasePluginPackage

+ (id)pluginWithPath:(id)a3
{
  return (id)(id)CFMakeCollectable(-[WebPluginPackage initWithPath:]([WebPluginPackage alloc], "initWithPath:", a3));
}

- (WebBasePluginPackage)initWithPath:(id)a3
{
  WebBasePluginPackage *v4;
  StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *m_ptr;
  StringImpl *v8;
  WTF::StringImpl *v9;
  const __CFAllocator *v10;
  void *v11;
  __CFString *v12;
  CFBundleRef v13;
  void *v14;
  WTF::StringImpl *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)WebBasePluginPackage;
  v4 = -[WebBasePluginPackage init](&v17, sel_init);
  if (!v4)
    return v4;
  MEMORY[0x1D82A3998](&v16, objc_msgSend(a3, "stringByResolvingSymlinksInPath"));
  v6 = v16;
  v16 = 0;
  m_ptr = (WTF::StringImpl *)v4->path.m_impl.m_ptr;
  v4->path.m_impl.m_ptr = (StringImpl *)v6;
  if (m_ptr)
  {
    if (*(_DWORD *)m_ptr == 2)
    {
      WTF::StringImpl::destroy(m_ptr, v5);
      v9 = v16;
      v16 = 0;
      if (v9)
      {
        if (*(_DWORD *)v9 == 2)
          WTF::StringImpl::destroy(v9, v8);
        else
          *(_DWORD *)v9 -= 2;
      }
    }
    else
    {
      *(_DWORD *)m_ptr -= 2;
    }
    v6 = (WTF::StringImpl *)v4->path.m_impl.m_ptr;
  }
  v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v11 = (void *)MEMORY[0x1E0C99E98];
  v12 = v6 ? (__CFString *)WTF::StringImpl::operator NSString *() : &stru_1E9D6EC48;
  v13 = CFBundleCreate(v10, (CFURLRef)objc_msgSend(v11, "fileURLWithPath:", v12));
  v14 = v4->cfBundle.m_ptr;
  v4->cfBundle.m_ptr = v13;
  if (v14)
  {
    CFRelease(v14);
    v13 = (CFBundleRef)v4->cfBundle.m_ptr;
  }
  if (v13)
    return v4;

  return 0;
}

- (void)createPropertyListFile
{
  void (*BP_CreatePluginMIMETypesPreferences)(void);

  if (-[WebBasePluginPackage load](self, "load"))
  {
    BP_CreatePluginMIMETypesPreferences = (void (*)(void))self->BP_CreatePluginMIMETypesPreferences;
    if (BP_CreatePluginMIMETypesPreferences)
    {
      BP_CreatePluginMIMETypesPreferences();
      -[WebBasePluginPackage unload](self, "unload");
    }
  }
}

- (id)pListForPath:(id)a3 createFile:(BOOL)a4
{
  id result;

  if (a4)
    -[WebBasePluginPackage createPropertyListFile](self, "createPropertyListFile");
  result = (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", a3);
  if (result)
    return (id)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", result, 0, 0, 0);
  return result;
}

- (id)_objectForInfoDictionaryKey:(id)a3
{
  id result;

  result = CFBundleGetInfoDictionary((CFBundleRef)self->cfBundle.m_ptr);
  if (result)
    return (id)CFDictionaryGetValue((CFDictionaryRef)result, a3);
  return result;
}

- (BOOL)getPluginInfoFromPLists
{
  WebBasePluginPackage *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  WTF *v23;
  WTF *v24;
  void *v25;
  char *v26;
  StringImpl *v27;
  WTF::StringImpl *v28;
  WTF::StringImpl *v29;
  WTF::StringImpl *v30;
  WTF::StringImpl *v31;
  WTF::StringImpl *v32;
  StringImpl *v33;
  WTF::StringImpl *v34;
  WTF::StringImpl *v35;
  int v36;
  uint64_t m_size;
  _QWORD *v38;
  uint64_t v39;
  _DWORD *v40;
  _DWORD *v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  _DWORD **v45;
  uint64_t v46;
  _DWORD *v47;
  WTF::StringImpl **v48;
  uint64_t v49;
  WTF::StringImpl *v50;
  WTF *v51;
  WTF::StringImpl *v52;
  WTF::StringImpl *v53;
  __CFString *v54;
  uint64_t v55;
  StringImpl *v56;
  WTF::StringImpl *v57;
  WTF::StringImpl *m_ptr;
  int v59;
  StringImpl *v60;
  uint64_t v61;
  uint64_t v62;
  StringImpl *v63;
  WTF::StringImpl *v64;
  WTF::StringImpl *v65;
  int v66;
  StringImpl *v67;
  uint64_t v68;
  uint64_t v69;
  StringImpl *v70;
  WTF::StringImpl *v71;
  WTF::StringImpl *v72;
  int v73;
  StringImpl *v74;
  void *v76;
  void *v77;
  Vector<WebCore::MimeClassInfo, 0UL, WTF::CrashOnOverflow, 16UL, WTF::FastMalloc> *p_mimes;
  WebBasePluginPackage *v79;
  void *v80;
  uint64_t v81;
  id obj;
  uint64_t v83;
  uint64_t v84;
  WTF::StringImpl *v85;
  WTF::StringImpl *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  WTF::StringImpl *v95[2];
  WTF *v96[2];
  WTF::StringImpl *v97;
  WTF::StringImpl *v98;
  _BYTE v99[128];
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  if (!self->cfBundle.m_ptr)
  {
    LOBYTE(v3) = 0;
    return (char)v3;
  }
  v2 = self;
  v3 = -[WebBasePluginPackage _objectForInfoDictionaryKey:](self, "_objectForInfoDictionaryKey:", CFSTR("WebPluginMIMETypes"));
  if (v3)
  {
    v4 = v3;
    v5 = (void *)objc_msgSend(v3, "keyEnumerator");
    v6 = objc_msgSend(v5, "nextObject");
    if (v6)
    {
      v7 = v6;
      p_mimes = &v2->pluginInfo.mimes;
      v79 = v2;
      v76 = v5;
      v77 = v4;
      while (1)
      {
        v8 = (void *)objc_msgSend(v4, "objectForKey:", v7);
        v9 = (void *)objc_msgSend(v8, "objectForKey:", CFSTR("WebPluginTypeEnabled"));
        if (v9 && !objc_msgSend(v9, "BOOLValue"))
          goto LABEL_94;
        *(_OWORD *)v95 = 0u;
        *(_OWORD *)v96 = 0u;
        v10 = (void *)objc_msgSend((id)objc_msgSend(v8, "objectForKey:", CFSTR("WebPluginExtensions")), "_web_lowercaseStrings");
        v80 = v8;
        v81 = v7;
        v93 = 0u;
        v94 = 0u;
        v91 = 0u;
        v92 = 0u;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v91, v100, 16);
        if (v11)
        {
          obj = v10;
          v83 = *(_QWORD *)v92;
          do
          {
            v12 = 0;
            v84 = v11;
            do
            {
              if (*(_QWORD *)v92 != v83)
                objc_enumerationMutation(obj);
              v13 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v12);
              v87 = 0u;
              v88 = 0u;
              v89 = 0u;
              v90 = 0u;
              v14 = (void *)objc_msgSend(v13, "componentsSeparatedByString:", CFSTR(","));
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v87, v99, 16);
              if (v15)
              {
                v16 = *(_QWORD *)v88;
                do
                {
                  for (i = 0; i != v15; ++i)
                  {
                    if (*(_QWORD *)v88 != v16)
                      objc_enumerationMutation(v14);
                    v18 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * i);
                    v19 = HIDWORD(v96[1]);
                    if (HIDWORD(v96[1]) == LODWORD(v96[1]))
                    {
                      v20 = HIDWORD(v96[1]) + ((unint64_t)HIDWORD(v96[1]) >> 2);
                      if (v20 >= 0x10)
                        v21 = v20 + 1;
                      else
                        v21 = 16;
                      if (v21 <= (unint64_t)HIDWORD(v96[1]) + 1)
                        v22 = HIDWORD(v96[1]) + 1;
                      else
                        v22 = v21;
                      if (v22 >> 29)
                        goto LABEL_125;
                      v23 = v96[0];
                      v24 = (WTF *)WTF::fastMalloc((WTF *)(8 * v22));
                      LODWORD(v96[1]) = v22;
                      v96[0] = v24;
                      memcpy(v24, v23, 8 * v19);
                      if (v23)
                      {
                        if (v96[0] == v23)
                        {
                          v96[0] = 0;
                          LODWORD(v96[1]) = 0;
                        }
                        WTF::fastFree(v23, v25);
                      }
                      v26 = (char *)v96[0] + 8 * HIDWORD(v96[1]);
                    }
                    else
                    {
                      v26 = (char *)v96[0] + 8 * HIDWORD(v96[1]);
                    }
                    MEMORY[0x1D82A3998](v26, v18);
                    ++HIDWORD(v96[1]);
                  }
                  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v87, v99, 16);
                }
                while (v15);
              }
              ++v12;
            }
            while (v12 != v84);
            v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v100, 16);
          }
          while (v11);
        }
        MEMORY[0x1D82A3998](&v85, v81);
        WTF::String::convertToASCIILowercase((WTF::String *)&v85);
        v28 = v86;
        v86 = 0;
        v2 = v79;
        if (v28)
        {
          v97 = v28;
          if ((*((_BYTE *)v28 + 16) & 0x10) == 0)
          {
            WTF::AtomStringImpl::addSlowCase();
            v29 = v97;
            v28 = v98;
            v97 = 0;
            v98 = 0;
            if (v29)
            {
              if (*(_DWORD *)v29 == 2)
                WTF::StringImpl::destroy(v29, v27);
              else
                *(_DWORD *)v29 -= 2;
            }
          }
        }
        v30 = v95[0];
        v95[0] = v28;
        if (!v30)
          goto LABEL_45;
        if (*(_DWORD *)v30 != 2)
          break;
        WTF::StringImpl::destroy(v30, v27);
        v31 = v86;
        v86 = 0;
        if (!v31)
          goto LABEL_50;
LABEL_48:
        if (*(_DWORD *)v31 != 2)
        {
          *(_DWORD *)v31 -= 2;
LABEL_50:
          v32 = v85;
          v85 = 0;
          if (v32)
            goto LABEL_53;
          goto LABEL_56;
        }
        WTF::StringImpl::destroy(v31, v27);
        v32 = v85;
        v85 = 0;
        if (v32)
        {
LABEL_53:
          if (*(_DWORD *)v32 == 2)
            WTF::StringImpl::destroy(v32, v27);
          else
            *(_DWORD *)v32 -= 2;
        }
LABEL_56:
        MEMORY[0x1D82A3998](&v98, objc_msgSend(v80, "objectForKey:", CFSTR("WebPluginTypeDescription")));
        v34 = v98;
        v98 = 0;
        v35 = v95[1];
        v95[1] = v34;
        if (!v35)
          goto LABEL_61;
        v36 = *(_DWORD *)v35 - 2;
        if (*(_DWORD *)v35 != 2)
          goto LABEL_60;
        WTF::StringImpl::destroy(v35, v33);
        v35 = v98;
        v98 = 0;
        if (!v35)
          goto LABEL_61;
        v36 = *(_DWORD *)v35 - 2;
        if (*(_DWORD *)v35 != 2)
        {
LABEL_60:
          *(_DWORD *)v35 = v36;
LABEL_61:
          m_size = v79->pluginInfo.mimes.m_size;
          if ((_DWORD)m_size == v79->pluginInfo.mimes.m_capacity)
            goto LABEL_62;
          goto LABEL_64;
        }
        WTF::StringImpl::destroy(v35, v33);
        m_size = v79->pluginInfo.mimes.m_size;
        if ((_DWORD)m_size == v79->pluginInfo.mimes.m_capacity)
        {
LABEL_62:
          v38 = WTF::Vector<WebCore::MimeClassInfo,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)p_mimes, m_size + 1, (unint64_t)v95);
          v39 = (uint64_t)v79->pluginInfo.mimes.m_buffer + 32 * v79->pluginInfo.mimes.m_size;
          goto LABEL_65;
        }
LABEL_64:
        v39 = (uint64_t)p_mimes->m_buffer + 32 * m_size;
        v38 = v95;
LABEL_65:
        v40 = (_DWORD *)*v38;
        if (*v38)
          *v40 += 2;
        *(_QWORD *)v39 = v40;
        v41 = (_DWORD *)v38[1];
        if (v41)
          *v41 += 2;
        *(_QWORD *)(v39 + 8) = v41;
        v42 = *((unsigned int *)v38 + 7);
        *(_QWORD *)(v39 + 16) = 0;
        *(_QWORD *)(v39 + 24) = 0;
        *(_DWORD *)(v39 + 28) = v42;
        if ((_DWORD)v42)
        {
          if (v42 >> 29)
          {
LABEL_125:
            __break(0xC471u);
            JUMPOUT(0x1D80394D8);
          }
          v43 = (_QWORD *)WTF::fastMalloc((WTF *)(8 * v42));
          *(_DWORD *)(v39 + 24) = v42;
          *(_QWORD *)(v39 + 16) = v43;
          v44 = *((unsigned int *)v38 + 7);
          if ((_DWORD)v44)
          {
            v45 = (_DWORD **)v38[2];
            v46 = 8 * v44;
            do
            {
              v47 = *v45;
              if (*v45)
                *v47 += 2;
              *v43++ = v47;
              ++v45;
              v46 -= 8;
            }
            while (v46);
          }
        }
        ++v79->pluginInfo.mimes.m_size;
        if (HIDWORD(v96[1]))
        {
          v48 = (WTF::StringImpl **)v96[0];
          v49 = 8 * HIDWORD(v96[1]);
          do
          {
            v50 = *v48;
            *v48 = 0;
            if (v50)
            {
              if (*(_DWORD *)v50 == 2)
                WTF::StringImpl::destroy(v50, v33);
              else
                *(_DWORD *)v50 -= 2;
            }
            ++v48;
            v49 -= 8;
          }
          while (v49);
        }
        v51 = v96[0];
        if (v96[0])
        {
          v96[0] = 0;
          LODWORD(v96[1]) = 0;
          WTF::fastFree(v51, v33);
        }
        v52 = v95[1];
        v95[1] = 0;
        v5 = v76;
        v4 = v77;
        if (!v52)
          goto LABEL_88;
        if (*(_DWORD *)v52 != 2)
        {
          *(_DWORD *)v52 -= 2;
LABEL_88:
          v53 = v95[0];
          v95[0] = 0;
          if (v53)
            goto LABEL_91;
          goto LABEL_94;
        }
        WTF::StringImpl::destroy(v52, v33);
        v53 = v95[0];
        v95[0] = 0;
        if (v53)
        {
LABEL_91:
          if (*(_DWORD *)v53 == 2)
            WTF::StringImpl::destroy(v53, v33);
          else
            *(_DWORD *)v53 -= 2;
        }
LABEL_94:
        v7 = objc_msgSend(v5, "nextObject");
        if (!v7)
          goto LABEL_95;
      }
      *(_DWORD *)v30 -= 2;
LABEL_45:
      v31 = v86;
      v86 = 0;
      if (!v31)
        goto LABEL_50;
      goto LABEL_48;
    }
LABEL_95:
    if (v2->path.m_impl.m_ptr)
      v54 = (__CFString *)WTF::StringImpl::operator NSString *();
    else
      v54 = &stru_1E9D6EC48;
    v55 = -[__CFString lastPathComponent](v54, "lastPathComponent");
    MEMORY[0x1D82A3998](v95, v55);
    v57 = v95[0];
    v95[0] = 0;
    m_ptr = (WTF::StringImpl *)v2->pluginInfo.file.m_impl.m_ptr;
    v2->pluginInfo.file.m_impl.m_ptr = (StringImpl *)v57;
    if (m_ptr)
    {
      v59 = *(_DWORD *)m_ptr - 2;
      if (*(_DWORD *)m_ptr != 2)
        goto LABEL_104;
      WTF::StringImpl::destroy(m_ptr, v56);
      m_ptr = v95[0];
      v95[0] = 0;
      if (!m_ptr)
        goto LABEL_105;
      v59 = *(_DWORD *)m_ptr - 2;
      if (*(_DWORD *)m_ptr == 2)
        WTF::StringImpl::destroy(m_ptr, v60);
      else
LABEL_104:
        *(_DWORD *)m_ptr = v59;
    }
LABEL_105:
    v61 = -[WebBasePluginPackage _objectForInfoDictionaryKey:](v2, "_objectForInfoDictionaryKey:", CFSTR("WebPluginName"));
    if (v61)
      v62 = v61;
    else
      v62 = v55;
    MEMORY[0x1D82A3998](v95, v62);
    v64 = v95[0];
    v95[0] = 0;
    v65 = (WTF::StringImpl *)v2->pluginInfo.name.m_impl.m_ptr;
    v2->pluginInfo.name.m_impl.m_ptr = (StringImpl *)v64;
    if (v65)
    {
      v66 = *(_DWORD *)v65 - 2;
      if (*(_DWORD *)v65 != 2)
        goto LABEL_112;
      WTF::StringImpl::destroy(v65, v63);
      v65 = v95[0];
      v95[0] = 0;
      if (!v65)
        goto LABEL_113;
      v66 = *(_DWORD *)v65 - 2;
      if (*(_DWORD *)v65 == 2)
        WTF::StringImpl::destroy(v65, v67);
      else
LABEL_112:
        *(_DWORD *)v65 = v66;
    }
LABEL_113:
    v68 = -[WebBasePluginPackage _objectForInfoDictionaryKey:](v2, "_objectForInfoDictionaryKey:", CFSTR("WebPluginDescription"));
    if (v68)
      v69 = v68;
    else
      v69 = v55;
    MEMORY[0x1D82A3998](v95, v69);
    v71 = v95[0];
    v95[0] = 0;
    v72 = (WTF::StringImpl *)v2->pluginInfo.desc.m_impl.m_ptr;
    v2->pluginInfo.desc.m_impl.m_ptr = (StringImpl *)v71;
    if (!v72)
      goto LABEL_121;
    v73 = *(_DWORD *)v72 - 2;
    if (*(_DWORD *)v72 == 2)
    {
      WTF::StringImpl::destroy(v72, v70);
      v72 = v95[0];
      v95[0] = 0;
      if (!v72)
      {
LABEL_121:
        *(_WORD *)&v2->pluginInfo.isApplicationPlugin = 0;
        LOBYTE(v3) = 1;
        return (char)v3;
      }
      v73 = *(_DWORD *)v72 - 2;
      if (*(_DWORD *)v72 == 2)
      {
        WTF::StringImpl::destroy(v72, v74);
        goto LABEL_121;
      }
    }
    *(_DWORD *)v72 = v73;
    goto LABEL_121;
  }
  return (char)v3;
}

- (BOOL)load
{
  __CFBundle *m_ptr;

  m_ptr = (__CFBundle *)self->cfBundle.m_ptr;
  if (!m_ptr || self->BP_CreatePluginMIMETypesPreferences)
    return 1;
  self->BP_CreatePluginMIMETypesPreferences = CFBundleGetFunctionPointerForName(m_ptr, CFSTR("BP_CreatePluginMIMETypesPreferences"));
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WebBasePluginPackage;
  -[WebBasePluginPackage dealloc](&v3, sel_dealloc);
}

- (const)path
{
  return &self->path;
}

- (const)pluginInfo
{
  return &self->pluginInfo;
}

- (BOOL)supportsExtension:(const void *)a3
{
  uint64_t m_size;
  MimeClassInfo *m_buffer;
  MimeClassInfo *v6;
  uint64_t v7;

  m_size = self->pluginInfo.mimes.m_size;
  if (!(_DWORD)m_size)
    return 0;
  m_buffer = self->pluginInfo.mimes.m_buffer;
  v6 = (MimeClassInfo *)((char *)m_buffer + 32 * m_size);
  while (!*((_DWORD *)m_buffer + 7))
  {
LABEL_3:
    m_buffer = (MimeClassInfo *)((char *)m_buffer + 32);
    if (m_buffer == v6)
      return 0;
  }
  v7 = 0;
  while ((WTF::equal(*(WTF **)(*((_QWORD *)m_buffer + 2) + 8 * v7), *(const WTF::StringImpl **)a3, (const WTF::StringImpl *)a3) & 1) == 0)
  {
    if (++v7 >= (unint64_t)*((unsigned int *)m_buffer + 7))
      goto LABEL_3;
  }
  return 1;
}

- (BOOL)supportsMIMEType:(const void *)a3
{
  uint64_t m_size;
  MimeClassInfo *m_buffer;
  uint64_t v6;
  WTF *v7;
  BOOL result;
  uint64_t v9;

  m_size = self->pluginInfo.mimes.m_size;
  if (!(_DWORD)m_size)
    return 0;
  m_buffer = self->pluginInfo.mimes.m_buffer;
  v6 = 32 * m_size - 32;
  do
  {
    v7 = *(WTF **)m_buffer;
    m_buffer = (MimeClassInfo *)((char *)m_buffer + 32);
    result = WTF::equal(v7, *(const WTF::StringImpl **)a3, (const WTF::StringImpl *)a3);
    if (result)
      break;
    v9 = v6;
    v6 -= 32;
  }
  while (v9);
  return result;
}

- (id)MIMETypeForExtension:(const void *)a3
{
  uint64_t m_size;
  MimeClassInfo *m_buffer;
  MimeClassInfo *v6;
  uint64_t v7;

  m_size = self->pluginInfo.mimes.m_size;
  if (!(_DWORD)m_size)
    return 0;
  m_buffer = self->pluginInfo.mimes.m_buffer;
  v6 = (MimeClassInfo *)((char *)m_buffer + 32 * m_size);
  while (!*((_DWORD *)m_buffer + 7))
  {
LABEL_3:
    m_buffer = (MimeClassInfo *)((char *)m_buffer + 32);
    if (m_buffer == v6)
      return 0;
  }
  v7 = 0;
  while ((WTF::equal(*(WTF **)(*((_QWORD *)m_buffer + 2) + 8 * v7), *(const WTF::StringImpl **)a3, (const WTF::StringImpl *)a3) & 1) == 0)
  {
    if (++v7 >= (unint64_t)*((unsigned int *)m_buffer + 7))
      goto LABEL_3;
  }
  if (*(_QWORD *)m_buffer)
    return (id)WTF::StringImpl::operator NSString *();
  else
    return &stru_1E9D6EC48;
}

- (BOOL)isQuickTimePlugIn
{
  StringImpl *v2;
  char v3;
  WebBasePluginPackage *v5;

  if (self)
  {
    -[WebBasePluginPackage bundleIdentifier](self, "bundleIdentifier");
    self = v5;
  }
  else
  {
    v5 = 0;
  }
  v3 = MEMORY[0x1D82A392C](self, "com.apple.quicktime.webplugin", 29);
  if (!v5)
    return v3;
  if (LODWORD(v5->super.isa) != 2)
  {
    LODWORD(v5->super.isa) -= 2;
    return v3;
  }
  WTF::StringImpl::destroy((WTF::StringImpl *)v5, v2);
  return v3;
}

- (BOOL)isJavaPlugIn
{
  StringImpl *v2;
  char v3;
  WebBasePluginPackage *v5;

  if (self)
  {
    -[WebBasePluginPackage bundleIdentifier](self, "bundleIdentifier");
    self = v5;
  }
  else
  {
    v5 = 0;
  }
  if ((MEMORY[0x1D82A392C](self, "com.apple.JavaPluginCocoa", 25) & 1) != 0)
    v3 = 1;
  else
    v3 = MEMORY[0x1D82A392C](v5, "com.apple.JavaAppletPlugin", 26);
  if (!v5)
    return v3;
  if (LODWORD(v5->super.isa) != 2)
  {
    LODWORD(v5->super.isa) -= 2;
    return v3;
  }
  WTF::StringImpl::destroy((WTF::StringImpl *)v5, v2);
  return v3;
}

- (BOOL)isNativeLibraryData:(id)a3
{
  uint64_t v4;
  size_t v5;
  unint64_t v6;
  unint64_t v7;
  WTF *v8;
  void *v9;
  BOOL v10;
  WTF *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int8x16_t *v19;
  uint64_t v20;
  int8x16_t v21;
  uint64_t v22;
  unsigned int *v23;
  uint32_t v24;
  fat_arch *v25;
  int8x16_t *v26;
  uint64_t v27;
  int8x16_t v28;
  uint64_t v29;
  unsigned int *v30;
  int8x16_t *v31;
  uint64_t v32;
  int8x16_t v33;
  uint64_t v34;
  unsigned int *v35;
  const NXArchInfo *v36;
  WTF *v37;
  _QWORD v41[2];
  int v42;
  WTF *v43;
  int v44;
  unsigned int v45;
  _BYTE v46[512];

  v4 = objc_msgSend(a3, "length");
  v5 = v4;
  v6 = v4 + 3;
  v7 = (unint64_t)(v4 + 3) >> 2;
  v43 = (WTF *)v46;
  v44 = 128;
  v45 = v7;
  v8 = (WTF *)v46;
  if ((unint64_t)(v4 + 3) >= 0x204)
  {
    if (HIDWORD(v6))
    {
      __break(0xC471u);
      return v4;
    }
    v8 = (WTF *)WTF::fastMalloc((WTF *)(v6 & 0xFFFFFFFFFFFFFFFCLL));
    v44 = v7;
    v43 = v8;
  }
  memcpy(v8, (const void *)objc_msgSend(a3, "bytes"), v5);
  v10 = 0;
  v41[0] = 0;
  v41[1] = 0;
  v42 = 0;
  if (v5 < 0x20)
  {
LABEL_46:
    v37 = v43;
    if (v46 == (_BYTE *)v43 || v43 == 0)
      goto LABEL_51;
    goto LABEL_50;
  }
  v10 = 0;
  v11 = v43;
  v12 = *(_DWORD *)v43;
  if (*(int *)v43 > -805638659)
  {
    if (v12 != -805638658)
    {
      if (v12 != -17958194 && v12 != -17958193)
        goto LABEL_46;
      goto LABEL_43;
    }
    v17 = v45;
    if (v45)
    {
      if (v45 >= 8)
      {
        v18 = v45 & 0xFFFFFFF8;
        v26 = (int8x16_t *)((char *)v43 + 16);
        v27 = v18;
        do
        {
          v28 = vrev32q_s8(*v26);
          v26[-1] = vrev32q_s8(v26[-1]);
          *v26 = v28;
          v26 += 2;
          v27 -= 8;
        }
        while (v27);
        if (v18 == v17)
          goto LABEL_43;
      }
      else
      {
        v18 = 0;
      }
      v29 = v17 - v18;
      v30 = (unsigned int *)((char *)v11 + 4 * v18);
      do
      {
        *v30 = bswap32(*v30);
        ++v30;
        --v29;
      }
      while (v29);
    }
    goto LABEL_43;
  }
  if (v12 == -1095041334)
  {
    v15 = v45;
    if (!v45)
      goto LABEL_27;
    if (v45 >= 8)
    {
      v16 = v45 & 0xFFFFFFF8;
      v19 = (int8x16_t *)((char *)v43 + 16);
      v20 = v16;
      do
      {
        v21 = vrev32q_s8(*v19);
        v19[-1] = vrev32q_s8(v19[-1]);
        *v19 = v21;
        v19 += 2;
        v20 -= 8;
      }
      while (v20);
      if (v16 == v15)
        goto LABEL_27;
    }
    else
    {
      v16 = 0;
    }
    v22 = v15 - v16;
    v23 = (unsigned int *)((char *)v11 + 4 * v16);
    do
    {
      *v23 = bswap32(*v23);
      ++v23;
      --v22;
    }
    while (v22);
    goto LABEL_27;
  }
  if (v12 != -889275714)
  {
    if (v12 != -822415874)
      goto LABEL_46;
    v13 = v45;
    if (!v45)
      goto LABEL_43;
    if (v45 >= 8)
    {
      v14 = v45 & 0xFFFFFFF8;
      v31 = (int8x16_t *)((char *)v43 + 16);
      v32 = v14;
      do
      {
        v33 = vrev32q_s8(*v31);
        v31[-1] = vrev32q_s8(v31[-1]);
        *v31 = v33;
        v31 += 2;
        v32 -= 8;
      }
      while (v32);
      if (v14 == v13)
        goto LABEL_43;
    }
    else
    {
      v14 = 0;
    }
    v34 = v13 - v14;
    v35 = (unsigned int *)((char *)v11 + 4 * v14);
    do
    {
      *v35 = bswap32(*v35);
      ++v35;
      --v34;
    }
    while (v34);
LABEL_43:
    v41[0] = *(_QWORD *)((char *)v11 + 4);
    v24 = 1;
    v25 = (fat_arch *)v41;
    goto LABEL_44;
  }
LABEL_27:
  if (*((_DWORD *)v11 + 1) >= ((v5 - 8) / 0x14))
    v24 = (v5 - 8) / 0x14;
  else
    v24 = *((_DWORD *)v11 + 1);
  if (!v24)
    goto LABEL_52;
  v25 = (fat_arch *)((char *)v11 + 8);
LABEL_44:
  v36 = NXGetLocalArchInfo();
  if (v36)
  {
    v10 = NXFindBestFatArch(v36->cputype, v36->cpusubtype, v25, v24) != 0;
    goto LABEL_46;
  }
LABEL_52:
  v10 = 0;
  v37 = v43;
  if (v46 == (_BYTE *)v43 || v43 == 0)
    goto LABEL_51;
LABEL_50:
  v43 = 0;
  v44 = 0;
  WTF::fastFree(v37, v9);
LABEL_51:
  LOBYTE(v4) = v10;
  return v4;
}

- (unsigned)versionNumber
{
  return CFBundleGetVersionNumber((CFBundleRef)self->cfBundle.m_ptr);
}

- (void)wasAddedToPluginDatabase:(id)a3
{
  NSMutableSet *pluginDatabases;

  pluginDatabases = self->pluginDatabases;
  if (!pluginDatabases)
  {
    pluginDatabases = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    self->pluginDatabases = pluginDatabases;
  }
  -[NSMutableSet addObject:](pluginDatabases, "addObject:");
}

- (void)wasRemovedFromPluginDatabase:(id)a3
{
  -[NSMutableSet removeObject:](self->pluginDatabases, "removeObject:", a3);
}

- (String)bundleIdentifier
{
  CFBundleGetIdentifier((CFBundleRef)self->cfBundle.m_ptr);
  JUMPOUT(0x1D82A3998);
}

- (String)bundleVersion
{
  _QWORD *v2;
  _QWORD *v3;
  const __CFDictionary *InfoDictionary;
  const void *Value;

  v3 = v2;
  InfoDictionary = CFBundleGetInfoDictionary((CFBundleRef)self->cfBundle.m_ptr);
  if (InfoDictionary)
  {
    Value = CFDictionaryGetValue(InfoDictionary, (const void *)*MEMORY[0x1E0C9AE90]);
    if (Value)
    {
      CFGetTypeID(Value);
      CFStringGetTypeID();
    }
    JUMPOUT(0x1D82A3998);
  }
  *v3 = 0;
  return (String)InfoDictionary;
}

- (void).cxx_destruct
{
  void *m_ptr;
  StringImpl *v4;
  uint64_t m_size;
  MimeClassInfo *m_buffer;
  MimeClassInfo *v7;
  uint64_t v8;
  WTF::StringImpl **v9;
  uint64_t v10;
  WTF::StringImpl *v11;
  WTF *v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  MimeClassInfo *v15;
  StringImpl *v16;
  WTF::StringImpl *v17;
  StringImpl *v18;
  StringImpl *v19;

  m_ptr = self->cfBundle.m_ptr;
  self->cfBundle.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->pluginInfo.bundleIdentifier.m_impl.m_ptr;
  self->pluginInfo.bundleIdentifier.m_impl.m_ptr = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2)
    {
      WTF::StringImpl::destroy((WTF::StringImpl *)v4, (StringImpl *)a2);
      m_size = self->pluginInfo.mimes.m_size;
      if (!(_DWORD)m_size)
        goto LABEL_29;
      goto LABEL_9;
    }
    *(_DWORD *)v4 -= 2;
  }
  m_size = self->pluginInfo.mimes.m_size;
  if ((_DWORD)m_size)
  {
LABEL_9:
    m_buffer = self->pluginInfo.mimes.m_buffer;
    v7 = (MimeClassInfo *)((char *)m_buffer + 32 * m_size);
    while (1)
    {
      v8 = *((unsigned int *)m_buffer + 7);
      if ((_DWORD)v8)
      {
        v9 = (WTF::StringImpl **)*((_QWORD *)m_buffer + 2);
        v10 = 8 * v8;
        do
        {
          v11 = *v9;
          *v9 = 0;
          if (v11)
          {
            if (*(_DWORD *)v11 == 2)
              WTF::StringImpl::destroy(v11, (StringImpl *)a2);
            else
              *(_DWORD *)v11 -= 2;
          }
          ++v9;
          v10 -= 8;
        }
        while (v10);
      }
      v12 = (WTF *)*((_QWORD *)m_buffer + 2);
      if (v12)
      {
        *((_QWORD *)m_buffer + 2) = 0;
        *((_DWORD *)m_buffer + 6) = 0;
        WTF::fastFree(v12, (void *)a2);
      }
      v13 = (WTF::StringImpl *)*((_QWORD *)m_buffer + 1);
      *((_QWORD *)m_buffer + 1) = 0;
      if (!v13)
        goto LABEL_24;
      if (*(_DWORD *)v13 != 2)
        break;
      WTF::StringImpl::destroy(v13, (StringImpl *)a2);
      v14 = *(WTF::StringImpl **)m_buffer;
      *(_QWORD *)m_buffer = 0;
      if (v14)
      {
LABEL_27:
        if (*(_DWORD *)v14 == 2)
          WTF::StringImpl::destroy(v14, (StringImpl *)a2);
        else
          *(_DWORD *)v14 -= 2;
      }
LABEL_11:
      m_buffer = (MimeClassInfo *)((char *)m_buffer + 32);
      if (m_buffer == v7)
        goto LABEL_29;
    }
    *(_DWORD *)v13 -= 2;
LABEL_24:
    v14 = *(WTF::StringImpl **)m_buffer;
    *(_QWORD *)m_buffer = 0;
    if (v14)
      goto LABEL_27;
    goto LABEL_11;
  }
LABEL_29:
  v15 = self->pluginInfo.mimes.m_buffer;
  if (v15)
  {
    self->pluginInfo.mimes.m_buffer = 0;
    self->pluginInfo.mimes.m_capacity = 0;
    WTF::fastFree((WTF *)v15, (void *)a2);
  }
  v16 = self->pluginInfo.desc.m_impl.m_ptr;
  self->pluginInfo.desc.m_impl.m_ptr = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2)
    {
      WTF::StringImpl::destroy((WTF::StringImpl *)v16, (StringImpl *)a2);
      v17 = (WTF::StringImpl *)self->pluginInfo.file.m_impl.m_ptr;
      self->pluginInfo.file.m_impl.m_ptr = 0;
      if (!v17)
        goto LABEL_39;
      goto LABEL_37;
    }
    *(_DWORD *)v16 -= 2;
  }
  v17 = (WTF::StringImpl *)self->pluginInfo.file.m_impl.m_ptr;
  self->pluginInfo.file.m_impl.m_ptr = 0;
  if (!v17)
  {
LABEL_39:
    v18 = self->pluginInfo.name.m_impl.m_ptr;
    self->pluginInfo.name.m_impl.m_ptr = 0;
    if (!v18)
      goto LABEL_44;
    goto LABEL_42;
  }
LABEL_37:
  if (*(_DWORD *)v17 != 2)
  {
    *(_DWORD *)v17 -= 2;
    goto LABEL_39;
  }
  WTF::StringImpl::destroy(v17, (StringImpl *)a2);
  v18 = self->pluginInfo.name.m_impl.m_ptr;
  self->pluginInfo.name.m_impl.m_ptr = 0;
  if (!v18)
    goto LABEL_44;
LABEL_42:
  if (*(_DWORD *)v18 == 2)
  {
    WTF::StringImpl::destroy((WTF::StringImpl *)v18, (StringImpl *)a2);
    v19 = self->path.m_impl.m_ptr;
    self->path.m_impl.m_ptr = 0;
    if (!v19)
      return;
    goto LABEL_47;
  }
  *(_DWORD *)v18 -= 2;
LABEL_44:
  v19 = self->path.m_impl.m_ptr;
  self->path.m_impl.m_ptr = 0;
  if (!v19)
    return;
LABEL_47:
  if (*(_DWORD *)v19 == 2)
    WTF::StringImpl::destroy((WTF::StringImpl *)v19, (StringImpl *)a2);
  else
    *(_DWORD *)v19 -= 2;
}

- (id).cxx_construct
{
  *((_WORD *)self + 32) = 0;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  return self;
}

@end
