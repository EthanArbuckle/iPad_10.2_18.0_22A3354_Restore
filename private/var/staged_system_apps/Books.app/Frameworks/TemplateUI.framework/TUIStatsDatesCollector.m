@implementation TUIStatsDatesCollector

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)initialResourcesRenderedDate
{
  return self->_initialResourcesRenderedDate;
}

- (void)setInitialResourcesRenderedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)contentUpdateDate
{
  return self->_contentUpdateDate;
}

- (void)setContentUpdateDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)initialContentReadyDate
{
  return self->_initialContentReadyDate;
}

- (void)setInitialContentReadyDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)initialLayoutStartDate
{
  return self->_initialLayoutStartDate;
}

- (void)setInitialLayoutStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)allContentReadyDate
{
  return self->_allContentReadyDate;
}

- (void)setAllContentReadyDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDate)dynamicUpdateDate
{
  return self->_dynamicUpdateDate;
}

- (void)setDynamicUpdateDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)resourcesStartLoadingDate
{
  return self->_resourcesStartLoadingDate;
}

- (void)setResourcesStartLoadingDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDate)resourcesLoadedDate
{
  return self->_resourcesLoadedDate;
}

- (void)setResourcesLoadedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDate)viewWillAppearDate
{
  return self->_viewWillAppearDate;
}

- (void)setViewWillAppearDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewWillAppearDate, 0);
  objc_storeStrong((id *)&self->_resourcesLoadedDate, 0);
  objc_storeStrong((id *)&self->_resourcesStartLoadingDate, 0);
  objc_storeStrong((id *)&self->_dynamicUpdateDate, 0);
  objc_storeStrong((id *)&self->_allContentReadyDate, 0);
  objc_storeStrong((id *)&self->_initialLayoutStartDate, 0);
  objc_storeStrong((id *)&self->_initialContentReadyDate, 0);
  objc_storeStrong((id *)&self->_contentUpdateDate, 0);
  objc_storeStrong((id *)&self->_initialResourcesRenderedDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end
