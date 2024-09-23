@implementation SCMLTextSanitizationSignal

- (SCMLTextSanitizationSignal)init
{
  SCMLTextSanitizationSignal *v2;
  SCMLTextSanitizationSignal *v3;
  NSString *label;
  NSNumber *score;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCMLTextSanitizationSignal;
  v2 = -[SCMLTextSanitizationSignal init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_safe = 1;
    label = v2->_label;
    v2->_label = 0;

    score = v3->_score;
    v3->_score = 0;

  }
  return v3;
}

- (BOOL)safe
{
  return self->_safe;
}

- (void)setSafe:(BOOL)a3
{
  self->_safe = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)score
{
  return self->_score;
}

- (void)setScore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
