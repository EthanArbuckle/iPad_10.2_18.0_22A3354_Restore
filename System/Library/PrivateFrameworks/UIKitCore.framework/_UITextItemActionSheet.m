@implementation _UITextItemActionSheet

- (_UITextItemActionSheet)initWithTitle:(id)a3 dataDetectorActions:(id)a4 fromRect:(CGRect)a5 inView:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  id v16;
  _UITextItemActionSheet *v17;
  _UITextItemActionSheet *v18;
  uint64_t v19;
  NSArray *ddActions;
  void *v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  objc_super v27;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v27.receiver = self;
  v27.super_class = (Class)_UITextItemActionSheet;
  v17 = -[_UITextItemActionSheet init](&v27, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_title, a3);
    v19 = objc_msgSend(v15, "copy");
    ddActions = v18->_ddActions;
    v18->_ddActions = (NSArray *)v19;

    objc_storeWeak((id *)&v18->_view, v16);
    objc_msgSend(v16, "_screen");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "scale");
    v18->_rect.origin.x = UIRectIntegralWithScale(x, y, width, height, v22);
    v18->_rect.origin.y = v23;
    v18->_rect.size.width = v24;
    v18->_rect.size.height = v25;

  }
  return v18;
}

- (void)dealloc
{
  UIWindow *alertWindow;
  objc_super v4;

  -[UIWindow setHidden:](self->_alertWindow, "setHidden:", 1);
  alertWindow = self->_alertWindow;
  self->_alertWindow = 0;

  v4.receiver = self;
  v4.super_class = (Class)_UITextItemActionSheet;
  -[_UITextItemActionSheet dealloc](&v4, sel_dealloc);
}

- (void)present
{
  _UIRotatingAlertController **p_alertController;
  id WeakRetained;
  void *v5;
  id obj;

  p_alertController = &self->_alertController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_alertController);

  if (!WeakRetained && -[_UITextItemActionSheet _hasAlertActions](self, "_hasAlertActions"))
  {
    obj = (id)objc_opt_new();
    objc_msgSend(obj, "setRotatingSheetDelegate:", self);
    objc_msgSend(obj, "setTitle:", self->_title);
    -[_UITextItemActionSheet _alertActionsWithController:](self, "_alertActionsWithController:", obj);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "_setActions:", v5);

    if (objc_msgSend(obj, "presentSheet"))
    {
      objc_storeWeak((id *)p_alertController, obj);
      objc_setAssociatedObject(obj, &present_keepalive_key, self, (void *)1);
    }

  }
}

- (BOOL)_hasAlertActions
{
  return -[NSArray count](self->_ddActions, "count") != 0;
}

- (id)_alertActionsWithController:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id val;
  NSArray *obj;
  uint64_t v17;
  id v18;
  _QWORD v19[5];
  _QWORD aBlock[5];
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id to;
  id location;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  val = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, val);
  objc_copyWeak(&to, (id *)&self->_view);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = self->_ddActions;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v4)
  {
    v17 = *(_QWORD *)v24;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v5);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __54___UITextItemActionSheet__alertActionsWithController___block_invoke;
        aBlock[3] = &unk_1E16C6E28;
        aBlock[4] = v6;
        objc_copyWeak(&v21, &to);
        objc_copyWeak(&v22, &location);
        v7 = _Block_copy(aBlock);
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __54___UITextItemActionSheet__alertActionsWithController___block_invoke_2;
        v19[3] = &unk_1E16B2268;
        v19[4] = v6;
        v8 = _Block_copy(v19);
        objc_msgSend(v6, "localizedName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "icon");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIAlertAction _actionWithTitle:image:style:handler:shouldDismissHandler:](UIAlertAction, "_actionWithTitle:image:style:handler:shouldDismissHandler:", v9, v10, 0, v7, v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "addObject:", v11);
        objc_destroyWeak(&v22);
        objc_destroyWeak(&v21);
        ++v5;
      }
      while (v4 != v5);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v4);
  }

  if (objc_msgSend(v18, "count"))
  {
    _UINSLocalizedStringWithDefaultValue(CFSTR("Cancel"), CFSTR("Cancel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v12, 1, &__block_literal_global_214);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "addObject:", v13);
  }
  objc_destroyWeak(&to);
  objc_destroyWeak(&location);

  return v18;
}

- (id)hostViewForSheet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  UIWindow *WeakRetained;
  UIWindow *alertWindow;
  _UIAlertControllerShimPresenterWindow *v10;
  id v11;
  void *v12;
  void *v13;
  UIWindow *v14;
  UIWindow *v15;
  UIWindow *v16;

  v4 = a3;
  objc_msgSend(v4, "popoverPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (objc_msgSend(v4, "presentationController"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "presentationStyle"),
        v6,
        v7 == 7)
    || (dyld_program_sdk_at_least() & 1) != 0)
  {
    WeakRetained = (UIWindow *)objc_loadWeakRetained((id *)&self->_view);
  }
  else
  {
    alertWindow = self->_alertWindow;
    if (!alertWindow)
    {
      v10 = [_UIAlertControllerShimPresenterWindow alloc];
      v11 = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(v11, "window");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "windowScene");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[_UIAlertControllerShimPresenterWindow initWithWindowScene:](v10, "initWithWindowScene:", v13);
      v15 = self->_alertWindow;
      self->_alertWindow = v14;

      -[UIWindow setHidden:](self->_alertWindow, "setHidden:", 0);
      alertWindow = self->_alertWindow;
    }
    -[UIWindow setWindowLevel:](alertWindow, "setWindowLevel:", 10000002.0);
    WeakRetained = self->_alertWindow;
  }
  v16 = WeakRetained;

  return v16;
}

- (CGRect)initialPresentationRectInHostViewForSheet:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)presentationRectInHostViewForSheet:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertWindow, 0);
  objc_destroyWeak((id *)&self->_alertController);
  objc_storeStrong((id *)&self->_ddActions, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
