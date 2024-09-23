@implementation UMAppleKeyStoreMock

- (UMAppleKeyStoreMock)init
{
  UMAppleKeyStoreMock *v2;
  UMAppleKeyStoreMock *v3;
  uint64_t v4;
  NSMutableDictionary *bootstrappedVolumes;
  uint64_t v6;
  NSMutableDictionary *personas;
  uint64_t v8;
  NSMutableDictionary *mappedVolumes;
  uint64_t v10;
  NSMutableDictionary *mappedVolumePersonas;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UMAppleKeyStoreMock;
  v2 = -[UMAppleKeyStoreMock init](&v13, "init");
  if (!v2)
    sub_1000ACE0C();
  v3 = v2;
  v4 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  bootstrappedVolumes = v3->_bootstrappedVolumes;
  v3->_bootstrappedVolumes = (NSMutableDictionary *)v4;

  v6 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  personas = v3->_personas;
  v3->_personas = (NSMutableDictionary *)v6;

  v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  mappedVolumes = v3->_mappedVolumes;
  v3->_mappedVolumes = (NSMutableDictionary *)v8;

  v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  mappedVolumePersonas = v3->_mappedVolumePersonas;
  v3->_mappedVolumePersonas = (NSMutableDictionary *)v10;

  return v3;
}

- (BOOL)bootstrapVolumeWithMountPoint:(id)a3 user:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  NSError *v9;
  BOOL v10;
  void *v11;
  NSMutableDictionary *bootstrappedVolumes;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  if (a5)
    *a5 = 0;
  if (-[UMAppleKeyStoreMock ignoreIdentityMethods](self, "ignoreIdentityMethods"))
    goto LABEL_12;
  if (!self || !self->_bootstrapVolumeErrorOverride)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v6));
    if (self)
      bootstrappedVolumes = self->_bootstrappedVolumes;
    else
      bootstrappedVolumes = 0;
    -[NSMutableDictionary setObject:forKeyedSubscript:](bootstrappedVolumes, "setObject:forKeyedSubscript:", v11, v8);

LABEL_12:
    v10 = 1;
    goto LABEL_13;
  }
  if (a5)
  {
    v9 = self->_bootstrapVolumeErrorOverride;
    v10 = 0;
    *a5 = v9;
  }
  else
  {
    v10 = 0;
  }
LABEL_13:

  return v10;
}

- (id)dataWrappingDataWithDeviceClassF:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSError *v8;
  NSData *v9;
  NSData *v10;
  id v11;

  v6 = a3;
  v7 = v6;
  if (self && self->_dataWrappingDataErrorOverride)
  {
    if (a4)
    {
      v8 = self->_dataWrappingDataErrorOverride;
      v9 = 0;
      *a4 = v8;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    if (a4)
      *a4 = 0;
    if (self && self->_dataWrappingDataReturnOverride)
    {
      v10 = self->_dataWrappingDataReturnOverride;
    }
    else
    {
      v11 = sub_10001BBC8((uint64_t)v6);
      v10 = (NSData *)objc_claimAutoreleasedReturnValue(v11);
    }
    v9 = v10;
  }

  return v9;
}

- (id)dataUnwrappingDataWithDeviceClassF:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSError *v8;
  NSData *v9;
  NSData *v10;
  id v11;

  v6 = a3;
  v7 = v6;
  if (self && self->_dataUnwrappingDataErrorOverride)
  {
    if (a4)
    {
      v8 = self->_dataUnwrappingDataErrorOverride;
      v9 = 0;
      *a4 = v8;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    if (a4)
      *a4 = 0;
    if (self && self->_dataUnwrappingDataReturnOverride)
    {
      v10 = self->_dataUnwrappingDataReturnOverride;
    }
    else
    {
      v11 = sub_10001BC2C(v6);
      v10 = (NSData *)objc_claimAutoreleasedReturnValue(v11);
    }
    v9 = v10;
  }

  return v9;
}

