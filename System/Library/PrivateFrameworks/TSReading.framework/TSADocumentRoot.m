@implementation TSADocumentRoot

- (id)creationLanguage
{
  return self->_creationLanguage;
}

- (void)setCreationLanguage:(id)a3
{
  NSString *v5;

  -[TSPObject willModify](self, "willModify");
  v5 = (NSString *)objc_msgSend(a3, "copy");

  self->_creationLanguage = v5;
  self->_creationLanguageWritingDirection = objc_msgSend(MEMORY[0x24BDBCEA0], "characterDirectionForLanguage:", v5);
}

- (NSString)templateIdentifier
{
  return self->_templateIdentifier;
}

- (void)setTemplateIdentifier:(id)a3
{
  NSString *v5;

  -[TSPObject willModify](self, "willModify");
  v5 = (NSString *)objc_msgSend(a3, "copy");

  self->_templateIdentifier = v5;
}

- (BOOL)needsMovieCompatibilityUpgrade
{
  return self->_needsMovieCompatibilityUpgrade;
}

- (void)setNeedsMovieCompatibilityUpgrade:(BOOL)a3
{
  -[TSPObject willModify](self, "willModify");
  self->_needsMovieCompatibilityUpgrade = a3;
}

- (TSADocumentRoot)initWithContext:(id)a3
{
  TSADocumentRoot *v4;
  TSADocumentRoot *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSADocumentRoot;
  v4 = -[TSKDocumentRoot initWithContext:](&v7, sel_initWithContext_);
  v5 = v4;
  if (v4)
  {
    -[TSADocumentRoot p_updateCreationLanguage](v4, "p_updateCreationLanguage");
    v5->_tablesCustomFormatList = -[TSTCustomFormatList initWithContext:]([TSTCustomFormatList alloc], "initWithContext:", a3);
  }
  return v5;
}

- (TSADocumentRoot)init
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSADocumentRoot init]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSADocumentRoot.mm"), 237, CFSTR("Do not call method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[TSADocumentRoot init]"), 0));
}

- (void)prepareNewDocumentWithTemplateBundle:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[TSADocumentRoot p_updateBuildVersionHistoryWithVersionOfTemplateBundle:](self, "p_updateBuildVersionHistoryWithVersionOfTemplateBundle:");
  -[TSADocumentRoot p_updateCreationLanguage](self, "p_updateCreationLanguage");
  self->super._isBeingLocalized = 1;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = -[TSKDocumentRoot modelEnumerator](self, "modelEnumerator", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend((id)objc_opt_class(), "localizeModelObject:withTemplateBundle:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), a3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
  self->super._isBeingLocalized = 0;
}

- (void)p_updateCreationLanguage
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  if (objc_msgSend(v3, "count"))
    v4 = objc_msgSend(v3, "objectAtIndex:", 0);
  else
    v4 = 0;
  -[TSADocumentRoot setCreationLanguage:](self, "setCreationLanguage:", v4);
}

- (void)updateWritingDirection:(unint64_t)a3
{
  self->_creationLanguageWritingDirection = a3;
}

- (unint64_t)writingDirection
{
  return self->_creationLanguageWritingDirection;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSADocumentRoot;
  -[TSKDocumentRoot dealloc](&v3, sel_dealloc);
}

- (void)documentDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TSADocumentRoot;
  -[TSKDocumentRoot documentDidLoad](&v2, sel_documentDidLoad);
}

- (id)upgradeState
{
  id result;

  result = self->_upgradeState;
  if (!result)
  {
    result = (id)objc_opt_new();
    self->_upgradeState = (NSMutableDictionary *)result;
  }
  return result;
}

- (id)packageDataForWrite
{
  return 0;
}

