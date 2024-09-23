@implementation PSDocumentsPolicyController

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)MEMORY[0x1E0D1D868];
  -[PSDocumentsPolicyController searchingContext](self, "searchingContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endSearchingSources:", v4);

  v5.receiver = self;
  v5.super_class = (Class)PSDocumentsPolicyController;
  -[PSListController dealloc](&v5, sel_dealloc);
}

- (id)specifiers
{
  NSArray **p_specifiers;
  NSArray *specifiers;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  id location;

  p_specifiers = &self->super._specifiers;
  specifiers = self->super._specifiers;
  if (!specifiers)
  {
    -[PSDocumentsPolicyController documentSource](self, "documentSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSDocumentsPolicyController setSelectedDocumentSource:](self, "setSelectedDocumentSource:", v5);
    -[PSSpecifier propertyForKey:](self->super.super._specifier, "propertyForKey:", PSDocumentBundleIdentifierKey);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSDocumentsPolicyController setBundleIdentifier:](self, "setBundleIdentifier:", v6);

    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    PS_LocalizedStringForDocumentsPolicy(CFSTR("STORE_DOCS_AND_DATA_ON"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSSpecifier groupSpecifierWithName:](PSSpecifier, "groupSpecifierWithName:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSDocumentsPolicyController setGroupSpecifier:](self, "setGroupSpecifier:", v9);

    -[PSDocumentsPolicyController groupSpecifier](self, "groupSpecifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setIdentifier:", CFSTR("DOCS_AND_DATA_GROUP"));

    -[PSDocumentsPolicyController groupSpecifier](self, "groupSpecifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("isRadioGroup"));

    -[PSDocumentsPolicyController groupSpecifier](self, "groupSpecifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v12);

    objc_storeStrong((id *)p_specifiers, v7);
    -[PSListController reload](self, "reload");
    -[PSDocumentsPolicyController searchingContext](self, "searchingContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0D1D868];
      -[PSDocumentsPolicyController searchingContext](self, "searchingContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "endSearchingSources:", v15);

    }
    objc_initWeak(&location, self);
    v16 = (void *)MEMORY[0x1E0D1D868];
    -[PSDocumentsPolicyController bundleIdentifier](self, "bundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __41__PSDocumentsPolicyController_specifiers__block_invoke;
    v23 = &unk_1E4A67F80;
    objc_copyWeak(&v24, &location);
    objc_msgSend(v16, "startSearchingSourcesForBundleIdentifier:updateBlock:", v17, &v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSDocumentsPolicyController setSearchingContext:](self, "setSearchingContext:", v18, v20, v21, v22, v23);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

    specifiers = *p_specifiers;
  }
  return specifiers;
}

void __41__PSDocumentsPolicyController_specifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__PSDocumentsPolicyController_specifiers__block_invoke_2;
  v5[3] = &unk_1E4A67270;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __41__PSDocumentsPolicyController_specifiers__block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  id v5;
  id v6;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_msgSend(WeakRetained, "isFirstSourceResults");

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "setIsFirstSourceResults:", 0);

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "updateRadioGroupWithSources:animated:", *(_QWORD *)(a1 + 32), v4);

}

- (void)updateRadioGroupWithSources:(id)a3 animated:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  _BOOL4 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v29 = a4;
  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "sortUsingComparator:", &__block_literal_global_26);
  -[PSListController beginUpdates](self, "beginUpdates");
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[PSDocumentsPolicyController specifiers](self, "specifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reverseObjectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v14, "propertyForKey:", CFSTR("PSDocumentSourceKey"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v6, "containsObject:", v15);

        if (v16)
          -[PSListController removeSpecifier:animated:](self, "removeSpecifier:animated:", v14, v29);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v11);
  }

  -[PSListController endUpdates](self, "endUpdates");
  -[PSListController beginUpdates](self, "beginUpdates");
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v17 = v6;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
        if ((objc_msgSend(v22, "hidden") & 1) == 0)
        {
          objc_msgSend(v22, "displayName");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v23, self, 0, 0, 0, 3, 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "setProperty:forKey:", v22, CFSTR("PSDocumentSourceKey"));
          objc_msgSend(v22, "iconForSize:", 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setProperty:forKey:", v25, CFSTR("iconImage"));

          -[PSListController addSpecifier:animated:](self, "addSpecifier:animated:", v24, v29);
          -[PSDocumentsPolicyController selectedDocumentSource](self, "selectedDocumentSource");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v22, "isEqual:", v26);

          if (v27)
          {
            -[PSListController specifierForID:](self, "specifierForID:", CFSTR("DOCS_AND_DATA_GROUP"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setProperty:forKey:", v24, CFSTR("radioGroupCheckedSpecifier"));

          }
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v19);
  }

  -[PSListController endUpdates](self, "endUpdates");
  -[PSDocumentsPolicyController updateFooterAnimated:](self, "updateFooterAnimated:", v29);

}

