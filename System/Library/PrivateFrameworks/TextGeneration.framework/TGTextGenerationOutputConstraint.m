@implementation TGTextGenerationOutputConstraint

- (id)copyWithZone:(_NSZone *)a3
{
  TGTextGenerationOutputConstraint *v4;
  void *v5;
  TGTextGenerationOutputConstraint *v6;

  v4 = objc_alloc_init(TGTextGenerationOutputConstraint);
  -[TGTextGenerationOutputConstraint maxWordCount](self, "maxWordCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TGTextGenerationOutputConstraint setMaxWordCount:](v4, "setMaxWordCount:", v5);

  v6 = self;
  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  TGMutableTextGenerationOutputConstraint *v4;
  void *v5;
  TGTextGenerationOutputConstraint *v6;

  v4 = objc_alloc_init(TGMutableTextGenerationOutputConstraint);
  -[TGTextGenerationOutputConstraint maxWordCount](self, "maxWordCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TGTextGenerationOutputConstraint setMaxWordCount:](v4, "setMaxWordCount:", v5);

  v6 = self;
  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[TGTextGenerationOutputConstraint maxWordCount](self, "maxWordCount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char isKindOfClass;
  char v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = 0;
  if (v4 && (isKindOfClass & 1) != 0)
  {
    v7 = v4;
    -[TGTextGenerationOutputConstraint maxWordCount](self, "maxWordCount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "maxWordCount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = TGTextGenerationEqualAllowingNil(v8, v9);
  }

  return v6;
}

- (NSNumber)maxWordCount
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMaxWordCount:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxWordCount, 0);
}

@end
