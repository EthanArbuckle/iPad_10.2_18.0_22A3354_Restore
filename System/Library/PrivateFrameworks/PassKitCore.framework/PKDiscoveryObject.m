@implementation PKDiscoveryObject

+ (id)convertEngagementRequestToDictionary:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "clientData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99E08]);
    v13 = CFSTR("identifier");
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithDictionary:", v7);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("maxViewCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("maxViewCount"));

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("maxViewCountLarge"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("maxViewCountLargeCard"));

    v11 = (void *)objc_msgSend(v8, "copy");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (PKDiscoveryObject)initWithDictionary:(id)a3
{
  id v4;
  PKDiscoveryObject *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *ruleIdentifier;
  uint64_t v10;
  NSString *triggerRuleIdentifier;
  uint64_t v12;
  void *v13;
  PKOSVersionRequirementRange *v14;
  PKOSVersionRequirementRange *osVersionRange;
  void *v16;
  PKHardwareVersionRange *v17;
  PKHardwareVersionRange *hardwareVersionRange;
  void *v19;
  PKDiscoveryRelevantDateRange *v20;
  PKDiscoveryRelevantDateRange *relevantDateRange;
  PKDiscoveryObject *v22;
  NSObject *v23;
  uint8_t v25[16];
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PKDiscoveryObject;
  v5 = -[PKDiscoveryObject init](&v26, sel_init);
  if (!v5)
  {
LABEL_12:
    v22 = v5;
    goto LABEL_16;
  }
  objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
  v6 = objc_claimAutoreleasedReturnValue();
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  if (-[NSString length](v5->_identifier, "length"))
  {
    v5->_version = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("version"));
    objc_msgSend(v4, "PKStringForKey:", CFSTR("ruleIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    ruleIdentifier = v5->_ruleIdentifier;
    v5->_ruleIdentifier = (NSString *)v8;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("trigger"));
    v10 = objc_claimAutoreleasedReturnValue();
    triggerRuleIdentifier = v5->_triggerRuleIdentifier;
    v5->_triggerRuleIdentifier = (NSString *)v10;

    v12 = 5;
    if (!v5->_triggerRuleIdentifier)
      v12 = 1;
    v5->_status = v12;
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("osVersionRange"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = -[PKOSVersionRequirementRange initWithDictionary:]([PKOSVersionRequirementRange alloc], "initWithDictionary:", v13);
      osVersionRange = v5->_osVersionRange;
      v5->_osVersionRange = v14;

    }
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("hardwareVersionRange"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = -[PKHardwareVersionRange initWithDictionary:]([PKHardwareVersionRange alloc], "initWithDictionary:", v16);
      hardwareVersionRange = v5->_hardwareVersionRange;
      v5->_hardwareVersionRange = v17;

    }
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("relevantDateRange"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = -[PKDiscoveryRelevantDateRange initWithDictionary:]([PKDiscoveryRelevantDateRange alloc], "initWithDictionary:", v19);
      relevantDateRange = v5->_relevantDateRange;
      v5->_relevantDateRange = v20;

    }
    v5->_maxViewCount = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("maxViewCount"));
    v5->_maxViewCountLargeCard = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("maxViewCountLargeCard"));

    goto LABEL_12;
  }
  PKLogFacilityTypeGetObject(0x10uLL);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v25 = 0;
    _os_log_impl(&dword_18FC92000, v23, OS_LOG_TYPE_DEFAULT, "Malformed Discovery Item in manifest: nil or empty identifier.", v25, 2u);
  }

  v22 = 0;
LABEL_16:

  return v22;
}

