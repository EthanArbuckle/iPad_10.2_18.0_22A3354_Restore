@implementation RouteUpdatingTaskResult

+ (id)resultWithRouteID:(id)a3 transitUpdate:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  objc_msgSend(v8, "setRouteID:", v7);

  objc_msgSend(v8, "setTransitUpdate:", v6);
  return v8;
}

- (NSUUID)routeID
{
  return self->_routeID;
}

- (void)setRouteID:(id)a3
{
  objc_storeStrong((id *)&self->_routeID, a3);
}

- (GEOTransitRouteUpdate)transitUpdate
{
  return self->_transitUpdate;
}

- (void)setTransitUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_transitUpdate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitUpdate, 0);
  objc_storeStrong((id *)&self->_routeID, 0);
}

@end
