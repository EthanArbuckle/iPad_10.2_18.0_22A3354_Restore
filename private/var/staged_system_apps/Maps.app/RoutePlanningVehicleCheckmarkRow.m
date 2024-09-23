@implementation RoutePlanningVehicleCheckmarkRow

- (RoutePlanningVehicleCheckmarkRow)initWithVehicle:(id)a3
{
  id v5;
  RoutePlanningVehicleCheckmarkRow *v6;
  RoutePlanningVehicleCheckmarkRow *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RoutePlanningVehicleCheckmarkRow;
  v6 = -[MapsDebugCheckmarkRow init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_vehicle, a3);

  return v7;
}

- (id)value
{
  return self->_vehicle;
}

- (void)_configureCell:(id)a3
{
  id v4;
  __objc2_prot **v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  NSString *v9;
  char *v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  char *v15;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;

  v4 = a3;
  v5 = &off_101267000;
  if ((objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___RoutePlanningVehicleSelectionCell) & 1) == 0)
  {
    v11 = sub_1004318FC();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315906;
      v17 = "-[RoutePlanningVehicleCheckmarkRow _configureCell:]";
      v18 = 2080;
      v19 = "RoutePlanningVehicleCheckmarkRow.m";
      v20 = 1024;
      v21 = 45;
      v22 = 2080;
      v23 = "[cell conformsToProtocol:@protocol(RoutePlanningVehicleSelectionCell)]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v16, 0x26u);
    }

    if (sub_100A70734())
    {
      v13 = sub_1004318FC();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v16 = 138412290;
        v17 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v16, 0xCu);

        v5 = &off_101267000;
      }

    }
  }
  if ((objc_msgSend(v4, "conformsToProtocol:", v5[281]) & 1) != 0)
  {
    objc_msgSend(v4, "setupWithVehicle:", self->_vehicle);
  }
  else
  {
    v6 = sub_10043214C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v8 = (objc_class *)objc_opt_class(v4);
      v9 = NSStringFromClass(v8);
      v10 = (char *)objc_claimAutoreleasedReturnValue(v9);
      v16 = 138412290;
      v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "RoutePlanningVehicleCheckmarkRow can't configure a cell of class: %@.", (uint8_t *)&v16, 0xCu);

    }
  }

}

- (id)cellForTableView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  RoutePlanningVehicleSelectionTableViewCell *v7;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(self), "reuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (RoutePlanningVehicleSelectionTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dequeueReusableCellWithIdentifier:", v6));

  if (!v7)
    v7 = -[RoutePlanningVehicleSelectionTableViewCell initWithStyle:reuseIdentifier:]([RoutePlanningVehicleSelectionTableViewCell alloc], "initWithStyle:reuseIdentifier:", -[MapsDebugTableRow cellStyle](self, "cellStyle"), v6);
  -[RoutePlanningVehicleCheckmarkRow configureCell:](self, "configureCell:", v7);

  return v7;
}

+ (void)registerCellsInCollectionView:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = objc_opt_class(RoutePlanningVehicleSelectionCollectionViewCell);
  v6 = objc_msgSend((id)objc_opt_class(a1), "reuseIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", v5, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicle, 0);
}

@end
