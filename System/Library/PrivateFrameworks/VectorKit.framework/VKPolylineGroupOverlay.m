@implementation VKPolylineGroupOverlay

- (void)dealloc
{
  __CFSet *observers;
  objc_super v4;

  observers = self->_observers;
  if (observers)
    CFRelease(observers);
  v4.receiver = self;
  v4.super_class = (Class)VKPolylineGroupOverlay;
  -[VKPolylineGroupOverlay dealloc](&v4, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  id v4;
  __CFSet *observers;
  CFSetCallBacks v6;

  v4 = a3;
  observers = self->_observers;
  if (!observers)
  {
    v6 = *(CFSetCallBacks *)byte_1E42F3940;
    observers = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &v6);
    self->_observers = observers;
  }
  CFSetAddValue(observers, v4);

}

- (void)removeObserver:(id)a3
{
  CFSetRemoveValue(self->_observers, a3);
}

- (void)setShowTraffic:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  _BOOL4 v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitRouteLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitRouteLog_onceToken, &__block_literal_global_25_11794);
  v5 = (id)GEOGetVectorKitRouteLog_log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v16 = v3;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "VKPolylineGroupOverlay setShowTraffic: %d", buf, 8u);
  }

  if (self->_showTraffic != v3)
  {
    self->_showTraffic = v3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_polylines;
    v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "setShowTraffic:", v3, (_QWORD)v10);
        }
        v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)addPolyline:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _BOOL4 showTraffic;
  void *v9;
  NSMutableSet *polylines;
  NSMutableSet *v11;
  NSMutableSet *v12;
  __CFSet *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  VKPolylineGroupOverlay *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (GEOGetVectorKitRouteLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitRouteLog_onceToken, &__block_literal_global_25_11794);
  v5 = (id)GEOGetVectorKitRouteLog_log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "composedRoute");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueRouteID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    showTraffic = self->_showTraffic;
    objc_msgSend(v4, "traffic");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v23 = self;
    v24 = 2112;
    v25 = v7;
    v26 = 1024;
    v27 = showTraffic;
    v28 = 2112;
    v29 = v9;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "VKPolylineGroupOverlay %p addPolyline | route: %@ | _showTraffic: %d | traffic: %@", buf, 0x26u);

  }
  polylines = self->_polylines;
  if (!polylines)
  {
    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v12 = self->_polylines;
    self->_polylines = v11;

    polylines = self->_polylines;
  }
  if ((-[NSMutableSet containsObject:](polylines, "containsObject:", v4) & 1) == 0)
  {
    objc_msgSend(v4, "setShowTraffic:", self->_showTraffic);
    -[NSMutableSet addObject:](self->_polylines, "addObject:", v4);
    -[VKPolylineGroupOverlay _updateBoundingMapRegion](self, "_updateBoundingMapRegion");
    -[VKPolylineGroupOverlay _updateContainsTransit](self, "_updateContainsTransit");
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v13 = self->_observers;
    v14 = -[__CFSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "polylineGroup:didAddPolyline:", self, v4, (_QWORD)v17);
        }
        v14 = -[__CFSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v14);
    }

  }
}

- (void)removePolyline:(id)a3
{
  VKPolylineOverlay *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _BOOL4 showTraffic;
  void *v9;
  __CFSet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  VKPolylineGroupOverlay *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (VKPolylineOverlay *)a3;
  if (GEOGetVectorKitRouteLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitRouteLog_onceToken, &__block_literal_global_25_11794);
  v5 = (id)GEOGetVectorKitRouteLog_log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[VKPolylineOverlay composedRoute](v4, "composedRoute");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueRouteID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    showTraffic = self->_showTraffic;
    -[VKPolylineOverlay traffic](v4, "traffic");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v20 = self;
    v21 = 2112;
    v22 = v7;
    v23 = 1024;
    v24 = showTraffic;
    v25 = 2112;
    v26 = v9;
    _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "VKPolylineGroupOverlay %p removePolyline | route: %@ | _showTraffic: %d | traffic: %@", buf, 0x26u);

  }
  if ((-[NSMutableSet containsObject:](self->_polylines, "containsObject:", v4) & 1) != 0
    && -[NSMutableSet containsObject:](self->_polylines, "containsObject:", v4))
  {
    if (self->_selectedPolyline == v4)
      -[VKPolylineGroupOverlay setSelectedPolyline:](self, "setSelectedPolyline:", 0);
    if (self->_focusedPolyline == v4)
      -[VKPolylineGroupOverlay setFocusedPolyline:](self, "setFocusedPolyline:", 0);
    if (self->_skippedPolyline == v4)
      -[VKPolylineGroupOverlay setSkippedPolyline:](self, "setSkippedPolyline:", 0);
    -[NSMutableSet removeObject:](self->_polylines, "removeObject:", v4);
    -[VKPolylineGroupOverlay _updateBoundingMapRegion](self, "_updateBoundingMapRegion");
    -[VKPolylineGroupOverlay _updateContainsTransit](self, "_updateContainsTransit");
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v10 = self->_observers;
    v11 = -[__CFSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "polylineGroup:didRemovePolyline:", self, v4, (_QWORD)v14);
        }
        v11 = -[__CFSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (void)setSelectedPolyline:(id)a3
{
  VKPolylineOverlay *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  VKPolylineOverlay *selectedPolyline;
  id *p_selectedPolyline;
  __CFSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  VKPolylineGroupOverlay *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (VKPolylineOverlay *)a3;
  if (GEOGetVectorKitRouteLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitRouteLog_onceToken, &__block_literal_global_25_11794);
  v6 = (id)GEOGetVectorKitRouteLog_log;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    -[VKPolylineOverlay composedRoute](v5, "composedRoute");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueRouteID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v21 = self;
    v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_19F029000, v6, OS_LOG_TYPE_INFO, "VKPolylineGroupOverlay %p setSelectedPolyline | route: %@", buf, 0x16u);

  }
  p_selectedPolyline = (id *)&self->_selectedPolyline;
  selectedPolyline = self->_selectedPolyline;
  if (selectedPolyline != v5)
  {
    if (v5)
    {
      if (!-[NSMutableSet containsObject:](self->_polylines, "containsObject:", v5))
        goto LABEL_17;
      selectedPolyline = (VKPolylineOverlay *)*p_selectedPolyline;
    }
    -[VKPolylineOverlay setSelected:](selectedPolyline, "setSelected:", 0);
    objc_storeStrong((id *)&self->_selectedPolyline, a3);
    objc_msgSend(*p_selectedPolyline, "setSelected:", 1);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v11 = self->_observers;
    v12 = -[__CFSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "polylineGroup:didSelectPolyline:", self, v5, (_QWORD)v15);
        }
        v12 = -[__CFSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }

  }
