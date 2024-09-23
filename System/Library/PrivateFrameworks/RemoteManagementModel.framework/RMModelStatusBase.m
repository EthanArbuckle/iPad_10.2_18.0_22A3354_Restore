@implementation RMModelStatusBase

+ (NSString)statusItemType
{
  return (NSString *)&stru_25160BAF0;
}

- (BOOL)isArrayValue
{
  return 0;
}

+ (id)stubObjectForStatusItemType:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (+[RMModelClasses classForStatusItemType:](RMModelClasses, "classForStatusItemType:", v3))
  {
    v4 = objc_opt_new();
  }
  else
  {
    +[RMModelStatusDynamic buildWithStatusItemType:](RMModelStatusDynamic, "buildWithStatusItemType:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

+ (BOOL)isSupportedStatusItem:(id)a3 platform:(int64_t)a4 scope:(int64_t)a5
{
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v7 = a3;
  v8 = +[RMModelClasses classForStatusItemType:](RMModelClasses, "classForStatusItemType:", v7);
  if (v8)
  {
    if ((-[objc_class isSupportedForPlatform:scope:](v8, "isSupportedForPlatform:scope:", a4, a5) & 1) == 0)
      goto LABEL_9;
  }
  else
  {
    +[RMModelStatusSchema schemas](RMModelStatusSchema, "schemas");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10 || (objc_msgSend(v10, "isSupportedForPlatform:scope:", a4, a5) & 1) == 0)
    {

LABEL_9:
      v11 = 0;
      goto LABEL_10;
    }

  }
  v11 = 1;
LABEL_10:

  return v11;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  return 1;
}

- (id)serializeWithType:(signed __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v5 = (void *)objc_opt_new();
  -[RMModelStatusBase serializePayloadWithType:](self, "serializePayloadWithType:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
    objc_msgSend(v5, "addEntriesFromDictionary:", v6);
  v7 = (void *)objc_msgSend(v5, "copy");

  return v7;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  return (id)MEMORY[0x24BDBD1B8];
}

@end
