@implementation TransitDirectionsStepsListDataProvider

- (TransitDirectionsStepsListDataProvider)initWithRoute:(id)a3 forGuidance:(BOOL)a4
{
  id v6;
  TransitDirectionsStepsListDataProvider *v7;
  TransitDirectionsStepsListDataProvider *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TransitDirectionsStepsListDataProvider;
  v7 = -[TransitDirectionsStepsListDataProvider init](&v10, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_route, v6);
    v8->_forGuidance = a4;
  }

  return v8;
}

- (BOOL)hasBuiltItems
{
  return self->_mutableItems != 0;
}

- (NSArray)items
{
  NSMutableArray *mutableItems;

  mutableItems = self->_mutableItems;
  if (!mutableItems)
  {
    -[TransitDirectionsStepsListDataProvider _buildItems](self, "_buildItems");
    mutableItems = self->_mutableItems;
  }
  return (NSArray *)mutableItems;
}

- (unint64_t)numberOfSections
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider items](self, "items"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  return -[TransitDirectionsStepsListDataProvider numberOfItemsInSection:includingHiddenSubitems:](self, "numberOfItemsInSection:includingHiddenSubitems:", a3, 0);
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3 includingHiddenSubitems:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  unint64_t v12;
  void *v13;

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider items](self, "items"));
  v8 = objc_msgSend(v7, "count");

  if ((unint64_t)v8 <= a3)
    return 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider items](self, "items"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", a3));

  if (objc_msgSend(v10, "conformsToProtocol:", &OBJC_PROTOCOL___TransitDirectionsListExpandableItem))
  {
    v11 = objc_msgSend(v10, "numberOfSubItemsWithForceExpand:", v4);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subItems"));
    v11 = objc_msgSend(v13, "count");

  }
  v12 = (unint64_t)v11 + 1;

  return v12;
}

- (id)itemAtIndexPath:(id)a3
{
  return -[TransitDirectionsStepsListDataProvider _itemAtIndexPath:includingHiddenSubitems:](self, "_itemAtIndexPath:includingHiddenSubitems:", a3, 0);
}

- (id)_itemAtIndexPath:(id)a3 includingHiddenSubitems:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider items](self, "items"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider _itemAtIndexPath:currentPosition:inItems:includingHiddenSubitems:](self, "_itemAtIndexPath:currentPosition:inItems:includingHiddenSubitems:", v6, 0, v7, v4));

  return v8;
}

- (id)_itemAtIndexPath:(id)a3 currentPosition:(unint64_t)a4 inItems:(id)a5 includingHiddenSubitems:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v6 = a6;
  v10 = a3;
  v11 = a5;
  if ((unint64_t)objc_msgSend(v10, "length") <= a4
    || (v12 = objc_msgSend(v10, "indexAtPosition:", a4), v12 >= objc_msgSend(v11, "count")))
  {
    v14 = 0;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v12));
    if ((char *)objc_msgSend(v10, "length") - 1 == (_BYTE *)a4)
    {
      v14 = v13;
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v13));
      if (objc_msgSend(v13, "conformsToProtocol:", &OBJC_PROTOCOL___TransitDirectionsListExpandableItem))
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "subItemsWithForceExpand:", v6));
      else
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "subItems"));
      v17 = (void *)v16;
      objc_msgSend(v15, "addObjectsFromArray:", v16);

      v14 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider _itemAtIndexPath:currentPosition:inItems:includingHiddenSubitems:](self, "_itemAtIndexPath:currentPosition:inItems:includingHiddenSubitems:", v10, a4 + 1, v15, v6));
    }

  }
  return v14;
}

- (id)indexPathForItem:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;

  v4 = a3;
  if (-[TransitDirectionsStepsListDataProvider numberOfSections](self, "numberOfSections"))
  {
    v5 = 0;
    while (1)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, v5));
      v7 = objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider itemAtIndexPath:](self, "itemAtIndexPath:", v6));
      if ((id)v7 == v4)
        break;
      v8 = (void *)v7;
      v9 = -[TransitDirectionsStepsListDataProvider numberOfItemsInSection:](self, "numberOfItemsInSection:", v5);
      if (v9 < 2)
      {
        v13 = v8;
      }
      else
      {
        v10 = v9;
        v11 = 1;
        while (1)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v11, v5));
          v13 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider itemAtIndexPath:](self, "itemAtIndexPath:", v12));

          if (v13 == v4)
            break;
          ++v11;
          v8 = v13;
          if (v10 == v11)
            goto LABEL_11;
        }
        v13 = v4;
        if (v6)
          goto LABEL_14;
      }
LABEL_11:

      if (++v5 >= -[TransitDirectionsStepsListDataProvider numberOfSections](self, "numberOfSections"))
        goto LABEL_12;
    }
    v14 = v6;
LABEL_14:

  }
  else
  {
LABEL_12:
    v6 = 0;
  }

  return v6;
}

- (unint64_t)indexForItem:(id)a3 inSection:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, a4));
  v8 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider itemAtIndexPath:](self, "itemAtIndexPath:", v7));

  if (v8 == v6)
  {
    v14 = 0;
LABEL_9:
    v8 = v6;
    goto LABEL_10;
  }
  v9 = -[TransitDirectionsStepsListDataProvider numberOfItemsInSection:](self, "numberOfItemsInSection:", a4);
  if (v9 >= 2)
  {
    v10 = v9;
    v11 = 1;
    while (1)
    {
      v12 = v8;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v11, a4));
      v8 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider itemAtIndexPath:](self, "itemAtIndexPath:", v13));

      if (v8 == v6)
        break;
      if (v10 == ++v11)
        goto LABEL_6;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v11, a4));
    v14 = (unint64_t)objc_msgSend(v15, "row");

    goto LABEL_9;
  }
LABEL_6:
  v14 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_10:

  return v14;
}

- (void)_buildItems
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *mutableItems;
  NSMutableArray *v12;
  NSMutableArray *mutableSegmentRanges;
  NSMutableArray *v14;
  void *v15;
  GEOComposedRouteStep *currentStep;
  unint64_t stepIdx;
  uint64_t v18;
  char isKindOfClass;
  GEOComposedRouteStep *v20;
  void *v21;
  GEOComposedRouteStep *v22;
  void *v23;
  uint64_t v24;
  unsigned int v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  GEOComposedRouteStep *prefixStepForNextBoardItem;
  void *v31;
  NSMutableArray *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  unint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider route](self, "route"));
  v4 = sub_100524D88();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "origin"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navDisplayName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "destination"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navDisplayName"));
    *(_DWORD *)buf = 138478339;
    v36 = (unint64_t)v7;
    v37 = 2113;
    v38 = v9;
    v39 = 2048;
    v40 = objc_msgSend(v3, "stepsCount");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Start building items for route \"%{private}@ → %{private}@\", %lu steps", buf, 0x20u);

  }
  v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mutableItems = self->_mutableItems;
  self->_mutableItems = v10;

  v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mutableSegmentRanges = self->_mutableSegmentRanges;
  self->_mutableSegmentRanges = v12;

  self->_hasIncidentItems = 0;
  self->_stepIdx = 0;
  self->_segmentRangeLocation = 0;
  self->_segmentRangeLength = 0;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider _originItem](self, "_originItem"));
  -[TransitDirectionsStepsListDataProvider _appendItem:toArray:](self, "_appendItem:toArray:");
  v14 = self->_mutableSegmentRanges;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](NSValue, "valueWithRange:", self->_segmentRangeLocation, 1));
  -[NSMutableArray addObject:](v14, "addObject:", v15);

  ++self->_segmentRangeLocation;
  -[TransitDirectionsStepsListDataProvider _updateCurrentStepToIndex:](self, "_updateCurrentStepToIndex:", self->_stepIdx);
  currentStep = self->_currentStep;
  if (currentStep)
  {
    while (1)
    {
      stepIdx = self->_stepIdx;
      v18 = objc_opt_class(GEOComposedWalkingRouteStep);
      isKindOfClass = objc_opt_isKindOfClass(currentStep, v18);
      v20 = self->_currentStep;
      if ((isKindOfClass & 1) != 0)
        break;
      v24 = objc_opt_class(GEOComposedTransitRouteStep);
      if ((objc_opt_isKindOfClass(v20, v24) & 1) != 0)
      {
        v22 = self->_currentStep;
        switch(-[GEOComposedRouteStep maneuver](v22, "maneuver"))
        {
          case 0u:
          case 1u:
          case 2u:
          case 4u:
          case 5u:
          case 8u:
          case 9u:
          case 0xAu:
            goto LABEL_17;
          case 3u:
            -[TransitDirectionsStepsListDataProvider _consumeTransitTripSegment](self, "_consumeTransitTripSegment");
            prefixStepForNextBoardItem = self->_prefixStepForNextBoardItem;
            self->_prefixStepForNextBoardItem = 0;

            break;
          case 6u:
          case 7u:
            objc_storeStrong((id *)&self->_prefixStepForNextBoardItem, self->_currentStep);
            goto LABEL_17;
          default:
            goto LABEL_19;
        }
        goto LABEL_19;
      }
      -[TransitDirectionsStepsListDataProvider _incrementStep](self, "_incrementStep");
LABEL_20:
      if (stepIdx == self->_stepIdx)
      {
        -[TransitDirectionsStepsListDataProvider _incrementStep](self, "_incrementStep");
        v28 = sub_100524D88();
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v36 = stepIdx;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "stepIdx had to be manually incremented from %lu", buf, 0xCu);
        }

      }
      currentStep = self->_currentStep;
      if (!currentStep)
        goto LABEL_27;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep getPreviousStep](self->_currentStep, "getPreviousStep"));
    v22 = (GEOComposedRouteStep *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "transitStep"));

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep transitStep](self->_currentStep, "transitStep"));
    if (objc_msgSend(v23, "maneuverType") == 10)
    {
      if (-[GEOComposedRouteStep maneuverType](v22, "maneuverType") == 7)
      {

        goto LABEL_14;
      }
      v25 = -[GEOComposedRouteStep maneuverType](v22, "maneuverType");

      if (v25 == 5)
      {
LABEL_14:
        v26 = sub_100524D88();
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Skipping over Walking/Arrival step since it follows GOTO_STOP or ALIGHT", buf, 2u);
        }

LABEL_17:
        -[TransitDirectionsStepsListDataProvider _incrementStep](self, "_incrementStep");
        goto LABEL_19;
      }
    }
    else
    {

    }
    -[TransitDirectionsStepsListDataProvider _consumeWalkingSegment](self, "_consumeWalkingSegment");
