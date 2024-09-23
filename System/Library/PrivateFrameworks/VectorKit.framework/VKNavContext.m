@implementation VKNavContext

- (VKNavContext)init
{
  VKNavContext *v2;
  VKNavContext *v3;
  GEOComposedRoute *route;
  uint64_t v5;
  NSHashTable *observers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VKNavContext;
  v2 = -[VKNavContext init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    route = v2->_route;
    v2->_route = 0;

    v3->_currentStepIndex = 0;
    v3->_navigationCameraHeadingOverride = 0;
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 1);
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v5;

  }
  return v3;
}

- (void)updateWithNewRoute:(id)a3 currentStepIndex:(unint64_t)a4
{
  GEORouteMatch *routeMatch;
  NSArray *groupedManeuverCounts;
  GEOComposedRoute *v9;

  v9 = (GEOComposedRoute *)a3;
  if (self->_route != v9)
  {
    -[VKNavContext clearAdditionalRoutesToFrame](self, "clearAdditionalRoutesToFrame");
    routeMatch = self->_routeMatch;
    self->_routeMatch = 0;

    objc_storeStrong((id *)&self->_route, a3);
    self->_currentStepIndex = a4;
    groupedManeuverCounts = self->_groupedManeuverCounts;
    self->_groupedManeuverCounts = 0;

    -[VKNavContext _notifyObserversStateChanged](self, "_notifyObserversStateChanged");
  }

}

- (void)setRouteMatch:(id)a3
{
  GEORouteMatch *v5;

  v5 = (GEORouteMatch *)a3;
  if (self->_routeMatch != v5)
  {
    objc_storeStrong((id *)&self->_routeMatch, a3);
    -[VKNavContext _notifyObserversStateChanged](self, "_notifyObserversStateChanged");
  }

}

- (void)setCurrentStepIndex:(unint64_t)a3
{
  if (self->_currentStepIndex != a3)
  {
    self->_currentStepIndex = a3;
    -[VKNavContext _notifyObserversStateChanged](self, "_notifyObserversStateChanged");
  }
}

- (unint64_t)groupedManeuverCount
{
  NSArray *groupedManeuverCounts;
  unint64_t currentStepIndex;
  void *v5;
  unint64_t v6;

  groupedManeuverCounts = self->_groupedManeuverCounts;
  if (!groupedManeuverCounts)
    return 0;
  currentStepIndex = self->_currentStepIndex;
  if (currentStepIndex >= -[NSArray count](groupedManeuverCounts, "count"))
    return 0;
  -[NSArray objectAtIndexedSubscript:](self->_groupedManeuverCounts, "objectAtIndexedSubscript:", self->_currentStepIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  return v6;
}

- (void)clearPointsToFrame
{
  self->_pointsToFrame.__end_ = self->_pointsToFrame.__begin_;
}

- (void)clearPointsToFrameOfType:(unint64_t)a3
{
  AdditionalPointInfo *end;
  AdditionalPointInfo *begin;
  AdditionalPointInfo *v5;
  __int128 v6;

  begin = self->_pointsToFrame.__begin_;
  end = self->_pointsToFrame.__end_;
  if (begin != end)
  {
    while (*((_QWORD *)begin + 3) != a3)
    {
      begin = (AdditionalPointInfo *)((char *)begin + 32);
      if (begin == end)
        return;
    }
    if (begin != end)
    {
      v5 = (AdditionalPointInfo *)((char *)begin + 32);
      if ((AdditionalPointInfo *)((char *)begin + 32) != end)
      {
        do
        {
          if (*((_QWORD *)v5 + 3) != a3)
          {
            v6 = *((_OWORD *)v5 + 1);
            *(_OWORD *)begin = *(_OWORD *)v5;
            *((_OWORD *)begin + 1) = v6;
            begin = (AdditionalPointInfo *)((char *)begin + 32);
          }
          v5 = (AdditionalPointInfo *)((char *)v5 + 32);
        }
        while (v5 != end);
        end = self->_pointsToFrame.__end_;
      }
    }
    if (begin != end)
      self->_pointsToFrame.__end_ = begin;
  }
}

- (void)addPointToFrame:(id)a3 ofType:(unint64_t)a4
{
  double var2;
  double var1;
  double var0;
  AdditionalPointInfo *value;
  AdditionalPointInfo *end;
  AdditionalPointInfo *v11;
  AdditionalPointInfo *begin;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  __int128 v19;

  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  end = self->_pointsToFrame.__end_;
  value = self->_pointsToFrame.__end_cap_.__value_;
  if (end >= value)
  {
    begin = self->_pointsToFrame.__begin_;
    v13 = (end - begin) >> 5;
    v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) >> 59)
      abort();
    v15 = value - begin;
    if (v15 >> 4 > v14)
      v14 = v15 >> 4;
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFE0)
      v16 = 0x7FFFFFFFFFFFFFFLL;
    else
      v16 = v14;
    if (v16)
    {
      if (v16 >> 59)
        std::__throw_bad_array_new_length[abi:nn180100]();
      v17 = (char *)operator new(32 * v16);
    }
    else
    {
      v17 = 0;
    }
    v18 = &v17[32 * v13];
    *(double *)v18 = var0;
    *((double *)v18 + 1) = var1;
    *((double *)v18 + 2) = var2;
    *((_QWORD *)v18 + 3) = a4;
    v11 = (AdditionalPointInfo *)(v18 + 32);
    if (end != begin)
    {
      do
      {
        v19 = *((_OWORD *)end - 1);
        *((_OWORD *)v18 - 2) = *((_OWORD *)end - 2);
        *((_OWORD *)v18 - 1) = v19;
        v18 -= 32;
        end = (AdditionalPointInfo *)((char *)end - 32);
      }
      while (end != begin);
      end = self->_pointsToFrame.__begin_;
    }
    self->_pointsToFrame.__begin_ = (AdditionalPointInfo *)v18;
    self->_pointsToFrame.__end_ = v11;
    self->_pointsToFrame.__end_cap_.__value_ = (AdditionalPointInfo *)&v17[32 * v16];
    if (end)
      operator delete(end);
  }
  else
  {
    *($1AB5FA073B851C12C2339EC22442E995 *)end = a3;
    v11 = (AdditionalPointInfo *)((char *)end + 32);
    *((_QWORD *)end + 3) = a4;
  }
  self->_pointsToFrame.__end_ = v11;
}

