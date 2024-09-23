@implementation SXContentDisplayContainerModifier

- (SXContentDisplayContainerModifier)init
{
  SXContentDisplayContainerModifier *v2;
  uint64_t v3;
  NSMutableDictionary *containers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXContentDisplayContainerModifier;
  v2 = -[SXContentDisplayContainerModifier init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    containers = v2->_containers;
    v2->_containers = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)modifyDOM:(id)a3 context:(id)a4
{
  id v5;

  objc_msgSend(a3, "components");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SXContentDisplayContainerModifier ensureWrappingContainerComponentForComponents:parentComponent:](self, "ensureWrappingContainerComponentForComponents:parentComponent:", v5, 0);

}

- (void)ensureWrappingContainerComponentForComponents:(id)a3 parentComponent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  char **v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  SXContainerComponent *v25;
  void *v26;
  SXContainerComponent *v27;
  void *v28;
  void *v29;
  id v30;
  SXContentDisplayContainerModifier *v31;
  void *v32;
  _QWORD v33[5];
  _QWORD v34[6];

  v34[5] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = 0;
    v9 = &selRef_pageNumber;
    v30 = v7;
    v31 = self;
    while (1)
    {
      objc_msgSend(v6, "componentAtIndex:", v8, v30);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "contentDisplay");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "conformsToProtocol:", v9[341]))
        break;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        goto LABEL_8;
      -[SXContentDisplayContainerModifier containers](self, "containers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        v18 = v16;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "UUIDString");
        v18 = (id)objc_claimAutoreleasedReturnValue();

      }
      v33[0] = CFSTR("identifier");
      v33[1] = CFSTR("type");
      v34[0] = v18;
      v34[1] = CFSTR("container");
      v34[2] = CFSTR("container");
      v33[2] = CFSTR("role");
      v33[3] = CFSTR("layout");
      objc_msgSend(v10, "layout");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v34[3] = v21;
      v33[4] = CFSTR("components");
      objc_msgSend(v10, "JSONRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v22;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v34[4] = v23;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 5);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = [SXContainerComponent alloc];
      objc_msgSend(v10, "specificationVersion");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[SXJSONObject initWithJSONObject:andVersion:](v25, "initWithJSONObject:andVersion:", v24, v26);

      objc_msgSend(v6, "replaceComponentAtIndex:withComponent:", v8, v27);
      -[SXContentDisplayContainerModifier containers](v31, "containers");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKey:", v27, v29);

      self = v31;
      v7 = v30;
      v9 = &selRef_pageNumber;
LABEL_12:

      if (++v8 >= (unint64_t)objc_msgSend(v6, "count"))
        goto LABEL_13;
    }

LABEL_8:
    objc_msgSend(v10, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsForContainerComponentWithIdentifier:", v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      -[SXContentDisplayContainerModifier ensureWrappingContainerComponentForComponents:parentComponent:](self, "ensureWrappingContainerComponentForComponents:parentComponent:", v15, v10);
    goto LABEL_12;
  }
LABEL_13:

}

- (NSMutableDictionary)containers
{
  return self->_containers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containers, 0);
}

@end
