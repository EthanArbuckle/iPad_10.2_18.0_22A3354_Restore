@implementation TransitDirectionsListItem

- (TransitDirectionsListItem)init
{
  return -[TransitDirectionsListItem initWithInstructions:](self, "initWithInstructions:", 0);
}

- (TransitDirectionsListItem)initWithInstructions:(id)a3
{
  id v5;
  TransitDirectionsListItem *v6;
  TransitDirectionsListItem *v7;
  uint64_t v8;
  NSArray *majorFormattedStrings;
  uint64_t v10;
  NSArray *minorFormattedStrings;
  uint64_t v12;
  NSArray *tertiaryFormattedStrings;
  id v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  NSArray *v18;
  TransitDirectionsListItem *v19;
  objc_super v21;
  id v22;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)TransitDirectionsListItem;
  v6 = -[TransitDirectionsListItem init](&v21, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transitInstruction, a3);
    v8 = objc_claimAutoreleasedReturnValue(-[MNTransitInstruction majorInstructionStrings](v7->_transitInstruction, "majorInstructionStrings"));
    majorFormattedStrings = v7->_majorFormattedStrings;
    v7->_majorFormattedStrings = (NSArray *)v8;

    v10 = objc_claimAutoreleasedReturnValue(-[MNTransitInstruction minorInstructionStrings](v7->_transitInstruction, "minorInstructionStrings"));
    minorFormattedStrings = v7->_minorFormattedStrings;
    v7->_minorFormattedStrings = (NSArray *)v10;

    v12 = objc_claimAutoreleasedReturnValue(-[MNTransitInstruction tertiaryInstructionStrings](v7->_transitInstruction, "tertiaryInstructionStrings"));
    tertiaryFormattedStrings = v7->_tertiaryFormattedStrings;
    v7->_tertiaryFormattedStrings = (NSArray *)v12;

    v14 = (id)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
    if (objc_msgSend(v14, "isInternalInstall"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v16 = objc_msgSend(v15, "BOOLForKey:", CFSTR("__internal__EnableTransitDebugLocalInstruction"));

      if (!v5
        || !v16
        || -[NSArray count](v7->_majorFormattedStrings, "count")
        || -[NSArray count](v7->_minorFormattedStrings, "count")
        || -[NSArray count](v7->_tertiaryFormattedStrings, "count"))
      {
        goto LABEL_10;
      }
      v14 = objc_msgSend(objc_alloc((Class)GEOComposedString), "initWithString:", CFSTR("Missing Instructions"));
      v22 = v14;
      v17 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
      v18 = v7->_majorFormattedStrings;
      v7->_majorFormattedStrings = (NSArray *)v17;

    }
LABEL_10:
    v19 = v7;
  }

  return v7;
}

- (id)description
{
  id v3;
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  __CFString *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  objc_super v26;

  v3 = objc_alloc((Class)NSMutableString);
  v26.receiver = self;
  v26.super_class = (Class)TransitDirectionsListItem;
  v4 = -[TransitDirectionsListItem description](&v26, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v3, "initWithString:", v5);

  v7 = -[TransitDirectionsListItem type](self, "type");
  if (v7 >= 0x12)
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown (%ld)"), v7));
  else
    v8 = off_1011DFD08[v7];
  objc_msgSend(v6, "appendFormat:", CFSTR(" %@"), v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem majorFormattedStrings](self, "majorFormattedStrings"));
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem majorFormattedStrings](self, "majorFormattedStrings"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringWithDefaultOptions"));
    objc_msgSend(v6, "appendFormat:", CFSTR(" | %@"), v13);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem minorFormattedStrings](self, "minorFormattedStrings"));
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem minorFormattedStrings](self, "minorFormattedStrings"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringWithDefaultOptions"));
    objc_msgSend(v6, "appendFormat:", CFSTR(" | %@"), v18);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem tertiaryFormattedStrings](self, "tertiaryFormattedStrings"));
  v20 = objc_msgSend(v19, "count");

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem tertiaryFormattedStrings](self, "tertiaryFormattedStrings"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "firstObject"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringWithDefaultOptions"));
    objc_msgSend(v6, "appendFormat:", CFSTR(" | %@"), v23);

  }
  v24 = objc_msgSend(v6, "copy");

  return v24;
}

