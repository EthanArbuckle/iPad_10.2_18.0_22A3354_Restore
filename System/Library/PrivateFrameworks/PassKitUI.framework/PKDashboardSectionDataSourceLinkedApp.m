@implementation PKDashboardSectionDataSourceLinkedApp

- (PKDashboardSectionDataSourceLinkedApp)initWithStoreIDs:(id)a3 applicationBundleIdentifiers:(id)a4 defaultLaunchURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKDashboardSectionDataSourceLinkedApp *v11;
  PKLinkedApplication *v12;
  PKLinkedApplication *linkedApplication;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKDashboardSectionDataSourceLinkedApp;
  v11 = -[PKDashboardSectionDataSourceLinkedApp init](&v15, sel_init);
  if (v11)
  {
    if (objc_msgSend(v8, "count") || objc_msgSend(v9, "count"))
    {
      v12 = -[PKLinkedApplication initWithApplicationIdentifiers:storeIDs:defaultLaunchURL:]([PKLinkedApplication alloc], "initWithApplicationIdentifiers:storeIDs:defaultLaunchURL:", v9, v8, v10);
      linkedApplication = v11->_linkedApplication;
      v11->_linkedApplication = v12;

      -[PKLinkedApplication reloadApplicationStateIfNecessary](v11->_linkedApplication, "reloadApplicationStateIfNecessary");
    }
    v11->_isContentLoaded = 1;
  }

  return v11;
}

- (id)itemForSectionIdentifier:(id)a3 atIndex:(unint64_t)a4
{
  PKDashboardPassLinkedAppItem *v5;

  v5 = objc_alloc_init(PKDashboardPassLinkedAppItem);
  -[PKDashboardPassLinkedAppItem setLinkedApplication:](v5, "setLinkedApplication:", self->_linkedApplication);
  return v5;
}

- (unint64_t)numberOfItemsInSection:(id)a3
{
  return self->_isContentLoaded && self->_linkedApplication != 0;
}

- (NSArray)sectionIdentifiers
{
  return (NSArray *)&unk_1E3FAE968;
}

- (id)titleForSectionIdentifier:(id)a3
{
  return 0;
}

- (id)footerTextItemForSectionIdentifier:(id)a3
{
  return 0;
}

- (PKDashboardSectionDataSourceDelegate)delegate
{
  return (PKDashboardSectionDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isContentLoaded
{
  return self->_isContentLoaded;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_linkedApplication, 0);
}

@end
