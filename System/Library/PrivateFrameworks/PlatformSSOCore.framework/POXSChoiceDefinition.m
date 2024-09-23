@implementation POXSChoiceDefinition

- (POXSChoiceDefinition)init
{
  POXSChoiceDefinition *v2;
  uint64_t v3;
  NSMapTable *elements;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)POXSChoiceDefinition;
  v2 = -[POXSDefinition init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    elements = v2->_elements;
    v2->_elements = (NSMapTable *)v3;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)POXSChoiceDefinition;
  v5 = -[POXSDefinition copyWithZone:](&v9, sel_copyWithZone_);
  v6 = -[NSMapTable copyWithZone:](self->_elements, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  return v5;
}

- (id)elementForValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_elements, "objectForKey:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NSMapTable objectForKey:](self->_elements, "objectForKey:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (NSArray)elements
{
  void *v2;
  void *v3;

  -[NSMapTable objectEnumerator](self->_elements, "objectEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setName:(id)a3 namespaceURI:(id)a4 forType:(Class)a5
{
  id v8;
  id v9;
  POXSElement *v10;

  v8 = a4;
  v9 = a3;
  v10 = -[POXSElement initWithElementName:namespaceURI:type:]([POXSElement alloc], "initWithElementName:namespaceURI:type:", v9, v8, a5);

  -[NSMapTable setObject:forKey:](self->_elements, "setObject:forKey:", v10, a5);
  -[POXSDefinition setType:forName:](self, "setType:forName:", a5, v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elements, 0);
}

@end
