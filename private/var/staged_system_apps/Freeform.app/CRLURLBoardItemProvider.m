@implementation CRLURLBoardItemProvider

+ (NSArray)supportedRemoteURLSchemes
{
  return +[CRLBoardItemImporter supportedRemoteURLSchemes](CRLBoardItemImporter, "supportedRemoteURLSchemes");
}

+ (BOOL)canInitWithURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  unsigned __int8 v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  if (objc_msgSend(v3, "isFileURL"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crl_fileTypeIdentifierHandlingFileCoordinationPromises"));
    if (v4)
    {
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v5 = (id)objc_claimAutoreleasedReturnValue(+[CRLBoardItemImporter supportedFileUTTypes](CRLBoardItemImporter, "supportedFileUTTypes"));
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v17 != v8)
              objc_enumerationMutation(v5);
            if (objc_msgSend(v4, "conformsToType:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), (_QWORD)v16))
            {
              v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRLInfoImporterBoardItemProvider disallowedTypes](CRLInfoImporterBoardItemProvider, "disallowedTypes"));
              v11 = objc_msgSend(v4, "crl_conformsToAnyUTType:", v10);

              if (!v11)
              {
                v13 = 1;
                v12 = v5;
                goto LABEL_16;
              }
            }
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v7)
            continue;
          break;
        }
      }

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
      v13 = +[CRLFileItemImporter protected_canImportFileAtURL:type:](_TtC8Freeform19CRLFileItemImporter, "protected_canImportFileAtURL:type:", v3, v12);
LABEL_16:

    }
    else
    {
      v13 = 0;
    }

    v14 = v13 != 0;
  }
  else
  {
    v14 = +[CRLBoardItemImporter canImportRemoteURL:](CRLBoardItemImporter, "canImportRemoteURL:", v3);
  }

  return v14;
}

- (CRLURLBoardItemProvider)initWithURL:(id)a3 fallbackBoardItemProvider:(id)a4 isDetectedURL:(BOOL)a5 suggestedName:(id)a6
{
  id v11;
  id v12;
  id v13;
  CRLURLBoardItemProvider *v14;
  CRLURLBoardItemProvider *v15;
  CRLSandboxedURL *v16;
  CRLSandboxedURL *sandboxedURL;
  CRLScaledProgress *v18;
  CRLScaledProgress *importerProgress;
  CRLBasicProgress *v20;
  CRLFakeProgress *v21;
  CRLFakeProgress *fileCoordinationProgress;
  CRLProgressGroup *v23;
  CRLScaledProgress *v24;
  void *v25;
  CRLProgressGroup *v26;
  CRLProgressGroup *progress;
  objc_super v29;
  _QWORD v30[2];

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v29.receiver = self;
  v29.super_class = (Class)CRLURLBoardItemProvider;
  v14 = -[CRLURLBoardItemProvider init](&v29, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_initialURL, a3);
    objc_storeStrong((id *)&v15->_suggestedName, a6);
    if (objc_msgSend(v11, "isFileURL"))
    {
      v16 = -[CRLSandboxedURL initWithURL:]([CRLSandboxedURL alloc], "initWithURL:", v11);
      sandboxedURL = v15->_sandboxedURL;
      v15->_sandboxedURL = v16;

    }
    objc_storeStrong((id *)&v15->_fallbackBoardItemProvider, a4);
    v18 = objc_alloc_init(CRLScaledProgress);
    importerProgress = v15->_importerProgress;
    v15->_importerProgress = v18;

    v20 = -[CRLBasicProgress initWithMaxValue:]([CRLBasicProgress alloc], "initWithMaxValue:", 1.0);
    -[CRLScaledProgress setProgress:](v15->_importerProgress, "setProgress:", v20);

    -[CRLScaledProgress setMaxValue:](v15->_importerProgress, "setMaxValue:", 50.0);
    v21 = -[CRLFakeProgress initWithMaxValue:numberOfStages:]([CRLFakeProgress alloc], "initWithMaxValue:numberOfStages:", 1, 50.0);
    fileCoordinationProgress = v15->_fileCoordinationProgress;
    v15->_fileCoordinationProgress = v21;

    v23 = [CRLProgressGroup alloc];
    v24 = v15->_importerProgress;
    v30[0] = v15->_fileCoordinationProgress;
    v30[1] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 2));
    v26 = -[CRLProgressGroup initWithChildren:](v23, "initWithChildren:", v25);
    progress = v15->_progress;
    v15->_progress = v26;

    v15->_isDetectedURL = a5;
  }

  return v15;
}

