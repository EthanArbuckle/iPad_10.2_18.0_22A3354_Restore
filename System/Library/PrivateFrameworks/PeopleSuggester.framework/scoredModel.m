@implementation scoredModel

- (scoredModel)initWithModelKey:(id)a3 score:(double)a4
{
  id v6;
  scoredModel *v7;
  scoredModel *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)scoredModel;
  v7 = -[scoredModel init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[scoredModel setScore:](v7, "setScore:", a4);
    -[scoredModel setModelKey:](v8, "setModelKey:", v6);
  }

  return v8;
}

- (int64_t)compare:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  int64_t v12;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  -[scoredModel score](self, "score");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "score");
  v9 = v8;

  *(float *)&v10 = v9;
  objc_msgSend(v7, "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "compare:", v11);

  return v12;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (NSString)modelKey
{
  return self->_modelKey;
}

- (void)setModelKey:(id)a3
{
  objc_storeStrong((id *)&self->_modelKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelKey, 0);
}

@end
