@implementation WFDialogContentListItem

- (WFDialogContentListItem)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5 selected:(BOOL)a6 contentItem:(id)a7 encodedTypedValue:(id)a8 hideSubtitle:(BOOL)a9 serializedPossibleState:(id)a10
{
  _BOOL8 v11;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  WFDialogContentListItem *v24;
  WFDialogContentListItem *v25;
  id v28;
  objc_super v29;

  v11 = a6;
  v28 = a7;
  v16 = (void *)MEMORY[0x1E0CB3A28];
  v17 = a10;
  v18 = a8;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  objc_msgSend(v16, "UUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "UUIDString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29.receiver = self;
  v29.super_class = (Class)WFDialogContentListItem;
  v24 = -[WFDialogListItem initWithTitle:subtitle:identifier:image:selected:hideSubtitle:encodedTypedValue:serializedPossibleState:](&v29, sel_initWithTitle_subtitle_identifier_image_selected_hideSubtitle_encodedTypedValue_serializedPossibleState_, v21, v20, v23, v19, v11, a9, v18, v17);

  if (v24)
  {
    objc_storeStrong((id *)&v24->_contentItem, a7);
    v25 = v24;
  }

  return v24;
}

- (WFDialogContentListItem)initWithContentItem:(id)a3 encodedTypedValue:(id)a4 selected:(BOOL)a5 serializedPossibleState:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  WFDialogContentListItem *v18;
  uint64_t v20;
  _BOOL4 v21;

  v21 = a5;
  v9 = a6;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v11, "listItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "listItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "subtitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "listItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "image");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v20) = 0;
  v18 = -[WFDialogContentListItem initWithTitle:subtitle:image:selected:contentItem:encodedTypedValue:hideSubtitle:serializedPossibleState:](self, "initWithTitle:subtitle:image:selected:contentItem:encodedTypedValue:hideSubtitle:serializedPossibleState:", v13, v15, v17, v21, v11, v10, v20, v9);

  return v18;
}

- (WFDialogContentListItem)initWithContentItem:(id)a3 encodedTypedValue:(id)a4 selected:(BOOL)a5 hideSubtitle:(BOOL)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  WFDialogContentListItem *v13;
  uint64_t v15;

  v7 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v11, "richListTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = a6;
  v13 = -[WFDialogContentListItem initWithTitle:subtitle:image:selected:contentItem:encodedTypedValue:hideSubtitle:serializedPossibleState:](self, "initWithTitle:subtitle:image:selected:contentItem:encodedTypedValue:hideSubtitle:serializedPossibleState:", v12, 0, 0, v7, v11, v10, v15, 0);

  return v13;
}

- (WFDialogContentListItem)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  WFDialogContentListItem *v15;
  WFDialogContentListItem *v16;
  WFDialogContentListItem *v17;
  unsigned int v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("selected"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("archivedContentItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("hideSubtitle"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encodedTypedValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v13, CFSTR("serializedPossibleState"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[WFDialogListItem initWithTitle:subtitle:identifier:image:selected:hideSubtitle:encodedTypedValue:serializedPossibleState:](self, "initWithTitle:subtitle:identifier:image:selected:hideSubtitle:encodedTypedValue:serializedPossibleState:", v21, v22, v23, v4, v20, v19, v6, v14);
  v16 = v15;
  if (v15)
  {
    -[WFDialogContentListItem setArchivedContentItem:](v15, "setArchivedContentItem:", v5);
    v17 = v16;
  }

  return v16;
}

- (void)encodeWithCoder:(id)a3
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
  id v14;

  v4 = a3;
  -[WFDialogContentListItem contentItem](self, "contentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB36F8];
    -[WFDialogContentListItem contentItem](self, "contentItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "wf_securelyArchivedDataWithRootObject:deletionResponsibility:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFDialogContentListItem setArchivedContentItem:](self, "setArchivedContentItem:", v8);
  }
  -[WFDialogListItem identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("identifier"));

  -[WFDialogListItem title](self, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("title"));

  -[WFDialogContentListItem subtitle](self, "subtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("subtitle"));

  -[WFDialogContentListItem image](self, "image");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("image"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WFDialogListItem selected](self, "selected"), CFSTR("selected"));
  -[WFDialogContentListItem archivedContentItem](self, "archivedContentItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("archivedContentItem"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WFDialogContentListItem hideSubtitle](self, "hideSubtitle"), CFSTR("hideSubtitle"));
  -[WFDialogListItem serializedPossibleState](self, "serializedPossibleState");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("serializedPossibleState"));

}