- (BOOL)selectable
{
  return (id)-[TransitDirectionsListItem type](self, "type") != (id)13
      && (id)-[TransitDirectionsListItem type](self, "type") != (id)15
      && (id)-[TransitDirectionsListItem type](self, "type") != (id)7
      && (id)-[TransitDirectionsListItem type](self, "type") != (id)16;
}

- (BOOL)shouldHideInExpandedDisplayStyle
{
  return 0;
}

- (id)imageSourceForStyle:(unint64_t)a3
{
  return 0;
}

- (id)alternateImageSourceForStyle:(unint64_t)a3
{
  return 0;
}

- (unint64_t)matchingRouteStepIndex
{
  void *v2;
  void *v3;
  unint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem matchingRouteStep](self, "matchingRouteStep"));
  v3 = v2;
  if (v2)
    v4 = (unint64_t)objc_msgSend(v2, "stepIndex");
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (GEOComposedRouteStep)matchingRouteStep
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  unsigned int v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem composedRouteSteps](self, "composedRouteSteps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  switch(-[TransitDirectionsListItem type](self, "type"))
  {
    case 2:
    case 5:
    case 0xBLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem composedRouteSteps](self, "composedRouteSteps"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));

      return (GEOComposedRouteStep *)v6;
    case 3:
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem subItems](self, "subItems"));
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (!v9)
        goto LABEL_27;
      v10 = v9;
      v11 = *(_QWORD *)v30;
      while (1)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v13, "type") == (id)10)
          {
            v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "matchingRouteStep"));
            goto LABEL_26;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        if (!v10)
          goto LABEL_27;
      }
    case 8:
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem composedRouteSteps](self, "composedRouteSteps", 0));
      v14 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (!v14)
        goto LABEL_27;
      v15 = v14;
      v16 = *(_QWORD *)v26;
      break;
    default:
      if (v4)
        return (GEOComposedRouteStep *)v4;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem parentItem](self, "parentItem"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "matchingRouteStep"));
      goto LABEL_27;
  }
  while (2)
  {
    for (j = 0; j != v15; j = (char *)j + 1)
    {
      if (*(_QWORD *)v26 != v16)
        objc_enumerationMutation(v8);
      v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)j);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "transitStep"));
      v20 = objc_msgSend(v19, "maneuverType");

      if (v20 != 6)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "transitStep"));
        v22 = objc_msgSend(v21, "maneuverType");

        if (v22 != 3)
          continue;
      }
      v23 = v18;
LABEL_26:
      v24 = v23;

      v4 = v24;
      goto LABEL_27;
    }
    v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v15)
      continue;
    break;
  }
LABEL_27:

  return (GEOComposedRouteStep *)v4;
}

- ($C79183323B9A0D5602617FF3BE5395AC)displayedMapRect
{
  double y;
  double x;
  double height;
  double width;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  MKMapRect v24;
  MKMapRect v25;
  $C79183323B9A0D5602617FF3BE5395AC result;
  MKMapRect v27;

  x = MKMapRectNull.origin.x;
  y = MKMapRectNull.origin.y;
  width = MKMapRectNull.size.width;
  height = MKMapRectNull.size.height;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem composedRouteStepsDisplayedOnMap](self, "composedRouteStepsDisplayedOnMap", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v10), "mapRectAroundStartCoordinate");
        v27.origin.x = v11;
        v27.origin.y = v12;
        v27.size.width = v13;
        v27.size.height = v14;
        v24.origin.x = x;
        v24.origin.y = y;
        v24.size.width = width;
        v24.size.height = height;
        v25 = MKMapRectUnion(v24, v27);
        x = v25.origin.x;
        y = v25.origin.y;
        width = v25.size.width;
        height = v25.size.height;
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  result.var1.var1 = v18;
  result.var1.var0 = v17;
  result.var0.var1 = v16;
  result.var0.var0 = v15;
  return result;
}