LABEL_19:

    goto LABEL_20;
  }
LABEL_27:
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider _destinationItem](self, "_destinationItem"));
  -[TransitDirectionsStepsListDataProvider _appendItem:toArray:](self, "_appendItem:toArray:", v31, self->_mutableItems);
  v32 = self->_mutableSegmentRanges;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](NSValue, "valueWithRange:", self->_segmentRangeLocation, 1));
  -[NSMutableArray addObject:](v32, "addObject:", v33);

  -[TransitDirectionsStepsListDataProvider _debugPrintHierarchy](self, "_debugPrintHierarchy");
}

- (void)_debugPrintHierarchy
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  id v6;
  NSMutableArray *mutableItems;
  id v8;
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  Block_layout *v13;
  uint8_t buf[4];
  id v15;

  v3 = sub_100524D88();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_mutableItems, "count"));
    mutableItems = self->_mutableItems;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1005251F8;
    v11[3] = &unk_1011BA370;
    v13 = &stru_1011BA320;
    v8 = v6;
    v12 = v8;
    -[NSMutableArray enumerateObjectsUsingBlock:](mutableItems, "enumerateObjectsUsingBlock:", v11);
    v9 = sub_100524D88();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Finished building items: %@", buf, 0xCu);
    }

  }
}

- (void)_incrementStep
{
  -[TransitDirectionsStepsListDataProvider _updateCurrentStepToIndex:](self, "_updateCurrentStepToIndex:", self->_stepIdx + 1);
}

- (void)_insertItem:(id)a3 atIndex:(unint64_t)a4 inArray:(id)a5
{
  NSMutableArray *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = (NSMutableArray *)a5;
  v9 = -[NSMutableArray count](v8, "count");
  v10 = (unint64_t)v9;
  if ((unint64_t)v9 >= a4)
    v11 = a4;
  else
    v11 = (unint64_t)v9;
  if (v14 && v8)
  {
    if (self->_mutableItems == v8)
    {
      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v8, "objectAtIndexedSubscript:", v11 - 1));
        objc_msgSend(v12, "setNextItem:", v14);
        objc_msgSend(v14, "setPreviousItem:", v12);

      }
      if (v10 > a4)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v8, "objectAtIndexedSubscript:", v11));
        objc_msgSend(v14, "setNextItem:", v13);
        objc_msgSend(v13, "setPreviousItem:", v14);

      }
    }
    -[NSMutableArray insertObject:atIndex:](v8, "insertObject:atIndex:", v14, v11);
  }

}

- (void)_appendItem:(id)a3 toArray:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[TransitDirectionsStepsListDataProvider _insertItem:atIndex:inArray:](self, "_insertItem:atIndex:inArray:", v7, objc_msgSend(v6, "count"), v6);

}

- (void)_updateCurrentStepToIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  GEOComposedRouteStep *v7;
  void *v8;
  uint64_t v9;
  GEOComposedRouteStep **p_currentStep;
  GEOComposedRouteStep *v11;
  GEOComposedRouteStep *currentStep;
  GEOComposedRouteStep *v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  GEOComposedRouteStep *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  int v21;
  GEOComposedRouteStep *v22;

  self->_stepIdx = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider route](self, "route"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "steps"));
  if ((unint64_t)objc_msgSend(v6, "count") <= a3)
  {
    currentStep = self->_currentStep;
    p_currentStep = &self->_currentStep;
    v7 = currentStep;
    *p_currentStep = 0;
  }
  else
  {
    v7 = (GEOComposedRouteStep *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider route](self, "route"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep steps](v7, "steps"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", self->_stepIdx));
    v11 = self->_currentStep;
    p_currentStep = &self->_currentStep;
    *p_currentStep = (GEOComposedRouteStep *)v9;

  }
  v13 = *p_currentStep;
  v14 = sub_100524D88();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
  if (v13)
  {
    if (v16)
    {
      v17 = *p_currentStep;
      v21 = 138412290;
      v22 = v17;
      v18 = "-> %@";
      v19 = v15;
      v20 = 12;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, v18, (uint8_t *)&v21, v20);
    }
  }
  else if (v16)
  {
    LOWORD(v21) = 0;
    v18 = "End of route";
    v19 = v15;
    v20 = 2;
    goto LABEL_9;
  }

}

- (id)_originItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  TransitDirectionsListImageItem *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  id v23;
  id v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider route](self, "route"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "origin"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mkMapItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
  objc_msgSend(v6, "screenScale");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapItem _maps_markerImageForMapItem:scale:size:useMarkerFallback:](MKMapItem, "_maps_markerImageForMapItem:scale:size:useMarkerFallback:", v5, 3, 1));

  v8 = -[TransitDirectionsListImageItem initWithImage:instructions:]([TransitDirectionsListImageItem alloc], "initWithImage:instructions:", v7, 0);
  -[TransitDirectionsListItem setType:](v8, "setType:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Start [Transit List View]"), CFSTR("localized string not found"), 0));

  v11 = objc_msgSend(objc_alloc((Class)GEOComposedString), "initWithString:", v10);
  v24 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
  -[TransitDirectionsListItem setMajorFormattedStrings:](v8, "setMajorFormattedStrings:", v12);

  v13 = objc_alloc((Class)GEOComposedString);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider _originTitle](self, "_originTitle"));
  v15 = objc_msgSend(v13, "initWithString:", v14);

  if (v15)
  {
    v23 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    -[TransitDirectionsListItem setMinorFormattedStrings:](v8, "setMinorFormattedStrings:", v16);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider route](self, "route"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "steps"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));

  if (v19)
  {
    v22 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
    -[TransitDirectionsListItem setComposedRouteStepsDisplayedOnMap:](v8, "setComposedRouteStepsDisplayedOnMap:", v20);

  }
  return v8;
}

- (id)_originTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider route](self, "route"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_maps_directionsWaypoints"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider _titleForWaypoint:](self, "_titleForWaypoint:", v5));

  return v6;
}

- (id)_destinationItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  TransitDirectionsListImageItem *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  id v23;
  id v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider route](self, "route"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "destination"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mkMapItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
  objc_msgSend(v6, "screenScale");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapItem _maps_markerImageForMapItem:scale:size:useMarkerFallback:](MKMapItem, "_maps_markerImageForMapItem:scale:size:useMarkerFallback:", v5, 3, 1));

  v8 = -[TransitDirectionsListImageItem initWithImage:instructions:]([TransitDirectionsListImageItem alloc], "initWithImage:instructions:", v7, 0);
  -[TransitDirectionsListItem setType:](v8, "setType:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Arrive [Transit List View]"), CFSTR("localized string not found"), 0));

  v11 = objc_msgSend(objc_alloc((Class)GEOComposedString), "initWithString:", v10);
  v24 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
  -[TransitDirectionsListItem setMajorFormattedStrings:](v8, "setMajorFormattedStrings:", v12);

  v13 = objc_alloc((Class)GEOComposedString);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider _destinationTitle](self, "_destinationTitle"));
  v15 = objc_msgSend(v13, "initWithString:", v14);

  if (v15)
  {
    v23 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    -[TransitDirectionsListItem setMinorFormattedStrings:](v8, "setMinorFormattedStrings:", v16);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider route](self, "route"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "steps"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastObject"));

  if (v19)
  {
    v22 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
    -[TransitDirectionsListItem setComposedRouteSteps:](v8, "setComposedRouteSteps:", v20);

  }
  return v8;
}

- (id)_destinationTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider route](self, "route"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_maps_directionsWaypoints"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider _titleForWaypoint:](self, "_titleForWaypoint:", v5));

  return v6;
}

- (id)_titleForWaypoint:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "responseSearch"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "singleLineAddress"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "responseSearch"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapItem"));
  if ((objc_msgSend(v7, "_hasTransitDisplayName") & 1) != 0)
  {

LABEL_5:
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "responseSearch"));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title"));

    goto LABEL_6;
  }
  v8 = objc_msgSend(v5, "length");

  if (!v8)
    goto LABEL_5;
  v9 = v5;
LABEL_6:

  return v9;
}

- (void)_consumeTransitTripSegment
{
  id v3;
  NSObject *v4;
  GEOComposedRouteStep *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;

  v3 = sub_100524D88();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136315138;
    v9 = "-[TransitDirectionsStepsListDataProvider _consumeTransitTripSegment]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v8, 0xCu);
  }

  v5 = self->_currentStep;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider _transitTripBoardItem](self, "_transitTripBoardItem"));
  -[TransitDirectionsStepsListDataProvider _appendItem:toArray:](self, "_appendItem:toArray:", v6, self->_mutableItems);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider _transitTripAlightItem](self, "_transitTripAlightItem"));
  -[TransitDirectionsStepsListDataProvider _appendItem:toArray:](self, "_appendItem:toArray:", v7, self->_mutableItems);

}

