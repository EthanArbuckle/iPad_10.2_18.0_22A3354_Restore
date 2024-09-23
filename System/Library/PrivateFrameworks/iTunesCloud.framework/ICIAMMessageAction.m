@implementation ICIAMMessageAction

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasDisplayText
{
  return self->_displayText != 0;
}

- (BOOL)hasURL
{
  return self->_uRL != 0;
}

- (BOOL)requiresDelegate
{
  return (*(_BYTE *)&self->_has & 2) != 0 && self->_requiresDelegate;
}

- (void)setRequiresDelegate:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_requiresDelegate = a3;
}

- (void)setHasRequiresDelegate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRequiresDelegate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearActionParameters
{
  -[NSMutableArray removeAllObjects](self->_actionParameters, "removeAllObjects");
}

- (void)addActionParameters:(id)a3
{
  id v4;
  NSMutableArray *actionParameters;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  actionParameters = self->_actionParameters;
  v8 = v4;
  if (!actionParameters)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_actionParameters;
    self->_actionParameters = v6;

    v4 = v8;
    actionParameters = self->_actionParameters;
  }
  -[NSMutableArray addObject:](actionParameters, "addObject:", v4);

}

- (unint64_t)actionParametersCount
{
  return -[NSMutableArray count](self->_actionParameters, "count");
}

- (id)actionParametersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_actionParameters, "objectAtIndex:", a3);
}

- (BOOL)hasClickEvent
{
  return self->_clickEvent != 0;
}

- (int)messageRemovalPolicy
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_messageRemovalPolicy;
  else
    return 0;
}

- (void)setMessageRemovalPolicy:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_messageRemovalPolicy = a3;
}

- (void)setHasMessageRemovalPolicy:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMessageRemovalPolicy
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)messageRemovalPolicyAsString:(int)a3
{
  if (a3 < 3)
    return off_1E438CBA0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMessageRemovalPolicy:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Local")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Global")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)ICIAMMessageAction;
  -[ICIAMMessageAction description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICIAMMessageAction dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *displayText;
  NSString *uRL;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  ICIAMMetricEvent *clickEvent;
  void *v17;
  uint64_t messageRemovalPolicy;
  __CFString *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  displayText = self->_displayText;
  if (displayText)
    objc_msgSend(v4, "setObject:forKey:", displayText, CFSTR("displayText"));
  uRL = self->_uRL;
  if (uRL)
    objc_msgSend(v4, "setObject:forKey:", uRL, CFSTR("URL"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requiresDelegate);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("requiresDelegate"));

  }
  if (-[NSMutableArray count](self->_actionParameters, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_actionParameters, "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = self->_actionParameters;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "dictionaryRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v12);
    }

    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("actionParameters"));
  }
  clickEvent = self->_clickEvent;
  if (clickEvent)
  {
    -[ICIAMMetricEvent dictionaryRepresentation](clickEvent, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("clickEvent"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    messageRemovalPolicy = self->_messageRemovalPolicy;
    if (messageRemovalPolicy >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_messageRemovalPolicy);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = off_1E438CBA0[messageRemovalPolicy];
    }
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("messageRemovalPolicy"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ICIAMMessageActionReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_identifier)
    PBDataWriterWriteStringField();
  if (self->_displayText)
    PBDataWriterWriteStringField();
  if (self->_uRL)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteBOOLField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_actionParameters;
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

  if (self->_clickEvent)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  _BYTE *v9;

  v4 = a3;
  v9 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    v4 = v9;
  }
  if (self->_displayText)
  {
    objc_msgSend(v9, "setDisplayText:");
    v4 = v9;
  }
  if (self->_uRL)
  {
    objc_msgSend(v9, "setURL:");
    v4 = v9;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[56] = self->_requiresDelegate;
    v4[60] |= 2u;
  }
  if (-[ICIAMMessageAction actionParametersCount](self, "actionParametersCount"))
  {
    objc_msgSend(v9, "clearActionParameters");
    v5 = -[ICIAMMessageAction actionParametersCount](self, "actionParametersCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[ICIAMMessageAction actionParametersAtIndex:](self, "actionParametersAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addActionParameters:", v8);

      }
    }
  }
  if (self->_clickEvent)
    objc_msgSend(v9, "setClickEvent:");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v9 + 10) = self->_messageRemovalPolicy;
    v9[60] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSString copyWithZone:](self->_displayText, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_uRL, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v5 + 56) = self->_requiresDelegate;
    *(_BYTE *)(v5 + 60) |= 2u;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = self->_actionParameters;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v16), "copyWithZone:", a3, (_QWORD)v21);
        objc_msgSend((id)v5, "addActionParameters:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

  v18 = -[ICIAMMetricEvent copyWithZone:](self->_clickEvent, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v18;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_messageRemovalPolicy;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  NSString *displayText;
  NSString *uRL;
  NSMutableArray *actionParameters;
  ICIAMMetricEvent *clickEvent;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_24;
  }
  displayText = self->_displayText;
  if ((unint64_t)displayText | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](displayText, "isEqual:"))
      goto LABEL_24;
  }
  uRL = self->_uRL;
  if ((unint64_t)uRL | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](uRL, "isEqual:"))
      goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) != 0)
    {
      if (self->_requiresDelegate)
      {
        if (!*((_BYTE *)v4 + 56))
          goto LABEL_24;
        goto LABEL_16;
      }
      if (!*((_BYTE *)v4 + 56))
        goto LABEL_16;
    }