- (id)formattedStringsForType:(int64_t)a3
{
  void *v4;
  void *v6;
  void *v7;
  void **v8;
  void *v9;
  void *v10;
  void *v11;

  switch(a3)
  {
    case 0:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem majorFormattedStrings](self, "majorFormattedStrings"));
      return v4;
    case 1:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem minorFormattedStrings](self, "minorFormattedStrings"));
      return v4;
    case 2:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem tertiaryFormattedStrings](self, "tertiaryFormattedStrings"));
      return v4;
    case 3:
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem primaryAccessoryString](self, "primaryAccessoryString"));
      if (!v6)
        goto LABEL_12;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem primaryAccessoryString](self, "primaryAccessoryString"));
      v11 = v7;
      v8 = &v11;
      goto LABEL_11;
    case 4:
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem secondaryAccessoryString](self, "secondaryAccessoryString"));
      if (v6)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem secondaryAccessoryString](self, "secondaryAccessoryString"));
        v10 = v7;
        v8 = &v10;
LABEL_11:
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 1));

      }
      else
      {
LABEL_12:
        v9 = 0;
      }

      return v9;
    default:
      return 0;
  }
}

- (NSArray)subItems
{
  NSArray *subItems;

  subItems = self->_subItems;
  if (!subItems)
  {
    -[TransitDirectionsListItem _rebuildSubItems](self, "_rebuildSubItems");
    subItems = self->_subItems;
  }
  return subItems;
}

- (void)setPostTertiaryItems:(id)a3
{
  NSArray *v4;
  NSArray *postTertiaryItems;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  postTertiaryItems = self->_postTertiaryItems;
  self->_postTertiaryItems = v4;

  -[TransitDirectionsListItem _invalidateSubItems](self, "_invalidateSubItems");
}

- (void)setFooterItems:(id)a3
{
  NSArray *v4;
  NSArray *footerItems;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  footerItems = self->_footerItems;
  self->_footerItems = v4;

  -[TransitDirectionsListItem _invalidateSubItems](self, "_invalidateSubItems");
}

- (void)_rebuildSubItems
{
  NSArray *v3;
  NSArray *subItems;

  v3 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", self->_postTertiaryItems));
  -[NSArray addObjectsFromArray:](v3, "addObjectsFromArray:", self->_footerItems);
  subItems = self->_subItems;
  self->_subItems = v3;

}

- (void)_invalidateSubItems
{
  NSArray *subItems;
  NSArray *subItemsExpanded;

  subItems = self->_subItems;
  self->_subItems = 0;

  subItemsExpanded = self->_subItemsExpanded;
  self->_subItemsExpanded = 0;

}

- (TransitDirectionsListItem)nextItem
{
  void *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem _subItemsForCurrentState](self, "_subItemsForCurrentState"));
  if (objc_msgSend(v3, "count"))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_nextItem);
    v6 = WeakRetained;
    if (WeakRetained)
    {
      v4 = WeakRetained;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem parentItem](self, "parentItem"));
      v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_itemAfterSubItem:", self));

    }
  }

  return (TransitDirectionsListItem *)v4;
}

- (TransitDirectionsListItem)previousItem
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_previousItem);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem parentItem](self, "parentItem"));
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_itemBeforeSubItem:", self));

  }
  return (TransitDirectionsListItem *)v5;
}

- (id)_itemBeforeSubItem:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char *v8;
  TransitDirectionsListItem *v9;
  TransitDirectionsListItem *v10;

  v5 = a3;
  v6 = v5;
  if (a3 == self)
  {
    v10 = (TransitDirectionsListItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "previousItem"));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem _subItemsForCurrentState](self, "_subItemsForCurrentState"));
    v8 = (char *)objc_msgSend(v7, "indexOfObject:", v6);

    if (v8 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = 0;
    }
    else
    {
      if (v8)
        v9 = (TransitDirectionsListItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v8 - 1));
      else
        v9 = self;
      v10 = v9;
    }
    v6 = v7;
  }

  return v10;
}

