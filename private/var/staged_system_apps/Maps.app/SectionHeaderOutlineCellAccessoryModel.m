@implementation SectionHeaderOutlineCellAccessoryModel

- (SectionHeaderOutlineCellAccessoryModel)initWithAccessoryType:(int64_t)a3 visibility:(int64_t)a4 delegate:(id)a5
{
  id v8;
  SectionHeaderOutlineCellAccessoryModel *v9;
  SectionHeaderOutlineCellAccessoryModel *v10;
  objc_super v12;

  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)SectionHeaderOutlineCellAccessoryModel;
  v9 = -[SectionHeaderOutlineCellAccessoryModel init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    v9->_visibility = a4;
    v9->_accessoryType = a3;
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
  SectionHeaderOutlineCellAccessoryModel *v4;
  SectionHeaderOutlineCellAccessoryModel *v5;
  uint64_t v6;
  SectionHeaderOutlineCellAccessoryModel *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;

  v4 = (SectionHeaderOutlineCellAccessoryModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v8 = -[SectionHeaderOutlineCellAccessoryModel accessoryType](v7, "accessoryType");
    if (v8 == (id)-[SectionHeaderOutlineCellAccessoryModel accessoryType](self, "accessoryType")
      && (v9 = -[SectionHeaderOutlineCellAccessoryModel visibility](v7, "visibility"),
          v9 == (id)-[SectionHeaderOutlineCellAccessoryModel visibility](self, "visibility")))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderOutlineCellAccessoryModel delegate](v7, "delegate"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderOutlineCellAccessoryModel delegate](self, "delegate"));
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

- (id)createAccessoryConfigurationWithActionHandler:(id)a3
{
  id v4;
  int64_t accessoryType;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  accessoryType = self->_accessoryType;
  if (accessoryType == 1)
  {
    v6 = objc_msgSend(objc_alloc((Class)_UICellAccessoryConfigurationOutlineDisclosure), "initWithCellSelectionTogglesExpansionState:", 0);
    v7 = sub_10094EC58();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_msgSend(v6, "setImage:", v8);

  }
  else
  {
    if (accessoryType != 2)
    {
      v6 = 0;
      goto LABEL_7;
    }
    v6 = objc_alloc_init((Class)_UICellAccessoryConfigurationInsert);
    objc_msgSend(v6, "setActionHandler:", v4);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
  objc_msgSend(v6, "setTintColor:", v9);

LABEL_7:
  return v6;
}

- (int64_t)visibility
{
  return self->_visibility;
}

- (int64_t)accessoryType
{
  return self->_accessoryType;
}

- (SectionHeaderOutlineCellAccessoryDelegate)delegate
{
  return (SectionHeaderOutlineCellAccessoryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