- (BOOL)createIdentityWithUUID:(id)a3 passcode:(id)a4 existingSession:(unsigned int)a5 existingSessionPasscode:(id)a6 error:(id *)a7
{
  NSError *createIdentityWithUUIDErrorOverride;

  if (a7)
    *a7 = 0;
  if (self)
  {
    createIdentityWithUUIDErrorOverride = self->_createIdentityWithUUIDErrorOverride;
    if (!a7)
      return createIdentityWithUUIDErrorOverride == 0;
  }
  else
  {
    createIdentityWithUUIDErrorOverride = 0;
    if (!a7)
      return createIdentityWithUUIDErrorOverride == 0;
  }
  if (createIdentityWithUUIDErrorOverride)
  {
    if (self)
      self = self->_createIdentityWithUUIDErrorOverride;
    *a7 = self;
  }
  return createIdentityWithUUIDErrorOverride == 0;
}

- (BOOL)deleteIdentity:(id)a3 error:(id *)a4
{
  NSError *deleteIdentityErrorOverride;

  if (a4)
    *a4 = 0;
  if (self)
  {
    deleteIdentityErrorOverride = self->_deleteIdentityErrorOverride;
    if (!a4)
      return deleteIdentityErrorOverride == 0;
  }
  else
  {
    deleteIdentityErrorOverride = 0;
    if (!a4)
      return deleteIdentityErrorOverride == 0;
  }
  if (deleteIdentityErrorOverride)
  {
    if (self)
      self = self->_deleteIdentityErrorOverride;
    *a4 = self;
  }
  return deleteIdentityErrorOverride == 0;
}

- (BOOL)isIdentityLoadedIntoSession:(unsigned int)a3
{
  if (self)
    LOBYTE(self) = self->_isIdentityLoadedForSessionReturnOverride;
  return (char)self;
}

- (BOOL)loadIdentity:(id)a3 intoSession:(unsigned int)a4 error:(id *)a5
{
  NSError *loadIdentityErrorOverride;

  if (a5)
    *a5 = 0;
  if (self)
  {
    loadIdentityErrorOverride = self->_loadIdentityErrorOverride;
    if (!a5)
      return loadIdentityErrorOverride == 0;
  }
  else
  {
    loadIdentityErrorOverride = 0;
    if (!a5)
      return loadIdentityErrorOverride == 0;
  }
  if (loadIdentityErrorOverride)
  {
    if (self)
      self = self->_loadIdentityErrorOverride;
    *a5 = self;
  }
  return loadIdentityErrorOverride == 0;
}

- (BOOL)unloadIdentityFromSession:(unsigned int)a3 error:(id *)a4
{
  NSError *unloadIdentityErrorOverride;

  if (a4)
    *a4 = 0;
  if (self)
  {
    unloadIdentityErrorOverride = self->_unloadIdentityErrorOverride;
    if (!a4)
      return unloadIdentityErrorOverride == 0;
  }
  else
  {
    unloadIdentityErrorOverride = 0;
    if (!a4)
      return unloadIdentityErrorOverride == 0;
  }
  if (unloadIdentityErrorOverride)
  {
    if (self)
      self = self->_unloadIdentityErrorOverride;
    *a4 = self;
  }
  return unloadIdentityErrorOverride == 0;
}

- (BOOL)unlockIdentityInSession:(unsigned int)a3 passcode:(id)a4 error:(id *)a5
{
  NSError *unlockIdentityErrorOverride;

  if (a5)
    *a5 = 0;
  if (self)
  {
    unlockIdentityErrorOverride = self->_unlockIdentityErrorOverride;
    if (!a5)
      return unlockIdentityErrorOverride == 0;
  }
  else
  {
    unlockIdentityErrorOverride = 0;
    if (!a5)
      return unlockIdentityErrorOverride == 0;
  }
  if (unlockIdentityErrorOverride)
  {
    if (self)
      self = self->_unlockIdentityErrorOverride;
    *a5 = self;
  }
  return unlockIdentityErrorOverride == 0;
}

