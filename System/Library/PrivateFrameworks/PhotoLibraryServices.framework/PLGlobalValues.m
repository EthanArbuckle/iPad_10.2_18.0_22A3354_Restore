@implementation PLGlobalValues

- (id)_lastKnownTransactionTokenWithTransactionNumberKey:(id)a3 andStoreUUIDKey:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  PLGlobalValues *v18;
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLGlobalValues.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transactionNumberKey"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLGlobalValues.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("storeUUIDKey"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85__PLGlobalValues__lastKnownTransactionTokenWithTransactionNumberKey_andStoreUUIDKey___block_invoke;
  v16[3] = &unk_1E3661300;
  v17 = v9;
  v18 = self;
  v19 = v7;
  v10 = v7;
  v11 = v9;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_setLastKnownTransactionToken:(id)a3 withTransactionNumberKey:(id)a4 andStoreUUIDKey:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSManagedObjectContext *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  NSManagedObjectContext *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  NSManagedObjectContext *v29;
  id v30;
  id v31;
  id v32;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLGlobalValues.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transactionNumberKey"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLGlobalValues.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("storeUUIDKey"));

LABEL_3:
  v13 = self->_moc;
  if (v9)
  {
    objc_msgSend(v9, "storeTokens");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count") != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLGlobalValues.m"), 56, CFSTR("unexpected number of tokens"));

    }
    objc_msgSend(v14, "allKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "allValues");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
    v16 = 0;
  }
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __89__PLGlobalValues__setLastKnownTransactionToken_withTransactionNumberKey_andStoreUUIDKey___block_invoke;
  v27[3] = &unk_1E3670C40;
  v28 = v12;
  v29 = v13;
  v30 = v16;
  v31 = v18;
  v32 = v10;
  v19 = v10;
  v20 = v18;
  v21 = v16;
  v22 = v13;
  v23 = v12;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v27, "-[PLGlobalValues _setLastKnownTransactionToken:withTransactionNumberKey:andStoreUUIDKey:]");

}

- (PLGlobalValues)initWithManagedObjectContext:(id)a3
{
  id v5;
  PLGlobalValues *v6;
  PLGlobalValues *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLGlobalValues;
  v6 = -[PLGlobalValues init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_moc, a3);

  return v7;
}

- (BOOL)didImportFileSystemAssets
{
  void *v2;
  char v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__PLGlobalValues_didImportFileSystemAssets__block_invoke;
  v5[3] = &unk_1E3670AD8;
  v5[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (int64_t)importFilesystemAssetsState
{
  void *v2;
  int64_t v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__PLGlobalValues_importFilesystemAssetsState__block_invoke;
  v5[3] = &unk_1E3670AD8;
  v5[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setImportFilesystemAssetsState:(int64_t)a3
{
  _QWORD v5[4];
  id v6[2];
  id location;

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__PLGlobalValues_setImportFilesystemAssetsState___block_invoke;
  v5[3] = &unk_1E3669C00;
  objc_copyWeak(v6, &location);
  v6[1] = (id)a3;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v5, "-[PLGlobalValues setImportFilesystemAssetsState:]");
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

- (void)_setImportFilesystemAssetsState:(int64_t)a3
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", v5, CFSTR("ImportedFileSystemAssets"), self->_moc);

  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", v6, CFSTR("ImportedFileSystemAssetsDate"), self->_moc);

  }
  else
  {
    +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", 0, CFSTR("ImportedFileSystemAssetsDate"), self->_moc);
  }
}

- (void)dontImportFileSystemDataIntoDatabase
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__PLGlobalValues_dontImportFileSystemDataIntoDatabase__block_invoke;
  v3[3] = &unk_1E3677D48;
  objc_copyWeak(&v4, &location);
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v3, "-[PLGlobalValues dontImportFileSystemDataIntoDatabase]");
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (BOOL)isJournalRebuildRequired
{
  void *v2;
  char v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__PLGlobalValues_isJournalRebuildRequired__block_invoke;
  v5[3] = &unk_1E3670AD8;
  v5[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setJournalRebuildRequired:(BOOL)a3
{
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  _QWORD v7[4];
  NSManagedObjectContext *v8;
  BOOL v9;

  v5 = self->_moc;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__PLGlobalValues_setJournalRebuildRequired___block_invoke;
  v7[3] = &unk_1E36762F8;
  v9 = a3;
  v8 = v5;
  v6 = v5;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v7, "-[PLGlobalValues setJournalRebuildRequired:]");

}

- (BOOL)isRebuildComplete
{
  void *v2;
  void *v3;
  BOOL v4;
  void *v5;
  _QWORD v7[5];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__PLGlobalValues_isRebuildComplete__block_invoke;
  v7[3] = &unk_1E3670AD8;
  v7[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("JournalRebuildRequired"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "BOOLValue") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("RebuildCompleteDate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (void)setRebuildComplete
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__PLGlobalValues_setRebuildComplete__block_invoke;
  v3[3] = &unk_1E3677D48;
  objc_copyWeak(&v4, &location);
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v3, "-[PLGlobalValues setRebuildComplete]");
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_setRebuildComplete
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", v3, CFSTR("RebuildCompleteDate"), self->_moc);

  +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", 0, CFSTR("JournalRebuildRequired"), self->_moc);
}

- (BOOL)backgroundJobServiceNeedsProcessing
{
  void *v2;
  char v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__PLGlobalValues_backgroundJobServiceNeedsProcessing__block_invoke;
  v5[3] = &unk_1E3670AD8;
  v5[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setBackgroundJobServiceNeedsProcessing:(BOOL)a3
{
  _QWORD v5[4];
  id v6;
  BOOL v7;
  id location;

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__PLGlobalValues_setBackgroundJobServiceNeedsProcessing___block_invoke;
  v5[3] = &unk_1E3661328;
  objc_copyWeak(&v6, &location);
  v7 = a3;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v5, "-[PLGlobalValues setBackgroundJobServiceNeedsProcessing:]");
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_setBackgroundJobServiceNeedsProcessing:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", v4, CFSTR("BackgroundJobServiceNeedsProcessing"), self->_moc);

}

- (NSDictionary)greenValues
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __29__PLGlobalValues_greenValues__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setGreenValues:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__PLGlobalValues_setGreenValues___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setGreenValues:]");

}

- (NSString)localeIdentifier
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__PLGlobalValues_localeIdentifier__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setLocaleIdentifier:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__PLGlobalValues_setLocaleIdentifier___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setLocaleIdentifier:]");

}

- (NSNumber)greenTeaContactsAuthorization
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__PLGlobalValues_greenTeaContactsAuthorization__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setGreenTeaContactsAuthorization:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__PLGlobalValues_setGreenTeaContactsAuthorization___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setGreenTeaContactsAuthorization:]");

}

- (unint64_t)libraryCreateOptions
{
  void *v2;
  unint64_t v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__PLGlobalValues_libraryCreateOptions__block_invoke;
  v5[3] = &unk_1E3670AD8;
  v5[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (void)setWidgetTimelineGeneratedForDisplaySize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  NSManagedObjectContext *v6;
  NSManagedObjectContext *v7;
  _QWORD v8[4];
  NSManagedObjectContext *v9;
  CGFloat v10;
  CGFloat v11;

  height = a3.height;
  width = a3.width;
  v6 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__PLGlobalValues_setWidgetTimelineGeneratedForDisplaySize___block_invoke;
  v8[3] = &unk_1E3677C90;
  v9 = v6;
  v10 = width;
  v11 = height;
  v7 = v6;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setWidgetTimelineGeneratedForDisplaySize:]");

}

- (BOOL)shouldPrefetchWidgetResources
{
  NSManagedObjectContext *moc;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  moc = self->_moc;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__PLGlobalValues_shouldPrefetchWidgetResources__block_invoke;
  v5[3] = &unk_1E3677C68;
  v5[4] = self;
  v5[5] = &v6;
  -[NSManagedObjectContext performBlockAndWait:](moc, "performBlockAndWait:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSDate)_deprecated_lastFullIndexSyndicationSyncDate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__PLGlobalValues__deprecated_lastFullIndexSyndicationSyncDate__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSDate)lastFullIndexSyndicationSyncStartDate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__PLGlobalValues_lastFullIndexSyndicationSyncStartDate__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setLastFullIndexSyndicationSyncStartDate:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__PLGlobalValues_setLastFullIndexSyndicationSyncStartDate___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setLastFullIndexSyndicationSyncStartDate:]");

}