- (void)prepareForDisplayWithCompletionHandler:(id)a3
{
  void (**v4)(id, WFDialogContentListItem *);
  void *v5;
  _QWORD v6[5];
  void (**v7)(id, WFDialogContentListItem *);

  v4 = (void (**)(id, WFDialogContentListItem *))a3;
  if (-[WFDialogListItem showingStaticContent](self, "showingStaticContent")
    || (-[WFDialogContentListItem contentItem](self, "contentItem"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    v4[2](v4, self);
  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __66__WFDialogContentListItem_prepareForDisplayWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E7AF3ED8;
    v6[4] = self;
    v7 = v4;
    -[WFDialogContentListItem _loadContentItemWithCompletion:](self, "_loadContentItemWithCompletion:", v6);

  }
}

- (void)_loadContentItemWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(id, _QWORD);
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = (void (**)(id, _QWORD))a3;
  -[WFDialogContentListItem archivedContentItem](self, "archivedContentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    v4[2](v4, 0);
  v6 = (void *)MEMORY[0x1E0CB3710];
  -[WFDialogContentListItem archivedContentItem](self, "archivedContentItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__WFDialogContentListItem__loadContentItemWithCompletion___block_invoke;
  v11[3] = &unk_1E7AF3F00;
  v11[4] = self;
  v12 = v4;
  v9 = v4;
  v10 = (id)objc_msgSend(v6, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v7, v8, v11);

}

- (BOOL)loadSubtitleWithCompletion:(id)a3
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v11;
  _QWORD v12[4];
  id v13;
  NSObject *v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *))a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDialogContentListItem.m"), 153, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  if (-[WFDialogListItem showingStaticContent](self, "showingStaticContent"))
  {
    -[WFDialogContentListItem subtitle](self, "subtitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v6);

    -[WFDialogContentListItem subtitle](self, "subtitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length") != 0;
LABEL_13:

    goto LABEL_14;
  }
  if (!-[WFDialogContentListItem hideSubtitle](self, "hideSubtitle"))
  {
    -[WFDialogContentListItem contentItem](self, "contentItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __54__WFDialogContentListItem_loadSubtitleWithCompletion___block_invoke;
      v12[3] = &unk_1E7AF3F28;
      v14 = v5;
      v13 = v7;
      v8 = objc_msgSend(v13, "getListSubtitle:", v12);

      v9 = v14;
    }
    else
    {
      getWFDialogLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v16 = "-[WFDialogContentListItem loadSubtitleWithCompletion:]";
        _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_FAULT, "%s Attempting to load subtitles without loading the content item first. Please call -[WFDialogListItem prepareForDisplayWithCompletionHandler:] first.", buf, 0xCu);
      }
      v8 = 0;
    }

    goto LABEL_13;
  }
  v8 = 0;
LABEL_14:

  return v8;
}

- (BOOL)loadAltTextWithCompletion:(id)a3
{
  id v5;
  char v6;
  void *v7;
  NSObject *v8;
  void *v10;
  _QWORD v11[4];
  NSObject *v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDialogContentListItem.m"), 184, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  if (-[WFDialogListItem showingStaticContent](self, "showingStaticContent"))
  {
    v6 = 0;
  }
  else
  {
    -[WFDialogContentListItem contentItem](self, "contentItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __53__WFDialogContentListItem_loadAltTextWithCompletion___block_invoke;
      v11[3] = &unk_1E7AF3F50;
      v12 = v5;
      v6 = objc_msgSend(v7, "getListAltText:", v11);
      v8 = v12;
    }
    else
    {
      getWFDialogLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v14 = "-[WFDialogContentListItem loadAltTextWithCompletion:]";
        _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_FAULT, "%s Attempting to load alt text without loading the content item first. Please call -[WFDialogListItem prepareForDisplayWithCompletionHandler:] first.", buf, 0xCu);
      }
      v6 = 0;
    }

  }
  return v6;
}

- (BOOL)loadImageWithSize:(CGSize)a3 completion:(id)a4
{
  double height;
  double width;
  void (**v8)(id, void *, void *);
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  void *v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;
  _QWORD v20[2];

  height = a3.height;
  width = a3.width;
  v20[1] = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, void *, void *))a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDialogContentListItem.m"), 207, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  if (-[WFDialogListItem showingStaticContent](self, "showingStaticContent"))
  {
    -[WFDialogContentListItem image](self, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resizedImageWithSizeInPoints:", width, height);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = *MEMORY[0x1E0DC8070];
    v20[0] = &unk_1E7B8BC50;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v10, v11);
    v12 = v10 != 0;

  }
  else
  {
    -[WFDialogContentListItem contentItem](self, "contentItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v10 = v13;
      v12 = objc_msgSend(v13, "getListThumbnail:forSize:", v8, width, height);
    }
    else
    {
      getWFDialogLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v18 = "-[WFDialogContentListItem loadImageWithSize:completion:]";
        _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_FAULT, "%s Attempting to load image without loading the content item first. Please call -[WFDialogListItem prepareForDisplayWithCompletionHandler:] first.", buf, 0xCu);
      }

      v10 = 0;
      v12 = 0;
    }
  }

  return v12;
}

- (WFContentItem)contentItem
{
  return self->_contentItem;
}

- (void)setContentItem:(id)a3
{
  objc_storeStrong((id *)&self->_contentItem, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (WFImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (BOOL)hideSubtitle
{
  return self->_hideSubtitle;
}

- (void)setHideSubtitle:(BOOL)a3
{
  self->_hideSubtitle = a3;
}

- (NSData)archivedContentItem
{
  return self->_archivedContentItem;
}

- (void)setArchivedContentItem:(id)a3
{
  objc_storeStrong((id *)&self->_archivedContentItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archivedContentItem, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_contentItem, 0);
}

uint64_t __53__WFDialogContentListItem_loadAltTextWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __54__WFDialogContentListItem_loadSubtitleWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    (*(void (**)(_QWORD))(v2 + 16))(*(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "localizedTypeDescription");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __58__WFDialogContentListItem__loadContentItemWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setContentItem:", v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __66__WFDialogContentListItem_prepareForDisplayWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
