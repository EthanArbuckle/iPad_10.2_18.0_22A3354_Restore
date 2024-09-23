@implementation SectionHeaderAddOutlineCellModel

- (SectionHeaderAddOutlineCellModel)initWithTitle:(id)a3 accessoryDelegate:(id)a4
{
  id v6;
  SectionHeaderAddOutlineCellModel *v7;
  SectionHeaderOutlineCellAccessoryModel *v8;
  void *v9;
  objc_super v11;
  SectionHeaderOutlineCellAccessoryModel *v12;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SectionHeaderAddOutlineCellModel;
  v7 = -[SectionHeaderBasicOutlineCellModel initWithTitle:](&v11, "initWithTitle:", a3);
  if (v7)
  {
    v8 = -[SectionHeaderOutlineCellAccessoryModel initWithAccessoryType:visibility:delegate:]([SectionHeaderOutlineCellAccessoryModel alloc], "initWithAccessoryType:visibility:delegate:", 2, 1, v6);
    v12 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    -[SectionHeaderBasicOutlineCellModel _addAccessoryModels:](v7, "_addAccessoryModels:", v9);

  }
  return v7;
}

@end