- (NSDate)inProgressFullIndexSyndicationSyncDate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__PLGlobalValues_inProgressFullIndexSyndicationSyncDate__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setInProgressFullIndexSyndicationSyncDate:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__PLGlobalValues_setInProgressFullIndexSyndicationSyncDate___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setInProgressFullIndexSyndicationSyncDate:]");

}

- (NSDate)lastAttachmentSyndicationSyncDate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__PLGlobalValues_lastAttachmentSyndicationSyncDate__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setLastAttachmentSyndicationSyncDate:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__PLGlobalValues_setLastAttachmentSyndicationSyncDate___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setLastAttachmentSyndicationSyncDate:]");

}

- (NSDate)lastChatSyndicationSyncDate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__PLGlobalValues_lastChatSyndicationSyncDate__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setLastChatSyndicationSyncDate:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__PLGlobalValues_setLastChatSyndicationSyncDate___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setLastChatSyndicationSyncDate:]");

}

- (NSDate)lastDeleteSyndicationSyncDate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__PLGlobalValues_lastDeleteSyndicationSyncDate__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setLastDeleteSyndicationSyncDate:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__PLGlobalValues_setLastDeleteSyndicationSyncDate___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setLastDeleteSyndicationSyncDate:]");

}

- (NSDate)syndicationStartDate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__PLGlobalValues_syndicationStartDate__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setSyndicationStartDate:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__PLGlobalValues_setSyndicationStartDate___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSyndicationStartDate:]");

}

- (NSDate)syndicationPrefetchDownloadThrottlingDate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__PLGlobalValues_syndicationPrefetchDownloadThrottlingDate__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setSyndicationPrefetchDownloadThrottlingDate:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__PLGlobalValues_setSyndicationPrefetchDownloadThrottlingDate___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSyndicationPrefetchDownloadThrottlingDate:]");

}

- (double)syndicationSyncRangeDenominator
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  _QWORD v7[5];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__PLGlobalValues_syndicationSyncRangeDenominator__block_invoke;
  v7[3] = &unk_1E3670AD8;
  v7[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 1.0;
  }

  return v5;
}

- (void)setSyndicationSyncRangeDenominator:(double)a3
{
  double v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  _QWORD v7[4];
  NSManagedObjectContext *v8;
  double v9;

  if (a3 >= 1.0)
    v4 = a3;
  else
    v4 = 1.0;
  v5 = self->_moc;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__PLGlobalValues_setSyndicationSyncRangeDenominator___block_invoke;
  v7[3] = &unk_1E3674C18;
  v9 = v4;
  v8 = v5;
  v6 = v5;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v7, "-[PLGlobalValues setSyndicationSyncRangeDenominator:]");

}

- (NSPersistentHistoryToken)lastGuestAssetSyncToken
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__PLGlobalValues_lastGuestAssetSyncToken__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSPersistentHistoryToken *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setLastGuestAssetSyncToken:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__PLGlobalValues_setLastGuestAssetSyncToken___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setLastGuestAssetSyncToken:]");

}

- (NSNumber)guestAssetSyncStatus
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__PLGlobalValues_guestAssetSyncStatus__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setGuestAssetSyncStatus:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__PLGlobalValues_setGuestAssetSyncStatus___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setGuestAssetSyncStatus:]");

}

- (NSString)guestAssetInitialSyncResumeMarker
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__PLGlobalValues_guestAssetInitialSyncResumeMarker__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setGuestAssetInitialSyncResumeMarker:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__PLGlobalValues_setGuestAssetInitialSyncResumeMarker___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setGuestAssetInitialSyncResumeMarker:]");

}

- (NSString)lastGuestAssetSyncTargetLibraryPath
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__PLGlobalValues_lastGuestAssetSyncTargetLibraryPath__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setLastGuestAssetSyncTargetLibraryPath:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__PLGlobalValues_setLastGuestAssetSyncTargetLibraryPath___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setLastGuestAssetSyncTargetLibraryPath:]");

}

- (NSPersistentHistoryToken)lastPersonSyncToken
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__PLGlobalValues_lastPersonSyncToken__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSPersistentHistoryToken *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setLastPersonSyncToken:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__PLGlobalValues_setLastPersonSyncToken___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setLastPersonSyncToken:]");

}

- (NSString)lastPersonSyncSourceLibraryPath
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__PLGlobalValues_lastPersonSyncSourceLibraryPath__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setLastPersonSyncSourceLibraryPath:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__PLGlobalValues_setLastPersonSyncSourceLibraryPath___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setLastPersonSyncSourceLibraryPath:]");

}

- (NSPersistentHistoryToken)lastDuplicateDetectorProcessingToken
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__PLGlobalValues_lastDuplicateDetectorProcessingToken__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSPersistentHistoryToken *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setLastDuplicateDetectorProcessingToken:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__PLGlobalValues_setLastDuplicateDetectorProcessingToken___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setLastDuplicateDetectorProcessingToken:]");

}

- (BOOL)isInitialDuplicateDetectorProcessingCompleted
{
  void *v2;
  BOOL v3;

  -[PLGlobalValues lastInitialDuplicateDetectorProcessingCompletedToken](self, "lastInitialDuplicateDetectorProcessingCompletedToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSPersistentHistoryToken)lastInitialDuplicateDetectorProcessingCompletedToken
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70__PLGlobalValues_lastInitialDuplicateDetectorProcessingCompletedToken__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSPersistentHistoryToken *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setLastInitialDuplicateDetectorProcessingCompletedToken:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__PLGlobalValues_setLastInitialDuplicateDetectorProcessingCompletedToken___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setLastInitialDuplicateDetectorProcessingCompletedToken:]");

}

- (NSPersistentHistoryToken)lastSharedAssetContainerProcessingToken
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__PLGlobalValues_lastSharedAssetContainerProcessingToken__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSPersistentHistoryToken *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setLastSharedAssetContainerProcessingToken:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__PLGlobalValues_setLastSharedAssetContainerProcessingToken___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setLastSharedAssetContainerProcessingToken:]");

}

- (NSString)lockedResourceTransitionAssetUUID
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__PLGlobalValues_lockedResourceTransitionAssetUUID__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setLockedResourceTransitionAssetUUID:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__PLGlobalValues_setLockedResourceTransitionAssetUUID___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setLockedResourceTransitionAssetUUID:]");

}

- (NSNumber)orphanedSceneClassificationsCount
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__PLGlobalValues_orphanedSceneClassificationsCount__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setOrphanedSceneClassificationsCount:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__PLGlobalValues_setOrphanedSceneClassificationsCount___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setOrphanedSceneClassificationsCount:]");

}

- (NSString)cloudTrackerLastKnownCloudVersion
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__PLGlobalValues_cloudTrackerLastKnownCloudVersion__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setCloudTrackerLastKnownCloudVersion:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__PLGlobalValues_setCloudTrackerLastKnownCloudVersion___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setCloudTrackerLastKnownCloudVersion:]");

}

- (NSPersistentHistoryToken)cloudTrackerLastKnownToken
{
  return (NSPersistentHistoryToken *)-[PLGlobalValues _lastKnownTransactionTokenWithTransactionNumberKey:andStoreUUIDKey:](self, "_lastKnownTransactionTokenWithTransactionNumberKey:andStoreUUIDKey:", CFSTR("CloudTrackerLastKnownTransactionNumber"), CFSTR("CloudTrackerLastKnownTransactionStoreUUID"));
}

- (void)setCloudTrackerLastKnownToken:(id)a3
{
  -[PLGlobalValues _setLastKnownTransactionToken:withTransactionNumberKey:andStoreUUIDKey:](self, "_setLastKnownTransactionToken:withTransactionNumberKey:andStoreUUIDKey:", a3, CFSTR("CloudTrackerLastKnownTransactionNumber"), CFSTR("CloudTrackerLastKnownTransactionStoreUUID"));
}

- (NSPersistentHistoryToken)libraryScopeRulesTrackerLastKnownToken
{
  return (NSPersistentHistoryToken *)-[PLGlobalValues _lastKnownTransactionTokenWithTransactionNumberKey:andStoreUUIDKey:](self, "_lastKnownTransactionTokenWithTransactionNumberKey:andStoreUUIDKey:", CFSTR("LibraryScopeRulesTrackerLastKnownTransactionNumber"), CFSTR("LibraryScopeRulesTrackerLastKnownStoreUUID"));
}

