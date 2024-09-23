@implementation ICIAMMessageRule

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (int)type
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("Simple");
  if (a3 == 1)
  {
    v3 = CFSTR("Compound");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Simple")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Compound"));

  return v4;
}

- (int)ruleOperator
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_ruleOperator;
  else
    return 0;
}

- (void)setRuleOperator:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_ruleOperator = a3;
}

- (void)setHasRuleOperator:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRuleOperator
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)ruleOperatorAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("AND");
  if (a3 == 1)
  {
    v3 = CFSTR("OR");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsRuleOperator:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AND")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("OR"));

  return v4;
}

- (void)clearSubrules
{
  -[NSMutableArray removeAllObjects](self->_subrules, "removeAllObjects");
}

- (void)addSubrules:(id)a3
{
  id v4;
  NSMutableArray *subrules;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  subrules = self->_subrules;
  v8 = v4;
  if (!subrules)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_subrules;
    self->_subrules = v6;

    v4 = v8;
    subrules = self->_subrules;
  }
  -[NSMutableArray addObject:](subrules, "addObject:", v4);

}

- (unint64_t)subrulesCount
{
  return -[NSMutableArray count](self->_subrules, "count");
}

- (id)subrulesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_subrules, "objectAtIndex:", a3);
}

- (BOOL)hasTriggerCondition
{
  return self->_triggerCondition != 0;
}

- (BOOL)hasTriggerEventName
{
  return self->_triggerEventName != 0;
}

- (BOOL)hasRequiredApplicationContextBundleIdentifier
{
  return self->_requiredApplicationContextBundleIdentifier != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ICIAMMessageRule;
  -[ICIAMMessageRule description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICIAMMessageRule dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  char has;
  int type;
  __CFString *v8;
  int ruleOperator;
  __CFString *v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  ICIAMTriggerCondition *triggerCondition;
  void *v19;
  NSString *triggerEventName;
  NSString *requiredApplicationContextBundleIdentifier;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    type = self->_type;
    if (type)
    {
      if (type == 1)
      {
        v8 = CFSTR("Compound");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v8 = CFSTR("Simple");
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("type"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    ruleOperator = self->_ruleOperator;
    if (ruleOperator)
    {
      if (ruleOperator == 1)
      {
        v10 = CFSTR("OR");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_ruleOperator);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v10 = CFSTR("AND");
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("ruleOperator"));

  }
  if (-[NSMutableArray count](self->_subrules, "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_subrules, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = self->_subrules;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "dictionaryRepresentation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v14);
    }

    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("subrules"));
  }
  triggerCondition = self->_triggerCondition;
  if (triggerCondition)
  {
    -[ICIAMTriggerCondition dictionaryRepresentation](triggerCondition, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("triggerCondition"));

  }
  triggerEventName = self->_triggerEventName;
  if (triggerEventName)
    objc_msgSend(v4, "setObject:forKey:", triggerEventName, CFSTR("triggerEventName"));
  requiredApplicationContextBundleIdentifier = self->_requiredApplicationContextBundleIdentifier;
  if (requiredApplicationContextBundleIdentifier)
    objc_msgSend(v4, "setObject:forKey:", requiredApplicationContextBundleIdentifier, CFSTR("requiredApplicationContextBundleIdentifier"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ICIAMMessageRuleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_identifier)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteInt32Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_subrules;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if (self->_triggerCondition)
    PBDataWriterWriteSubmessage();
  if (self->_triggerEventName)
    PBDataWriterWriteStringField();
  if (self->_requiredApplicationContextBundleIdentifier)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v11 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    v4 = v11;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_type;
    *((_BYTE *)v4 + 60) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_ruleOperator;
    *((_BYTE *)v4 + 60) |= 1u;
  }
  if (-[ICIAMMessageRule subrulesCount](self, "subrulesCount"))
  {
    objc_msgSend(v11, "clearSubrules");
    v6 = -[ICIAMMessageRule subrulesCount](self, "subrulesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[ICIAMMessageRule subrulesAtIndex:](self, "subrulesAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addSubrules:", v9);

      }
    }
  }
  if (self->_triggerCondition)
    objc_msgSend(v11, "setTriggerCondition:");
  v10 = v11;
  if (self->_triggerEventName)
  {
    objc_msgSend(v11, "setTriggerEventName:");
    v10 = v11;
  }
  if (self->_requiredApplicationContextBundleIdentifier)
  {
    objc_msgSend(v11, "setRequiredApplicationContextBundleIdentifier:");
    v10 = v11;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_type;
    *(_BYTE *)(v5 + 60) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_ruleOperator;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = self->_subrules;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v22);
        objc_msgSend((id)v5, "addSubrules:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  v15 = -[ICIAMTriggerCondition copyWithZone:](self->_triggerCondition, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v15;

  v17 = -[NSString copyWithZone:](self->_triggerEventName, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v17;

  v19 = -[NSString copyWithZone:](self->_requiredApplicationContextBundleIdentifier, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v19;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  NSMutableArray *subrules;
  ICIAMTriggerCondition *triggerCondition;
  NSString *triggerEventName;
  NSString *requiredApplicationContextBundleIdentifier;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_type != *((_DWORD *)v4 + 14))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
LABEL_22:
    v10 = 0;
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_ruleOperator != *((_DWORD *)v4 + 6))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_22;
  }
  subrules = self->_subrules;
  if ((unint64_t)subrules | *((_QWORD *)v4 + 4)
    && !-[NSMutableArray isEqual:](subrules, "isEqual:"))
  {
    goto LABEL_22;
  }
  triggerCondition = self->_triggerCondition;
  if ((unint64_t)triggerCondition | *((_QWORD *)v4 + 5))
  {
    if (!-[ICIAMTriggerCondition isEqual:](triggerCondition, "isEqual:"))
      goto LABEL_22;
  }
  triggerEventName = self->_triggerEventName;
  if ((unint64_t)triggerEventName | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](triggerEventName, "isEqual:"))
      goto LABEL_22;
  }
  requiredApplicationContextBundleIdentifier = self->_requiredApplicationContextBundleIdentifier;
  if ((unint64_t)requiredApplicationContextBundleIdentifier | *((_QWORD *)v4 + 2))
    v10 = -[NSString isEqual:](requiredApplicationContextBundleIdentifier, "isEqual:");
  else
    v10 = 1;
