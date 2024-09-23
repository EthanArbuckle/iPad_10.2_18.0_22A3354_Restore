@implementation _UISearchTokenAttachment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UISearchTokenAttachment)initWithData:(id)a3 ofType:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("must call -initWithToken:"), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (_UISearchTokenAttachment)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("must call -initWithToken:"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (_UISearchTokenAttachment)initWithCoder:(id)a3
{
  void *v4;
  _UISearchTokenAttachment *v5;

  +[UISearchToken tokenWithIcon:text:](UISearchToken, "tokenWithIcon:text:", 0, &stru_1E16EDF20);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UISearchTokenAttachment initWithToken:](self, "initWithToken:", v4);

  return v5;
}

- (_UISearchTokenAttachment)initWithToken:(id)a3
{
  id v5;
  _UISearchTokenAttachment *v6;
  _UISearchTokenAttachment *v7;
  _UISearchTokenAttachment *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UISearchTokenAttachment;
  v6 = -[_UISearchTokenAttachment initWithData:ofType:](&v10, sel_initWithData_ofType_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_token, a3);
    v8 = v7;
  }

  return v7;
}

- (id)imageForBounds:(CGRect)a3 textContainer:(id)a4 characterIndex:(unint64_t)a5
{
  return 0;
}

- (BOOL)usesTextAttachmentView
{
  return 1;
}

- (id)viewProviderForParentView:(id)a3 location:(id)a4 textContainer:(id)a5
{
  id v8;
  id v9;
  id v10;
  _UISearchTokenAttachmentViewProvider *viewProvider;
  void *v12;
  char v13;
  _UISearchTokenAttachmentViewProvider *v14;
  void *v15;
  _UISearchTokenAttachmentViewProvider *v16;
  _UISearchTokenAttachmentViewProvider *v17;
  void *v18;
  _UISearchTokenAttachmentViewProvider *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  viewProvider = self->_viewProvider;
  if (!viewProvider
    || (-[NSTextAttachmentViewProvider location](viewProvider, "location"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "isEqual:", v9),
        v12,
        (v13 & 1) == 0))
  {
    v14 = [_UISearchTokenAttachmentViewProvider alloc];
    objc_msgSend(v10, "textLayoutManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[_UISearchTokenAttachmentViewProvider initWithTextAttachment:parentView:textLayoutManager:location:](v14, "initWithTextAttachment:parentView:textLayoutManager:location:", self, v8, v15, v9);
    v17 = self->_viewProvider;
    self->_viewProvider = v16;

    -[NSTextAttachmentViewProvider setTracksTextAttachmentViewBounds:](self->_viewProvider, "setTracksTextAttachmentViewBounds:", 1);
  }
  objc_msgSend(v10, "textLayoutManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setViewProvider:forTextAttachment:location:", self->_viewProvider, self, v9);
  v19 = self->_viewProvider;

  return v19;
}

- (id)viewProviderForParentView:(id)a3 characterIndex:(unint64_t)a4 layoutManager:(id)a5
{
  _UISearchTokenAttachmentViewProvider *viewProvider;
  id v9;
  id v10;
  _UISearchTokenAttachmentViewProvider *v11;
  _UISearchTokenAttachmentViewProvider *v12;

  viewProvider = self->_viewProvider;
  if (!viewProvider)
  {
    v9 = a5;
    v10 = a3;
    v11 = -[NSTextAttachmentViewProvider initWithTextAttachment:parentView:characterIndex:layoutManager:]([_UISearchTokenAttachmentViewProvider alloc], "initWithTextAttachment:parentView:characterIndex:layoutManager:", self, v10, a4, v9);

    v12 = self->_viewProvider;
    self->_viewProvider = v11;

    -[NSTextAttachmentViewProvider setTracksTextAttachmentViewBounds:](self->_viewProvider, "setTracksTextAttachmentViewBounds:", 1);
    viewProvider = self->_viewProvider;
  }
  return viewProvider;
}

- (void)placeView:(id)a3 withFrame:(CGRect)a4 inParentView:(id)a5 characterIndex:(unint64_t)a6 layoutManager:(id)a7
{
  id v8;
  id v9;
  int has_internal_diagnostics;
  char isKindOfClass;
  void *v12;
  void *v13;
  NSObject *v14;
  unint64_t v15;
  NSObject *v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (has_internal_diagnostics)
  {
    if ((isKindOfClass & 1) == 0)
    {
      __UIFaultDebugAssertLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        v17 = 138412290;
        v18 = v9;
        _os_log_fault_impl(&dword_185066000, v14, OS_LOG_TYPE_FAULT, "Asked to place a token view somewhere we didn't expect (%@)!", (uint8_t *)&v17, 0xCu);
      }

    }
  }
  else if ((isKindOfClass & 1) == 0)
  {
    v15 = placeView_withFrame_inParentView_characterIndex_layoutManager____s_category;
    if (!placeView_withFrame_inParentView_characterIndex_layoutManager____s_category)
    {
      v15 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v15, (unint64_t *)&placeView_withFrame_inParentView_characterIndex_layoutManager____s_category);
    }
    v16 = *(NSObject **)(v15 + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = 138412290;
      v18 = v9;
      _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "Asked to place a token view somewhere we didn't expect (%@)!", (uint8_t *)&v17, 0xCu);
    }
  }
  objc_msgSend(v9, "textField");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    objc_msgSend(v12, "_willAddTokenLayoutView:", v8);

}

- (void)detachView:(id)a3 fromParentView:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_UISearchTokenAttachment;
  -[_UISearchTokenAttachment detachView:fromParentView:](&v12, sel_detachView_fromParentView_, v6, v7);
  v8 = v7;
  v9 = v8;
  if (v8)
  {
    v10 = v8;
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v10, "superview");
      v11 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v11;
      if (!v11)
        goto LABEL_7;
    }
    objc_msgSend(v10, "_didRemoveTokenLayoutView:", v6);

  }
LABEL_7:

}

- (_UISearchTokenAttachmentViewProvider)_viewProvider
{
  return self->_viewProvider;
}

- (UISearchToken)token
{
  return self->_token;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_viewProvider, 0);
}

@end
