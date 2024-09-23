@implementation PersonalizedItemClientFeatureIDAdornment

+ (id)defaultAdornment
{
  return objc_msgSend(a1, "adornmentWithClientFeatureID:", 0);
}

+ (PersonalizedItemClientFeatureIDAdornment)adornmentWithClientFeatureID:(unint64_t)a3
{
  return (PersonalizedItemClientFeatureIDAdornment *)objc_msgSend(objc_alloc((Class)a1), "initWithClientFeatureID:", a3);
}

- (PersonalizedItemClientFeatureIDAdornment)initWithClientFeatureID:(unint64_t)a3
{
  PersonalizedItemClientFeatureIDAdornment *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PersonalizedItemClientFeatureIDAdornment;
  result = -[PersonalizedItemClientFeatureIDAdornment init](&v5, "init");
  if (result)
    result->_clientFeatureID = a3;
  return result;
}

- (id)combineAdornment:(id)a3
{
  id v4;
  unint64_t clientFeatureID;
  uint64_t v6;
  unint64_t v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (objc_msgSend(v4, "clientFeatureID"))
  {
    clientFeatureID = self->_clientFeatureID;
    v6 = objc_opt_class(self);
    if (clientFeatureID)
    {
      v7 = self->_clientFeatureID;
      v8 = (id)((unint64_t)objc_msgSend(v4, "clientFeatureID") ^ v7);
    }
    else
    {
      v8 = objc_msgSend(v4, "clientFeatureID");
    }
    v9 = (void *)v6;
  }
  else
  {
    v9 = (void *)objc_opt_class(self);
    v8 = (id)self->_clientFeatureID;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "adornmentWithClientFeatureID:", v8));

  return v10;
}

- (unint64_t)clientFeatureID
{
  return self->_clientFeatureID;
}

@end
