@implementation SCMLImageSanitizationSignal

- (SCMLImageSanitizationSignal)init
{
  SCMLImageSanitizationSignal *v2;
  SCMLImageSanitizationSignal *v3;
  NSNumber *score;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCMLImageSanitizationSignal;
  v2 = -[SCMLImageSanitizationSignal init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_safe = 1;
    score = v2->_score;
    v2->_score = 0;

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

- (NSNumber)score
{
  return self->_score;
}

- (void)setScore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);
}

@end