LABEL_17:

}

- (void)setFocusedPolyline:(id)a3
{
  VKPolylineOverlay *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  VKPolylineOverlay *focusedPolyline;
  id *p_focusedPolyline;
  __CFSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  VKPolylineGroupOverlay *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (VKPolylineOverlay *)a3;
  if (GEOGetVectorKitRouteLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitRouteLog_onceToken, &__block_literal_global_25_11794);
  v6 = (id)GEOGetVectorKitRouteLog_log;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    -[VKPolylineOverlay composedRoute](v5, "composedRoute");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueRouteID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v21 = self;
    v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_19F029000, v6, OS_LOG_TYPE_INFO, "VKPolylineGroupOverlay %p setFocusedPolyline | route: %@", buf, 0x16u);

  }
  p_focusedPolyline = (id *)&self->_focusedPolyline;
  focusedPolyline = self->_focusedPolyline;
  if (focusedPolyline != v5)
  {
    if (v5)
    {
      if (!-[NSMutableSet containsObject:](self->_polylines, "containsObject:", v5))
        goto LABEL_17;
      focusedPolyline = (VKPolylineOverlay *)*p_focusedPolyline;
    }
    -[VKPolylineOverlay setHasFocus:](focusedPolyline, "setHasFocus:", 0);
    objc_storeStrong((id *)&self->_focusedPolyline, a3);
    objc_msgSend(*p_focusedPolyline, "setHasFocus:", 1);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v11 = self->_observers;
    v12 = -[__CFSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "polylineGroup:didFocusPolyline:", self, v5, (_QWORD)v15);
        }
        v12 = -[__CFSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }

  }
LABEL_17:

}

- (void)setSkippedPolyline:(id)a3
{
  VKPolylineOverlay *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  VKPolylineOverlay *skippedPolyline;
  id *p_skippedPolyline;
  __CFSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  VKPolylineGroupOverlay *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (VKPolylineOverlay *)a3;
  if (GEOGetVectorKitRouteLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitRouteLog_onceToken, &__block_literal_global_25_11794);
  v6 = (id)GEOGetVectorKitRouteLog_log;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    -[VKPolylineOverlay composedRoute](v5, "composedRoute");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueRouteID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v21 = self;
    v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_19F029000, v6, OS_LOG_TYPE_INFO, "VKPolylineGroupOverlay %p setSelectedPolyline | route: %@", buf, 0x16u);

  }
  p_skippedPolyline = (id *)&self->_skippedPolyline;
  skippedPolyline = self->_skippedPolyline;
  if (skippedPolyline != v5)
  {
    if (v5)
    {
      if (!-[NSMutableSet containsObject:](self->_polylines, "containsObject:", v5))
        goto LABEL_17;
      skippedPolyline = (VKPolylineOverlay *)*p_skippedPolyline;
    }
    -[VKPolylineOverlay setSkipped:](skippedPolyline, "setSkipped:", 0);
    objc_storeStrong((id *)&self->_skippedPolyline, a3);
    objc_msgSend(*p_skippedPolyline, "setSkipped:", 1);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v11 = self->_observers;
    v12 = -[__CFSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "polylineGroup:didSkipPolyline:", self, v5, (_QWORD)v15);
        }
        v12 = -[__CFSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }

  }
LABEL_17:

}

