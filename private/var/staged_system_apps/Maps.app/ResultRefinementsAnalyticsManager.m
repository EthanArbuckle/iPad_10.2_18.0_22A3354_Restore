@implementation ResultRefinementsAnalyticsManager

- (ResultRefinementsAnalyticsManager)init
{
  return -[ResultRefinementsAnalyticsManager initWithRefinementsFromWaypointEditor:](self, "initWithRefinementsFromWaypointEditor:", 0);
}

- (ResultRefinementsAnalyticsManager)initWithRefinementsFromWaypointEditor:(BOOL)a3
{
  ResultRefinementsAnalyticsManager *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ResultRefinementsAnalyticsManager;
  result = -[ResultRefinementsAnalyticsManager init](&v5, "init");
  if (result)
    result->_isFromWaypointEditor = a3;
  return result;
}

- (void)logRefinementsEvent:(unint64_t)a3 fromSource:(unint64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a4 == 2)
  {
    v6 = 22;
  }
  else if (a4 == 1)
  {
    v6 = 23;
  }
  else if (a4)
  {
    v6 = 0;
  }
  else if (-[ResultRefinementsAnalyticsManager isFromWaypointEditor](self, "isFromWaypointEditor"))
  {
    v6 = 58;
  }
  else
  {
    v6 = 21;
  }
  switch(a3)
  {
    case 0uLL:
      if (a4 == 1)
        v7 = 186;
      else
        v7 = 205;
      break;
    case 1uLL:
      if (a4 == 1)
        v7 = 168;
      else
        v7 = 167;
      break;
    case 2uLL:
      v7 = 155;
      break;
    case 3uLL:
      v7 = 157;
      break;
    default:
      v7 = 0;
      break;
  }
  v8 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v8, "captureUserAction:onTarget:eventValue:", v7, v6, 0);

}

- (void)resultRefinementTappedWithKey:(id)a3 source:(unint64_t)a4 refinementType:(unint64_t)a5 isSelected:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v10;
  unsigned int v11;
  int v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  id v16;

  v6 = a6;
  v16 = a3;
  if (a4 == 2)
  {
    v11 = 176;
    v12 = 197;
    v10 = 22;
  }
  else if (a4 == 1)
  {
    v11 = 176;
    v12 = 197;
    v10 = 23;
  }
  else if (a4)
  {
    v10 = 0;
    v12 = 0;
    v11 = 0;
  }
  else
  {
    if (-[ResultRefinementsAnalyticsManager isFromWaypointEditor](self, "isFromWaypointEditor"))
      v10 = 58;
    else
      v10 = 21;
    v11 = 190;
    v12 = 200;
  }
  if (v6)
    v13 = 158;
  else
    v13 = 202;
  if (v6)
    v11 = v12;
  if (a5)
    v11 = 0;
  if (a5 == 1)
    v14 = v13;
  else
    v14 = v11;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v15, "captureUserAction:onTarget:eventValue:", v14, v10, v16);

}

- (BOOL)isFromWaypointEditor
{
  return self->_isFromWaypointEditor;
}

- (void)setIsFromWaypointEditor:(BOOL)a3
{
  self->_isFromWaypointEditor = a3;
}

@end
