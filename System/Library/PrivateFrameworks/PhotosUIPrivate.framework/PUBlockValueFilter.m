@implementation PUBlockValueFilter

- (double)updatedValue:(double)a3 withTargetValue:(double)a4
{
  double (**v6)(double, double);
  double v7;

  -[PUBlockValueFilter operationBlock](self, "operationBlock");
  v6 = (double (**)(double, double))objc_claimAutoreleasedReturnValue();
  v7 = v6[2](a4, a3);

  return v7;
}

- (id)operationBlock
{
  return self->_operationBlock;
}

- (void)setOperationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_operationBlock, 0);
}

@end
