@implementation PKActivityItemSource

+ (id)placeholderURLItemWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  PKActivityItemSource *v12;

  v7 = (objc_class *)MEMORY[0x1E0C99E98];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithString:", CFSTR("https://apple.com"));
  v12 = -[PKActivityItemSource initWithTitle:subtitle:icon:value:]([PKActivityItemSource alloc], "initWithTitle:subtitle:icon:value:", v10, v9, v8, v11);

  return v12;
}

+ (id)placeholderURLItemWithTitle:(id)a3 subtitle:(id)a4 iconURL:(id)a5 iconPlaceholder:(id)a6
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  PKActivityItemSource *v15;

  v9 = (objc_class *)MEMORY[0x1E0C99E98];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend([v9 alloc], "initWithString:", CFSTR("https://apple.com"));
  v15 = -[PKActivityItemSource initWithTitle:subtitle:iconURL:iconPlaceholder:value:]([PKActivityItemSource alloc], "initWithTitle:subtitle:iconURL:iconPlaceholder:value:", v13, v12, v11, v10, v14);

  return v15;
}

+ (id)actionableItemWithValue:(id)a3
{
  id v3;
  PKActivityItemSource *v4;

  v3 = a3;
  v4 = -[PKActivityItemSource initWithTitle:subtitle:icon:value:]([PKActivityItemSource alloc], "initWithTitle:subtitle:icon:value:", 0, 0, 0, v3);

  return v4;
}

- (PKActivityItemSource)init
{

  return 0;
}

- (PKActivityItemSource)initWithTitle:(id)a3 subtitle:(id)a4 iconURL:(id)a5 iconPlaceholder:(id)a6 value:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  PKActivityItemSource *v18;
  PKActivityItemSource *v19;
  id v20;
  uint64_t v21;
  PKActivityItemSource *v22;
  void *v23;
  uint64_t v24;
  LPImage *icon;
  _QWORD v27[4];
  PKActivityItemSource *v28;
  objc_super v29;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v29.receiver = self;
  v29.super_class = (Class)PKActivityItemSource;
  v18 = -[PKActivityItemSource init](&v29, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_title, a3);
    objc_storeStrong((id *)&v19->_subtitle, a4);
    objc_storeStrong(&v19->_value, a7);
    objc_storeStrong((id *)&v19->_iconURL, a5);
    if (v19->_iconURL)
    {
      v20 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
      v21 = objc_opt_class();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __77__PKActivityItemSource_initWithTitle_subtitle_iconURL_iconPlaceholder_value___block_invoke;
      v27[3] = &unk_1E3E7A808;
      v22 = v19;
      v28 = v22;
      objc_msgSend(v20, "registerObjectOfClass:visibility:loadHandler:", v21, 0, v27);
      if (v16)
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1170]), "initWithPlatformImage:", v16);
      else
        v23 = 0;
      v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC1170]), "initWithItemProvider:properties:placeholderImage:", v20, 0, v23);
      icon = v22->_icon;
      v22->_icon = (LPImage *)v24;

    }
  }

  return v19;
}

uint64_t __77__PKActivityItemSource_initWithTitle_subtitle_iconURL_iconPlaceholder_value___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  _QWORD *v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[3];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__PKActivityItemSource_initWithTitle_subtitle_iconURL_iconPlaceholder_value___block_invoke_2;
  v8[3] = &unk_1E3E632B8;
  v9 = v4;
  v10 = v3;
  v6 = v3;
  PKCommonCachedImageFromURL(v5, v8);

  return 0;
}

void __77__PKActivityItemSource_initWithTitle_subtitle_iconURL_iconPlaceholder_value___block_invoke_2(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), obj);
  v5 = obj;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (PKActivityItemSource)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5 value:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PKActivityItemSource *v15;
  PKActivityItemSource *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  LPImage *icon;
  _QWORD v22[4];
  id v23;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PKActivityItemSource;
  v15 = -[PKActivityItemSource init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_title, a3);
    objc_storeStrong((id *)&v16->_subtitle, a4);
    objc_storeStrong(&v16->_value, a6);
    objc_storeStrong((id *)&v16->_iconImage, a5);
    if (v13)
    {
      v17 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
      v18 = objc_opt_class();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __58__PKActivityItemSource_initWithTitle_subtitle_icon_value___block_invoke;
      v22[3] = &unk_1E3E7A808;
      v23 = v13;
      objc_msgSend(v17, "registerObjectOfClass:visibility:loadHandler:", v18, 0, v22);
      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC1170]), "initWithItemProvider:properties:placeholderImage:", v17, 0, 0);
      icon = v16->_icon;
      v16->_icon = (LPImage *)v19;

    }
  }

  return v16;
}

uint64_t __58__PKActivityItemSource_initWithTitle_subtitle_icon_value___block_invoke(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 0);
  return 0;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return self->_value;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return self->_value;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0CC11A0]);
  objc_msgSend(v4, "setTitle:", self->_title);
  objc_msgSend(v4, "setSummary:", self->_subtitle);
  objc_msgSend(v4, "setImage:", self->_icon);
  return v4;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  return 0;
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
