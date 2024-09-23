@implementation CuratedCollectionViewAnalyticsController

- (CuratedCollectionViewAnalyticsController)initWithCollectionIdentifier:(id)a3
{
  id v4;
  CuratedCollectionViewAnalyticsController *v5;
  CuratedCollectionViewAnalyticsController *v6;
  objc_super v8;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)CuratedCollectionViewAnalyticsController;
    v5 = -[CuratedCollectionViewAnalyticsController init](&v8, "init");
    if (v5)
    {
      v5->_collectionMUID = (unint64_t)objc_msgSend(v4, "muid");
      v5->_saved = 0;
      v5->_target = 259;
    }
    self = v5;
    v6 = self;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: collectionIdentifier != ((void *)0)", buf, 2u);
    }
    v6 = 0;
  }

  return v6;
}

- (void)updateWithPlaceCollection:(id)a3
{
  void *v5;
  void *v6;
  GEOPlaceCollection *v7;

  v7 = (GEOPlaceCollection *)a3;
  if (self->_curatedCollection != v7)
  {
    objc_storeStrong((id *)&self->_curatedCollection, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPlaceCollection collectionIdentifier](self->_curatedCollection, "collectionIdentifier"));
    self->_collectionMUID = (unint64_t)objc_msgSend(v5, "muid");

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
    self->_saved = objc_msgSend(v6, "collectionIsSaved:", v7);

  }
}

- (void)logShareCuratedCollection
{
  id v3[10];
  _OWORD v4[5];

  memset(v4, 0, sizeof(v4));
  -[CuratedCollectionViewAnalyticsController _createBaseEvent](self, "_createBaseEvent");
  LODWORD(v4[0]) = 2096;
  sub_100C4EFD4((uint64_t)v3, (uint64_t)v4);
  if (self)
    -[CuratedCollectionViewAnalyticsController _captureCollectionViewEvent:](self, "_captureCollectionViewEvent:", v3);
  else
    sub_10026DEA8(v3);
  sub_10026DEA8((id *)v4);
}

- (void)logRevealCuratedCollectionView
{
  id v3[10];
  _OWORD v4[5];

  memset(v4, 0, sizeof(v4));
  -[CuratedCollectionViewAnalyticsController _createBaseEvent](self, "_createBaseEvent");
  LODWORD(v4[0]) = 21;
  sub_100C4EFD4((uint64_t)v3, (uint64_t)v4);
  if (self)
    -[CuratedCollectionViewAnalyticsController _captureCollectionViewEvent:](self, "_captureCollectionViewEvent:", v3);
  else
    sub_10026DEA8(v3);
  sub_10026DEA8((id *)v4);
}

- (void)logScrollUp
{
  id v3[10];
  _OWORD v4[5];

  memset(v4, 0, sizeof(v4));
  -[CuratedCollectionViewAnalyticsController _createBaseEvent](self, "_createBaseEvent");
  LODWORD(v4[0]) = 7;
  sub_100C4EFD4((uint64_t)v3, (uint64_t)v4);
  if (self)
    -[CuratedCollectionViewAnalyticsController _captureCollectionViewEvent:](self, "_captureCollectionViewEvent:", v3);
  else
    sub_10026DEA8(v3);
  sub_10026DEA8((id *)v4);
}

- (void)logScrollDown
{
  id v3[10];
  _OWORD v4[5];

  memset(v4, 0, sizeof(v4));
  -[CuratedCollectionViewAnalyticsController _createBaseEvent](self, "_createBaseEvent");
  LODWORD(v4[0]) = 8;
  sub_100C4EFD4((uint64_t)v3, (uint64_t)v4);
  if (self)
    -[CuratedCollectionViewAnalyticsController _captureCollectionViewEvent:](self, "_captureCollectionViewEvent:", v3);
  else
    sub_10026DEA8(v3);
  sub_10026DEA8((id *)v4);
}

- (void)logClose
{
  id v3[10];
  _OWORD v4[5];

  memset(v4, 0, sizeof(v4));
  -[CuratedCollectionViewAnalyticsController _createBaseEvent](self, "_createBaseEvent");
  LODWORD(v4[0]) = 4;
  sub_100C4EFD4((uint64_t)v3, (uint64_t)v4);
  if (self)
    -[CuratedCollectionViewAnalyticsController _captureCollectionViewEvent:](self, "_captureCollectionViewEvent:", v3);
  else
    sub_10026DEA8(v3);
  sub_10026DEA8((id *)v4);
}

