@implementation PlaceCardDragContext

- (MKMapItem)draggedMapItem
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;

  v2 = self->_content;
  v3 = objc_opt_class(PlaceCardItem);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = v2;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));
  else
    v6 = 0;

  return (MKMapItem *)v6;
}

- (id)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_storeStrong(&self->_content, a3);
}

- (int)analyticsTarget
{
  return self->_analyticsTarget;
}

- (void)setAnalyticsTarget:(int)a3
{
  self->_analyticsTarget = a3;
}

- (MapsAnalyticsHelper)analyticsHelper
{
  return self->_analyticsHelper;
}

- (void)setAnalyticsHelper:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsHelper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsHelper, 0);
  objc_storeStrong(&self->_content, 0);
}

@end
