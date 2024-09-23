@implementation APPBConfigurationResponse

- (void)clearTheConfigurations
{
  -[NSMutableArray removeAllObjects](self->_theConfigurations, "removeAllObjects");
}

- (void)addTheConfiguration:(id)a3
{
  id v4;
  NSMutableArray *theConfigurations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  theConfigurations = self->_theConfigurations;
  v8 = v4;
  if (!theConfigurations)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_theConfigurations;
    self->_theConfigurations = v6;

    v4 = v8;
    theConfigurations = self->_theConfigurations;
  }
  -[NSMutableArray addObject:](theConfigurations, "addObject:", v4);

}

- (unint64_t)theConfigurationsCount
{
  return (unint64_t)-[NSMutableArray count](self->_theConfigurations, "count");
}

- (id)theConfigurationAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_theConfigurations, "objectAtIndex:", a3);
}

+ (Class)theConfigurationType
{
  return (Class)objc_opt_class(APPBConfiguration, a2);
}

- (BOOL)hasResourceProxyURL
{
  return self->_resourceProxyURL != 0;
}

- (BOOL)hasResourceConnectProxyURL
{
  return self->_resourceConnectProxyURL != 0;
}

- (int)bannerProxyType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_bannerProxyType;
  else
    return 0;
}

- (void)setBannerProxyType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_bannerProxyType = a3;
}

- (void)setHasBannerProxyType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBannerProxyType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)bannerProxyTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("Legacy");
  if (a3 == 1)
    v3 = CFSTR("Connect");
  else
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  return v3;
}

- (int)StringAsBannerProxyType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Legacy")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Connect"));

  return v4;
}

