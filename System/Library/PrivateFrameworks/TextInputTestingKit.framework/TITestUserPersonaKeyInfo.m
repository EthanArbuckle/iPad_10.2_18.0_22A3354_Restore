@implementation TITestUserPersonaKeyInfo

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)TITestUserPersonaKeyInfo;
  -[TITestUserPersonaKeyInfo description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ @ {%.1f, %.1f}"), v4, *(_QWORD *)&self->_center.x, *(_QWORD *)&self->_center.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGPoint)center
{
  double x;
  double y;
  CGPoint result;

  x = self->_center.x;
  y = self->_center.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  self->_center = a3;
}

- (TIGaussianErrorGenerator)errorGenerator
{
  return self->_errorGenerator;
}

- (void)setErrorGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_errorGenerator, a3);
}

- (TIFitAffineMLLMatrixWrapper)rotationMatrix
{
  return self->_rotationMatrix;
}

- (void)setRotationMatrix:(id)a3
{
  objc_storeStrong((id *)&self->_rotationMatrix, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotationMatrix, 0);
  objc_storeStrong((id *)&self->_errorGenerator, 0);
}

@end
