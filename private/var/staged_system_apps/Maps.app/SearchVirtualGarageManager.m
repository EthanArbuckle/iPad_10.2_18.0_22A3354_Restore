@implementation SearchVirtualGarageManager

- (id)updatedTraitsForCurrentGarageState:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  char v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v24;
  void *v25;
  id obj;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v3 = a3;
  objc_msgSend(v3, "clearEvChargingPorts");
  objc_msgSend(v3, "clearPreferredBrands");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SearchVirtualGarageManager sharedSearchVirtualGarageManager](SearchVirtualGarageManager, "sharedSearchVirtualGarageManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "virtualGarage"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectedVehicle"));
  v7 = (objc_msgSend(v3, "navigating") & 1) != 0
    || objc_msgSend(v3, "searchOriginationType") == 1
    || objc_msgSend(v3, "searchOriginationType") == 2;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
  v9 = objc_msgSend(v8, "isConnected");

  if (v6 && v7 | v9)
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "updatedTraitsFrom:", v3));

    v3 = (id)v10;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "vehicles"));

    if (v11)
    {
      v24 = v6;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v25 = v5;
      obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "vehicles"));
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v13)
      {
        v14 = v13;
        v15 = 0;
        v16 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v34 != v16)
              objc_enumerationMutation(obj);
            v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "evChargingPorts"));
            v31[0] = _NSConcreteStackBlock;
            v31[1] = 3221225472;
            v31[2] = sub_100523CB0;
            v31[3] = &unk_1011BA290;
            v20 = v3;
            v21 = v3;
            v32 = v21;
            objc_msgSend(v19, "enumerateObjectsUsingBlock:", v31);

            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "preferredChargingNetworks"));
            v29[0] = _NSConcreteStackBlock;
            v29[1] = 3221225472;
            v29[2] = sub_100523CBC;
            v29[3] = &unk_1011BA2B8;
            v30 = v12;
            objc_msgSend(v22, "enumerateObjectsUsingBlock:", v29);

            if (!(v15 & 1 | ((objc_msgSend(v18, "isLPRWithElectricEngine") & 1) == 0)))
            {
              objc_msgSend(v21, "addEngineType:", 3);
              v15 = 1;
            }

            v3 = v20;
          }
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        }
        while (v14);
      }

      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100523D14;
      v27[3] = &unk_1011BA2E0;
      v3 = v3;
      v28 = v3;
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", v27);

      v6 = v24;
      v5 = v25;
    }
  }

  return v3;
}

- (SearchVirtualGarageManager)init
{
  SearchVirtualGarageManager *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *isolationQueue;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SearchVirtualGarageManager;
  v2 = -[SearchVirtualGarageManager init](&v10, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("SearchVirtualGarageManager.isolationQueue", v4);
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
    objc_msgSend(v7, "registerObserver:", v2);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, "virtualGarageDidBecomeAvailable", off_1014B63B0, 0);

  }
  return v2;
}

+ (id)sharedSearchVirtualGarageManager
{
  if (qword_1014D3538 != -1)
    dispatch_once(&qword_1014D3538, &stru_1011CA158);
  return (id)qword_1014D3530;
}

- (VGVirtualGarage)virtualGarage
{
  NSObject *isolationQueue;
  uint64_t v3;
  uint64_t v4;
  uint64_t IsEnabled_EVRouting;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t v10[16];
  _QWORD block[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_10081EAE4;
  v16 = sub_10081EAF4;
  v17 = 0;
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10081EAFC;
  block[3] = &unk_1011ADF48;
  block[4] = self;
  block[5] = &v12;
  dispatch_sync(isolationQueue, block);
  if (!v13[5])
  {
    IsEnabled_EVRouting = MapsFeature_IsEnabled_EVRouting(v3, v4);
    if ((IsEnabled_EVRouting & 1) != 0 || MapsFeature_IsEnabled_Alberta(IsEnabled_EVRouting))
    {
      v6 = sub_1004326FC();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[SearchVirtualGarageManager] using nil garage", v10, 2u);
      }

    }
  }
  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return (VGVirtualGarage *)v8;
}

- (void)setVirtualGarage:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  isolationQueue = self->_isolationQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10081EB8C;
  v7[3] = &unk_1011AC8B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(isolationQueue, v7);

}

- (void)virtualGarageDidBecomeAvailable
{
  void *v3;
  uint64_t v4;
  uint64_t IsEnabled_EVRouting;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id buf[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchVirtualGarageManager virtualGarage](self, "virtualGarage"));
  if (v3)
  {

  }
  else
  {
    IsEnabled_EVRouting = MapsFeature_IsEnabled_EVRouting(0, v4);
    if ((IsEnabled_EVRouting & 1) != 0 || (MapsFeature_IsEnabled_Alberta(IsEnabled_EVRouting) & 1) != 0)
    {
      v6 = sub_1004326FC();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[SearchVirtualGarageManager] fetching garage", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, self);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10081ECD4;
      v9[3] = &unk_1011AD100;
      objc_copyWeak(&v10, buf);
      objc_msgSend(v8, "virtualGarageGetGarageWithReply:", v9);

      objc_destroyWeak(&v10);
      objc_destroyWeak(buf);
    }
  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SearchVirtualGarageManager;
  -[SearchVirtualGarageManager dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualGarage, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

@end
