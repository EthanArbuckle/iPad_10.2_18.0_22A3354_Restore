@implementation SectionHeaderBasicOutlineCellModel

- (void)_addAccessoryModels:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *accessoryModels;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_accessoryModels)
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrayByAddingObjectsFromArray:"));
  else
    v5 = (NSArray *)v4;
  accessoryModels = self->_accessoryModels;
  self->_accessoryModels = v5;

}

- (SectionHeaderBasicOutlineCellModel)initWithTitle:(id)a3
{
  id v4;
  SectionHeaderBasicOutlineCellModel *v5;
  NSString *v6;
  NSString *title;
  SectionHeaderOutlineCellAccessoryModel *v8;
  void *v9;
  objc_super v11;
  SectionHeaderOutlineCellAccessoryModel *v12;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SectionHeaderBasicOutlineCellModel;
  v5 = -[SectionHeaderBasicOutlineCellModel init](&v11, "init");
  if (v5)
  {
    v6 = (NSString *)objc_msgSend(v4, "copy");
    title = v5->_title;
    v5->_title = v6;

    v8 = -[SectionHeaderOutlineCellAccessoryModel initWithAccessoryType:visibility:delegate:]([SectionHeaderOutlineCellAccessoryModel alloc], "initWithAccessoryType:visibility:delegate:", 1, 1, 0);
    v12 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    -[SectionHeaderBasicOutlineCellModel _addAccessoryModels:](v5, "_addAccessoryModels:", v9);

  }
  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_title, "hash");
}

- (BOOL)isEqual:(id)a3
{
  SectionHeaderBasicOutlineCellModel *v4;
  SectionHeaderBasicOutlineCellModel *v5;
  uint64_t v6;
  SectionHeaderBasicOutlineCellModel *v7;
  NSString *v8;
  NSString *v9;
  NSArray *v10;
  NSArray *v11;
  unsigned __int8 v12;

  v4 = (SectionHeaderBasicOutlineCellModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v8 = (NSString *)objc_claimAutoreleasedReturnValue(-[SectionHeaderBasicOutlineCellModel title](v7, "title"));
    v9 = v8;
    if (v8 == self->_title || -[NSString isEqual:](v8, "isEqual:"))
    {
      v10 = (NSArray *)objc_claimAutoreleasedReturnValue(-[SectionHeaderBasicOutlineCellModel accessoryModels](v7, "accessoryModels"));
      v11 = v10;
      if (v10 == self->_accessoryModels)
        v12 = 1;
      else
        v12 = -[NSArray isEqual:](v10, "isEqual:");

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

- (UICollectionViewCellRegistration)cellRegistration
{
  return (UICollectionViewCellRegistration *)+[SectionHeaderOutlineCellRegistration sharedRegistration](SectionHeaderOutlineCellRegistration, "sharedRegistration");
}

- (BOOL)needsReloadFromPreviousViewModel:(id)a3
{
  return !-[SectionHeaderBasicOutlineCellModel isEqual:](self, "isEqual:", a3);
}

- (NSArray)accessoryModels
{
  return self->_accessoryModels;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_accessoryModels, 0);
}

@end
