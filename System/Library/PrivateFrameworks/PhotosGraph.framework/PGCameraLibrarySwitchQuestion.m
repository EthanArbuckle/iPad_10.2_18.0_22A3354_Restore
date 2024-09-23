@implementation PGCameraLibrarySwitchQuestion

- (PGCameraLibrarySwitchQuestion)initWithAssetUUID:(id)a3 libraryScopeUUID:(id)a4 previousSwitchState:(id)a5 currentSwitchState:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PGCameraLibrarySwitchQuestion *v14;
  uint64_t v15;
  NSString *entityIdentifier;
  uint64_t v17;
  NSDictionary *additionalInfo;
  objc_super v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PGCameraLibrarySwitchQuestion;
  v14 = -[PGCameraLibrarySwitchQuestion init](&v20, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    entityIdentifier = v14->_entityIdentifier;
    v14->_entityIdentifier = (NSString *)v15;

    v14->_state = 0;
    v21[0] = CFSTR("previousCameraLibrarySwitchState");
    v21[1] = CFSTR("currentCameraLibrarySwitchState");
    v22[0] = v12;
    v22[1] = v13;
    v21[2] = CFSTR("libraryScopeUUID");
    v22[2] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
    v17 = objc_claimAutoreleasedReturnValue();
    additionalInfo = v14->_additionalInfo;
    v14->_additionalInfo = (NSDictionary *)v17;

  }
  return v14;
}

- (unsigned)type
{
  return 23;
}

- (unsigned)displayType
{
  return 0;
}

- (unsigned)entityType
{
  return 0;
}

- (BOOL)isEquivalentToQuestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  BOOL v9;

  v4 = a3;
  objc_msgSend(v4, "entityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGCameraLibrarySwitchQuestion entityIdentifier](self, "entityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6)
    && (v7 = objc_msgSend(v4, "entityType"), v7 == -[PGCameraLibrarySwitchQuestion entityType](self, "entityType")))
  {
    v8 = objc_msgSend(v4, "type");
    v9 = v8 == -[PGCameraLibrarySwitchQuestion type](self, "type");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEquivalentToPersistedQuestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  BOOL v9;

  v4 = a3;
  objc_msgSend(v4, "entityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGCameraLibrarySwitchQuestion entityIdentifier](self, "entityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6)
    && (v7 = objc_msgSend(v4, "entityType"), v7 == -[PGCameraLibrarySwitchQuestion entityType](self, "entityType")))
  {
    v8 = objc_msgSend(v4, "type");
    v9 = v8 == -[PGCameraLibrarySwitchQuestion type](self, "type") || objc_msgSend(v4, "type") == 20;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unsigned)state
{
  return self->_state;
}

- (id)entityIdentifier
{
  return self->_entityIdentifier;
}

- (id)additionalInfo
{
  return self->_additionalInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

@end