- (id)_transitTripBoardItem
{
  GEOComposedRouteStep *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  TransitDirectionsListArtworkItem *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  UIColor *v13;
  UIColor *currentLineColor;
  TransitDirectionsListArtworkItem *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  NSObject *v28;
  __CFString *v29;
  void *v30;
  TransitDirectionsListArtworkItem *v31;
  id v32;
  NSObject *v33;
  void *v34;
  id v35;
  id v36;
  NSObject *v37;
  TransitDirectionsListClusteredVehicleItem *v38;
  void *v39;
  TransitDirectionsListClusteredVehicleItem *v40;
  id v41;
  GEOComposedRouteStep *v42;
  void *v43;
  id v44;
  id v45;
  NSObject *v46;
  __CFString *v47;
  id v48;
  void *v49;
  void *v51;
  void *v52;
  void *v53;
  GEOComposedRouteStep *v54;
  id obj;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  GEOComposedRouteStep *v60;
  uint8_t buf[4];
  __CFString *v62;
  _BYTE v63[128];

  v3 = self->_currentStep;
  v4 = sub_100524D88();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "- creating BOARD item for trip", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep routeDetailsPrimaryArtwork](v3, "routeDetailsPrimaryArtwork"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

  v52 = (void *)objc_claimAutoreleasedReturnValue(+[MNTransitStepInstruction instructionForStep:context:](MNTransitStepInstruction, "instructionForStep:context:", v3, +[TransitDirectionsListItem defaultInstructionContextForItemType:forGuidance:](TransitDirectionsListItem, "defaultInstructionContextForItemType:forGuidance:", 2, self->_forGuidance)));
  v53 = (void *)v7;
  v8 = -[TransitDirectionsListArtworkItem initWithArtwork:instructions:]([TransitDirectionsListArtworkItem alloc], "initWithArtwork:instructions:", v7, v52);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep transitStep](v3, "transitStep"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "badges"));
  v11 = objc_msgSend(v10, "copy");
  -[TransitDirectionsListItem setBadges:](v8, "setBadges:", v11);

  -[TransitDirectionsListItem setType:](v8, "setType:", 2);
  if (!self->_currentLineColor)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep transitLine](v3, "transitLine"));
    v13 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor _mapkit_colorForTransitLine:](UIColor, "_mapkit_colorForTransitLine:", v12));
    currentLineColor = self->_currentLineColor;
    self->_currentLineColor = v13;

  }
  v15 = v8;
  v16 = objc_alloc_init((Class)NSMutableArray);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v18 = v17;
  if (v3)
    objc_msgSend(v17, "addObject:", v3);
  v54 = v3;
  v51 = v18;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider _mergeTransitRoutingIncidentsForSteps:](self, "_mergeTransitRoutingIncidentsForSteps:", v18));
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(_QWORD *)v57 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "routingMessage"));
        v25 = objc_msgSend(v24, "length");

        if (v25)
        {
          self->_hasIncidentItems = 1;
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider _incidentItemWithIncidentMessage:](self, "_incidentItemWithIncidentMessage:", v23));
          v27 = sub_100524D88();
          v28 = objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            v29 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "routingMessage"));
            *(_DWORD *)buf = 138477827;
            v62 = v29;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "- adding merged incidents item: \"%{private}@\", buf, 0xCu);

          }
          objc_msgSend(v26, "setParentItem:", v15);
          -[TransitDirectionsStepsListDataProvider _appendItem:toArray:](self, "_appendItem:toArray:", v26, v16);

        }
      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
    }
    while (v20);
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider _boardingInfoItemForStep:](self, "_boardingInfoItemForStep:", v54));
  v31 = v15;
  if (v30)
  {
    v32 = sub_100524D88();
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "- adding boarding info item for trip", buf, 2u);
    }

    objc_msgSend(v30, "setParentItem:", v15);
    -[TransitDirectionsStepsListDataProvider _appendItem:toArray:](self, "_appendItem:toArray:", v30, v16);
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep tripSegment](v54, "tripSegment"));
  v35 = objc_msgSend(v34, "rideOptionsCount");

  if ((unint64_t)v35 >= 2)
  {
    v36 = sub_100524D88();
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "- adding clustered rides item", buf, 2u);
    }

    v38 = [TransitDirectionsListClusteredVehicleItem alloc];
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep tripSegment](v54, "tripSegment"));
    v40 = -[TransitDirectionsListClusteredVehicleItem initWithClusteredRouteSegment:](v38, "initWithClusteredRouteSegment:", v39);

    -[TransitDirectionsStepsListDataProvider _appendItem:toArray:](self, "_appendItem:toArray:", v40, v16);
    ++self->_segmentRangeLength;

  }
  v41 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
  v42 = self->_prefixStepForNextBoardItem;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep transitStep](v42, "transitStep"));
  v44 = objc_msgSend(v43, "maneuverType");

  if (v42 && (v44 & 0xFFFFFFFE) == 6)
  {
    v45 = sub_100524D88();
    v46 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      if ((_DWORD)v44 == 6)
      {
        v47 = CFSTR("TRANSFER_STOP_TO_STOP");
      }
      else if ((_DWORD)v44 == 7)
      {
        v47 = CFSTR("GOTO_STOP");
      }
      else
      {
        v47 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v44));
      }
      *(_DWORD *)buf = 138412290;
      v62 = v47;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "- including previous %@", buf, 0xCu);

    }
    objc_msgSend(v41, "addObject:", v42);
  }
  objc_msgSend(v41, "addObject:", v54);
  v48 = objc_msgSend(v41, "copy");
  -[TransitDirectionsListItem setComposedRouteSteps:](v31, "setComposedRouteSteps:", v48);

  v60 = v54;
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v60, 1));
  -[TransitDirectionsListItem setComposedRouteStepsDisplayedOnMap:](v31, "setComposedRouteStepsDisplayedOnMap:", v49);

  -[TransitDirectionsListItem setPostTertiaryItems:](v31, "setPostTertiaryItems:", v16);
  return v31;
}

- (id)_transitTripAlightItem
{
  id v3;
  NSObject *v4;
  GEOComposedRouteStep *currentStep;
  void *v6;
  __CFString *v7;
  TransitDirectionsListItemTransitTrip *v8;
  void *v9;
  uint64_t v10;
  id v11;
  GEOComposedRouteStep *v12;
  _UNKNOWN **v13;
  GEOComposedRouteStep *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  unsigned int v18;
  id v19;
  NSObject *v20;
  GEOComposedRouteStep *v21;
  uint64_t v22;
  GEOComposedRouteStep *v23;
  _QWORD *v24;
  uint64_t (**v25)(_QWORD, GEOComposedRouteStep *);
  int v26;
  void *v27;
  uint64_t v28;
  id v29;
  BOOL v30;
  void *v31;
  unsigned int v32;
  id v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  unsigned int v39;
  id v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  __CFString *v46;
  uint64_t v47;
  unsigned int v48;
  __CFString *v49;
  id v50;
  void *v51;
  void *v52;
  unsigned int v53;
  id v54;
  unsigned int v55;
  uint64_t v56;
  unsigned int v57;
  GEOComposedRouteStep *v58;
  uint64_t v59;
  void *v60;
  unsigned int v61;
  int v62;
  id v63;
  NSObject *v64;
  const __CFString *v65;
  id v66;
  uint64_t v67;
  void *v68;
  void *v69;
  __CFString *v70;
  id v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  id v79;
  NSObject *v80;
  __CFString *v81;
  void *v82;
  int v83;
  void *v84;
  TransitDirectionsListItem *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  id v96;
  id v97;
  uint64_t v98;
  void *i;
  void *v100;
  void *v101;
  id v102;
  void *v103;
  id v104;
  NSObject *v105;
  __CFString *v106;
  id v107;
  NSObject *v108;
  id v109;
  NSObject *v110;
  id v111;
  void *v112;
  id v113;
  id v114;
  id v115;
  uint64_t v116;
  void *j;
  void *v118;
  void *v119;
  TransitDirectionsListItem *v120;
  void *v121;
  id v122;
  NSObject *v123;
  const __CFString *v124;
  TransitDirectionsListItemTransitTrip *v125;
  id v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  __CFString *v132;
  GEOComposedRouteStep *v133;
  id v134;
  GEOComposedRouteStep *v135;
  id *location;
  TransitDirectionsListItemTransitTrip *v137;
  id v138;
  void *v139;
  void *v140;
  id obj;
  id obja;
  id v143;
  id v144;
  id v145;
  id v146;
  TransitDirectionsListItemTransitTrip *v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  _QWORD v156[5];
  TransitDirectionsListItemTransitTrip *v157;
  id v158;
  _BYTE v159[128];
  uint8_t v160[128];
  uint8_t buf[4];
  const __CFString *v162;
  __int16 v163;
  uint64_t v164;

  v135 = self->_currentStep;
  v3 = sub_100524D88();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "- creating TRIP item for trip", buf, 2u);
  }

  v134 = objc_alloc_init((Class)NSMutableArray);
  v138 = objc_alloc_init((Class)NSMutableArray);
  v127 = objc_alloc_init((Class)NSMutableArray);
  currentStep = self->_currentStep;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", &off_10126DB40));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider _nextStepAfterStep:withManeuvers:beforeManeuvers:](self, "_nextStepAfterStep:withManeuvers:beforeManeuvers:", currentStep, v6, 0));

  v8 = -[TransitDirectionsListItemTransitTrip initWithTripStep:]([TransitDirectionsListItemTransitTrip alloc], "initWithTripStep:", v7);
  -[TransitDirectionsListItem setType:](v8, "setType:", 3);
  location = (id *)&self->_currentLineColor;
  if (!self->_currentLineColor)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString transitLine](v7, "transitLine"));
    v10 = objc_claimAutoreleasedReturnValue(+[UIColor _mapkit_colorForTransitLine:](UIColor, "_mapkit_colorForTransitLine:", v9));
    v11 = *location;
    *location = (id)v10;

  }
  v132 = v7;
  v137 = v8;
  -[TransitDirectionsListItemTransitTrip setExpanded:](v8, "setExpanded:", 0);
  -[TransitDirectionsStepsListDataProvider _incrementStep](self, "_incrementStep");
  v12 = self->_currentStep;
  v13 = CPLaneGuidance_ptr;
  if (v12)
  {
    v14 = v12;
    do
    {
      v15 = objc_opt_class(GEOComposedTransitTripRouteStep);
      if ((objc_opt_isKindOfClass(v14, v15) & 1) == 0
        || -[GEOComposedRouteStep maneuver](v14, "maneuver") != 4)
      {
        break;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep transitVehicle](v14, "transitVehicle"));
      v17 = (__CFString *)v14;
      v18 = objc_msgSend(v16, "pickupDropoffType");

      v133 = (GEOComposedRouteStep *)v17;
      if (v18 != 100)
        goto LABEL_15;
      v19 = sub_100524D88();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v162 = v17;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "- skipping pre-ENTER pass stop: %@", buf, 0xCu);
      }

      -[TransitDirectionsStepsListDataProvider _incrementStep](self, "_incrementStep");
      v21 = self->_currentStep;

      v14 = v21;
    }
    while (v14);
    v133 = v14;

  }
  else
  {
    v133 = 0;
  }
