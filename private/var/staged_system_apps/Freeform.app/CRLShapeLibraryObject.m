@implementation CRLShapeLibraryObject

- (CRLShapeLibraryObject)initWithDictionary:(id)a3
{
  id v5;
  CRLShapeLibraryObject *v6;
  CRLShapeLibraryObject *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLShapeLibraryObject;
  v6 = -[CRLShapeLibraryObject init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dictionary, a3);

  return v7;
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibraryObject p_dictionary](self, "p_dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (id)valueForKeyPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibraryObject p_dictionary](self, "p_dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKeyPath:", v4));

  return v6;
}

- (void)i_removeObjectForKey:(id)a3
{
  id v4;
  void *v5;
  NSDictionary *v6;
  NSDictionary *dictionary;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibraryObject p_dictionary](self, "p_dictionary"));
  v6 = (NSDictionary *)objc_msgSend(v5, "mutableCopy");

  -[NSDictionary removeObjectForKey:](v6, "removeObjectForKey:", v4);
  dictionary = self->_dictionary;
  self->_dictionary = v6;

}

- (NSDictionary)p_dictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
