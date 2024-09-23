@implementation TUIMenuContainer

- (TUIMenuContainer)initWithTitle:(id)a3 imageModel:(id)a4 isInline:(BOOL)a5
{
  id v8;
  id v9;
  TUIMenuContainer *v10;
  NSString *v11;
  NSString *title;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TUIMenuContainer;
  v10 = -[TUIMenuContainer init](&v14, "init");
  if (v10)
  {
    v11 = (NSString *)objc_msgSend(v8, "copy");
    title = v10->_title;
    v10->_title = v11;

    objc_storeStrong((id *)&v10->_imageModel, a4);
    v10->_isInline = a5;
  }

  return v10;
}

- (id)imageModelsToLoad
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[TUIMenuContainer appendObjectsWithProtocol:toArray:](self, "appendObjectsWithProtocol:toArray:", &OBJC_PROTOCOL___TUIImageModel, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_242090));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filteredArrayUsingPredicate:", v4));

  return v5;
}

- (unint64_t)modelKind
{
  return 2;
}

- (void)updateModelChildren:(id)a3
{
  NSArray *children;
  id v5;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  _QWORD v9[5];

  children = self->_children;
  v5 = a3;
  -[NSArray enumerateObjectsUsingBlock:](children, "enumerateObjectsUsingBlock:", &stru_2420B0);
  v6 = (NSArray *)objc_msgSend(v5, "copy");

  v7 = self->_children;
  self->_children = v6;

  v8 = self->_children;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1267B8;
  v9[3] = &unk_23DA88;
  v9[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](v8, "enumerateObjectsUsingBlock:", v9);
  -[TUIMenuContainer onContainedModelsChanged](self, "onContainedModelsChanged");
}

- (void)onContainedModelsChanged
{
  NSMutableArray *v3;
  NSArray *children;
  TUIMenuModel *v5;
  TUIMenuModel *menuModel;
  id WeakRetained;
  NSMutableArray *v8;
  _QWORD v9[4];
  NSMutableArray *v10;

  v3 = objc_opt_new(NSMutableArray);
  children = self->_children;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_126884;
  v9[3] = &unk_23DA88;
  v10 = v3;
  v8 = v3;
  -[NSArray enumerateObjectsUsingBlock:](children, "enumerateObjectsUsingBlock:", v9);
  v5 = (TUIMenuModel *)objc_claimAutoreleasedReturnValue(+[TUIMenuModel menuWithTitle:imageModel:isInline:children:](TUIMenuModel, "menuWithTitle:imageModel:isInline:children:", self->_title, self->_imageModel, self->_isInline, v8));
  menuModel = self->_menuModel;
  self->_menuModel = v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parentModel);
  objc_msgSend(WeakRetained, "onContainedModelsChanged");

}

- (void)appendContainedChildrenToArray:(id)a3
{
  objc_msgSend(a3, "addObjectsFromArray:", self->_children);
}

- (void)appendObjectsWithProtocol:(id)a3 toArray:(id)a4
{
  __objc2_prot *v6;
  id v7;
  void *v8;
  BOOL v9;
  NSArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  id v16;
  NSObject *v17;
  __objc2_prot *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[4];
  uint64_t v24;
  _BYTE v25[128];

  v6 = (__objc2_prot *)a3;
  v7 = a4;
  v8 = v7;
  if (self->_menuModel)
    v9 = &OBJC_PROTOCOL___TUIMenuItemModel == v6;
  else
    v9 = 0;
  if (v9)
    objc_msgSend(v7, "addObject:");
  if (&OBJC_PROTOCOL___TUIImageModel == v6)
  {
    v18 = v6;
    if (self->_imageModel)
      objc_msgSend(v8, "addObject:");
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = self->_children;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v15, "appendObjectsWithProtocol:toArray:") & 1) != 0)
          {
            objc_msgSend(v15, "appendObjectsWithProtocol:toArray:", &OBJC_PROTOCOL___TUIImageModel, v8);
          }
          else
          {
            v16 = TUIDefaultLog();
            v17 = objc_claimAutoreleasedReturnValue(v16);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              sub_17EE98(v23, (uint64_t)v15, &v24, v17);

          }
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      }
      while (v12);
    }

    v6 = v18;
  }

}

- (TUIModelContaining)parentModel
{
  return (TUIModelContaining *)objc_loadWeakRetained((id *)&self->_parentModel);
}

- (void)setParentModel:(id)a3
{
  objc_storeWeak((id *)&self->_parentModel, a3);
}

- (TUIMenuModel)menuModel
{
  return self->_menuModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuModel, 0);
  objc_destroyWeak((id *)&self->_parentModel);
  objc_storeStrong((id *)&self->_imageModel, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_children, 0);
}

@end
