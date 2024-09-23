@implementation PUPhotoEditPerfHUD

- (PUPhotoEditPerfHUD)initWithCoder:(id)a3
{
  PUPhotoEditPerfHUD *v3;
  PUPhotoEditPerfHUD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditPerfHUD;
  v3 = -[PUPhotoEditPerfHUD initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    commonInit_58769(v3);
  return v4;
}

- (PUPhotoEditPerfHUD)initWithFrame:(CGRect)a3
{
  PUPhotoEditPerfHUD *v3;
  PUPhotoEditPerfHUD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditPerfHUD;
  v3 = -[PUPhotoEditPerfHUD initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    commonInit_58769(v3);
  return v4;
}

- (void)setFirstSinceBoot:(BOOL)a3
{
  void *v4;
  id v5;

  self->_firstSinceBoot = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditPerfHUD firstSinceBootVisualization](self, "firstSinceBootVisualization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:", v5);

}

- (void)setFirstSinceLaunch:(BOOL)a3
{
  void *v4;
  id v5;

  self->_firstSinceLaunch = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditPerfHUD firstSinceLaunchVisualization](self, "firstSinceLaunchVisualization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:", v5);

}

- (NSString)detailText
{
  void *v2;
  void *v3;

  -[PUPhotoEditPerfHUD detailVisualization](self, "detailVisualization");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setDetailText:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((unint64_t)objc_msgSend(v6, "length") >= 0x11)
  {
    objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v6, "length") - 16);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(CFSTR("…"), "stringByAppendingString:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[PUPhotoEditPerfHUD detailVisualization](self, "detailVisualization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

}

- (void)setEnterEditTimeInterval:(id)a3
{
  void *v5;
  PXTimeInterval *v6;

  v6 = (PXTimeInterval *)a3;
  if (self->_enterEditTimeInterval != v6)
  {
    objc_storeStrong((id *)&self->_enterEditTimeInterval, a3);
    -[PUPhotoEditPerfHUD enterEditVisualization](self, "enterEditVisualization");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTimeInterval:", v6);

  }
}

- (void)setResourceCheckingInterval:(id)a3
{
  void *v5;
  PXTimeInterval *v6;

  v6 = (PXTimeInterval *)a3;
  if (self->_resourceCheckingInterval != v6)
  {
    objc_storeStrong((id *)&self->_resourceCheckingInterval, a3);
    -[PUPhotoEditPerfHUD resourceCheckingVisualization](self, "resourceCheckingVisualization");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTimeInterval:", v6);

  }
}

- (void)setResourceDownloadInterval:(id)a3
{
  void *v5;
  PXTimeInterval *v6;

  v6 = (PXTimeInterval *)a3;
  if (self->_resourceDownloadInterval != v6)
  {
    objc_storeStrong((id *)&self->_resourceDownloadInterval, a3);
    -[PUPhotoEditPerfHUD resourceDownloadVisualization](self, "resourceDownloadVisualization");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTimeInterval:", v6);

  }
}

- (void)setResourceLoadingInterval:(id)a3
{
  void *v5;
  PXTimeInterval *v6;

  v6 = (PXTimeInterval *)a3;
  if (self->_resourceLoadingInterval != v6)
  {
    objc_storeStrong((id *)&self->_resourceLoadingInterval, a3);
    -[PUPhotoEditPerfHUD resourceLoadingVisualization](self, "resourceLoadingVisualization");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTimeInterval:", v6);

  }
}

- (void)setAutoCalcInterval:(id)a3
{
  void *v5;
  PXTimeInterval *v6;

  v6 = (PXTimeInterval *)a3;
  if (self->_autoCalcInterval != v6)
  {
    objc_storeStrong((id *)&self->_autoCalcInterval, a3);
    -[PUPhotoEditPerfHUD autoCalcVisualization](self, "autoCalcVisualization");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTimeInterval:", v6);

  }
}

- (void)setFilterInterval:(id)a3
{
  void *v5;
  PXTimeInterval *v6;

  v6 = (PXTimeInterval *)a3;
  if (self->_filterInterval != v6)
  {
    objc_storeStrong((id *)&self->_filterInterval, a3);
    -[PUPhotoEditPerfHUD filterVisualization](self, "filterVisualization");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTimeInterval:", v6);

  }
}

- (void)setExitEditTimeInterval:(id)a3
{
  void *v5;
  PXTimeInterval *v6;

  v6 = (PXTimeInterval *)a3;
  if (self->_exitEditTimeInterval != v6)
  {
    objc_storeStrong((id *)&self->_exitEditTimeInterval, a3);
    -[PUPhotoEditPerfHUD exitEditVisualization](self, "exitEditVisualization");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTimeInterval:", v6);

  }
}

- (BOOL)isFirstSinceBoot
{
  return self->_firstSinceBoot;
}

- (BOOL)isFirstSinceLaunch
{
  return self->_firstSinceLaunch;
}

