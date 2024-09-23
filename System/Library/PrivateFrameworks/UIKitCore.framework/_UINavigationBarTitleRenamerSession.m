@implementation _UINavigationBarTitleRenamerSession

- (_UINavigationBarTitleRenamerSession)initWithSuggestedTitle:(id)a3 iconMetadata:(id)a4
{
  id v7;
  id v8;
  _UINavigationBarTitleRenamerSession *v9;
  uint64_t v10;
  NSUUID *sessionIdentifier;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UINavigationBarTitleRenamerSession;
  v9 = -[_UINavigationBarTitleRenamerSession init](&v13, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v9->_sessionIdentifier;
    v9->_sessionIdentifier = (NSUUID *)v10;

    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v9->_iconMetadata, a4);
  }

  return v9;
}

- (_UINavigationBarTitleRenamerSession)initWithSuggestedTitle:(id)a3
{
  return -[_UINavigationBarTitleRenamerSession initWithSuggestedTitle:iconMetadata:](self, "initWithSuggestedTitle:iconMetadata:", a3, 0);
}

- (id)_sanitizedTitleForText:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = v4;
  }
  else
  {
    -[_UINavigationBarTitleRenamerSession title](self, "title");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)existingRenamerContentView
{
  return self->_renamerContentView;
}

- (id)createRenamerContentView
{
  return -[_UINavigationBarTitleRenameTextField initWithSession:]([_UINavigationBarTitleRenameTextField alloc], "initWithSession:", self);
}

- (_UINavigationBarTitleRenamerContentView)renamerContentView
{
  _UINavigationBarTitleRenamerContentView *renamerContentView;
  _UINavigationBarTitleRenamerContentView *v4;
  _UINavigationBarTitleRenamerContentView *v5;

  renamerContentView = self->_renamerContentView;
  if (!renamerContentView)
  {
    -[_UINavigationBarTitleRenamerSession createRenamerContentView](self, "createRenamerContentView");
    v4 = (_UINavigationBarTitleRenamerContentView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_renamerContentView;
    self->_renamerContentView = v4;

    renamerContentView = self->_renamerContentView;
  }
  return renamerContentView;
}

- (void)sessionDidStartInRenamer:(id)a3
{
  objc_storeWeak((id *)&self->_attachedRenamer, a3);
}

- (void)sessionDidEnd
{
  objc_storeWeak((id *)&self->_attachedRenamer, 0);
}

- (void)cancelSession
{
  _UINavigationBarTitleRenamer **p_attachedRenamer;
  id WeakRetained;

  p_attachedRenamer = &self->_attachedRenamer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_attachedRenamer);
  objc_storeWeak((id *)p_attachedRenamer, 0);
  objc_msgSend(WeakRetained, "_sessionDidCancel:", self);

}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  LPLinkMetadata *iconMetadata;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionIdentifier, CFSTR("_UINavigationBarTitleRenamerSessionIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("_UINavigationBarTitleRenamerSessionTitle"));
  iconMetadata = self->_iconMetadata;
  if (iconMetadata)
    objc_msgSend(v5, "encodeObject:forKey:", iconMetadata, CFSTR("_UINavigationBarTitleRenamerIconMetadata"));

}

- (_UINavigationBarTitleRenamerSession)initWithBSXPCCoder:(id)a3
{
  id v4;
  _UINavigationBarTitleRenamerSession *v5;
  uint64_t v6;
  NSUUID *sessionIdentifier;
  uint64_t v8;
  NSString *title;
  void *v10;
  id v11;
  uint64_t v12;
  LPLinkMetadata *iconMetadata;
  objc_super v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UINavigationBarTitleRenamerSession;
  v5 = -[_UINavigationBarTitleRenamerSession init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_UINavigationBarTitleRenamerSessionIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_UINavigationBarTitleRenamerSessionTitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    v17 = 0;
    v18 = &v17;
    v19 = 0x2050000000;
    v10 = (void *)_MergedGlobals_1141;
    v20 = _MergedGlobals_1141;
    if (!_MergedGlobals_1141)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __getLPLinkMetadataClass_block_invoke;
      v16[3] = &unk_1E16B14C0;
      v16[4] = &v17;
      __getLPLinkMetadataClass_block_invoke((uint64_t)v16);
      v10 = (void *)v18[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v17, 8);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, CFSTR("_UINavigationBarTitleRenamerIconMetadata"));
    v12 = objc_claimAutoreleasedReturnValue();
    iconMetadata = v5->_iconMetadata;
    v5->_iconMetadata = (LPLinkMetadata *)v12;

  }
  return v5;
}

- (_UINavigationBarTitleRenamer)attachedRenamer
{
  return (_UINavigationBarTitleRenamer *)objc_loadWeakRetained((id *)&self->_attachedRenamer);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (LPLinkMetadata)iconMetadata
{
  return self->_iconMetadata;
}

- (id)context
{
  return objc_loadWeakRetained(&self->_context);
}

- (void)setContext:(id)a3
{
  objc_storeWeak(&self->_context, a3);
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_destroyWeak(&self->_context);
  objc_storeStrong((id *)&self->_iconMetadata, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_attachedRenamer);
  objc_storeStrong((id *)&self->_renamerContentView, 0);
}

- (id)_willBeginRenamingWithText:(id)a3 selectedRange:(_NSRange *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  -[_UINavigationBarTitleRenamerSession attachedRenamer](self, "attachedRenamer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "_session:textFieldWillBeginRenamingWithTitle:selectedRange:", self, v6, a4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarTitleRenamerSession setTitle:](self, "setTitle:", v9);
  }
  else
  {
    v9 = v6;
  }

  return v9;
}

- (BOOL)_textFieldShouldEndEditingWithText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[_UINavigationBarTitleRenamerSession attachedRenamer](self, "attachedRenamer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_UINavigationBarTitleRenamerSession _sanitizedTitleForText:](self, "_sanitizedTitleForText:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "_session:textFieldShouldEndRenamingWithTitle:", self, v6);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)_textFieldDidEndEditingWithText:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_UINavigationBarTitleRenamerSession attachedRenamer](self, "attachedRenamer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[_UINavigationBarTitleRenamerSession _sanitizedTitleForText:](self, "_sanitizedTitleForText:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarTitleRenamerSession setTitle:](self, "setTitle:", v5);
    objc_msgSend(v4, "_sessionTextFieldDidEndEditing:", self);

  }
}

@end
