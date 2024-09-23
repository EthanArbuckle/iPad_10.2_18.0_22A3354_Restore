@implementation FindMyAction

- (FindMyAction)initWithFindMyHandleIdentifier:(id)a3 coordinate:(id)a4
{
  double var1;
  double var0;
  id v7;
  FindMyAction *v8;
  NSString *v9;
  NSString *findMyHandleIdentifier;
  objc_super v12;

  var1 = a4.var1;
  var0 = a4.var0;
  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FindMyAction;
  v8 = -[FindMyAction init](&v12, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v7, "copy");
    findMyHandleIdentifier = v8->_findMyHandleIdentifier;
    v8->_findMyHandleIdentifier = v9;

    v8->_coordinate.latitude = var0;
    v8->_coordinate.longitude = var1;
  }

  return v8;
}

- (BOOL)isCompatibleWithNavigation
{
  if ((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(self, a2) & 1) != 0
    || (MapsFeature_IsEnabled_Maps420() & 1) != 0)
  {
    return 1;
  }
  else
  {
    return MapsFeature_IsEnabled_Maps182();
  }
}

- (BOOL)isCompatibleWithRestorationTask
{
  return 0;
}

- (int)analyticsLaunchActionType
{
  return 0;
}

- (NSString)findMyHandleIdentifier
{
  return self->_findMyHandleIdentifier;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double latitude;
  double longitude;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_findMyHandleIdentifier, 0);
}

@end
