@implementation _UITextInteractableItemCache

- (_UITextInteractableItemCache)init
{
  _UITextInteractableItemCache *v2;
  uint64_t v3;
  NSMutableSet *attachmentItems;
  uint64_t v5;
  NSMutableSet *linkItems;
  uint64_t v7;
  NSMutableSet *tagItems;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UITextInteractableItemCache;
  v2 = -[_UITextInteractableItemCache init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    attachmentItems = v2->_attachmentItems;
    v2->_attachmentItems = (NSMutableSet *)v3;

    v5 = objc_opt_new();
    linkItems = v2->_linkItems;
    v2->_linkItems = (NSMutableSet *)v5;

    v7 = objc_opt_new();
    tagItems = v2->_tagItems;
    v2->_tagItems = (NSMutableSet *)v7;

  }
  return v2;
}

- (id)itemForAttachment:(id)a3 range:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[_UITextInteractableItemCache linkItems](self, "linkItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56___UITextInteractableItemCache_itemForAttachment_range___block_invoke;
  v13[3] = &unk_1E16DC5E8;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  -[_UITextInteractableItemCache _cachedItemInSet:predicate:](self, "_cachedItemInSet:predicate:", v8, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)itemForLink:(id)a3 range:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[_UITextInteractableItemCache linkItems](self, "linkItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50___UITextInteractableItemCache_itemForLink_range___block_invoke;
  v13[3] = &unk_1E16DC610;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  -[_UITextInteractableItemCache _cachedItemInSet:predicate:](self, "_cachedItemInSet:predicate:", v8, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)itemForTag:(id)a3 range:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[_UITextInteractableItemCache tagItems](self, "tagItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49___UITextInteractableItemCache_itemForTag_range___block_invoke;
  v13[3] = &unk_1E16DC638;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  -[_UITextInteractableItemCache _cachedItemInSet:predicate:](self, "_cachedItemInSet:predicate:", v8, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)addItem:(id)a3
{
  id v4;
  NSMutableSet *linkItems;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isLinkItem"))
  {
    linkItems = self->_linkItems;
LABEL_7:
    -[NSMutableSet addObject:](linkItems, "addObject:", v4);
    goto LABEL_8;
  }
  if (objc_msgSend(v4, "isAttachmentItem"))
  {
    linkItems = self->_attachmentItems;
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "isTagItem"))
  {
    linkItems = self->_tagItems;
    goto LABEL_7;
  }
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_fault_impl(&dword_185066000, v8, OS_LOG_TYPE_FAULT, "Unknown interactable item %@", (uint8_t *)&v9, 0xCu);
    }

  }
  else
  {
    v6 = addItem____s_category;
    if (!addItem____s_category)
    {
      v6 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&addItem____s_category);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Unknown interactable item %@", (uint8_t *)&v9, 0xCu);
    }
  }
LABEL_8:

}

- (void)removeItem:(id)a3
{
  id v4;
  NSMutableSet *linkItems;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isLinkItem"))
  {
    linkItems = self->_linkItems;
LABEL_7:
    -[NSMutableSet removeObject:](linkItems, "removeObject:", v4);
    goto LABEL_8;
  }
  if (objc_msgSend(v4, "isAttachmentItem"))
  {
    linkItems = self->_attachmentItems;
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "isTagItem"))
  {
    linkItems = self->_tagItems;
    goto LABEL_7;
  }
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_fault_impl(&dword_185066000, v8, OS_LOG_TYPE_FAULT, "Unknown interactable item %@", (uint8_t *)&v9, 0xCu);
    }

  }
  else
  {
    v6 = removeItem____s_category;
    if (!removeItem____s_category)
    {
      v6 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&removeItem____s_category);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Unknown interactable item %@", (uint8_t *)&v9, 0xCu);
    }
  }
LABEL_8:

}

- (void)invalidate
{
  -[NSMutableSet removeAllObjects](self->_attachmentItems, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_linkItems, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_tagItems, "removeAllObjects");
}

- (id)_cachedItemInSet:(id)a3 predicate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59___UITextInteractableItemCache__cachedItemInSet_predicate___block_invoke;
  v10[3] = &unk_1E16DC660;
  v11 = v5;
  v6 = v5;
  objc_msgSend(a3, "objectsPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSMutableSet)attachmentItems
{
  return self->_attachmentItems;
}

- (void)setAttachmentItems:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentItems, a3);
}

- (NSMutableSet)linkItems
{
  return self->_linkItems;
}

- (void)setLinkItems:(id)a3
{
  objc_storeStrong((id *)&self->_linkItems, a3);
}

- (NSMutableSet)tagItems
{
  return self->_tagItems;
}

- (void)setTagItems:(id)a3
{
  objc_storeStrong((id *)&self->_tagItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagItems, 0);
  objc_storeStrong((id *)&self->_linkItems, 0);
  objc_storeStrong((id *)&self->_attachmentItems, 0);
}

@end