- (void)enumeratePointsToFrameOfType:(unint64_t)a3 usingBlock:(id)a4
{
  AdditionalPointInfo *end;
  AdditionalPointInfo *begin;
  void (**v8)(double, double, double);

  v8 = (void (**)(double, double, double))a4;
  if (v8)
  {
    begin = self->_pointsToFrame.__begin_;
    end = self->_pointsToFrame.__end_;
    while (begin != end)
    {
      if (*((_QWORD *)begin + 3) == a3)
        v8[2](*(double *)begin, *((double *)begin + 1), *((double *)begin + 2));
      begin = (AdditionalPointInfo *)((char *)begin + 32);
    }
  }

}

- (void)enumeratePointsToFrameUsingBlock:(id)a3
{
  AdditionalPointInfo *i;
  AdditionalPointInfo *begin;
  void (**v6)(id, _QWORD, double, double, double);

  v6 = (void (**)(id, _QWORD, double, double, double))a3;
  if (v6)
  {
    begin = self->_pointsToFrame.__begin_;
    for (i = self->_pointsToFrame.__end_; begin != i; begin = (AdditionalPointInfo *)((char *)begin + 32))
      v6[2](v6, *((_QWORD *)begin + 3), *(double *)begin, *((double *)begin + 1), *((double *)begin + 2));
  }

}

- (void)_notifyObserversStateChanged
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = self->_observers;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "navContextStateDidChange:", self, (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)setNavigationCameraHeadingOverride:(unint64_t)a3
{
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_navigationCameraHeadingOverride != a3)
  {
    self->_navigationCameraHeadingOverride = a3;
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = self->_observers;
    v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "navContextCameraHeadingOverrideDidChange:", self, (_QWORD)v8);
        }
        while (v5 != v7);
        v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (unint64_t)navigationCameraHeadingOverride
{
  return self->_navigationCameraHeadingOverride;
}

- (void)clearAdditionalRoutesToFrame
{
  AdditionalRouteInfo *begin;
  AdditionalRouteInfo *i;

  begin = self->_additionalRoutesToFrame.__begin_;
  for (i = self->_additionalRoutesToFrame.__end_; i != begin; *((id *)i + 1))
  {
    *((_QWORD *)i - 5) = &off_1E42B4C30;
    i = (AdditionalRouteInfo *)((char *)i - 40);
  }
  self->_additionalRoutesToFrame.__end_ = begin;
}