- (PXTimeInterval)enterEditTimeInterval
{
  return self->_enterEditTimeInterval;
}

- (PXTimeInterval)resourceCheckingInterval
{
  return self->_resourceCheckingInterval;
}

- (PXTimeInterval)resourceDownloadInterval
{
  return self->_resourceDownloadInterval;
}

- (PXTimeInterval)resourceLoadingInterval
{
  return self->_resourceLoadingInterval;
}

- (PXTimeInterval)autoCalcInterval
{
  return self->_autoCalcInterval;
}

- (PXTimeInterval)filterInterval
{
  return self->_filterInterval;
}

- (PXTimeInterval)exitEditTimeInterval
{
  return self->_exitEditTimeInterval;
}

- (PXHUDView)hudView
{
  return self->_hudView;
}

- (void)setHudView:(id)a3
{
  objc_storeStrong((id *)&self->_hudView, a3);
}

- (PXHUDVisualization)detailVisualization
{
  return self->_detailVisualization;
}

- (void)setDetailVisualization:(id)a3
{
  objc_storeStrong((id *)&self->_detailVisualization, a3);
}

- (PXHUDBoxedValueVisualization)firstSinceBootVisualization
{
  return self->_firstSinceBootVisualization;
}

- (void)setFirstSinceBootVisualization:(id)a3
{
  objc_storeStrong((id *)&self->_firstSinceBootVisualization, a3);
}

- (PXHUDBoxedValueVisualization)firstSinceLaunchVisualization
{
  return self->_firstSinceLaunchVisualization;
}

- (void)setFirstSinceLaunchVisualization:(id)a3
{
  objc_storeStrong((id *)&self->_firstSinceLaunchVisualization, a3);
}

- (PXHUDTimeIntervalVisualization)enterEditVisualization
{
  return self->_enterEditVisualization;
}

- (void)setEnterEditVisualization:(id)a3
{
  objc_storeStrong((id *)&self->_enterEditVisualization, a3);
}

- (PXHUDTimeIntervalVisualization)resourceLoadingVisualization
{
  return self->_resourceLoadingVisualization;
}

- (void)setResourceLoadingVisualization:(id)a3
{
  objc_storeStrong((id *)&self->_resourceLoadingVisualization, a3);
}

- (PXHUDTimeIntervalVisualization)resourceCheckingVisualization
{
  return self->_resourceCheckingVisualization;
}

- (void)setResourceCheckingVisualization:(id)a3
{
  objc_storeStrong((id *)&self->_resourceCheckingVisualization, a3);
}

- (PXHUDTimeIntervalVisualization)resourceDownloadVisualization
{
  return self->_resourceDownloadVisualization;
}

- (void)setResourceDownloadVisualization:(id)a3
{
  objc_storeStrong((id *)&self->_resourceDownloadVisualization, a3);
}

- (PXHUDTimeIntervalVisualization)autoCalcVisualization
{
  return self->_autoCalcVisualization;
}

- (void)setAutoCalcVisualization:(id)a3
{
  objc_storeStrong((id *)&self->_autoCalcVisualization, a3);
}

- (PXHUDTimeIntervalVisualization)filterVisualization
{
  return self->_filterVisualization;
}

- (void)setFilterVisualization:(id)a3
{
  objc_storeStrong((id *)&self->_filterVisualization, a3);
}

- (PXHUDTimeIntervalVisualization)exitEditVisualization
{
  return self->_exitEditVisualization;
}

- (void)setExitEditVisualization:(id)a3
{
  objc_storeStrong((id *)&self->_exitEditVisualization, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitEditVisualization, 0);
  objc_storeStrong((id *)&self->_filterVisualization, 0);
  objc_storeStrong((id *)&self->_autoCalcVisualization, 0);
  objc_storeStrong((id *)&self->_resourceDownloadVisualization, 0);
  objc_storeStrong((id *)&self->_resourceCheckingVisualization, 0);
  objc_storeStrong((id *)&self->_resourceLoadingVisualization, 0);
  objc_storeStrong((id *)&self->_enterEditVisualization, 0);
  objc_storeStrong((id *)&self->_firstSinceLaunchVisualization, 0);
  objc_storeStrong((id *)&self->_firstSinceBootVisualization, 0);
  objc_storeStrong((id *)&self->_detailVisualization, 0);
  objc_storeStrong((id *)&self->_hudView, 0);
  objc_storeStrong((id *)&self->_exitEditTimeInterval, 0);
  objc_storeStrong((id *)&self->_filterInterval, 0);
  objc_storeStrong((id *)&self->_autoCalcInterval, 0);
  objc_storeStrong((id *)&self->_resourceLoadingInterval, 0);
  objc_storeStrong((id *)&self->_resourceDownloadInterval, 0);
  objc_storeStrong((id *)&self->_resourceCheckingInterval, 0);
  objc_storeStrong((id *)&self->_enterEditTimeInterval, 0);
}

@end
