@implementation PXRadarConfiguration

- (PXRadarConfiguration)init
{
  PXRadarConfiguration *v2;
  PXRadarConfiguration *v3;
  NSMutableArray *v4;
  NSMutableArray *diagnosticProviders;
  NSMutableArray *v6;
  NSMutableArray *legacyTapToRadars;
  NSMutableArray *v8;
  NSMutableArray *screenshots;
  NSMutableArray *v10;
  NSMutableArray *attachments;
  NSMutableArray *v12;
  NSMutableArray *diagnosticContainers;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PXRadarConfiguration;
  v2 = -[PXRadarConfiguration init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_DWORD *)&v2->_attachmentsIncludeAnyUserAsset = 16777473;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    diagnosticProviders = v3->_diagnosticProviders;
    v3->_diagnosticProviders = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    legacyTapToRadars = v3->_legacyTapToRadars;
    v3->_legacyTapToRadars = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    screenshots = v3->_screenshots;
    v3->_screenshots = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    attachments = v3->_attachments;
    v3->_attachments = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    diagnosticContainers = v3->_diagnosticContainers;
    v3->_diagnosticContainers = v12;

  }
  return v3;
}

- (void)addDiagnosticProvider:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXRadarConfiguration diagnosticProviders](self, "diagnosticProviders");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)addLegacyTapToRadar:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXRadarConfiguration legacyTapToRadars](self, "legacyTapToRadars");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)addScreenshot:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXRadarConfiguration screenshots](self, "screenshots");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)addAttachment:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXRadarConfiguration attachments](self, "attachments");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)collectDiagnosticsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  PXTapToRadarConcreteDiagnosticContainer *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD aBlock[4];
  id v24;
  _QWORD *v25;
  _QWORD v26[5];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXRadarConfiguration diagnosticContainers](self, "diagnosticContainers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[PXRadarConfiguration legacyTapToRadars](self, "legacyTapToRadars");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "diagnosticDictionary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v6, "addObject:", v11);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v6, "count"))
  {
    +[PXFeedbackTapToRadarUtilities attachmentURLForDiagnosticDictionaries:descriptionName:](PXFeedbackTapToRadarUtilities, "attachmentURLForDiagnosticDictionaries:descriptionName:", v6, CFSTR("UI-Diagnostics"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = -[PXTapToRadarConcreteDiagnosticContainer initWithName:]([PXTapToRadarConcreteDiagnosticContainer alloc], "initWithName:", CFSTR("Legacy"));
      -[PXTapToRadarConcreteDiagnosticContainer addAttachment:](v13, "addAttachment:", v12);
      objc_msgSend(v5, "addObject:", v13);

    }
  }
  -[PXRadarConfiguration diagnosticProviders](self, "diagnosticProviders");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  -[PXRadarConfiguration diagnosticProviders](self, "diagnosticProviders");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeAllObjects");

  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__46346;
  v26[4] = __Block_byref_object_dispose__46347;
  v27 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PXRadarConfiguration_collectDiagnosticsWithCompletionHandler___block_invoke;
  aBlock[3] = &unk_1E511D008;
  v25 = v26;
  v17 = v5;
  v24 = v17;
  v18 = _Block_copy(aBlock);
  v20 = v15;
  v22 = v18;
  v21 = v17;
  v19 = v4;
  PXIterateAsynchronously();

  _Block_object_dispose(v26, 8);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[PXRadarConfiguration title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  objc_msgSend(v4, "setComponent:", -[PXRadarConfiguration component](self, "component"));
  objc_msgSend(v4, "setClassification:", -[PXRadarConfiguration classification](self, "classification"));
  -[PXRadarConfiguration description](self, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDescription:", v6);

  -[PXRadarConfiguration keywordIDs](self, "keywordIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setKeywordIDs:", v7);

  objc_msgSend(v4, "setAttachmentsIncludeAnyUserAsset:", -[PXRadarConfiguration attachmentsIncludeAnyUserAsset](self, "attachmentsIncludeAnyUserAsset"));
  objc_msgSend(v4, "setWantsSystemDiagnostics:", -[PXRadarConfiguration wantsSystemDiagnostics](self, "wantsSystemDiagnostics"));
  objc_msgSend(v4, "setWantsPhotosDiagnostics:", -[PXRadarConfiguration wantsPhotosDiagnostics](self, "wantsPhotosDiagnostics"));
  objc_msgSend(v4, "setIsProgressUIAllowed:", -[PXRadarConfiguration isProgressUIAllowed](self, "isProgressUIAllowed"));
  -[PXRadarConfiguration completionHandler](self, "completionHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCompletionHandler:", v8);

  objc_msgSend(v4, "diagnosticProviders");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXRadarConfiguration diagnosticProviders](self, "diagnosticProviders");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setArray:", v10);

  objc_msgSend(v4, "screenshots");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXRadarConfiguration screenshots](self, "screenshots");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setArray:", v12);

  objc_msgSend(v4, "attachments");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXRadarConfiguration attachments](self, "attachments");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setArray:", v14);

  objc_msgSend(v4, "diagnosticContainers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXRadarConfiguration diagnosticContainers](self, "diagnosticContainers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setArray:", v16);

  return v4;
}

