@implementation PXStoryPlayButtonConfiguration

- (PXStoryPlayButtonConfiguration)initWithViewModel:(id)a3
{
  id v5;
  PXStoryPlayButtonConfiguration *v6;
  PXStoryPlayButtonConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryPlayButtonConfiguration;
  v6 = -[PXStoryPlayButtonConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_viewModel, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  id WeakRetained;

  v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithViewModel:", self->_viewModel);
  WeakRetained = objc_loadWeakRetained(&self->_target);
  objc_storeWeak((id *)(v4 + 24), WeakRetained);

  *(_QWORD *)(v4 + 32) = self->_action;
  objc_storeStrong((id *)(v4 + 16), self->_spec);
  return (id)v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PXStoryPlayButtonConfiguration viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PXStoryPlayButtonConfiguration *v4;
  PXStoryPlayButtonConfiguration *v5;
  void *v6;
  void *v7;
  const char *v8;
  char v9;
  id v11;
  id v12;
  int v13;
  void *v14;
  void *v15;

  v4 = (PXStoryPlayButtonConfiguration *)a3;
  if (self == v4)
  {
    v9 = 1;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = 0;
    goto LABEL_9;
  }
  v5 = v4;
  -[PXStoryPlayButtonConfiguration target](self, "target");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPlayButtonConfiguration target](v5, "target");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == v7)
  {
    v8 = -[PXStoryPlayButtonConfiguration action](self, "action");
    if (v8 == -[PXStoryPlayButtonConfiguration action](v5, "action"))
    {
      -[PXStoryPlayButtonConfiguration spec](self, "spec");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryPlayButtonConfiguration spec](v5, "spec");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {

      }
      else
      {
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (!v13)
        {
          v9 = 0;
LABEL_18:

          goto LABEL_6;
        }
      }
      -[PXStoryPlayButtonConfiguration viewModel](self, "viewModel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryPlayButtonConfiguration viewModel](v5, "viewModel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 == v15)
        v9 = 1;
      else
        v9 = objc_msgSend(v14, "isEqual:", v15);

      goto LABEL_18;
    }
  }
  v9 = 0;
LABEL_6:

LABEL_9:
  return v9;
}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (PXStoryPlayButtonSpec)spec
{
  return self->_spec;
}

- (void)setSpec:(id)a3
{
  objc_storeStrong((id *)&self->_spec, a3);
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak(&self->_target, a3);
}

- (SEL)action
{
  return self->_action;
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