- (id)additionalDocumentPropertiesForWrite
{
  void *v3;
  id v4;
  objc_super v6;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[TSADocumentRoot isMultiPageForQuickLook](self, "isMultiPageForQuickLook")), CFSTR("isMultiPage"));
  v6.receiver = self;
  v6.super_class = (Class)TSADocumentRoot;
  v4 = -[TSKDocumentRoot additionalDocumentPropertiesForWrite](&v6, sel_additionalDocumentPropertiesForWrite);
  if (v4)
    objc_msgSend(v3, "addEntriesFromDictionary:", v4);
  return v3;
}

- (void)fulfillPasteboardPromises
{
  -[TSKPasteboardController fulfillPasteboardPromises](-[TSKDocumentRoot pasteboardController](self, "pasteboardController"), "fulfillPasteboardPromises");
}

- (void)willClose
{
  self->_isClosed = 1;
  -[TSADocumentRoot fulfillPasteboardPromises](self, "fulfillPasteboardPromises");
}

- (void)initializeForImport
{
  -[TSPObject willModify](self, "willModify");
  if (!self->_tablesCustomFormatList)
    self->_tablesCustomFormatList = -[TSTCustomFormatList initWithContext:]([TSTCustomFormatList alloc], "initWithContext:", -[TSPObject context](self, "context"));
}

- (id)customFormatList
{
  return self->_tablesCustomFormatList;
}

- (void)setCustomFormatList:(id)a3
{
  id v5;

  v5 = a3;

  self->_tablesCustomFormatList = (TSTCustomFormatList *)a3;
}

+ (id)persistenceWarningsForData:(id)a3 isReadable:(BOOL)a4 isExternal:(BOOL)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;

  if (a4)
    return 0;
  v14 = v6;
  v15 = v5;
  v10 = a5;
  v11 = (void *)MEMORY[0x24BDBCF20];
  v12 = (void *)TSABundle();
  if (v10)
    v13 = CFSTR("Some external movies are missing because they\\U2019re no longer available.");
  else
    v13 = CFSTR("Some images are missing because they were deleted from the document.");
  return (id)objc_msgSend(v11, "setWithObject:", objc_msgSend(v12, "localizedStringForKey:value:table:", v13, &stru_24D82FEB0, CFSTR("TSApplication"), v14, v15, v7, v8));
}

- (NSSet)missingFontWarningMessages
{
  id v2;
  uint64_t v3;
  NSSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = -[TSKDocumentRoot unavailableDocumentFonts](self, "unavailableDocumentFonts");
  v3 = objc_msgSend(v2, "count");
  if (!v3)
    return 0;
  v4 = (NSSet *)objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", v3);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v2);
        -[NSSet addObject:](v4, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", objc_msgSend((id)TSABundle(), "localizedStringForKey:value:table:", CFSTR("The font %@ is missing. Your text might look different."), &stru_24D82FEB0, CFSTR("TSApplication")), *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)));
      }
      v6 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return v4;
}

- (id)newExporterForType:(id)a3 options:(id)a4 preferredType:(id *)a5
{
  id v7;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v7 = a3;
  v9 = (objc_class *)objc_msgSend((id)objc_msgSend(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"), "compatibilityDelegate"), "exporterClassForType:options:", a3, a4);
  if (!v9)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSADocumentRoot newExporterForType:options:preferredType:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSADocumentRoot.mm"), 1165, CFSTR("Can't find exporter class for type %@"), v7);
  }
  v12 = (void *)objc_msgSend([v9 alloc], "initWithDocumentRoot:", self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v12, "setOptions:", a4);
  v13 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("TSKExportOptionsRequiresPassphrase"));
  if (objc_msgSend(v13, "isEqual:", MEMORY[0x24BDBD1C8]))
  {
    v14 = (void *)TSUProtocolCast();
    if (v14)
    {
      objc_msgSend(v14, "setPassphrase:hint:", objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("TSKExportOptionsPassphrase")), objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("TSKExportOptionsPassphraseHint")));
    }
    else
    {
      v15 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSADocumentRoot newExporterForType:options:preferredType:]");
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSADocumentRoot.mm"), 1184, CFSTR("Attempting to set a passphrase and hint on an exporter that doesn't conform to TSKEncryptedDocumentExporter"));
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v17 = objc_msgSend(v12, "documentSpecificTypeUTI");
    if (v17)
      v7 = (id)v17;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v12, "setTypeUTI:", v7);
  if (a5)
    *a5 = v7;
  return v12;
}

