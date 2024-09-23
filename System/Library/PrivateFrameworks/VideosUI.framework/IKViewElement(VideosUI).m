@implementation IKViewElement(VideosUI)

- (VUIViewElementDataSource)vui_DataSource
{
  VUIViewElementDataSource *v2;
  void *v3;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("ViewElementDataSourceKey"));
  v2 = (VUIViewElementDataSource *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(a1, "dataDictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = -[VUIViewElementDataSource initWithDataDictionary:viewElement:]([VUIViewElementDataSource alloc], "initWithDataDictionary:viewElement:", v3, a1);
    if (v2)
      objc_msgSend(a1, "setObject:forKeyedSubscript:", v2, CFSTR("ViewElementDataSourceKey"));

  }
  return v2;
}

- (id)vui_updateEventDescriptors
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  VUIAppDocumentPurchaseEventDescriptor *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  VUIAppDocumentRefreshEventDescriptor *v29;
  uint64_t v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v38;
  char v39;
  _BYTE v40[15];
  char v41;
  _BYTE v42[15];
  char v43;
  _BYTE v44[7];
  unint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v38 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(a1, "attributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vui_stringForKey:", CFSTR("vui-update-events"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v33 = v2;
    v34 = v1;
    objc_msgSend(v2, "componentsSeparatedByString:", CFSTR(","));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (!v5)
      goto LABEL_36;
    v6 = v5;
    v7 = *(_QWORD *)v47;
    v36 = v4;
    while (1)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v47 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR(":"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");
        if (v10)
        {
          v11 = v10;
          v45 = 0;
          objc_msgSend(v9, "objectAtIndex:", 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!VUIAppDocumentUpdateEventTypeFromStringRepresentation(v14, (uint64_t *)&v45))
            goto LABEL_33;
          if (v45 <= 2)
          {
            if (v11 <= 1)
            {
              VUIDefaultLogObject();
              v15 = (VUIAppDocumentPurchaseEventDescriptor *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(&v15->super.super, OS_LOG_TYPE_ERROR))
                -[IKViewElement(VideosUI) vui_updateEventDescriptors].cold.1(&v43, v44);
              goto LABEL_32;
            }
            objc_msgSend(v9, "objectAtIndex:", 1);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "stringByTrimmingCharactersInSet:", v17);
            v15 = (VUIAppDocumentPurchaseEventDescriptor *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", v15);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "unsignedIntegerValue");
            if (v19)
            {
              v20 = v19;
              if (v11 < 3)
              {
                v22 = 0;
              }
              else
              {
                objc_msgSend(v9, "objectAtIndex:", 2);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "stringByTrimmingCharactersInSet:", v21);
                v22 = (void *)objc_claimAutoreleasedReturnValue();

              }
              v29 = [VUIAppDocumentRefreshEventDescriptor alloc];
              v30 = -[VUIAppDocumentRefreshEventDescriptor initWithEventType:delayInSeconds:name:](v29, "initWithEventType:delayInSeconds:name:", v45, v20, v22);

              v15 = (VUIAppDocumentPurchaseEventDescriptor *)v30;
              v4 = v36;
              goto LABEL_30;
            }
            VUIDefaultLogObject();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              -[IKViewElement(VideosUI) vui_updateEventDescriptors].cold.2(&v41, v42);

LABEL_32:
LABEL_33:

            goto LABEL_34;
          }
          if (v45 == 17)
          {
            v23 = (void *)objc_opt_class();
            v24 = 17;
          }
          else
          {
            if (v45 == 4)
            {
              if (v11 <= 1)
              {
                VUIDefaultLogObject();
                v15 = (VUIAppDocumentPurchaseEventDescriptor *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(&v15->super.super, OS_LOG_TYPE_ERROR))
                  -[IKViewElement(VideosUI) vui_updateEventDescriptors].cold.3(&v39, v40);
                goto LABEL_32;
              }
              objc_msgSend(v9, "objectAtIndex:", 1);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "stringByTrimmingCharactersInSet:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              v4 = v36;
              v15 = -[VUIAppDocumentPurchaseEventDescriptor initWithCanonicalID:]([VUIAppDocumentPurchaseEventDescriptor alloc], "initWithCanonicalID:", v28);

              goto LABEL_30;
            }
            v23 = (void *)objc_opt_class();
            v24 = v45;
          }
          objc_msgSend(v23, "_vui_updateEventDescriptorWithType:", v24);
          v15 = (VUIAppDocumentPurchaseEventDescriptor *)objc_claimAutoreleasedReturnValue();
LABEL_30:
          if (v15)
          {
            objc_msgSend(v38, "addObject:", v15);
            goto LABEL_32;
          }
          goto LABEL_33;
        }
LABEL_34:

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      if (!v6)
      {
LABEL_36:

        v3 = v33;
        v1 = v34;
        break;
      }
    }
  }
  v31 = (void *)objc_msgSend(v38, "copy");

  return v31;
}

- (id)vui_title
{
  objc_msgSend(a1, "_parseElementIfNecessary");
  return objc_getAssociatedObject(a1, CFSTR("VideosTitle"));
}

- (id)vui_description
{
  objc_msgSend(a1, "_parseElementIfNecessary");
  return objc_getAssociatedObject(a1, CFSTR("VideosDescription"));
}

- (id)vui_imageURL
{
  objc_msgSend(a1, "_parseElementIfNecessary");
  return objc_getAssociatedObject(a1, CFSTR("VideosImageURL"));
}

