@implementation VGChargingNetwork

- (VGChargingNetwork)initWithBrandInfoMapping:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  id v18;
  id v19;
  void *v20;
  VGChargingNetwork *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  VGChargingNetwork *v26;
  VGChargingNetwork *v27;
  NSObject *v28;
  VGChargingNetwork *v30;
  id v31;
  objc_super v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v30 = self;
  v40 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "countryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = v3;
  objc_msgSend(v3, "scopedBrandInfos");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v34;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v11)
        objc_enumerationMutation(v7);
      v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v12);
      objc_msgSend(v13, "isoCountryCode", v30);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v6, "isEqualToString:", v14);

      if ((v15 & 1) != 0)
        break;
      objc_msgSend(v13, "isoCountryCode");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(CFSTR("global"), "isEqualToString:", v16);

      if (v17)
      {
        v18 = v13;

        v10 = v18;
      }
      if (v9 == ++v12)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_15;
      }
    }
    v19 = v13;

    v21 = v30;
    v20 = v31;
    if (v19)
      goto LABEL_19;
  }
  else
  {
    v10 = 0;
LABEL_15:

    v21 = v30;
    v20 = v31;
  }
  VGGetChargingNetworksLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v20;
    _os_log_impl(&dword_20A329000, v22, OS_LOG_TYPE_INFO, "Didn't find local scoped brand info in mapping: %@, falling back to global", buf, 0xCu);
  }

  v10 = v10;
  v19 = v10;
LABEL_19:
  v23 = (void *)MEMORY[0x24BE3CC18];
  objc_msgSend(v19, "localizedNames", v30);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bestStringForCurrentLocale:fallbackToFirstAvailable:", v24, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v32.receiver = v21;
    v32.super_class = (Class)VGChargingNetwork;
    v26 = -[VGChargingNetwork init](&v32, sel_init);
    if (v26)
    {
      v26->_globalBrandID = objc_msgSend(v20, "globalBrandId");
      objc_storeStrong((id *)&v26->_name, v25);
    }
    v21 = v26;
    v27 = v21;
  }
  else
  {
    VGGetChargingNetworksLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v38 = v20;
      _os_log_impl(&dword_20A329000, v28, OS_LOG_TYPE_ERROR, "Failed to initialize a network with mapping: %{public}@", buf, 0xCu);
    }

    v27 = 0;
  }

  return v27;
}

- (VGChargingNetwork)initWithChargingNetworkStorage:(id)a3
{
  id v4;
  VGChargingNetwork *v5;
  void *v6;
  uint64_t v7;
  NSString *name;
  VGChargingNetwork *v9;
  NSObject *v10;
  objc_super v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "hasIdentifier") & 1) != 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)VGChargingNetwork;
    v5 = -[VGChargingNetwork init](&v12, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "copy");
      name = v5->_name;
      v5->_name = (NSString *)v7;

      v5->_globalBrandID = objc_msgSend(v4, "identifier");
    }
    self = v5;
    v9 = self;
  }
  else
  {
    VGGetChargingNetworksLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl(&dword_20A329000, v10, OS_LOG_TYPE_ERROR, "Failed to initialize a network with storage: %@", buf, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VGChargingNetwork *v4;
  uint64_t v5;
  NSString *name;

  v4 = objc_alloc_init(VGChargingNetwork);
  v4->_globalBrandID = self->_globalBrandID;
  v5 = -[NSString copy](self->_name, "copy");
  name = v4->_name;
  v4->_name = (NSString *)v5;

  return v4;
}

- (VGChargingNetwork)initWithCoder:(id)a3
{
  id v4;
  VGChargingNetwork *v5;
  uint64_t v6;
  NSString *name;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VGChargingNetwork;
  v5 = -[VGChargingNetwork init](&v9, sel_init);
  if (v5)
  {
    v5->_globalBrandID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_globalBrandID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t globalBrandID;
  id v5;

  globalBrandID = self->_globalBrandID;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", globalBrandID, CFSTR("_globalBrandID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("_name"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "globalBrandID") == self->_globalBrandID;

  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = 2654435761u * self->_globalBrandID;
  return -[NSString hash](self->_name, "hash") ^ v2;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p, globalBrandID: %llu, name: %@>"), objc_opt_class(), self, self->_globalBrandID, self->_name);
}

- (unint64_t)globalBrandID
{
  return self->_globalBrandID;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