- (BOOL)exportToPath:(id)a3 exporter:(id)a4 error:(id *)a5
{
  return -[TSADocumentRoot exportToPath:exporter:delegate:error:](self, "exportToPath:exporter:delegate:error:", a3, a4, self, a5);
}

- (BOOL)exportToPath:(id)a3 exporter:(id)a4 delegate:(id)a5 error:(id *)a6
{
  uint64_t *v7;
  id v12;
  TSKAccessController *v13;
  _BOOL4 v14;
  id v15;
  char v16;
  _QWORD v18[10];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v7 = &v19;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = __Block_byref_object_copy__32;
  v23 = __Block_byref_object_dispose__32;
  v24 = 0;
  if (a4)
  {
    v12 = a4;

    self->_warnings = 0;
    v13 = -[TSKDocumentRoot accessController](self, "accessController");
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __56__TSADocumentRoot_exportToPath_exporter_delegate_error___block_invoke;
    v18[3] = &unk_24D82F9E0;
    v18[4] = self;
    v18[5] = a4;
    v18[6] = a3;
    v18[7] = a5;
    v18[8] = &v25;
    v18[9] = &v19;
    -[TSKAccessController performRead:](v13, "performRead:", v18);

    v7 = v20;
    v14 = *((_BYTE *)v26 + 24) == 0;
    if (!a6)
      goto LABEL_7;
  }
  else
  {
    v14 = 1;
    if (!a6)
      goto LABEL_7;
  }
  if (v14)
    *a6 = (id)v7[5];
LABEL_7:
  v15 = (id)v7[5];
  v16 = *((_BYTE *)v26 + 24);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  return v16;
}

uint64_t __56__TSADocumentRoot_exportToPath_exporter_delegate_error___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "context");
  objc_msgSend(v2, "beginAssertOnModify");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "exportToURL:delegate:error:", objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", *(_QWORD *)(a1 + 48)), *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = objc_retain(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72)
                                                                                              + 8)
                                                                                  + 40));
  return objc_msgSend(v2, "endAssertOnModify");
}

- (id)warnings
{
  return (id)-[NSMutableSet allObjects](self->_warnings, "allObjects");
}

- (void)addWarning:(id)a3
{
  NSMutableSet *warnings;

  warnings = self->_warnings;
  if (!warnings)
  {
    warnings = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    self->_warnings = warnings;
  }
  -[NSMutableSet addObject:](warnings, "addObject:", a3);
}

- (void)removeWarning:(id)a3
{
  -[NSMutableSet removeObject:](self->_warnings, "removeObject:", a3);
}

- (void)prepareForSavingAsTemplate
{
  void *v2;
  uint64_t v3;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSADocumentRoot prepareForSavingAsTemplate]");
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSADocumentRoot.mm"), 1287, CFSTR("This operation must only be performed on the main thread."));
  }
}

- (id)protected_defaultTextPresetOrdering
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "array");
}

