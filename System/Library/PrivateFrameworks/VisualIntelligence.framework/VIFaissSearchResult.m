@implementation VIFaissSearchResult

- (VIFaissSearchResult)initWithIdentifier:(int64_t)a3 distance:(float)a4 embedding:(id)a5 residual:(id)a6
{
  id v10;
  id v11;
  VIFaissSearchResult *v12;
  VIFaissSearchResult *v13;
  uint64_t v14;
  NSArray *embedding;
  uint64_t v16;
  NSArray *residual;
  VIFaissSearchResult *v18;
  objc_super v20;

  v10 = a5;
  v11 = a6;
  v20.receiver = self;
  v20.super_class = (Class)VIFaissSearchResult;
  v12 = -[VIFaissSearchResult init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_identifier = a3;
    v12->_distance = a4;
    v14 = objc_msgSend(v10, "copy");
    embedding = v13->_embedding;
    v13->_embedding = (NSArray *)v14;

    v16 = objc_msgSend(v11, "copy");
    residual = v13->_residual;
    v13->_residual = (NSArray *)v16;

    v18 = v13;
  }

  return v13;
}

- (id)description
{
  void *v3;
  __CFString *v4;
  double v5;
  void *v6;
  __CFString *v7;
  NSArray *embedding;
  __CFString *v9;
  __CFString *v10;
  NSArray *residual;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  if (-[VIFaissSearchResult isValid](self, "isValid"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_identifier);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "description");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    *(float *)&v5 = self->_distance;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "description");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    embedding = self->_embedding;
    if (embedding)
    {
      _descriptionForFloatArray(embedding);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = CFSTR("nil");
    }
    residual = self->_residual;
    if (residual)
    {
      _descriptionForFloatArray(residual);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = CFSTR("nil");
    }
  }
  else
  {
    v4 = CFSTR("INVALID");
    v10 = CFSTR("nil");
    v9 = CFSTR("nil");
    v7 = CFSTR("INVALID");
  }
  v12 = (void *)MEMORY[0x1E0CB3940];
  v16.receiver = self;
  v16.super_class = (Class)VIFaissSearchResult;
  -[VIFaissSearchResult description](&v16, sel_description);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: {identifier: %@, distance: %@, embedding: %@, residual: %@}"), v13, v4, v7, v9, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)isValid
{
  return self->_identifier != 0x7FFFFFFFFFFFFFFFLL;
}

- (float)distance
{
  if (-[VIFaissSearchResult isValid](self, "isValid"))
    return self->_distance;
  else
    return NAN;
}

- (NSArray)embedding
{
  NSArray *embedding;

  if (-[VIFaissSearchResult isValid](self, "isValid"))
    embedding = self->_embedding;
  else
    embedding = 0;
  return embedding;
}

- (NSArray)residual
{
  NSArray *residual;

  if (-[VIFaissSearchResult isValid](self, "isValid"))
    residual = self->_residual;
  else
    residual = 0;
  return residual;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(int64_t)a3
{
  self->_identifier = a3;
}

- (void)setDistance:(float)a3
{
  self->_distance = a3;
}

- (void)setEmbedding:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setResidual:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_residual, 0);
  objc_storeStrong((id *)&self->_embedding, 0);
}

@end