- (void)addRouteToFrame:(id)a3 divergenceCoord:(PolylineCoordinate)a4 convergenceCoord:(PolylineCoordinate)a5
{
  id v8;
  id v9;
  AdditionalRouteInfo *value;
  AdditionalRouteInfo *end;
  id v12;
  void *v13;
  AdditionalRouteInfo *v14;
  AdditionalRouteInfo *begin;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  AdditionalRouteInfo *v22;
  id v23;
  void *v24;
  AdditionalRouteInfo *v25;
  AdditionalRouteInfo *v26;
  void *v27;
  AdditionalRouteInfo *v28;
  id v29;

  v8 = a3;
  v29 = v8;
  if (v8)
  {
    v9 = v8;
    v8 = v29;
  }

  end = self->_additionalRoutesToFrame.__end_;
  value = self->_additionalRoutesToFrame.__end_cap_.__value_;
  if (end < value)
  {
    *(_QWORD *)end = &off_1E42B4C30;
    *((_QWORD *)end + 1) = 0;
    v12 = v29;
    v13 = (void *)*((_QWORD *)end + 1);
    *((_QWORD *)end + 1) = v12;

    *((PolylineCoordinate *)end + 3) = a4;
    *((PolylineCoordinate *)end + 4) = a5;
    v14 = (AdditionalRouteInfo *)((char *)end + 40);
    goto LABEL_21;
  }
  begin = self->_additionalRoutesToFrame.__begin_;
  v16 = 0xCCCCCCCCCCCCCCCDLL * ((end - begin) >> 3);
  if (v16 + 1 > 0x666666666666666)
    abort();
  v17 = 0xCCCCCCCCCCCCCCCDLL * ((value - begin) >> 3);
  v18 = 2 * v17;
  if (2 * v17 <= v16 + 1)
    v18 = v16 + 1;
  if (v17 >= 0x333333333333333)
    v19 = 0x666666666666666;
  else
    v19 = v18;
  if (v19)
  {
    if (v19 > 0x666666666666666)
      std::__throw_bad_array_new_length[abi:nn180100]();
    v20 = (char *)operator new(40 * v19);
  }
  else
  {
    v20 = 0;
  }
  v21 = &v20[40 * v16];
  v22 = (AdditionalRouteInfo *)&v20[40 * v19];
  *(_QWORD *)v21 = &off_1E42B4C30;
  *((_QWORD *)v21 + 1) = 0;
  v23 = v29;
  v24 = (void *)*((_QWORD *)v21 + 1);
  *((_QWORD *)v21 + 1) = v23;

  *((PolylineCoordinate *)v21 + 3) = a4;
  *((PolylineCoordinate *)v21 + 4) = a5;
  v14 = (AdditionalRouteInfo *)(v21 + 40);
  v26 = self->_additionalRoutesToFrame.__begin_;
  v25 = self->_additionalRoutesToFrame.__end_;
  if (v25 == v26)
  {
    self->_additionalRoutesToFrame.__begin_ = (AdditionalRouteInfo *)v21;
    self->_additionalRoutesToFrame.__end_ = v14;
    self->_additionalRoutesToFrame.__end_cap_.__value_ = v22;
    if (!v25)
      goto LABEL_21;
    goto LABEL_20;
  }
  do
  {
    *((_QWORD *)v21 - 5) = &off_1E42B4C30;
    v21 -= 40;
    *((_QWORD *)v21 + 1) = 0;
    objc_storeStrong((id *)v21 + 1, *((id *)v25 - 4));
    v27 = (void *)*((_QWORD *)v25 - 4);
    *((_QWORD *)v25 - 4) = 0;

    *(_OWORD *)(v21 + 24) = *((_OWORD *)v25 - 1);
    v25 = (AdditionalRouteInfo *)((char *)v25 - 40);
  }
  while (v25 != v26);
  v25 = self->_additionalRoutesToFrame.__begin_;
  v28 = self->_additionalRoutesToFrame.__end_;
  self->_additionalRoutesToFrame.__begin_ = (AdditionalRouteInfo *)v21;
  self->_additionalRoutesToFrame.__end_ = v14;
  self->_additionalRoutesToFrame.__end_cap_.__value_ = v22;
  while (v28 != v25)
  {
    *((_QWORD *)v28 - 5) = &off_1E42B4C30;
    v28 = (AdditionalRouteInfo *)((char *)v28 - 40);

  }
  if (v25)
LABEL_20:
    operator delete(v25);
LABEL_21:
  self->_additionalRoutesToFrame.__end_ = v14;

}

- (void)enumerateAdditionalRoutesToFrameUsingBlock:(id)a3
{
  AdditionalRouteInfo *begin;
  AdditionalRouteInfo *i;
  id v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    begin = self->_additionalRoutesToFrame.__begin_;
    for (i = self->_additionalRoutesToFrame.__end_; begin != i; begin = (AdditionalRouteInfo *)((char *)begin + 40))
    {
      v6 = *((id *)begin + 1);
      (*((void (**)(id, id, _QWORD, _QWORD))v7 + 2))(v7, v6, *((_QWORD *)begin + 3), *((_QWORD *)begin + 4));

    }
  }

}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (unint64_t)currentStepIndex
{
  return self->_currentStepIndex;
}

- (NSArray)groupedManeuverCounts
{
  return self->_groupedManeuverCounts;
}

- (void)setGroupedManeuverCounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (GEORouteMatch)routeMatch
{
  return self->_routeMatch;
}

- (void).cxx_destruct
{
  AdditionalRouteInfo *begin;
  AdditionalRouteInfo *end;
  AdditionalRouteInfo *v5;
  AdditionalPointInfo *v6;

  begin = self->_additionalRoutesToFrame.__begin_;
  if (begin)
  {
    end = self->_additionalRoutesToFrame.__end_;
    v5 = self->_additionalRoutesToFrame.__begin_;
    if (end != begin)
    {
      do
      {
        *((_QWORD *)end - 5) = &off_1E42B4C30;
        end = (AdditionalRouteInfo *)((char *)end - 40);

      }
      while (end != begin);
      v5 = self->_additionalRoutesToFrame.__begin_;
    }
    self->_additionalRoutesToFrame.__end_ = begin;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->_groupedManeuverCounts, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  v6 = self->_pointsToFrame.__begin_;
  if (v6)
  {
    self->_pointsToFrame.__end_ = v6;
    operator delete(v6);
  }
  objc_storeStrong((id *)&self->_routeMatch, 0);
  objc_storeStrong((id *)&self->_route, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 10) = 0;
  return self;
}

@end
