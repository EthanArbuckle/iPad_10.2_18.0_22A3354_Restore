@implementation SXComponent

BOOL __50__SXComponent_purgeClassBlockForPropertyWithName___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  _BOOL8 v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("type"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[SXClassFactory classForBaseClass:type:](SXClassFactory, "classForBaseClass:type:", objc_opt_class(), v3);
    v4 = objc_opt_class();
    v5 = v4 == objc_opt_class();

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("behaviors"))
    || objc_msgSend(v4, "isEqualToString:", CFSTR("additions")))
  {
    +[SXClassFactory valueClassBlockForBaseClass:](SXClassFactory, "valueClassBlockForBaseClass:", objc_opt_class());
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("conditional")) & 1) != 0)
    {
      v6 = &__block_literal_global_39;
      goto LABEL_5;
    }
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___SXComponent;
    objc_msgSendSuper2(&v8, sel_valueClassBlockForPropertyWithName_, v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_5:

  return v6;
}

+ (id)purgeClassBlockForPropertyWithName:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("additions")) & 1) != 0)
  {
    v5 = &__block_literal_global_10_0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXComponent;
    objc_msgSendSuper2(&v7, sel_purgeClassBlockForPropertyWithName_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (BOOL)requiresLinkedContent
{
  return self->requiresLinkedContent;
}

uint64_t __50__SXComponent_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

+ (Class)classForProtocolProperty:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("anchor")))
  {
    objc_opt_class();
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___SXComponent;
    objc_msgSendSuper2(&v11, sel_classForProtocolProperty_withValue_, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return (Class)v9;
}

- (id)animationWithValue:(id)a3 withType:(int)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  id v12;
  void *v13;

  v6 = a3;
  -[SXComponent backingAnimation](self, "backingAnimation");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (a4 == 5 && !v7)
  {
    v9 = objc_opt_class();
    objc_msgSend(v6, "objectForKey:", CFSTR("type"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = +[SXClassFactory classForBaseClass:type:](SXClassFactory, "classForBaseClass:type:", v9, v10);

    v12 = [v11 alloc];
    -[SXJSONObject specificationVersion](self, "specificationVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v12, "initWithJSONObject:andVersion:", v6, v13);

    -[SXComponent setBackingAnimation:](self, "setBackingAnimation:", v8);
  }

  return v8;
}

- (unint64_t)contentRelevanceWithValue:(id)a3 withType:(int)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (a4 == 3)
    {
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("low")) & 1) != 0)
      {
        v8 = 1;
      }
      else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("medium")) & 1) != 0)
      {
        v8 = 0;
      }
      else if (objc_msgSend(v7, "isEqualToString:", CFSTR("high")))
      {
        v8 = 2;
      }
      else
      {
        v8 = 3;
      }
    }
    else
    {
      v8 = 3;
    }
  }
  else
  {
    -[SXComponent classification](self, "classification");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "contentRelevance");

  }
  return v8;
}

- (SXComponentClassification)classification
{
  SXComponentClassification *classification;
  void *v4;
  void *v5;
  SXComponentClassification *v6;
  SXComponentClassification *v7;

  classification = self->_classification;
  if (!classification)
  {
    -[SXJSONObject valueForLookupKey:](self, "valueForLookupKey:", CFSTR("role"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponent type](self, "type");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SXComponentClassification classificationForComponentWithType:role:](SXComponentClassification, "classificationForComponentWithType:role:", v5, v4);
    v6 = (SXComponentClassification *)objc_claimAutoreleasedReturnValue();
    v7 = self->_classification;
    self->_classification = v6;

    classification = self->_classification;
  }
  return classification;
}

- (unint64_t)traits
{
  return 0;
}

- (int)role
{
  void *v2;
  int v3;

  -[SXComponent classification](self, "classification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend((id)objc_opt_class(), "role");

  return v3;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[SXComponent identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (SXComponentAnimation)backingAnimation
{
  return self->backingAnimation;
}

- (void)setBackingAnimation:(id)a3
{
  objc_storeStrong((id *)&self->backingAnimation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classification, 0);
  objc_storeStrong((id *)&self->backingAnimation, 0);
}

@end
