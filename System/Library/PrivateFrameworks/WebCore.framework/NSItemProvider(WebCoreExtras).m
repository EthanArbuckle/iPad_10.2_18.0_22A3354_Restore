@implementation NSItemProvider(WebCoreExtras)

- (uint64_t)web_containsFileURLAndFileUploadContent
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
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
  v2 = (void *)objc_msgSend(a1, "registeredTypeIdentifiers", 0);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v9;
    v6 = (const __CFString *)*MEMORY[0x1E0CA5B48];
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        if (UTTypeConformsTo(*(CFStringRef *)(*((_QWORD *)&v8 + 1) + 8 * v7), v6))
          return objc_msgSend((id)objc_msgSend(a1, "web_fileUploadContentTypes"), "count") != 0;
        ++v7;
      }
      while (v4 != v7);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v4 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (CFTypeRef)web_fileUploadContentTypes
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t i;
  __CFString *v7;
  WebCore::Pasteboard *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *cf;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  cf = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = (void *)objc_msgSend(a1, "registeredTypeIdentifiers");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v16;
    v5 = (const __CFString *)*MEMORY[0x1E0CA5C90];
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v16 != v4)
          objc_enumerationMutation(v2);
        v7 = *(__CFString **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (!UTTypeConformsTo(v7, v5))
        {
          v8 = (WebCore::Pasteboard *)-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("com.apple.mapkit.map-item"));
          if ((v8 & 1) == 0)
          {
            v9 = (void *)WebCore::Pasteboard::supportedFileUploadPasteboardTypes(v8);
            v19 = 0u;
            v20 = 0u;
            v21 = 0u;
            v22 = 0u;
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
            if (v10)
            {
              v11 = *(_QWORD *)v20;
              while (2)
              {
                for (j = 0; j != v10; ++j)
                {
                  if (*(_QWORD *)v20 != v11)
                    objc_enumerationMutation(v9);
                  if (UTTypeConformsTo(v7, *(CFStringRef *)(*((_QWORD *)&v19 + 1) + 8 * j)))
                  {
                    objc_msgSend(cf, "addObject:", v7);
                    goto LABEL_18;
                  }
                }
                v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
                if (v10)
                  continue;
                break;
              }
            }
          }
        }
LABEL_18:
        ;
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v3);
  }
  return (id)CFMakeCollectable(cf);
}

@end
