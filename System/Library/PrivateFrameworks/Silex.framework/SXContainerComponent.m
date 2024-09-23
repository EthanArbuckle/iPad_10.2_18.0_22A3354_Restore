@implementation SXContainerComponent

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
    v8.super_class = (Class)&OBJC_METACLASS___SXContainerComponent;
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
    v8.super_class = (Class)&OBJC_METACLASS___SXContainerComponent;
    objc_msgSendSuper2(&v8, sel_objectValueClassBlockForPropertyWithName_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)requiresLinkedContent
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[SXContainerComponent components](self, "components", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "requiresLinkedContent") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

+ (id)typeString
{
  return CFSTR("container");
}

+ (Class)classForProtocolProperty:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "isEqualToString:", v6))
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_7;
  objc_msgSend(v7, "objectForKey:", CFSTR("type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("collection")) & 1) == 0
    && !objc_msgSend(v8, "isEqualToString:", CFSTR("horizontal_stack")))
  {

LABEL_7:
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___SXContainerComponent;
    objc_msgSendSuper2(&v11, sel_classForProtocolProperty_withValue_, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_opt_class();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return (Class)v9;
}

- (BOOL)allowAutoplacedAdsWithValue:(id)a3 withType:(int)a4
{
  id v6;
  char v7;

  v6 = a3;
  v7 = -[SXComponent role](self, "role") != 8 && -[SXComponent role](self, "role") != 37;
  if (a4 == 2)
    v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

@end
