@implementation _UIViewerRelativeDevicePose

- (UIOffset)viewerOffset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_viewerOffset.horizontal;
  vertical = self->_viewerOffset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (void)_setAcceleration:(CGPoint)a3 fixingOutputForViewerOffset:(UIOffset)a4
{
  double vertical;
  double horizontal;
  double y;
  double x;
  id v8;

  vertical = a4.vertical;
  horizontal = a4.horizontal;
  y = a3.y;
  x = a3.x;
  -[_UIViewerRelativeDevicePose _acceleratedOutputRange](self, "_acceleratedOutputRange");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAcceleration:fixingOutputForViewerOffset:", x, y, horizontal, vertical);

}

- (UIOffset)_acceleratedOutputForViewerOffset:(UIOffset)a3 accelerationBoostFactor:(CGPoint)a4
{
  double y;
  double x;
  double vertical;
  double horizontal;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIOffset result;

  y = a4.y;
  x = a4.x;
  vertical = a3.vertical;
  horizontal = a3.horizontal;
  -[_UIViewerRelativeDevicePose _acceleratedOutputRange](self, "_acceleratedOutputRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "acceleratedOutputForViewerOffset:accelerationBoostFactor:", horizontal, vertical, x, y);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.vertical = v14;
  result.horizontal = v13;
  return result;
}

- (id)_acceleratedOutputRange
{
  _UIMotionEffectAcceleratedOutputRange *acceleratedOutputRange;
  _UIMotionEffectAcceleratedOutputRange *v4;
  _UIMotionEffectAcceleratedOutputRange *v5;

  acceleratedOutputRange = self->_acceleratedOutputRange;
  if (!acceleratedOutputRange)
  {
    v4 = objc_alloc_init(_UIMotionEffectAcceleratedOutputRange);
    v5 = self->_acceleratedOutputRange;
    self->_acceleratedOutputRange = v4;

    acceleratedOutputRange = self->_acceleratedOutputRange;
  }
  return acceleratedOutputRange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceleratedOutputRange, 0);
}

- (void)_reset
{
  id v3;

  -[_UIViewerRelativeDevicePose setViewerOffset:](self, "setViewerOffset:", 0.0, 0.0);
  -[_UIViewerRelativeDevicePose _acceleratedOutputRange](self, "_acceleratedOutputRange");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reset");

}

- (void)setViewerOffset:(UIOffset)a3
{
  self->_viewerOffset = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double *v5;
  double *v6;
  BOOL v7;
  _UIMotionEffectAcceleratedOutputRange *acceleratedOutputRange;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (double *)v4;
    v6 = v5;
    v7 = self->_viewerOffset.horizontal == v5[3] && self->_viewerOffset.vertical == v5[4];
    if (v7 && self->_planarRotationAngle == v5[2])
    {
      acceleratedOutputRange = self->_acceleratedOutputRange;
      if ((unint64_t)acceleratedOutputRange | *((_QWORD *)v6 + 1))
        v9 = -[_UIMotionEffectAcceleratedOutputRange isEqual:](acceleratedOutputRange, "isEqual:");
      else
        v9 = 1;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = (unint64_t)(floor(self->_planarRotationAngle * 100.0)
                        + (double)(31
                                 * (unint64_t)(floor(self->_viewerOffset.vertical * 100.0)
                                                    + (double)(31
                                                             * (unint64_t)(floor(self->_viewerOffset.horizontal* 100.0)+ 31.0)))));
  return -[_UIMotionEffectAcceleratedOutputRange hash](self->_acceleratedOutputRange, "hash") - v2 + 32 * v2;
}

- (_UIViewerRelativeDevicePose)initWithCoder:(id)a3
{
  id v4;
  _UIViewerRelativeDevicePose *v5;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  float v9;
  uint64_t v10;
  _UIMotionEffectAcceleratedOutputRange *acceleratedOutputRange;
  _UIViewerRelativeDevicePose *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UIViewerRelativeDevicePose;
  v5 = -[_UIViewerRelativeDevicePose init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIViewerOffset"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UIOffsetValue");
    v5->_viewerOffset.horizontal = v7;
    v5->_viewerOffset.vertical = v8;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("UIPlanarRotationAngle"));
    v5->_planarRotationAngle = v9;
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIAcceleratedOutputRange"));
    v10 = objc_claimAutoreleasedReturnValue();
    acceleratedOutputRange = v5->_acceleratedOutputRange;
    v5->_acceleratedOutputRange = (_UIMotionEffectAcceleratedOutputRange *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  double planarRotationAngle;
  UIOffset viewerOffset;

  v4 = (void *)MEMORY[0x1E0CB3B18];
  viewerOffset = self->_viewerOffset;
  v5 = a3;
  objc_msgSend(v4, "valueWithBytes:objCType:", &viewerOffset, "{UIOffset=dd}");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("UIViewerOffset"), viewerOffset);

  planarRotationAngle = self->_planarRotationAngle;
  *(float *)&planarRotationAngle = planarRotationAngle;
  objc_msgSend(v5, "encodeFloat:forKey:", CFSTR("UIPlanarRotationAngle"), planarRotationAngle);
  objc_msgSend(v5, "encodeObject:forKey:", self->_acceleratedOutputRange, CFSTR("UIAcceleratedOutputRange"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _UIViewerRelativeDevicePose *v4;
  uint64_t v5;
  _UIMotionEffectAcceleratedOutputRange *acceleratedOutputRange;

  v4 = objc_alloc_init(_UIViewerRelativeDevicePose);
  v4->_viewerOffset = self->_viewerOffset;
  v4->_planarRotationAngle = self->_planarRotationAngle;
  v5 = -[_UIMotionEffectAcceleratedOutputRange copy](self->_acceleratedOutputRange, "copy");
  acceleratedOutputRange = v4->_acceleratedOutputRange;
  v4->_acceleratedOutputRange = (_UIMotionEffectAcceleratedOutputRange *)v5;

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromUIOffset(self->_viewerOffset);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p offset=%@ angle=%f>"), v5, self, v6, *(_QWORD *)&self->_planarRotationAngle);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)planarRotationAngle
{
  return self->_planarRotationAngle;
}

- (void)setPlanarRotationAngle:(double)a3
{
  self->_planarRotationAngle = a3;
}

@end
