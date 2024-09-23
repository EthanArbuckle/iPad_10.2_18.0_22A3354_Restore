@implementation PXSharedLibraryIncludedPeopleTableViewCell

- (PXSharedLibraryIncludedPeopleTableViewCell)initWithDataSourceManager:(id)a3
{
  id v4;
  PXSharedLibraryIncludedPeopleTableViewCell *v5;
  void *v6;
  PXSharedLibraryIncludedPeopleViewController *v7;
  PXSharedLibraryIncludedPeopleViewController *includedPeopleViewController;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXSharedLibraryIncludedPeopleTableViewCell;
  v5 = -[PXSharedLibraryIncludedPeopleTableViewCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, 0, 0);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibraryIncludedPeopleTableViewCell setBackgroundColor:](v5, "setBackgroundColor:", v6);

    v7 = -[PXSharedLibraryIncludedPeopleViewController initWithDataSourceManager:]([PXSharedLibraryIncludedPeopleViewController alloc], "initWithDataSourceManager:", v4);
    includedPeopleViewController = v5->_includedPeopleViewController;
    v5->_includedPeopleViewController = v7;

  }
  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)PXSharedLibraryIncludedPeopleTableViewCell;
  -[PXSharedLibraryIncludedPeopleTableViewCell layoutSubviews](&v18, sel_layoutSubviews);
  -[PXSharedLibraryIncludedPeopleViewController view](self->_includedPeopleViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PXSharedLibraryIncludedPeopleTableViewCell addSubview:](self, "addSubview:", v3);
  v13 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v3, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryIncludedPeopleTableViewCell topAnchor](self, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  objc_msgSend(v3, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryIncludedPeopleTableViewCell trailingAnchor](self, "trailingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v5;
  objc_msgSend(v3, "bottomAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryIncludedPeopleTableViewCell bottomAnchor](self, "bottomAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v8;
  objc_msgSend(v3, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryIncludedPeopleTableViewCell leadingAnchor](self, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activateConstraints:", v12);

}

- (PXSharedLibraryIncludedPeopleDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_includedPeopleViewController, 0);
}

+ (double)heightForWidth:(double)a3 numberOfItems:(unint64_t)a4
{
  double result;

  +[PXSharedLibraryIncludedPeopleViewController heightForWidth:numberOfItems:](PXSharedLibraryIncludedPeopleViewController, "heightForWidth:numberOfItems:", a4, a3);
  return result;
}

@end
