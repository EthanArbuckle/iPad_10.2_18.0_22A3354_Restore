@implementation CustomLocationManager

+ (id)sharedManager
{
  void *v2;
  CustomLocationManager *v3;
  void *v4;

  v2 = (void *)qword_1014D22A8;
  if (!qword_1014D22A8)
  {
    v3 = objc_alloc_init(CustomLocationManager);
    v4 = (void *)qword_1014D22A8;
    qword_1014D22A8 = (uint64_t)v3;

    v2 = (void *)qword_1014D22A8;
  }
  return v2;
}

- (CustomLocationManager)init
{
  CustomLocationManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CustomLocationManager;
  v2 = -[CustomLocationManager init](&v4, "init");
  if (v2)
    v2->_reverseGeocodeRequestsForSearchResults = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_reverseGeocodeRequestsForSearchResults);
  v3.receiver = self;
  v3.super_class = (Class)CustomLocationManager;
  -[CustomLocationManager dealloc](&v3, "dealloc");
}

- (void)processSearchResult:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  CustomLocationManager *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  id v26;

  v6 = a3;
  v7 = a4;
  if (v6
    && objc_msgSend(v6, "needsReverseGeocodeCheck")
    && !CFDictionaryGetValue(self->_reverseGeocodeRequestsForSearchResults, v6))
  {
    if (!v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "chromeViewController"));
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentTraits"));

    }
    objc_msgSend(v6, "setHasIncompleteNavData:", 1);
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3032000000;
    v25[3] = sub_1003A04EC;
    v25[4] = sub_1003A04FC;
    v26 = 0;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1003A0504;
    v24[3] = &unk_1011AEF80;
    v24[4] = v25;
    v10 = objc_retainBlock(v24);
    if (objc_msgSend(v6, "hasFloorOrdinal"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      objc_msgSend(v6, "coordinate");
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ticketForReverseGeocodeDroppedPinCoordinate:floorOrdinal:traits:", objc_msgSend(v6, "floorOrdinal"), v7, v12, v13));
    }
    else
    {
      if (objc_msgSend(v6, "isDynamicCurrentLocation"))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastLocation"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ticketForReverseGeocodeLocation:traits:", v16, v7));

LABEL_12:
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_1003A058C;
        v20[3] = &unk_1011B3AF8;
        v18 = v17;
        v21 = v18;
        v19 = v6;
        v22 = v19;
        v23 = self;
        objc_msgSend(v18, "submitWithHandler:networkActivity:", v20, v10);
        CFDictionarySetValue(self->_reverseGeocodeRequestsForSearchResults, v19, v18);

        _Block_object_dispose(v25, 8);
        goto LABEL_13;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      objc_msgSend(v6, "coordinate");
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ticketForReverseGeocodeDroppedPinCoordinate:traits:", v7));
    }
    v17 = (void *)v14;
    goto LABEL_12;
  }
LABEL_13:

}

@end
