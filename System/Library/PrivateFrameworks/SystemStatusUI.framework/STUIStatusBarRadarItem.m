@implementation STUIStatusBarRadarItem

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E0DB0D18];
}

- (id)imageForUpdate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  CGSize v15;

  v3 = a3;
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "radarEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  v7 = (void *)MEMORY[0x1E0DC3870];
  DashBoardFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "styleAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("Black_Radar"), v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v11, "size");
    UIGraphicsBeginImageContext(v15);
    UIGraphicsGetImageFromCurrentImageContext();
    v12 = objc_claimAutoreleasedReturnValue();

    UIGraphicsEndImageContext();
    v11 = (void *)v12;
  }
  objc_msgSend(v11, "imageWithRenderingMode:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (STUIStatusBarRadarView)radarItemView
{
  STUIStatusBarRadarView *radarItemView;

  radarItemView = self->_radarItemView;
  if (!radarItemView)
  {
    -[STUIStatusBarRadarItem _create_radarItemView](self, "_create_radarItemView");
    radarItemView = self->_radarItemView;
  }
  return radarItemView;
}

- (void)_create_radarItemView
{
  STUIStatusBarRadarView *v3;
  STUIStatusBarRadarView *v4;
  STUIStatusBarRadarView *radarItemView;

  v3 = [STUIStatusBarRadarView alloc];
  v4 = -[STUIStatusBarRadarView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  radarItemView = self->_radarItemView;
  self->_radarItemView = v4;

}

- (void)setRadarItemView:(id)a3
{
  objc_storeStrong((id *)&self->_radarItemView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radarItemView, 0);
}

@end
