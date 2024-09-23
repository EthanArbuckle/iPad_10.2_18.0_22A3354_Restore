@implementation _PISliderNetAdjustmentsResult

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_PISliderNetAdjustmentsResult adjustments](self, "adjustments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> adjustments=%@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSDictionary)adjustments
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAdjustments:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (float)similarityScore
{
  return self->_similarityScore;
}

- (void)setSimilarityScore:(float)a3
{
  self->_similarityScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustments, 0);
}

@end
