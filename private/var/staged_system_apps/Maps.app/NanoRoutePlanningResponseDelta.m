@implementation NanoRoutePlanningResponseDelta

+ (id)everythingChanged
{
  id v2;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "setRoutesChanged:", 1);
  objc_msgSend(v2, "setSelectedRouteChanged:", 1);
  objc_msgSend(v2, "setRouteRevisionsChanged:", 1);
  objc_msgSend(v2, "setSelectedRideIndexesChanged:", 1);
  return v2;
}

- (id)description
{
  id v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  const __CFString *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NanoRoutePlanningResponseDelta;
  v3 = -[NanoRoutePlanningResponseDelta description](&v14, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (-[NanoRoutePlanningResponseDelta routesChanged](self, "routesChanged"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v6 = v5;
  if (-[NanoRoutePlanningResponseDelta selectedRouteChanged](self, "selectedRouteChanged"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = v7;
  if (-[NanoRoutePlanningResponseDelta routeRevisionsChanged](self, "routeRevisionsChanged"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v10 = v9;
  if (-[NanoRoutePlanningResponseDelta selectedRideIndexesChanged](self, "selectedRideIndexesChanged"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ <routesChanged: %@, selectedRouteChanged: %@, routeRevisionsChanged: %@, selectedRideIndexesChanged: %@>"), v4, v6, v8, v10, v11));

  return v12;
}

- (BOOL)routesChanged
{
  return self->_routesChanged;
}

- (void)setRoutesChanged:(BOOL)a3
{
  self->_routesChanged = a3;
}

- (BOOL)selectedRouteChanged
{
  return self->_selectedRouteChanged;
}

- (void)setSelectedRouteChanged:(BOOL)a3
{
  self->_selectedRouteChanged = a3;
}

- (BOOL)routeRevisionsChanged
{
  return self->_routeRevisionsChanged;
}

- (void)setRouteRevisionsChanged:(BOOL)a3
{
  self->_routeRevisionsChanged = a3;
}

- (BOOL)selectedRideIndexesChanged
{
  return self->_selectedRideIndexesChanged;
}

- (void)setSelectedRideIndexesChanged:(BOOL)a3
{
  self->_selectedRideIndexesChanged = a3;
}

- (NSArray)identifiersForChangedRoutes
{
  return self->_identifiersForChangedRoutes;
}

- (void)setIdentifiersForChangedRoutes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersForChangedRoutes, 0);
}

@end
