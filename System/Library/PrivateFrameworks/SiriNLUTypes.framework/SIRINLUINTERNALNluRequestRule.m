@implementation SIRINLUINTERNALNluRequestRule

- (BOOL)hasIdA
{
  return self->_idA != 0;
}

- (BOOL)hasLocaleId
{
  return self->_localeId != 0;
}

- (BOOL)hasDeviceType
{
  return self->_deviceType != 0;
}

- (BOOL)hasUserInterfaceIdiom
{
  return self->_userInterfaceIdiom != 0;
}

- (void)clearTurnInputRules
{
  -[NSMutableArray removeAllObjects](self->_turnInputRules, "removeAllObjects");
}

- (void)addTurnInputRules:(id)a3
{
  id v4;
  NSMutableArray *turnInputRules;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  turnInputRules = self->_turnInputRules;
  v8 = v4;
  if (!turnInputRules)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_turnInputRules;
    self->_turnInputRules = v6;

    v4 = v8;
    turnInputRules = self->_turnInputRules;
  }
  -[NSMutableArray addObject:](turnInputRules, "addObject:", v4);

}

- (unint64_t)turnInputRulesCount
{
  return -[NSMutableArray count](self->_turnInputRules, "count");
}

- (id)turnInputRulesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_turnInputRules, "objectAtIndex:", a3);
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
  v8.super_class = (Class)SIRINLUINTERNALNluRequestRule;
  -[SIRINLUINTERNALNluRequestRule description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALNluRequestRule dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *idA;
  NSString *localeId;
  NSString *deviceType;
  NSString *userInterfaceIdiom;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  idA = self->_idA;
  if (idA)
    objc_msgSend(v3, "setObject:forKey:", idA, CFSTR("id_a"));
  localeId = self->_localeId;
  if (localeId)
    objc_msgSend(v4, "setObject:forKey:", localeId, CFSTR("locale_id"));
  deviceType = self->_deviceType;
  if (deviceType)
    objc_msgSend(v4, "setObject:forKey:", deviceType, CFSTR("device_type"));
  userInterfaceIdiom = self->_userInterfaceIdiom;
  if (userInterfaceIdiom)
    objc_msgSend(v4, "setObject:forKey:", userInterfaceIdiom, CFSTR("user_interface_idiom"));
  if (-[NSMutableArray count](self->_turnInputRules, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_turnInputRules, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = self->_turnInputRules;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("turn_input_rules"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALNluRequestRuleReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_idA)
    PBDataWriterWriteStringField();
  if (self->_localeId)
    PBDataWriterWriteStringField();
  if (self->_deviceType)
    PBDataWriterWriteStringField();
  if (self->_userInterfaceIdiom)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_turnInputRules;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_idA)
    objc_msgSend(v8, "setIdA:");
  if (self->_localeId)
    objc_msgSend(v8, "setLocaleId:");
  if (self->_deviceType)
    objc_msgSend(v8, "setDeviceType:");
  if (self->_userInterfaceIdiom)
    objc_msgSend(v8, "setUserInterfaceIdiom:");
  if (-[SIRINLUINTERNALNluRequestRule turnInputRulesCount](self, "turnInputRulesCount"))
  {
    objc_msgSend(v8, "clearTurnInputRules");
    v4 = -[SIRINLUINTERNALNluRequestRule turnInputRulesCount](self, "turnInputRulesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[SIRINLUINTERNALNluRequestRule turnInputRulesAtIndex:](self, "turnInputRulesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addTurnInputRules:", v7);

      }
    }
  }

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
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_idA, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_localeId, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_deviceType, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  v12 = -[NSString copyWithZone:](self->_userInterfaceIdiom, "copyWithZone:", a3);
  v13 = (void *)v5[5];
  v5[5] = v12;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = self->_turnInputRules;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (_QWORD)v21);
        objc_msgSend(v5, "addTurnInputRules:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v16);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *idA;
  NSString *localeId;
  NSString *deviceType;
  NSString *userInterfaceIdiom;
  NSMutableArray *turnInputRules;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((idA = self->_idA, !((unint64_t)idA | v4[2])) || -[NSString isEqual:](idA, "isEqual:"))
    && ((localeId = self->_localeId, !((unint64_t)localeId | v4[3]))
     || -[NSString isEqual:](localeId, "isEqual:"))
    && ((deviceType = self->_deviceType, !((unint64_t)deviceType | v4[1]))
     || -[NSString isEqual:](deviceType, "isEqual:"))
    && ((userInterfaceIdiom = self->_userInterfaceIdiom, !((unint64_t)userInterfaceIdiom | v4[5]))
     || -[NSString isEqual:](userInterfaceIdiom, "isEqual:")))
  {
    turnInputRules = self->_turnInputRules;
    if ((unint64_t)turnInputRules | v4[4])
      v10 = -[NSMutableArray isEqual:](turnInputRules, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_idA, "hash");
  v4 = -[NSString hash](self->_localeId, "hash") ^ v3;
  v5 = -[NSString hash](self->_deviceType, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_userInterfaceIdiom, "hash");
  return v6 ^ -[NSMutableArray hash](self->_turnInputRules, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 2))
    -[SIRINLUINTERNALNluRequestRule setIdA:](self, "setIdA:");
  if (*((_QWORD *)v4 + 3))
    -[SIRINLUINTERNALNluRequestRule setLocaleId:](self, "setLocaleId:");
  if (*((_QWORD *)v4 + 1))
    -[SIRINLUINTERNALNluRequestRule setDeviceType:](self, "setDeviceType:");
  if (*((_QWORD *)v4 + 5))
    -[SIRINLUINTERNALNluRequestRule setUserInterfaceIdiom:](self, "setUserInterfaceIdiom:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[SIRINLUINTERNALNluRequestRule addTurnInputRules:](self, "addTurnInputRules:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSString)idA
{
  return self->_idA;
}

- (void)setIdA:(id)a3
{
  objc_storeStrong((id *)&self->_idA, a3);
}

- (NSString)localeId
{
  return self->_localeId;
}

- (void)setLocaleId:(id)a3
{
  objc_storeStrong((id *)&self->_localeId, a3);
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
  objc_storeStrong((id *)&self->_deviceType, a3);
}

- (NSString)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (void)setUserInterfaceIdiom:(id)a3
{
  objc_storeStrong((id *)&self->_userInterfaceIdiom, a3);
}

- (NSMutableArray)turnInputRules
{
  return self->_turnInputRules;
}

- (void)setTurnInputRules:(id)a3
{
  objc_storeStrong((id *)&self->_turnInputRules, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInterfaceIdiom, 0);
  objc_storeStrong((id *)&self->_turnInputRules, 0);
  objc_storeStrong((id *)&self->_localeId, 0);
  objc_storeStrong((id *)&self->_idA, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
}

+ (Class)turnInputRulesType
{
  return (Class)objc_opt_class();
}

@end