- (void)logTryAgain
{
  id v3[10];
  _OWORD v4[5];

  memset(v4, 0, sizeof(v4));
  -[CuratedCollectionViewAnalyticsController _createBaseEvent](self, "_createBaseEvent");
  LODWORD(v4[0]) = 2171;
  sub_100C4EFD4((uint64_t)v3, (uint64_t)v4);
  if (self)
    -[CuratedCollectionViewAnalyticsController _captureCollectionViewEvent:](self, "_captureCollectionViewEvent:", v3);
  else
    sub_10026DEA8(v3);
  sub_10026DEA8((id *)v4);
}

- (void)logTapShowMoreDescription
{
  id v3[10];
  _OWORD v4[5];

  memset(v4, 0, sizeof(v4));
  -[CuratedCollectionViewAnalyticsController _createBaseEvent](self, "_createBaseEvent");
  LODWORD(v4[0]) = 9040;
  sub_100C4EFD4((uint64_t)v3, (uint64_t)v4);
  if (self)
    -[CuratedCollectionViewAnalyticsController _captureCollectionViewEvent:](self, "_captureCollectionViewEvent:", v3);
  else
    sub_10026DEA8(v3);
  sub_10026DEA8((id *)v4);
}

- (void)logTapShowLessDescription
{
  id v3[10];
  _OWORD v4[5];

  memset(v4, 0, sizeof(v4));
  -[CuratedCollectionViewAnalyticsController _createBaseEvent](self, "_createBaseEvent");
  LODWORD(v4[0]) = 9039;
  sub_100C4EFD4((uint64_t)v3, (uint64_t)v4);
  if (self)
    -[CuratedCollectionViewAnalyticsController _captureCollectionViewEvent:](self, "_captureCollectionViewEvent:", v3);
  else
    sub_10026DEA8(v3);
  sub_10026DEA8((id *)v4);
}

- (void)logTapCollectionItem:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14[10];
  _OWORD v15[2];
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v6 = a3;
  v17 = 0u;
  v18 = 0u;
  v16 = 0u;
  memset(v15, 0, sizeof(v15));
  -[CuratedCollectionViewAnalyticsController _createBaseEvent](self, "_createBaseEvent");
  LODWORD(v15[0]) = 2068;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "muid")));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringValue"));
  v11 = (void *)*((_QWORD *)&v15[0] + 1);
  *((_QWORD *)&v15[0] + 1) = v10;

  v12 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v13 = (void *)v16;
  *(_QWORD *)&v16 = v12;

  sub_100C4EFD4((uint64_t)v14, (uint64_t)v15);
  if (self)
    -[CuratedCollectionViewAnalyticsController _captureCollectionViewEvent:](self, "_captureCollectionViewEvent:", v14);
  else
    sub_10026DEA8(v14);
  sub_10026DEA8((id *)v15);

}

- (void)logPullUpCuratedCollectionView
{
  id v3[10];
  _OWORD v4[5];

  memset(v4, 0, sizeof(v4));
  -[CuratedCollectionViewAnalyticsController _createBaseEvent](self, "_createBaseEvent");
  LODWORD(v4[0]) = 1;
  sub_100C4EFD4((uint64_t)v3, (uint64_t)v4);
  if (self)
    -[CuratedCollectionViewAnalyticsController _captureCollectionViewEvent:](self, "_captureCollectionViewEvent:", v3);
  else
    sub_10026DEA8(v3);
  sub_10026DEA8((id *)v4);
}

- (void)logSaveCuratedCollection
{
  _BYTE v3[80];
  _OWORD v4[5];

  self->_saved = 1;
  memset(v4, 0, sizeof(v4));
  -[CuratedCollectionViewAnalyticsController _createBaseEvent](self, "_createBaseEvent");
  LODWORD(v4[0]) = 2091;
  sub_100C4EFD4((uint64_t)v3, (uint64_t)v4);
  -[CuratedCollectionViewAnalyticsController _captureCollectionViewEvent:](self, "_captureCollectionViewEvent:", v3);
  sub_10026DEA8((id *)v4);
}

