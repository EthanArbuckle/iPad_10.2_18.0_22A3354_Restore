@implementation SearchUILinkPresentationCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

+ (id)fallbackMetadataWithURL:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setOriginalURL:", v3);
  SearchUIGeneralLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    +[SearchUILinkPresentationCardSectionView fallbackMetadataWithURL:].cold.1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);

  return v4;
}

- (id)setupContentView
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setOverrideBackgroundColor:", v4);

  objc_msgSend(v3, "_setDisableAnimations:", 1);
  objc_msgSend(v3, "_setPreferredSizeClass:", 5);
  objc_msgSend(v3, "_setDisablePreviewGesture:", 0);
  objc_msgSend(v3, "_setDisableTapGesture:", 1);
  objc_msgSend(v3, "_setDisableHighlightGesture:", 1);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__performCommand);
  -[SearchUILinkPresentationCardSectionView setLinkPresentationTapped:](self, "setLinkPresentationTapped:", v5);

  objc_msgSend(v3, "addGestureRecognizer:", self->_linkPresentationTapped);
  -[SearchUILinkPresentationCardSectionView setLinkView:](self, "setLinkView:", v3);
  return v3;
}

- (void)updateWithRowModel:(id)a3
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
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  SearchUILinkPresentationCardSectionView *v39;
  id v40;
  objc_super v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (updateWithRowModel__onceToken_0 != -1)
    dispatch_once(&updateWithRowModel__onceToken_0, &__block_literal_global_5);
  v41.receiver = self;
  v41.super_class = (Class)SearchUILinkPresentationCardSectionView;
  -[SearchUICardSectionView updateWithRowModel:](&v41, sel_updateWithRowModel_, v4);
  v5 = (void *)MEMORY[0x1E0C99E98];
  -[SearchUICardSectionView section](self, "section");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUILinkPresentationCardSectionView linkView](self, "linkView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setURL:", v8);

  -[SearchUILinkPresentationCardSectionView linkView](self, "linkView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setMetadata:isFinal:", 0, 0);

  -[SearchUILinkPresentationCardSectionView linkView](self, "linkView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setContactsForAttribution:", 0);

  -[SearchUILinkPresentationCardSectionView linkView](self, "linkView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_setHighlightedForAttribution:", 0);

  if (v8)
  {
    objc_msgSend((id)updateWithRowModel__metadataCache, "objectForKey:", v8);
    v13 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v13;
    if (v13)
    {
      v14 = v13;
      -[SearchUILinkPresentationCardSectionView linkView](self, "linkView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setMetadata:", v14);
    }
    else
    {
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __62__SearchUILinkPresentationCardSectionView_updateWithRowModel___block_invoke_2;
      v37[3] = &unk_1EA1F6588;
      v38 = v8;
      v39 = self;
      v40 = v4;
      -[SearchUILinkPresentationCardSectionView fetchMetadataFromMessagesWithURL:completionBlock:](self, "fetchMetadataFromMessagesWithURL:completionBlock:", v38, v37);

      v15 = v38;
    }

    v16 = (void *)objc_opt_new();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[SearchUICardSectionView section](self, "section");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "peopleToBadge");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v34 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v23, "contactIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            objc_msgSend(v23, "contactIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addObject:", v25);

          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      }
      while (v20);
    }

    +[SearchUIContactCache sharedCache](SearchUIContactCache, "sharedCache");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __62__SearchUILinkPresentationCardSectionView_updateWithRowModel___block_invoke_2_18;
    v31[3] = &unk_1EA1F65B0;
    v31[4] = self;
    v32 = v4;
    objc_msgSend(v26, "fetchContactsForIdentifiers:completionHandler:", v16, v31);

    -[SearchUICardSectionView section](self, "section");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isHighlighted");
    -[SearchUILinkPresentationCardSectionView linkView](self, "linkView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_setHighlightedForAttribution:", v28);

  }
}

void __62__SearchUILinkPresentationCardSectionView_updateWithRowModel___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)updateWithRowModel__metadataCache;
  updateWithRowModel__metadataCache = v0;

}

void __62__SearchUILinkPresentationCardSectionView_updateWithRowModel___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    SearchUIGeneralLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __62__SearchUILinkPresentationCardSectionView_updateWithRowModel___block_invoke_2_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  }
  if (v5)
  {
    objc_msgSend((id)updateWithRowModel__metadataCache, "setObject:forKey:", v5, a1[4]);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __62__SearchUILinkPresentationCardSectionView_updateWithRowModel___block_invoke_14;
    v15[3] = &unk_1EA1F6518;
    v14 = (void *)a1[6];
    v15[4] = a1[5];
    v16 = v14;
    v17 = v5;
    +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v15);

  }
}

