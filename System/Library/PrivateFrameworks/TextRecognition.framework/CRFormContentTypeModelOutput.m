@implementation CRFormContentTypeModelOutput

- (CRFormContentTypeModelOutput)initWithScore:(id)a3
{
  id v5;
  CRFormContentTypeModelOutput *v6;
  CRFormContentTypeModelOutput *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRFormContentTypeModelOutput;
  v6 = -[CRFormContentTypeModelOutput init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_score, a3);

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E993F8C0);
}

- (id)featureValueForName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("score")))
  {
    v4 = (void *)MEMORY[0x1E0C9E918];
    -[CRFormContentTypeModelOutput score](self, "score");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "featureValueWithMultiArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (MLMultiArray)score
{
  return self->_score;
}

- (void)setScore:(id)a3
{
  objc_storeStrong((id *)&self->_score, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);
}

@end
