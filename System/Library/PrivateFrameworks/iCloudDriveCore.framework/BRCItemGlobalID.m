@implementation BRCItemGlobalID

+ (id)itemGlobalIDFromLocalItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc((Class)a1);
    objc_msgSend(v4, "clientZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dbRowID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v5, "initWithZoneRowID:itemID:", v7, v8);

  }
  else
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v10;
      _os_log_impl(&dword_230455000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] trying to initialize a globalID from a nil object%@", (uint8_t *)&v13, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

- (BRCItemGlobalID)initWithZoneRowID:(id)a3 itemID:(id)a4
{
  id v7;
  id v8;
  BRCItemGlobalID *v9;
  BRCItemGlobalID *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BRCItemGlobalID;
  v9 = -[BRCItemGlobalID init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_zoneRowID, a3);
    objc_storeStrong((id *)&v10->_itemID, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[BRCItemID hash](self->_itemID, "hash");
  return -[BRCZoneRowID hash](self->_zoneRowID, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  BRCItemGlobalID *v4;
  BOOL v5;

  v4 = (BRCItemGlobalID *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[BRCItemGlobalID isEqualToItemGlobalID:](self, "isEqualToItemGlobalID:", v4);
  }

  return v5;
}

- (BOOL)isEqualToItemGlobalID:(id)a3
{
  id v4;
  BRCItemID *itemID;
  void *v6;
  BRCZoneRowID *zoneRowID;
  void *v8;
  char v9;

  v4 = a3;
  itemID = self->_itemID;
  objc_msgSend(v4, "itemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BRCItemID isEqual:](itemID, "isEqual:", v6))
  {
    zoneRowID = self->_zoneRowID;
    objc_msgSend(v4, "zoneRowID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[BRCZoneRowID isEqual:](zoneRowID, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;

  -[BRCItemID debugItemIDString](self->_itemID, "debugItemIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("[%@]"), self->_zoneRowID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BRCZoneRowID)zoneRowID
{
  return self->_zoneRowID;
}

- (BRCItemID)itemID
{
  return self->_itemID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_zoneRowID, 0);
}

@end