- (void)insertTextPresetDisplayItemsPreservingGrouping:(id)a3 insertAtBeginningOfGroup:(BOOL)a4
{
  _BOOL4 v4;
  TSSTheme *v6;
  TSSTheme *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  TSSTheme *v22;
  TSSTheme *v23;
  uint64_t v24;
  _BOOL8 v25;
  id obja;
  _QWORD v28[7];
  _QWORD v29[7];
  char v30;
  uint64_t v31;
  char v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v4 = a4;
  v38 = *MEMORY[0x24BDAC8D0];
  -[TSPObject willModify](self, "willModify");
  v6 = -[TSKDocumentRoot theme](self, "theme");
  if (objc_msgSend(-[TSSTheme presetsOfKind:](v6, "presetsOfKind:", String), "count"))
  {
    v7 = -[TSKDocumentRoot theme](self, "theme");
    v8 = (void *)objc_msgSend(-[TSSTheme presetsOfKind:](v7, "presetsOfKind:", String), "mutableCopy");
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v34;
      if (v4)
        v12 = 0;
      else
        v12 = 2;
      v25 = !v4;
      v24 = v12;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v34 != v11)
            objc_enumerationMutation(a3);
          v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          v32 = 0;
          v31 = 0;
          v15 = -[TSADocumentRoot p_parseNumberOutOfBasename:hasNumber:number:](self, "p_parseNumberOutOfBasename:hasNumber:number:", objc_msgSend(v14, "name", v24), &v32, &v31);
          v29[0] = MEMORY[0x24BDAC760];
          v29[1] = 3221225472;
          v29[2] = __91__TSADocumentRoot_insertTextPresetDisplayItemsPreservingGrouping_insertAtBeginningOfGroup___block_invoke;
          v29[3] = &unk_24D82FA08;
          v29[4] = self;
          v29[5] = v15;
          v30 = v32;
          v29[6] = v31;
          v16 = objc_msgSend(v8, "indexOfObjectWithOptions:passingTest:", v12, v29);
          if (v16 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v17 = v11;
            v18 = -[TSADocumentRoot protected_defaultTextPresetOrdering](self, "protected_defaultTextPresetOrdering");
            v19 = objc_msgSend(v18, "indexOfObject:", v15);
            if (v19 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v20 = objc_msgSend(v8, "count");
            }
            else
            {
              v28[0] = MEMORY[0x24BDAC760];
              v28[1] = 3221225472;
              v28[2] = __91__TSADocumentRoot_insertTextPresetDisplayItemsPreservingGrouping_insertAtBeginningOfGroup___block_invoke_2;
              v28[3] = &unk_24D82FA30;
              v28[4] = self;
              v28[5] = v18;
              v28[6] = v19;
              v21 = objc_msgSend(v8, "indexOfObjectWithOptions:passingTest:", 2, v28);
              if (v21 == 0x7FFFFFFFFFFFFFFFLL)
                v20 = 0;
              else
                v20 = v21 + 1;
            }
            v11 = v17;
            v12 = v24;
          }
          else
          {
            v20 = v16 + v25;
          }
          objc_msgSend(v8, "insertObject:atIndex:", v14, v20);
        }
        v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v10);
    }
    v22 = -[TSKDocumentRoot theme](self, "theme");
    -[TSSTheme setPresets:ofKind:](v22, "setPresets:ofKind:", v8, String);

  }
  else
  {
    obja = (id)objc_msgSend(a3, "copy");
    v23 = -[TSKDocumentRoot theme](self, "theme");
    -[TSSTheme setPresets:ofKind:](v23, "setPresets:ofKind:", obja, String);

  }
}

uint64_t __91__TSADocumentRoot_insertTextPresetDisplayItemsPreservingGrouping_insertAtBeginningOfGroup___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int v6;
  uint64_t result;
  unint64_t v8;
  char v9;

  v9 = 0;
  v8 = 0;
  v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "p_parseNumberOutOfBasename:hasNumber:number:", objc_msgSend(a2, "name"), &v9, &v8), "isEqualToString:", *(_QWORD *)(a1 + 40));
  result = 0;
  if (v6)
  {
    if (*(_BYTE *)(a1 + 56) && v9 && v8 >= *(_QWORD *)(a1 + 48))
    {
      return 0;
    }
    else
    {
      result = 1;
      *a4 = 1;
    }
  }
  return result;
}

