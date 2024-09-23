@implementation _PISliderNetLiftResult

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_PISliderNetLiftResult styleFeatureVectorData](self, "styleFeatureVectorData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> data=%@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSData)styleFeatureVectorData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStyleFeatureVectorData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSData)contentFeatureVectorData
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContentFeatureVectorData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentFeatureVectorData, 0);
  objc_storeStrong((id *)&self->_styleFeatureVectorData, 0);
}

@end
