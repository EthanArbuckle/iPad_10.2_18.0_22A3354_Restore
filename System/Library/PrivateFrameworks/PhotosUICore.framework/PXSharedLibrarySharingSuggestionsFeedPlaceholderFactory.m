@implementation PXSharedLibrarySharingSuggestionsFeedPlaceholderFactory

- (PXSharedLibrarySharingSuggestionsFeedPlaceholderFactory)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySharingSuggestionsFeedPlaceholderFactory.m"), 32, CFSTR("%s is not available as initializer"), "-[PXSharedLibrarySharingSuggestionsFeedPlaceholderFactory init]");

  abort();
}

- (PXSharedLibrarySharingSuggestionsFeedPlaceholderFactory)initWithPhotoLibrary:(id)a3
{
  id v5;
  PXSharedLibrarySharingSuggestionsFeedPlaceholderFactory *v6;
  uint64_t v7;
  PXSharedLibraryStatusProvider *sharedLibraryStatusProvider;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySharingSuggestionsFeedPlaceholderFactory.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PXSharedLibrarySharingSuggestionsFeedPlaceholderFactory;
  v6 = -[PXSharedLibrarySharingSuggestionsFeedPlaceholderFactory init](&v11, sel_init);
  if (v6)
  {
    +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    sharedLibraryStatusProvider = v6->_sharedLibraryStatusProvider;
    v6->_sharedLibraryStatusProvider = (PXSharedLibraryStatusProvider *)v7;

  }
  return v6;
}

- (id)createPlaceholderViewForFeedWithViewModel:(id)a3
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
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  _QWORD v45[5];
  id v46;
  _QWORD v47[5];
  id v48;
  _QWORD v49[2];
  _QWORD v50[3];

  v50[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3698], "px_containerized_defaultConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("rectangle.on.rectangle.slash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v6);

  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_SuggestionsEmptyPlaceholder_Title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v7);

  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_SuggestionsEmptyPlaceholder_Message"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecondaryText:", v8);

  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_SuggestionsEmptyPlaceholder_IdentifyPerticipantsButton_Title"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buttonProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:", v9);

  v12 = (void *)MEMORY[0x1E0DC3428];
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __101__PXSharedLibrarySharingSuggestionsFeedPlaceholderFactory_createPlaceholderViewForFeedWithViewModel___block_invoke;
  v47[3] = &unk_1E513F280;
  v47[4] = self;
  v13 = v4;
  v48 = v13;
  objc_msgSend(v12, "actionWithHandler:", v47);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v5;
  objc_msgSend(v5, "buttonProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPrimaryAction:", v14);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36B0]), "initWithConfiguration:", v5);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v17);

  objc_msgSend(v16, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setCornerRadius:", 10.0);

  objc_msgSend(v16, "setClipsToBounds:", 1);
  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setImage:", v20);

  v21 = (void *)MEMORY[0x1E0DC3888];
  PXFontWithTextStyleSymbolicTraits();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "configurationWithFont:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "configurationWithPaletteColors:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "configurationByApplyingConfiguration:", v27);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setPreferredSymbolConfigurationForImage:", v43);
  v41 = v19;
  objc_msgSend(v19, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
  v28 = (void *)MEMORY[0x1E0DC3518];
  v29 = (void *)MEMORY[0x1E0DC3428];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __101__PXSharedLibrarySharingSuggestionsFeedPlaceholderFactory_createPlaceholderViewForFeedWithViewModel___block_invoke_2;
  v45[3] = &unk_1E513F280;
  v45[4] = self;
  v46 = v13;
  v42 = v13;
  objc_msgSend(v29, "actionWithHandler:", v45);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "buttonWithConfiguration:primaryAction:", v19, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v16, "addSubview:", v31);
  v32 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v31, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34, 10.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v35;
  objc_msgSend(v31, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, -10.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "activateConstraints:", v39);

  return v16;
}

- (BOOL)supportsDynamicPlaceholderContentSize
{
  return 1;
}

- (void)_handleIdentifyParticipantsActionWithViewModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  PXSharedLibrarySuggestionsSettingsViewController *v10;

  v4 = a3;
  v10 = -[PXSharedLibrarySuggestionsSettingsViewController initWithSharedLibraryStatusProvider:]([PXSharedLibrarySuggestionsSettingsViewController alloc], "initWithSharedLibraryStatusProvider:", self->_sharedLibraryStatusProvider);
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_ManageSuggestions_Title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibrarySuggestionsSettingsViewController navigationItem](v10, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v5);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v10);
  objc_msgSend(v4, "presentingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v8;
  objc_msgSend(v9, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)_handleDismissActionWithViewModel:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v3 = (objc_class *)MEMORY[0x1E0DC3450];
  v4 = a3;
  v14 = objc_alloc_init(v3);
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_DisableSuggestionsAction_Message"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setMessage:", v5);

  v6 = (void *)MEMORY[0x1E0DC3448];
  PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 1, &__block_literal_global_249178);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v8);

  v9 = (void *)MEMORY[0x1E0DC3448];
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_DisableSuggestionsAction_Action"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 0, &__block_literal_global_170_249180);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v11);

  objc_msgSend(v4, "presentingViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v12;
  objc_msgSend(v13, "presentViewController:animated:completion:", v14, 1, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
}

void __93__PXSharedLibrarySharingSuggestionsFeedPlaceholderFactory__handleDismissActionWithViewModel___block_invoke_2()
{
  PXPreferencesSetSharedLibrarySuggestionsEnabled();
}

uint64_t __101__PXSharedLibrarySharingSuggestionsFeedPlaceholderFactory_createPlaceholderViewForFeedWithViewModel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleIdentifyParticipantsActionWithViewModel:", *(_QWORD *)(a1 + 40));
}

uint64_t __101__PXSharedLibrarySharingSuggestionsFeedPlaceholderFactory_createPlaceholderViewForFeedWithViewModel___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDismissActionWithViewModel:", *(_QWORD *)(a1 + 40));
}

@end
