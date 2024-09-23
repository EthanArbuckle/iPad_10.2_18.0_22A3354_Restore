@implementation RCSelectionTouchTrackingInfo

- (void)setTouch:(id)a3
{
  double v4;
  id obj;

  obj = a3;
  objc_msgSend(obj, "locationInView:", 0);
  self->_lastLocation = v4;
  objc_storeWeak((id *)&self->_touch, obj);

}

- (void)updateTrackingInfo
{
  id WeakRetained;
  double v4;
  double v5;
  double lastLocation;
  int64_t v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_touch);
  objc_msgSend(WeakRetained, "locationInView:", 0);
  v5 = v4;

  lastLocation = self->_lastLocation;
  if (v5 != lastLocation)
  {
    v7 = -1;
    if (v5 > lastLocation)
      v7 = 1;
    self->_selectionAffinity = v7;
  }
  self->_lastLocation = v5;
}

- (id)description
{
  id v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RCSelectionTouchTrackingInfo;
  v3 = -[RCSelectionTouchTrackingInfo description](&v10, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (self->_selectionBarType)
    v5 = CFSTR("MAX");
  else
    v5 = CFSTR("min");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_trackingOffset));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_selectionAffinity));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ location=%@, offset=%@, affinity=%@"), v4, v5, v6, v7));

  return v8;
}

- (UITouch)touch
{
  return (UITouch *)objc_loadWeakRetained((id *)&self->_touch);
}

- (double)trackingOffset
{
  return self->_trackingOffset;
}

- (void)setTrackingOffset:(double)a3
{
  self->_trackingOffset = a3;
}

- (int64_t)selectionBarType
{
  return self->_selectionBarType;
}

- (void)setSelectionBarType:(int64_t)a3
{
  self->_selectionBarType = a3;
}

- (int64_t)selectionAffinity
{
  return self->_selectionAffinity;
}

- (void)setSelectionAffinity:(int64_t)a3
{
  self->_selectionAffinity = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_touch);
}

@end