+ (id)_vui_updateEventDescriptorWithType:()VideosUI
{
  void *v3;

  v3 = 0;
  switch(a3)
  {
    case 3:
      +[VUIAppDocumentUpdateEventDescriptor purchases](VUIAppDocumentUpdateEventDescriptor, "purchases");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      +[VUIAppDocumentUpdateEventDescriptor playActivity](VUIAppDocumentUpdateEventDescriptor, "playActivity");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      +[VUIAppDocumentUpdateEventDescriptor settings](VUIAppDocumentUpdateEventDescriptor, "settings");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      +[VUIAppDocumentUpdateEventDescriptor upNext](VUIAppDocumentUpdateEventDescriptor, "upNext");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      +[VUIAppDocumentUpdateEventDescriptor favorites](VUIAppDocumentUpdateEventDescriptor, "favorites");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 11:
      +[VUIAppDocumentUpdateEventDescriptor accountChanged](VUIAppDocumentUpdateEventDescriptor, "accountChanged");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 12:
      +[VUIAppDocumentUpdateEventDescriptor removeFromPlayHistory](VUIAppDocumentUpdateEventDescriptor, "removeFromPlayHistory");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 13:
      +[VUIAppDocumentUpdateEventDescriptor entitlements](VUIAppDocumentUpdateEventDescriptor, "entitlements");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 14:
      +[VUIAppDocumentUpdateEventDescriptor utsk](VUIAppDocumentUpdateEventDescriptor, "utsk");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 15:
      +[VUIAppDocumentUpdateEventDescriptor restrictions](VUIAppDocumentUpdateEventDescriptor, "restrictions");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 16:
      +[VUIAppDocumentUpdateEventDescriptor preferredVideoFormat](VUIAppDocumentUpdateEventDescriptor, "preferredVideoFormat");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 17:
      +[VUIAppDocumentUpdateEventDescriptor postPlay](VUIAppDocumentUpdateEventDescriptor, "postPlay");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 18:
      +[VUIAppDocumentUpdateEventDescriptor appDidBecomeActive](VUIAppDocumentUpdateEventDescriptor, "appDidBecomeActive");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 19:
      +[VUIAppDocumentUpdateEventDescriptor playHistoryUpdated](VUIAppDocumentUpdateEventDescriptor, "playHistoryUpdated");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 20:
      +[VUIAppDocumentUpdateEventDescriptor clearPlayHistory](VUIAppDocumentUpdateEventDescriptor, "clearPlayHistory");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 21:
      +[VUIAppDocumentUpdateEventDescriptor appRefresh](VUIAppDocumentUpdateEventDescriptor, "appRefresh");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 22:
      +[VUIAppDocumentUpdateEventDescriptor locationAuthorizationChanged](VUIAppDocumentUpdateEventDescriptor, "locationAuthorizationChanged");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 23:
      +[VUIAppDocumentUpdateEventDescriptor locationRetrieved](VUIAppDocumentUpdateEventDescriptor, "locationRetrieved");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v3;
  }
  return v3;
}

- (void)_parseElementIfNecessary
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id obj;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_getAssociatedObject(a1, CFSTR("VideosHasParsedElement"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if ((v3 & 1) == 0)
  {
    objc_setAssociatedObject(a1, CFSTR("VideosHasParsedElement"), MEMORY[0x1E0C9AAB0], (void *)1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v4 = a1;
      objc_msgSend(a1, "relatedContent");
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "children");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      if (!v5)
        goto LABEL_29;
      v6 = v5;
      v7 = *(_QWORD *)v44;
      v8 = *MEMORY[0x1E0D3A480];
      v9 = *MEMORY[0x1E0D3A530];
      v10 = *MEMORY[0x1E0D3A408];
      v38 = *MEMORY[0x1E0D3A450];
      v33 = *MEMORY[0x1E0D3A480];
      v34 = *(_QWORD *)v44;
      while (1)
      {
        v11 = 0;
        v35 = v6;
        do
        {
          if (*(_QWORD *)v44 != v7)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v11);
          objc_msgSend(v12, "elementName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v8);

          if (v14)
          {
            v37 = v11;
            v41 = 0u;
            v42 = 0u;
            v39 = 0u;
            v40 = 0u;
            objc_msgSend(v12, "children");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
            if (!v16)
              goto LABEL_26;
            v17 = v16;
            v18 = *(_QWORD *)v40;
            while (1)
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v40 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
                objc_msgSend(v20, "elementName");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v21, "isEqualToString:", v9);

                if (v22)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                    continue;
                  objc_msgSend(v20, "text");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "string");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();

                  v25 = v4;
                  v26 = CFSTR("VideosTitle");
                  goto LABEL_23;
                }
                objc_msgSend(v20, "elementName");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v27, "isEqualToString:", v10);

                if (v28)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                    continue;
                  objc_msgSend(v20, "text");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "string");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();

                  v25 = v4;
                  v26 = CFSTR("VideosDescription");
                  goto LABEL_23;
                }
                objc_msgSend(v20, "elementName");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = objc_msgSend(v30, "isEqualToString:", v38);

                if (v31)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v20, "url");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    v25 = v4;
                    v26 = CFSTR("VideosImageURL");
LABEL_23:
                    objc_setAssociatedObject(v25, v26, v24, (void *)1);

                    continue;
                  }
                }
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
              if (!v17)
              {
LABEL_26:

                v8 = v33;
                v7 = v34;
                v6 = v35;
                v11 = v37;
                break;
              }
            }
          }
          ++v11;
        }
        while (v11 != v6);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
        if (!v6)
        {
LABEL_29:

          return;
        }
      }
    }
  }
}

- (void)vui_updateEventDescriptors
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1_25(a1, a2);
  OUTLINED_FUNCTION_0_13(&dword_1D96EE000, v2, v3, "Purchase events must specify the canonical ID", v4);
}

@end
