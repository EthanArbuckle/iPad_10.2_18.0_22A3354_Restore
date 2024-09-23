@implementation MapsMapDisplayDebugController

+ (id)navigationDestinationTitle
{
  return CFSTR("Map Display");
}

- (MapsMapDisplayDebugController)init
{
  MapsMapDisplayDebugController *v2;
  MapsMapDisplayDebugController *v3;
  uint64_t v4;
  NSMutableArray *mapsFeatureListeners;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MapsMapDisplayDebugController;
  v2 = -[MapsDebugValuesViewController init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    -[MapsMapDisplayDebugController setTitle:](v2, "setTitle:", CFSTR("Map Display"));
    v3->_shouldCaptureFrameToFile = 0;
    v4 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    mapsFeatureListeners = v3->_mapsFeatureListeners;
    v3->_mapsFeatureListeners = (NSMutableArray *)v4;

  }
  return v3;
}

- (void)dealloc
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_mapsFeatureListeners;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        MapsFeature_RemoveBlockListener(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)MapsMapDisplayDebugController;
  -[MapsDebugValuesViewController dealloc](&v8, "dealloc");
}

- (id)valueForKeyInAllMapLayers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugValuesViewController delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allVisibleMapViewsForDebugController:", self));

  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_mapLayer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", v4));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)setValue:(id)a3 forKeyInAllMapLayers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v6 = a3;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugValuesViewController delegate](self, "delegate", 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allVisibleMapViewsForDebugController:", self));

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_mapLayer"));
        objc_msgSend(v15, "setValue:forKey:", v6, v7);

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_mapLayer"));
        objc_msgSend(v16, "setNeedsLayout");

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

}

- ($6EFE6C6748B912A6EAC8A8E593ED1344)mapDisplayStyleInAllLayers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unsigned __int8 v8;
  unint64_t v9;
  int8x16_t v10;
  uint64x2_t v11;
  int8x16_t v12;
  int8x16_t v13;
  uint64_t v14;
  uint64_t v15;
  int8x16_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64x2_t v19;
  uint64x2_t v20;
  int8x16_t v21;
  int8x16_t v23;
  int8x16_t v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugValuesViewController delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allVisibleMapViewsForDebugController:", self));

  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_mapLayer"));
    v7 = (unint64_t)objc_msgSend(v6, "mapDisplayStyle");
    v8 = v7;
    v9 = v7 >> 8;
    v10.i64[0] = 0xFFFFFFFFFFFFLL;
    v10.i64[1] = 0xFFFFFFFFFFFFLL;
    v11 = (uint64x2_t)vandq_s8((int8x16_t)vdupq_n_s64(v7), v10);
    v24 = (int8x16_t)vshlq_u64(v11, (uint64x2_t)xmmword_100E3A250);
    v23 = (int8x16_t)vshlq_u64(v11, (uint64x2_t)xmmword_100E3A260);

    v12.i64[0] = 255;
    v12.i64[1] = 255;
    v13 = vandq_s8(v23, v12);
    v14 = v13.i64[1];
    v15 = v13.i64[0];
    v16 = vandq_s8(v24, v12);
    v17 = v16.i64[1];
    v18 = v16.i64[0];
  }
  else
  {
    v8 = 0;
    LOBYTE(v9) = 0;
    v18 = 0;
    v17 = 0;
    v15 = 0;
    v14 = 0;
  }

  v19.i64[0] = v18;
  v19.i64[1] = v17;
  v20.i64[0] = v15;
  v20.i64[1] = v14;
  v21 = vorrq_s8((int8x16_t)vshlq_u64(v19, (uint64x2_t)xmmword_100E3A270), (int8x16_t)vshlq_u64(v20, (uint64x2_t)xmmword_100E3A280));
  return ($6EFE6C6748B912A6EAC8A8E593ED1344)(*(_QWORD *)&vorr_s8(*(int8x8_t *)v21.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v21, v21, 8uLL)) | ((unint64_t)v9 << 8) | v8);
}

- (void)setMapDisplayStyleForAllLayers:(id)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = *(_QWORD *)&a3.var0;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugValuesViewController delegate](self, "delegate", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allVisibleMapViewsForDebugController:", self));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    v10 = v3 & 0xFFFFFFFFFFFFLL;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_mapLayer"));
        objc_msgSend(v13, "setMapDisplayStyle:", v10);

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_mapLayer"));
        objc_msgSend(v14, "setNeedsLayout");

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

- (void)enableMapDisplayStyleOverrideForAllLayers:(id)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = *(_QWORD *)&a3.var0;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugValuesViewController delegate](self, "delegate", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allVisibleMapViewsForDebugController:", self));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    v10 = v3 & 0xFFFFFFFFFFFFLL;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_mapLayer"));
        objc_msgSend(v13, "enableMapDisplayStyleDebugOverride:", v10);

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_mapLayer"));
        objc_msgSend(v14, "setNeedsLayout");

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

