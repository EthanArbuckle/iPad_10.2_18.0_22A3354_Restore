@implementation WiFiStallDetectOutput

- (WiFiStallDetectOutput)initWithStall:(int64_t)a3 stallProbability:(id)a4
{
  id v7;
  WiFiStallDetectOutput *v8;
  WiFiStallDetectOutput *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WiFiStallDetectOutput;
  v8 = -[WiFiStallDetectOutput init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_stall = a3;
    objc_storeStrong((id *)&v8->_stallProbability, a4);
  }

  return v9;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &off_1000E0410);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("stall")))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MLFeatureValue featureValueWithInt64:](MLFeatureValue, "featureValueWithInt64:", -[WiFiStallDetectOutput stall](self, "stall")));
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("stallProbability")))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiStallDetectOutput stallProbability](self, "stallProbability"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MLFeatureValue featureValueWithDictionary:error:](MLFeatureValue, "featureValueWithDictionary:error:", v6, 0));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)stall
{
  return self->_stall;
}

- (void)setStall:(int64_t)a3
{
  self->_stall = a3;
}

- (NSDictionary)stallProbability
{
  return self->_stallProbability;
}

- (void)setStallProbability:(id)a3
{
  objc_storeStrong((id *)&self->_stallProbability, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stallProbability, 0);
}

@end