uint64_t __91__TSADocumentRoot_insertTextPresetDisplayItemsPreservingGrouping_insertAtBeginningOfGroup___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  unint64_t v6;
  uint64_t result;
  uint64_t v8;
  char v9;

  v9 = 0;
  v8 = 0;
  v6 = objc_msgSend(*(id *)(a1 + 40), "indexOfObject:", objc_msgSend(*(id *)(a1 + 32), "p_parseNumberOutOfBasename:hasNumber:number:", objc_msgSend(a2, "name", 0), &v9, &v8));
  result = 0;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v6 <= *(_QWORD *)(a1 + 48))
    {
      result = 1;
      *a4 = 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)p_parseNumberOutOfBasename:(id)a3 hasNumber:(BOOL *)a4 number:(unint64_t *)a5
{
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;

  *a4 = 0;
  v8 = objc_msgSend(a3, "rangeOfString:options:", CFSTR(" "), 4);
  if (v8)
    v10 = v8 == 0x7FFFFFFFFFFFFFFFLL;
  else
    v10 = 1;
  if (v10)
    return a3;
  v12 = v8;
  v13 = (void *)objc_msgSend(a3, "substringFromIndex:", v8 + v9);
  v14 = (void *)objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
  v15 = objc_msgSend(v13, "length");
  if (!v15)
  {
    *a4 = 0;
    return a3;
  }
  v16 = v15;
  v17 = 0;
  while (objc_msgSend(v14, "characterIsMember:", objc_msgSend(v13, "characterAtIndex:", v17)))
  {
    if (v16 == ++v17)
    {
      v17 = v16;
      break;
    }
  }
  *a4 = v16 - 1 < v17;
  if (v16 - 1 >= v17)
    return a3;
  *a5 = (int)objc_msgSend(v13, "intValue");
  return (id)objc_msgSend(a3, "substringToIndex:", v12);
}

- (id)p_characterStyleWithProperties:(id)a3 stylesheet:(id)a4 override:(id)a5
{
  TSWPCharacterStyle *v5;

  v5 = 0;
  if (a3 && a4)
  {
    if (objc_msgSend(a3, "count"))
    {
      if (!a5 || (v5 = (TSWPCharacterStyle *)objc_msgSend(a4, "variationOfStyle:propertyMap:", a5, a3)) == 0)
      {
        v5 = (TSWPCharacterStyle *)objc_msgSend(a4, "firstRootlessStyleOfClass:withOverridePropertyMap:", objc_opt_class(), a3);
        if (!v5)
        {
          v5 = -[TSSStyle initWithContext:name:overridePropertyMap:isVariation:]([TSWPCharacterStyle alloc], "initWithContext:name:overridePropertyMap:isVariation:", objc_msgSend(a4, "context"), 0, a3, 0);
          objc_msgSend(a4, "addStyle:", v5);

        }
      }
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

- (void)pUpgradeHyperlinks
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = -[TSKDocumentRoot modelEnumeratorForObjectsOfClass:](self, "modelEnumeratorForObjectsOfClass:", objc_opt_class(), 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[TSADocumentRoot pUpgradeHyperlinksInStorage:](self, "pUpgradeHyperlinksInStorage:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (void)p_removeStyles:(id)a3
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
  void *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3CB0], "setWithSet:", a3);
  while (1)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3CB0], "set");
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v22 != v7)
            objc_enumerationMutation(v3);
          v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v10 = (void *)objc_msgSend(v9, "children");
          if (!v10 || !objc_msgSend(v10, "count"))
            objc_msgSend(v4, "addObject:", v9);
        }
        v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v6);
    }
    if (!objc_msgSend(v4, "count"))
      break;
    objc_msgSend(v3, "minusSet:", v4);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v4);
          objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * j), "stylesheet"), "removeStyle:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j));
        }
        v12 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v12);
    }
  }
  if (objc_msgSend(v3, "count"))
  {
    v15 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSADocumentRoot p_removeStyles:]");
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSADocumentRoot.mm"), 1601, CFSTR("Could not remove all requested styles."));
  }
}

