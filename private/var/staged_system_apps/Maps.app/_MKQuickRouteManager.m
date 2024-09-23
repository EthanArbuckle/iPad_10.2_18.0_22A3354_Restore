@implementation _MKQuickRouteManager

- (void)set_Car_isVisible:(BOOL)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  objc_setAssociatedObject(self, "_Car_isVisible", v4, (void *)0x301);

}

- (BOOL)_Car_isVisible
{
  id AssociatedObject;
  void *v3;
  unsigned __int8 v4;

  AssociatedObject = objc_getAssociatedObject(self, "_Car_isVisible");
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)set_Car_refreshOperation:(id)a3
{
  id v4;
  WeakWrapper *value;

  if (a3)
  {
    v4 = a3;
    value = -[WeakWrapper initWithWeakObject:]([WeakWrapper alloc], "initWithWeakObject:", v4);

  }
  else
  {
    value = 0;
  }
  objc_setAssociatedObject(self, "_Car_refreshOperation", value, (void *)0x301);

}

- (CarQuickRouteRefreshOperation)_Car_refreshOperation
{
  id AssociatedObject;
  void *v4;
  void *v5;
  void *v6;

  AssociatedObject = objc_getAssociatedObject(self, "_Car_refreshOperation");
  v4 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "weakObject"));

  if (!v5)
    objc_setAssociatedObject(self, "_Car_refreshOperation", 0, (void *)0x301);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "weakObject"));

  return (CarQuickRouteRefreshOperation *)v6;
}

- (BOOL)_Car_isPrimaryRefreshQueue
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_MKQuickRouteManager _Car_refreshOperation](self, "_Car_refreshOperation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "operationQueue"));
  v4 = v3 == (void *)qword_1014D2028;

  return v4;
}

- (double)_Car_etaAge
{
  void *v2;
  double Current;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_MKQuickRouteManager routeETAForTransportType:](self, "routeETAForTransportType:", 1));
  if (v2)
  {
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(v2, "responseTime");
    v5 = Current - v4;
  }
  else
  {
    v5 = -1.0;
  }

  return v5;
}

- (BOOL)_Car_shouldDelayOperation
{
  double v3;
  double v4;

  if (!-[_MKQuickRouteManager _Car_isVisible](self, "_Car_isVisible"))
    return 1;
  -[_MKQuickRouteManager _Car_etaAge](self, "_Car_etaAge");
  if (v3 >= 60.0)
    return 0;
  -[_MKQuickRouteManager _Car_etaAge](self, "_Car_etaAge");
  return v4 >= 0.0;
}

- (void)_Car_queueUpdateETA
{
  unsigned int v3;
  void *v4;
  unsigned __int8 v5;
  CarQuickRouteRefreshOperation *v6;
  uint64_t v7;
  void *v8;
  CarQuickRouteRefreshOperation *v9;

  v3 = -[_MKQuickRouteManager _Car_shouldDelayOperation](self, "_Car_shouldDelayOperation");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_MKQuickRouteManager _Car_refreshOperation](self, "_Car_refreshOperation"));

  if (v4)
  {
    v5 = -[_MKQuickRouteManager _Car_isPrimaryRefreshQueue](self, "_Car_isPrimaryRefreshQueue");
    if (v3)
    {
      if ((v5 & 1) == 0)
        return;
    }
    else if ((v5 & 1) != 0)
    {
      return;
    }
    -[_MKQuickRouteManager _Car_cancelUpdateETA](self, "_Car_cancelUpdateETA");
  }
  v6 = -[CarQuickRouteRefreshOperation initWithQuickRoute:]([CarQuickRouteRefreshOperation alloc], "initWithQuickRoute:", self);
  v9 = v6;
  v7 = 8;
  if (v3)
    v7 = 16;
  -[CarQuickRouteRefreshOperation setOperationQueue:](v6, "setOperationQueue:", *(_QWORD *)&byte_1014D2020[v7]);
  -[_MKQuickRouteManager set_Car_refreshOperation:](self, "set_Car_refreshOperation:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarQuickRouteRefreshOperation operationQueue](v9, "operationQueue"));
  objc_msgSend(v8, "addOperation:", v9);

}

- (void)_Car_cancelUpdateETA
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_MKQuickRouteManager _Car_refreshOperation](self, "_Car_refreshOperation"));
  objc_msgSend(v3, "cancel");

  -[_MKQuickRouteManager set_Car_refreshOperation:](self, "set_Car_refreshOperation:", 0);
}

@end
