@implementation PXStoryPagedTimelineSpec

- (id)description
{
  void *v3;
  uint64_t v4;
  double regularInterpageSpacing;
  double keyInterpageSpacing;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  CGSize keyPageSize;
  CGSize regularPageSize;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  regularPageSize = self->_regularPageSize;
  keyPageSize = self->_keyPageSize;
  regularInterpageSpacing = self->_regularInterpageSpacing;
  keyInterpageSpacing = self->_keyInterpageSpacing;
  if (self->_displayOneAssetPerPage)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = v7;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; regularPageSize={%g, %g}; keyPageSize={%g, %g}; regularInterpageSpacing=%g; keyInterpageSpacing=%g; displayOneAssetPerPage=%@>"),
    v4,
    self,
    regularPageSize,
    keyPageSize,
    *(_QWORD *)&regularInterpageSpacing,
    *(_QWORD *)&keyInterpageSpacing,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CGSize)regularPageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_regularPageSize.width;
  height = self->_regularPageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setRegularPageSize:(CGSize)a3
{
  self->_regularPageSize = a3;
}

- (CGSize)keyPageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_keyPageSize.width;
  height = self->_keyPageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setKeyPageSize:(CGSize)a3
{
  self->_keyPageSize = a3;
}

- (double)regularInterpageSpacing
{
  return self->_regularInterpageSpacing;
}

- (void)setRegularInterpageSpacing:(double)a3
{
  self->_regularInterpageSpacing = a3;
}

- (double)keyInterpageSpacing
{
  return self->_keyInterpageSpacing;
}

- (void)setKeyInterpageSpacing:(double)a3
{
  self->_keyInterpageSpacing = a3;
}

- (BOOL)displayOneAssetPerPage
{
  return self->_displayOneAssetPerPage;
}

- (void)setDisplayOneAssetPerPage:(BOOL)a3
{
  self->_displayOneAssetPerPage = a3;
}

@end