- (BOOL)updateWithDiscoveryObject:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSString *v7;
  NSString *ruleIdentifier;
  PKOSVersionRequirementRange *v9;
  PKOSVersionRequirementRange *osVersionRange;
  PKHardwareVersionRange *v11;
  PKHardwareVersionRange *hardwareVersionRange;
  NSString *v13;
  NSString *triggerRuleIdentifier;
  PKDiscoveryRelevantDateRange *v15;
  PKDiscoveryRelevantDateRange *relevantDateRange;
  NSObject *v17;
  void *v18;
  NSString *identifier;
  int v21;
  void *v22;
  __int16 v23;
  NSString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", self->_identifier);

  if ((v6 & 1) != 0)
  {
    self->_version = objc_msgSend(v4, "version");
    objc_msgSend(v4, "ruleIdentifier");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    ruleIdentifier = self->_ruleIdentifier;
    self->_ruleIdentifier = v7;

    objc_msgSend(v4, "osVersionRange");
    v9 = (PKOSVersionRequirementRange *)objc_claimAutoreleasedReturnValue();
    osVersionRange = self->_osVersionRange;
    self->_osVersionRange = v9;

    objc_msgSend(v4, "hardwareVersionRange");
    v11 = (PKHardwareVersionRange *)objc_claimAutoreleasedReturnValue();
    hardwareVersionRange = self->_hardwareVersionRange;
    self->_hardwareVersionRange = v11;

    objc_msgSend(v4, "triggerRuleIdentifier");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    triggerRuleIdentifier = self->_triggerRuleIdentifier;
    self->_triggerRuleIdentifier = v13;

    objc_msgSend(v4, "relevantDateRange");
    v15 = (PKDiscoveryRelevantDateRange *)objc_claimAutoreleasedReturnValue();
    relevantDateRange = self->_relevantDateRange;
    self->_relevantDateRange = v15;

    self->_maxViewCount = objc_msgSend(v4, "maxViewCount");
    self->_maxViewCountLargeCard = objc_msgSend(v4, "maxViewCountLargeCard");
  }
  else
  {
    PKLogFacilityTypeGetObject(0x10uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      identifier = self->_identifier;
      v21 = 138412546;
      v22 = v18;
      v23 = 2112;
      v24 = identifier;
      _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "Cannot merge DiscoveryItem with identifier: %@ into identifier: %@", (uint8_t *)&v21, 0x16u);

    }
  }

  return v6;
}

- (BOOL)isTerminalStatus
{
  return (unint64_t)(self->_status - 3) < 2;
}

- (BOOL)hasTrigger
{
  return self->_triggerRuleIdentifier != 0;
}

- (void)updatedStatusForAction:(int64_t)a3
{
  NSObject *v5;
  int64_t status;
  int64_t v7;
  NSObject *v8;
  int v9;
  PKDiscoveryObject *v10;
  __int16 v11;
  int64_t v12;
  __int16 v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[PKDiscoveryObject isTerminalStatus](self, "isTerminalStatus"))
  {
    PKLogFacilityTypeGetObject(0x10uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      status = self->_status;
      v9 = 138412802;
      v10 = self;
      v11 = 2048;
      v12 = a3;
      v13 = 2048;
      v14 = status;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "%@: should not have received action: %ld because it is in terminal status: %ld", (uint8_t *)&v9, 0x20u);
    }

  }
  if (a3 == 2)
  {
    v7 = 3;
    goto LABEL_9;
  }
  if (a3 == 1)
  {
    v7 = 4;
LABEL_9:
    self->_status = v7;
    return;
  }
  PKLogFacilityTypeGetObject(0x10uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = self;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "%@: received updateStatusForAction: with unknown action", (uint8_t *)&v9, 0xCu);
  }

}

- (BOOL)isValidForTime:(id)a3
{
  PKDiscoveryRelevantDateRange *relevantDateRange;

  relevantDateRange = self->_relevantDateRange;
  return !relevantDateRange || -[PKDiscoveryRelevantDateRange isValidForTime:](relevantDateRange, "isValidForTime:", a3);
}