- (void)setLibraryScopeRulesTrackerLastKnownToken:(id)a3
{
  -[PLGlobalValues _setLastKnownTransactionToken:withTransactionNumberKey:andStoreUUIDKey:](self, "_setLastKnownTransactionToken:withTransactionNumberKey:andStoreUUIDKey:", a3, CFSTR("LibraryScopeRulesTrackerLastKnownTransactionNumber"), CFSTR("LibraryScopeRulesTrackerLastKnownStoreUUID"));
}

- (BOOL)hasCloudInitialUploadCompleted
{
  void *v2;
  char v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__PLGlobalValues_hasCloudInitialUploadCompleted__block_invoke;
  v5[3] = &unk_1E3670AD8;
  v5[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setCloudInitialUploadCompleted:(BOOL)a3
{
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  _QWORD v7[4];
  NSManagedObjectContext *v8;
  BOOL v9;

  v5 = self->_moc;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__PLGlobalValues_setCloudInitialUploadCompleted___block_invoke;
  v7[3] = &unk_1E36762F8;
  v9 = a3;
  v8 = v5;
  v6 = v5;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v7, "-[PLGlobalValues setCloudInitialUploadCompleted:]");

}

- (NSDate)lastCompletePrefetchDate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__PLGlobalValues_lastCompletePrefetchDate__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setLastCompletePrefetchDate:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__PLGlobalValues_setLastCompletePrefetchDate___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setLastCompletePrefetchDate:]");

}

- (NSNumber)searchIndexVersion
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__PLGlobalValues_searchIndexVersion__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setSearchIndexVersion:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__PLGlobalValues_setSearchIndexVersion___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSearchIndexVersion:]");

}

- (NSNumber)searchIndexEmbeddingModelVersion
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__PLGlobalValues_searchIndexEmbeddingModelVersion__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setSearchIndexEmbeddingModelVersion:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__PLGlobalValues_setSearchIndexEmbeddingModelVersion___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSearchIndexEmbeddingModelVersion:]");

}

- (void)setSearchIndexUtilityTypeClassifierVersion:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__PLGlobalValues_setSearchIndexUtilityTypeClassifierVersion___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSearchIndexUtilityTypeClassifierVersion:]");

}

- (NSNumber)searchIndexUtilityTypeClassifierVersion
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__PLGlobalValues_searchIndexUtilityTypeClassifierVersion__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)searchIndexLocaleIdentifier
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__PLGlobalValues_searchIndexLocaleIdentifier__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setSearchIndexLocaleIdentifier:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__PLGlobalValues_setSearchIndexLocaleIdentifier___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSearchIndexLocaleIdentifier:]");

}

- (NSString)searchIndexSceneTaxonomySHA
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__PLGlobalValues_searchIndexSceneTaxonomySHA__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setSearchIndexSceneTaxonomySHA:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__PLGlobalValues_setSearchIndexSceneTaxonomySHA___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSearchIndexSceneTaxonomySHA:]");

}

- (NSNumber)searchIndexFeatureSettings
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__PLGlobalValues_searchIndexFeatureSettings__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setSearchIndexFeatureSettings:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__PLGlobalValues_setSearchIndexFeatureSettings___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSearchIndexFeatureSettings:]");

}

- (NSNumber)searchIndexStatus
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__PLGlobalValues_searchIndexStatus__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setSearchIndexStatus:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__PLGlobalValues_setSearchIndexStatus___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSearchIndexStatus:]");

}

- (NSString)searchIndexRebuildResumeMarker
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__PLGlobalValues_searchIndexRebuildResumeMarker__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setSearchIndexRebuildResumeMarker:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__PLGlobalValues_setSearchIndexRebuildResumeMarker___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSearchIndexRebuildResumeMarker:]");

}

- (NSDictionary)searchIndexSpotlightClientState
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__PLGlobalValues_searchIndexSpotlightClientState__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setSearchIndexSpotlightClientState:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__PLGlobalValues_setSearchIndexSpotlightClientState___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSearchIndexSpotlightClientState:]");

}

- (NSNumber)searchIndexSpotlightClientStateMissingCount
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__PLGlobalValues_searchIndexSpotlightClientStateMissingCount__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setSearchIndexSpotlightClientStateMissingCount:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__PLGlobalValues_setSearchIndexSpotlightClientStateMissingCount___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSearchIndexSpotlightClientStateMissingCount:]");

}

- (NSNumber)searchIndexSpotlightClientStateMismatchedCount
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__PLGlobalValues_searchIndexSpotlightClientStateMismatchedCount__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setSearchIndexSpotlightClientStateMismatchedCount:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__PLGlobalValues_setSearchIndexSpotlightClientStateMismatchedCount___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSearchIndexSpotlightClientStateMismatchedCount:]");

}

- (NSDate)searchIndexRebuildStartDate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__PLGlobalValues_searchIndexRebuildStartDate__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setSearchIndexRebuildStartDate:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__PLGlobalValues_setSearchIndexRebuildStartDate___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSearchIndexRebuildStartDate:]");

}

- (NSDate)searchIndexRebuildEndDate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__PLGlobalValues_searchIndexRebuildEndDate__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setSearchIndexRebuildEndDate:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__PLGlobalValues_setSearchIndexRebuildEndDate___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSearchIndexRebuildEndDate:]");

}

- (NSNumber)searchIndexRebuildRequiredExternalReasons
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__PLGlobalValues_searchIndexRebuildRequiredExternalReasons__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setSearchIndexRebuildRequiredExternalReasons:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__PLGlobalValues_setSearchIndexRebuildRequiredExternalReasons___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSearchIndexRebuildRequiredExternalReasons:]");

}

- (NSNumber)searchIndexRebuildCoalescedReasons
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__PLGlobalValues_searchIndexRebuildCoalescedReasons__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setSearchIndexRebuildCoalescedReasons:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__PLGlobalValues_setSearchIndexRebuildCoalescedReasons___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSearchIndexRebuildCoalescedReasons:]");

}

- (void)setLastUpdatedGraphLabelsAgainstPLSImageUUID:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__PLGlobalValues_setLastUpdatedGraphLabelsAgainstPLSImageUUID___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setLastUpdatedGraphLabelsAgainstPLSImageUUID:]");

}

- (NSString)lastUpdatedGraphLabelsAgainstPLSImageUUID
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__PLGlobalValues_lastUpdatedGraphLabelsAgainstPLSImageUUID__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setFeatureAvailability:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__PLGlobalValues_setFeatureAvailability___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setFeatureAvailability:]");

}

- (NSDictionary)featureAvailability
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__PLGlobalValues_featureAvailability__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setTimeOfLastFeatureAvailabilityJob:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__PLGlobalValues_setTimeOfLastFeatureAvailabilityJob___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setTimeOfLastFeatureAvailabilityJob:]");

}

- (NSDate)timeOfLastFeatureAvailabilityJob
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__PLGlobalValues_timeOfLastFeatureAvailabilityJob__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setSearchFeatureReadyDate:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__PLGlobalValues_setSearchFeatureReadyDate___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSearchFeatureReadyDate:]");

}

- (NSDate)searchFeatureReadyDate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__PLGlobalValues_searchFeatureReadyDate__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setSearchFeatureReadyFraction:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__PLGlobalValues_setSearchFeatureReadyFraction___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setSearchFeatureReadyFraction:]");

}

- (NSNumber)searchFeatureReadyFraction
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__PLGlobalValues_searchFeatureReadyFraction__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setMediaAnalysisEmbeddingVersion:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__PLGlobalValues_setMediaAnalysisEmbeddingVersion___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setMediaAnalysisEmbeddingVersion:]");

}

- (NSNumber)mediaAnalysisEmbeddingVersion
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__PLGlobalValues_mediaAnalysisEmbeddingVersion__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setMediaAnalysisEmbeddingVersionBumpDate:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__PLGlobalValues_setMediaAnalysisEmbeddingVersionBumpDate___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setMediaAnalysisEmbeddingVersionBumpDate:]");

}