- (void)logRemoveCuratedCollection
{
  _BYTE v3[80];
  _OWORD v4[5];

  self->_saved = 0;
  memset(v4, 0, sizeof(v4));
  -[CuratedCollectionViewAnalyticsController _createBaseEvent](self, "_createBaseEvent");
  LODWORD(v4[0]) = 2088;
  sub_100C4EFD4((uint64_t)v3, (uint64_t)v4);
  -[CuratedCollectionViewAnalyticsController _captureCollectionViewEvent:](self, "_captureCollectionViewEvent:", v3);
  sub_10026DEA8((id *)v4);
}

- (void)logPunchOutToPublisherReviewWithIndex:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  id v7[10];
  _OWORD v8[2];
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  memset(v8, 0, sizeof(v8));
  -[CuratedCollectionViewAnalyticsController _createBaseEvent](self, "_createBaseEvent");
  LODWORD(v8[0]) = 9035;
  v5 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v6 = (void *)v9;
  *(_QWORD *)&v9 = v5;

  sub_100C4EFD4((uint64_t)v7, (uint64_t)v8);
  if (self)
    -[CuratedCollectionViewAnalyticsController _captureCollectionViewEvent:](self, "_captureCollectionViewEvent:", v7);
  else
    sub_10026DEA8(v7);
  sub_10026DEA8((id *)v8);
}

- (void)logReportAProblem
{
  id v3[10];
  _OWORD v4[5];

  memset(v4, 0, sizeof(v4));
  -[CuratedCollectionViewAnalyticsController _createBaseEvent](self, "_createBaseEvent");
  LODWORD(v4[0]) = 5013;
  sub_100C4EFD4((uint64_t)v3, (uint64_t)v4);
  if (self)
    -[CuratedCollectionViewAnalyticsController _captureCollectionViewEvent:](self, "_captureCollectionViewEvent:", v3);
  else
    sub_10026DEA8(v3);
  sub_10026DEA8((id *)v4);
}

- (void)logTapMediaIntegrationWithType:(int64_t)a3 verticalIndex:(int64_t)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12[10];
  _OWORD v13[2];
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v15 = 0u;
  v16 = 0u;
  v14 = 0u;
  memset(v13, 0, sizeof(v13));
  -[CuratedCollectionViewAnalyticsController _createBaseEvent](self, "_createBaseEvent");
  LODWORD(v13[0]) = 259;
  v7 = objc_msgSend((id)objc_opt_class(self), "_eventValueForMediaType:", a3);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)*((_QWORD *)&v13[0] + 1);
  *((_QWORD *)&v13[0] + 1) = v8;

  v10 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  v11 = (void *)v14;
  *(_QWORD *)&v14 = v10;

  sub_100C4EFD4((uint64_t)v12, (uint64_t)v13);
  if (self)
    -[CuratedCollectionViewAnalyticsController _captureCollectionViewEvent:](self, "_captureCollectionViewEvent:", v12);
  else
    sub_10026DEA8(v12);
  sub_10026DEA8((id *)v13);
}

- (void)logShowMediaAppMenu
{
  id v3[10];
  _OWORD v4[5];

  memset(v4, 0, sizeof(v4));
  -[CuratedCollectionViewAnalyticsController _createBaseEvent](self, "_createBaseEvent");
  LODWORD(v4[0]) = 261;
  sub_100C4EFD4((uint64_t)v3, (uint64_t)v4);
  if (self)
    -[CuratedCollectionViewAnalyticsController _captureCollectionViewEvent:](self, "_captureCollectionViewEvent:", v3);
  else
    sub_10026DEA8(v3);
  sub_10026DEA8((id *)v4);
}

- (void)logTapMediaAppWithIdentifier:(id)a3
{
  id v5;
  id v6[10];
  _OWORD v7[3];
  __int128 v8;
  __int128 v9;

  v5 = a3;
  v8 = 0u;
  v9 = 0u;
  memset(v7, 0, sizeof(v7));
  -[CuratedCollectionViewAnalyticsController _createBaseEvent](self, "_createBaseEvent");
  LODWORD(v7[0]) = 257;
  DWORD2(v8) = 48;
  objc_storeStrong((id *)v7 + 1, a3);
  sub_100C4EFD4((uint64_t)v6, (uint64_t)v7);
  if (self)
    -[CuratedCollectionViewAnalyticsController _captureCollectionViewEvent:](self, "_captureCollectionViewEvent:", v6);
  else
    sub_10026DEA8(v6);
  sub_10026DEA8((id *)v7);

}

