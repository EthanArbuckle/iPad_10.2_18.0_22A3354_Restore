@implementation SXDocument

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("resources")))
  {
    +[SXClassFactory valueClassBlockForBaseClass:](SXClassFactory, "valueClassBlockForBaseClass:", objc_opt_class());
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("componentStyles")) & 1) != 0)
    {
      v6 = &__block_literal_global_10;
      goto LABEL_12;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("textStyles")) & 1) != 0)
    {
      v6 = &__block_literal_global_9;
      goto LABEL_12;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("componentTextStyles")) & 1) != 0)
    {
      v6 = &__block_literal_global_13;
      goto LABEL_12;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("componentLayouts")) & 1) != 0)
    {
      v6 = &__block_literal_global_17;
      goto LABEL_12;
    }
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___SXDocument;
    objc_msgSendSuper2(&v8, sel_valueClassBlockForPropertyWithName_, v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_12:

  return v6;
}

+ (id)purgeClassBlockForPropertyWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("components")))
  {
    +[SXJSONObjectComponentSupport shared](SXJSONObjectComponentSupport, "shared");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "purgeClassBlock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___SXDocument;
    objc_msgSendSuper2(&v8, sel_purgeClassBlockForPropertyWithName_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)objectValueClassBlockForPropertyWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("components")))
  {
    +[SXJSONObjectComponentSupport shared](SXJSONObjectComponentSupport, "shared");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectValueClassBlock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___SXDocument;
    objc_msgSendSuper2(&v8, sel_objectValueClassBlockForPropertyWithName_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
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
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("advertisingSettings"))
    || objc_msgSend(v6, "isEqualToString:", CFSTR("autoplacement"))
    || objc_msgSend(v6, "isEqualToString:", CFSTR("layout"))
    || objc_msgSend(v6, "isEqualToString:", CFSTR("hints")))
  {
    objc_opt_class();
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___SXDocument;
    objc_msgSendSuper2(&v11, sel_classForProtocolProperty_withValue_, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return (Class)v9;
}

uint64_t __49__SXDocument_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

uint64_t __49__SXDocument_valueClassBlockForPropertyWithName___block_invoke_4()
{
  return objc_opt_class();
}

- (SXDocument)initWithIdentifier:(id)a3 JSONObject:(id)a4 andVersion:(id)a5
{
  id v9;
  SXDocument *v10;
  SXDocument *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SXDocument;
  v10 = -[SXJSONObject initWithJSONObject:andVersion:](&v13, sel_initWithJSONObject_andVersion_, a4, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_identifier, a3);

  return v11;
}

- (SXDocument)initWithJSONObject:(id)a3 andVersion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  SXDocument *v11;

  v6 = (void *)MEMORY[0x24BDD1880];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SXDocument initWithIdentifier:JSONObject:andVersion:](self, "initWithIdentifier:JSONObject:andVersion:", v10, v8, v7);

  return v11;
}

uint64_t __49__SXDocument_valueClassBlockForPropertyWithName___block_invoke_2()
{
  return objc_opt_class();
}

uint64_t __49__SXDocument_valueClassBlockForPropertyWithName___block_invoke_3()
{
  return objc_opt_class();
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