- (BOOL)loginIdentity:(id)a3 intoSession:(unsigned int)a4 passcode:(id)a5 error:(id *)a6
{
  NSError *loginIdentityErrorOverride;

  if (a6)
    *a6 = 0;
  if (self)
  {
    loginIdentityErrorOverride = self->_loginIdentityErrorOverride;
    if (!a6)
      return loginIdentityErrorOverride == 0;
  }
  else
  {
    loginIdentityErrorOverride = 0;
    if (!a6)
      return loginIdentityErrorOverride == 0;
  }
  if (loginIdentityErrorOverride)
  {
    if (self)
      self = self->_loginIdentityErrorOverride;
    *a6 = self;
  }
  return loginIdentityErrorOverride == 0;
}

- (BOOL)addPersonaWithUUID:(id)a3 toSession:(unsigned int)a4 passcode:(id)a5 error:(id *)a6
{
  uint64_t v7;
  id v9;
  NSError *addPersonaToSessionErrorOverride;
  NSMutableDictionary *personas;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  void *v17;

  v7 = *(_QWORD *)&a4;
  v9 = a3;
  if (a6)
    *a6 = 0;
  if (self)
  {
    addPersonaToSessionErrorOverride = self->_addPersonaToSessionErrorOverride;
    if (addPersonaToSessionErrorOverride)
    {
      if (a6)
        *a6 = self->_addPersonaToSessionErrorOverride;
      goto LABEL_15;
    }
  }
  else
  {
    addPersonaToSessionErrorOverride = 0;
  }
  if (self)
    personas = self->_personas;
  else
    personas = 0;
  v12 = personas;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v7));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v13));

  if (!v14)
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  objc_msgSend(v14, "addObject:", v9);
  if (self)
    v15 = self->_personas;
  else
    v15 = 0;
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v7));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v14, v17);

LABEL_15:
  return addPersonaToSessionErrorOverride == 0;
}

- (BOOL)deletePersonaWithUUID:(id)a3 fromSession:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  NSError *deletePersonaFromSessionErrorOverride;
  NSMutableDictionary *personas;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  void *v16;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  if (a5)
    *a5 = 0;
  if (self)
  {
    deletePersonaFromSessionErrorOverride = self->_deletePersonaFromSessionErrorOverride;
    if (deletePersonaFromSessionErrorOverride)
    {
      if (a5)
        *a5 = self->_deletePersonaFromSessionErrorOverride;
      goto LABEL_15;
    }
  }
  else
  {
    deletePersonaFromSessionErrorOverride = 0;
  }
  if (self)
    personas = self->_personas;
  else
    personas = 0;
  v11 = personas;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v6));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v12));

  if (!v13)
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  objc_msgSend(v13, "removeObject:", v8);
  if (self)
    v14 = self->_personas;
  else
    v14 = 0;
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v6));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v13, v16);

LABEL_15:
  return deletePersonaFromSessionErrorOverride == 0;
}

- (BOOL)mapVolume:(id)a3 toSession:(unsigned int)a4 withPersona:(id)a5 error:(id *)a6
{
  uint64_t v8;
  id v10;
  id v11;
  BOOL v12;
  NSError *v13;
  NSMutableDictionary *personas;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableDictionary *mappedVolumePersonas;
  void *v20;
  NSMutableDictionary *mappedVolumes;

  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = a5;
  if (a6)
    *a6 = 0;
  if (-[UMAppleKeyStoreMock ignoreIdentityMethods](self, "ignoreIdentityMethods"))
    goto LABEL_4;
  if (self && self->_mapVolumeErrorOverride)
  {
    if (a6)
    {
      v13 = self->_mapVolumeErrorOverride;
      v12 = 0;
      *a6 = v13;
      goto LABEL_23;
    }
LABEL_22:
    v12 = 0;
    goto LABEL_23;
  }
  if (v11)
  {
    if (self)
      personas = self->_personas;
    else
      personas = 0;
    v15 = personas;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v8));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v16));

    if ((objc_msgSend(v17, "containsObject:", v11) & 1) == 0)
    {
      if (a6)
        *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 2, 0));

      goto LABEL_22;
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v8));
    if (self)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mappedVolumes, "setObject:forKeyedSubscript:", v18, v10);

      mappedVolumePersonas = self->_mappedVolumePersonas;
    }
    else
    {
      objc_msgSend(0, "setObject:forKeyedSubscript:", v18, v10);

      mappedVolumePersonas = 0;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](mappedVolumePersonas, "setObject:forKeyedSubscript:", v11, v10);
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v8));
    if (self)
      mappedVolumes = self->_mappedVolumes;
    else
      mappedVolumes = 0;
    -[NSMutableDictionary setObject:forKeyedSubscript:](mappedVolumes, "setObject:forKeyedSubscript:", v20, v10);

  }
