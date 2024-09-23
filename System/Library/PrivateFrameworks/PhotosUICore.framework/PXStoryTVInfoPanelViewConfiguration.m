@implementation PXStoryTVInfoPanelViewConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[PXStoryTVInfoPanelViewConfiguration viewModel](self, "viewModel");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PXStoryTVInfoPanelViewConfiguration viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PXStoryTVInfoPanelViewConfiguration *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (PXStoryTVInfoPanelViewConfiguration *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PXStoryTVInfoPanelViewConfiguration viewModel](v4, "viewModel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryTVInfoPanelViewConfiguration viewModel](self, "viewModel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 == v6)
        v7 = 1;
      else
        v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
