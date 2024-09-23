@implementation SBUISystemApertureCAPackageContentProvider

- (SBUISystemApertureCAPackageContentProvider)initWithPackageName:(id)a3 inBundle:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _SBUISystemApertureCAPackageView *v10;
  _SBUISystemApertureCAPackageView *packageView;
  SBUISystemApertureCAPackageContentProvider *v12;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUISystemApertureCAPackageContentProvider.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUISystemApertureCAPackageContentProvider.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundle"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = -[BSUICAPackageView initWithPackageName:inBundle:]([_SBUISystemApertureCAPackageView alloc], "initWithPackageName:inBundle:", v7, v9);
  packageView = self->_packageView;
  self->_packageView = v10;

  v12 = -[SBUISystemApertureAspectFittingContentProvider initWithView:](self, "initWithView:", self->_packageView);
  return v12;
}

- (SBUISystemApertureCAPackageContentProvider)initWithURL:(id)a3
{
  id v5;
  _SBUISystemApertureCAPackageView *v6;
  _SBUISystemApertureCAPackageView *packageView;
  SBUISystemApertureCAPackageContentProvider *v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUISystemApertureCAPackageContentProvider.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("URL"));

  }
  v6 = -[BSUICAPackageView initWithURL:]([_SBUISystemApertureCAPackageView alloc], "initWithURL:", v5);
  packageView = self->_packageView;
  self->_packageView = v6;

  v8 = -[SBUISystemApertureAspectFittingContentProvider initWithView:](self, "initWithView:", self->_packageView);
  return v8;
}

- (CGSize)intrinsicPackageSize
{
  _SBUISystemApertureCAPackageView *packageView;
  double *p_width;
  double v4;
  double v5;
  CGSize result;

  packageView = self->_packageView;
  if (packageView)
  {
    p_width = &packageView->_intrinsicPackageSize.width;
    v4 = *p_width;
    v5 = p_width[1];
  }
  else
  {
    v5 = 0.0;
    v4 = 0.0;
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)setIntrinsicPackageSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  _SBUISystemApertureCAPackageView *packageView;
  double *p_width;
  id v11;

  height = a3.height;
  width = a3.width;
  -[SBUISystemApertureCAPackageContentProvider intrinsicPackageSize](self, "intrinsicPackageSize");
  if (width != v7 || height != v6)
  {
    packageView = self->_packageView;
    if (packageView)
    {
      p_width = &packageView->_intrinsicPackageSize.width;
      *p_width = width;
      p_width[1] = height;
    }
    -[SBUISystemApertureCustomContentProvider contentContainer](self, "contentContainer");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferredContentSizeDidInvalidateForContentViewProvider:", self);

  }
}

- (BOOL)setState:(id)a3 animated:(BOOL)a4
{
  return -[BSUICAPackageView setState:animated:](self->_packageView, "setState:animated:", a3, a4);
}

- (id)publishedObjectWithName:(id)a3
{
  return -[BSUICAPackageView publishedObjectWithName:](self->_packageView, "publishedObjectWithName:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packageView, 0);
}

@end
