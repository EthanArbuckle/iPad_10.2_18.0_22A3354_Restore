@implementation MNTrafficIncidentAlert

- (NSString)primaryString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert alertTitles](self, "alertTitles"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  return (NSString *)v3;
}

- (NSString)secondaryString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert alertDescriptions](self, "alertDescriptions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  return (NSString *)v3;
}

- (id)alternateRouteToDisplay
{
  char *v3;
  void *v4;

  v3 = (char *)-[MNTrafficIncidentAlert alertType](self, "alertType");
  if ((unint64_t)(v3 - 3) >= 2)
  {
    if (v3 == (char *)1)
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert originalRoute](self, "originalRoute"));
    else
      v4 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert alternateRoute](self, "alternateRoute"));
  }
  return v4;
}

@end
