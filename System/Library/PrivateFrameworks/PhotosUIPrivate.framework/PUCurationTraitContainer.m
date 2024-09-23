@implementation PUCurationTraitContainer

- (PUCurationTraitContainer)initWithLabel:(id)a3 traitValue:(signed __int16)a4 highPrecision:(double)a5 operatingPoint:(double)a6 highRecall:(double)a7
{
  id v13;
  PUCurationTraitContainer *v14;
  PUCurationTraitContainer *v15;
  objc_super v17;

  v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PUCurationTraitContainer;
  v14 = -[PUCurationTraitContainer init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_actionLabel, a3);
    v15->_value = a4;
    v15->_highPrecisionOperatingPoint = a5;
    v15->_operatingPoint = a6;
    v15->_highRecallOperatingPoint = a7;
  }

  return v15;
}

- (NSString)actionLabel
{
  return self->_actionLabel;
}

- (signed)value
{
  return self->_value;
}

- (double)highPrecisionOperatingPoint
{
  return self->_highPrecisionOperatingPoint;
}

- (double)operatingPoint
{
  return self->_operatingPoint;
}

- (double)highRecallOperatingPoint
{
  return self->_highRecallOperatingPoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionLabel, 0);
}

@end
