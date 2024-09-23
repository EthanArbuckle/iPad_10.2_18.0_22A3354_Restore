@implementation _PIParallaxColorAnalysisResult

- (NSString)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_PIParallaxColorAnalysisResult medianLuminance](self, "medianLuminance");
  v6 = v5;
  -[_PIParallaxColorAnalysisResult dominantColors](self, "dominantColors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; lum = %.3f colors = %@>"), v4, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (double)medianLuminance
{
  return self->_medianLuminance;
}

- (void)setMedianLuminance:(double)a3
{
  self->_medianLuminance = a3;
}

- (NSArray)dominantColors
{
  return self->_dominantColors;
}

- (void)setDominantColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dominantColors, 0);
}

@end
