@implementation PXSearchZeroKeywordPersonViewModel

- (PXSearchZeroKeywordPersonViewModel)initWithRepresentedObject:(id)a3 representedPerson:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PXSearchZeroKeywordPersonViewModel *v10;
  objc_super v12;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)PXSearchZeroKeywordPersonViewModel;
  v10 = -[PXSearchZeroKeywordBaseViewModel initWithType:title:representedObject:displayInfo:](&v12, sel_initWithType_title_representedObject_displayInfo_, 0, &stru_1E5149688, v8, v9);

  if (v10)
    objc_storeStrong((id *)&v10->_person, a4);

  return v10;
}

- (id)debugDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXSearchZeroKeywordPersonViewModel;
  -[PXSearchZeroKeywordBaseViewModel debugDictionary](&v8, sel_debugDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[PXSearchZeroKeywordPersonViewModel person](self, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("person"));

  return v4;
}

- (id)title
{
  void *v2;
  void *v3;

  -[PXSearchZeroKeywordPersonViewModel person](self, "person");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PHPerson)person
{
  return self->_person;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
}

@end
