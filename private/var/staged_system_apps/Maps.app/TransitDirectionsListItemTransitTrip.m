@implementation TransitDirectionsListItemTransitTrip

- (TransitDirectionsListItemTransitTrip)initWithTripStep:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  TransitDirectionsListItemTransitTrip *v13;
  TransitDirectionsListItemTransitTrip *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  NSArray *badges;
  objc_super v20;
  _UNKNOWN **v21;
  void *v22;
  _UNKNOWN **v23;
  void *v24;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routeDetailsPrimaryArtwork"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "steppingArtwork"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MNTransitStepInstruction instructionForStep:context:](MNTransitStepInstruction, "instructionForStep:context:", v5, 1));
  if (v7)
  {
    v23 = &off_10126D3A8;
    v24 = v7;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
    if (v9)
    {
LABEL_3:
      v21 = &off_10126D3A8;
      v22 = v9;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
      goto LABEL_6;
    }
  }
  else
  {
    v11 = &__NSDictionary0__struct;
    if (v9)
      goto LABEL_3;
  }
  v12 = &__NSDictionary0__struct;
LABEL_6:
  v20.receiver = self;
  v20.super_class = (Class)TransitDirectionsListItemTransitTrip;
  v13 = -[TransitDirectionsListArtworkItem initWithArtworks:alternateArtworks:instructions:](&v20, "initWithArtworks:alternateArtworks:instructions:", v11, v12, v10);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_tripStep, a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transitStep"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "badges"));
    v17 = (NSArray *)objc_msgSend(v16, "copy");
    badges = v14->super.super._badges;
    v14->super.super._badges = v17;

  }
  return v14;
}

- (void)setExpandedItems:(id)a3
{
  NSArray *v4;
  NSArray *expandedItems;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  expandedItems = self->_expandedItems;
  self->_expandedItems = v4;

  -[TransitDirectionsListItem _invalidateSubItems](self, "_invalidateSubItems");
}

- (GEOComposedTransitTripRouteStep)tripStep
{
  return self->_tripStep;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

- (NSArray)expandedItems
{
  return self->_expandedItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandedItems, 0);
  objc_storeStrong((id *)&self->_tripStep, 0);
  objc_storeStrong((id *)&self->_locallyGeneratedSubstepsFooter, 0);
}

- (id)expandingButtonTitleForExpandedState:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  if (a3
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItemTransitTrip expandedItems](self, "expandedItems")),
        v5 = objc_msgSend(v4, "count"),
        v4,
        v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItemTransitTrip _collapseButtonTitleByVehicleType](self, "_collapseButtonTitleByVehicleType"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItemTransitTrip _expandButtonTitleFromServer](self, "_expandButtonTitleFromServer"));
    if (!objc_msgSend(v6, "length"))
    {
      v7 = objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItemTransitTrip _countStopsStringFromServer](self, "_countStopsStringFromServer"));

      v6 = (void *)v7;
    }
    if (!objc_msgSend(v6, "length"))
    {
      v8 = objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItemTransitTrip _countStopsStringClientFallback](self, "_countStopsStringClientFallback"));

      v6 = (void *)v8;
    }
  }
  return v6;
}

- (id)_collapseButtonTitleByVehicleType
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItemTransitTrip tripStep](self, "tripStep"));
  v4 = objc_msgSend(v3, "isBus");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = v5;
    v7 = CFSTR("Transit_Ride_Steps_Hide_Bus");
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItemTransitTrip tripStep](self, "tripStep"));
    v9 = objc_msgSend(v8, "isRail");

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = v5;
    if (v9)
      v7 = CFSTR("Transit_Ride_Steps_Hide_Rail");
    else
      v7 = CFSTR("Transit_Ride_Steps_Hide_Other");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, CFSTR("localized string not found"), 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItemTransitTrip expandedItems](self, "expandedItems"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, objc_msgSend(v11, "count")));

  return v12;
}

- (id)_expandButtonTitleFromServer
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem transitInstruction](self, "transitInstruction"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "expandableListString"));

  if (!v4)
  {
    if ((id)-[TransitDirectionsListItem type](self, "type") == (id)3
      && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem previousItem](self, "previousItem")),
          v6 = objc_msgSend(v5, "type"),
          v5,
          v6 == (id)2))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem previousItem](self, "previousItem"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transitInstruction"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "expandableListString"));

    }
    else
    {
      v4 = 0;
    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringWithDefaultOptions"));

  return v9;
}

- (id)_countStopsStringFromServer
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem transitInstruction](self, "transitInstruction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "countStopsString"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "optionsWithArgumentHandler:", &stru_1011E2AA8));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringWithOptions:", v4));

  return v5;
}

- (id)_countStopsStringClientFallback
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItemTransitTrip expandedItems](self, "expandedItems"));
  v4 = (uint64_t)objc_msgSend(v3, "count");
  v5 = v4 + 1;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItemTransitTrip expandedItems](self, "expandedItems"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));

  if (v7 && objc_msgSend(v7, "type") != (id)5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItemTransitTrip expandedItems](self, "expandedItems"));
    v9 = objc_msgSend(v8, "count");

    if (v9 == (id)2)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItemTransitTrip expandedItems](self, "expandedItems"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "composedRouteSteps"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastObject"));

      v14 = objc_opt_class(GEOComposedTransitRouteStep);
      if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0 && objc_msgSend(v13, "maneuver") == 5)
        v4 = 1;

    }
    v5 = v4;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItemTransitTrip tripStep](self, "tripStep"));
  v16 = objc_msgSend(v15, "isBus");

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = v17;
    v19 = CFSTR("%d stop [BUS]");
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItemTransitTrip tripStep](self, "tripStep"));
    v21 = objc_msgSend(v20, "isRail");

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = v17;
    if (v21)
      v19 = CFSTR("%d stop [RAIL]");
    else
      v19 = CFSTR("%d stop [OTHER]");
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", v19, CFSTR("localized string not found"), 0));

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v5));
  return v23;
}

- (BOOL)shouldEnableExpandedButton
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItemTransitTrip expandedItems](self, "expandedItems"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)shouldDisplayExpandButton
{
  return 0;
}

- (void)_rebuildSubItems
{
  id v3;
  NSArray *v4;
  NSArray *subItems;

  v3 = sub_100B1084C(self, 0);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue(v3);
  subItems = self->super.super._subItems;
  self->super.super._subItems = v4;

}

- (id)subItemsWithForceExpand:(BOOL)a3
{
  _BOOL4 v3;
  NSArray *v5;
  NSArray *subItemsExpanded;
  id v7;
  NSArray *v8;
  NSArray *v9;

  v3 = a3;
  if (-[TransitDirectionsListItemTransitTrip expanded](self, "expanded") || v3)
  {
    subItemsExpanded = self->super.super._subItemsExpanded;
    if (!subItemsExpanded)
    {
      v7 = sub_100B1084C(self, 1);
      v8 = (NSArray *)objc_claimAutoreleasedReturnValue(v7);
      v9 = self->super.super._subItemsExpanded;
      self->super.super._subItemsExpanded = v8;

      subItemsExpanded = self->super.super._subItemsExpanded;
    }
    v5 = subItemsExpanded;
  }
  else
  {
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem subItems](self, "subItems"));
  }
  return v5;
}

- (unint64_t)numberOfSubItemsWithForceExpand:(BOOL)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItemTransitTrip subItemsWithForceExpand:](self, "subItemsWithForceExpand:", a3));
  v4 = objc_msgSend(v3, "count");

  return (unint64_t)v4;
}

@end
