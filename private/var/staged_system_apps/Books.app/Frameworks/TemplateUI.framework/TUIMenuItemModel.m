@implementation TUIMenuItemModel

- (TUIMenuItemModel)initWithTitle:(id)a3 imageModel:(id)a4 isEnabled:(BOOL)a5 isOn:(BOOL)a6 action:(id)a7
{
  id v12;
  id v13;
  id v14;
  TUIMenuItemModel *v15;
  NSString *v16;
  NSString *title;
  objc_super v19;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v19.receiver = self;
  v19.super_class = (Class)TUIMenuItemModel;
  v15 = -[TUIMenuItemModel init](&v19, "init");
  if (v15)
  {
    v16 = (NSString *)objc_msgSend(v12, "copy");
    title = v15->_title;
    v15->_title = v16;

    objc_storeStrong((id *)&v15->_imageModel, a4);
    v15->_isEnabled = a5;
    v15->_isOn = a6;
    objc_storeStrong((id *)&v15->_action, a7);
  }

  return v15;
}

+ (id)menuItemWithTitle:(id)a3 imageModel:(id)a4 isEnabled:(BOOL)a5 isOn:(BOOL)a6 action:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v11;
  id v12;
  id v13;
  TUIMenuItemModel *v14;

  v7 = a6;
  v8 = a5;
  v11 = a7;
  v12 = a4;
  v13 = a3;
  v14 = -[TUIMenuItemModel initWithTitle:imageModel:isEnabled:isOn:action:]([TUIMenuItemModel alloc], "initWithTitle:imageModel:isEnabled:isOn:action:", v13, v12, v8, v7, v11);

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  NSString *title;
  TUIImageModel *imageModel;
  TUIElementBehaviorArgumentsMap *action;
  unsigned __int8 v11;

  if (self == a3)
    return 1;
  v4 = a3;
  v5 = objc_opt_class(TUIMenuItemModel);
  v6 = TUIDynamicCast(v5, v4);
  v7 = objc_claimAutoreleasedReturnValue(v6);

  if (v7
    && ((title = self->_title, title == *(NSString **)(v7 + 16))
     || -[NSString isEqualToString:](title, "isEqualToString:"))
    && ((imageModel = self->_imageModel, imageModel == *(TUIImageModel **)(v7 + 24))
     || -[TUIImageModel isEqual:](imageModel, "isEqual:"))
    && self->_isEnabled == *(unsigned __int8 *)(v7 + 8)
    && self->_isOn == *(unsigned __int8 *)(v7 + 9))
  {
    action = self->_action;
    if (action == *(TUIElementBehaviorArgumentsMap **)(v7 + 32))
      v11 = 1;
    else
      v11 = -[TUIElementBehaviorArgumentsMap isEqual:](action, "isEqual:");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)loadImagesFromResourceMap:(id)a3
{
  TUIImageModel *imageModel;
  void *v5;
  void *v6;
  TUIImageModel *v7;
  id v8;
  id v9;

  v9 = a3;
  imageModel = self->_imageModel;
  if (imageModel && !-[TUIImageModel isLoaded](imageModel, "isLoaded") && objc_msgSend(v9, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIImageModel identifier](self->_imageModel, "identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v5));

    if (v6)
    {
      v7 = self->_imageModel;
      v8 = objc_alloc_init((Class)UIImage);
      -[TUIImageModel loadImageFromResource:placeholderImage:](v7, "loadImageFromResource:placeholderImage:", v6, v8);

    }
  }

}

- (id)newUIMenuElementWithActionObject:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  NSString *title;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  TUIMenuItemModel *v14;

  v6 = a3;
  v7 = a4;
  title = self->_title;
  if (title)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIImageModel image](self->_imageModel, "image"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_125DC8;
    v11[3] = &unk_242028;
    v12 = v7;
    v13 = v6;
    v14 = self;
    title = (NSString *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", title, v9, 0, v11));

    if (!self->_isEnabled)
      -[NSString setAttributes:](title, "setAttributes:", 1);
    if (self->_isOn)
      -[NSString setState:](title, "setState:", 1);

  }
  return title;
}

- (NSString)title
{
  return self->_title;
}

- (TUIImageModel)imageModel
{
  return self->_imageModel;
}

- (TUIElementBehaviorArgumentsMap)action
{
  return self->_action;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (BOOL)isOn
{
  return self->_isOn;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_imageModel, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
