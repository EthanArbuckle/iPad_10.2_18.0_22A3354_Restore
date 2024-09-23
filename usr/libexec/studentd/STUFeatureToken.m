@implementation STUFeatureToken

- (STUFeatureToken)init
{
  return -[STUFeatureToken initWithSessionToken:feature:](self, "initWithSessionToken:feature:", 0, 0);
}

- (STUFeatureToken)initWithSessionToken:(id)a3 feature:(id)a4
{
  id v8;
  id v9;
  void *v10;
  STUFeatureToken *v11;
  STUFeatureToken *v12;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUFeatureToken.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sessionToken"));

    if (v10)
      goto LABEL_3;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUFeatureToken.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("feature"));

LABEL_3:
  if (objc_msgSend(v10, "containsString:", CFSTR("-")))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUFeatureToken.m"), 29, CFSTR("Feature should not contain the character '-'"));

  }
  v17.receiver = self;
  v17.super_class = (Class)STUFeatureToken;
  v11 = -[STUFeatureToken init](&v17, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sessionToken, a3);
    objc_storeStrong((id *)&v12->_feature, a4);
  }

  return v12;
}

- (STUFeatureToken)initWithString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  STUFeatureToken *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("-")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
  v7 = objc_msgSend(v4, "length");
  v8 = (uint64_t)v7 + ~(unint64_t)objc_msgSend(v6, "length");
  if (v8 < 0)
    v9 = 0;
  else
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringToIndex:", v8));
  v10 = -[STUFeatureToken initWithSessionToken:feature:](self, "initWithSessionToken:feature:", v9, v6);

  return v10;
}

- (NSString)stringValue
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUFeatureToken sessionToken](self, "sessionToken"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUFeatureToken feature](self, "feature"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("-%@"), v4));

  return (NSString *)v5;
}

- (NSString)sessionToken
{
  return self->_sessionToken;
}

- (void)setSessionToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)feature
{
  return self->_feature;
}

- (void)setFeature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setStringValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_feature, 0);
  objc_storeStrong((id *)&self->_sessionToken, 0);
}

@end