- (id)_itemAfterSubItem:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char *v8;
  void *v9;
  id WeakRetained;

  v5 = a3;
  v6 = v5;
  if (a3 == self)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nextItem"));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem _subItemsForCurrentState](self, "_subItemsForCurrentState"));
    v8 = (char *)objc_msgSend(v7, "indexOfObject:", v6);

    if (v8 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = 0;
    }
    else
    {
      if (v8 + 1 == objc_msgSend(v7, "count"))
        WeakRetained = objc_loadWeakRetained((id *)&self->_nextItem);
      else
        WeakRetained = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v8 + 1));
      v9 = WeakRetained;
    }
    v6 = v7;
  }

  return v9;
}

- (id)_subItemsForCurrentState
{
  TransitDirectionsListItem *v3;
  void *v4;

  if (-[TransitDirectionsListItem conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___TransitDirectionsListExpandableItem))
  {
    v3 = self;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem subItemsWithForceExpand:](v3, "subItemsWithForceExpand:", -[TransitDirectionsListItem expanded](v3, "expanded")));

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem subItems](self, "subItems"));
  }
  return v4;
}

- (NSArray)composedRouteStepsDisplayedOnMap
{
  NSArray *composedRouteStepsDisplayedOnMap;
  NSArray *v4;
  NSArray *v5;

  composedRouteStepsDisplayedOnMap = self->_composedRouteStepsDisplayedOnMap;
  if (!composedRouteStepsDisplayedOnMap)
  {
    v4 = (NSArray *)-[NSArray copy](self->_composedRouteSteps, "copy");
    v5 = self->_composedRouteStepsDisplayedOnMap;
    self->_composedRouteStepsDisplayedOnMap = v4;

    composedRouteStepsDisplayedOnMap = self->_composedRouteStepsDisplayedOnMap;
  }
  return composedRouteStepsDisplayedOnMap;
}

- (UIColor)alternateFromLineColor
{
  UIColor *v3;

  v3 = self->_alternateFromLineColor;
  if (!v3)
    v3 = self->_fromLineColor;
  return v3;
}

- (UIColor)alternateToLineColor
{
  UIColor *v3;

  v3 = self->_alternateToLineColor;
  if (!v3)
    v3 = self->_toLineColor;
  return v3;
}

- (double)lineWidthForView:(id)a3
{
  id v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  int v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "traitCollection"));
  v5 = 5.0;
  if (objc_msgSend(v4, "userInterfaceIdiom") == (id)5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "traitCollection"));
    objc_msgSend(v6, "displayScale");
    if (((int)v7 & 1) != 0)
      v8 = 4;
    else
      v8 = 3;
    v5 = (double)v8;

  }
  return v5;
}

+ (int64_t)defaultInstructionContextForItemType:(int64_t)a3 forGuidance:(BOOL)a4
{
  uint64_t v4;
  int64_t v5;

  v4 = 1;
  if (!a4)
    v4 = 2;
  if (((1 << a3) & 0x3E2DF) != 0)
    v5 = v4;
  else
    v5 = 2;
  if ((unint64_t)a3 <= 0x11)
    return v5;
  else
    return 2;
}

- (MNTransitInstruction)transitInstruction
{
  return self->_transitInstruction;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSArray)majorFormattedStrings
{
  return self->_majorFormattedStrings;
}

- (void)setMajorFormattedStrings:(id)a3
{
  objc_storeStrong((id *)&self->_majorFormattedStrings, a3);
}

- (UIImage)majorStringImage
{
  return self->_majorStringImage;
}

- (void)setMajorStringImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)minorFormattedStrings
{
  return self->_minorFormattedStrings;
}

- (void)setMinorFormattedStrings:(id)a3
{
  objc_storeStrong((id *)&self->_minorFormattedStrings, a3);
}

- (UIImage)minorStringImage
{
  return self->_minorStringImage;
}

- (void)setMinorStringImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)tertiaryFormattedStrings
{
  return self->_tertiaryFormattedStrings;
}

