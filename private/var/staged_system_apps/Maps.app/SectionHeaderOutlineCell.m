@implementation SectionHeaderOutlineCell

- (void)setCellModel:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  SectionHeaderOutlineCellModel *v8;
  unsigned __int8 v9;
  SectionHeaderOutlineCellModel *v10;

  v10 = (SectionHeaderOutlineCellModel *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderOutlineCellModel accessoryModels](v10, "accessoryModels"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderOutlineCellModel accessoryModels](self->_cellModel, "accessoryModels"));
  if (v5 == v6)
    v7 = 0;
  else
    v7 = objc_msgSend(v5, "isEqual:", v6) ^ 1;

  v8 = v10;
  if (self->_cellModel != v10)
  {
    v9 = -[SectionHeaderOutlineCellModel isEqual:](v10, "isEqual:");
    v8 = v10;
    if ((v9 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_cellModel, a3);
      -[SectionHeaderOutlineCell _updateFromModel:](self, "_updateFromModel:", v7);
      v8 = v10;
    }
  }

}

- (void)_updateFromModel:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  void *v7;
  void *v8;
  __CFString *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration sidebarHeaderConfiguration](UIListContentConfiguration, "sidebarHeaderConfiguration"));
  objc_msgSend(v14, "directionalLayoutMargins");
  v6 = v5;
  objc_msgSend(v14, "directionalLayoutMargins");
  objc_msgSend(v14, "setDirectionalLayoutMargins:", v6, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderOutlineCellModel title](self->_cellModel, "title"));
  objc_msgSend(v14, "setText:", v7);

  -[SectionHeaderOutlineCell setContentConfiguration:](self, "setContentConfiguration:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SidebarOutlineCell axSectionIdentifier](self, "axSectionIdentifier"));
  if (objc_msgSend(v8, "length"))
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SidebarOutlineCell axSectionIdentifier](self, "axSectionIdentifier"));
  else
    v9 = &stru_1011EB268;

  v10 = (objc_class *)objc_opt_class(self);
  v11 = NSStringFromClass(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v9, "stringByAppendingString:", v12));
  -[SectionHeaderOutlineCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v13);

  if (v3)
    -[SectionHeaderOutlineCell _updateAccessoryConfigurations](self, "_updateAccessoryConfigurations");

}

- (void)setHovering:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SectionHeaderOutlineCell;
  -[SidebarOutlineCell setHovering:](&v4, "setHovering:", a3);
  -[SectionHeaderOutlineCell _updateAccessoryConfigurations](self, "_updateAccessoryConfigurations");
}

- (void)_updateAccessoryConfigurations
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id location;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderOutlineCellModel accessoryModels](self->_cellModel, "accessoryModels"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v9 = objc_msgSend(v8, "visibility");
        if (!v9 || v9 == (id)1 && -[SidebarOutlineCell isHovering](self, "isHovering"))
        {
          v10 = objc_msgSend(v8, "accessoryType");
          if (v10 == (id)2)
          {
            objc_initWeak(&location, self);
            v12[0] = _NSConcreteStackBlock;
            v12[1] = 3221225472;
            v12[2] = sub_10098BA70;
            v12[3] = &unk_1011AD1E8;
            objc_copyWeak(&v13, &location);
            v12[4] = v8;
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "createAccessoryConfigurationWithActionHandler:", v12));
            objc_destroyWeak(&v13);
            objc_destroyWeak(&location);
          }
          else
          {
            if (v10 != (id)1)
              continue;
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "createAccessoryConfigurationWithActionHandler:", 0));
          }
          if (v11)
          {
            objc_msgSend(v3, "addObject:", v11);

          }
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  -[SectionHeaderOutlineCell setTrailingAccessoryConfigurations:](self, "setTrailingAccessoryConfigurations:", v3);
}

- (void)_accessoryButtonTapped:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
  v5 = objc_msgSend(v4, "accessoryType");

  objc_msgSend(v6, "sectionHeaderOutlineCell:accessoryTypeTapped:", self, v5);
}

- (SectionHeaderOutlineCellModel)cellModel
{
  return self->_cellModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellModel, 0);
}

@end
