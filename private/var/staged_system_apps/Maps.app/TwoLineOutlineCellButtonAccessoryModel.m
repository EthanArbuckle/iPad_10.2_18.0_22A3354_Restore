@implementation TwoLineOutlineCellButtonAccessoryModel

- (TwoLineOutlineCellButtonAccessoryModel)initWithAccessoryType:(int64_t)a3 visibility:(int64_t)a4 delegate:(id)a5
{
  id v8;
  TwoLineOutlineCellButtonAccessoryModel *v9;
  TwoLineOutlineCellButtonAccessoryModel *v10;
  objc_super v12;

  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)TwoLineOutlineCellButtonAccessoryModel;
  v9 = -[TwoLineOutlineCellButtonAccessoryModel init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    v9->_accessoryType = a3;
    v9->_visibility = a4;
    objc_storeWeak((id *)&v9->_delegate, v8);
  }

  return v10;
}

- (unint64_t)hash
{
  return self->_visibility ^ self->_accessoryType;
}

- (BOOL)isEqual:(id)a3
{
  TwoLineOutlineCellButtonAccessoryModel *v4;
  TwoLineOutlineCellButtonAccessoryModel *v5;
  uint64_t v6;
  TwoLineOutlineCellButtonAccessoryModel *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;

  v4 = (TwoLineOutlineCellButtonAccessoryModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v8 = -[TwoLineOutlineCellButtonAccessoryModel accessoryType](v7, "accessoryType");
    if (v8 == (id)-[TwoLineOutlineCellButtonAccessoryModel accessoryType](self, "accessoryType")
      && (v9 = -[TwoLineOutlineCellButtonAccessoryModel visibility](v7, "visibility"),
          v9 == (id)-[TwoLineOutlineCellButtonAccessoryModel visibility](self, "visibility")))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLineOutlineCellButtonAccessoryModel delegate](v7, "delegate"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLineOutlineCellButtonAccessoryModel delegate](self, "delegate"));
      if (v10 == v11)
        v12 = 1;
      else
        v12 = objc_msgSend(v10, "isEqual:", v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)createAccessoryConfigurationWithAction:(id)a3
{
  id v4;
  int64_t accessoryType;
  void *v6;
  void *v7;
  UIImageSymbolConfiguration *v8;
  void *v9;
  UIColor *v10;
  void *v11;
  id v12;
  UIImageSymbolConfiguration *v13;
  void *v14;

  v4 = a3;
  accessoryType = self->_accessoryType;
  if (accessoryType == 2)
  {
    v12 = objc_msgSend(objc_alloc((Class)_UICellAccessoryConfigurationOutlineDisclosure), "initWithCellSelectionTogglesExpansionState:", 0);
    v13 = sub_10094EC40();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("chevron.forward.circle.fill"), v6));
    objc_msgSend(v12, "setImage:", v14);

  }
  else
  {
    if (accessoryType != 1)
    {
      v12 = 0;
      goto LABEL_7;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MapsThemeButton buttonWithType:](MapsThemeButton, "buttonWithType:", 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("info.circle.fill")));
    objc_msgSend(v6, "setImage:forState:", v7, 0);

    v8 = sub_10094EC40();
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v6, "setPreferredSymbolConfiguration:forImageInState:", v9, 0);

    objc_msgSend(v6, "addAction:forControlEvents:", v4, 0x2000);
    v10 = sub_10094ECBC();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v6, "setTintColor:", v11);

    objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("DetailButton"));
    v12 = objc_msgSend(objc_alloc((Class)_UICellAccessoryConfigurationCustomView), "initWithCustomView:", v6);
  }

LABEL_7:
  return v12;
}

- (int64_t)visibility
{
  return self->_visibility;
}

- (TwoLinesOutlineCellAccessoryDelegate)delegate
{
  return (TwoLinesOutlineCellAccessoryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (int64_t)accessoryType
{
  return self->_accessoryType;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
