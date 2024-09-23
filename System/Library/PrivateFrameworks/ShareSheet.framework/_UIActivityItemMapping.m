@implementation _UIActivityItemMapping

+ (void)_addToActiveActivityViewControllers:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;

  v3 = _addToActiveActivityViewControllers__onceToken;
  v4 = a3;
  v6 = v4;
  if (v3 == -1)
  {
    v5 = v4;
  }
  else
  {
    dispatch_once(&_addToActiveActivityViewControllers__onceToken, &__block_literal_global_34);
    v5 = v6;
  }
  objc_msgSend((id)_activeActivityViewControllers, "addObject:", v5);

}

+ (void)_removeFromActiveActivityViewControllers:(id)a3
{
  objc_msgSend((id)_activeActivityViewControllers, "removeObject:", a3);
}

+ (id)_activeActivityViewControllers
{
  return (id)objc_msgSend((id)_activeActivityViewControllers, "allObjects");
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 517, 1);
    v3 = (void *)__activityViewControllers;
    __activityViewControllers = v2;

    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 512, 1);
    v5 = (void *)__originalItems;
    __originalItems = v4;

  }
}

+ (void)_addActivityItem:(id)a3 activityViewController:(id)a4 originalActivityItem:(id)a5
{
  id v7;
  id v8;
  id v9;

  v9 = a3;
  v7 = a4;
  v8 = a5;
  if (v8)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      && (objc_opt_respondsToSelector() & 1) == 0
      && (objc_opt_respondsToSelector() & 1) == 0
      && (objc_opt_respondsToSelector() & 1) == 0
      && (objc_opt_respondsToSelector() & 1) == 0
      && !objc_msgSend(v8, "conformsToProtocol:", &unk_1EE576F08))
    {
      goto LABEL_16;
    }
LABEL_15:
    objc_msgSend((id)__activityViewControllers, "setObject:forKey:", v7, v9);
    objc_msgSend((id)__originalItems, "setObject:forKey:", v8, v9);
    goto LABEL_16;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0
    || (objc_msgSend(v9, "conformsToProtocol:", &unk_1EE576F08) & 1) != 0)
  {
    goto LABEL_15;
  }
LABEL_16:

}

+ (void)_clearActivityItems:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  int v12;
  BOOL v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = (id)__originalItems;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend((id)__activityViewControllers, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v3);
        if (v11)
          v13 = v12 == 0;
        else
          v13 = 0;
        if (!v13)
          objc_msgSend(v4, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v7);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = v4;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j);
        objc_msgSend((id)__activityViewControllers, "removeObjectForKey:", v19, (_QWORD)v20);
        objc_msgSend((id)__originalItems, "removeObjectForKey:", v19);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v16);
  }

}

+ (id)_originalActivityItemForActivityItem:(id)a3
{
  return (id)objc_msgSend((id)__originalItems, "objectForKey:", a3);
}

+ (id)_activityViewControllerForActivityItem:(id)a3
{
  return (id)objc_msgSend((id)__activityViewControllers, "objectForKey:", a3);
}

+ (BOOL)_canLoadMetadataForActivityItem:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

+ (id)_loadMetadataForActivityItem:(id)a3 activityViewController:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v11;
  objc_class *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v5 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "activityViewControllerLinkPresentationMetadata:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = (id)v7;
    goto LABEL_6;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "activityViewControllerLinkMetadata:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_alloc_init((Class)getLPLinkMetadataClass());
    objc_msgSend(v8, "setSummary:", v5);
    v17 = 0;
    v18 = &v17;
    v19 = 0x2050000000;
    v11 = (void *)getLPImageClass_softClass;
    v20 = getLPImageClass_softClass;
    if (!getLPImageClass_softClass)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __getLPImageClass_block_invoke;
      v16[3] = &unk_1E4001370;
      v16[4] = &v17;
      __getLPImageClass_block_invoke((uint64_t)v16);
      v11 = (void *)v18[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v17, 8);
    v13 = [v12 alloc];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("text.cursor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithPlatformImage:", v14);
    objc_msgSend(v8, "setIcon:", v15);

  }
  else
  {
    v8 = 0;
  }
LABEL_6:
  getLPLinkMetadataClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  return v9;
}

+ (id)_itemProviderForActivityItem:(id)a3 typeIdentifier:(id)a4 thumbnailSize:(CGSize)a5 activityType:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v11;
  __CFString *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id *v17;
  id v18;
  char v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  CGFloat v37;
  CGFloat v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id v45;

  height = a5.height;
  width = a5.width;
  v11 = a3;
  v12 = (__CFString *)a4;
  v13 = a6;
  if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EE53D348))
  {
    v14 = v11;
    if (v14)
      goto LABEL_5;
  }
  objc_msgSend((id)__originalItems, "objectForKey:", v11);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "conformsToProtocol:", &unk_1EE53D348) & 1) == 0)
  {

    goto LABEL_8;
  }
  if (!v14)
  {
LABEL_8:
    v32 = a1;
    v33 = v13;
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __97___UIActivityItemMapping__itemProviderForActivityItem_typeIdentifier_thumbnailSize_activityType___block_invoke_2;
    v39[3] = &unk_1E40028D0;
    v17 = &v40;
    v18 = v11;
    v40 = v18;
    v15 = (void *)MEMORY[0x1A1AE9514](v39);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithItem:typeIdentifier:", v18, v12);
    v14 = 0;
    v19 = 1;
    goto LABEL_14;
  }
