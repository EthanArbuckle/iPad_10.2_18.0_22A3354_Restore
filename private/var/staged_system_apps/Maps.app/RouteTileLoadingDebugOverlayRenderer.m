@implementation RouteTileLoadingDebugOverlayRenderer

- (RouteTileLoadingDebugOverlayRenderer)initWithOverlay:(id)a3
{
  RouteTileLoadingDebugOverlayRenderer *v3;
  uint64_t v4;
  NSMutableDictionary *tileTypeToZoomLevels;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  unsigned int v19;
  NSMutableDictionary *v20;
  void *v21;
  void *v22;
  void *v23;
  RouteTileLoadingDebugOverlayRenderer *v24;
  void *v26;
  id obj;
  uint64_t v28;
  id v29;
  uint64_t v30;
  char *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];

  v36.receiver = self;
  v36.super_class = (Class)RouteTileLoadingDebugOverlayRenderer;
  v3 = -[RouteTileLoadingDebugOverlayRenderer initWithOverlay:](&v36, "initWithOverlay:", a3);
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    tileTypeToZoomLevels = v3->_tileTypeToZoomLevels;
    v3->_tileTypeToZoomLevels = (NSMutableDictionary *)v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activeTileGroup"));

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v26 = v7;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tileSets"));
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v29)
    {
      v28 = *(_QWORD *)v33;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v33 != v28)
            objc_enumerationMutation(obj);
          v30 = v8;
          v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v8);
          v10 = v3->_tileTypeToZoomLevels;
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v9, "style")));
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v11));

          if (!v12)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
            v14 = v3->_tileTypeToZoomLevels;
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v9, "style")));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v13, v15);

          }
          v31 = (char *)objc_msgSend(v9, "availableTiles");
          if (objc_msgSend(v9, "availableTilesCount"))
          {
            v16 = 0;
            do
            {
              v17 = &v31[24 * v16];
              v18 = *((unsigned int *)v17 + 5);
              v19 = *((_DWORD *)v17 + 2);
              while (v18 <= v19)
              {
                v20 = v3->_tileTypeToZoomLevels;
                v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v9, "style")));
                v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", v21));
                v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v18));
                objc_msgSend(v22, "addObject:", v23);

                v18 = (v18 + 1);
              }
              ++v16;
            }
            while (v16 < (unint64_t)objc_msgSend(v9, "availableTilesCount"));
          }
          v8 = v30 + 1;
        }
        while ((id)(v30 + 1) != v29);
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v29);
    }

    v24 = v3;
  }

  return v3;
}

- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5
{
  double var1;
  double var0;
  double v9;
  double v10;
  int v12;
  unsigned int v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void (**v22)(id, _QWORD);
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void (**v28)(id, _QWORD);
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  _QWORD v33[11];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v9 = a3.var0.var1;
  v10 = a3.var0.var0;
  v12 = (int)log2(MKMapSizeWorld.width * 0.001953125);
  v13 = vcvtmd_s64_f64(log2(a4) + 0.5);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100B32C74;
  v33[3] = &unk_1011E3A50;
  v33[4] = self;
  v33[5] = (v12 + v13) & ~((int)(v12 + v13) >> 31);
  *(double *)&v33[6] = v10;
  *(double *)&v33[7] = v9;
  *(double *)&v33[8] = var0;
  *(double *)&v33[9] = var1;
  v33[10] = a5;
  v14 = objc_retainBlock(v33);
  CGContextSaveGState(a5);
  CGContextSetLineWidth(a5, 2.0 / a4);
  CGContextSetRGBFillColor(a5, 0.0, 0.0, 1.0, 0.2);
  CGContextSetRGBStrokeColor(a5, 0.0, 0.0, 0.5, 0.4);
  v15 = objc_claimAutoreleasedReturnValue(-[RouteTileLoadingDebugOverlayRenderer overlay](self, "overlay"));
  v16 = v14;
  if (v15)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(v15 + 32));
    v37 = 0u;
    v35 = 0u;
    v36 = 0u;
    v34 = 0u;
    v17 = *(id *)(v15 + 16);
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v35;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v35 != v19)
            objc_enumerationMutation(v17);
          ((void (*)(_QWORD *, _QWORD))v16[2])(v16, *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v20));
          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v18);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(v15 + 32));
  }

  CGContextSetRGBFillColor(a5, 0.0, 1.0, 0.0, 0.2);
  CGContextSetRGBStrokeColor(a5, 0.0, 0.5, 0.0, 0.4);
  v21 = objc_claimAutoreleasedReturnValue(-[RouteTileLoadingDebugOverlayRenderer overlay](self, "overlay"));
  v22 = v16;
  if (v21)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(v21 + 32));
    v37 = 0u;
    v35 = 0u;
    v36 = 0u;
    v34 = 0u;
    v23 = *(id *)(v21 + 8);
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v35;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v35 != v25)
            objc_enumerationMutation(v23);
          v22[2](v22, *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v26));
          v26 = (char *)v26 + 1;
        }
        while (v24 != v26);
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v24);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(v21 + 32));
  }

  CGContextSetRGBFillColor(a5, 1.0, 0.0, 0.0, 0.2);
  CGContextSetRGBStrokeColor(a5, 0.5, 0.0, 0.0, 0.4);
  v27 = objc_claimAutoreleasedReturnValue(-[RouteTileLoadingDebugOverlayRenderer overlay](self, "overlay"));
  v28 = v22;
  if (v27)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(v27 + 32));
    v37 = 0u;
    v35 = 0u;
    v36 = 0u;
    v34 = 0u;
    v29 = *(id *)(v27 + 24);
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v35;
      do
      {
        v32 = 0;
        do
        {
          if (*(_QWORD *)v35 != v31)
            objc_enumerationMutation(v29);
          v28[2](v28, *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v32));
          v32 = (char *)v32 + 1;
        }
        while (v30 != v32);
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v30);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(v27 + 32));
  }

  CGContextRestoreGState(a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileTypeToZoomLevels, 0);
}

@end
