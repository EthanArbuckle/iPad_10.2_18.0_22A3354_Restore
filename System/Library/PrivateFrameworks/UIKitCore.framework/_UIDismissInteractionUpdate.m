@implementation _UIDismissInteractionUpdate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  _BYTE v6[48];

  v4 = a3;
  -[_UIDismissInteractionUpdate originalTrackingViewPosition](self, "originalTrackingViewPosition");
  objc_msgSend(v4, "encodeCGPoint:forKey:", CFSTR("originalTrackingViewPosition"));
  -[_UIDismissInteractionUpdate translation](self, "translation");
  objc_msgSend(v4, "encodeCGAffineTransform:forKey:", v6, CFSTR("translation"));
  -[_UIDismissInteractionUpdate transform](self, "transform");
  objc_msgSend(v4, "encodeCGAffineTransform:forKey:", &v5, CFSTR("transform"));
  -[_UIDismissInteractionUpdate scale](self, "scale");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("scale"));
  -[_UIDismissInteractionUpdate progressToMinScale](self, "progressToMinScale");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("progressToMinScale"));
  -[_UIDismissInteractionUpdate dampingRatio](self, "dampingRatio");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("dampingRatio"));
  -[_UIDismissInteractionUpdate response](self, "response");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("response"));
  objc_msgSend(v4, "encodeBool:forKey:", -[_UIDismissInteractionUpdate isTracking](self, "isTracking"), CFSTR("isTracking"));
  objc_msgSend(v4, "encodeBool:forKey:", -[_UIDismissInteractionUpdate wantsHeightClamping](self, "wantsHeightClamping"), CFSTR("wantsHeightClamping"));

}

- (_UIDismissInteractionUpdate)initWithCoder:(id)a3
{
  id v4;
  _UIDismissInteractionUpdate *v5;
  _OWORD v7[3];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UIDismissInteractionUpdate;
  v5 = -[_UIDismissInteractionUpdate init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("originalTrackingViewPosition"));
    -[_UIDismissInteractionUpdate setOriginalTrackingViewPosition:](v5, "setOriginalTrackingViewPosition:");
    if (v4)
    {
      objc_msgSend(v4, "decodeCGAffineTransformForKey:", CFSTR("translation"));
      v11 = v14;
      v12 = v15;
      v13 = v16;
      -[_UIDismissInteractionUpdate setTranslation:](v5, "setTranslation:", &v11);
      objc_msgSend(v4, "decodeCGAffineTransformForKey:", CFSTR("transform"));
    }
    else
    {
      v15 = 0u;
      v16 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v13 = 0u;
      -[_UIDismissInteractionUpdate setTranslation:](v5, "setTranslation:", &v11);
      v9 = 0u;
      v10 = 0u;
      v8 = 0u;
    }
    v7[0] = v8;
    v7[1] = v9;
    v7[2] = v10;
    -[_UIDismissInteractionUpdate setTransform:](v5, "setTransform:", v7);
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("scale"));
    -[_UIDismissInteractionUpdate setScale:](v5, "setScale:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("progressToMinScale"));
    -[_UIDismissInteractionUpdate setProgressToMinScale:](v5, "setProgressToMinScale:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("dampingRatio"));
    -[_UIDismissInteractionUpdate setDampingRatio:](v5, "setDampingRatio:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("response"));
    -[_UIDismissInteractionUpdate setResponse:](v5, "setResponse:");
    -[_UIDismissInteractionUpdate setIsTracking:](v5, "setIsTracking:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isTracking")));
    -[_UIDismissInteractionUpdate setWantsHeightClamping:](v5, "setWantsHeightClamping:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wantsHeightClamping")));
  }

  return v5;
}

- (CGPoint)originalTrackingViewPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_originalTrackingViewPosition.x;
  y = self->_originalTrackingViewPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOriginalTrackingViewPosition:(CGPoint)a3
{
  self->_originalTrackingViewPosition = a3;
}

- (CGAffineTransform)translation
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].a;
  return self;
}

- (void)setTranslation:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_translation.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_translation.tx = v4;
  *(_OWORD *)&self->_translation.a = v3;
}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[3].a;
  return self;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tx = v4;
  *(_OWORD *)&self->_transform.a = v3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (double)progressToMinScale
{
  return self->_progressToMinScale;
}

- (void)setProgressToMinScale:(double)a3
{
  self->_progressToMinScale = a3;
}

- (double)dampingRatio
{
  return self->_dampingRatio;
}

- (void)setDampingRatio:(double)a3
{
  self->_dampingRatio = a3;
}

- (double)response
{
  return self->_response;
}

- (void)setResponse:(double)a3
{
  self->_response = a3;
}

- (BOOL)isTracking
{
  return self->_isTracking;
}

- (void)setIsTracking:(BOOL)a3
{
  self->_isTracking = a3;
}

- (BOOL)wantsHeightClamping
{
  return self->_wantsHeightClamping;
}

- (void)setWantsHeightClamping:(BOOL)a3
{
  self->_wantsHeightClamping = a3;
}

@end