- (NSDate)mediaAnalysisEmbeddingVersionBumpDate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__PLGlobalValues_mediaAnalysisEmbeddingVersionBumpDate__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setLibraryReadyForAnalysisDate:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NSManagedObjectContext *v10;

  v4 = a3;
  v5 = self->_moc;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__PLGlobalValues_setLibraryReadyForAnalysisDate___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLGlobalValues _setValueUsingPerformBlockAndWait:responsibleCaller:](self, "_setValueUsingPerformBlockAndWait:responsibleCaller:", v8, "-[PLGlobalValues setLibraryReadyForAnalysisDate:]");

}

- (NSDate)libraryReadyForAnalysisDate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__PLGlobalValues_libraryReadyForAnalysisDate__block_invoke;
  v3[3] = &unk_1E3670AD8;
  v3[4] = self;
  -[PLGlobalValues _getValueUsingPerformBlockAndWait:](self, "_getValueUsingPerformBlockAndWait:", v3);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)_getValueUsingPerformBlockAndWait:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4780;
  v15 = __Block_byref_object_dispose__4781;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__PLGlobalValues__getValueUsingPerformBlockAndWait___block_invoke;
  v8[3] = &unk_1E3676F20;
  v8[4] = self;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  +[PLManagedObjectContext _pl_megamoc_runWithPerformWarningsSuppressed:](PLManagedObjectContext, "_pl_megamoc_runWithPerformWarningsSuppressed:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)_setValueUsingPerformBlockAndWait:(id)a3 responsibleCaller:(const char *)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  const char *v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__PLGlobalValues__setValueUsingPerformBlockAndWait_responsibleCaller___block_invoke;
  v8[3] = &unk_1E3674C40;
  v8[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  +[PLManagedObjectContext _pl_megamoc_runWithPerformWarningsSuppressed:](PLManagedObjectContext, "_pl_megamoc_runWithPerformWarningsSuppressed:", v8);

}

- (NSManagedObjectContext)moc
{
  return self->_moc;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moc, 0);
}

void __70__PLGlobalValues__setValueUsingPerformBlockAndWait_responsibleCaller___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  uint64_t v7;

  v2 = (void *)a1[5];
  v3 = *(void **)(a1[4] + 8);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__PLGlobalValues__setValueUsingPerformBlockAndWait_responsibleCaller___block_invoke_2;
  v5[3] = &unk_1E3674C40;
  v4 = v2;
  v5[4] = a1[4];
  v6 = v4;
  v7 = a1[6];
  objc_msgSend(v3, "pl_performBlockAndWait:", v5);

}

void __70__PLGlobalValues__setValueUsingPerformBlockAndWait_responsibleCaller___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(a1[5] + 16))();
  objc_msgSend(*(id *)(a1[4] + 8), "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2 || !objc_msgSend(v2, "pendingTransactions"))
  {
    v4 = *(void **)(a1[4] + 8);
    v9 = 0;
    v5 = objc_msgSend(v4, "save:", &v9);
    v6 = v9;
    if ((v5 & 1) == 0)
    {
      PLBackendGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = a1[6];
        *(_DWORD *)buf = 136446466;
        v11 = v8;
        v12 = 2112;
        v13 = v6;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Error setting value from caller: %{public}s, error: %@", buf, 0x16u);
      }

    }
  }

}

void __52__PLGlobalValues__getValueUsingPerformBlockAndWait___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  __int128 v3;
  _QWORD v4[4];
  id v5[2];

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__PLGlobalValues__getValueUsingPerformBlockAndWait___block_invoke_2;
  v4[3] = &unk_1E36714A8;
  v3 = *(_OWORD *)(a1 + 40);
  v2 = (id)v3;
  *(_OWORD *)v5 = v3;
  objc_msgSend(v1, "pl_performBlockAndWait:", v4);

}

void __52__PLGlobalValues__getValueUsingPerformBlockAndWait___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id __45__PLGlobalValues_libraryReadyForAnalysisDate__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("LibraryReadyForAnalysisDate"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __49__PLGlobalValues_setLibraryReadyForAnalysisDate___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("LibraryReadyForAnalysisDate"), *(_QWORD *)(a1 + 40));
}

id __55__PLGlobalValues_mediaAnalysisEmbeddingVersionBumpDate__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("MediaAnalysisEmbeddingVersionBumpDate"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __59__PLGlobalValues_setMediaAnalysisEmbeddingVersionBumpDate___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("MediaAnalysisEmbeddingVersionBumpDate"), *(_QWORD *)(a1 + 40));
}

id __47__PLGlobalValues_mediaAnalysisEmbeddingVersion__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("MediaAnalysisEmbeddingVersion"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __51__PLGlobalValues_setMediaAnalysisEmbeddingVersion___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("MediaAnalysisEmbeddingVersion"), *(_QWORD *)(a1 + 40));
}

id __44__PLGlobalValues_searchFeatureReadyFraction__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("SearchFeatureReadyFraction"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __48__PLGlobalValues_setSearchFeatureReadyFraction___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("SearchFeatureReadyFraction"), *(_QWORD *)(a1 + 40));
}

id __40__PLGlobalValues_searchFeatureReadyDate__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("SearchFeatureReadyDate"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __44__PLGlobalValues_setSearchFeatureReadyDate___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("SearchFeatureReadyDate"), *(_QWORD *)(a1 + 40));
}

id __50__PLGlobalValues_timeOfLastFeatureAvailabilityJob__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("TimeOfLastFeatureAvailabilityJob"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __54__PLGlobalValues_setTimeOfLastFeatureAvailabilityJob___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("TimeOfLastFeatureAvailabilityJob"), *(_QWORD *)(a1 + 40));
}

id __37__PLGlobalValues_featureAvailability__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("FeatureAvailabilityKey"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __41__PLGlobalValues_setFeatureAvailability___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("FeatureAvailabilityKey"), *(_QWORD *)(a1 + 40));
}

id __59__PLGlobalValues_lastUpdatedGraphLabelsAgainstPLSImageUUID__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("LastUpdatedGraphLabel"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __63__PLGlobalValues_setLastUpdatedGraphLabelsAgainstPLSImageUUID___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("LastUpdatedGraphLabel"), *(_QWORD *)(a1 + 40));
}

uint64_t __56__PLGlobalValues_setSearchIndexRebuildCoalescedReasons___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("SearchIndexRebuildCoalescedReasons"), *(_QWORD *)(a1 + 40));
}

id __52__PLGlobalValues_searchIndexRebuildCoalescedReasons__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("SearchIndexRebuildCoalescedReasons"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __63__PLGlobalValues_setSearchIndexRebuildRequiredExternalReasons___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("SearchIndexRebuildRequiredExternalReason"), *(_QWORD *)(a1 + 40));
}

id __59__PLGlobalValues_searchIndexRebuildRequiredExternalReasons__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("SearchIndexRebuildRequiredExternalReason"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __47__PLGlobalValues_setSearchIndexRebuildEndDate___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("SearchIndexRebuildEndDate"), *(_QWORD *)(a1 + 40));
}

id __43__PLGlobalValues_searchIndexRebuildEndDate__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("SearchIndexRebuildEndDate"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __49__PLGlobalValues_setSearchIndexRebuildStartDate___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("SearchIndexRebuildStartDate"), *(_QWORD *)(a1 + 40));
}

id __45__PLGlobalValues_searchIndexRebuildStartDate__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("SearchIndexRebuildStartDate"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __68__PLGlobalValues_setSearchIndexSpotlightClientStateMismatchedCount___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("SearchIndexSpotlightClientStateMissingCount"), *(_QWORD *)(a1 + 40));
}

id __64__PLGlobalValues_searchIndexSpotlightClientStateMismatchedCount__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("SearchIndexSpotlightClientStateMismatchedCount"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __65__PLGlobalValues_setSearchIndexSpotlightClientStateMissingCount___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("SearchIndexSpotlightClientStateMissingCount"), *(_QWORD *)(a1 + 40));
}

id __61__PLGlobalValues_searchIndexSpotlightClientStateMissingCount__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("SearchIndexSpotlightClientStateMissingCount"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __53__PLGlobalValues_setSearchIndexSpotlightClientState___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("SearchIndexSpotlightClientState"), *(_QWORD *)(a1 + 40));
}

