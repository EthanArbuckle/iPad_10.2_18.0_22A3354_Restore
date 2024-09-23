@implementation BRCIntAndZoneJobIdentifier

- (BRCIntAndZoneJobIdentifier)initWithIntID:(int64_t)a3 zoneRowID:(id)a4
{
  id v7;
  BRCIntAndZoneJobIdentifier *v8;
  BRCIntAndZoneJobIdentifier *v9;
  void *v11;
  NSObject *v12;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BRCIntAndZoneJobIdentifier;
  v8 = -[BRCIntAndZoneJobIdentifier init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_intID = a3;
    objc_storeStrong((id *)&v8->_zoneRowID, a4);
    if (!v7)
    {
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[BRCIntAndZoneJobIdentifier initWithIntID:zoneRowID:].cold.1((uint64_t)v11, v12);

    }
  }

  return v9;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%lld"), self->_zoneRowID, self->_intID);
}

- (id)matchingJobsWhereSQLClause
{
  return (id)objc_msgSend(MEMORY[0x24BEDD638], "formatInjection:", CFSTR("throttle_id = %lld AND zone_rowid = %@"), self->_intID, self->_zoneRowID);
}

- (id)columns
{
  return (id)objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", "throttle_id, zone_rowid", 23);
}

- (id)columnsValues
{
  return (id)objc_msgSend(MEMORY[0x24BEDD638], "formatInjection:", CFSTR("%lld, %@"), self->_intID, self->_zoneRowID);
}

- (unint64_t)hash
{
  int64_t intID;

  intID = self->_intID;
  return -[BRCZoneRowID hash](self->_zoneRowID, "hash") ^ intID;
}

- (BOOL)isEqualToIntAndZoneJobIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  v5 = v4;
  if (v4 && self->_intID == *((_QWORD *)v4 + 1))
    v6 = -[BRCZoneRowID br_isEqualToNumber:](self->_zoneRowID, "br_isEqualToNumber:", *((_QWORD *)v4 + 2));
  else
    v6 = 0;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  BRCIntAndZoneJobIdentifier *v4;
  BOOL v5;

  v4 = (BRCIntAndZoneJobIdentifier *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[BRCIntAndZoneJobIdentifier isEqualToIntAndZoneJobIdentifier:](self, "isEqualToIntAndZoneJobIdentifier:", v4);
  }

  return v5;
}

- (int64_t)intID
{
  return self->_intID;
}

- (BRCZoneRowID)zoneRowID
{
  return self->_zoneRowID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneRowID, 0);
}

- (void)initWithIntID:(uint64_t)a1 zoneRowID:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_230455000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: zoneRowID%@", (uint8_t *)&v2, 0xCu);
}

@end
