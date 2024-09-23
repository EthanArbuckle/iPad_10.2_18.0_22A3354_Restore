@implementation PXPeopleDetailBarsController

- (id)createAssetActionManager
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXPeopleDetailBarsController;
  -[PXPhotosDetailsBarsController createAssetActionManager](&v6, sel_createAssetActionManager);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleDetailBarsController person](self, "person");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPerson:", v4);

  return v3;
}

- (BOOL)wantsActionMenu
{
  return 1;
}

- (UIButton)peopleTitleView
{
  return self->_peopleTitleView;
}

- (void)setPeopleTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_peopleTitleView, a3);
}

- (PHPerson)person
{
  return self->_person;
}

- (void)setPerson:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_peopleTitleView, 0);
}

@end