id __49__PLGlobalValues_searchIndexSpotlightClientState__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("SearchIndexSpotlightClientState"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __52__PLGlobalValues_setSearchIndexRebuildResumeMarker___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("SearchIndexRebuildResumeMarker"), *(_QWORD *)(a1 + 40));
}

id __48__PLGlobalValues_searchIndexRebuildResumeMarker__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("SearchIndexRebuildResumeMarker"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __39__PLGlobalValues_setSearchIndexStatus___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("SearchIndexStatus"), *(_QWORD *)(a1 + 40));
}

id __35__PLGlobalValues_searchIndexStatus__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("SearchIndexStatus"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __48__PLGlobalValues_setSearchIndexFeatureSettings___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("SearchIndexFeatureSettings"), *(_QWORD *)(a1 + 40));
}

id __44__PLGlobalValues_searchIndexFeatureSettings__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("SearchIndexFeatureSettings"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __49__PLGlobalValues_setSearchIndexSceneTaxonomySHA___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("SearchIndexSceneTaxonomySHA"), *(_QWORD *)(a1 + 40));
}

id __45__PLGlobalValues_searchIndexSceneTaxonomySHA__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("SearchIndexSceneTaxonomySHA"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __49__PLGlobalValues_setSearchIndexLocaleIdentifier___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("SearchIndexLocaleIdentifier"), *(_QWORD *)(a1 + 40));
}

id __45__PLGlobalValues_searchIndexLocaleIdentifier__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("SearchIndexLocaleIdentifier"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

id __57__PLGlobalValues_searchIndexUtilityTypeClassifierVersion__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("SearchIndexUtilityTypeClassifierVersion"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __61__PLGlobalValues_setSearchIndexUtilityTypeClassifierVersion___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("SearchIndexUtilityTypeClassifierVersion"), *(_QWORD *)(a1 + 40));
}

uint64_t __54__PLGlobalValues_setSearchIndexEmbeddingModelVersion___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("SearchIndexEmbeddingModelVersionKey"), *(_QWORD *)(a1 + 40));
}

id __50__PLGlobalValues_searchIndexEmbeddingModelVersion__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("SearchIndexEmbeddingModelVersionKey"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __40__PLGlobalValues_setSearchIndexVersion___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("SearchIndexVersion"), *(_QWORD *)(a1 + 40));
}

id __36__PLGlobalValues_searchIndexVersion__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("SearchIndexVersion"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __46__PLGlobalValues_setLastCompletePrefetchDate___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("LastCompletePrefetchDate"), *(_QWORD *)(a1 + 40));
}

id __42__PLGlobalValues_lastCompletePrefetchDate__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("LastCompletePrefetchDate"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

void __49__PLGlobalValues_setCloudInitialUploadCompleted___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  v3 = (id)v2;
  +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", v2, CFSTR("CloudInitialUploadDate"), *(_QWORD *)(a1 + 32));

}

id __48__PLGlobalValues_hasCloudInitialUploadCompleted__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("CloudInitialUploadDate"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
    v2 = (void *)MEMORY[0x1E0C9AAB0];
  else
    v2 = (void *)MEMORY[0x1E0C9AAA0];
  v3 = v2;

  return v3;
}

uint64_t __55__PLGlobalValues_setCloudTrackerLastKnownCloudVersion___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("CloudTrackerLastKnownCloudVersion"), *(_QWORD *)(a1 + 40));
}

id __51__PLGlobalValues_cloudTrackerLastKnownCloudVersion__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("CloudTrackerLastKnownCloudVersion"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __55__PLGlobalValues_setOrphanedSceneClassificationsCount___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("OrphanedSceneClassificationsCount"), *(_QWORD *)(a1 + 40));
}

id __51__PLGlobalValues_orphanedSceneClassificationsCount__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("OrphanedSceneClassificationsCount"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __55__PLGlobalValues_setLockedResourceTransitionAssetUUID___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("LockedResourceTransitionAssetUUID"), *(_QWORD *)(a1 + 40));
}

id __51__PLGlobalValues_lockedResourceTransitionAssetUUID__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("LockedResourceTransitionAssetUUID"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __61__PLGlobalValues_setLastSharedAssetContainerProcessingToken___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("LastSharedAssetContainerUpdateToken"), *(_QWORD *)(a1 + 40));
}

id __57__PLGlobalValues_lastSharedAssetContainerProcessingToken__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("LastSharedAssetContainerUpdateToken"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __74__PLGlobalValues_setLastInitialDuplicateDetectorProcessingCompletedToken___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("LastInitialDuplicateDetectorProcessingCompletedToken"), *(_QWORD *)(a1 + 40));
}

id __70__PLGlobalValues_lastInitialDuplicateDetectorProcessingCompletedToken__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("LastInitialDuplicateDetectorProcessingCompletedToken"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __58__PLGlobalValues_setLastDuplicateDetectorProcessingToken___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("LastDuplicateDetectorProcessingToken"), *(_QWORD *)(a1 + 40));
}

id __54__PLGlobalValues_lastDuplicateDetectorProcessingToken__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("LastDuplicateDetectorProcessingToken"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __53__PLGlobalValues_setLastPersonSyncSourceLibraryPath___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("LastPersonSyncSourceLibraryPath"), *(_QWORD *)(a1 + 40));
}

id __49__PLGlobalValues_lastPersonSyncSourceLibraryPath__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("LastPersonSyncSourceLibraryPath"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __41__PLGlobalValues_setLastPersonSyncToken___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("LastPersonSyncToken"), *(_QWORD *)(a1 + 40));
}

id __37__PLGlobalValues_lastPersonSyncToken__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("LastPersonSyncToken"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __57__PLGlobalValues_setLastGuestAssetSyncTargetLibraryPath___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("LastGuestAssetSyncTargetLibraryPath"), *(_QWORD *)(a1 + 40));
}

id __53__PLGlobalValues_lastGuestAssetSyncTargetLibraryPath__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("LastGuestAssetSyncTargetLibraryPath"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __55__PLGlobalValues_setGuestAssetInitialSyncResumeMarker___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("GuestAssetInitialSyncResumeMarker"), *(_QWORD *)(a1 + 40));
}

id __51__PLGlobalValues_guestAssetInitialSyncResumeMarker__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("GuestAssetInitialSyncResumeMarker"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __42__PLGlobalValues_setGuestAssetSyncStatus___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("GuestAssetSyncStatus"), *(_QWORD *)(a1 + 40));
}

id __38__PLGlobalValues_guestAssetSyncStatus__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("GuestAssetSyncStatus"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __45__PLGlobalValues_setLastGuestAssetSyncToken___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("LastGuestAssetSyncToken"), *(_QWORD *)(a1 + 40));
}

id __41__PLGlobalValues_lastGuestAssetSyncToken__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("LastGuestAssetSyncToken"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

void __53__PLGlobalValues_setSyndicationSyncRangeDenominator___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", v2, CFSTR("PLSyndicationSyncRangeDenominator"), *(_QWORD *)(a1 + 32));

}

id __49__PLGlobalValues_syndicationSyncRangeDenominator__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("PLSyndicationSyncRangeDenominator"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __63__PLGlobalValues_setSyndicationPrefetchDownloadThrottlingDate___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("PLSyndicationPrefetchDownloadThrottlingDate"), *(_QWORD *)(a1 + 40));
}

id __59__PLGlobalValues_syndicationPrefetchDownloadThrottlingDate__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("PLSyndicationPrefetchDownloadThrottlingDate"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __42__PLGlobalValues_setSyndicationStartDate___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("SyndicationStartDate"), *(_QWORD *)(a1 + 40));
}

id __38__PLGlobalValues_syndicationStartDate__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("SyndicationStartDate"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __51__PLGlobalValues_setLastDeleteSyndicationSyncDate___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("LastDeleteSyndicationSyncDateKey"), *(_QWORD *)(a1 + 40));
}

id __47__PLGlobalValues_lastDeleteSyndicationSyncDate__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("LastDeleteSyndicationSyncDateKey"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __49__PLGlobalValues_setLastChatSyndicationSyncDate___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("LastChatSyndicationSyncDate"), *(_QWORD *)(a1 + 40));
}

id __45__PLGlobalValues_lastChatSyndicationSyncDate__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("LastChatSyndicationSyncDate"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __55__PLGlobalValues_setLastAttachmentSyndicationSyncDate___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("LastAttachmentSyndicationSyncDate"), *(_QWORD *)(a1 + 40));
}