- (NSString)description
{
  return self->_description;
}

- (void)setDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)component
{
  return self->_component;
}

- (void)setComponent:(int64_t)a3
{
  self->_component = a3;
}

- (int64_t)classification
{
  return self->_classification;
}

- (void)setClassification:(int64_t)a3
{
  self->_classification = a3;
}

- (NSArray)keywordIDs
{
  return self->_keywordIDs;
}

- (void)setKeywordIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)attachmentsIncludeAnyUserAsset
{
  return self->_attachmentsIncludeAnyUserAsset;
}

- (void)setAttachmentsIncludeAnyUserAsset:(BOOL)a3
{
  self->_attachmentsIncludeAnyUserAsset = a3;
}

- (BOOL)wantsSystemDiagnostics
{
  return self->_wantsSystemDiagnostics;
}

- (void)setWantsSystemDiagnostics:(BOOL)a3
{
  self->_wantsSystemDiagnostics = a3;
}

- (BOOL)wantsPhotosDiagnostics
{
  return self->_wantsPhotosDiagnostics;
}

- (void)setWantsPhotosDiagnostics:(BOOL)a3
{
  self->_wantsPhotosDiagnostics = a3;
}

- (BOOL)isProgressUIAllowed
{
  return self->_isProgressUIAllowed;
}

- (void)setIsProgressUIAllowed:(BOOL)a3
{
  self->_isProgressUIAllowed = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSMutableArray)diagnosticProviders
{
  return self->_diagnosticProviders;
}

- (NSMutableArray)legacyTapToRadars
{
  return self->_legacyTapToRadars;
}

- (NSMutableArray)screenshots
{
  return self->_screenshots;
}

- (NSMutableArray)attachments
{
  return self->_attachments;
}

- (NSMutableArray)diagnosticContainers
{
  return self->_diagnosticContainers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticContainers, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_screenshots, 0);
  objc_storeStrong((id *)&self->_legacyTapToRadars, 0);
  objc_storeStrong((id *)&self->_diagnosticProviders, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_keywordIDs, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

id __64__PXRadarConfiguration_collectDiagnosticsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  PXTapToRadarConcreteDiagnosticContainer *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v2)
  {
    v3 = -[PXTapToRadarConcreteDiagnosticContainer initWithName:]([PXTapToRadarConcreteDiagnosticContainer alloc], "initWithName:", CFSTR("Errors"));
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  return v2;
}

void __64__PXRadarConfiguration_collectDiagnosticsWithCompletionHandler___block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  PXTapToRadarConcreteDiagnosticContainer *v9;
  PXTapToRadarConcreteDiagnosticContainer *v10;
  _QWORD v11[4];
  id v12;
  PXTapToRadarConcreteDiagnosticContainer *v13;
  id v14;
  id v15;
  id v16;

  v3 = a2;
  objc_msgSend(a1[4], "px_popFirst");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@-%p"), v7, v4);

    v9 = -[PXTapToRadarConcreteDiagnosticContainer initWithName:]([PXTapToRadarConcreteDiagnosticContainer alloc], "initWithName:", v8);
    objc_msgSend(v4, "collectTapToRadarDiagnosticsIntoContainer:", v9);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64__PXRadarConfiguration_collectDiagnosticsWithCompletionHandler___block_invoke_3;
    v11[3] = &unk_1E511D030;
    v16 = a1[6];
    v12 = a1[4];
    v10 = v9;
    v13 = v10;
    v14 = a1[5];
    v15 = v3;
    -[PXTapToRadarConcreteDiagnosticContainer finalizeWithCompletionHandler:](v10, "finalizeWithCompletionHandler:", v11);

  }
  else
  {
    objc_msgSend(v3, "stop");
  }

}

uint64_t __64__PXRadarConfiguration_collectDiagnosticsWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__PXRadarConfiguration_collectDiagnosticsWithCompletionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t);
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if ((a2 & 1) == 0)
  {
    v4 = *(_QWORD *)(a1 + 64);
    v5 = *(void (**)(uint64_t))(v4 + 16);
    v6 = a3;
    v5(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("diagnostic collection failed with error %@"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addAttachmentWithText:name:", v8, CFSTR("DiagnosticCollectionError"));
  }
  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "subproviders");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "px_insertObjects:atIndex:", v10, 0);

  objc_msgSend(*(id *)(a1 + 48), "addObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 56), "next");
}

@end