LABEL_23:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  NSUInteger v8;

  v3 = -[NSString hash](self->_identifier, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = 2654435761 * self->_type;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_ruleOperator;
LABEL_6:
  v6 = v4 ^ v3 ^ v5 ^ -[NSMutableArray hash](self->_subrules, "hash");
  v7 = -[ICIAMTriggerCondition hash](self->_triggerCondition, "hash");
  v8 = v7 ^ -[NSString hash](self->_triggerEventName, "hash");
  return v6 ^ v8 ^ -[NSString hash](self->_requiredApplicationContextBundleIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  ICIAMTriggerCondition *triggerCondition;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 1))
    -[ICIAMMessageRule setIdentifier:](self, "setIdentifier:");
  v5 = *((_BYTE *)v4 + 60);
  if ((v5 & 2) != 0)
  {
    self->_type = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 60);
  }
  if ((v5 & 1) != 0)
  {
    self->_ruleOperator = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = *((id *)v4 + 4);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[ICIAMMessageRule addSubrules:](self, "addSubrules:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  triggerCondition = self->_triggerCondition;
  v12 = *((_QWORD *)v4 + 5);
  if (triggerCondition)
  {
    if (v12)
      -[ICIAMTriggerCondition mergeFrom:](triggerCondition, "mergeFrom:");
  }
  else if (v12)
  {
    -[ICIAMMessageRule setTriggerCondition:](self, "setTriggerCondition:");
  }
  if (*((_QWORD *)v4 + 6))
    -[ICIAMMessageRule setTriggerEventName:](self, "setTriggerEventName:");
  if (*((_QWORD *)v4 + 2))
    -[ICIAMMessageRule setRequiredApplicationContextBundleIdentifier:](self, "setRequiredApplicationContextBundleIdentifier:");

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSMutableArray)subrules
{
  return self->_subrules;
}

- (void)setSubrules:(id)a3
{
  objc_storeStrong((id *)&self->_subrules, a3);
}

- (ICIAMTriggerCondition)triggerCondition
{
  return self->_triggerCondition;
}

- (void)setTriggerCondition:(id)a3
{
  objc_storeStrong((id *)&self->_triggerCondition, a3);
}

- (NSString)triggerEventName
{
  return self->_triggerEventName;
}

- (void)setTriggerEventName:(id)a3
{
  objc_storeStrong((id *)&self->_triggerEventName, a3);
}

- (NSString)requiredApplicationContextBundleIdentifier
{
  return self->_requiredApplicationContextBundleIdentifier;
}

- (void)setRequiredApplicationContextBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requiredApplicationContextBundleIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerEventName, 0);
  objc_storeStrong((id *)&self->_triggerCondition, 0);
  objc_storeStrong((id *)&self->_subrules, 0);
  objc_storeStrong((id *)&self->_requiredApplicationContextBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (Class)subrulesType
{
  return (Class)objc_opt_class();
}

@end