- (void)_updateBoundingMapRegion
{
  GEOMapRegion *boundingMapRegion;
  GEOMapRegion *v4;
  GEOMapRegion *v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  GEOMapRegion *v13;
  double v14;
  double v15;
  double v16;
  GEOMapRegion *v17;
  double v18;
  double v19;
  double v20;
  GEOMapRegion *v21;
  double v22;
  double v23;
  double v24;
  GEOMapRegion *v25;
  double v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  boundingMapRegion = self->_boundingMapRegion;
  self->_boundingMapRegion = 0;

  if (-[NSMutableSet count](self->_polylines, "count"))
  {
    v4 = (GEOMapRegion *)objc_alloc_init(MEMORY[0x1E0D27208]);
    v5 = self->_boundingMapRegion;
    self->_boundingMapRegion = v4;

    -[GEOMapRegion setNorthLat:](self->_boundingMapRegion, "setNorthLat:", -90.0);
    -[GEOMapRegion setSouthLat:](self->_boundingMapRegion, "setSouthLat:", 90.0);
    -[GEOMapRegion setEastLng:](self->_boundingMapRegion, "setEastLng:", -180.0);
    -[GEOMapRegion setWestLng:](self->_boundingMapRegion, "setWestLng:", 180.0);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = self->_polylines;
    v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v29;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v29 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v9), "boundingMapRegion", (_QWORD)v28);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOMapRegion northLat](self->_boundingMapRegion, "northLat");
          v12 = v11;
          objc_msgSend(v10, "northLat");
          v13 = (GEOMapRegion *)v10;
          if (v12 > v14)
            v13 = self->_boundingMapRegion;
          -[GEOMapRegion northLat](v13, "northLat");
          -[GEOMapRegion setNorthLat:](self->_boundingMapRegion, "setNorthLat:");
          -[GEOMapRegion southLat](self->_boundingMapRegion, "southLat");
          v16 = v15;
          objc_msgSend(v10, "southLat");
          v17 = (GEOMapRegion *)v10;
          if (v16 < v18)
            v17 = self->_boundingMapRegion;
          -[GEOMapRegion southLat](v17, "southLat");
          -[GEOMapRegion setSouthLat:](self->_boundingMapRegion, "setSouthLat:");
          -[GEOMapRegion eastLng](self->_boundingMapRegion, "eastLng");
          v20 = v19;
          objc_msgSend(v10, "eastLng");
          v21 = (GEOMapRegion *)v10;
          if (v20 > v22)
            v21 = self->_boundingMapRegion;
          -[GEOMapRegion eastLng](v21, "eastLng");
          -[GEOMapRegion setEastLng:](self->_boundingMapRegion, "setEastLng:");
          -[GEOMapRegion westLng](self->_boundingMapRegion, "westLng");
          v24 = v23;
          objc_msgSend(v10, "westLng");
          v25 = (GEOMapRegion *)v10;
          if (v24 < v26)
            v25 = self->_boundingMapRegion;
          -[GEOMapRegion westLng](v25, "westLng");
          -[GEOMapRegion setWestLng:](self->_boundingMapRegion, "setWestLng:");

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v7);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "postNotificationName:object:", CFSTR("VKRouteOverlayBoundingMapRegionDidChange"), self);

  }
}

- (void)_updateContainsTransit
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  char v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  self->_containsTransit = 0;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_polylines;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if (self->_containsTransit)
          v7 = 1;
        else
          v7 = objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "containsTransit", (_QWORD)v8);
        self->_containsTransit = v7;
      }
      v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[GEOMapRegion southLat](self->_boundingMapRegion, "southLat");
  v4 = v3;
  -[GEOMapRegion northLat](self->_boundingMapRegion, "northLat");
  v6 = (v5 + v4) * 0.5;
  -[GEOMapRegion westLng](self->_boundingMapRegion, "westLng");
  v8 = v7;
  -[GEOMapRegion eastLng](self->_boundingMapRegion, "eastLng");
  v10 = (v9 + v8) * 0.5;
  v11 = v6;
  result.var1 = v10;
  result.var0 = v11;
  return result;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<VKPolylineGroupOverlay: %p polylines:%@>"), self, self->_polylines);
}

- (NSSet)polylines
{
  return &self->_polylines->super;
}

- (GEOMapRegion)boundingMapRegion
{
  return self->_boundingMapRegion;
}

- (VKPolylineOverlay)selectedPolyline
{
  return self->_selectedPolyline;
}

- (VKPolylineOverlay)focusedPolyline
{
  return self->_focusedPolyline;
}

- (VKPolylineOverlay)skippedPolyline
{
  return self->_skippedPolyline;
}

- (BOOL)containsTransit
{
  return self->_containsTransit;
}

- (BOOL)showTraffic
{
  return self->_showTraffic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skippedPolyline, 0);
  objc_storeStrong((id *)&self->_focusedPolyline, 0);
  objc_storeStrong((id *)&self->_selectedPolyline, 0);
  objc_storeStrong((id *)&self->_boundingMapRegion, 0);
  objc_storeStrong((id *)&self->_polylines, 0);
}

@end