LABEL_15:
  LODWORD(v22) = 0;
  v140 = 0;
  v131 = 0;
  do
  {
    v23 = self->_currentStep;
    v156[0] = _NSConcreteStackBlock;
    v156[1] = 3221225472;
    v156[2] = sub_10052745C;
    v156[3] = &unk_1011BA398;
    v156[4] = self;
    v147 = v137;
    v157 = v147;
    v146 = v138;
    v158 = v146;
    v24 = objc_retainBlock(v156);
    v25 = (uint64_t (**)(_QWORD, GEOComposedRouteStep *))v24;
    if (-[GEOComposedRouteStep maneuver](v23, "maneuver") == 9)
    {
      v26 = ((uint64_t (*)(_QWORD *, GEOComposedRouteStep *))v24[2])(v24, v23);
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep transitLine](v23, "transitLine"));
      v28 = objc_claimAutoreleasedReturnValue(+[UIColor _mapkit_colorForTransitLine:](UIColor, "_mapkit_colorForTransitLine:", v27));
      v29 = *location;
      *location = (id)v28;

    }
    else
    {
      v26 = 0;
    }
    v30 = -[GEOComposedRouteStep maneuver](v23, "maneuver") != 4 && v26 == 0;
    if (v30)
    {
      v62 = 0;
      goto LABEL_81;
    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep transitLine](v23, "transitLine"));
    obj = (id)objc_claimAutoreleasedReturnValue(+[UIColor _mapkit_colorForTransitLine:](UIColor, "_mapkit_colorForTransitLine:", v31));

    v32 = -[GEOComposedRouteStep duration](v23, "duration");
    v33 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v23, 0);
    v143 = 0;
    if (!v140)
      v143 = objc_alloc_init((Class)NSMutableArray);
    v144 = v33;
    v22 = v32 + v22;
    v34 = objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep getNextStep](self->_currentStep, "getNextStep"));
    if (!v34)
    {
LABEL_53:
      v46 = 0;
      goto LABEL_59;
    }
    v35 = (void *)v34;
    while (1)
    {
      v36 = v35;
      v37 = objc_opt_class(v13[96]);
      if ((objc_opt_isKindOfClass(v36, v37) & 1) != 0 && objc_msgSend(v36, "maneuver") == 4)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "transitVehicle"));
        v39 = objc_msgSend(v38, "pickupDropoffType");

        if (v39 == 100)
          goto LABEL_42;
      }
      else
      {

      }
      v40 = v36;
      v41 = objc_opt_class(v13[96]);
      if ((objc_opt_isKindOfClass(v40, v41) & 1) != 0 && objc_msgSend(v40, "maneuver") == 9)
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "originStop"));
        v43 = objc_msgSend(v42, "muid");
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "destinationStop"));
        v45 = objc_msgSend(v44, "muid");

        v30 = v43 == v45;
        v13 = CPLaneGuidance_ptr;
        if (v30)
          goto LABEL_42;
      }
      else
      {

      }
      v46 = (__CFString *)v40;
      v47 = objc_opt_class(v13[96]);
      if ((objc_opt_isKindOfClass(v46, v47) & 1) == 0)
      {
        v49 = v46;
        goto LABEL_57;
      }
      v48 = -[__CFString maneuver](v46, "maneuver");

      if (v48 != 9)
        goto LABEL_58;
      v49 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString originStop](v46, "originStop"));
      v50 = -[__CFString muid](v49, "muid");
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString destinationStop](v46, "destinationStop"));
      if (v50 == objc_msgSend(v51, "muid"))
        break;
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString transitVehicle](v46, "transitVehicle"));
      v53 = objc_msgSend(v52, "pickupDropoffType");

      v13 = CPLaneGuidance_ptr;
      if (v53 != 100)
        goto LABEL_59;
LABEL_42:
      v54 = v36;

      v55 = objc_msgSend(v54, "duration");
      v23 = (GEOComposedRouteStep *)v54;
      v56 = objc_opt_class(v13[96]);
      if ((objc_opt_isKindOfClass(v23, v56) & 1) != 0)
      {
        v57 = -[GEOComposedRouteStep maneuver](v23, "maneuver");

        if (v57 == 9 && (v25[2](v25, v23) & 1) != 0)
          goto LABEL_50;
      }
      else
      {

      }
      v58 = v23;
      v59 = objc_opt_class(v13[96]);
      if ((objc_opt_isKindOfClass(v58, v59) & 1) == 0
        || -[GEOComposedRouteStep maneuver](v58, "maneuver") != 4)
      {

        goto LABEL_52;
      }
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep transitVehicle](v58, "transitVehicle"));
      v61 = objc_msgSend(v60, "pickupDropoffType");

      if (v61 == 100)
      {
LABEL_50:
        objc_msgSend(v144, "addObject:", v23);
        objc_msgSend(v143, "addObject:", v23);
      }
LABEL_52:
      v22 = v55 + v22;
      -[TransitDirectionsStepsListDataProvider _incrementStep](self, "_incrementStep");
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep getNextStep](self->_currentStep, "getNextStep"));

      if (!v35)
        goto LABEL_53;
    }

LABEL_57:
LABEL_58:

LABEL_59:
    if (v140)
    {
      v63 = sub_100524D88();
      v64 = objc_claimAutoreleasedReturnValue(v63);
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
      {
        if ((unint64_t)objc_msgSend(v144, "count") <= 1)
          v65 = CFSTR(" ");
        else
          v65 = CFSTR("\n-| ");
        v66 = objc_msgSend(v144, "count");
        if ((unint64_t)v66 >= 2)
        {
          v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "valueForKey:", CFSTR("description")));
          v67 = objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "componentsJoinedByString:", CFSTR("\n-| ")));
          v128 = (void *)v67;
          v68 = v130;
        }
        else
        {
          v67 = objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "firstObject"));
          v68 = (void *)v67;
        }
        *(_DWORD *)buf = 138412546;
        v162 = v65;
        v163 = 2112;
        v164 = v67;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEBUG, "- adding PASS_STOP item for:%@%@", buf, 0x16u);
        v75 = v68;
        if ((unint64_t)v66 >= 2)
        {

          v75 = v129;
        }
        v130 = v68;

      }
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "lastObject"));
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "composedRouteSteps"));

      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "firstObject"));
      v70 = (__CFString *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider _passStopSubItemForSteps:boardStep:previousPassStop:currentRideDuration:fromLineColor:toLineColor:](self, "_passStopSubItemForSteps:boardStep:previousPassStop:currentRideDuration:fromLineColor:toLineColor:", v144, v135, v77, v22, self->_currentLineColor, obj));

      -[__CFString setParentItem:](v70, "setParentItem:", v147);
      -[TransitDirectionsStepsListDataProvider _appendItem:toArray:](self, "_appendItem:toArray:", v70, v134);
      objc_storeStrong(location, obj);
    }
    else
    {
      v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_10126DB58, &off_10126DB70, &off_10126DB88, 0));
      v70 = (__CFString *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider _previousStepBeforeStep:withManeuvers:afterManeuver:](self, "_previousStepBeforeStep:withManeuvers:afterManeuver:", v135, v69, 1));
      v71 = sub_100524D88();
      v72 = objc_claimAutoreleasedReturnValue(v71);
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v162 = v70;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEBUG, "- creating ENTER item for boarding step: %@", buf, 0xCu);
      }

      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "firstObject"));
      v74 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider _enterItemForStep:passStop:previouslySkippedPassStops:](self, "_enterItemForStep:passStop:previouslySkippedPassStops:", v70, v73, v143));

      v140 = v74;
      objc_msgSend(v74, "setParentItem:", v147);
    }

    v13 = CPLaneGuidance_ptr;
    v78 = objc_opt_class(GEOComposedTransitTripRouteStep);
    if ((objc_opt_isKindOfClass(v46, v78) & 1) != 0 && -[__CFString maneuver](v46, "maneuver") == 5)
    {
      v79 = sub_100524D88();
      v80 = objc_claimAutoreleasedReturnValue(v79);
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v162 = v46;
        _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEBUG, "- creating EXIT item for alight step: %@", buf, 0xCu);
      }

      v81 = v46;
      v82 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider _exitItemForAlightStep:](self, "_exitItemForAlightStep:", v81));

      objc_msgSend(v82, "setParentItem:", v147);
      objc_storeStrong(location, obj);
      -[TransitDirectionsStepsListDataProvider _incrementStep](self, "_incrementStep");
      v83 = 0;
      v62 = 1;
      v131 = v82;
      v132 = v81;
    }
    else
    {
      v62 = 0;
      v83 = 1;
    }

    v24 = v25;
    if (v83)