id __51__PLGlobalValues_lastAttachmentSyndicationSyncDate__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("LastAttachmentSyndicationSyncDate"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __60__PLGlobalValues_setInProgressFullIndexSyndicationSyncDate___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("InProgressFullIndexSyndicationSyncDate"), *(_QWORD *)(a1 + 40));
}

id __56__PLGlobalValues_inProgressFullIndexSyndicationSyncDate__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("InProgressFullIndexSyndicationSyncDate"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __59__PLGlobalValues_setLastFullIndexSyndicationSyncStartDate___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("LastFullIndexSyndicationSyncStartDate"), *(_QWORD *)(a1 + 40));
}

id __55__PLGlobalValues_lastFullIndexSyndicationSyncStartDate__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("LastFullIndexSyndicationSyncStartDate"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

id __62__PLGlobalValues__deprecated_lastFullIndexSyndicationSyncDate__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("LastFullIndexSyndicationSyncDate"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

void __47__PLGlobalValues_shouldPrefetchWidgetResources__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  double v7;
  BOOL v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("LastWidgetUpdateDate"), CFSTR("LargestWidgetPixelSize"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGlobalKeyValue globalValuesForKeys:managedObjectContext:](PLGlobalKeyValue, "globalValuesForKeys:managedObjectContext:", v2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("LastWidgetUpdateDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("LargestWidgetPixelSize"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -259200.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v6);
  v8 = v7 > 0.0 && v5 > objc_msgSend(MEMORY[0x1E0D11440], "maxPixelSizeForResourceType:", 5);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8;

}

void __59__PLGlobalValues_setWidgetTimelineGeneratedForDisplaySize___block_invoke(uint64_t a1)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  double v10;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:");
  if (*(double *)(a1 + 40) != *MEMORY[0x1E0C9D820] || *(double *)(a1 + 48) != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("LargestWidgetSizeDate"), CFSTR("LargestWidgetPixelSize"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLGlobalKeyValue globalValuesForKeys:managedObjectContext:](PLGlobalKeyValue, "globalValuesForKeys:managedObjectContext:", v3, *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LargestWidgetSizeDate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LargestWidgetPixelSize"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -86400.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = vcvtpd_u64_f64(*(double *)(a1 + 40) * *(double *)(a1 + 48));
    objc_msgSend(v5, "timeIntervalSinceDate:", v8);
    if (v10 <= 0.0 || v7 < v9)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", v12, CFSTR("LargestWidgetPixelSize"), *(_QWORD *)(a1 + 32));

      +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", v13, CFSTR("LargestWidgetSizeDate"), *(_QWORD *)(a1 + 32));
    }

  }
}

id __38__PLGlobalValues_libraryCreateOptions__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("LibraryCreateOptions"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __51__PLGlobalValues_setGreenTeaContactsAuthorization___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("GreenTeaContactsAuthorization"), *(_QWORD *)(a1 + 40));
}

id __47__PLGlobalValues_greenTeaContactsAuthorization__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("GreenTeaContactsAuthorization"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __38__PLGlobalValues_setLocaleIdentifier___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("LocaleIdentifier"), *(_QWORD *)(a1 + 40));
}

id __34__PLGlobalValues_localeIdentifier__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("LocaleIdentifier"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __33__PLGlobalValues_setGreenValues___block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", *(_QWORD *)(a1 + 32), CFSTR("GreenValues"), *(_QWORD *)(a1 + 40));
}

id __29__PLGlobalValues_greenValues__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("GreenValues"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

void __57__PLGlobalValues_setBackgroundJobServiceNeedsProcessing___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setBackgroundJobServiceNeedsProcessing:", *(unsigned __int8 *)(a1 + 40));

}

id __53__PLGlobalValues_backgroundJobServiceNeedsProcessing__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("BackgroundJobServiceNeedsProcessing"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

void __36__PLGlobalValues_setRebuildComplete__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setRebuildComplete");

}

id __35__PLGlobalValues_isRebuildComplete__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("JournalRebuildRequired"), CFSTR("RebuildCompleteDate"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGlobalKeyValue globalValuesForKeys:managedObjectContext:](PLGlobalKeyValue, "globalValuesForKeys:managedObjectContext:", v2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __44__PLGlobalValues_setJournalRebuildRequired___block_invoke(uint64_t a1)
{
  return +[PLGlobalValues setJournalRebuildRequired:managedObjectContext:](PLGlobalValues, "setJournalRebuildRequired:managedObjectContext:", *(unsigned __int8 *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

id __42__PLGlobalValues_isJournalRebuildRequired__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("JournalRebuildRequired"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

void __54__PLGlobalValues_dontImportFileSystemDataIntoDatabase__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setImportFilesystemAssetsState:", 1);
  objc_msgSend(WeakRetained, "_setRebuildComplete");

}

void __49__PLGlobalValues_setImportFilesystemAssetsState___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setImportFilesystemAssetsState:", *(_QWORD *)(a1 + 40));

}

id __45__PLGlobalValues_importFilesystemAssetsState__block_invoke(uint64_t a1)
{
  return +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("ImportedFileSystemAssets"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

id __43__PLGlobalValues_didImportFileSystemAssets__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", CFSTR("ImportedFileSystemAssets"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v1, "integerValue") == 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void __89__PLGlobalValues__setLastKnownTransactionToken_withTransactionNumberKey_andStoreUUIDKey___block_invoke(_QWORD *a1)
{
  id v2;

  +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", a1[4], a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((PLObjectIsEqual() & 1) == 0)
    +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", a1[6], a1[4], a1[5]);
  +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", a1[7], a1[8], a1[5]);

}

id __85__PLGlobalValues__lastKnownTransactionTokenWithTransactionNumberKey_andStoreUUIDKey___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  BOOL v4;
  void *v5;

  +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", a1[4], *(_QWORD *)(a1[5] + 8));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGlobalKeyValue globalValueForKey:managedObjectContext:](PLGlobalKeyValue, "globalValueForKey:managedObjectContext:", a1[6], *(_QWORD *)(a1[5] + 8));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = v2 == 0;
  else
    v4 = 1;
  if (v4)
    v5 = 0;
  else
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97BE8]), "initWithTransactionNumber:andStoreID:", v3, v2);

  return v5;
}

+ (void)setJournalRebuildRequired:(BOOL)a3 managedObjectContext:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  const __CFString *v7;
  id v8;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    v5 = a4;
    objc_msgSend(v4, "numberWithBool:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", v6, CFSTR("JournalRebuildRequired"), v5);

    v7 = CFSTR("RebuildCompleteDate");
    v8 = v5;
  }
  else
  {
    v8 = a4;
    v7 = CFSTR("JournalRebuildRequired");
  }
  +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", 0, v7, v8);

}

+ (void)setLibraryCreateOptions:(unint64_t)a3 managedObjectContext:(id)a4
{
  void *v5;
  id v6;
  id v7;

  if (a3)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    v6 = a4;
    objc_msgSend(v5, "numberWithUnsignedInteger:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", v7, CFSTR("LibraryCreateOptions"), v6);

  }
}

+ (void)setSyndicationPrefetchDownloadThrottlingDate:(id)a3 managedObjectContext:(id)a4
{
  +[PLGlobalKeyValue setGlobalValue:forKey:managedObjectContext:](PLGlobalKeyValue, "setGlobalValue:forKey:managedObjectContext:", a3, CFSTR("PLSyndicationPrefetchDownloadThrottlingDate"), a4);
}

