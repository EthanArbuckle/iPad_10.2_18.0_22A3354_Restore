@implementation UIKBAutoFillTestArchive

- (UIKBAutoFillTestArchive)init
{
  UIKBAutoFillTestArchive *v2;
  uint64_t v3;
  NSMutableDictionary *tableViewTagToDataSource;
  UIKBAutoFillTestArchive *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIKBAutoFillTestArchive;
  v2 = -[UIKBAutoFillTestArchive init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    tableViewTagToDataSource = v2->_tableViewTagToDataSource;
    v2->_tableViewTagToDataSource = (NSMutableDictionary *)v3;

    v5 = v2;
  }

  return v2;
}

- (UIKBAutoFillTestArchive)initWithCoder:(id)a3
{
  id v4;
  UIKBAutoFillTestArchive *v5;
  uint64_t v6;
  UIView *snapshotView;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *tableViewTagToDataSource;
  void *v11;
  uint64_t v12;
  NSString *viewControllerClassName;
  void *v14;
  uint64_t v15;
  NSString *viewControllerTitle;
  uint64_t v17;
  UINavigationItem *viewControllerNavigationItem;
  uint64_t v19;
  NSString *navigationControllerClassName;
  uint64_t v21;
  NSString *presentingViewControllerClassName;
  uint64_t v23;
  UIKBAutoFillTestExpectedResult *expectedResult;
  UIKBAutoFillTestArchive *v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)UIKBAutoFillTestArchive;
  v5 = -[UIKBAutoFillTestArchive init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("snapshotView"));
    v6 = objc_claimAutoreleasedReturnValue();
    snapshotView = v5->_snapshotView;
    v5->_snapshotView = (UIView *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("tableViewTagToDataSource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "mutableCopy");
    tableViewTagToDataSource = v5->_tableViewTagToDataSource;
    v5->_tableViewTagToDataSource = (NSMutableDictionary *)v9;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("viewControllerClassName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    viewControllerClassName = v5->_viewControllerClassName;
    v5->_viewControllerClassName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("viewControllerTitle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    viewControllerTitle = v5->_viewControllerTitle;
    v5->_viewControllerTitle = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("viewControllerNavigationItem"));
    v17 = objc_claimAutoreleasedReturnValue();
    viewControllerNavigationItem = v5->_viewControllerNavigationItem;
    v5->_viewControllerNavigationItem = (UINavigationItem *)v17;

    v5->_requiresNavigationControllerNesting = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresNavigationControllerNesting"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("navigationControllerClassName"));
    v19 = objc_claimAutoreleasedReturnValue();
    navigationControllerClassName = v5->_navigationControllerClassName;
    v5->_navigationControllerClassName = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("presentingViewControllerClassName"));
    v21 = objc_claimAutoreleasedReturnValue();
    presentingViewControllerClassName = v5->_presentingViewControllerClassName;
    v5->_presentingViewControllerClassName = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("expectedResult"));
    v23 = objc_claimAutoreleasedReturnValue();
    expectedResult = v5->_expectedResult;
    v5->_expectedResult = (UIKBAutoFillTestExpectedResult *)v23;

    v25 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  UIView *snapshotView;
  id v6;

  v4 = a3;
  snapshotView = self->_snapshotView;
  v6 = v4;
  if (snapshotView)
  {
    objc_msgSend(v4, "encodeObject:forKey:", snapshotView, CFSTR("snapshotView"));
    v4 = v6;
  }
  objc_msgSend(v4, "encodeObject:forKey:", self->_tableViewTagToDataSource, CFSTR("tableViewTagToDataSource"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_viewControllerClassName, CFSTR("viewControllerClassName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_viewControllerTitle, CFSTR("viewControllerTitle"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_viewControllerNavigationItem, CFSTR("viewControllerNavigationItem"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_requiresNavigationControllerNesting, CFSTR("requiresNavigationControllerNesting"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_navigationControllerClassName, CFSTR("navigationControllerClassName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_presentingViewControllerClassName, CFSTR("presentingViewControllerClassName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_expectedResult, CFSTR("expectedResult"));

}

+ (id)autoFillTestArchiveWithData:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;

  v3 = (objc_class *)MEMORY[0x1E0CB3710];
  v4 = a3;
  v9 = 0;
  v5 = (void *)objc_msgSend([v3 alloc], "initForReadingFromData:error:", v4, &v9);

  v6 = 0;
  if (!v9)
  {
    objc_msgSend(v5, "setRequiresSecureCoding:", 0);
    objc_msgSend(v5, "decodeObjectForKey:", CFSTR("testArchive"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v7;
    else
      v6 = 0;

  }
  return v6;
}

- (id)autoFillTestArchiveData
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 0);
  objc_msgSend(v3, "encodeObject:forKey:", self, CFSTR("testArchive"));
  objc_msgSend(v3, "encodedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  void *v4;

  -[UIKBAutoFillTestArchive autoFillTestArchiveData](self, "autoFillTestArchiveData", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBAutoFillTestArchive autoFillTestArchiveWithData:](UIKBAutoFillTestArchive, "autoFillTestArchiveWithData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)tableViewDataSourceWithTag:(int64_t)a3
{
  NSMutableDictionary *tableViewTagToDataSource;
  void *v4;
  void *v5;

  tableViewTagToDataSource = self->_tableViewTagToDataSource;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](tableViewTagToDataSource, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setTableViewDataSource:(id)a3 forTableViewWithTag:(int64_t)a4
{
  NSMutableDictionary *tableViewTagToDataSource;
  void *v6;
  id v7;
  id v8;

  tableViewTagToDataSource = self->_tableViewTagToDataSource;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithInteger:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](tableViewTagToDataSource, "setObject:forKeyedSubscript:", v7, v8);

}

- (UIKBAutoFillTestExpectedResult)expectedResult
{
  return self->_expectedResult;
}

- (void)setExpectedResult:(id)a3
{
  objc_storeStrong((id *)&self->_expectedResult, a3);
}

- (UIView)snapshotView
{
  return self->_snapshotView;
}

- (void)setSnapshotView:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotView, a3);
}

- (NSString)viewControllerClassName
{
  return self->_viewControllerClassName;
}

- (void)setViewControllerClassName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)viewControllerTitle
{
  return self->_viewControllerTitle;
}

- (void)setViewControllerTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)requiresNavigationControllerNesting
{
  return self->_requiresNavigationControllerNesting;
}

- (void)setRequiresNavigationControllerNesting:(BOOL)a3
{
  self->_requiresNavigationControllerNesting = a3;
}

- (NSString)navigationControllerClassName
{
  return self->_navigationControllerClassName;
}

- (void)setNavigationControllerClassName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)presentingViewControllerClassName
{
  return self->_presentingViewControllerClassName;
}

- (void)setPresentingViewControllerClassName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (UINavigationItem)viewControllerNavigationItem
{
  return self->_viewControllerNavigationItem;
}

- (void)setViewControllerNavigationItem:(id)a3
{
  objc_storeStrong((id *)&self->_viewControllerNavigationItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllerNavigationItem, 0);
  objc_storeStrong((id *)&self->_presentingViewControllerClassName, 0);
  objc_storeStrong((id *)&self->_navigationControllerClassName, 0);
  objc_storeStrong((id *)&self->_viewControllerTitle, 0);
  objc_storeStrong((id *)&self->_viewControllerClassName, 0);
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_expectedResult, 0);
  objc_storeStrong((id *)&self->_tableViewTagToDataSource, 0);
}

@end
