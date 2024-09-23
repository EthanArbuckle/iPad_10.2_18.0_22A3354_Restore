@implementation _WGCAPackageView

+ (void)loadPackageViewWithContentsOfURL:(id)a3 publishedObjectViewClassMap:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  objc_super v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v11[1] = 3221225472;
  v11[2] = __92___WGCAPackageView_loadPackageViewWithContentsOfURL_publishedObjectViewClassMap_completion___block_invoke;
  v11[3] = &unk_24D732350;
  v12 = a3;
  v13 = a5;
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS____WGCAPackageView;
  v11[0] = MEMORY[0x24BDAC760];
  v8 = v13;
  v9 = v12;
  objc_msgSendSuper2(&v10, sel_loadPackageViewWithContentsOfURL_publishedObjectViewClassMap_completion_, v9, a4, v11);

}

- (NSString)snapshotIdentifier
{
  void *v2;
  void *v3;

  -[NSURL lastPathComponent](self->_archiveURL, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByDeletingPathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)_supportsPushingBottomCornerRadiusToSubviews:(double)a3
{
  _WGCAPackageView *v4;
  _QWORD v6[5];
  id v7[2];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  id location;

  v4 = self;
  objc_initWeak(&location, self);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65___WGCAPackageView__supportsPushingBottomCornerRadiusToSubviews___block_invoke;
  v6[3] = &unk_24D732378;
  v6[4] = &v8;
  objc_copyWeak(v7, &location);
  v7[1] = *(id *)&a3;
  -[UIView wg_walkSubviewTreeWithBlock:](v4, "wg_walkSubviewTreeWithBlock:", v6);
  LOBYTE(v4) = *((_BYTE *)v9 + 24);
  objc_destroyWeak(v7);
  _Block_object_dispose(&v8, 8);
  objc_destroyWeak(&location);
  return (char)v4;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  objc_super v5;
  _QWORD v6[4];
  id v7[2];
  id location;

  if ((_WGSupportsMetal() & 1) != 0
    || !-[_WGCAPackageView _supportsPushingBottomCornerRadiusToSubviews:](self, "_supportsPushingBottomCornerRadiusToSubviews:", a3))
  {
    v5.receiver = self;
    v5.super_class = (Class)_WGCAPackageView;
    -[_WGCAPackageView _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_, a3);
  }
  else
  {
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __47___WGCAPackageView__setContinuousCornerRadius___block_invoke;
    v6[3] = &unk_24D7323A0;
    objc_copyWeak(v7, &location);
    v7[1] = *(id *)&a3;
    -[UIView wg_walkSubviewTreeWithBlock:](self, "wg_walkSubviewTreeWithBlock:", v6);
    objc_destroyWeak(v7);
    objc_destroyWeak(&location);
  }
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[_WGCAPackageView archiveURL](self, "archiveURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; archiveURL = %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSURL)archiveURL
{
  return self->_archiveURL;
}

- (void)setArchiveURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archiveURL, 0);
}

@end
