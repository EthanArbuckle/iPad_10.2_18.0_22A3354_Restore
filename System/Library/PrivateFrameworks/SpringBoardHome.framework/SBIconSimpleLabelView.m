@implementation SBIconSimpleLabelView

- (void)updateIconLabelWithSettings:(id)a3 imageParameters:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (v5)
  {
    -[SBIconSimpleLabelView image](self, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v6 || (objc_msgSend(v7, "isEqual:", v5) & 1) == 0)
    {
      -[SBIconSimpleLabelView iconView](self, "iconView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "labelImageWithParameters:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
      -[SBIconSimpleLabelView setImage:](self, "setImage:", v11);

    }
    if (objc_msgSend(v5, "isColorspaceGrayscale"))
    {
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E60]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "textColor");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v12, "setValue:forKey:", objc_msgSend(v13, "CGColor"), CFSTR("inputColor"));

      -[SBIconSimpleLabelView layer](self, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setFilters:", v15);

    }
    else
    {
      -[SBIconSimpleLabelView layer](self, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFilters:", 0);

    }
  }
  else
  {
    -[SBIconSimpleLabelView setImage:](self, "setImage:", 0);
  }

}

- (SBIconLabelImageParameters)imageParameters
{
  void *v2;
  void *v3;

  -[SBIconSimpleLabelView image](self, "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBIconLabelImageParameters *)v3;
}

- (SBIconView)iconView
{
  return (SBIconView *)objc_loadWeakRetained((id *)&self->_iconView);
}

- (void)setIconView:(id)a3
{
  objc_storeWeak((id *)&self->_iconView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_iconView);
}

@end
