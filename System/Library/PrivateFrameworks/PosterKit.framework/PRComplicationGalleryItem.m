@implementation PRComplicationGalleryItem

- (PRComplicationGalleryItem)initWithWidgetItem:(id)a3
{
  id v5;
  PRComplicationGalleryItem *v6;
  PRComplicationGalleryItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRComplicationGalleryItem;
  v6 = -[PRComplicationGalleryItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_widgetItem, a3);

  return v7;
}

- (PRComplicationGalleryItem)initWithApplicationWidgetCollection:(id)a3
{
  id v5;
  PRComplicationGalleryItem *v6;
  PRComplicationGalleryItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRComplicationGalleryItem;
  v6 = -[PRComplicationGalleryItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_applicationWidgetCollection, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  PRComplicationGalleryWidgetItem *widgetItem;
  uint64_t v7;
  id v8;
  id v9;
  SBHApplicationWidgetCollection *applicationWidgetCollection;
  id v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", self, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  widgetItem = self->_widgetItem;
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __37__PRComplicationGalleryItem_isEqual___block_invoke;
  v19[3] = &unk_1E2184160;
  v8 = v4;
  v20 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", widgetItem, v19);
  applicationWidgetCollection = self->_applicationWidgetCollection;
  v14 = v7;
  v15 = 3221225472;
  v16 = __37__PRComplicationGalleryItem_isEqual___block_invoke_2;
  v17 = &unk_1E2184160;
  v18 = v8;
  v11 = v8;
  v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", applicationWidgetCollection, &v14);
  LOBYTE(applicationWidgetCollection) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);

  return (char)applicationWidgetCollection;
}

id __37__PRComplicationGalleryItem_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

id __37__PRComplicationGalleryItem_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_widgetItem);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_applicationWidgetCollection);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_widgetItem, CFSTR("widgetItem"), 1);
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_applicationWidgetCollection, CFSTR("applicationWidgetCollection"), 1);
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PRComplicationGalleryWidgetItem)widgetItem
{
  return self->_widgetItem;
}

- (SBHApplicationWidgetCollection)applicationWidgetCollection
{
  return self->_applicationWidgetCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationWidgetCollection, 0);
  objc_storeStrong((id *)&self->_widgetItem, 0);
}

@end