- (void)provideBoardItemWithFactory:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSURL *initialURL;
  _QWORD v9[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  -[CRLFakeProgress start](self->_fileCoordinationProgress, "start");
  if (-[NSURL isFileURL](self->_initialURL, "isFileURL"))
  {
    initialURL = self->_initialURL;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001717A8;
    v9[3] = &unk_10123D700;
    v9[4] = self;
    v10 = v6;
    v11 = v7;
    +[CSCloudSharing existingShareForFileOrFolderURL:completionHandler:](CSCloudSharing, "existingShareForFileOrFolderURL:completionHandler:", initialURL, v9);

  }
  else
  {
    -[CRLURLBoardItemProvider p_provideBoardItemWithURL:factory:completionHandler:](self, "p_provideBoardItemWithURL:factory:completionHandler:", self->_initialURL, v6, v7);
  }

}

- (void)p_provideBoardItemWithURL:(id)a3 factory:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[6];
  id v16;
  id v17;
  void *v18;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  if (objc_msgSend(v10, "isFileURL"))
  {
    v11 = objc_alloc_init((Class)NSFileCoordinator);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileAccessIntent readingIntentWithURL:options:](NSFileAccessIntent, "readingIntentWithURL:options:", v10, 0));

    v18 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10017195C;
    v15[3] = &unk_101239158;
    v15[4] = self;
    v15[5] = v12;
    v16 = v8;
    v17 = v9;
    objc_msgSend(v11, "coordinateAccessWithIntents:queue:byAccessor:", v13, v14, v15);

    v10 = v11;
  }
  else
  {
    -[CRLFakeProgress advanceToStage:](self->_fileCoordinationProgress, "advanceToStage:", 1);
    -[CRLURLBoardItemProvider p_provideBoardItemWithFinalURL:factory:completionHandler:](self, "p_provideBoardItemWithFinalURL:factory:completionHandler:", v10, v8, v9);
  }

}

- (void)p_provideBoardItemWithFinalURL:(id)a3 factory:(id)a4 completionHandler:(id)a5
{
  void (**v8)(_QWORD);
  id v9;
  id v10;
  CRLBoardItemImporter *v11;
  CRLBoardItemImporter *itemImporter;
  void *v13;
  void *v14;
  CRLBoardItemImporter *v15;
  uint64_t v16;
  _QWORD v17[5];
  void (**v18)(_QWORD);

  v8 = (void (**)(_QWORD))a5;
  v9 = a4;
  v10 = a3;
  v11 = -[CRLBoardItemImporter initWithURL:boardItemFactory:]([CRLBoardItemImporter alloc], "initWithURL:boardItemFactory:", v10, v9);

  itemImporter = self->_itemImporter;
  self->_itemImporter = v11;

  if (self->_itemImporter)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLURLBoardItemProvider suggestedName](self, "suggestedName"));
    -[CRLBoardItemImporter setSuggestedName:](self->_itemImporter, "setSuggestedName:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemImporter progress](self->_itemImporter, "progress"));
    -[CRLScaledProgress setProgress:](self->_importerProgress, "setProgress:", v14);
    -[CRLBoardItemImporter setDelegate:](self->_itemImporter, "setDelegate:", self);
    v15 = self->_itemImporter;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100171C48;
    v17[3] = &unk_101231F00;
    v17[4] = self;
    v18 = v8;
    -[CRLBoardItemImporter importBoardItemWithCompletionHandler:](v15, "importBoardItemWithCompletionHandler:", v17);

  }
  else
  {
    v16 = objc_claimAutoreleasedReturnValue(-[CRLURLBoardItemProvider delegate](self, "delegate"));
    v14 = (void *)v16;
    if (v16
      && (objc_opt_respondsToSelector(v16, "importableBoardItemProviderWillIgnoreMediaCompatibilityOnAllDevicesRequirement:") & 1) != 0)
    {
      objc_msgSend(v14, "importableBoardItemProviderWillIgnoreMediaCompatibilityOnAllDevicesRequirement:", self);
    }
    if (v8)
      v8[2](v8);
  }

}

- (void)cancel
{
  -[CRLBoardItemImporter cancel](self->_itemImporter, "cancel");
}