LABEL_81:
      -[TransitDirectionsStepsListDataProvider _incrementStep](self, "_incrementStep");

  }
  while (!v62);
  if (objc_msgSend(v134, "count"))
  {
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "firstObject"));
    v85 = objc_alloc_init(TransitDirectionsListItem);
    -[TransitDirectionsListItem setType:](v85, "setType:", 6);
    -[TransitDirectionsListItem setParentItem:](v85, "setParentItem:", v147);
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "fromLineColor"));
    -[TransitDirectionsListItem setFromLineColor:](v85, "setFromLineColor:", v86);

    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "toLineColor"));
    -[TransitDirectionsListItem setToLineColor:](v85, "setToLineColor:", v87);

    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "alternateFromLineColor"));
    -[TransitDirectionsListItem setAlternateFromLineColor:](v85, "setAlternateFromLineColor:", v88);

    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "alternateToLineColor"));
    -[TransitDirectionsListItem setAlternateToLineColor:](v85, "setAlternateToLineColor:", v89);

    objc_msgSend(v134, "insertObject:atIndex:", v85, 0);
  }
  -[TransitDirectionsListItemTransitTrip setExpandedItems:](v147, "setExpandedItems:", v134);
  v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v91 = v90;
  if (v132)
    objc_msgSend(v90, "addObject:");
  v92 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep getNextStep](v135, "getNextStep"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_10126DB58, 0));
  v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_10126DBA0, 0));
  v95 = objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider _nextStepAfterStep:withManeuvers:beforeManeuvers:](self, "_nextStepAfterStep:withManeuvers:beforeManeuvers:", v92, v93, v94));

  if (v95)
    objc_msgSend(v91, "addObject:", v95);
  v139 = (void *)v95;
  obja = v91;
  v152 = 0u;
  v153 = 0u;
  v154 = 0u;
  v155 = 0u;
  v145 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider _mergeTransitRoutingIncidentsForSteps:](self, "_mergeTransitRoutingIncidentsForSteps:", v91));
  v96 = objc_msgSend(v145, "countByEnumeratingWithState:objects:count:", &v152, v160, 16);
  if (v96)
  {
    v97 = v96;
    v98 = *(_QWORD *)v153;
    do
    {
      for (i = 0; i != v97; i = (char *)i + 1)
      {
        if (*(_QWORD *)v153 != v98)
          objc_enumerationMutation(v145);
        v100 = *(void **)(*((_QWORD *)&v152 + 1) + 8 * (_QWORD)i);
        v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "routingMessage"));
        v102 = objc_msgSend(v101, "length");

        if (v102)
        {
          self->_hasIncidentItems = 1;
          v103 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider _incidentItemWithIncidentMessage:](self, "_incidentItemWithIncidentMessage:", v100));
          v104 = sub_100524D88();
          v105 = objc_claimAutoreleasedReturnValue(v104);
          if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
          {
            v106 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "routingMessage"));
            *(_DWORD *)buf = 138477827;
            v162 = v106;
            _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEBUG, "- adding merged incidents item: \"%{private}@\", buf, 0xCu);

          }
          objc_msgSend(v103, "setParentItem:", v147);
          -[TransitDirectionsStepsListDataProvider _appendItem:toArray:](self, "_appendItem:toArray:", v103, v146);

        }
      }
      v97 = objc_msgSend(v145, "countByEnumeratingWithState:objects:count:", &v152, v160, 16);
    }
    while (v97);
  }
  -[TransitDirectionsStepsListDataProvider _appendItem:toArray:](self, "_appendItem:toArray:", v140, v146);
  v107 = sub_100524D88();
  v108 = objc_claimAutoreleasedReturnValue(v107);
  if (os_log_type_enabled(v108, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEBUG, "- added board pass item", buf, 2u);
  }

  -[TransitDirectionsStepsListDataProvider _insertItem:atIndex:inArray:](self, "_insertItem:atIndex:inArray:", v131, 0, v127);
  v109 = sub_100524D88();
  v110 = objc_claimAutoreleasedReturnValue(v109);
  if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEBUG, "- added alight pass item", buf, 2u);
  }

  v111 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", (char *)objc_msgSend(v134, "count") + 2);
  v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "composedRouteSteps"));
  objc_msgSend(v111, "addObjectsFromArray:", v112);

  v150 = 0u;
  v151 = 0u;
  v148 = 0u;
  v149 = 0u;
  v113 = v134;
  v114 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v148, v159, 16);
  if (v114)
  {
    v115 = v114;
    v116 = *(_QWORD *)v149;
    do
    {
      for (j = 0; j != v115; j = (char *)j + 1)
      {
        if (*(_QWORD *)v149 != v116)
          objc_enumerationMutation(v113);
        v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v148 + 1) + 8 * (_QWORD)j), "composedRouteSteps"));
        objc_msgSend(v111, "addObjectsFromArray:", v118);

      }
      v115 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v148, v159, 16);
    }
    while (v115);
  }

  v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "composedRouteSteps"));
  objc_msgSend(v111, "addObjectsFromArray:", v119);

  -[TransitDirectionsListItem setComposedRouteStepsDisplayedOnMap:](v147, "setComposedRouteStepsDisplayedOnMap:", v111);
  v120 = objc_alloc_init(TransitDirectionsListItem);
  -[TransitDirectionsListItem setType:](v120, "setType:", 7);
  -[TransitDirectionsListItem setParentItem:](v120, "setParentItem:", v147);
  v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "toLineColor"));
  -[TransitDirectionsListItem setFromLineColor:](v120, "setFromLineColor:", v121);

  -[TransitDirectionsStepsListDataProvider _appendItem:toArray:](self, "_appendItem:toArray:", v120, v146);
  v122 = sub_100524D88();
  v123 = objc_claimAutoreleasedReturnValue(v122);
  if (os_log_type_enabled(v123, OS_LOG_TYPE_DEBUG))
  {
    v124 = (const __CFString *)objc_msgSend(v113, "count");
    *(_DWORD *)buf = 134217984;
    v162 = v124;
    _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_DEBUG, "- added expand item representing %lu hidden items", buf, 0xCu);
  }

  ++self->_segmentRangeLength;
  -[TransitDirectionsListItem setPostTertiaryItems:](v147, "setPostTertiaryItems:", v146);
  -[TransitDirectionsListItem setFooterItems:](v147, "setFooterItems:", v127);
  v125 = v147;

  return v125;
}

- (id)_boardingInfoItemForStep:(id)a3
{
  id v3;
  id v4;
  TransitDirectionsListBoardingInfoItem *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "boardingInfo"));
  if (v4)
    goto LABEL_2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "instructions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transitListInstruction"));
  v8 = objc_msgSend(v7, "hasTimeInstructions");

  if (!v8)
    goto LABEL_5;
  v4 = objc_alloc_init((Class)GEOTransitBoardingInfo);
  v9 = objc_alloc_init((Class)GEOTransitBoardingInfoEntry);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "instructions"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "transitListInstruction"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "timeInstructions"));
  objc_msgSend(v9, "setMainTimeInstruction:", v12);

  objc_msgSend(v4, "addEntry:", v9);
  if (v4)
  {
LABEL_2:
    v5 = -[TransitDirectionsListBoardingInfoItem initWithBoardingInfo:]([TransitDirectionsListBoardingInfoItem alloc], "initWithBoardingInfo:", v4);

  }
  else
  {
LABEL_5:
    v5 = 0;
  }

  return v5;
}