LABEL_4:
  v12 = 1;
LABEL_23:

  return v12;
}

- (BOOL)unmapVolume:(id)a3 error:(id *)a4
{
  id v6;
  NSError *v7;
  BOOL v8;
  NSMutableDictionary *mappedVolumePersonas;

  v6 = a3;
  if (a4)
    *a4 = 0;
  if (-[UMAppleKeyStoreMock ignoreIdentityMethods](self, "ignoreIdentityMethods"))
    goto LABEL_12;
  if (!self || !self->_unmapVolumeErrorOverride)
  {
    if (self)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mappedVolumes, "setObject:forKeyedSubscript:", 0, v6);
      mappedVolumePersonas = self->_mappedVolumePersonas;
    }
    else
    {
      objc_msgSend(0, "setObject:forKeyedSubscript:", 0, v6);
      mappedVolumePersonas = 0;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](mappedVolumePersonas, "setObject:forKeyedSubscript:", 0, v6);
LABEL_12:
    v8 = 1;
    goto LABEL_13;
  }
  if (a4)
  {
    v7 = self->_unmapVolumeErrorOverride;
    v8 = 0;
    *a4 = v7;
  }
  else
  {
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (BOOL)ignoreIdentityMethods
{
  return self->_ignoreIdentityMethods;
}

- (void)setIgnoreIdentityMethods:(BOOL)a3
{
  self->_ignoreIdentityMethods = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unmapVolumeErrorOverride, 0);
  objc_storeStrong((id *)&self->_mapVolumeErrorOverride, 0);
  objc_storeStrong((id *)&self->_deletePersonaFromSessionErrorOverride, 0);
  objc_storeStrong((id *)&self->_addPersonaToSessionErrorOverride, 0);
  objc_storeStrong((id *)&self->_loginIdentityErrorOverride, 0);
  objc_storeStrong((id *)&self->_unlockIdentityErrorOverride, 0);
  objc_storeStrong((id *)&self->_unloadIdentityErrorOverride, 0);
  objc_storeStrong((id *)&self->_loadIdentityErrorOverride, 0);
  objc_storeStrong((id *)&self->_deleteIdentityErrorOverride, 0);
  objc_storeStrong((id *)&self->_createIdentityWithUUIDErrorOverride, 0);
  objc_storeStrong((id *)&self->_dataUnwrappingDataReturnOverride, 0);
  objc_storeStrong((id *)&self->_dataUnwrappingDataErrorOverride, 0);
  objc_storeStrong((id *)&self->_dataWrappingDataReturnOverride, 0);
  objc_storeStrong((id *)&self->_dataWrappingDataErrorOverride, 0);
  objc_storeStrong((id *)&self->_bootstrapVolumeErrorOverride, 0);
  objc_storeStrong((id *)&self->_mappedVolumePersonas, 0);
  objc_storeStrong((id *)&self->_mappedVolumes, 0);
  objc_storeStrong((id *)&self->_personas, 0);
  objc_storeStrong((id *)&self->_bootstrappedVolumes, 0);
}

@end