- (void)p_replaceStyles:(id)a3 andChildrenWithVariationOfStyle:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id obj;
  _QWORD v21[8];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_msgSend(MEMORY[0x24BEB3CB0], "set");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = a3;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v10);
        v12 = objc_opt_class();
        if (v12 != objc_opt_class())
        {
          v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSADocumentRoot p_replaceStyles:andChildrenWithVariationOfStyle:]");
          v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSADocumentRoot.mm");
          v16 = TSUObjectReferenceDescription();
          objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, v15, 1617, CFSTR("Replaceable root style %@ is a different class than new parent %@"), v16, TSUObjectReferenceDescription());
        }
        objc_msgSend(v6, "addObject:", v11);
        v17 = objc_msgSend(v11, "children");
        if (v17)
          objc_msgSend(v6, "unionSet:", v17);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }
  v18 = objc_msgSend(MEMORY[0x24BEB3CB0], "set");
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __67__TSADocumentRoot_p_replaceStyles_andChildrenWithVariationOfStyle___block_invoke;
  v21[3] = &unk_24D82FA80;
  v21[4] = v6;
  v21[5] = self;
  v21[6] = a4;
  v21[7] = v18;
  -[TSKDocumentRoot enumerateStyleClientsUsingBlock:](self, "enumerateStyleClientsUsingBlock:", v21);
  objc_msgSend(v6, "minusSet:", v18);
  -[TSADocumentRoot p_removeStyles:](self, "p_removeStyles:", v6);
}

uint64_t __67__TSADocumentRoot_p_replaceStyles_andChildrenWithVariationOfStyle___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;
  __int128 v8;

  result = objc_msgSend((id)objc_msgSend(a2, "referencedStyles"), "intersectsSet:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __67__TSADocumentRoot_p_replaceStyles_andChildrenWithVariationOfStyle___block_invoke_2;
    v6[3] = &unk_24D82FA58;
    v5 = *(_OWORD *)(a1 + 48);
    v7 = *(_OWORD *)(a1 + 32);
    v8 = v5;
    return objc_msgSend(a2, "replaceReferencedStylesUsingBlock:", v6);
  }
  return result;
}

void *__67__TSADocumentRoot_p_replaceStyles_andChildrenWithVariationOfStyle___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;

  v2 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2))
  {
    v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "stylesheet"), "variationOfStyleMatchingStyle:withNewParentStyle:", v2, *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v2);
    if (objc_msgSend(v2, "parent"))
      objc_msgSend(*(id *)(a1 + 56), "addObject:", objc_msgSend(v2, "parent"));
  }
  return v2;
}

- (void)p_replaceStyle:(id)a3 andChildrenWithVariationOfStyle:(id)a4
{
  -[TSADocumentRoot p_replaceStyles:andChildrenWithVariationOfStyle:](self, "p_replaceStyles:andChildrenWithVariationOfStyle:", objc_msgSend(MEMORY[0x24BEB3D08], "setWithObject:", a3), a4);
}

- (BOOL)shouldAllowDrawableInGroups:(id)a3 forImport:(BOOL)a4
{
  void *v4;

  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  if (v4)
    return objc_msgSend(v4, "isAudioOnly") ^ 1;
  else
    return 1;
}

- (id)referencedStylesOfClass:(Class)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  TSSTheme *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = -[TSKDocumentRoot modelEnumeratorForObjectsOfClass:](self, "modelEnumeratorForObjectsOfClass:", objc_opt_class());
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "unionSet:", objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v10++), "referencedStylesOfClass:", a3));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v8);
  }
  if ((Class)objc_opt_class() == a3)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = -[TSKDocumentRoot theme](self, "theme");
    v12 = -[TSSTheme presetsOfKind:](v11, "presetsOfKind:", String);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          v17 = objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v16), "defaultParagraphStyle");
          if (v17)
          {
            objc_msgSend(v5, "addObject:", v17);
          }
          else
          {
            v18 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
            v19 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSADocumentRoot referencedStylesOfClass:]");
            objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSADocumentRoot.mm"), 2210, CFSTR("invalid nil value for '%s'"), "paragraphStyle");
          }
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v14);
    }
  }
  return v5;
}

