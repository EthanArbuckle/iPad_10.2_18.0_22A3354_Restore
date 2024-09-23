@implementation _TUIHStackSpacer

- (CGRect)computedBoundsPrimitiveWithFlags:(unint64_t)a3
{
  double x;
  double y;
  double width;
  double height;
  objc_super v7;
  CGRect result;

  if ((a3 & 2) != 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)_TUIHStackSpacer;
    -[TUILayout computedBoundsPrimitiveWithFlags:](&v7, "computedBoundsPrimitiveWithFlags:");
  }
  else
  {
    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)specifiedWidth
{
  return *($881BB7C90C7D0DFCC1492E3DC022A30F **)&self->_specifiedWidth.value;
}

- (void)setSpecifiedWidth:(id *)a3
{
  uint64_t v3;

  *(_QWORD *)&self->_specifiedWidth.value = a3;
  *(_QWORD *)&self->_specifiedWidth.max = v3;
}

@end