- (void)logPunchOutToURL:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7[10];
  _OWORD v8[5];

  v4 = a3;
  memset(v8, 0, sizeof(v8));
  -[CuratedCollectionViewAnalyticsController _createBaseEvent](self, "_createBaseEvent");
  LODWORD(v8[0]) = 6050;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString"));
  v6 = (void *)*((_QWORD *)&v8[0] + 1);
  *((_QWORD *)&v8[0] + 1) = v5;

  sub_100C4EFD4((uint64_t)v7, (uint64_t)v8);
  if (self)
    -[CuratedCollectionViewAnalyticsController _captureCollectionViewEvent:](self, "_captureCollectionViewEvent:", v7);
  else
    sub_10026DEA8(v7);
  sub_10026DEA8((id *)v8);

}

- (void)logPunchOutUsingAppWithIdentifier:(id)a3
{
  id v5;
  id v6[10];
  _OWORD v7[5];

  v5 = a3;
  memset(v7, 0, sizeof(v7));
  -[CuratedCollectionViewAnalyticsController _createBaseEvent](self, "_createBaseEvent");
  LODWORD(v7[0]) = 260;
  objc_storeStrong((id *)v7 + 1, a3);
  sub_100C4EFD4((uint64_t)v6, (uint64_t)v7);
  if (self)
    -[CuratedCollectionViewAnalyticsController _captureCollectionViewEvent:](self, "_captureCollectionViewEvent:", v6);
  else
    sub_10026DEA8(v6);
  sub_10026DEA8((id *)v7);

}

- (void)logSavePlaceItemToCuratedCollectionWithMUID:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8[10];
  _OWORD v9[5];

  memset(v9, 0, sizeof(v9));
  -[CuratedCollectionViewAnalyticsController _createBaseEvent](self, "_createBaseEvent");
  LODWORD(v9[0]) = 2073;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));
  v7 = (void *)*((_QWORD *)&v9[0] + 1);
  *((_QWORD *)&v9[0] + 1) = v6;

  sub_100C4EFD4((uint64_t)v8, (uint64_t)v9);
  if (self)
    -[CuratedCollectionViewAnalyticsController _captureCollectionViewEvent:](self, "_captureCollectionViewEvent:", v8);
  else
    sub_10026DEA8(v8);
  sub_10026DEA8((id *)v9);
}

- (void)logDiscoverMoreFromPublisher
{
  id v3[10];
  _OWORD v4[5];

  memset(v4, 0, sizeof(v4));
  -[CuratedCollectionViewAnalyticsController _createBaseEvent](self, "_createBaseEvent");
  LODWORD(v4[0]) = 2102;
  sub_100C4EFD4((uint64_t)v3, (uint64_t)v4);
  if (self)
    -[CuratedCollectionViewAnalyticsController _captureCollectionViewEvent:](self, "_captureCollectionViewEvent:", v3);
  else
    sub_10026DEA8(v3);
  sub_10026DEA8((id *)v4);
}

- (void)logOpenWebsite
{
  id v3[10];
  _OWORD v4[5];

  memset(v4, 0, sizeof(v4));
  -[CuratedCollectionViewAnalyticsController _createBaseEvent](self, "_createBaseEvent");
  LODWORD(v4[0]) = 2170;
  sub_100C4EFD4((uint64_t)v3, (uint64_t)v4);
  if (self)
    -[CuratedCollectionViewAnalyticsController _captureCollectionViewEvent:](self, "_captureCollectionViewEvent:", v3);
  else
    sub_10026DEA8(v3);
  sub_10026DEA8((id *)v4);
}

- (void)logOpenAppClipWithURL:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7[10];
  _OWORD v8[5];

  v4 = a3;
  memset(v8, 0, sizeof(v8));
  -[CuratedCollectionViewAnalyticsController _createBaseEvent](self, "_createBaseEvent");
  LODWORD(v8[0]) = 6090;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString"));
  v6 = (void *)*((_QWORD *)&v8[0] + 1);
  *((_QWORD *)&v8[0] + 1) = v5;

  sub_100C4EFD4((uint64_t)v7, (uint64_t)v8);
  if (self)
    -[CuratedCollectionViewAnalyticsController _captureCollectionViewEvent:](self, "_captureCollectionViewEvent:", v7);
  else
    sub_10026DEA8(v7);
  -[CuratedCollectionViewAnalyticsController logRevealAppClipWithURL:](self, "logRevealAppClipWithURL:", v4);
  sub_10026DEA8((id *)v8);

}

