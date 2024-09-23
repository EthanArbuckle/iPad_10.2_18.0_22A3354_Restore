@implementation FMFImportCommand

- (FMFImportCommand)initWithClientSession:(id)a3 mappingPacketToken:(id)a4
{
  id v6;
  FMFImportCommand *v7;
  FMFImportCommand *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)FMFImportCommand;
  v7 = -[FMFBaseCmd initWithClientSession:](&v10, "initWithClientSession:", a3);
  v8 = v7;
  if (v6 && v7)
  {
    -[FMFImportCommand setMappingPacketToken:](v7, "setMappingPacketToken:", v6);
  }
  else
  {
    -[FMFBaseCmd initFailed](v7, "initFailed");

    v8 = 0;
  }

  return v8;
}

- (id)pathSuffix
{
  return CFSTR("import");
}

- (id)jsonBodyDictionary
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FMFImportCommand;
  v3 = -[FMFBaseCmd jsonBodyDictionary](&v7, "jsonBodyDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFImportCommand mappingPacketToken](self, "mappingPacketToken"));
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("url"));

  return v4;
}

- (void)processCommandResponse:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FMFImportCommand;
  -[FMFBaseCmd processCommandResponse:](&v16, "processCommandResponse:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("id")));
  v6 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("id")));

    if (v8)
    {
      -[FMFImportCommand setResponseId:](self, "setResponseId:", v8);
      goto LABEL_12;
    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("commandResponse")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v9 == v10)
    v8 = 0;
  else
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("commandResponse")));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("url")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v11 == v12)
    v13 = 0;
  else
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("url")));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "componentsSeparatedByString:", CFSTR("/")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastObject"));

  -[FMFImportCommand setResponseId:](self, "setResponseId:", v15);
LABEL_12:

}

- (NSString)responseId
{
  return self->_responseId;
}

- (void)setResponseId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)mappingPacketToken
{
  return self->_mappingPacketToken;
}

- (void)setMappingPacketToken:(id)a3
{
  objc_storeStrong((id *)&self->_mappingPacketToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mappingPacketToken, 0);
  objc_storeStrong((id *)&self->_responseId, 0);
}

@end
