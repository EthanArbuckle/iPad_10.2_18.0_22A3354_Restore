@implementation SCMLTextModerationLMPrediction

- (SCMLTextModerationLMPrediction)initWithNameP1:(id)a3 safe:(BOOL)a4 probability:(float)a5
{
  id v9;
  SCMLTextModerationLMPrediction *v10;
  SCMLTextModerationLMPrediction *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SCMLTextModerationLMPrediction;
  v10 = -[SCMLTextModerationLMPrediction init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_nameP1, a3);
    v11->_safe = a4;
    v11->_probability = a5;
  }

  return v11;
}

- (NSString)nameP1
{
  return self->_nameP1;
}

- (void)setNameP1:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)safe
{
  return self->_safe;
}

- (void)setSafe:(BOOL)a3
{
  self->_safe = a3;
}

- (float)probability
{
  return self->_probability;
}

- (void)setProbability:(float)a3
{
  self->_probability = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameP1, 0);
}

@end