- (void)setTertiaryFormattedStrings:(id)a3
{
  objc_storeStrong((id *)&self->_tertiaryFormattedStrings, a3);
}

- (NSArray)badges
{
  return self->_badges;
}

- (void)setBadges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (GEOComposedString)primaryAccessoryString
{
  return self->_primaryAccessoryString;
}

- (void)setPrimaryAccessoryString:(id)a3
{
  objc_storeStrong((id *)&self->_primaryAccessoryString, a3);
}

- (GEOComposedString)secondaryAccessoryString
{
  return self->_secondaryAccessoryString;
}

- (void)setSecondaryAccessoryString:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryAccessoryString, a3);
}

- (BOOL)hideAccessoryStringsWhenCollapsed
{
  return self->_hideAccessoryStringsWhenCollapsed;
}

- (void)setHideAccessoryStringsWhenCollapsed:(BOOL)a3
{
  self->_hideAccessoryStringsWhenCollapsed = a3;
}

- (UIColor)fromLineColor
{
  return self->_fromLineColor;
}

- (void)setFromLineColor:(id)a3
{
  objc_storeStrong((id *)&self->_fromLineColor, a3);
}

- (UIColor)toLineColor
{
  return self->_toLineColor;
}

- (void)setToLineColor:(id)a3
{
  objc_storeStrong((id *)&self->_toLineColor, a3);
}

- (void)setAlternateFromLineColor:(id)a3
{
  objc_storeStrong((id *)&self->_alternateFromLineColor, a3);
}

- (void)setAlternateToLineColor:(id)a3
{
  objc_storeStrong((id *)&self->_alternateToLineColor, a3);
}

- (NSArray)composedRouteSteps
{
  return self->_composedRouteSteps;
}

- (void)setComposedRouteSteps:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)setComposedRouteStepsDisplayedOnMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (TransitDirectionsListItem)parentItem
{
  return (TransitDirectionsListItem *)objc_loadWeakRetained((id *)&self->_parentItem);
}

- (void)setParentItem:(id)a3
{
  objc_storeWeak((id *)&self->_parentItem, a3);
}

- (NSArray)postTertiaryItems
{
  return self->_postTertiaryItems;
}

- (NSArray)footerItems
{
  return self->_footerItems;
}

- (void)setPreviousItem:(id)a3
{
  objc_storeWeak((id *)&self->_previousItem, a3);
}

- (void)setNextItem:(id)a3
{
  objc_storeWeak((id *)&self->_nextItem, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_nextItem);
  objc_destroyWeak((id *)&self->_previousItem);
  objc_storeStrong((id *)&self->_footerItems, 0);
  objc_storeStrong((id *)&self->_postTertiaryItems, 0);
  objc_destroyWeak((id *)&self->_parentItem);
  objc_storeStrong((id *)&self->_composedRouteStepsDisplayedOnMap, 0);
  objc_storeStrong((id *)&self->_composedRouteSteps, 0);
  objc_storeStrong((id *)&self->_alternateToLineColor, 0);
  objc_storeStrong((id *)&self->_alternateFromLineColor, 0);
  objc_storeStrong((id *)&self->_toLineColor, 0);
  objc_storeStrong((id *)&self->_fromLineColor, 0);
  objc_storeStrong((id *)&self->_secondaryAccessoryString, 0);
  objc_storeStrong((id *)&self->_primaryAccessoryString, 0);
  objc_storeStrong((id *)&self->_tertiaryFormattedStrings, 0);
  objc_storeStrong((id *)&self->_minorStringImage, 0);
  objc_storeStrong((id *)&self->_minorFormattedStrings, 0);
  objc_storeStrong((id *)&self->_majorStringImage, 0);
  objc_storeStrong((id *)&self->_majorFormattedStrings, 0);
  objc_storeStrong((id *)&self->_transitInstruction, 0);
  objc_storeStrong((id *)&self->_badges, 0);
  objc_storeStrong((id *)&self->_subItemsExpanded, 0);
  objc_storeStrong((id *)&self->_subItems, 0);
}

@end
