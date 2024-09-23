@implementation MapViewModeSelector

- (MapViewModeSelector)init
{
  return -[MapViewModeSelector initWithDesiredViewModes:](self, "initWithDesiredViewModes:", &off_101273140);
}

- (MapViewModeSelector)initWithDesiredViewModes:(id)a3
{
  id v5;
  MapViewModeSelector *v6;
  MapViewModeSelector *v7;
  id v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  MapViewModeSelector *v21;
  id v22;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MapViewModeSelector;
  v6 = -[MapViewModeSelector init](&v23, "init");
  v7 = v6;
  if (v6)
  {
    v22 = v5;
    objc_storeStrong((id *)&v6->_desiredViewModes, a3);
    v21 = v7;
    v8 = (id)objc_claimAutoreleasedReturnValue(-[MapViewModeSelector orderedViewModes](v7, "orderedViewModes"));
    v9 = objc_opt_new(NSMutableArray);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v25;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v10);
          switch((unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v14), "integerValue"))
          {
            case 0uLL:
              v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v16 = v15;
              v17 = CFSTR("Map [Explore Mode Title]");
              goto LABEL_13;
            case 1uLL:
            case 5uLL:
              v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v16 = v15;
              v17 = CFSTR("Hybrid");
              goto LABEL_13;
            case 2uLL:
            case 6uLL:
              v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v16 = v15;
              v17 = CFSTR("Satellite");
              goto LABEL_13;
            case 3uLL:
              v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v16 = v15;
              v17 = CFSTR("View Mode Transit");
              goto LABEL_13;
            case 7uLL:
              v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v16 = v15;
              v17 = CFSTR("View Mode Driving");
LABEL_13:
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", v17, CFSTR("localized string not found"), 0));

              if (v18)
              {
                -[NSMutableArray addObject:](v9, "addObject:", v18);

              }
              break;
            default:
              break;
          }
          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v12);
    }

    v19 = -[NSMutableArray copy](v9, "copy");
    v7 = v21;
    -[MapViewModeSelector _maps_setItems:](v21, "_maps_setItems:", v19);

    v5 = v22;
  }

  return v7;
}

- (NSArray)orderedViewModes
{
  NSArray *orderedViewModes;
  id v4;
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  NSArray *v13;
  NSArray *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  orderedViewModes = self->_orderedViewModes;
  if (!orderedViewModes)
  {
    v4 = objc_alloc_init((Class)NSMutableArray);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = self->_desiredViewModes;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          v11 = objc_msgSend(v10, "integerValue", (_QWORD)v16);
          if ((unint64_t)v11 <= 7 && v11 != (id)4)
            objc_msgSend(v4, "addObject:", v10);
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    v13 = (NSArray *)objc_msgSend(v4, "copy");
    v14 = self->_orderedViewModes;
    self->_orderedViewModes = v13;

    orderedViewModes = self->_orderedViewModes;
  }
  return orderedViewModes;
}

- (int64_t)selectedViewMode
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v3 = -[MapViewModeSelector selectedSegmentIndex](self, "selectedSegmentIndex");
  if ((unint64_t)v3 > 0x7FFFFFFFFFFFFFFELL)
    return -1;
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeSelector orderedViewModes](self, "orderedViewModes"));
  v6 = objc_msgSend(v5, "count");

  if (v4 >= v6)
    return -1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeSelector orderedViewModes](self, "orderedViewModes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v4));
  v9 = objc_msgSend(v8, "integerValue");

  return (int64_t)v9;
}

- (void)setSelectedViewMode:(int64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  if ((unint64_t)a3 > 7)
    v4 = 0;
  else
    v4 = qword_100E35590[a3];
  if (((v4 - 1) & 0xFFFFFFFFFFFFFFFALL) != 0)
    v5 = v4;
  else
    v5 = 2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeSelector orderedViewModes](self, "orderedViewModes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v5));
  v8 = objc_msgSend(v6, "indexOfObject:", v7);

  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
    v9 = 0;
  else
    v9 = v8;
  -[MapViewModeSelector setSelectedSegmentIndex:](self, "setSelectedSegmentIndex:", v9);
}

- (BOOL)updateSegmentsIfNeededToFitWidth:(double)a3
{
  BOOL result;
  unsigned __int8 v6;

  if (a3 <= 0.0)
    return 0;
  if (self->_lastLayoutWidth == a3)
    return self->_lastLayoutWidthFits;
  self->_lastLayoutWidth = a3;
  -[MapViewModeSelector setApportionsSegmentWidthsByContent:](self, "setApportionsSegmentWidthsByContent:", 0);
  v6 = -[MapViewModeSelector _maps_testFitSegmentTitlesToWidth:](self, "_maps_testFitSegmentTitlesToWidth:", a3);
  self->_lastLayoutWidthFits = v6;
  if ((v6 & 1) != 0)
    return 1;
  -[MapViewModeSelector setApportionsSegmentWidthsByContent:](self, "setApportionsSegmentWidthsByContent:", 1);
  result = -[MapViewModeSelector _maps_testFitSegmentTitlesToWidth:](self, "_maps_testFitSegmentTitlesToWidth:", a3);
  self->_lastLayoutWidthFits = result;
  return result;
}

- (void)setOrderedViewModes:(id)a3
{
  objc_storeStrong((id *)&self->_orderedViewModes, a3);
}

- (double)lastLayoutWidth
{
  return self->_lastLayoutWidth;
}

- (void)setLastLayoutWidth:(double)a3
{
  self->_lastLayoutWidth = a3;
}

- (BOOL)lastLayoutWidthFits
{
  return self->_lastLayoutWidthFits;
}

- (void)setLastLayoutWidthFits:(BOOL)a3
{
  self->_lastLayoutWidthFits = a3;
}

- (NSArray)desiredViewModes
{
  return self->_desiredViewModes;
}

- (void)setDesiredViewModes:(id)a3
{
  objc_storeStrong((id *)&self->_desiredViewModes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredViewModes, 0);
  objc_storeStrong((id *)&self->_orderedViewModes, 0);
}

@end