uint64_t __68__PSDocumentsPolicyController_updateRadioGroupWithSources_animated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v18;
  void *v19;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D1D878];
  v8 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D1D878]);

  if ((v8 & 1) != 0)
    goto LABEL_4;
  objc_msgSend(v5, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", v7);

  if ((v10 & 1) != 0)
  {
LABEL_6:
    v14 = 1;
    goto LABEL_7;
  }
  objc_msgSend(v5, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0D1D880];
  v13 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D1D880]);

  if ((v13 & 1) == 0)
  {
    objc_msgSend(v4, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", v12);

    if ((v16 & 1) == 0)
    {
      objc_msgSend(v4, "displayName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "displayName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v18, "localizedStandardCompare:", v19);

      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_4:
  v14 = -1;
LABEL_7:

  return v14;
}

- (void)updateFooterAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  int v7;
  __CFString *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = a3;
  -[PSDocumentsPolicyController selectedDocumentSource](self, "selectedDocumentSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D1D878]);

  if (v7)
  {
    v8 = CFSTR("DOCUMENTS_AND_DATA_ICLOUD_FOOTER");
  }
  else
  {
    -[PSDocumentsPolicyController selectedDocumentSource](self, "selectedDocumentSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D1D880]);

    if (!v11)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      PS_LocalizedStringForDocumentsPolicy(CFSTR("DOCUMENTS_AND_DATA_THIRD_PARTY_FOOTER"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSDocumentsPolicyController selectedDocumentSource](self, "selectedDocumentSource");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "displayName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", v13, v15);
      v17 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = CFSTR("DOCUMENTS_AND_DATA_LOCAL_FOOTER");
  }
  PS_LocalizedStringForDocumentsPolicy(v8);
  v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
  -[PSListController specifierForID:](self, "specifierForID:", CFSTR("DOCS_AND_DATA_GROUP"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setProperty:forKey:", v17, CFSTR("footerText"));
  -[PSListController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v16, v3);

}

- (id)documentSource
{
  dispatch_semaphore_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__8;
  v16 = __Block_byref_object_dispose__8;
  v17 = 0;
  v3 = dispatch_semaphore_create(0);
  v4 = (void *)MEMORY[0x1E0D1D868];
  -[PSSpecifier propertyForKey:](self->super.super._specifier, "propertyForKey:", PSDocumentBundleIdentifierKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__PSDocumentsPolicyController_documentSource__block_invoke;
  v9[3] = &unk_1E4A67FC8;
  v11 = &v12;
  v6 = v3;
  v10 = v6;
  objc_msgSend(v4, "defaultSourceForBundleIdentifier:completionBlock:", v5, v9);

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __45__PSDocumentsPolicyController_documentSource__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v6 = a2;
  if (a3)
  {
    _PSLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A3819000, v7, OS_LOG_TYPE_DEFAULT, "Error getting selected document source.", v8, 2u);
    }

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)setDocumentSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PSDocumentsPolicyController setSelectedDocumentSource:](self, "setSelectedDocumentSource:", v4);
  v5 = (void *)MEMORY[0x1E0D1D868];
  -[PSDocumentsPolicyController bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDefaultSource:forBundleIdentifier:", v4, v6);

  -[PSDocumentsPolicyController updateFooterAnimated:](self, "updateFooterAnimated:", 1);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id WeakRetained;
  objc_super v15;

  v6 = a4;
  v7 = a3;
  v8 = -[PSListController indexForIndexPath:](self, "indexForIndexPath:", v6);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->super._specifiers, "objectAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PSListController getGroupSpecifierForSpecifier:](self, "getGroupSpecifierForSpecifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "propertyForKey:", CFSTR("isRadioGroup"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if (v12)
  {
    objc_msgSend(v9, "propertyForKey:", CFSTR("PSDocumentSourceKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSDocumentsPolicyController setDocumentSource:](self, "setDocumentSource:", v13);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._parentController);
  objc_msgSend(WeakRetained, "reloadSpecifier:", self->super.super._specifier);

  v15.receiver = self;
  v15.super_class = (Class)PSDocumentsPolicyController;
  -[PSListController tableView:didSelectRowAtIndexPath:](&v15, sel_tableView_didSelectRowAtIndexPath_, v7, v6);

}

- (PSSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
}

- (void)setGroupSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_groupSpecifier, a3);
}

- (DOCDocumentSource)selectedDocumentSource
{
  return self->_selectedDocumentSource;
}

- (void)setSelectedDocumentSource:(id)a3
{
  objc_storeStrong((id *)&self->_selectedDocumentSource, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (DOCSourceSearchingContext)searchingContext
{
  return self->_searchingContext;
}

- (void)setSearchingContext:(id)a3
{
  objc_storeStrong((id *)&self->_searchingContext, a3);
}

- (BOOL)isFirstSourceResults
{
  return self->_isFirstSourceResults;
}

- (void)setIsFirstSourceResults:(BOOL)a3
{
  self->_isFirstSourceResults = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchingContext, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_selectedDocumentSource, 0);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
}

@end
