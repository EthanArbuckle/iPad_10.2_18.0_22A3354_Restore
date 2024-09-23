@implementation TUIImpressionAttributes

- (TUIImpressionAttributes)initWithData:(id)a3 size:(CGSize)a4 center:(CGPoint)a5 transform:(CGAffineTransform *)a6
{
  double y;
  double x;
  double height;
  double width;
  id v13;
  __int128 v14;
  TUIImpressionAttributes *v15;
  TUIImpressionAttributes *v16;
  _OWORD v18[3];
  objc_super v19;

  y = a5.y;
  x = a5.x;
  height = a4.height;
  width = a4.width;
  v13 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TUIImpressionAttributes;
  v14 = *(_OWORD *)&a6->c;
  v18[0] = *(_OWORD *)&a6->a;
  v18[1] = v14;
  v18[2] = *(_OWORD *)&a6->tx;
  v15 = -[TUIGeometryAttributes initWithSize:center:transform:](&v19, "initWithSize:center:transform:", v18, width, height, x, y);
  v16 = v15;
  if (v15)
    objc_storeStrong((id *)&v15->_data, a3);

  return v16;
}

- (TUIImpressionData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
