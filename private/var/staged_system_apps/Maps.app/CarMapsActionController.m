@implementation CarMapsActionController

- (CarMapsActionController)initWithPlatformController:(id)a3
{
  id v5;
  CarMapsActionController *v6;
  CarMapsActionController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CarMapsActionController;
  v6 = -[MapsActionController init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_platformController, a3);

  return v7;
}

- (BOOL)isCarPlayOnlyContext
{
  return 1;
}

- (CarStateManager)carStateManager
{
  CarStateManager *carStateManager;
  CarStateManager *v4;
  CarStateManager *v5;

  carStateManager = self->_carStateManager;
  if (!carStateManager)
  {
    v4 = -[AppStateManager initWithPlatformController:]([CarStateManager alloc], "initWithPlatformController:", self->_platformController);
    v5 = self->_carStateManager;
    self->_carStateManager = v4;

    carStateManager = self->_carStateManager;
  }
  return carStateManager;
}

- (void)_applyActivity:(id)a3 assumedSourceFidelity:(unint64_t)a4 source:(int64_t)a5
{
  id v8;
  id v9;

  v8 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[CarMapsActionController carStateManager](self, "carStateManager"));
  objc_msgSend(v9, "setMapsActivity:assumedSourceFidelity:source:", v8, a4, a5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platformController, 0);
  objc_storeStrong((id *)&self->_carStateManager, 0);
}

@end
