@implementation _UIDocumentUnavailableConfiguration

- (id)initWithBrowserViewController:(void *)a1
{
  id *v3;
  id *v4;
  uint64_t v5;
  id v6;
  objc_super v8;

  if (!a1)
    return 0;
  v8.receiver = a1;
  v8.super_class = (Class)_UIDocumentUnavailableConfiguration;
  v3 = (id *)objc_msgSendSuper2(&v8, sel_init);
  v4 = v3;
  if (v3)
  {
    objc_storeStrong(v3 + 6, a2);
    +[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v4[11];
    v4[11] = (id)v5;

  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  char isKindOfClass;
  int v6;
  void *v8;
  NSURL *v9;
  NSURL *v10;
  NSURL *v11;
  void *v12;
  NSURL *v13;
  void *v14;
  NSURL *v15;
  void *v16;
  NSURL *v17;
  void *v18;
  NSURL *v19;
  void *v20;
  NSURL *v21;
  void *v22;
  NSURL *v23;

  if (a3 == self)
  {
    LOBYTE(v6) = 1;
    return v6;
  }
  if (!a3)
    goto LABEL_11;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  LOBYTE(v6) = 0;
  if (self && (isKindOfClass & 1) != 0)
  {
    if (self->_enabled != *((unsigned __int8 *)a3 + 8)
      || self->_documentState != *((_QWORD *)a3 + 4)
      || self->_browserViewController != (UIViewController *)*((_QWORD *)a3 + 6)
      || self->_documentTargetView != (UIView *)*((_QWORD *)a3 + 10)
      || self->_foregroundAccessoryView != (UIView *)*((_QWORD *)a3 + 12)
      || self->_backgroundAccessoryView != (UIView *)*((_QWORD *)a3 + 13))
    {
LABEL_11:
      LOBYTE(v6) = 0;
      return v6;
    }
    v8 = (void *)*((_QWORD *)a3 + 5);
    v9 = self->_documentCreationIntent;
    v10 = v8;
    if (v9 == v10)
    {

    }
    else
    {
      v11 = v10;
      LOBYTE(v6) = 0;
      if (!v9 || !v10)
        goto LABEL_55;
      v6 = -[NSURL isEqual:](v9, "isEqual:", v10);

      if (!v6)
        return v6;
    }
    v12 = (void *)*((_QWORD *)a3 + 7);
    v9 = self->_title;
    v13 = v12;
    if (v9 == v13)
    {

    }
    else
    {
      v11 = v13;
      LOBYTE(v6) = 0;
      if (!v9 || !v13)
        goto LABEL_55;
      v6 = -[NSURL isEqual:](v9, "isEqual:", v13);

      if (!v6)
        return v6;
    }
    v14 = (void *)*((_QWORD *)a3 + 3);
    v9 = self->_documentURL;
    v15 = v14;
    if (v9 == v15)
    {

    }
    else
    {
      v11 = v15;
      LOBYTE(v6) = 0;
      if (!v9 || !v15)
        goto LABEL_55;
      v6 = -[NSURL isEqual:](v9, "isEqual:", v15);

      if (!v6)
        return v6;
    }
    v16 = (void *)*((_QWORD *)a3 + 8);
    v9 = self->_primaryAction;
    v17 = v16;
    if (v9 == v17)
    {

    }
    else
    {
      v11 = v17;
      LOBYTE(v6) = 0;
      if (!v9 || !v17)
        goto LABEL_55;
      v6 = -[NSURL isEqual:](v9, "isEqual:", v17);

      if (!v6)
        return v6;
    }
    v18 = (void *)*((_QWORD *)a3 + 9);
    v9 = self->_secondaryAction;
    v19 = v18;
    if (v9 == v19)
    {

    }
    else
    {
      v11 = v19;
      LOBYTE(v6) = 0;
      if (!v9 || !v19)
        goto LABEL_55;
      v6 = -[NSURL isEqual:](v9, "isEqual:", v19);

      if (!v6)
        return v6;
    }
    v20 = (void *)*((_QWORD *)a3 + 2);
    v9 = self->_secondaryMenu;
    v21 = v20;
    if (v9 == v21)
    {

LABEL_50:
      v22 = (void *)*((_QWORD *)a3 + 11);
      v9 = self->_background;
      v23 = v22;
      v11 = v23;
      if (v9 == v23)
      {
        LOBYTE(v6) = 1;
      }
      else
      {
        LOBYTE(v6) = 0;
        if (v9 && v23)
          LOBYTE(v6) = -[NSURL isEqual:](v9, "isEqual:", v23);
      }
      goto LABEL_55;
    }
    v11 = v21;
    LOBYTE(v6) = 0;
    if (v9 && v21)
    {
      v6 = -[NSURL isEqual:](v9, "isEqual:", v21);

      if (!v6)
        return v6;
      goto LABEL_50;
    }
LABEL_55:

  }
  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[UIViewController hash](self->_browserViewController, "hash");
  v4 = -[NSString hash](self->_title, "hash") ^ v3;
  v5 = -[UIAction hash](self->_primaryAction, "hash");
  v6 = v4 ^ v5 ^ -[UIAction hash](self->_secondaryAction, "hash");
  return v6 ^ -[UIBackgroundConfiguration hash](self->_background, "hash");
}

- (void)_setSecondaryMenu:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (a1)
  {
    objc_msgSend(a2, "children");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _UIMenuReplacingElementMatchingPredicate(v4, &__block_literal_global_321, &__block_literal_global_4_8);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a2, "menuByReplacingChildren:", v7);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v5;

  }
}

+ (id)createDocumentActionWithIntent:(uint64_t)a1
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  v3 = objc_opt_self();
  if (!objc_msgSend(a2, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel_createDocumentActionWithIntent_, v3, CFSTR("_UIDocumentUnavailableConfiguration.m"), 128, CFSTR("UIDocumentCreationIntent should have a non-zero length"));

  }
  _UILocalizedString(CFSTR("com.apple.documents.create.action"), (uint64_t)CFSTR("The title of the button that creates a new document."), CFSTR("Create Document"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("com.apple.documents.action.create.document."), "stringByAppendingString:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v4, 0, v5, &__block_literal_global_20_4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setDocumentTargetView:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 80), a2);
}

- (void)setBackgroundAccessoryView:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 104), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundAccessoryView, 0);
  objc_storeStrong((id *)&self->_foregroundAccessoryView, 0);
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_documentTargetView, 0);
  objc_storeStrong((id *)&self->_secondaryAction, 0);
  objc_storeStrong((id *)&self->_primaryAction, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_browserViewController, 0);
  objc_storeStrong((id *)&self->_documentCreationIntent, 0);
  objc_storeStrong((id *)&self->_documentURL, 0);
  objc_storeStrong((id *)&self->_secondaryMenu, 0);
}

@end
