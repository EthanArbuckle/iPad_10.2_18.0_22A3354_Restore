@implementation TCDumpBinaryToXmlState

- (TCDumpBinaryToXmlState)init
{
  TCDumpBinaryToXmlState *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *mFieldNameToValueMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TCDumpBinaryToXmlState;
  v2 = -[TCDumpBinaryToXmlState init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mFieldNameToValueMap = v2->mFieldNameToValueMap;
    v2->mFieldNameToValueMap = v3;

  }
  return v2;
}

- (void)setCurrentField:(id)a3
{
  objc_storeStrong((id *)&self->mCurrentFieldName, a3);
}

- (void)cacheValueforCurrentField:(id)a3
{
  -[NSMutableDictionary setObject:forKey:](self->mFieldNameToValueMap, "setObject:forKey:", a3, self->mCurrentFieldName);
}

- (id)valueForCurrentField
{
  return (id)-[NSMutableDictionary objectForKey:](self->mFieldNameToValueMap, "objectForKey:", self->mCurrentFieldName);
}

- (id)valueForField:(id)a3
{
  -[NSMutableDictionary objectForKey:](self->mFieldNameToValueMap, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFieldNameToValueMap, 0);
  objc_storeStrong((id *)&self->mCurrentFieldName, 0);
}

@end