- (id)documentCachePath
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)-[TSADocumentRootDelegate documentCachePath](self->_delegate, "documentCachePath");
  v4 = (void *)objc_msgSend(-[NSArray objectAtIndex:](NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1), "objectAtIndex:", 0), "stringByAppendingPathComponent:", CFSTR("DocumentCaches"));
  v5 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  if ((objc_msgSend(v5, "fileExistsAtPath:", v4) & 1) == 0)
  {
    v9 = 0;
    v10 = *MEMORY[0x24BDD0C60];
    v11[0] = MEMORY[0x24BDBD1C8];
    if ((objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1), &v9) & 1) == 0)
    {
      v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSADocumentRoot documentCachePath]");
      v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSADocumentRoot.mm");
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 2244, CFSTR("Could not create document cache directory: %@"), v9);
    }
  }
  return (id)objc_msgSend(v4, "stringByAppendingPathComponent:", -[TSADocumentRoot name](self, "name"));
}

- (id)dataFromDocumentCachePath:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(-[TSADocumentRoot documentCachePath](self, "documentCachePath"), "stringByAppendingPathComponent:", a3);
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "fileExistsAtPath:", v4))
    return 0;
  if (-[TSPObjectContext decryptionKey](-[TSPObject context](self, "context"), "decryptionKey"))
    return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:decryptionKey:", objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v4), -[TSPObjectContext decryptionKey](-[TSPObject context](self, "context"), "decryptionKey"));
  return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v4);
}

- (void)didSaveWithEncryptionChange
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "removeItemAtPath:error:", -[TSADocumentRoot documentCachePath](self, "documentCachePath"), 0);
}

- (BOOL)writeData:(id)a3 atDocumentCachePath:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;

  v7 = (void *)objc_msgSend(-[TSADocumentRoot documentCachePath](self, "documentCachePath"), "stringByAppendingPathComponent:", a4);
  v8 = objc_msgSend(v7, "stringByDeletingLastPathComponent");
  if (!a3)
  {
    if (a4)
      return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "removeItemAtPath:error:", v7, 0);
    return 0;
  }
  v9 = v8;
  v19 = 0;
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v19) & 1) == 0)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSADocumentRoot writeData:atDocumentCachePath:]");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSADocumentRoot.mm");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, v12, 2290, CFSTR("Unable to create cache directory: %@ with error: %@"), v9, v19);
  }
  if (-[TSPObjectContext decryptionKey](-[TSPObject context](self, "context"), "decryptionKey"))
  {
    if ((objc_msgSend(a3, "writeToURL:encryptionKey:", objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v7), -[TSPObjectContext decryptionKey](-[TSPObject context](self, "context"), "decryptionKey")) & 1) == 0)goto LABEL_12;
    return 1;
  }
  if ((objc_msgSend(a3, "writeToFile:options:error:", v7, 0, &v19) & 1) != 0)
    return 1;
  v14 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSADocumentRoot writeData:atDocumentCachePath:]");
  v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSADocumentRoot.mm");
  objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, v16, 2298, CFSTR("Unable to write to cache path: %@ with error: %@"), v7, v19);
LABEL_12:
  v17 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v18 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSADocumentRoot writeData:atDocumentCachePath:]");
  objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSADocumentRoot.mm"), 2304, CFSTR("Failed to write cache file"));
  return 0;
}

