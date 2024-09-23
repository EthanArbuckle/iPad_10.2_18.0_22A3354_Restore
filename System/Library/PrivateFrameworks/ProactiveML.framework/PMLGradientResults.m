@implementation PMLGradientResults

- (PMLGradientResults)initWithGradient:(id)a3 loss:(id)a4
{
  id v8;
  id v9;
  PMLGradientResults *v10;
  PMLGradientResults *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLGradientSolver.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gradient"));

  }
  v14.receiver = self;
  v14.super_class = (Class)PMLGradientResults;
  v10 = -[PMLGradientResults init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_gradient, a3);
    objc_storeStrong((id *)&v11->_loss, a4);
  }

  return v11;
}

- (PMLMutableDenseVector)gradient
{
  return self->_gradient;
}

- (NSNumber)loss
{
  return self->_loss;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loss, 0);
  objc_storeStrong((id *)&self->_gradient, 0);
}

@end
