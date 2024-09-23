@implementation DirectionAction

- (DirectionAction)initWithDirectionItem:(id)a3 timePoint:(id)a4 source:(unint64_t)a5
{
  id v9;
  id v10;
  DirectionAction *v11;
  DirectionAction *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DirectionAction;
  v11 = -[DirectionAction init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_directionItem, a3);
    objc_storeStrong((id *)&v12->_timePoint, a4);
    v12->_source = a5;
  }

  return v12;
}

- (NSDictionary)userInfo
{
  id v3;
  void *v4;
  GEOURLTimePoint *timePoint;
  void *v6;
  unint64_t source;
  id v8;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = v3;
  timePoint = self->_timePoint;
  if (timePoint)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", timePoint, CFSTR("GEOURLTimePoint"));
  if (self->_source == 1)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1012705A0, CFSTR("RAPAuxiliaryControlsOrigin"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("RAPAuxiliaryControlsOrigin"));

  }
  source = self->_source;
  if (source <= 2)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", (&off_1011E1C28)[source], CFSTR("DirectionsSourceKey"));
  v8 = objc_msgSend(v4, "copy");

  return (NSDictionary *)v8;
}

- (BOOL)isCompatibleWithNavigation
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionItem endMapItem](self->_directionItem, "endMapItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_detourInfo"));
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isCompatibleWithRestorationTask
{
  return 0;
}

- (int)analyticsLaunchActionType
{
  return 6;
}

- (DirectionItem)directionItem
{
  return self->_directionItem;
}

- (void)setDirectionItem:(id)a3
{
  objc_storeStrong((id *)&self->_directionItem, a3);
}

- (GEOURLTimePoint)timePoint
{
  return self->_timePoint;
}

- (void)setTimePoint:(id)a3
{
  objc_storeStrong((id *)&self->_timePoint, a3);
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timePoint, 0);
  objc_storeStrong((id *)&self->_directionItem, 0);
}

@end
