@implementation _UISearchTokenAttachmentViewProvider

- (_UISearchTokenAttachmentViewProvider)initWithTextAttachment:(id)a3 parentView:(id)a4 textLayoutManager:(id)a5 location:(id)a6
{
  id v10;
  _UISearchTokenAttachmentViewProvider *v11;
  _UISearchTokenAttachmentViewProvider *v12;
  objc_super v14;

  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UISearchTokenAttachmentViewProvider;
  v11 = -[NSTextAttachmentViewProvider initWithTextAttachment:parentView:textLayoutManager:location:](&v14, sel_initWithTextAttachment_parentView_textLayoutManager_location_, a3, v10, a5, a6);
  v12 = v11;
  if (v11)
    objc_storeWeak((id *)&v11->_parentView, v10);

  return v12;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _UISearchAtomView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id WeakRetained;
  _UISearchTokenLayoutView *v18;
  id v19;
  CGRect v20;

  -[NSTextAttachmentViewProvider textLayoutManager](self, "textLayoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textContentManager");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v19;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "attributedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSTextAttachmentViewProvider layoutManager](self, "layoutManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E1678D90, -[NSTextAttachmentViewProvider characterIndex](self, "characterIndex"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(_UISearchAtomView);
  -[NSTextAttachmentViewProvider textAttachment](self, "textAttachment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "token");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISearchAtomView textLabel](v10, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v13);

  objc_msgSend(v12, "image");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISearchAtomView leadingImage](v10, "leadingImage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setImage:", v15);

  -[_UISearchAtomView setAtomFont:](v10, "setAtomFont:", v9);
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentView);
  objc_msgSend(WeakRetained, "bounds");
  -[_UISearchAtomView setViewportWidth:](v10, "setViewportWidth:", CGRectGetWidth(v20));

  v18 = -[_UISearchTokenLayoutView initWithDelegateView:]([_UISearchTokenLayoutView alloc], "initWithDelegateView:", v10);
  -[NSTextAttachmentViewProvider setView:](self, "setView:", v18);

}

- (BOOL)isLastAttachmentBeforeText
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[NSTextAttachmentViewProvider textLayoutManager](self, "textLayoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSTextAttachmentViewProvider location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationFromLocation:withOffset:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __66___UISearchTokenAttachmentViewProvider_isLastAttachmentBeforeText__block_invoke;
    v8[3] = &unk_1E16B7220;
    v8[4] = &v9;
    objc_msgSend(v3, "enumerateSubstringsFromLocation:options:usingBlock:", v5, 2, v8);
  }
  v6 = *((_BYTE *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v6;
}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  double y;
  double x;
  double height;
  double width;
  double v10;
  double v11;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  y = a5.y;
  x = a5.x;
  height = a4.size.height;
  width = a4.size.width;
  v10 = a4.origin.y;
  v11 = a4.origin.x;
  v13 = a3;
  -[NSTextAttachmentViewProvider view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "boundsForTextContainer:proposedLineFragment:glyphPosition:", v13, v11, v10, width, height, x, y);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v23 = v16;
  v24 = v18;
  v25 = v20;
  v26 = v22;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7
{
  double y;
  double x;
  double height;
  double width;
  double v11;
  double v12;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect result;

  y = a7.y;
  x = a7.x;
  height = a6.size.height;
  width = a6.size.width;
  v11 = a6.origin.y;
  v12 = a6.origin.x;
  v14 = a5;
  -[NSTextAttachmentViewProvider view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setIsLastSearchToken:", -[_UISearchTokenAttachmentViewProvider isLastAttachmentBeforeText](self, "isLastAttachmentBeforeText"));
  objc_msgSend(v15, "boundsForTextContainer:proposedLineFragment:glyphPosition:", v14, v12, v11, width, height, x, y);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = v17;
  v25 = v19;
  v26 = v21;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentView);
}

@end