- (void)incrementViewCount
{
  ++self->_viewCount;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_version, CFSTR("version"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ruleIdentifier, CFSTR("ruleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_triggerRuleIdentifier, CFSTR("trigger"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_osVersionRange, CFSTR("osVersionRange"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hardwareVersionRange, CFSTR("hardwareVersionRange"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_status, CFSTR("status"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_relevantDateRange, CFSTR("relevantDateRange"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_viewCount, CFSTR("viewCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_maxViewCount, CFSTR("maxViewCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_maxViewCountLargeCard, CFSTR("maxViewCountLargeCard"));

}

- (PKDiscoveryObject)initWithCoder:(id)a3
{
  id v4;
  PKDiscoveryObject *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *ruleIdentifier;
  uint64_t v10;
  NSString *triggerRuleIdentifier;
  uint64_t v12;
  PKOSVersionRequirementRange *osVersionRange;
  uint64_t v14;
  PKHardwareVersionRange *hardwareVersionRange;
  uint64_t v16;
  PKDiscoveryRelevantDateRange *relevantDateRange;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKDiscoveryObject;
  v5 = -[PKDiscoveryObject init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_version = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ruleIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    ruleIdentifier = v5->_ruleIdentifier;
    v5->_ruleIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trigger"));
    v10 = objc_claimAutoreleasedReturnValue();
    triggerRuleIdentifier = v5->_triggerRuleIdentifier;
    v5->_triggerRuleIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("osVersionRange"));
    v12 = objc_claimAutoreleasedReturnValue();
    osVersionRange = v5->_osVersionRange;
    v5->_osVersionRange = (PKOSVersionRequirementRange *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hardwareVersionRange"));
    v14 = objc_claimAutoreleasedReturnValue();
    hardwareVersionRange = v5->_hardwareVersionRange;
    v5->_hardwareVersionRange = (PKHardwareVersionRange *)v14;

    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relevantDateRange"));
    v16 = objc_claimAutoreleasedReturnValue();
    relevantDateRange = v5->_relevantDateRange;
    v5->_relevantDateRange = (PKDiscoveryRelevantDateRange *)v16;

    v5->_viewCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("viewCount"));
    v5->_maxViewCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxViewCount"));
    v5->_maxViewCountLargeCard = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxViewCountLargeCard"));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v5[2] = self->_version;
  v8 = -[NSString copyWithZone:](self->_ruleIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_triggerRuleIdentifier, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  v12 = -[PKOSVersionRequirementRange copyWithZone:](self->_osVersionRange, "copyWithZone:", a3);
  v13 = (void *)v5[5];
  v5[5] = v12;

  v14 = -[PKHardwareVersionRange copyWithZone:](self->_hardwareVersionRange, "copyWithZone:", a3);
  v15 = (void *)v5[6];
  v5[6] = v14;

  v5[10] = self->_status;
  v16 = -[PKDiscoveryRelevantDateRange copyWithZone:](self->_relevantDateRange, "copyWithZone:", a3);
  v17 = (void *)v5[7];
  v5[7] = v16;

  v5[11] = self->_viewCount;
  v5[8] = self->_maxViewCount;
  v5[9] = self->_maxViewCountLargeCard;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *v6;
  NSString *ruleIdentifier;
  NSString *v8;
  NSString *triggerRuleIdentifier;
  NSString *v10;
  PKOSVersionRequirementRange *osVersionRange;
  PKOSVersionRequirementRange *v12;
  PKHardwareVersionRange *hardwareVersionRange;
  PKHardwareVersionRange *v14;
  PKDiscoveryRelevantDateRange *relevantDateRange;
  PKDiscoveryRelevantDateRange *v16;
  BOOL v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_37;
  identifier = self->_identifier;
  v6 = (NSString *)v4[1];
  if (identifier && v6)
  {
    if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
      goto LABEL_37;
  }
  else if (identifier != v6)
  {
    goto LABEL_37;
  }
  if (self->_version != v4[2])
    goto LABEL_37;
  ruleIdentifier = self->_ruleIdentifier;
  v8 = (NSString *)v4[3];
  if (ruleIdentifier && v8)
  {
    if ((-[NSString isEqual:](ruleIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_37;
  }
  else if (ruleIdentifier != v8)
  {
    goto LABEL_37;
  }
  triggerRuleIdentifier = self->_triggerRuleIdentifier;
  v10 = (NSString *)v4[4];
  if (triggerRuleIdentifier && v10)
  {
    if ((-[NSString isEqual:](triggerRuleIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_37;
  }
  else if (triggerRuleIdentifier != v10)
  {
    goto LABEL_37;
  }
  osVersionRange = self->_osVersionRange;
  v12 = (PKOSVersionRequirementRange *)v4[5];
  if (osVersionRange && v12)
  {
    if (!-[PKOSVersionRequirementRange isEqual:](osVersionRange, "isEqual:"))
      goto LABEL_37;
  }
  else if (osVersionRange != v12)
  {
    goto LABEL_37;
  }
  hardwareVersionRange = self->_hardwareVersionRange;
  v14 = (PKHardwareVersionRange *)v4[6];
  if (hardwareVersionRange && v14)
  {
    if (!-[PKHardwareVersionRange isEqual:](hardwareVersionRange, "isEqual:"))
      goto LABEL_37;
  }
  else if (hardwareVersionRange != v14)
  {
    goto LABEL_37;
  }
  relevantDateRange = self->_relevantDateRange;
  v16 = (PKDiscoveryRelevantDateRange *)v4[7];
  if (!relevantDateRange || !v16)
  {
    if (relevantDateRange == v16)
      goto LABEL_33;
LABEL_37:
    v17 = 0;
    goto LABEL_38;
  }
  if ((-[PKDiscoveryRelevantDateRange isEqual:](relevantDateRange, "isEqual:") & 1) == 0)
    goto LABEL_37;
LABEL_33:
  if (self->_status != v4[10] || self->_viewCount != v4[11] || self->_maxViewCount != v4[8])
    goto LABEL_37;
  v17 = self->_maxViewCountLargeCard == v4[9];
LABEL_38:

  return v17;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_ruleIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_triggerRuleIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_osVersionRange);
  objc_msgSend(v3, "safelyAddObject:", self->_hardwareVersionRange);
  objc_msgSend(v3, "safelyAddObject:", self->_relevantDateRange);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_version - v4 + 32 * v4;
  v6 = self->_status - v5 + 32 * v5;
  v7 = self->_viewCount - v6 + 32 * v6;
  v8 = self->_maxViewCount - v7 + 32 * v7;
  v9 = self->_maxViewCountLargeCard - v8 + 32 * v8;

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDiscoveryObject identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("identifier"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%ld'; "),
    CFSTR("version"),
    -[PKDiscoveryObject version](self, "version"));
  -[PKDiscoveryObject ruleIdentifier](self, "ruleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("ruleIdentifier"), v5);

  -[PKDiscoveryObject triggerRuleIdentifier](self, "triggerRuleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("trigger"), v6);

  -[PKDiscoveryObject osVersionRange](self, "osVersionRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("osVersionRange"), v7);

  -[PKDiscoveryObject hardwareVersionRange](self, "hardwareVersionRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("hardwareVersionRange"), v8);

  -[PKDiscoveryObject relevantDateRange](self, "relevantDateRange");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("relevantDateRange"), v9);

  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%ld'; "), CFSTR("status"), -[PKDiscoveryObject status](self, "status"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%ld'; "),
    CFSTR("viewCount"),
    -[PKDiscoveryObject viewCount](self, "viewCount"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%ld'; "),
    CFSTR("maxViewCount"),
    -[PKDiscoveryObject maxViewCount](self, "maxViewCount"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%ld'; "),
    CFSTR("maxViewCountLargeCard"),
    -[PKDiscoveryObject maxViewCountLargeCard](self, "maxViewCountLargeCard"));
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v10 = (void *)objc_msgSend(v3, "copy");

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (NSString)ruleIdentifier
{
  return self->_ruleIdentifier;
}

- (void)setRuleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)triggerRuleIdentifier
{
  return self->_triggerRuleIdentifier;
}

- (void)setTriggerRuleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (PKOSVersionRequirementRange)osVersionRange
{
  return self->_osVersionRange;
}

- (void)setOsVersionRange:(id)a3
{
  objc_storeStrong((id *)&self->_osVersionRange, a3);
}

- (PKHardwareVersionRange)hardwareVersionRange
{
  return self->_hardwareVersionRange;
}

- (void)setHardwareVersionRange:(id)a3
{
  objc_storeStrong((id *)&self->_hardwareVersionRange, a3);
}

- (PKDiscoveryRelevantDateRange)relevantDateRange
{
  return self->_relevantDateRange;
}

- (void)setRelevantDateRange:(id)a3
{
  objc_storeStrong((id *)&self->_relevantDateRange, a3);
}

- (int64_t)maxViewCount
{
  return self->_maxViewCount;
}

- (void)setMaxViewCount:(int64_t)a3
{
  self->_maxViewCount = a3;
}

- (int64_t)maxViewCountLargeCard
{
  return self->_maxViewCountLargeCard;
}

- (void)setMaxViewCountLargeCard:(int64_t)a3
{
  self->_maxViewCountLargeCard = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (int64_t)viewCount
{
  return self->_viewCount;
}

- (void)setViewCount:(int64_t)a3
{
  self->_viewCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relevantDateRange, 0);
  objc_storeStrong((id *)&self->_hardwareVersionRange, 0);
  objc_storeStrong((id *)&self->_osVersionRange, 0);
  objc_storeStrong((id *)&self->_triggerRuleIdentifier, 0);
  objc_storeStrong((id *)&self->_ruleIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