- (void)disableMapDisplayStyleOverrideForAllLayers
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugValuesViewController delegate](self, "delegate", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allVisibleMapViewsForDebugController:", self));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_mapLayer"));
        objc_msgSend(v10, "disableMapDisplayStyleDebugOverride");

        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_mapLayer"));
        objc_msgSend(v11, "setNeedsLayout");

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (id)addAllMapsSwitchRowToSection:(id)a3 title:(id)a4 key:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100718E5C;
  v18[3] = &unk_1011C1818;
  objc_copyWeak(&v20, &location);
  v11 = v10;
  v19 = v11;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100718EB0;
  v15[3] = &unk_1011AC888;
  objc_copyWeak(&v17, &location);
  v12 = v11;
  v16 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "addSwitchRowWithTitle:get:set:", v9, v18, v15));

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v13;
}

- (id)addAllMapsSwitchRowToSection:(id)a3 title:(id)a4 selector:(SEL)a5 key:(id)a6
{
  void *var1;
  void *v7;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16[4];
  _QWORD v17[6];
  id location;

  var1 = a6.var0.var1;
  v7 = *(void **)&a6.var0.var0;
  v11 = a3;
  v12 = a4;
  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100719030;
  v17[3] = &unk_1011BFA50;
  v17[4] = v7;
  v17[5] = var1;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10071903C;
  v15[3] = &unk_1011C1840;
  objc_copyWeak(v16, &location);
  v16[1] = v7;
  v16[2] = var1;
  v16[3] = (id)a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "addSwitchRowWithTitle:get:set:", v12, v17, v15));
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

  return v13;
}

- (id)addAllMapsSwitchRowToSection:(id)a3 title:(id)a4 forVectorKitDebugKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10071920C;
  v17[3] = &unk_1011AEB50;
  v18 = v10;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100719268;
  v14[3] = &unk_1011C1868;
  v11 = v18;
  v15 = v11;
  objc_copyWeak(&v16, &location);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "addSwitchRowWithTitle:get:set:", v9, v17, v14));
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
  return v12;
}

- (void)_setAllMapLayersNeedLayout
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugValuesViewController delegate](self, "delegate", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allVisibleMapViewsForDebugController:", self));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8), "_mapLayer"));
        objc_msgSend(v9, "setNeedsLayout");

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)_activateMapInspector:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100719518;
  v6[3] = &unk_1011AC888;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  v5 = objc_msgSend(v4, "addSwitchRowWithTitle:get:set:", CFSTR("Activate Map Inspector"), &stru_1011C1888, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)prepareContent
{
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1007196D8;
  v6[3] = &unk_1011B4F90;
  objc_copyWeak(&v8, &location);
  v4 = v3;
  v7 = v4;
  v5 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Map Display"), v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)runNextTourIndex:(unint64_t)a3 withTours:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  MapsMapDisplayDebugController *v15;
  unint64_t v16;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugValuesViewController delegate](self, "delegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allVisibleMapViewsForDebugController:", self));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a3));
  v11 = objc_msgSend(v10, "unsignedLongLongValue");
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100733538;
  v13[3] = &unk_1011C4ED8;
  v15 = self;
  v16 = a3;
  v14 = v6;
  v12 = v6;
  objc_msgSend(v9, "_startFlyoverTourAnimation:duration:completion:", v11, v13, 180.0);

}

+ (void)completelyFlushTiles
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader"));
  objc_msgSend(v2, "shrinkDiskCacheToSize:callbackQ:finished:", 0, &_dispatch_main_q, &stru_1011C4F18);

}

+ (void)resetSSAOValues
{
  void *v2;
  double v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings"));
  LODWORD(v3) = 1.0;
  objc_msgSend(v2, "setSsaoMaxIntensity:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings"));
  LODWORD(v5) = 1025758986;
  objc_msgSend(v4, "setSsaoMaxDistance:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings"));
  LODWORD(v7) = 1109393408;
  objc_msgSend(v6, "setSsaoFalloffScale:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings"));
  objc_msgSend(v8, "setSsaoOverrideOn:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings"));
  LODWORD(v10) = 0.5;
  objc_msgSend(v9, "setSsaoOverrideIntensity:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings"));
  LODWORD(v12) = 0.5;
  objc_msgSend(v11, "setSsaoOverrideRadius:", v12);

  GEOConfigSetBOOL(VectorKitDebugConfig_SSAODemoButtonEnabled[0], VectorKitDebugConfig_SSAODemoButtonEnabled[1], 0);
}

- (BOOL)shouldCaptureFrameToFile
{
  return self->_shouldCaptureFrameToFile;
}

- (void)setShouldCaptureFrameToFile:(BOOL)a3
{
  self->_shouldCaptureFrameToFile = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsFeatureListeners, 0);
}

@end
