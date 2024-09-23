@implementation ICMediaAPIURLMapping

- (ICMediaAPIURLMapping)initWithResponseDictionary:(id)a3
{
  id v4;
  ICMediaAPIURLMapping *v5;
  uint64_t v6;
  NSDictionary *responseDictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICMediaAPIURLMapping;
  v5 = -[ICMediaAPIURLMapping init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    responseDictionary = v5->_responseDictionary;
    v5->_responseDictionary = (NSDictionary *)v6;

  }
  return v5;
}

- (NSString)featureName
{
  return (NSString *)-[NSDictionary ic_stringValueForKey:](self->_responseDictionary, "ic_stringValueForKey:", CFSTR("feature"));
}

- (NSString)pattern
{
  return (NSString *)-[NSDictionary ic_stringValueForKey:](self->_responseDictionary, "ic_stringValueForKey:", CFSTR("pattern"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

@end