- (unint64_t)unpackedSearchIndexStatus
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[PLGlobalValues searchIndexStatus](self, "searchIndexStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PLGlobalValues searchIndexStatus](self, "searchIndexStatus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unsignedIntegerValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)unpackedSearchIndexFeatureSettings
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[PLGlobalValues searchIndexFeatureSettings](self, "searchIndexFeatureSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PLGlobalValues searchIndexFeatureSettings](self, "searchIndexFeatureSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unsignedIntegerValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)unpackedSearchIndexRebuildRequiredExternalReasons
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[PLGlobalValues searchIndexRebuildRequiredExternalReasons](self, "searchIndexRebuildRequiredExternalReasons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PLGlobalValues searchIndexRebuildRequiredExternalReasons](self, "searchIndexRebuildRequiredExternalReasons");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unsignedIntegerValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)unpackedSearchIndexRebuildCoalescedReasons
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[PLGlobalValues searchIndexRebuildCoalescedReasons](self, "searchIndexRebuildCoalescedReasons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PLGlobalValues searchIndexRebuildCoalescedReasons](self, "searchIndexRebuildCoalescedReasons");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unsignedIntegerValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)searchIndexingEntityToRebuild
{
  unint64_t v2;
  unint64_t result;

  v2 = -[PLGlobalValues unpackedSearchIndexStatus](self, "unpackedSearchIndexStatus");
  result = 0;
  while (((0xBAu >> result) & 1) == 0 || (qword_199B9F630[result] & ~v2) == 0)
  {
    if (++result == 9)
      return 0;
  }
  return result;
}

- (BOOL)rebuildWorkIsRequiredForEntity:(unint64_t)a3
{
  BOOL result;
  uint64_t v5;

  result = 0;
  if (a3 <= 8 && ((0xBAu >> a3) & 1) != 0)
  {
    v5 = qword_199B9F630[a3];
    return (-[PLGlobalValues unpackedSearchIndexStatus](self, "unpackedSearchIndexStatus") & v5) == 0;
  }
  return result;
}

- (NSManagedObjectID)searchIndexRebuildResumeObjectID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  __CFString *v13;
  __CFString *v14;
  int v16;
  void *v17;
  __int16 v18;
  __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[PLGlobalValues searchIndexRebuildResumeMarker](self, "searchIndexRebuildResumeMarker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
LABEL_9:
    v7 = 0;
    goto LABEL_10;
  }
  -[PLGlobalValues moc](self, "moc");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistentStoreCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectIDForURIRepresentation:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PLGlobalValues searchIndexingEntityToRebuild](self, "searchIndexingEntityToRebuild");
  objc_msgSend(v7, "entity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = PLSearchIndexingEntityForEntityName(v10);

  if (v11 != v8)
  {
    PLSearchBackendIndexRebuildGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      if (v8 > 8)
        v13 = CFSTR("invalid");
      else
        v13 = off_1E366EDE0[v8];
      v14 = v13;
      v16 = 138543618;
      v17 = v7;
      v18 = 2114;
      v19 = v14;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Rebuild resume object ID %{public}@ does not match stored entity to rebuild: %{public}@, cannot resume from this token", (uint8_t *)&v16, 0x16u);

    }
    goto LABEL_9;
  }
LABEL_10:

  return (NSManagedObjectID *)v7;
}

- (void)setSearchIndexRebuildResumeObjectID:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "URIRepresentation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLGlobalValues setSearchIndexRebuildResumeMarker:](self, "setSearchIndexRebuildResumeMarker:", v4);

}

- (void)clearRebuildFinishedFlags
{
  unint64_t v3;
  id v4;

  v3 = -[PLGlobalValues unpackedSearchIndexStatus](self, "unpackedSearchIndexStatus");
  if ((v3 & 0xFFFFFFFFFFFFFFE0) != v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PLGlobalValues setSearchIndexStatus:](self, "setSearchIndexStatus:", v4);

  }
}

- (void)resetSearchIndexRebuildMetadataWithSceneTaxonomyDigests:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[PLGlobalValues clearRebuildFinishedFlags](self, "clearRebuildFinishedFlags");
  -[PLGlobalValues setSearchIndexRebuildResumeMarker:](self, "setSearchIndexRebuildResumeMarker:", 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", +[PLSearchIndexConfiguration currentSearchIndexVersion](PLSearchIndexConfiguration, "currentSearchIndexVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLGlobalValues setSearchIndexVersion:](self, "setSearchIndexVersion:", v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", +[PLSearchIndexConfiguration currentEmbeddingModelVersion](PLSearchIndexConfiguration, "currentEmbeddingModelVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLGlobalValues setSearchIndexEmbeddingModelVersion:](self, "setSearchIndexEmbeddingModelVersion:", v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", +[PLSearchIndexConfiguration currentUtilityTypeClassifierVersion](PLSearchIndexConfiguration, "currentUtilityTypeClassifierVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLGlobalValues setSearchIndexUtilityTypeClassifierVersion:](self, "setSearchIndexUtilityTypeClassifierVersion:", v7);

  +[PLSearchIndexConfiguration locale](PLSearchIndexConfiguration, "locale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLGlobalValues setSearchIndexLocaleIdentifier:](self, "setSearchIndexLocaleIdentifier:", v9);

  -[PLGlobalValues setSearchIndexSceneTaxonomySHA:](self, "setSearchIndexSceneTaxonomySHA:", v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", +[PLSearchIndexConfiguration featureSettings](PLSearchIndexConfiguration, "featureSettings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLGlobalValues setSearchIndexFeatureSettings:](self, "setSearchIndexFeatureSettings:", v10);

  -[PLGlobalValues setSearchIndexSpotlightClientState:](self, "setSearchIndexSpotlightClientState:", 0);
  -[PLGlobalValues setSearchIndexRebuildRequiredExternalReasons:](self, "setSearchIndexRebuildRequiredExternalReasons:", 0);
}

- (BOOL)markRebuildPhaseCompleted:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v5 = -[PLGlobalValues unpackedSearchIndexStatus](self, "unpackedSearchIndexStatus");
  v6 = v5 & a3;
  if ((v5 & a3) != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5 | a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLGlobalValues setSearchIndexStatus:](self, "setSearchIndexStatus:", v7);

    -[PLGlobalValues setSearchIndexRebuildResumeMarker:](self, "setSearchIndexRebuildResumeMarker:", 0);
    if (-[PLGlobalValues isSearchIndexRebuildFinished](self, "isSearchIndexRebuildFinished"))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLGlobalValues setSearchIndexRebuildEndDate:](self, "setSearchIndexRebuildEndDate:", v8);

    }
  }
  return v6 != a3;
}

- (BOOL)_isNewLibraryOrRebuildWithPathManager:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  id v17;
  char v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLGlobalValues searchIndexVersion](self, "searchIndexVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchIndexSystemInfoFilePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v8, &v18);

    if (v9)
    {
      if (v18)
      {
        PLSearchBackendIndexRebuildGetLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Legacy search index system info file is a directory", buf, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "searchIndexSystemInfoFilePath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      v13 = objc_msgSend(v11, "removeItemAtPath:error:", v12, &v17);
      v14 = v17;

      if ((v13 & 1) == 0)
      {
        PLSearchBackendIndexRebuildGetLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v20 = v14;
          _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Failed to remove legacy search index system info file: %@", buf, 0xCu);
        }

      }
    }
    v6 = v9 ^ 1;
  }

  return v6;
}

- (unint64_t)searchIndexRebuildReasonsWithSceneTaxonomyDigests:(id)a3 spotlightRequestedRebuild:(BOOL)a4 pathManager:(id)a5
{
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  id v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  BOOL v32;
  unint64_t v33;
  unint64_t v34;

  v6 = a4;
  v8 = a3;
  if (-[PLGlobalValues _isNewLibraryOrRebuildWithPathManager:](self, "_isNewLibraryOrRebuildWithPathManager:", a5))
    v9 = 1024;
  else
    v9 = 0;
  -[PLGlobalValues searchIndexVersion](self, "searchIndexVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  if (v11 != 18006)
  {
    -[PLGlobalValues searchIndexVersion](self, "searchIndexVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedIntegerValue");

    v14 = 33;
    if (v13 >= 0x4654)
      v14 = 1;
    v9 |= v14;
  }
  v15 = +[PLSearchIndexConfiguration currentEmbeddingModelVersion](PLSearchIndexConfiguration, "currentEmbeddingModelVersion");
  -[PLGlobalValues searchIndexEmbeddingModelVersion](self, "searchIndexEmbeddingModelVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedIntegerValue");

  if (v15 != v17)
    v9 |= 0x40uLL;
  v18 = +[PLSearchIndexConfiguration currentUtilityTypeClassifierVersion](PLSearchIndexConfiguration, "currentUtilityTypeClassifierVersion");
  -[PLGlobalValues searchIndexUtilityTypeClassifierVersion](self, "searchIndexUtilityTypeClassifierVersion");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "unsignedIntegerValue");

  if (v18 == v20)
    v21 = v9;
  else
    v21 = v9 | 0x80;
  +[PLSearchIndexConfiguration locale](PLSearchIndexConfiguration, "locale");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localeIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLGlobalValues searchIndexLocaleIdentifier](self, "searchIndexLocaleIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "isEqualToString:", v24);

  if (v25)
    v26 = v21;
  else
    v26 = v21 | 2;
  -[PLGlobalValues searchIndexSceneTaxonomySHA](self, "searchIndexSceneTaxonomySHA");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  if (v27 != v8 && !objc_msgSend(v8, "isEqualToString:", v27))
    v26 |= 4uLL;
  v28 = -[PLGlobalValues unpackedSearchIndexStatus](self, "unpackedSearchIndexStatus");
  v29 = 0;
  v30 = 1;
  do
  {
    v31 = v30 | v29;
    if (((1 << v30) & 0x10116) == 0)
      v31 = v29;
    if (v30 <= 0x10)
      v29 = v31;
    v32 = v30 >= 9;
    v30 *= 2;
  }
  while (!v32);
  if ((v29 & ~v28) != 0)
    v26 |= 0x10uLL;
  v33 = -[PLGlobalValues unpackedSearchIndexRebuildRequiredExternalReasons](self, "unpackedSearchIndexRebuildRequiredExternalReasons");
  if (v6)
    v34 = v26 | v33 | 8;
  else
    v34 = v26 | v33;

  return v34;
}

