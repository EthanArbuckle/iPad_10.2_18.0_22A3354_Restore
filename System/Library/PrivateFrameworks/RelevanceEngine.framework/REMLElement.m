@implementation REMLElement

- (REMLElement)initWithIdentifier:(id)a3 featureMap:(id)a4
{
  id v7;
  id v8;
  REMLElement *v9;
  REMLElement *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMLElement;
  v9 = -[REMLElement init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_featureMap, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_identifier, "hash");
  return -[REFeatureMap hash](self->_featureMap, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  REMLElement *v4;
  REMLElement *v5;
  NSString *identifier;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  int v10;
  char v11;
  REFeatureMap *featureMap;
  REFeatureMap *v13;
  REFeatureMap *v14;
  REFeatureMap *v15;

  v4 = (REMLElement *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      identifier = self->_identifier;
      v7 = v5->_identifier;
      if (identifier == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = identifier;
        v10 = -[NSString isEqual:](v9, "isEqual:", v8);

        if (!v10)
        {
          v11 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      featureMap = self->_featureMap;
      v13 = v5->_featureMap;
      v14 = featureMap;
      v15 = v14;
      if (v14 == v13)
        v11 = 1;
      else
        v11 = -[REFeatureMap isEqual:](v14, "isEqual:", v13);

      goto LABEL_13;
    }
    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  NSString *identifier;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  identifier = self->_identifier;
  v6 = (void *)-[REFeatureMap copy](self->_featureMap, "copy");
  v7 = (void *)objc_msgSend(v4, "initWithIdentifier:featureMap:", identifier, v6);

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (REFeatureMap)featureMap
{
  return self->_featureMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureMap, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
