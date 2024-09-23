@implementation SCMLDetectionBox

- (SCMLDetectionBox)initWithScore:(float)a3 label:(id)a4 rect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  SCMLDetectionBox *v13;
  SCMLDetectionBox *v14;
  objc_super v16;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SCMLDetectionBox;
  v13 = -[SCMLDetectionBox init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_score = a3;
    objc_storeStrong((id *)&v13->_label, a4);
    v14->_rect.origin.x = x;
    v14->_rect.origin.y = y;
    v14->_rect.size.width = width;
    v14->_rect.size.height = height;
  }

  return v14;
}

- (float)score
{
  return self->_score;
}

- (NSString)label
{
  return self->_label;
}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