LABEL_24:
    v10 = 0;
    goto LABEL_25;
  }
  if ((*((_BYTE *)v4 + 60) & 2) != 0)
    goto LABEL_24;
LABEL_16:
  actionParameters = self->_actionParameters;
  if ((unint64_t)actionParameters | *((_QWORD *)v4 + 1)
    && !-[NSMutableArray isEqual:](actionParameters, "isEqual:"))
  {
    goto LABEL_24;
  }
  clickEvent = self->_clickEvent;
  if ((unint64_t)clickEvent | *((_QWORD *)v4 + 2))
  {
    if (!-[ICIAMMetricEvent isEqual:](clickEvent, "isEqual:"))
      goto LABEL_24;
  }
  v10 = (*((_BYTE *)v4 + 60) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_messageRemovalPolicy != *((_DWORD *)v4 + 10))
      goto LABEL_24;
    v10 = 1;
  }
LABEL_25:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_displayText, "hash");
  v5 = -[NSString hash](self->_uRL, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v6 = 2654435761 * self->_requiresDelegate;
  else
    v6 = 0;
  v7 = -[NSMutableArray hash](self->_actionParameters, "hash");
  v8 = -[ICIAMMetricEvent hash](self->_clickEvent, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v9 = 2654435761 * self->_messageRemovalPolicy;
  else
    v9 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  ICIAMMetricEvent *clickEvent;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 4))
    -[ICIAMMessageAction setIdentifier:](self, "setIdentifier:");
  if (*((_QWORD *)v4 + 3))
    -[ICIAMMessageAction setDisplayText:](self, "setDisplayText:");
  if (*((_QWORD *)v4 + 6))
    -[ICIAMMessageAction setURL:](self, "setURL:");
  if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    self->_requiresDelegate = *((_BYTE *)v4 + 56);
    *(_BYTE *)&self->_has |= 2u;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *((id *)v4 + 1);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[ICIAMMessageAction addActionParameters:](self, "addActionParameters:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  clickEvent = self->_clickEvent;
  v11 = *((_QWORD *)v4 + 2);
  if (clickEvent)
  {
    if (v11)
      -[ICIAMMetricEvent mergeFrom:](clickEvent, "mergeFrom:");
  }
  else if (v11)
  {
    -[ICIAMMessageAction setClickEvent:](self, "setClickEvent:");
  }
  if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    self->_messageRemovalPolicy = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)displayText
{
  return self->_displayText;
}

- (void)setDisplayText:(id)a3
{
  objc_storeStrong((id *)&self->_displayText, a3);
}

- (NSString)uRL
{
  return self->_uRL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_uRL, a3);
}

- (NSMutableArray)actionParameters
{
  return self->_actionParameters;
}

- (void)setActionParameters:(id)a3
{
  objc_storeStrong((id *)&self->_actionParameters, a3);
}

- (ICIAMMetricEvent)clickEvent
{
  return self->_clickEvent;
}

- (void)setClickEvent:(id)a3
{
  objc_storeStrong((id *)&self->_clickEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uRL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayText, 0);
  objc_storeStrong((id *)&self->_clickEvent, 0);
  objc_storeStrong((id *)&self->_actionParameters, 0);
}

+ (Class)actionParametersType
{
  return (Class)objc_opt_class();
}

@end
