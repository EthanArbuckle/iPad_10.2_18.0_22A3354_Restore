@implementation easy_engageOutput

- (easy_engageOutput)initWithEngage:(int64_t)a3 classProbability:(id)a4
{
  id v7;
  easy_engageOutput *v8;
  easy_engageOutput *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)easy_engageOutput;
  v8 = -[easy_engageOutput init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_engage = a3;
    objc_storeStrong((id *)&v8->_classProbability, a4);
  }

  return v9;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &off_100065AA0);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("engage")))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MLFeatureValue featureValueWithInt64:](MLFeatureValue, "featureValueWithInt64:", -[easy_engageOutput engage](self, "engage")));
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("classProbability")))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[easy_engageOutput classProbability](self, "classProbability"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MLFeatureValue featureValueWithDictionary:error:](MLFeatureValue, "featureValueWithDictionary:error:", v6, 0));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)engage
{
  return self->_engage;
}

- (void)setEngage:(int64_t)a3
{
  self->_engage = a3;
}

- (NSDictionary)classProbability
{
  return self->_classProbability;
}

- (void)setClassProbability:(id)a3
{
  objc_storeStrong((id *)&self->_classProbability, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classProbability, 0);
}

@end