- (BOOL)shouldDropGlobalSpotlightIndexForLibraryIdentifier:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL result;

  result = 0;
  if (+[PLSpotlightDonationUtilities shouldUseSpotlightPrivateIndexForLibraryIdentifier:](PLSpotlightDonationUtilities, "shouldUseSpotlightPrivateIndexForLibraryIdentifier:", a3))
  {
    -[PLGlobalValues searchIndexVersion](self, "searchIndexVersion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      return 1;
    v5 = v4;
    v6 = objc_msgSend(v4, "integerValue");

    if (v6 < 18004)
      return 1;
  }
  return result;
}

- (void)addRebuildRequiredExternalReasons:(unint64_t)a3
{
  unint64_t v5;
  id v6;

  v5 = -[PLGlobalValues unpackedSearchIndexRebuildRequiredExternalReasons](self, "unpackedSearchIndexRebuildRequiredExternalReasons");
  if (v5 != (v5 | a3))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PLGlobalValues setSearchIndexRebuildRequiredExternalReasons:](self, "setSearchIndexRebuildRequiredExternalReasons:", v6);

  }
}

- (void)addSearchIndexRebuildCoalescedReasons:(unint64_t)a3
{
  unint64_t v5;
  id v6;

  v5 = -[PLGlobalValues unpackedSearchIndexRebuildCoalescedReasons](self, "unpackedSearchIndexRebuildCoalescedReasons");
  if (v5 != (v5 | a3))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PLGlobalValues setSearchIndexRebuildCoalescedReasons:](self, "setSearchIndexRebuildCoalescedReasons:", v6);

  }
}

- (BOOL)isSearchIndexRebuildFinished
{
  return (-[PLGlobalValues unpackedSearchIndexStatus](self, "unpackedSearchIndexStatus") >> 4) & 1;
}

- (double)searchIndexRebuildTimeIsRebuildInProgress:(BOOL *)a3
{
  void *v5;
  void *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  void *v9;
  double v10;
  double v11;
  double v13;
  NSObject *v14;
  __CFString *v15;
  __CFString *v16;
  int v18;
  __CFString *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[PLGlobalValues searchIndexRebuildStartDate](self, "searchIndexRebuildStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLGlobalValues searchIndexRebuildEndDate](self, "searchIndexRebuildEndDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PLGlobalValues isSearchIndexRebuildFinished](self, "isSearchIndexRebuildFinished");
  v8 = v7;
  if (!v7 && v5 > v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v5);
    v11 = v10;

    goto LABEL_16;
  }
  if (v6 > v5 && v7)
  {
    if (v5)
    {
      objc_msgSend(v6, "timeIntervalSinceDate:", v5);
      v11 = v13;
      goto LABEL_16;
    }
  }
  else
  {
    PLSearchBackendIndexRebuildGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = CFSTR("YES");
      if (v8)
        v15 = CFSTR("NO");
      v16 = v15;
      v18 = 138543874;
      v19 = v16;
      v20 = 2114;
      v21 = v5;
      v22 = 2114;
      v23 = v6;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Failed to get search index rebuild time. Invalid index rebuild completion status [%{public}@], start date [%{public}@], end date [%{public}@]", (uint8_t *)&v18, 0x20u);

    }
  }
  v11 = 0.0;
LABEL_16:
  if (a3)
    *a3 = !v8;

  return v11;
}

- (double)searchIndexUptimeIsRebuildInProgress:(BOOL *)a3
{
  void *v5;
  void *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  double v9;
  double v10;
  void *v12;
  double v13;
  NSObject *v14;
  __CFString *v15;
  __CFString *v16;
  int v18;
  __CFString *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[PLGlobalValues searchIndexRebuildStartDate](self, "searchIndexRebuildStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLGlobalValues searchIndexRebuildEndDate](self, "searchIndexRebuildEndDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PLGlobalValues isSearchIndexRebuildFinished](self, "isSearchIndexRebuildFinished");
  v8 = v7;
  if (v7 || v5 <= v6)
  {
    if (v6 > v5 && v7)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", v6);
      v10 = v13;

      goto LABEL_16;
    }
    PLSearchBackendIndexRebuildGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = CFSTR("YES");
      if (v8)
        v15 = CFSTR("NO");
      v16 = v15;
      v18 = 138543874;
      v19 = v16;
      v20 = 2114;
      v21 = v5;
      v22 = 2114;
      v23 = v6;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Failed to get search index uptime. Invalid index rebuild completion status [%{public}@], start date [%{public}@], end date [%{public}@]", (uint8_t *)&v18, 0x20u);

    }
  }
  else if (v6)
  {
    objc_msgSend(v5, "timeIntervalSinceDate:", v6);
    v10 = v9;
    goto LABEL_16;
  }
  v10 = 0.0;
LABEL_16:
  if (a3)
    *a3 = !v8;

  return v10;
}

- (id)searchIndexSpotlightClientStateData
{
  void *v2;
  void *v3;

  -[PLGlobalValues searchIndexSpotlightClientState](self, "searchIndexSpotlightClientState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "searchIndexSpotlightClientStateDataWithDictionary:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)incrementSpotlightClientStateMissingCount
{
  void *v3;
  uint64_t v4;
  id v5;

  -[PLGlobalValues searchIndexSpotlightClientStateMissingCount](self, "searchIndexSpotlightClientStateMissingCount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4 + 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PLGlobalValues setSearchIndexSpotlightClientStateMissingCount:](self, "setSearchIndexSpotlightClientStateMissingCount:", v5);

}

- (void)incrementSpotlightClientStateMismatchedCount
{
  void *v3;
  uint64_t v4;
  id v5;

  -[PLGlobalValues searchIndexSpotlightClientStateMismatchedCount](self, "searchIndexSpotlightClientStateMismatchedCount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4 + 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PLGlobalValues setSearchIndexSpotlightClientStateMismatchedCount:](self, "setSearchIndexSpotlightClientStateMismatchedCount:", v5);

}

+ (id)searchIndexSpotlightClientStateDictionaryWithIdentifier:(id)a3 timestamp:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v5;
  if ((unint64_t)objc_msgSend(v5, "length") >= 0x25)
  {
    objc_msgSend(v5, "substringToIndex:", 33);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingString:", CFSTR("..."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v16[0] = CFSTR("v");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", PLSearchIndexSpotlightClientStateVersion);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  v16[1] = CFSTR("t");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v12 = v11;

  objc_msgSend(v10, "numberWithDouble:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = CFSTR("i");
  v17[1] = v13;
  v17[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)searchIndexSpotlightClientStateDataWithDictionary:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v6;

  v6 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 200, 0, &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(MEMORY[0x1E0D732B8], "successWithResult:", v3);
  else
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)searchIndexSpotlightClientStateWithData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  if (!v3)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0D74498];
    v12 = *MEMORY[0x1E0CB2938];
    v13[0] = CFSTR("Spotlight client state is not a dictionary");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 46514, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v9;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0D732B8], "successWithResult:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v5;
}

@end
