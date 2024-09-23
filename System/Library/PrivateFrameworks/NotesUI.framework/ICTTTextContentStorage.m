@implementation ICTTTextContentStorage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outlineController, 0);
}

- (ICOutlineController)outlineController
{
  return self->_outlineController;
}

- (ICTTTextContentStorage)init
{
  ICTTTextContentStorage *v2;
  ICTTTextStorage *v3;
  void *v4;
  ICTTTextStorage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICTTTextContentStorage;
  v2 = -[NSTextContentStorage init](&v7, sel_init);
  if (v2)
  {
    v3 = [ICTTTextStorage alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[ICTTTextStorage initWithData:replicaID:](v3, "initWithData:replicaID:", 0, v4);
    -[NSTextContentStorage setTextStorage:](v2, "setTextStorage:", v5);

  }
  return v2;
}

- (void)addTextLayoutManager:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[NSTextContentStorage textStorage](self, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTextLayoutManager:", v4);

  v6.receiver = self;
  v6.super_class = (Class)ICTTTextContentStorage;
  -[ICTTTextContentStorage addTextLayoutManager:](&v6, sel_addTextLayoutManager_, v4);

}

- (ICTTTextContentStorage)initWithTextStorage:(id)a3 outlineState:(id)a4
{
  id v6;
  id v7;
  ICTTTextContentStorage *v8;
  ICOutlineController *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  ICOutlineController *outlineController;
  ICOutlineController *v14;
  void *v15;
  objc_super v17;

  v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ICTTTextContentStorage;
  v7 = a3;
  v8 = -[NSTextContentStorage init](&v17, sel_init);
  -[NSTextContentStorage setTextStorage:](v8, "setTextStorage:", v7, v17.receiver, v17.super_class);

  -[NSTextContentStorage setIncludesTextListMarkers:](v8, "setIncludesTextListMarkers:", 0);
  if (ICInternalSettingsIsCollapsibleSectionsEnabled())
  {
    v9 = [ICOutlineController alloc];
    -[NSTextContentStorage textStorage](v8, "textStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "collapsedUUIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[ICOutlineController initWithTextStorage:collapsedUUIDs:asynchronous:](v9, "initWithTextStorage:collapsedUUIDs:asynchronous:", v10, v11, 1);
    outlineController = v8->_outlineController;
    v8->_outlineController = (ICOutlineController *)v12;

    v14 = v8->_outlineController;
    -[NSTextContentStorage textStorage](v8, "textStorage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setOutlineController:", v14);

  }
  return v8;
}

- (void)removeTextLayoutManager:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[NSTextContentStorage textStorage](self, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTextLayoutManager:", v4);

  v6.receiver = self;
  v6.super_class = (Class)ICTTTextContentStorage;
  -[ICTTTextContentStorage removeTextLayoutManager:](&v6, sel_removeTextLayoutManager_, v4);

}

- (BOOL)isUUIDHidden:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[ICTTTextContentStorage outlineController](self, "outlineController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isUUIDHidden:", v4);

  return v6;
}

- (BOOL)canExpandSectionsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;

  length = a3.length;
  location = a3.location;
  -[ICTTTextContentStorage outlineController](self, "outlineController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTTextContentStorage paragraphUUIDsInRange:](self, "paragraphUUIDsInRange:", location, length);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(location) = objc_msgSend(v6, "canExpandAnyUUIDs:", v7);

  return location;
}

- (BOOL)canCollapseSectionsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;

  length = a3.length;
  location = a3.location;
  -[ICTTTextContentStorage outlineController](self, "outlineController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTTextContentStorage paragraphUUIDsInRange:](self, "paragraphUUIDsInRange:", location, length);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(location) = objc_msgSend(v6, "canCollapseAnyUUIDs:", v7);

  return location;
}

- (void)setExpanded:(BOOL)a3 forSectionsInRange:(_NSRange)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[ICTTTextContentStorage paragraphUUIDsInRange:](self, "paragraphUUIDsInRange:", a4.location, a4.length);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[ICTTTextContentStorage outlineController](self, "outlineController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
    objc_msgSend(v6, "expandUUIDs:", v9);
  else
    objc_msgSend(v6, "collapseUUIDs:", v9);

  -[ICTTTextContentStorage outlineController](self, "outlineController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "collapsibleSectionAffordanceUsedForUUIDs:", v9);

}

- (void)expandAllSections
{
  id v2;

  -[ICTTTextContentStorage outlineController](self, "outlineController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "expandAll");

}

- (void)collapseAllSections
{
  id v2;

  -[ICTTTextContentStorage outlineController](self, "outlineController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collapseAll");

}

- (id)paragraphUUIDsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  if (a3.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set", 0x7FFFFFFFFFFFFFFFLL, a3.length);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    length = a3.length;
    location = a3.location;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSTextContentStorage textStorage](self, "textStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = *MEMORY[0x1E0D63928];
    if (length)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __48__ICTTTextContentStorage_paragraphUUIDsInRange___block_invoke;
      v15[3] = &unk_1E5C1E120;
      v16 = v7;
      objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v10, location, length, 0, v15);

      v11 = v16;
    }
    else
    {
      objc_msgSend(v8, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], location, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      ICDynamicCast();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ic_addNonNilObject:", v13);

    }
    v14 = (void *)objc_msgSend(v7, "copy");

    return v14;
  }
}

void __48__ICTTTextContentStorage_paragraphUUIDsInRange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_opt_class();
  ICDynamicCast();
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v6, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_addNonNilObject:", v5);

}

- (void)setOutlineController:(id)a3
{
  objc_storeStrong((id *)&self->_outlineController, a3);
}

@end
