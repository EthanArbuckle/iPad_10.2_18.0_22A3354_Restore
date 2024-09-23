@implementation CRLConnectionLineMagnetInfo

- (CRLConnectionLineMagnetInfo)initWithType:(unint64_t)a3 position:(CGPoint)a4 layout:(id)a5 connected:(BOOL)a6
{
  CGFloat y;
  CGFloat x;
  id v12;
  CRLConnectionLineMagnetInfo *v13;
  CRLConnectionLineMagnetInfo *v14;
  objc_super v16;

  y = a4.y;
  x = a4.x;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CRLConnectionLineMagnetInfo;
  v13 = -[CRLConnectionLineMagnetInfo init](&v16, "init");
  v14 = v13;
  if (v13)
  {
    v13->mMagnetType = a3;
    v13->mPosition.x = x;
    v13->mPosition.y = y;
    objc_storeStrong((id *)&v13->mLayout, a5);
    v14->mConnected = a6;
  }

  return v14;
}

- (unint64_t)magnetType
{
  return self->mMagnetType;
}

- (void)setMagnetType:(unint64_t)a3
{
  self->mMagnetType = a3;
}

- (CGPoint)position
{
  double x;
  double y;
  CGPoint result;

  x = self->mPosition.x;
  y = self->mPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  self->mPosition = a3;
}

- (CRLCanvasLayout)layout
{
  return self->mLayout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->mLayout, a3);
}

- (BOOL)connected
{
  return self->mConnected;
}

- (void)setConnected:(BOOL)a3
{
  self->mConnected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mLayout, 0);
}

@end
