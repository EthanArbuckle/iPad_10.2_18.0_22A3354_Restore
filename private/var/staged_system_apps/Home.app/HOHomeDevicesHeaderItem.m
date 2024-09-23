@implementation HOHomeDevicesHeaderItem

- (HOHomeDevicesHeaderItem)initWithHome:(id)a3 room:(id)a4
{
  id v7;
  id v8;
  HOHomeDevicesHeaderItem *v9;
  HOHomeDevicesHeaderItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HOHomeDevicesHeaderItem;
  v9 = -[HOHomeDevicesHeaderItem init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_room, a4);
  }

  return v10;
}

- (HOHomeDevicesHeaderItem)init
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HOHomeDevicesHeaderItem.m"), 29, CFSTR("Use -initWithHome:room:"));

  return 0;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];

  v4 = objc_alloc_init((Class)NAFuture);
  v5 = objc_alloc((Class)HFServiceItemProvider);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOHomeDevicesHeaderItem home](self, "home"));
  v7 = objc_msgSend(v5, "initWithHome:serviceTypes:", v6, 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOHomeDevicesHeaderItem room](self, "room"));
  if (v8)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000250F4;
    v21[3] = &unk_1000B6750;
    v21[4] = self;
    objc_msgSend(v7, "setFilter:", v21);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "reloadItems"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000251F4;
  v19[3] = &unk_1000B5C88;
  v10 = v4;
  v20 = v10;
  v11 = objc_msgSend(v9, "addFailureBlock:", v19);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100025200;
  v17[3] = &unk_1000B6778;
  v17[4] = self;
  v12 = v10;
  v18 = v12;
  v13 = objc_msgSend(v9, "addSuccessBlock:", v17);
  v14 = v18;
  v15 = v12;

  return v15;
}

- (HMHome)home
{
  return self->_home;
}

- (HMRoom)room
{
  return self->_room;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_room, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
