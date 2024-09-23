@implementation TransitDirectionsListItemWalking

- (TransitDirectionsListItemWalking)initWithWalkingSegment:(id)a3 toBoardStep:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  TransitDirectionsListItemWalking *v14;
  uint64_t v15;
  NSArray *walkingSubItems;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  TransitDirectionsListBoardingInfoItem *v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  id v33;
  id v34;
  TransitDirectionsListItemWalking *v35;
  objc_super v37;
  TransitDirectionsListBoardingInfoItem *v38;
  _UNKNOWN **v39;
  void *v40;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MNTransitWalkingSegmentInstruction instructionForWalkingSegment:context:](MNTransitWalkingSegmentInstruction, "instructionForWalkingSegment:context:", v6, 2));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "steps"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "routeDetailsPrimaryArtwork"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));

  if (v12)
  {
    v39 = &off_10126D3A8;
    v40 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
  }
  else
  {
    v13 = &__NSDictionary0__struct;
  }
  v37.receiver = self;
  v37.super_class = (Class)TransitDirectionsListItemWalking;
  v14 = -[TransitDirectionsListArtworkItem initWithArtworks:alternateArtworks:instructions:](&v37, "initWithArtworks:alternateArtworks:instructions:", v13, 0, v8);
  if (v12)

  if (v14)
  {
    v15 = objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItemWalking _generateWalkingSubSteps](v14, "_generateWalkingSubSteps"));
    walkingSubItems = v14->_walkingSubItems;
    v14->_walkingSubItems = (NSArray *)v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "boardingInfo"));
    v18 = objc_msgSend(v17, "hasPreBoardingTimeInstruction");

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "boardingInfo"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "preBoardingTimeInstruction"));

      v21 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
      if (objc_msgSend(v20, "hasPrimaryText"))
      {
        v22 = objc_alloc((Class)GEOComposedString);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "primaryText"));
        v24 = objc_msgSend(v22, "initWithGeoFormattedString:", v23);
        objc_msgSend(v21, "addObject:", v24);

      }
      if (objc_msgSend(v20, "hasSecondaryText"))
      {
        v25 = objc_alloc((Class)GEOComposedString);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "secondaryText"));
        v27 = objc_msgSend(v25, "initWithGeoFormattedString:", v26);
        objc_msgSend(v21, "addObject:", v27);

      }
      v28 = -[TransitDirectionsListBoardingInfoItem initWithPreboardingStrings:]([TransitDirectionsListBoardingInfoItem alloc], "initWithPreboardingStrings:", v21);
      -[TransitDirectionsListItem setParentItem:](v28, "setParentItem:", v14);
      v38 = v28;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v38, 1));
      -[TransitDirectionsListItem setFooterItems:](v14, "setFooterItems:", v29);

    }
    -[TransitDirectionsListItem setType:](v14, "setType:", 9);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "steps"));
    -[TransitDirectionsListItem setComposedRouteStepsDisplayedOnMap:](v14, "setComposedRouteStepsDisplayedOnMap:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "lastObject"));
    v32 = objc_msgSend(v31, "isArrivalStep");

    if (v32)
    {
      v33 = objc_msgSend(v30, "mutableCopy");
      objc_msgSend(v33, "removeLastObject");
      v34 = objc_msgSend(v33, "copy");

      v30 = v34;
    }
    -[TransitDirectionsListItem setComposedRouteSteps:](v14, "setComposedRouteSteps:", v30);
    v35 = v14;

  }
  return v14;
}

- (id)_transitWalkingLegInstruction
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem transitInstruction](self, "transitInstruction"));
  v4 = objc_opt_class(MNTransitWalkingSegmentInstruction);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem transitInstruction](self, "transitInstruction"));
  else
    v6 = 0;
  return v6;
}

- (id)_generateWalkingSubSteps
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  _UNKNOWN **v8;
  void **v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  TransitDirectionsListItem *v14;
  id v15;
  void **v16;
  void *v17;
  double v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v25;
  uint64_t v26;
  void *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  void *v33;
  id v34;
  _BYTE v35[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItemWalking _transitWalkingLegInstruction](self, "_transitWalkingLegInstruction"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "walkingSegment"));

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "stepCount")));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v25 = v4;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "steps"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v30;
    v8 = CPLaneGuidance_ptr;
    v9 = (void **)MKPlaceCollectionsLogicController_ptr;
    v26 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        if (!-[TransitDirectionsListItemWalking _shouldHideWalkingSubStep:](self, "_shouldHideWalkingSubStep:", v11))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentsForContext:", 1));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "instruction"));

          if (v13)
          {
            v14 = objc_alloc_init(TransitDirectionsListItem);
            v15 = objc_msgSend(objc_alloc((Class)v8[93]), "initWithString:", v13);
            v34 = v15;
            v16 = v9;
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[304], "arrayWithObjects:count:", &v34, 1));
            -[TransitDirectionsListItem setMajorFormattedStrings:](v14, "setMajorFormattedStrings:", v17);

            objc_msgSend(v11, "distance");
            if (v18 <= 0.0)
            {
              -[TransitDirectionsListItem setPrimaryAccessoryString:](v14, "setPrimaryAccessoryString:", 0);
            }
            else
            {
              v19 = objc_alloc((Class)v8[93]);
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "distanceString"));
              v21 = objc_msgSend(v19, "initWithString:", v20);
              -[TransitDirectionsListItem setPrimaryAccessoryString:](v14, "setPrimaryAccessoryString:", v21);

            }
            -[TransitDirectionsListItem setParentItem:](v14, "setParentItem:", self);
            -[TransitDirectionsListItem setType:](v14, "setType:", 14);
            v33 = v11;
            v9 = v16;
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16[304], "arrayWithObjects:count:", &v33, 1));
            -[TransitDirectionsListItem setComposedRouteSteps:](v14, "setComposedRouteSteps:", v22);

            objc_msgSend(v27, "addObject:", v14);
            v8 = CPLaneGuidance_ptr;
            v7 = v26;
          }

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v6);
  }

  v23 = objc_msgSend(v27, "copy");
  return v23;
}

- (BOOL)_shouldHideWalkingSubStep:(id)a3
{
  id v3;
  void *v4;
  double v5;
  BOOL v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "geoStep"));
  if (objc_msgSend(v4, "maneuverType") == 18)
  {
    objc_msgSend(v3, "distance");
    v6 = v5 < 3.048;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

- (NSArray)walkingSubItems
{
  return self->_walkingSubItems;
}

- (void)setWalkingSubItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walkingSubItems, 0);
}

- (NSArray)expandedItems
{
  return -[TransitDirectionsListItemWalking walkingSubItems](self, "walkingSubItems");
}

- (void)setExpandedItems:(id)a3
{
  -[TransitDirectionsListItemWalking setWalkingSubItems:](self, "setWalkingSubItems:", a3);
  -[TransitDirectionsListItem _invalidateSubItems](self, "_invalidateSubItems");
}

- (id)expandingButtonTitleForExpandedState:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItemWalking expandedItems](self, "expandedItems"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    if (v3)
      v8 = CFSTR("Transit_Walking_Steps_Hide");
    else
      v8 = CFSTR("Details_Stepping_List_iOS");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, CFSTR("localized string not found"), 0));

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (BOOL)shouldEnableExpandedButton
{
  return 1;
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
  if (-[TransitDirectionsListItemWalking expanded](self, "expanded") || v3)
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItemWalking subItemsWithForceExpand:](self, "subItemsWithForceExpand:", a3));
  v4 = objc_msgSend(v3, "count");

  return (unint64_t)v4;
}

@end