- (void)logRevealAppClipWithURL:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7[10];
  _OWORD v8[3];
  __int128 v9;
  __int128 v10;

  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  memset(v8, 0, sizeof(v8));
  -[CuratedCollectionViewAnalyticsController _createBaseEvent](self, "_createBaseEvent");
  LODWORD(v8[0]) = 6105;
  DWORD2(v9) = 670;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString"));
  v6 = (void *)*((_QWORD *)&v8[0] + 1);
  *((_QWORD *)&v8[0] + 1) = v5;

  sub_100C4EFD4((uint64_t)v7, (uint64_t)v8);
  if (self)
    -[CuratedCollectionViewAnalyticsController _captureCollectionViewEvent:](self, "_captureCollectionViewEvent:", v7);
  else
    sub_10026DEA8(v7);
  sub_10026DEA8((id *)v8);

}

- (CuratedCollectionViewEvent)_createBaseEvent
{
  void *v5;
  void *v6;
  CuratedCollectionViewEvent *result;
  id v8;

  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  *(_OWORD *)&retstr->var1 = 0u;
  retstr->var9 = 0;
  retstr->var10 = 0;
  retstr->var2 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[CuratedCollectionViewAnalyticsController collectionMUID](self, "collectionMUID")));
  retstr->var8 = 14;
  retstr->var7 = -[CuratedCollectionViewAnalyticsController target](self, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPlaceCollection publisher](self->_curatedCollection, "publisher"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  retstr->var6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "muid")));

  retstr->var3 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_saved));
  v8 = (id)objc_claimAutoreleasedReturnValue(-[GEOPlaceCollection collectionIdentifier](self->_curatedCollection, "collectionIdentifier"));
  retstr->var5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v8, "resultProviderID")));

  return result;
}

- (void)_captureCollectionViewEvent:(CuratedCollectionViewEvent *)a3
{
  uint64_t var0;
  uint64_t var7;
  id var1;
  void *v7;
  id var2;
  id var3;
  id var4;
  void *v11;
  const char *v12;
  uint8_t buf[16];
  id var6;

  var0 = a3->var0;
  if (!(_DWORD)var0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_WORD *)buf = 0;
    v12 = "Assertion failed: event.action != GEOUIAction_UI_ACTION_UNKNOWN";
LABEL_9:
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, v12, buf, 2u);
    goto LABEL_4;
  }
  var7 = a3->var7;
  if (!(_DWORD)var7)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_WORD *)buf = 0;
    v12 = "Assertion failed: event.target != GEOUITarget_UI_TARGET_UNKNOWN";
    goto LABEL_9;
  }
  var1 = a3->var1;
  var6 = a3->var6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &var6, 1));
  var2 = a3->var2;
  var3 = a3->var3;
  var4 = a3->var4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3->var8));
  +[GEOAPPortal captureCuratedCollectionUserAction:target:value:publisherId:following:collectionId:collectionCategory:collectionCurrentlySaved:verticalIndex:horizontalIndex:placeCardType:possibleActions:impossibleActions:providerId:repeatableSectionIndex:modules:](GEOAPPortal, "captureCuratedCollectionUserAction:target:value:publisherId:following:collectionId:collectionCategory:collectionCurrentlySaved:verticalIndex:horizontalIndex:placeCardType:possibleActions:impossibleActions:providerId:repeatableSectionIndex:modules:", var0, var7, var1, v7, 0, var2, 0, var3, var4, 0, v11, 0, 0, a3->var5, 0, 0);

LABEL_4:
  sub_10026DEA8((id *)a3);
}

+ (id)_eventValueForMediaType:(int64_t)a3
{
  if ((unint64_t)a3 > 0x14)
    return 0;
  else
    return off_1011EA040[a3];
}

- (unint64_t)collectionMUID
{
  return self->_collectionMUID;
}

- (void)setCollectionMUID:(unint64_t)a3
{
  self->_collectionMUID = a3;
}

- (int)target
{
  return self->_target;
}

- (GEOPlaceCollection)curatedCollection
{
  return self->_curatedCollection;
}

- (void)setCuratedCollection:(id)a3
{
  objc_storeStrong((id *)&self->_curatedCollection, a3);
}

- (BOOL)saved
{
  return self->_saved;
}

- (void)setSaved:(BOOL)a3
{
  self->_saved = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curatedCollection, 0);
}

@end