- (BOOL)hasConfigVersion
{
  return self->_configVersion != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBConfigurationResponse;
  v3 = -[APPBConfigurationResponse description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBConfigurationResponse dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  NSString *resourceProxyURL;
  NSString *resourceConnectProxyURL;
  int bannerProxyType;
  __CFString *v14;
  NSString *configVersion;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (-[NSMutableArray count](self->_theConfigurations, "count"))
  {
    v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_theConfigurations, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = self->_theConfigurations;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("theConfiguration"));
  }
  resourceProxyURL = self->_resourceProxyURL;
  if (resourceProxyURL)
    objc_msgSend(v3, "setObject:forKey:", resourceProxyURL, CFSTR("resourceProxyURL"));
  resourceConnectProxyURL = self->_resourceConnectProxyURL;
  if (resourceConnectProxyURL)
    objc_msgSend(v3, "setObject:forKey:", resourceConnectProxyURL, CFSTR("resourceConnectProxyURL"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    bannerProxyType = self->_bannerProxyType;
    if (bannerProxyType)
    {
      if (bannerProxyType == 1)
        v14 = CFSTR("Connect");
      else
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_bannerProxyType));
    }
    else
    {
      v14 = CFSTR("Legacy");
    }
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("bannerProxyType"));

  }
  configVersion = self->_configVersion;
  if (configVersion)
    objc_msgSend(v3, "setObject:forKey:", configVersion, CFSTR("configVersion"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBConfigurationResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSString *resourceProxyURL;
  NSString *resourceConnectProxyURL;
  NSString *configVersion;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_theConfigurations;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage(v4, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), 1);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  resourceProxyURL = self->_resourceProxyURL;
  if (resourceProxyURL)
    PBDataWriterWriteStringField(v4, resourceProxyURL, 2);
  resourceConnectProxyURL = self->_resourceConnectProxyURL;
  if (resourceConnectProxyURL)
    PBDataWriterWriteStringField(v4, resourceConnectProxyURL, 3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field(v4, self->_bannerProxyType, 4);
  configVersion = self->_configVersion;
  if (configVersion)
    PBDataWriterWriteStringField(v4, configVersion, 5);

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  _DWORD *v8;
  id v9;

  v9 = a3;
  if (-[APPBConfigurationResponse theConfigurationsCount](self, "theConfigurationsCount"))
  {
    objc_msgSend(v9, "clearTheConfigurations");
    v4 = -[APPBConfigurationResponse theConfigurationsCount](self, "theConfigurationsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[APPBConfigurationResponse theConfigurationAtIndex:](self, "theConfigurationAtIndex:", i));
        objc_msgSend(v9, "addTheConfiguration:", v7);

      }
    }
  }
  if (self->_resourceProxyURL)
    objc_msgSend(v9, "setResourceProxyURL:");
  v8 = v9;
  if (self->_resourceConnectProxyURL)
  {
    objc_msgSend(v9, "setResourceConnectProxyURL:");
    v8 = v9;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v8[2] = self->_bannerProxyType;
    *((_BYTE *)v8 + 48) |= 1u;
  }
  if (self->_configVersion)
  {
    objc_msgSend(v9, "setConfigVersion:");
    v8 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = self->_theConfigurations;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v10), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend(v5, "addTheConfiguration:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  v12 = -[NSString copyWithZone:](self->_resourceProxyURL, "copyWithZone:", a3);
  v13 = (void *)*((_QWORD *)v5 + 5);
  *((_QWORD *)v5 + 5) = v12;

  v14 = -[NSString copyWithZone:](self->_resourceConnectProxyURL, "copyWithZone:", a3);
  v15 = (void *)*((_QWORD *)v5 + 4);
  *((_QWORD *)v5 + 4) = v14;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 2) = self->_bannerProxyType;
    *((_BYTE *)v5 + 48) |= 1u;
  }
  v16 = -[NSString copyWithZone:](self->_configVersion, "copyWithZone:", a3, (_QWORD)v19);
  v17 = (void *)*((_QWORD *)v5 + 2);
  *((_QWORD *)v5 + 2) = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *theConfigurations;
  NSString *resourceProxyURL;
  NSString *resourceConnectProxyURL;
  NSString *configVersion;
  unsigned __int8 v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_15;
  theConfigurations = self->_theConfigurations;
  if ((unint64_t)theConfigurations | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](theConfigurations, "isEqual:"))
      goto LABEL_15;
  }
  resourceProxyURL = self->_resourceProxyURL;
  if ((unint64_t)resourceProxyURL | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](resourceProxyURL, "isEqual:"))
      goto LABEL_15;
  }
  resourceConnectProxyURL = self->_resourceConnectProxyURL;
  if ((unint64_t)resourceConnectProxyURL | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](resourceConnectProxyURL, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_bannerProxyType != *((_DWORD *)v4 + 2))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  configVersion = self->_configVersion;
  if ((unint64_t)configVersion | *((_QWORD *)v4 + 2))
    v9 = -[NSString isEqual:](configVersion, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = (unint64_t)-[NSMutableArray hash](self->_theConfigurations, "hash");
  v4 = -[NSString hash](self->_resourceProxyURL, "hash");
  v5 = -[NSString hash](self->_resourceConnectProxyURL, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_bannerProxyType;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_configVersion, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *((id *)v4 + 3);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[APPBConfigurationResponse addTheConfiguration:](self, "addTheConfiguration:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 5))
    -[APPBConfigurationResponse setResourceProxyURL:](self, "setResourceProxyURL:");
  if (*((_QWORD *)v4 + 4))
    -[APPBConfigurationResponse setResourceConnectProxyURL:](self, "setResourceConnectProxyURL:");
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    self->_bannerProxyType = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
    -[APPBConfigurationResponse setConfigVersion:](self, "setConfigVersion:");

}

- (NSMutableArray)theConfigurations
{
  return self->_theConfigurations;
}

- (void)setTheConfigurations:(id)a3
{
  objc_storeStrong((id *)&self->_theConfigurations, a3);
}

- (NSString)resourceProxyURL
{
  return self->_resourceProxyURL;
}

- (void)setResourceProxyURL:(id)a3
{
  objc_storeStrong((id *)&self->_resourceProxyURL, a3);
}

- (NSString)resourceConnectProxyURL
{
  return self->_resourceConnectProxyURL;
}

- (void)setResourceConnectProxyURL:(id)a3
{
  objc_storeStrong((id *)&self->_resourceConnectProxyURL, a3);
}

- (NSString)configVersion
{
  return self->_configVersion;
}

- (void)setConfigVersion:(id)a3
{
  objc_storeStrong((id *)&self->_configVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceProxyURL, 0);
  objc_storeStrong((id *)&self->_resourceConnectProxyURL, 0);
  objc_storeStrong((id *)&self->_theConfigurations, 0);
  objc_storeStrong((id *)&self->_configVersion, 0);
}

@end
