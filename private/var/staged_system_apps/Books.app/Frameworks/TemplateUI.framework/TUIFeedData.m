@implementation TUIFeedData

+ (id)feedDataWithDictionary:(id)a3
{
  id v3;
  TUIFeedData *v4;

  v3 = a3;
  v4 = -[TUIFeedData initWithDictionary:]([TUIFeedData alloc], "initWithDictionary:", v3);

  return v4;
}

- (TUIFeedData)initWithDictionary:(id)a3
{
  id v4;
  TUIFeedData *v5;
  NSDictionary *v6;
  NSDictionary *dictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIFeedData;
  v5 = -[TUIFeedData init](&v9, "init");
  if (v5)
  {
    v6 = (NSDictionary *)objc_msgSend(v4, "copy");
    dictionary = v5->_dictionary;
    v5->_dictionary = v6;

  }
  return v5;
}

- (id)dataForKey:(id)a3
{
  return -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", a3);
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