LABEL_5:
  if (objc_msgSend(v14, "conformsToProtocol:", &unk_1EE576F08))
  {
    objc_msgSend(a1, "_activityViewControllerForActivityItem:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "activityViewControllerApplicationExtensionItem:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __97___UIActivityItemMapping__itemProviderForActivityItem_typeIdentifier_thumbnailSize_activityType___block_invoke;
  v41[3] = &unk_1E4003478;
  v17 = &v42;
  v14 = v14;
  v42 = v14;
  v32 = a1;
  v45 = a1;
  v20 = v11;
  v43 = v20;
  v21 = v13;
  v44 = v21;
  v15 = (void *)MEMORY[0x1A1AE9514](v41);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithItem:typeIdentifier:", 0, 0);
  objc_msgSend(v16, "registerItemForTypeIdentifier:loadHandler:", v12, v15);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v32, "_activityViewControllerForActivityItem:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "activityViewController:attachmentNameForActivityType:", v22, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v23, "length"))
      objc_msgSend(v16, "setSuggestedName:", v23);

  }
  v33 = v13;

  v19 = 0;
LABEL_14:

  v24 = (void *)*MEMORY[0x1E0CA5C90];
  v25 = UTTypeConformsTo(v12, (CFStringRef)*MEMORY[0x1E0CA5C90]);
  v26 = v24;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || v25)
  {
    if ((v19 & 1) == 0)
    {
      objc_msgSend(v32, "_activityViewControllerForActivityItem:", v11);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "activityViewControllerPlaceholderItem:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && !v25)
      {
        if (objc_msgSend(v29, "isFileURL"))
        {
          v30 = (id)*MEMORY[0x1E0CA5B48];

          v26 = v30;
        }
        objc_msgSend(v16, "registerItemForTypeIdentifier:loadHandler:", v26, v15, v32);
      }

    }
    v13 = v33;
  }
  else
  {
    if (objc_msgSend(v11, "isFileURL"))
    {
      v27 = (id)*MEMORY[0x1E0CA5B48];

      v26 = v27;
    }
    v13 = v33;
    objc_msgSend(v16, "registerItemForTypeIdentifier:loadHandler:", v26, v15, v32);
  }
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __97___UIActivityItemMapping__itemProviderForActivityItem_typeIdentifier_thumbnailSize_activityType___block_invoke_3;
  v34[3] = &unk_1E40034A0;
  v35 = v11;
  v37 = width;
  v38 = height;
  v36 = v13;
  objc_msgSend(v16, "setPreviewImageHandler:", v34);

LABEL_28:
  return v16;
}

+ (id)_subjectForActivityItem:(id)a3 activityType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "_activityViewControllerForActivityItem:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activityViewController:subjectForActivityType:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)__originalItems, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(a1, "_activityViewControllerForActivityItem:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "activityViewController:subjectForActivityType:", v10, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

+ (id)_dataTypeIdentifierForActivityItem:(id)a3 activityType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "_activityViewControllerForActivityItem:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activityViewController:dataTypeIdentifierForActivityType:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)__originalItems, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(a1, "_activityViewControllerForActivityItem:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "activityViewController:dataTypeIdentifierForActivityType:", v10, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

+ (id)_thumbnailImageForActivityItem:(id)a3 thumbnailSize:(CGSize)a4 activityType:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = a5;
  if (height <= 0.0)
  {
    v12 = 0;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(a1, "_activityViewControllerForActivityItem:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "activityViewController:thumbnailImageForActivityType:suggestedSize:", v11, v10, width, height);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend((id)__originalItems, "objectForKey:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(a1, "_activityViewControllerForActivityItem:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "activityViewController:thumbnailImageForActivityType:suggestedSize:", v13, v10, width, height);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v12 = 0;
      }
    }

  }
  return v12;
}

+ (id)_thumbnailImageDataForActivityItem:(id)a3 thumbnailSize:(CGSize)a4 activityType:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = a5;
  if (height <= 0.0)
  {
    v12 = 0;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(a1, "_activityViewControllerForActivityItem:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "activityViewController:thumbnailImageDataForActivityType:suggestedSize:", v11, v10, width, height);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend((id)__originalItems, "objectForKey:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(a1, "_activityViewControllerForActivityItem:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "activityViewController:thumbnailImageDataForActivityType:suggestedSize:", v13, v10, width, height);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v12 = 0;
      }
    }

  }
  return v12;
}

+ (id)_attachmentNameForActivityItem:(id)a3 activityType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "_activityViewControllerForActivityItem:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activityViewController:attachmentNameForActivityType:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)__originalItems, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(a1, "_activityViewControllerForActivityItem:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "activityViewController:attachmentNameForActivityType:", v10, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

+ (id)_openURLAnnotationForActivityItem:(id)a3 activityType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "_activityViewControllerForActivityItem:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activityViewController:openURLAnnotationForActivityType:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)__originalItems, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(a1, "_activityViewControllerForActivityItem:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "activityViewController:openURLAnnotationForActivityType:", v10, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

@end
