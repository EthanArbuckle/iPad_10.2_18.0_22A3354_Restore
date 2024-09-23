@implementation _UIViewFittingSizeTargetInfo

- (BOOL)isEqualToTargetInfo:(id)a3
{
  float horizontalPriority;
  double v4;
  double v5;

  if (a3 == self)
    return 1;
  horizontalPriority = self->_horizontalPriority;
  if (!a3)
  {
    if (horizontalPriority == 0.0)
    {
      v4 = 0.0;
      v5 = 0.0;
      if (self->_verticalPriority == 0.0)
        return self->_targetSize.height == v4 && self->_targetSize.width == v5;
    }
    return 0;
  }
  if (horizontalPriority != *((float *)a3 + 3) || self->_verticalPriority != *((float *)a3 + 4))
    return 0;
  v5 = *((double *)a3 + 3);
  v4 = *((double *)a3 + 4);
  return self->_targetSize.height == v4 && self->_targetSize.width == v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[_UIViewFittingSizeTargetInfo isEqualToTargetInfo:](self, "isEqualToTargetInfo:", a3);
}

- (unint64_t)hash
{
  return (unint64_t)self->_targetSize.width;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  CGFloat width;
  CGFloat height;
  double horizontalPriority;
  double verticalPriority;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self)
  {
    width = self->_targetSize.width;
    height = self->_targetSize.height;
    horizontalPriority = self->_horizontalPriority;
    verticalPriority = self->_verticalPriority;
  }
  else
  {
    horizontalPriority = 0.0;
    width = 0.0;
    height = 0.0;
    verticalPriority = 0.0;
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; targetSize = (%g, %g); horizontalPriority = %g; verticalPriority = %g >"),
               v5,
               self,
               *(_QWORD *)&width,
               *(_QWORD *)&height,
               *(_QWORD *)&horizontalPriority,
               *(_QWORD *)&verticalPriority);
}

@end
