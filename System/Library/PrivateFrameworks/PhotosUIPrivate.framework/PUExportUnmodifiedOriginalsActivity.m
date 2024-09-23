@implementation PUExportUnmodifiedOriginalsActivity

- (id)activityType
{
  return (id)*MEMORY[0x1E0D7BD30];
}

- (id)activityTitle
{
  void *v2;
  void *v3;
  __CFString *v4;
  void *v5;

  -[PXActivity itemSourceController](self, "itemSourceController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
    v4 = CFSTR("SHARING_EXPORT_UNMODIFIED_ORIGINALS_TITLE");
  else
    v4 = CFSTR("SHARING_EXPORT_UNMODIFIED_ORIGINALS_MULTIPLE_TITLE");
  PULocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_systemImageName
{
  return CFSTR("folder");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  -[PXActivity itemSourceController](self, "itemSourceController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isPreparingIndividualItems"))
  {
    objc_msgSend(v3, "assets");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)prepareWithActivityItems:(id)a3
{
  id v4;

  -[PUExportUnmodifiedOriginalsActivity _createDocumentPickerViewControllerForExportedItems:](self, "_createDocumentPickerViewControllerForExportedItems:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PUExportUnmodifiedOriginalsActivity setCachedDocumentPickerViewController:](self, "setCachedDocumentPickerViewController:", v4);

}

- (id)_createDocumentPickerViewControllerForExportedItems:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    v24 = v5;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
            v12 = v11;
          else
            v12 = 0;

          objc_msgSend(v4, "addObject:", v12);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_31;
          v13 = v10;
          if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
            v14 = v13;
          else
            v14 = 0;

          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          v12 = v14;
          v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v26;
            do
            {
              v18 = 0;
              do
              {
                if (*(_QWORD *)v26 != v17)
                  objc_enumerationMutation(v12);
                v19 = *(id *)(*((_QWORD *)&v25 + 1) + 8 * v18);
                if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
                {
                  v20 = v19;

                  if (v20)
                    objc_msgSend(v4, "addObject:", v20);
                }
                else
                {

                  v20 = 0;
                }

                ++v18;
              }
              while (v16 != v18);
              v16 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            }
            while (v16);
          }

          v5 = v24;
        }

LABEL_31:
        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v7);
  }

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3730]), "initForExportingURLs:asCopy:", v4, 1);
  objc_msgSend(v21, "setDelegate:", self);
  objc_msgSend(v21, "_setAutomaticallyDismissesAfterCompletion:", 0);

  return v21;
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", 1, a4);
}

- (void)documentPickerWasCancelled:(id)a3
{
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", 0);
}

- (UIDocumentPickerViewController)cachedDocumentPickerViewController
{
  return self->_cachedDocumentPickerViewController;
}

- (void)setCachedDocumentPickerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDocumentPickerViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDocumentPickerViewController, 0);
}

@end
