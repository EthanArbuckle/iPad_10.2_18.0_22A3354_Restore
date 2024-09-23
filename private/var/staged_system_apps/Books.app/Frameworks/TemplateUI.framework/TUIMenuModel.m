@implementation TUIMenuModel

- (TUIMenuModel)initWithTitle:(id)a3 imageModel:(id)a4 isInline:(BOOL)a5 children:(id)a6
{
  id v10;
  id v11;
  id v12;
  TUIMenuModel *v13;
  NSString *v14;
  NSString *title;
  NSArray *v16;
  NSArray *children;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)TUIMenuModel;
  v13 = -[TUIMenuModel init](&v19, "init");
  if (v13)
  {
    v14 = (NSString *)objc_msgSend(v10, "copy");
    title = v13->_title;
    v13->_title = v14;

    objc_storeStrong((id *)&v13->_imageModel, a4);
    v13->_isInline = a5;
    v16 = (NSArray *)objc_msgSend(v12, "copy");
    children = v13->_children;
    v13->_children = v16;

  }
  return v13;
}

+ (id)menuWithTitle:(id)a3 imageModel:(id)a4 isInline:(BOOL)a5 children:(id)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;
  TUIMenuModel *v12;

  v6 = a5;
  v9 = a6;
  v10 = a4;
  v11 = a3;
  v12 = -[TUIMenuModel initWithTitle:imageModel:isInline:children:]([TUIMenuModel alloc], "initWithTitle:imageModel:isInline:children:", v11, v10, v6, v9);

  return v12;
}

- (TUIMenuModel)initWithOther:(id)a3
{
  id v4;
  TUIMenuModel *v5;
  TUIMenuModel *v6;
  id WeakRetained;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIMenuModel;
  v5 = -[TUIMenuModel init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_title, *((id *)v4 + 2));
    objc_storeStrong((id *)&v6->_imageModel, *((id *)v4 + 3));
    v6->_isInline = *((_BYTE *)v4 + 9);
    objc_storeStrong((id *)&v6->_children, *((id *)v4 + 4));
    v6->_isPrimary = *((_BYTE *)v4 + 8);
    objc_storeStrong(&v6->_actionObject, *((id *)v4 + 5));
    WeakRetained = objc_loadWeakRetained((id *)v4 + 6);
    objc_storeWeak((id *)&v6->_actionDelegate, WeakRetained);

  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;

  if (self != a3)
  {
    v5 = a3;
    v6 = objc_opt_class(TUIMenuModel);
    v7 = TUIDynamicCast(v6, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  }
  return self == a3;
}

- (id)menuWithIsPrimary:(BOOL)a3 actionObject:(id)a4 actionDelegate:(id)a5
{
  id v8;
  id v9;
  TUIMenuModel *v10;
  id actionObject;

  v8 = a4;
  v9 = a5;
  v10 = -[TUIMenuModel initWithOther:]([TUIMenuModel alloc], "initWithOther:", self);
  v10->_isPrimary = a3;
  actionObject = v10->_actionObject;
  v10->_actionObject = v8;

  objc_storeWeak((id *)&v10->_actionDelegate, v9);
  return v10;
}

- (void)loadImagesFromResourceMap:(id)a3
{
  id v4;
  TUIImageModel *imageModel;
  void *v6;
  void *v7;
  TUIImageModel *v8;
  id v9;
  NSArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    imageModel = self->_imageModel;
    if (imageModel && !-[TUIImageModel isLoaded](imageModel, "isLoaded"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIImageModel identifier](self->_imageModel, "identifier"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v6));

      if (v7)
      {
        v8 = self->_imageModel;
        v9 = objc_alloc_init((Class)UIImage);
        -[TUIImageModel loadImageFromResource:placeholderImage:](v8, "loadImageFromResource:placeholderImage:", v7, v9);

      }
    }
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = self->_children;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v14), "loadImagesFromResourceMap:", v4, (_QWORD)v15);
          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }

  }
}

- (id)newUIMenuElementWithActionObject:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSArray *children;
  id v10;
  id v11;
  id v12;
  _BOOL8 isInline;
  TUIImageModel *imageModel;
  const __CFString *title;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSArray count](self->_children, "count"));
  children = self->_children;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_126448;
  v19[3] = &unk_242050;
  v20 = v6;
  v21 = v7;
  v22 = v8;
  v10 = v8;
  v11 = v7;
  v12 = v6;
  -[NSArray enumerateObjectsUsingBlock:](children, "enumerateObjectsUsingBlock:", v19);
  isInline = self->_isInline;
  imageModel = self->_imageModel;
  if (self->_title)
    title = (const __CFString *)self->_title;
  else
    title = &stru_243BF0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUIImageModel image](imageModel, "image"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", title, v16, 0, isInline, v10));

  return v17;
}

- (id)newUIMenuElement
{
  id actionObject;
  id WeakRetained;
  id v5;

  actionObject = self->_actionObject;
  WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);
  v5 = -[TUIMenuModel newUIMenuElementWithActionObject:delegate:](self, "newUIMenuElementWithActionObject:delegate:", actionObject, WeakRetained);

  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (TUIImageModel)imageModel
{
  return self->_imageModel;
}

- (NSArray)children
{
  return self->_children;
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (BOOL)isInline
{
  return self->_isInline;
}

- (id)actionObject
{
  return self->_actionObject;
}

- (TUIActionHandlerDelegate)actionDelegate
{
  return (TUIActionHandlerDelegate *)objc_loadWeakRetained((id *)&self->_actionDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong(&self->_actionObject, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_imageModel, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
