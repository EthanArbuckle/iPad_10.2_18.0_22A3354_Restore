@implementation _UITouchForceMessage

+ (id)observe:(id)a3
{
  void (**v3)(id, _UITouchForceMessage *);
  _UITouchForceMessage *v4;

  v3 = (void (**)(id, _UITouchForceMessage *))a3;
  v4 = objc_alloc_init(_UITouchForceMessage);
  v3[2](v3, v4);

  return v4;
}

+ (id)reset
{
  _UITouchForceMessage *v2;

  v2 = objc_alloc_init(_UITouchForceMessage);
  v2->_isReset = 1;
  return v2;
}

- (void)ifObservation:(id)a3 ifReset:(id)a4
{
  id v6;
  void *v7;
  _UITouchForceObservationMessageReader *observeReader;
  _UITouchForceObservationMessageReader *v9;
  _UITouchForceObservationMessageReader *v10;
  void (**v11)(id, _UITouchForceObservationMessageReader *);

  v11 = (void (**)(id, _UITouchForceObservationMessageReader *))a3;
  v6 = a4;
  v7 = v6;
  if (v6 && self->_isReset)
  {
    (*((void (**)(id))v6 + 2))(v6);
  }
  else if (v11)
  {
    observeReader = self->_observeReader;
    if (!observeReader)
    {
      v9 = objc_alloc_init(_UITouchForceObservationMessageReader);
      v10 = self->_observeReader;
      self->_observeReader = v9;

      observeReader = self->_observeReader;
    }
    -[_UITouchForceObservationMessageReader setTouchForce:](observeReader, "setTouchForce:", fmin(self->_unclampedTouchForce, self->_maximumPossibleForce));
    -[_UITouchForceObservationMessageReader setTimestamp:](self->_observeReader, "setTimestamp:", self->_timestamp);
    -[_UITouchForceObservationMessageReader setCentroid:](self->_observeReader, "setCentroid:", self->_centroid.x, self->_centroid.y);
    -[_UITouchForceObservationMessageReader setShouldFilterDueToSystemGestures:](self->_observeReader, "setShouldFilterDueToSystemGestures:", self->_shouldFilterDueToSystemGestures);
    v11[2](v11, self->_observeReader);
  }

}

- (void)ifObservationUnclamped:(id)a3 ifReset:(id)a4
{
  id v6;
  void *v7;
  _UITouchForceObservationMessageReader *observeReader;
  _UITouchForceObservationMessageReader *v9;
  _UITouchForceObservationMessageReader *v10;
  void (**v11)(id, _UITouchForceObservationMessageReader *);

  v11 = (void (**)(id, _UITouchForceObservationMessageReader *))a3;
  v6 = a4;
  v7 = v6;
  if (v6 && self->_isReset)
  {
    (*((void (**)(id))v6 + 2))(v6);
  }
  else if (v11)
  {
    observeReader = self->_observeReader;
    if (!observeReader)
    {
      v9 = objc_alloc_init(_UITouchForceObservationMessageReader);
      v10 = self->_observeReader;
      self->_observeReader = v9;

      observeReader = self->_observeReader;
    }
    -[_UITouchForceObservationMessageReader setTouchForce:](observeReader, "setTouchForce:", self->_unclampedTouchForce);
    -[_UITouchForceObservationMessageReader setTimestamp:](self->_observeReader, "setTimestamp:", self->_timestamp);
    -[_UITouchForceObservationMessageReader setCentroid:](self->_observeReader, "setCentroid:", self->_centroid.x, self->_centroid.y);
    -[_UITouchForceObservationMessageReader setShouldFilterDueToSystemGestures:](self->_observeReader, "setShouldFilterDueToSystemGestures:", self->_shouldFilterDueToSystemGestures);
    v11[2](v11, self->_observeReader);
  }

}

- (double)unclampedTouchForce
{
  return self->_unclampedTouchForce;
}

- (void)setUnclampedTouchForce:(double)a3
{
  self->_unclampedTouchForce = a3;
}

- (double)maximumPossibleForce
{
  return self->_maximumPossibleForce;
}

- (void)setMaximumPossibleForce:(double)a3
{
  self->_maximumPossibleForce = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (CGPoint)centroid
{
  double x;
  double y;
  CGPoint result;

  x = self->_centroid.x;
  y = self->_centroid.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCentroid:(CGPoint)a3
{
  self->_centroid = a3;
}

- (BOOL)shouldFilterDueToSystemGestures
{
  return self->_shouldFilterDueToSystemGestures;
}

- (void)setShouldFilterDueToSystemGestures:(BOOL)a3
{
  self->_shouldFilterDueToSystemGestures = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observeReader, 0);
}

@end