- (id)_passStopSubItemForSteps:(id)a3 boardStep:(id)a4 previousPassStop:(id)a5 currentRideDuration:(unsigned int)a6 fromLineColor:(id)a7 toLineColor:(id)a8
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  TransitDirectionsListArtworkItem *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  _UNKNOWN **v32;
  void *v33;

  v11 = a3;
  v32 = &off_10126DBB8;
  if (a8)
    v12 = a8;
  else
    v12 = a7;
  v13 = a8;
  v14 = a7;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_maps_hexString"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MKTransitArtwork stationNodeOutlinedArtworkWithHexColor:](MKTransitArtwork, "stationNodeOutlinedArtworkWithHexColor:", v15));
  v33 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));

  v18 = -[TransitDirectionsListArtworkItem initWithArtworks:instructions:]([TransitDirectionsListArtworkItem alloc], "initWithArtworks:instructions:", v17, 0);
  -[TransitDirectionsListItem setType:](v18, "setType:", 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MNTransitStepInstruction instructionForStep:context:](MNTransitStepInstruction, "instructionForStep:context:", v19, +[TransitDirectionsListItem defaultInstructionContextForItemType:forGuidance:](TransitDirectionsListItem, "defaultInstructionContextForItemType:forGuidance:", 5, self->_forGuidance)));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "majorInstructionStrings"));
  v22 = objc_msgSend(v21, "count");

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "majorInstructionStrings"));
    -[TransitDirectionsListItem setMajorFormattedStrings:](v18, "setMajorFormattedStrings:", v23);
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "originStopIntermediateListName"));
    if (v23)
    {
      v24 = objc_msgSend(objc_alloc((Class)GEOComposedString), "initWithString:", v23);
      v31 = v24;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));
      -[TransitDirectionsListItem setMajorFormattedStrings:](v18, "setMajorFormattedStrings:", v25);

    }
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "minorInstructionStrings"));
  -[TransitDirectionsListItem setMinorFormattedStrings:](v18, "setMinorFormattedStrings:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "tertiaryInstructionStrings"));
  -[TransitDirectionsListItem setTertiaryFormattedStrings:](v18, "setTertiaryFormattedStrings:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "primaryTimeInstructionString"));
  -[TransitDirectionsListItem setPrimaryAccessoryString:](v18, "setPrimaryAccessoryString:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "secondaryTimeInstructionString"));
  -[TransitDirectionsListItem setSecondaryAccessoryString:](v18, "setSecondaryAccessoryString:", v29);

  -[TransitDirectionsListItem setFromLineColor:](v18, "setFromLineColor:", v14);
  -[TransitDirectionsListItem setToLineColor:](v18, "setToLineColor:", v13);

  -[TransitDirectionsListArtworkItem setSelectedSize:](v18, "setSelectedSize:", 2);
  -[TransitDirectionsListArtworkItem setAdaptiveShieldSize:](v18, "setAdaptiveShieldSize:", 0);
  -[TransitDirectionsListItem setComposedRouteSteps:](v18, "setComposedRouteSteps:", v11);

  return v18;
}

- (id)_enterItemForStep:(id)a3 passStop:(id)a4 previouslySkippedPassStops:(id)a5
{
  id v8;
  id v9;
  _BOOL8 forGuidance;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  TransitDirectionsListArtworkItem *v20;
  TransitDirectionsListArtworkItem *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  UIColor *v26;
  UIColor **p_currentLineColor;
  UIColor *currentLineColor;
  UIColor *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  _UNKNOWN **v35;
  void *v36;

  v8 = a3;
  v9 = a4;
  forGuidance = self->_forGuidance;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MNTransitStepInstruction instructionForStep:context:](MNTransitStepInstruction, "instructionForStep:context:", v9, +[TransitDirectionsListItem defaultInstructionContextForItemType:forGuidance:](TransitDirectionsListItem, "defaultInstructionContextForItemType:forGuidance:", 10, forGuidance)));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "transitLine"));
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nextBoardingStep"));
    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "transitLine"));

  }
  v35 = &off_10126DBB8;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lineColorString"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MKTransitArtwork stationNodeOutlinedArtworkWithHexColor:](MKTransitArtwork, "stationNodeOutlinedArtworkWithHexColor:", v17));
  v36 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));

  v20 = -[TransitDirectionsListArtworkItem initWithArtworks:instructions:]([TransitDirectionsListArtworkItem alloc], "initWithArtworks:instructions:", v19, v12);
  v21 = v20;
  if (self->_forGuidance)
    v22 = 5;
  else
    v22 = 4;
  -[TransitDirectionsListArtworkItem setSelectedSize:](v20, "setSelectedSize:", v22);
  -[TransitDirectionsListArtworkItem setAdaptiveShieldSize:](v21, "setAdaptiveShieldSize:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "primaryTimeInstructionString"));
  -[TransitDirectionsListItem setPrimaryAccessoryString:](v21, "setPrimaryAccessoryString:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "secondaryTimeInstructionString"));
  -[TransitDirectionsListItem setSecondaryAccessoryString:](v21, "setSecondaryAccessoryString:", v24);

  -[TransitDirectionsListItem setHideAccessoryStringsWhenCollapsed:](v21, "setHideAccessoryStringsWhenCollapsed:", objc_msgSend(v12, "hideTimeInstructionsWhenCollapsed"));
  -[TransitDirectionsListItem setType:](v21, "setType:", 10);
  -[TransitDirectionsStepsListDataProvider _populateAccessPointArtworkForItem:fromStep:](self, "_populateAccessPointArtworkForItem:fromStep:", v21, v9);
  if (v15)
  {
    v25 = objc_claimAutoreleasedReturnValue(+[UIColor _mapkit_colorForTransitLine:](UIColor, "_mapkit_colorForTransitLine:", v15));
    currentLineColor = self->_currentLineColor;
    p_currentLineColor = &self->_currentLineColor;
    v26 = currentLineColor;
    *p_currentLineColor = (UIColor *)v25;
  }
  else
  {
    v29 = self->_currentLineColor;
    p_currentLineColor = &self->_currentLineColor;
    v26 = v29;
    *p_currentLineColor = 0;
  }

  -[TransitDirectionsListItem setFromLineColor:](v21, "setFromLineColor:", 0);
  -[TransitDirectionsListItem setToLineColor:](v21, "setToLineColor:", *p_currentLineColor);
  v30 = objc_alloc_init((Class)NSMutableArray);
  v31 = v30;
  if (v9)
    v32 = v9;
  else
    v32 = v8;
  objc_msgSend(v30, "addObject:", v32);
  objc_msgSend(v31, "addObjectsFromArray:", v11);

  v33 = objc_msgSend(v31, "copy");
  -[TransitDirectionsListItem setComposedRouteSteps:](v21, "setComposedRouteSteps:", v33);

  return v21;
}

- (id)_exitItemForAlightStep:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  TransitDirectionsListArtworkItem *v15;
  TransitDirectionsListArtworkItem *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  _BYTE *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  _UNKNOWN **v39;
  void *v40;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider _nextLeaveStopStepAfterStep:](self, "_nextLeaveStopStepAfterStep:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nextTransitStep"));
  if (objc_msgSend(v6, "maneuver") == 6)
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nextTransitStep"));
  else
    v7 = 0;

  if (v5 | v7)
  {
    v8 = objc_alloc_init((Class)NSMutableDictionary);
    v9 = v8;
    if (v7)
      v10 = v7;
    else
      v10 = v5;
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, &off_10126DBD0);
  }
  else
  {
    v9 = 0;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MNTransitStepInstruction instructionForStep:overrides:context:](MNTransitStepInstruction, "instructionForStep:overrides:context:", v4, v9, +[TransitDirectionsListItem defaultInstructionContextForItemType:forGuidance:](TransitDirectionsListItem, "defaultInstructionContextForItemType:forGuidance:", 11, self->_forGuidance)));
  v39 = &off_10126DBB8;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIColor _maps_hexString](self->_currentLineColor, "_maps_hexString"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKTransitArtwork stationNodeArtworkWithHexColor:](MKTransitArtwork, "stationNodeArtworkWithHexColor:", v12));
  v40 = v13;
  v14 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));

  v36 = (void *)v14;
  v15 = -[TransitDirectionsListArtworkItem initWithArtworks:instructions:]([TransitDirectionsListArtworkItem alloc], "initWithArtworks:instructions:", v14, v11);
  v16 = v15;
  if (self->_forGuidance)
    v17 = 5;
  else
    v17 = 4;
  -[TransitDirectionsListArtworkItem setSelectedSize:](v15, "setSelectedSize:", v17);
  -[TransitDirectionsListArtworkItem setAdaptiveShieldSize:](v16, "setAdaptiveShieldSize:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "primaryTimeInstructionString"));
  -[TransitDirectionsListItem setPrimaryAccessoryString:](v16, "setPrimaryAccessoryString:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "secondaryTimeInstructionString"));
  -[TransitDirectionsListItem setSecondaryAccessoryString:](v16, "setSecondaryAccessoryString:", v19);

  -[TransitDirectionsListItem setHideAccessoryStringsWhenCollapsed:](v16, "setHideAccessoryStringsWhenCollapsed:", objc_msgSend(v11, "hideTimeInstructionsWhenCollapsed"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem badges](v16, "badges"));
  v21 = objc_msgSend(v20, "count");

  if (!v21 && v7)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v7, "transitStep"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "badges"));
    -[TransitDirectionsListItem setBadges:](v16, "setBadges:", v23);

  }
  -[TransitDirectionsListItem setType:](v16, "setType:", 11);
  -[TransitDirectionsListItem setFromLineColor:](v16, "setFromLineColor:", self->_currentLineColor);
  -[TransitDirectionsListItem setToLineColor:](v16, "setToLineColor:", 0);
  v24 = -[TransitDirectionsStepsListDataProvider _startRangeIndexForAlightItem:](self, "_startRangeIndexForAlightItem:", v4);
  v37 = v9;
  v38 = (void *)v7;
  if (v5)
    v25 = (void *)v5;
  else
    v25 = v4;
  v26 = objc_msgSend(v25, "stepIndex");
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "composedRoute"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "steps"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "subarrayWithRange:", v24, &v26[-v24 + 1]));
  -[TransitDirectionsListItem setComposedRouteSteps:](v16, "setComposedRouteSteps:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "composedRoute"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "steps"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "subarrayWithRange:", objc_msgSend(v4, "stepIndex"), v26 - (_BYTE *)objc_msgSend(v4, "stepIndex") + 1));
  -[TransitDirectionsListItem setComposedRouteStepsDisplayedOnMap:](v16, "setComposedRouteStepsDisplayedOnMap:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v34 = v33;
  if (v5)
    objc_msgSend(v33, "addObject:", v5);
  if (v4)
    objc_msgSend(v34, "addObject:", v4);
  -[TransitDirectionsStepsListDataProvider _populateAccessPointArtworkForItem:fromStepsInPreferedOrder:](self, "_populateAccessPointArtworkForItem:fromStepsInPreferedOrder:", v16, v34);

  return v16;
}

- (id)_blockTransferItemFromStep:(id)a3 withBoardItem:(id)a4
{
  _BOOL8 forGuidance;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  TransitDirectionsListArtworkItem *v9;
  void *v10;
  void *v11;
  id v13;

  forGuidance = self->_forGuidance;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MNTransitStepInstruction instructionForStep:context:](MNTransitStepInstruction, "instructionForStep:context:", v5, +[TransitDirectionsListItem defaultInstructionContextForItemType:forGuidance:](TransitDirectionsListItem, "defaultInstructionContextForItemType:forGuidance:", 12, forGuidance)));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routeDetailsPrimaryArtwork"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

  v9 = -[TransitDirectionsListArtworkItem initWithArtwork:instructions:]([TransitDirectionsListArtworkItem alloc], "initWithArtwork:instructions:", v8, 0);
  -[TransitDirectionsListItem setType:](v9, "setType:", 12);
  -[TransitDirectionsListArtworkItem setSelectedSize:](v9, "setSelectedSize:", 5);
  -[TransitDirectionsListArtworkItem setAdaptiveShieldSize:](v9, "setAdaptiveShieldSize:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tertiaryInstructionStrings"));
  -[TransitDirectionsListItem setMajorFormattedStrings:](v9, "setMajorFormattedStrings:", v10);

  v13 = v5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));

  -[TransitDirectionsListItem setComposedRouteSteps:](v9, "setComposedRouteSteps:", v11);
  return v9;
}

