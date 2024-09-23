@implementation _UIPreviewActionSheetView

- (_UIPreviewActionSheetView)initWithFrame:(CGRect)a3 title:(id)a4 items:(id)a5 contentInsets:(UIEdgeInsets)a6
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  _UIPreviewActionSheetView *v19;
  _UIPreviewActionSheetView *v20;
  objc_super v22;

  right = a6.right;
  bottom = a6.bottom;
  left = a6.left;
  top = a6.top;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = a4;
  v18 = a5;
  v22.receiver = self;
  v22.super_class = (Class)_UIPreviewActionSheetView;
  v19 = -[UIView initWithFrame:](&v22, sel_initWithFrame_, x, y, width, height);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_actions, a5);
    objc_storeStrong((id *)&v20->_title, a4);
    v20->_contentInsets.top = top;
    v20->_contentInsets.left = left;
    v20->_contentInsets.bottom = bottom;
    v20->_contentInsets.right = right;
    -[_UIPreviewActionSheetView _setupViewHierarchy](v20, "_setupViewHierarchy");
  }

  return v20;
}

- (_UIPreviewActionSheetView)initWithFrame:(CGRect)a3
{
  return -[_UIPreviewActionSheetView initWithFrame:title:items:contentInsets:](self, "initWithFrame:title:items:contentInsets:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0, 0.0, 0.0, 0.0);
}

- (_UIPreviewActionSheetView)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIPreviewActionSheetView;
  return -[UIView initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)_setupViewHierarchy
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UIInterfaceActionGroupView *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double Width;
  double v24;
  double v25;
  double v26;
  double v27;
  double Height;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v54;
  _QWORD v55[5];
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id location;
  const __CFString *v62;
  UIInterfaceActionGroupView *v63;
  _QWORD v64[6];
  _QWORD v65[6];
  _BYTE v66[128];
  uint64_t v67;
  CGRect v68;
  CGRect v69;

  v67 = *MEMORY[0x1E0C80C00];
  -[_UIPreviewActionSheetView actions](self, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_initWeak(&location, self);
    v4 = (void *)MEMORY[0x1E0C99DE8];
    -[_UIPreviewActionSheetView actions](self, "actions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    -[_UIPreviewActionSheetView actions](self, "actions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v58 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
          v11 = objc_msgSend(v10, "style");
          objc_msgSend(v10, "title");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v55[0] = MEMORY[0x1E0C809B0];
          v55[1] = 3221225472;
          v55[2] = __48___UIPreviewActionSheetView__setupViewHierarchy__block_invoke;
          v55[3] = &unk_1E16DA840;
          objc_copyWeak(&v56, &location);
          v55[4] = v10;
          +[UIInterfaceAction actionWithTitle:type:handler:](UIInterfaceAction, "actionWithTitle:type:handler:", v12, 2 * (v11 == 2), v55);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v10, "style") == 1)
            +[UIPreviewAction _checkmarkImage](UIPreviewAction, "_checkmarkImage");
          else
            objc_msgSend(v10, "image");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setTrailingImage:", v14);
          objc_msgSend(v10, "_color");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "_setTitleTextColor:", v15);

          objc_msgSend(v10, "_color");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "_setImageTintColor:", v16);

          objc_msgSend(v54, "addObject:", v13);
          objc_destroyWeak(&v56);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
      }
      while (v7);
    }

    +[UIInterfaceActionGroup actionGroupWithActions:](UIInterfaceActionGroup, "actionGroupWithActions:", v54);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[UIInterfaceActionGroupView initWithActionGroup:actionHandlerInvocationDelegate:]([UIInterfaceActionGroupView alloc], "initWithActionGroup:actionHandlerInvocationDelegate:", v17, 0);
    -[UIInterfaceActionGroupView setPresentationStyle:](v18, "setPresentationStyle:", 1);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView bounds](self, "bounds");
    -[UIInterfaceActionGroupView setFrame:](v18, "setFrame:");
    -[UIView addSubview:](self, "addSubview:", v18);
    LODWORD(v19) = 1148846080;
    LODWORD(v20) = 1132068864;
    -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v18, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", 0.0, 0.0, v19, v20);
    v22 = v21;
    -[UIView bounds](self, "bounds");
    Width = CGRectGetWidth(v68);
    -[_UIPreviewActionSheetView contentInsets](self, "contentInsets");
    v25 = v24;
    -[_UIPreviewActionSheetView contentInsets](self, "contentInsets");
    v27 = v26;
    -[UIView bounds](self, "bounds");
    Height = CGRectGetHeight(v69);
    -[_UIPreviewActionSheetView contentInsets](self, "contentInsets");
    v30 = v29;
    -[_UIPreviewActionSheetView contentInsets](self, "contentInsets");
    v32 = Height - (v30 + v31);
    v33 = fabs(v22);
    if (v22 < v32 && v33 > 2.22044605e-16)
      v32 = v22;
    v64[0] = CFSTR("height");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v32, v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v35;
    v64[1] = CFSTR("width");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", Width - (v25 + v27));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v65[1] = v36;
    v64[2] = CFSTR("left");
    v37 = (void *)MEMORY[0x1E0CB37E8];
    -[_UIPreviewActionSheetView contentInsets](self, "contentInsets");
    objc_msgSend(v37, "numberWithDouble:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v65[2] = v39;
    v64[3] = CFSTR("right");
    v40 = (void *)MEMORY[0x1E0CB37E8];
    -[_UIPreviewActionSheetView contentInsets](self, "contentInsets");
    objc_msgSend(v40, "numberWithDouble:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v65[3] = v42;
    v64[4] = CFSTR("top");
    v43 = (void *)MEMORY[0x1E0CB37E8];
    -[_UIPreviewActionSheetView contentInsets](self, "contentInsets");
    objc_msgSend(v43, "numberWithDouble:");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v65[4] = v44;
    v64[5] = CFSTR("bottom");
    v45 = (void *)MEMORY[0x1E0CB37E8];
    -[_UIPreviewActionSheetView contentInsets](self, "contentInsets");
    objc_msgSend(v45, "numberWithDouble:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v65[5] = v47;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 6);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v62 = CFSTR("groupView");
    v63 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(left)-[groupView(==width)]-(right)-|"), 0, v48, v49);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addObjectsFromArray:", v51);

    objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(top)-[groupView(==height)]-(bottom)-|"), 0, v48, v49);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addObjectsFromArray:", v52);

    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v50);
    objc_destroyWeak(&location);
  }
}

- (void)_performActionForPreviewAction:(id)a3 interfaceAction:(id)a4
{
  id WeakRetained;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || objc_msgSend(WeakRetained, "previewActionSheetCanSelectItem:", self))
  {
    -[_UIPreviewActionSheetView completionHandler](self, "completionHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[_UIPreviewActionSheetView completionHandler](self, "completionHandler");
      v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v7)[2](v7, v8);

    }
  }

}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (_UIPreviewActionSheetViewDelegate)delegate
{
  return (_UIPreviewActionSheetViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (UILongPressGestureRecognizer)captureTouchesRecognizer
{
  return self->_captureTouchesRecognizer;
}

- (void)setCaptureTouchesRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_captureTouchesRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureTouchesRecognizer, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
