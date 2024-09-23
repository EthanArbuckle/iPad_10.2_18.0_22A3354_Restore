@implementation PLCrowdSourcedThemesAssetEvent

- (PLCrowdSourcedThemesAssetEvent)initWithUUID:(id)a3
{
  id v4;
  PLCrowdSourcedThemesAssetEvent *v5;
  uint64_t v6;
  NSString *uuid;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLCrowdSourcedThemesAssetEvent;
  v5 = -[PLCrowdSourcedThemesAssetEvent init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v6;

  }
  return v5;
}

- (id)serialize
{
  void *v2;
  void *v3;

  -[PLCrowdSourcedThemesAssetEvent uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unsigned)dataVersion
{
  return self->dataVersion;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;

  v7 = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLCrowdSourcedThemesAssetEvent.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataVersion == 0"));

  }
  v8 = objc_alloc((Class)a1);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v7, 4);
  v10 = (void *)objc_msgSend(v8, "initWithUUID:", v9);

  return v10;
}

@end