- (id)_fareAndOperatingHoursItemForBlockTransferStep:(id)a3 lineColor:(id)a4 alternateLineColor:(id)a5 parentItem:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  TransitDirectionsListItem *v50;
  void *v52;
  id v53;
  id v54;
  id v55;
  uint8_t buf[16];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
  if (objc_msgSend(v9, "maneuver") != 9)
  {
    v55 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "transitLine"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "operatingHours"));

    v16 = objc_msgSend(v15, "count");
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "composedRoute"));
    v18 = objc_msgSend(v17, "shouldShowSchedule");

    if ((v18 & 1) == 0 && v16)
    {
      v53 = v11;
      v54 = v10;
      v19 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v16);
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v52 = v15;
      v20 = v15;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v58;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(_QWORD *)v58 != v23)
              objc_enumerationMutation(v20);
            v25 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v25, "startTime");
            v27 = v26;
            objc_msgSend(v25, "duration");
            if (v28 > 0.0)
            {
              v29 = v28;
              v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v27));
              v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v30, v29));
              objc_msgSend(v19, "addObject:", v30);
              objc_msgSend(v19, "addObject:", v31);

            }
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
        }
        while (v22);
      }

      v11 = v53;
      if (objc_msgSend(v19, "count"))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startingStop"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "timezone"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](NSTimeZone, "timeZoneWithName:", v33));

        v35 = objc_claimAutoreleasedReturnValue(+[NSString _navigation_formattedStringForHourRanges:timeZone:](NSString, "_navigation_formattedStringForHourRanges:timeZone:", v19, v34));
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("Transit_List_Operating_Hours"), CFSTR("localized string not found"), 0));

        v38 = (void *)v37;
        v39 = (void *)v35;
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v37, CFSTR("%@"), 0, v35));
        v41 = objc_msgSend(objc_alloc((Class)GEOComposedString), "initWithString:", v40);
        objc_msgSend(v13, "addObject:", v41);
        v42 = sub_100524D88();
        v43 = objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "- adding operating hours", buf, 2u);
        }

      }
      v10 = v54;
      v15 = v52;
    }

    v12 = v55;
  }
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "instructions"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "transitListInstruction"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "priceFormatteds"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "_geo_map:", &stru_1011BA3D8));

  if (objc_msgSend(v47, "count"))
  {
    v48 = sub_100524D88();
    v49 = objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "- adding fares", buf, 2u);
    }

  }
  objc_msgSend(v13, "addObjectsFromArray:", v47);
  if (objc_msgSend(v13, "count"))
  {
    v50 = objc_alloc_init(TransitDirectionsListItem);
    -[TransitDirectionsListItem setType:](v50, "setType:", 15);
    -[TransitDirectionsListItem setParentItem:](v50, "setParentItem:", v12);
    -[TransitDirectionsListItem setFromLineColor:](v50, "setFromLineColor:", v10);
    -[TransitDirectionsListItem setToLineColor:](v50, "setToLineColor:", v10);
    -[TransitDirectionsListItem setAlternateFromLineColor:](v50, "setAlternateFromLineColor:", v11);
    -[TransitDirectionsListItem setAlternateToLineColor:](v50, "setAlternateToLineColor:", v11);
    -[TransitDirectionsListItem setMajorFormattedStrings:](v50, "setMajorFormattedStrings:", v13);
  }
  else
  {
    v50 = 0;
  }

  return v50;
}

- (id)_incidentItemWithIncidentMessage:(id)a3
{
  id v3;
  TransitDirectionsListItemIncident *v4;

  v3 = a3;
  v4 = -[TransitDirectionsListItemIncident initWithIncidentMessage:]([TransitDirectionsListItemIncident alloc], "initWithIncidentMessage:", v3);

  return v4;
}

- (id)_mergeTransitRoutingIncidentsForSteps:(id)a3
{
  id v3;
  id v4;
  id v5;
  __int128 v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  uint64_t v20;
  MergedTransitRoutingIncidentMessage *v21;
  void *v22;
  MergedTransitRoutingIncidentMessage *v23;
  id v24;
  __int128 v26;
  id v27;
  id obj;
  uint64_t v29;
  id v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  id v42;
  __int16 v43;
  id v44;
  _BYTE v45[128];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = objc_alloc_init((Class)NSMutableArray);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v3;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v37;
    *(_QWORD *)&v6 = 134218240;
    v26 = v6;
    v27 = v5;
    do
    {
      for (i = 0; i != v30; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v29)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "advisories", v26));

        if (v9)
        {
          v31 = i;
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "advisories"));
          objc_msgSend(v5, "addObjectsFromArray:", v10);

          v11 = sub_100524D88();
          v12 = objc_claimAutoreleasedReturnValue(v11);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            v13 = objc_msgSend(v5, "count");
            v14 = objc_msgSend(obj, "count");
            *(_DWORD *)buf = v26;
            v42 = v13;
            v43 = 2048;
            v44 = v14;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "- found %lu advisories across %lu steps", buf, 0x16u);
          }

          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          v15 = v5;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v33;
            do
            {
              for (j = 0; j != v17; j = (char *)j + 1)
              {
                if (*(_QWORD *)v33 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)j);
                v21 = [MergedTransitRoutingIncidentMessage alloc];
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "transitIncidents"));
                v23 = -[MergedTransitRoutingIncidentMessage initWithGEOComposedRouteAdvisory:transitIncidents:](v21, "initWithGEOComposedRouteAdvisory:transitIncidents:", v20, v22);

                objc_msgSend(v4, "addObject:", v23);
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
            }
            while (v17);
          }

          v5 = v27;
          i = v31;
        }
      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v30);
  }

  v24 = objc_msgSend(v4, "copy");
  return v24;
}

- (void)_consumeWalkingSegment
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableArray *mutableSegmentRanges;
  void *v17;
  char *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  __CFString *v24;
  void *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  const char *v29;

  v3 = sub_100524D88();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[TransitDirectionsStepsListDataProvider _consumeWalkingSegment]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider route](self, "route"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "segmentForStepIndex:", -[GEOComposedRouteStep stepIndex](self->_currentStep, "stepIndex")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastWalkingStep"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getNextStep"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", &off_10126DBA0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider _nextStepAfterStep:withManeuvers:beforeManeuvers:](self, "_nextStepAfterStep:withManeuvers:beforeManeuvers:", v8, v9, 0));

  if (self->_forGuidance)
    v11 = v10;
  else
    v11 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider _walkingItemForWalkingSegment:toBoardStep:](self, "_walkingItemForWalkingSegment:toBoardStep:", v6, v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "majorFormattedStrings"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringWithDefaultOptions"));

  if (objc_msgSend(v15, "length"))
  {
    -[TransitDirectionsStepsListDataProvider _appendItem:toArray:](self, "_appendItem:toArray:", v12, self->_mutableItems);
    mutableSegmentRanges = self->_mutableSegmentRanges;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](NSValue, "valueWithRange:", self->_segmentRangeLocation, 1));
    -[NSMutableArray addObject:](mutableSegmentRanges, "addObject:", v17);

    ++self->_segmentRangeLocation;
  }
  v18 = (char *)objc_msgSend(v6, "stepRange");
  -[TransitDirectionsStepsListDataProvider _updateCurrentStepToIndex:](self, "_updateCurrentStepToIndex:", &v18[v19]);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep transitStep](self->_currentStep, "transitStep"));
  v21 = objc_msgSend(v20, "maneuverType");

  if ((v21 & 0xFFFFFFFE) == 6)
  {
    v22 = sub_100524D88();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      if ((_DWORD)v21 == 6)
      {
        v24 = CFSTR("TRANSFER_STOP_TO_STOP");
      }
      else if ((_DWORD)v21 == 7)
      {
        v24 = CFSTR("GOTO_STOP");
      }
      else
      {
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v21));
      }
      *(_DWORD *)buf = 138412290;
      v29 = (const char *)v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "- including next %@", buf, 0xCu);

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "composedRouteSteps"));
    v26 = objc_msgSend(v25, "mutableCopy");

    objc_msgSend(v26, "addObject:", self->_currentStep);
    v27 = objc_msgSend(v26, "copy");
    objc_msgSend(v12, "setComposedRouteSteps:", v27);

    -[TransitDirectionsStepsListDataProvider _incrementStep](self, "_incrementStep");
  }

}

