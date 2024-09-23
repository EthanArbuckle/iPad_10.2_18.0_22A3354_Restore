@implementation THImageInfo

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THImageInfo;
  -[THImageInfo dealloc](&v3, "dealloc");
}

- (Class)repClass
{
  return (Class)objc_opt_class(THImageRep, a2);
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(THImageLayout, a2);
}

- (void)setPopUpInfo:(id)a3
{
  TSWPopUpInfo *mPopUpInfo;

  mPopUpInfo = self->mPopUpInfo;
  if (mPopUpInfo != a3)
  {

    self->mPopUpInfo = (TSWPopUpInfo *)a3;
  }
}

- (TSWPopUpInfo)popUpInfo
{
  return self->mPopUpInfo;
}

- (THWPanelContentProvider)panelContentProvider
{
  return self->_panelContentProvider;
}

- (void)setPanelContentProvider:(id)a3
{
  self->_panelContentProvider = (THWPanelContentProvider *)a3;
}

@end
