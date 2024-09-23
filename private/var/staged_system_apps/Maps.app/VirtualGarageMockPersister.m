@implementation VirtualGarageMockPersister

- (VirtualGarageMockPersister)init
{
  VirtualGarageMockPersister *v2;
  VirtualGarageMockPersister *v3;
  NSString *v4;
  id v5;
  const char *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VirtualGarageMockPersister;
  v2 = -[VirtualGarageMockPersister init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.Navigation.persister.%@.%p"), objc_opt_class(v2), v2);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v4));
    v6 = (const char *)objc_msgSend(v5, "UTF8String");
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create(v6, v8);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v9;

  }
  return v3;
}

- (void)loadVehiclesWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100C0BB4C;
  v7[3] = &unk_1011B0300;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)_dummyVehicles
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v26;
  _QWORD v27[4];
  id v28;
  __CFString *v29;
  __CFString *v30;
  _QWORD v31[3];
  _UNKNOWN **v32;
  id v33;
  _UNKNOWN **v34;
  id v35;

  v2 = objc_alloc((Class)VGVehicle);
  v34 = &off_1012712D8;
  v3 = objc_alloc((Class)NSMeasurement);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUnitPower watts](NSUnitPower, "watts"));
  v5 = objc_msgSend(v3, "initWithDoubleValue:unit:", v4, 55000.0);
  v35 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
  v26 = objc_msgSend(v2, "initWithDisplayName:year:manufacturer:model:colorHex:headUnitIdentifier:headUnitBluetoothIdentifier:supportedConnectors:powerByConnector:", CFSTR("Apple Maps EV-1"), CFSTR("2022"), CFSTR("Apple Maps"), CFSTR("EV-1"), CFSTR("0F0F0F"), 0, 0, 1, v6);

  v7 = objc_alloc((Class)VGVehicle);
  v32 = &off_1012712D8;
  v8 = objc_alloc((Class)NSMeasurement);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUnitPower watts](NSUnitPower, "watts"));
  v10 = objc_msgSend(v8, "initWithDoubleValue:unit:", v9, 55000.0);
  v33 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
  v12 = objc_msgSend(v7, "initWithDisplayName:year:manufacturer:model:colorHex:headUnitIdentifier:headUnitBluetoothIdentifier:supportedConnectors:powerByConnector:", CFSTR("Apple Maps EV-2"), CFSTR("2022"), CFSTR("Apple Maps"), CFSTR("EV-2"), CFSTR("0F0F0F"), 0, 0, 1, v11);

  v13 = objc_msgSend(objc_alloc((Class)VGVehicle), "initWithDisplayName:year:manufacturer:model:colorHex:headUnitIdentifier:headUnitBluetoothIdentifier:supportedConnectors:powerByConnector:", CFSTR("Apple Maps LPR-1"), CFSTR("2022"), CFSTR("Apple Maps"), CFSTR("LPR-1"), CFSTR("F0F0F0"), 0, 0, 0, 0);
  objc_msgSend(v13, "setLicensePlate:", CFSTR("3EEE333"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManager sharedManager](GEOResourceManager, "sharedManager"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dataForResourceWithName:fallbackBundle:", CFSTR("regional_vehicle_info.pb"), 0));

  if (v15)
  {
    v16 = objc_msgSend(objc_alloc((Class)GEOLPRRoot), "initWithData:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "powerTypes"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "allKeys"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));
    objc_msgSend(v13, "setLprPowerType:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "vehicleTypes"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "allKeys"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "firstObject"));
    objc_msgSend(v13, "setLprVehicleType:", v22);

  }
  v31[0] = v26;
  v31[1] = v12;
  v31[2] = v13;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 3));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100C0C05C;
  v27[3] = &unk_1011E92E0;
  v28 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v29 = CFSTR("{\"vehicle_parameters\":{},\"model_id\":0}");
  v30 = CFSTR("{\"vehicle_parameters\":{},\"model_id\":0}");
  v24 = v28;
  objc_msgSend(v23, "enumerateObjectsUsingBlock:", v27);

  return v23;
}

- (id)persistedVehicleForVehicle:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_100C0C530;
  v17 = sub_100C0C540;
  v18 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C0C548;
  block[3] = &unk_1011B31D8;
  block[4] = self;
  v11 = v5;
  v12 = &v13;
  v7 = v5;
  dispatch_sync(queue, block);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (VGVirtualGaragePersistingDelegate)delegate
{
  return (VGVirtualGaragePersistingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)selectedVehicleIdentifier
{
  return self->_selectedVehicleIdentifier;
}

- (void)setSelectedVehicleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedVehicleIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_vehicles, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