- (CGImageSource)newImageSourceForDocumentCachePath:(id)a3
{
  uint64_t v4;
  const __CFString *v5;
  const __CFURL *v6;
  const __CFDictionary *v7;
  void *v8;
  CGImageSource *v9;
  CFURLRef v10;
  CFURLRef v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(-[TSADocumentRoot documentCachePath](self, "documentCachePath"), "stringByAppendingPathComponent:", a3);
  if (!v4)
    return 0;
  v5 = (const __CFString *)v4;
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "fileExistsAtPath:", v4))
    return 0;
  v6 = (const __CFURL *)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v5);
  v13 = *MEMORY[0x24BDD97D0];
  v14[0] = MEMORY[0x24BDBD1C8];
  v7 = (const __CFDictionary *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  if (!-[TSPObjectContext decryptionKey](-[TSPObject context](self, "context"), "decryptionKey"))
  {
    v10 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x24BDBD240], v5, kCFURLPOSIXPathStyle, 0);
    if (v10)
    {
      v11 = v10;
      v9 = CGImageSourceCreateWithURL(v6, v7);
      CFRelease(v11);
      return v9;
    }
    return 0;
  }
  v8 = (void *)MEMORY[0x219A15874]();
  v9 = CGImageSourceCreateWithData((CFDataRef)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:decryptionKey:", v6, -[TSPObjectContext decryptionKey](-[TSPObject context](self, "context"), "decryptionKey")), v7);
  objc_autoreleasePoolPop(v8);
  return v9;
}

- (id)uniqueDocumentCachePathForProposedPath:(id)a3
{
  void *v5;

  v5 = (void *)objc_msgSend(a3, "stringByDeletingLastPathComponent");
  return (id)objc_msgSend(v5, "stringByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(a3, "lastPathComponent"), "tsu_stringByUniquingPathInsideDirectory:", objc_msgSend(-[TSADocumentRoot documentCachePath](self, "documentCachePath"), "stringByAppendingPathComponent:", v5)));
}

- (void)changeDocumentCacheFileProtection:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = -[TSADocumentRoot documentCachePath](self, "documentCachePath");
  if (v4)
  {
    v5 = v4;
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "fileExistsAtPath:", v4))
    {
      v7 = 0;
      v6 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      objc_msgSend(v6, "changeFileProtectionAtURL:toProtection:recursively:error:", objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v5), a3, 1, &v7);
    }
  }
}

- (NSString)name
{
  return (NSString *)-[TSADocumentRootDelegate name](self->_delegate, "name");
}

- (NSString)defaultDraftName
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (NSString *)-[TSADocumentRootDelegate defaultDraftName](self->_delegate, "defaultDraftName");
  else
    return -[TSADocumentRoot name](self, "name");
}

- (BOOL)isDocumentEditedSinceLastSave
{
  return -[TSKDocumentSupport isDocumentEditedSinceLastSave](-[TSKDocumentRoot documentSupport](self, "documentSupport"), "isDocumentEditedSinceLastSave");
}

- (TSADrawableFactory)drawableFactory
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSADocumentRoot drawableFactory]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSADocumentRoot.mm"), 2412, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSADocumentRoot drawableFactory]"), 0));
}

- (id)commandForPropagatingPresetChangeCommand:(id)a3 alwaysPreserveAppearance:(BOOL)a4
{
  return 0;
}

- (int64_t)addObserverForICloudTeardownWithBlock:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSADocumentRoot;
  return -[TSKDocumentRoot addObserverForICloudTeardownWithBlock:](&v4, sel_addObserverForICloudTeardownWithBlock_, a3);
}

- (BOOL)hasICloudConflict
{
  TSADocumentRootDelegate *v2;
  void *v3;
  int v4;
  id v6;

  v2 = -[TSADocumentRoot delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = 0;
    v3 = (void *)-[TSADocumentRootDelegate fileURL](v2, "fileURL");
    v4 = objc_msgSend(v3, "getResourceValue:forKey:error:", &v6, *MEMORY[0x24BDBCD28], 0);
    if (v4)
      LOBYTE(v4) = objc_msgSend(v6, "BOOLValue");
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)isMultiPageForQuickLook
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSADocumentRoot isMultiPageForQuickLook]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/common/TSADocumentRoot.mm"), 2463, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSADocumentRoot isMultiPageForQuickLook]"), 0));
}

- (TSADocumentRootDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TSADocumentRootDelegate *)a3;
}

- (BOOL)hasPreUFFVersion
{
  return self->_hasPreUFFVersion;
}

- (void)setHasPreUFFVersion:(BOOL)a3
{
  self->_hasPreUFFVersion = a3;
}

@end
