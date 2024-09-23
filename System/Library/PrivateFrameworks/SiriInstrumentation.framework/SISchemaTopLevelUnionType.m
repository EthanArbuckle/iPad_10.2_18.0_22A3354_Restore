@implementation SISchemaTopLevelUnionType

- (id)wrapAsAnyEvent
{
  uint64_t v3;
  uint64_t v4;
  SISchemaAnyEvent *v5;
  void *v6;
  SISchemaAnyEvent *v7;
  SISchemaProvisionalEvent *v8;
  void *v9;
  void *v10;
  SISchemaAnyEvent *v11;

  v3 = -[SISchemaTopLevelUnionType getAnyEventType](self, "getAnyEventType");
  if ((_DWORD)v3)
  {
    v4 = v3;
    v5 = [SISchemaAnyEvent alloc];
    -[SISchemaTopLevelUnionType data](self, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SISchemaAnyEvent initWithAnyEventType:payload:](v5, "initWithAnyEventType:payload:", v4, v6);

    if (-[SISchemaTopLevelUnionType isProvisional](self, "isProvisional"))
    {
      v8 = objc_alloc_init(SISchemaProvisionalEvent);
      -[SISchemaTopLevelUnionType getTypeId](self, "getTypeId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SISchemaProvisionalEvent setTypeId:](v8, "setTypeId:", v9);

      -[SISchemaTopLevelUnionType getVersion](self, "getVersion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SISchemaProvisionalEvent setVersion:](v8, "setVersion:", objc_msgSend(v10, "integerValue"));

      -[SISchemaProvisionalEvent setAnyEvent:](v8, "setAnyEvent:", v7);
      -[SISchemaTopLevelUnionType wrapAsAnyEvent](v8, "wrapAsAnyEvent");
      v11 = (SISchemaAnyEvent *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = v7;
    }

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (BOOL)isProvisional
{
  return 0;
}

- (int)getAnyEventType
{
  return 0;
}

- (id)qualifiedMessageName
{
  return CFSTR("unspecified");
}

- (id)getTypeId
{
  return 0;
}

- (id)getVersion
{
  return 0;
}

- (SIComponentIdentifier)componentIdentifier
{
  uint64_t v3;
  void *v4;
  SIComponentIdentifier *v5;

  v3 = -[SISchemaTopLevelUnionType getComponentName](self, "getComponentName");
  -[SISchemaTopLevelUnionType getComponentId](self, "getComponentId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  if (v4 && (_DWORD)v3)
    v5 = -[SIComponentIdentifier initWithName:schemaUUID:]([SIComponentIdentifier alloc], "initWithName:schemaUUID:", v3, v4);

  return v5;
}

- (int)componentName
{
  return 0;
}

- (id)getComponentId
{
  return 0;
}

- (id)getRequestLinkInfo
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  SISchemaRequestLinkInfo *v6;

  v3 = -[SISchemaTopLevelUnionType getComponentName](self, "getComponentName");
  if ((_DWORD)v3)
  {
    v4 = v3;
    -[SISchemaTopLevelUnionType getComponentId](self, "getComponentId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = objc_alloc_init(SISchemaRequestLinkInfo);
      -[SISchemaRequestLinkInfo setComponent:](v6, "setComponent:", v4);
      -[SISchemaRequestLinkInfo setUuid:](v6, "setUuid:", v5);
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (int)joinability
{
  return 0;
}

- (int)clockIsolationLevel
{
  return 1;
}

@end
