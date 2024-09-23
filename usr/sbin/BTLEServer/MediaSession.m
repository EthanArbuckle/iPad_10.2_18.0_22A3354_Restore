@implementation MediaSession

- (MediaSession)init
{
  MediaSession *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *registrations;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MediaSession;
  v2 = -[MediaSession init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    registrations = v2->_registrations;
    v2->_registrations = v3;

    v2->_loadedEntityID = -1;
    v2->_loadedAttributeID = -1;
  }
  return v2;
}

- (void)setRegisteredAttributeIDs:(id)a3 entityID:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  void *v18;
  void *v19;
  MediaRegistration *v20;
  MediaRegistration *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "count");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MediaSession registrations](self, "registrations"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v4));
  if (v7)
  {
    v24 = v4;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v6, "count")));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v25 = v6;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v17));
          v19 = v18;
          if (v18)
            v20 = v18;
          else
            v20 = objc_alloc_init(MediaRegistration);
          v21 = v20;

          objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, v17);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v14);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MediaSession registrations](self, "registrations"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v24));
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v11, v23);

    v6 = v25;
  }
  else
  {
    objc_msgSend(v8, "removeObjectForKey:", v9);

  }
}

- (id)notifiableAttributeIDs:(id)a3 entityID:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MediaSession registrations](self, "registrations"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v16, (_QWORD)v19));
        if (v17)
          objc_msgSend(v10, "addObject:", v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  return v10;
}

- (BOOL)isRegisteredForAttributeID:(unsigned __int8)a3 entityID:(unsigned __int8)a4
{
  void *v4;
  BOOL v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MediaSession registrationForAttributeID:entityID:](self, "registrationForAttributeID:entityID:", a3, a4));
  v5 = v4 != 0;

  return v5;
}

- (void)setLastKnownAttributeValue:(id)a3 attributeID:(unsigned __int8)a4 entityID:(unsigned __int8)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  id v9;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[MediaSession registrationForAttributeID:entityID:](self, "registrationForAttributeID:entityID:", v6, v5));
  objc_msgSend(v9, "setLastKnownAttributeValue:", v8);

}

- (id)lastKnownAttributeValueForAttributeID:(unsigned __int8)a3 entityID:(unsigned __int8)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MediaSession registrationForAttributeID:entityID:](self, "registrationForAttributeID:entityID:", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastKnownAttributeValue"));

  return v5;
}

- (id)registrationForAttributeID:(unsigned __int8)a3 entityID:(unsigned __int8)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MediaSession registrations](self, "registrations"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v5));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v9));

  return v10;
}

- (NSSet)lastKnownSupportedCommands
{
  return self->_lastKnownSupportedCommands;
}

- (void)setLastKnownSupportedCommands:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownSupportedCommands, a3);
}

- (unsigned)loadedEntityID
{
  return self->_loadedEntityID;
}

- (void)setLoadedEntityID:(unsigned __int8)a3
{
  self->_loadedEntityID = a3;
}

- (unsigned)loadedAttributeID
{
  return self->_loadedAttributeID;
}

- (void)setLoadedAttributeID:(unsigned __int8)a3
{
  self->_loadedAttributeID = a3;
}

- (NSMutableDictionary)registrations
{
  return self->_registrations;
}

- (void)setRegistrations:(id)a3
{
  objc_storeStrong((id *)&self->_registrations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrations, 0);
  objc_storeStrong((id *)&self->_lastKnownSupportedCommands, 0);
}

@end
