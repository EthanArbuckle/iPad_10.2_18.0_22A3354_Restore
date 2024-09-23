@implementation THFlowTOCCatalystEnvironment

- (THFlowTOCCatalystEnvironment)initWithContext:(id)a3
{
  id v4;
  THFlowTOCCatalystEnvironment *v5;
  THFlowTOCCatalystEnvironment *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)THFlowTOCCatalystEnvironment;
  v5 = -[THFlowTOCCatalystEnvironment init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_context, v4);

  return v6;
}

- (CGRect)im_frameEnvironmentBounds
{
  UIViewController **p_context;
  id WeakRetained;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  p_context = &self->_context;
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  if ((objc_msgSend(WeakRetained, "isViewLoaded") & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)p_context);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

  }
  else
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v4, "bounds");
    v7 = v14;
    v9 = v15;
    v11 = v16;
    v13 = v17;
  }

  v18 = v7;
  v19 = v9;
  v20 = v11;
  v21 = v13;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)im_frameEnvironmentFrame
{
  UIViewController **p_context;
  id WeakRetained;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  p_context = &self->_context;
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  if ((objc_msgSend(WeakRetained, "isViewLoaded") & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)p_context);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
    objc_msgSend(v5, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

  }
  else
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v4, "bounds");
    v7 = v14;
    v9 = v15;
    v11 = v16;
    v13 = v17;
  }

  v18 = v7;
  v19 = v9;
  v20 = v11;
  v21 = v13;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (UIEdgeInsets)im_frameEnvironmentSafeAreaInsets
{
  UIViewController **p_context;
  id WeakRetained;
  id v4;
  void *v5;
  double v6;
  CGFloat top;
  double v8;
  CGFloat left;
  double v10;
  CGFloat bottom;
  double v12;
  CGFloat right;
  double v14;
  double v15;
  double v16;
  double v17;
  UIEdgeInsets result;

  p_context = &self->_context;
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  if ((objc_msgSend(WeakRetained, "isViewLoaded") & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)p_context);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
    objc_msgSend(v5, "safeAreaInsets");
    top = v6;
    left = v8;
    bottom = v10;
    right = v12;

  }
  else
  {
    top = UIEdgeInsetsZero.top;
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
  }

  v14 = top;
  v15 = left;
  v16 = bottom;
  v17 = right;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (UITraitCollection)traitCollection
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "traitCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "traitCollectionByModifyingTraits:", &stru_429040));

  return (UITraitCollection *)v4;
}

- (UIViewController)context
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_context);
}

- (void)setContext:(id)a3
{
  objc_storeWeak((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_context);
}

@end
