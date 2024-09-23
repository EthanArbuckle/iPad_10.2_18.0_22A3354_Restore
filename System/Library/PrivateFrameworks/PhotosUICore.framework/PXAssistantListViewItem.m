@implementation PXAssistantListViewItem

- (PXAssistantListViewItem)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssistantListViewItem.m"), 23, CFSTR("%s is not available as initializer"), "-[PXAssistantListViewItem init]");

  abort();
}

- (PXAssistantListViewItem)initWithType:(int64_t)a3 tag:(int64_t)a4 representedObject:(id)a5 title:(id)a6 subtitle:(id)a7 detail:(id)a8 systemImageName:(id)a9 selected:(BOOL)a10 enabled:(BOOL)a11
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  PXAssistantListViewItem *v24;
  PXAssistantListViewItem *v25;
  uint64_t v26;
  NSString *title;
  uint64_t v28;
  NSString *subtitle;
  uint64_t v30;
  NSString *detail;
  uint64_t v32;
  NSString *systemImageName;
  void *v35;
  objc_super v36;

  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssistantListViewItem.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title"));

  }
  v36.receiver = self;
  v36.super_class = (Class)PXAssistantListViewItem;
  v24 = -[PXAssistantListViewItem init](&v36, sel_init);
  v25 = v24;
  if (v24)
  {
    v24->_type = a3;
    v24->_tag = a4;
    objc_storeStrong(&v24->_representedObject, a5);
    v26 = objc_msgSend(v20, "copy");
    title = v25->_title;
    v25->_title = (NSString *)v26;

    v28 = objc_msgSend(v21, "copy");
    subtitle = v25->_subtitle;
    v25->_subtitle = (NSString *)v28;

    v30 = objc_msgSend(v22, "copy");
    detail = v25->_detail;
    v25->_detail = (NSString *)v30;

    v32 = objc_msgSend(v23, "copy");
    systemImageName = v25->_systemImageName;
    v25->_systemImageName = (NSString *)v32;

    v25->_selected = a10;
    v25->_enabled = a11;
  }

  return v25;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)tag
{
  return self->_tag;
}

- (id)representedObject
{
  return self->_representedObject;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (NSString)detail
{
  return self->_detail;
}

- (BOOL)selected
{
  return self->_selected;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_representedObject, 0);
}

+ (id)itemWithTitle:(id)a3
{
  id v4;
  void *v5;
  uint64_t v7;

  v4 = a3;
  LOWORD(v7) = 256;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:tag:representedObject:title:subtitle:detail:systemImageName:selected:enabled:", 0, 0, 0, v4, 0, 0, 0, v7);

  return v5;
}

+ (id)itemWithTag:(int64_t)a3 title:(id)a4 enabled:(BOOL)a5
{
  id v8;
  void *v9;
  uint64_t v11;

  v8 = a4;
  BYTE1(v11) = a5;
  LOBYTE(v11) = 0;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:tag:representedObject:title:subtitle:detail:systemImageName:selected:enabled:", 0, a3, 0, v8, 0, 0, 0, v11);

  return v9;
}

+ (id)selectionItemWithTag:(int64_t)a3 title:(id)a4 subtitle:(id)a5 selected:(BOOL)a6 enabled:(BOOL)a7
{
  id v12;
  id v13;
  void *v14;
  uint64_t v16;

  v12 = a5;
  v13 = a4;
  BYTE1(v16) = a7;
  LOBYTE(v16) = a6;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:tag:representedObject:title:subtitle:detail:systemImageName:selected:enabled:", 1, a3, 0, v13, v12, 0, 0, v16);

  return v14;
}

+ (id)navigationItemWithTag:(int64_t)a3 title:(id)a4 subtitle:(id)a5 enabled:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v14;

  v10 = a5;
  v11 = a4;
  BYTE1(v14) = a6;
  LOBYTE(v14) = 0;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:tag:representedObject:title:subtitle:detail:systemImageName:selected:enabled:", 2, a3, 0, v11, v10, 0, 0, v14);

  return v12;
}

+ (id)ruleItemWithTag:(int64_t)a3 title:(id)a4 subtitle:(id)a5 detail:(id)a6 systemImageName:(id)a7 enabled:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v20;

  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  BYTE1(v20) = a8;
  LOBYTE(v20) = 0;
  v18 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:tag:representedObject:title:subtitle:detail:systemImageName:selected:enabled:", 4, a3, 0, v17, v16, v15, v14, v20);

  return v18;
}

@end
