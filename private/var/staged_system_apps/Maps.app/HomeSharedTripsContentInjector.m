@implementation HomeSharedTripsContentInjector

- (HomeSharedTripsContentInjector)initWithSharedTrip:(id)a3
{
  id v5;
  HomeSharedTripsContentInjector *v6;
  HomeSharedTripsContentInjector *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HomeSharedTripsContentInjector;
  v6 = -[HomeSharedTripsContentInjector init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sharedTrip, a3);

  return v7;
}

- (void)addContentToMapView
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[HomeSharedTripsContentInjector baseModeController](self, "baseModeController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomeSharedTripsContentInjector sharedTrip](self, "sharedTrip"));
  objc_msgSend(v4, "showSharedTrip:", v3);

}

- (void)removeContentFromMapView
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomeSharedTripsContentInjector baseModeController](self, "baseModeController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeSharedTripsContentInjector sharedTrip](self, "sharedTrip"));
  v5 = objc_msgSend(v3, "isShowingSharedTrip:", v4);

  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[HomeSharedTripsContentInjector baseModeController](self, "baseModeController"));
    objc_msgSend(v6, "showSharedTrip:", 0);

  }
}

- (id)updateContentInjection
{
  return self->_updateContentInjection;
}

- (void)setUpdateContentInjection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BaseModeController)baseModeController
{
  return (BaseModeController *)objc_loadWeakRetained((id *)&self->_baseModeController);
}

- (void)setBaseModeController:(id)a3
{
  objc_storeWeak((id *)&self->_baseModeController, a3);
}

- (GEOSharedNavState)sharedTrip
{
  return self->_sharedTrip;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedTrip, 0);
  objc_destroyWeak((id *)&self->_baseModeController);
  objc_storeStrong(&self->_updateContentInjection, 0);
}

@end
