@implementation ODDStyleLabel

- (void)setShapeStyle:(id)a3
{
  objc_storeStrong((id *)&self->mShapeStyle, a3);
}

- (id)shapeStyle
{
  return self->mShapeStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mShapeStyle, 0);
}

@end
