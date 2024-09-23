@implementation ATXScoreNormalizationParameters

- (ATXScoreNormalizationParameters)initWithBufferSize:(id)a3
{
  id v5;
  ATXScoreNormalizationParameters *v6;
  ATXScoreNormalizationParameters *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXScoreNormalizationParameters;
  v6 = -[ATXScoreNormalizationParameters init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bufferSize, a3);

  return v7;
}

- (unint64_t)hash
{
  return -[NSNumber hash](self->_bufferSize, "hash");
}

- (BOOL)isEqual:(id)a3
{
  ATXScoreNormalizationParameters *v4;
  ATXScoreNormalizationParameters *v5;
  BOOL v6;

  v4 = (ATXScoreNormalizationParameters *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXScoreNormalizationParameters isEqualToATXScoreNormalizationParameters:](self, "isEqualToATXScoreNormalizationParameters:", v5);

  return v6;
}

- (BOOL)isEqualToATXScoreNormalizationParameters:(id)a3
{
  NSNumber *v4;
  NSNumber *v5;
  char v6;

  v4 = self->_bufferSize;
  v5 = v4;
  if (v4 == *((NSNumber **)a3 + 1))
    v6 = 1;
  else
    v6 = -[NSNumber isEqual:](v4, "isEqual:");

  return v6;
}

- (NSNumber)bufferSize
{
  return self->_bufferSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferSize, 0);
}

@end
