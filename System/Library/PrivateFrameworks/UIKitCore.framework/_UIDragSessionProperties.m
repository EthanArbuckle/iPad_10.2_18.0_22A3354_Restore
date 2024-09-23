@implementation _UIDragSessionProperties

- (_UIDragSessionProperties)init
{
  _UIDragSessionProperties *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDragSessionProperties;
  result = -[_UIDragSessionProperties init](&v3, sel_init);
  if (result)
    result->_supportsSystemDrag = 1;
  return result;
}

- (BOOL)_supportsSystemDrag
{
  return self->_supportsSystemDrag;
}

- (void)set_supportsSystemDrag:(BOOL)a3
{
  self->_supportsSystemDrag = a3;
}

- (BOOL)_rotatable
{
  return self->__rotatable;
}

- (void)set_rotatable:(BOOL)a3
{
  self->__rotatable = a3;
}

- (BOOL)_resizable
{
  return self->__resizable;
}

- (void)set_resizable:(BOOL)a3
{
  self->__resizable = a3;
}

- (CGSize)_minimumResizableSize
{
  double width;
  double height;
  CGSize result;

  width = self->__minimumResizableSize.width;
  height = self->__minimumResizableSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)set_minimumResizableSize:(CGSize)a3
{
  self->__minimumResizableSize = a3;
}

- (CGSize)_maximumResizableSize
{
  double width;
  double height;
  CGSize result;

  width = self->__maximumResizableSize.width;
  height = self->__maximumResizableSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)set_maximumResizableSize:(CGSize)a3
{
  self->__maximumResizableSize = a3;
}

- (BOOL)_wantsElasticEffects
{
  return self->__wantsElasticEffects;
}

- (void)set_wantsElasticEffects:(BOOL)a3
{
  self->__wantsElasticEffects = a3;
}

- (BOOL)_avoidsKeyboardSuppression
{
  return self->__avoidsKeyboardSuppression;
}

- (void)set_avoidsKeyboardSuppression:(BOOL)a3
{
  self->__avoidsKeyboardSuppression = a3;
}

@end