void __62__SearchUILinkPresentationCardSectionView_updateWithRowModel___block_invoke_14(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "rowModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "linkView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMetadata:", v4);

  }
}

void __62__SearchUILinkPresentationCardSectionView_updateWithRowModel___block_invoke_2_18(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__SearchUILinkPresentationCardSectionView_updateWithRowModel___block_invoke_3;
  v6[3] = &unk_1EA1F6518;
  v4 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v3;
  v5 = v3;
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v6);

}

void __62__SearchUILinkPresentationCardSectionView_updateWithRowModel___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "rowModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "linkView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setContactsForAttribution:", v4);

  }
}

- (void)fetchMetadataFromMessagesWithURL:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CA6B38], "defaultSearchableIndex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICardSectionView section](self, "section");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "coreSpotlightIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __92__SearchUILinkPresentationCardSectionView_fetchMetadataFromMessagesWithURL_completionBlock___block_invoke;
    v13[3] = &unk_1EA1F65F8;
    v15 = v7;
    v13[4] = self;
    v14 = v6;
    objc_msgSend(v8, "provideDataForBundle:identifier:type:completionHandler:", v9, v11, CFSTR("com.apple.metadata-importer.linkMetadata"), v13);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "fallbackMetadataWithURL:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v12, 0);

  }
}

void __92__SearchUILinkPresentationCardSectionView_fetchMetadataFromMessagesWithURL_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (IDSBAASignerErrorDomain_block_invoke_onceToken != -1)
      dispatch_once(&IDSBAASignerErrorDomain_block_invoke_onceToken, &__block_literal_global_23);
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", IDSBAASignerErrorDomain_block_invoke_objectClasses, v5, &v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v17;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("attachmentPaths"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("payloadData"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CC11D8], "linkWithDataRepresentation:attachments:", v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "metadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 48);
    if (v12)
    {
      (*(void (**)(_QWORD, void *, id))(v13 + 16))(*(_QWORD *)(a1 + 48), v12, v6);
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "fallbackMetadataWithURL:", *(_QWORD *)(a1 + 40));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, id))(v13 + 16))(v13, v16, v6);

    }
  }
  else
  {
    v14 = *(_QWORD *)(a1 + 48);
    objc_msgSend((id)objc_opt_class(), "fallbackMetadataWithURL:", *(_QWORD *)(a1 + 40));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v14 + 16))(v14, v15, v6);

  }
}

void __92__SearchUILinkPresentationCardSectionView_fetchMetadataFromMessagesWithURL_completionBlock___block_invoke_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)IDSBAASignerErrorDomain_block_invoke_objectClasses;
  IDSBAASignerErrorDomain_block_invoke_objectClasses = v2;

}

- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v8 = a5;
  -[SearchUILinkPresentationCardSectionView linkView](self, "linkView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 == v8)
  {
    -[SearchUICardSectionView rowModel](self, "rowModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "sectionType");

    if (v11)
      goto LABEL_5;
  }
  else
  {

  }
  width = *MEMORY[0x1E0CFAA88];
  height = *(double *)(MEMORY[0x1E0CFAA88] + 8);
LABEL_5:

  v12 = width;
  v13 = height;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)_performCommand
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SearchUICardSectionView feedbackDelegate](self, "feedbackDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities environmentForDelegate:](SearchUIUtilities, "environmentForDelegate:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[SearchUICardSectionView rowModel](self, "rowModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUICommandHandler handlerForRowModel:environment:](SearchUICommandHandler, "handlerForRowModel:environment:", v4, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executeWithTriggerEvent:", 2);

}

- (UITapGestureRecognizer)linkPresentationTapped
{
  return self->_linkPresentationTapped;
}

- (void)setLinkPresentationTapped:(id)a3
{
  objc_storeStrong((id *)&self->_linkPresentationTapped, a3);
}

- (LPLinkView)linkView
{
  return self->_linkView;
}

- (void)setLinkView:(id)a3
{
  objc_storeStrong((id *)&self->_linkView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkView, 0);
  objc_storeStrong((id *)&self->_linkPresentationTapped, 0);
}

+ (void)fallbackMetadataWithURL:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DAD39000, a2, a3, "Using fallback metadata with url: %@", a5, a6, a7, a8, 2u);
}

void __62__SearchUILinkPresentationCardSectionView_updateWithRowModel___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DAD39000, a2, a3, "Error fetching SearchUILinkPresentation metadata: %@", a5, a6, a7, a8, 2u);
}

@end