- (_TtC8Freeform12CRLBoardItem)boardItem
{
  _TtC8Freeform12CRLBoardItem *fallbackBoardItem;

  fallbackBoardItem = self->_fallbackBoardItem;
  if (fallbackBoardItem)
    return fallbackBoardItem;
  else
    return (_TtC8Freeform12CRLBoardItem *)(id)objc_claimAutoreleasedReturnValue(-[CRLBoardItemImporter boardItem](self->_itemImporter, "boardItem"));
}

- (NSError)error
{
  if (self->_fallbackBoardItem)
    return (NSError *)0;
  else
    return (NSError *)(id)objc_claimAutoreleasedReturnValue(-[CRLBoardItemImporter error](self->_itemImporter, "error"));
}

- (unint64_t)uploadDataLength
{
  if (self->_fallbackBoardItem)
    return 0;
  else
    return -[CRLBoardItemImporter uploadDataLength](self->_itemImporter, "uploadDataLength");
}

- (unint64_t)embeddedDataLength
{
  if (self->_fallbackBoardItem)
    return 0;
  else
    return -[CRLBoardItemImporter embeddedDataLength](self->_itemImporter, "embeddedDataLength");
}

- (void)boardItemImporter:(id)a3 needsMediaCompatibilityFeedbackWithReasons:(int64_t)a4 forMediaType:(int64_t)a5 usingBlock:(id)a6
{
  void (**v9)(id, _QWORD, uint64_t);
  void *v10;
  id v11;

  v9 = (void (**)(id, _QWORD, uint64_t))a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLURLBoardItemProvider delegate](self, "delegate"));
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "importableBoardItemProvider:needsMediaCompatibilityFeedbackWithReasons:forMediaType:usingBlock:", self, a4, a5, v9);
  else
    v9[2](v9, 0, 1);

}

- (void)boardItemImporterWillIgnoreMediaCompatibilityOnAllDevicesRequirement:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  v4 = objc_claimAutoreleasedReturnValue(-[CRLURLBoardItemProvider delegate](self, "delegate", a3));
  v5 = (void *)v4;
  if (v4)
  {
    v7 = (void *)v4;
    v6 = objc_opt_respondsToSelector(v4, "importableBoardItemProviderWillIgnoreMediaCompatibilityOnAllDevicesRequirement:");
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "importableBoardItemProviderWillIgnoreMediaCompatibilityOnAllDevicesRequirement:", self);
      v5 = v7;
    }
  }

}

- (id)newBoardItemWithFactory:(id)a3 bakedSize:(BOOL)a4
{
  id v5;
  void *v6;
  dispatch_semaphore_t v7;
  NSURL *initialURL;
  NSObject *v9;
  void *v10;
  _QWORD v12[4];
  dispatch_semaphore_t v13;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLURLBoardItemProvider boardItem](self, "boardItem"));
  if (!v6)
  {
    v7 = dispatch_semaphore_create(0);
    initialURL = self->_initialURL;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100171EE4;
    v12[3] = &unk_10122D110;
    v13 = v7;
    v9 = v7;
    -[CRLURLBoardItemProvider p_provideBoardItemWithURL:factory:completionHandler:](self, "p_provideBoardItemWithURL:factory:completionHandler:", initialURL, v5, v12);
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLURLBoardItemProvider boardItem](self, "boardItem"));

  return v10;
}

- (CRLIngestibleItemImportableBoardItemProviderDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CRLIngestibleItemImportableBoardItemProviderDelegate *)a3;
}

- (CRLProgress)progress
{
  return &self->_progress->super;
}

- (NSDictionary)pasteboardDescription
{
  return self->pasteboardDescription;
}

- (NSString)suggestedName
{
  return self->_suggestedName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedName, 0);
  objc_storeStrong((id *)&self->pasteboardDescription, 0);
  objc_storeStrong((id *)&self->_fallbackBoardItem, 0);
  objc_storeStrong((id *)&self->_fallbackBoardItemProvider, 0);
  objc_storeStrong((id *)&self->_itemImporter, 0);
  objc_storeStrong((id *)&self->_importerProgress, 0);
  objc_storeStrong((id *)&self->_fileCoordinationProgress, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_initialURL, 0);
  objc_storeStrong((id *)&self->_sandboxedURL, 0);
}

@end