- (id)_walkingItemForWalkingSegment:(id)a3 toBoardStep:(id)a4
{
  id v5;
  id v6;
  TransitDirectionsListItemWalking *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[TransitDirectionsListItemWalking initWithWalkingSegment:toBoardStep:]([TransitDirectionsListItemWalking alloc], "initWithWalkingSegment:toBoardStep:", v6, v5);

  return v7;
}

- (id)_nextLeaveStopStepAfterStep:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", &off_10126DB58));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_10126DB88, &off_10126DB70, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider _nextStepAfterStep:withManeuvers:beforeManeuvers:](self, "_nextStepAfterStep:withManeuvers:beforeManeuvers:", v4, v5, v6));

  return v7;
}

- (unint64_t)_startRangeIndexForAlightItem:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;

  v3 = a3;
  v4 = objc_msgSend(v3, "stepIndex");
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getPreviousStep"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = objc_opt_class(GEOComposedTransitTripRouteStep);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0 && objc_msgSend(v6, "maneuver") == 4)
    {
      while (1)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transitVehicle"));
        v9 = objc_msgSend(v8, "pickupDropoffType");

        if (v9 != 100)
          break;
        v4 = objc_msgSend(v6, "stepIndex");
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getPreviousStep"));

        if (v10)
        {
          v11 = objc_opt_class(GEOComposedTransitTripRouteStep);
          if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
          {
            v6 = v10;
            if (objc_msgSend(v10, "maneuver") == 4)
              continue;
          }
        }
        goto LABEL_10;
      }
    }
    v10 = v6;
LABEL_10:

  }
  return (unint64_t)v4;
}

- (id)_nextTransferStepBeforeBoarding
{
  return -[TransitDirectionsStepsListDataProvider _nextStepWithManeuver:beforeManeuver:](self, "_nextStepWithManeuver:beforeManeuver:", 6, 3);
}

- (id)_nextStepWithManeuver:(int)a3 beforeManeuver:(int)a4
{
  uint64_t v4;
  GEOComposedRouteStep *currentStep;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = *(_QWORD *)&a4;
  currentStep = self->_currentStep;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(_QWORD *)&a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataProvider _nextStepAfterStep:withManeuvers:beforeManeuvers:](self, "_nextStepAfterStep:withManeuvers:beforeManeuvers:", currentStep, v8, v10));

  return v11;
}

- (id)_previousStepBeforeStep:(id)a3 withManeuvers:(id)a4 afterManeuver:(int)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    while (1)
    {
      v9 = objc_opt_class(GEOComposedTransitRouteStep);
      if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
        v10 = objc_msgSend(v7, "maneuver");
      else
        v10 = 0;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v10));
      if (objc_msgSend(v8, "containsObject:", v11))
      {
        v12 = v7;
      }
      else
      {
        if (!(_DWORD)v10 || (_DWORD)v10 == a5)
        {

          v12 = 0;
          v13 = v7;
          goto LABEL_15;
        }
        v12 = 0;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getPreviousStep"));

      if (!v12)
      {
        v7 = v13;
        if (v13)
          continue;
      }
      goto LABEL_15;
    }
  }
  v12 = 0;
  v13 = 0;
LABEL_15:

  return v12;
}

- (id)_nextStepAfterStep:(id)a3 withManeuvers:(id)a4 beforeManeuvers:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    while (1)
    {
      v10 = objc_opt_class(GEOComposedTransitRouteStep);
      if ((objc_opt_isKindOfClass(v7, v10) & 1) != 0)
        v11 = objc_msgSend(v7, "maneuver");
      else
        v11 = 0;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v11));
      if (objc_msgSend(v8, "containsObject:", v12))
      {
        v13 = v7;
      }
      else
      {
        if (!(_DWORD)v11 || objc_msgSend(v9, "containsObject:", v12))
        {

          v13 = 0;
          v14 = v7;
          goto LABEL_15;
        }
        v13 = 0;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getNextStep"));

      if (!v13)
      {
        v7 = v14;
        if (v14)
          continue;
      }
      goto LABEL_15;
    }
  }
  v13 = 0;
  v14 = 0;
LABEL_15:

  return v13;
}

- (id)_imageForInterSystemTransferBetweenAlightingStep:(id)a3 andBoardingStep:(id)a4 currentLineColor:(id)a5 dimmedOrigin:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v11)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "transitLine"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "lineColorString"));
    v13 = (id)objc_claimAutoreleasedReturnValue(+[UIColor _maps_colorFromHexString:](UIColor, "_maps_colorFromHexString:", v22));

    if (!v6)
      goto LABEL_4;
    goto LABEL_3;
  }
  v13 = v11;
  if (v6)
  {
LABEL_3:
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "colorWithAlphaComponent:", 0.300000012));

    v13 = (id)v14;
  }
LABEL_4:
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_maps_hexString"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "transitLine"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "lineColorString"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v18, "scale");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage interSystemTransferFromHexColor:toHexColor:imageWithSize:scale:darkMode:](UIImage, "interSystemTransferFromHexColor:toHexColor:imageWithSize:scale:darkMode:", v15, v17, 4, 0));

  return v19;
}

- (id)_artworksForIntraSystemTransferBetweenAlightingStep:(id)a3 andBoardingStep:(id)a4 currentLineColor:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "_maps_hexString"));
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transitLine"));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lineColorString"));

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "transitLine"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lineColorString"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MKTransitArtwork stationNodeArtworkWithHexColor:](MKTransitArtwork, "stationNodeArtworkWithHexColor:", v11));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MKTransitArtwork stationNodeOutlinedArtworkWithHexColor:](MKTransitArtwork, "stationNodeOutlinedArtworkWithHexColor:", v14));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v18 = v17;
  if (v15)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, &off_10126DBE8);
  if (v16)
  {
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v16, &off_10126DC00);
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v16, &off_10126DBD0);
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v16, &off_10126DC18);
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v16, &off_10126DC30);
  }

  return v18;
}

- (void)_populateStationArtworkForItem:(id)a3 fromStep:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v10 = v6;
    v8 = a3;
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
    -[TransitDirectionsStepsListDataProvider _populateStationArtworkForItem:fromStepsInPreferedOrder:](self, "_populateStationArtworkForItem:fromStepsInPreferedOrder:", v8, v9, v10);

  }
  else
  {
    v9 = a3;
    -[TransitDirectionsStepsListDataProvider _populateStationArtworkForItem:fromStepsInPreferedOrder:](self, "_populateStationArtworkForItem:fromStepsInPreferedOrder:", v9, &__NSArray0__struct);
  }

}

- (void)_populateStationArtworkForItem:(id)a3 fromStepsInPreferedOrder:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = a4;
  if (objc_msgSend(v11, "type") != (id)8)
  {
    v6 = sub_10039DCD4(v5, &stru_1011BA418);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v9, "scale");
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapkit_transitArtworkImageWithDataSource:size:scale:](UIImage, "_mapkit_transitArtworkImageWithDataSource:size:scale:", v8, 7));

      objc_msgSend(v11, "setMajorStringImage:", v10);
    }

  }
}

- (void)_populateAccessPointArtworkForItem:(id)a3 fromStep:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v10 = v6;
    v8 = a3;
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
    -[TransitDirectionsStepsListDataProvider _populateAccessPointArtworkForItem:fromStepsInPreferedOrder:](self, "_populateAccessPointArtworkForItem:fromStepsInPreferedOrder:", v8, v9, v10);

  }
  else
  {
    v9 = a3;
    -[TransitDirectionsStepsListDataProvider _populateAccessPointArtworkForItem:fromStepsInPreferedOrder:](self, "_populateAccessPointArtworkForItem:fromStepsInPreferedOrder:", v9, &__NSArray0__struct);
  }

}

- (void)_populateAccessPointArtworkForItem:(id)a3 fromStepsInPreferedOrder:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = sub_10039DCD4(a4, &stru_1011BA438);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v8, "scale");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapkit_transitArtworkImageWithDataSource:size:scale:](UIImage, "_mapkit_transitArtworkImageWithDataSource:size:scale:", v7, 5));

    objc_msgSend(v10, "setMinorStringImage:", v9);
  }

}

- (NSArray)segmentRanges
{
  NSMutableArray *mutableSegmentRanges;

  mutableSegmentRanges = self->_mutableSegmentRanges;
  if (!mutableSegmentRanges)
  {
    -[TransitDirectionsStepsListDataProvider _buildItems](self, "_buildItems");
    mutableSegmentRanges = self->_mutableSegmentRanges;
  }
  return (NSArray *)mutableSegmentRanges;
}

- (GEOComposedRoute)route
{
  return (GEOComposedRoute *)objc_loadWeakRetained((id *)&self->_route);
}

- (BOOL)hasIncidentItems
{
  return self->_hasIncidentItems;
}

- (GEOComposedRoute)composedRoute
{
  return self->_composedRoute;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composedRoute, 0);
  objc_destroyWeak((id *)&self->_route);
  objc_storeStrong((id *)&self->_mutableSegmentRanges, 0);
  objc_storeStrong((id *)&self->_mutableItems, 0);
  objc_storeStrong((id *)&self->_prefixStepForNextBoardItem, 0);
  objc_storeStrong((id *)&self->_currentStep, 0);
  objc_storeStrong((id *)&self->_currentLineColor, 0);
}

@end
