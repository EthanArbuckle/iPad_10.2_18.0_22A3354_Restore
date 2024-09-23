@implementation PRComplicationGalleryWidgetItem

- (PRComplicationGalleryWidgetItem)initWithDisplayName:(id)a3 selected:(BOOL)a4 iconImageHidden:(BOOL)a5 descriptor:(id)a6
{
  id v10;
  id v11;
  PRComplicationGalleryWidgetItem *v12;
  uint64_t v13;
  NSString *displayName;
  objc_super v16;

  v10 = a3;
  v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)PRComplicationGalleryWidgetItem;
  v12 = -[PRComplicationGalleryWidgetItem init](&v16, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    displayName = v12->_displayName;
    v12->_displayName = (NSString *)v13;

    v12->_selected = a4;
    v12->_iconImageHidden = a5;
    objc_storeStrong((id *)&v12->_descriptor, a6);
    v12->_kind = 0;
  }

  return v12;
}

- (PRComplicationGalleryWidgetItem)initWithDisplayName:(id)a3 selected:(BOOL)a4 iconImageHidden:(BOOL)a5 text:(id)a6 kind:(int64_t)a7
{
  id v12;
  id v13;
  PRComplicationGalleryWidgetItem *v14;
  uint64_t v15;
  NSString *displayName;
  uint64_t v17;
  NSString *text;
  objc_super v20;

  v12 = a3;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PRComplicationGalleryWidgetItem;
  v14 = -[PRComplicationGalleryWidgetItem init](&v20, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v12, "copy");
    displayName = v14->_displayName;
    v14->_displayName = (NSString *)v15;

    v14->_selected = a4;
    v14->_iconImageHidden = a5;
    v17 = objc_msgSend(v13, "copy");
    text = v14->_text;
    v14->_text = (NSString *)v17;

    v14->_kind = a7;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NSString *displayName;
  uint64_t v7;
  id v8;
  id v9;
  _BOOL8 selected;
  id v11;
  id v12;
  _BOOL8 iconImageHidden;
  id v14;
  id v15;
  PRComplicationDescriptor *descriptor;
  id v17;
  id v18;
  NSString *text;
  id v20;
  id v21;
  int64_t kind;
  id v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", self, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  displayName = self->_displayName;
  v7 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __43__PRComplicationGalleryWidgetItem_isEqual___block_invoke;
  v39[3] = &unk_1E2184110;
  v8 = v4;
  v40 = v8;
  v9 = (id)objc_msgSend(v5, "appendString:counterpart:", displayName, v39);
  selected = self->_selected;
  v37[0] = v7;
  v37[1] = 3221225472;
  v37[2] = __43__PRComplicationGalleryWidgetItem_isEqual___block_invoke_2;
  v37[3] = &unk_1E2184138;
  v11 = v8;
  v38 = v11;
  v12 = (id)objc_msgSend(v5, "appendBool:counterpart:", selected, v37);
  iconImageHidden = self->_iconImageHidden;
  v35[0] = v7;
  v35[1] = 3221225472;
  v35[2] = __43__PRComplicationGalleryWidgetItem_isEqual___block_invoke_3;
  v35[3] = &unk_1E2184138;
  v14 = v11;
  v36 = v14;
  v15 = (id)objc_msgSend(v5, "appendBool:counterpart:", iconImageHidden, v35);
  descriptor = self->_descriptor;
  v33[0] = v7;
  v33[1] = 3221225472;
  v33[2] = __43__PRComplicationGalleryWidgetItem_isEqual___block_invoke_4;
  v33[3] = &unk_1E2184160;
  v17 = v14;
  v34 = v17;
  v18 = (id)objc_msgSend(v5, "appendObject:counterpart:", descriptor, v33);
  text = self->_text;
  v31[0] = v7;
  v31[1] = 3221225472;
  v31[2] = __43__PRComplicationGalleryWidgetItem_isEqual___block_invoke_5;
  v31[3] = &unk_1E2184110;
  v20 = v17;
  v32 = v20;
  v21 = (id)objc_msgSend(v5, "appendString:counterpart:", text, v31);
  kind = self->_kind;
  v26 = v7;
  v27 = 3221225472;
  v28 = __43__PRComplicationGalleryWidgetItem_isEqual___block_invoke_6;
  v29 = &unk_1E2184188;
  v30 = v20;
  v23 = v20;
  v24 = (id)objc_msgSend(v5, "appendInteger:counterpart:", kind, &v26);
  LOBYTE(kind) = objc_msgSend(v5, "isEqual", v26, v27, v28, v29);

  return kind;
}

id __43__PRComplicationGalleryWidgetItem_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

uint64_t __43__PRComplicationGalleryWidgetItem_isEqual___block_invoke_2(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8);
}

uint64_t __43__PRComplicationGalleryWidgetItem_isEqual___block_invoke_3(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 9);
}

id __43__PRComplicationGalleryWidgetItem_isEqual___block_invoke_4(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 24);
}

id __43__PRComplicationGalleryWidgetItem_isEqual___block_invoke_5(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 32);
}

uint64_t __43__PRComplicationGalleryWidgetItem_isEqual___block_invoke_6(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendString:", self->_displayName);
  v5 = (id)objc_msgSend(v3, "appendBool:", self->_selected);
  v6 = (id)objc_msgSend(v3, "appendBool:", self->_iconImageHidden);
  v7 = (id)objc_msgSend(v3, "appendObject:", self->_descriptor);
  v8 = (id)objc_msgSend(v3, "appendString:", self->_text);
  v9 = (id)objc_msgSend(v3, "appendInteger:", self->_kind);
  v10 = objc_msgSend(v3, "hash");

  return v10;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)isIconImageHidden
{
  return self->_iconImageHidden;
}

- (PRComplicationDescriptor)descriptor
{
  return self->_descriptor;
}

- (NSString)text
{
  return self->_text;
}

- (int64_t)kind
{
  return self->_kind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
