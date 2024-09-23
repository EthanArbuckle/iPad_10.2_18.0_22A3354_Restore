@implementation ATXPBProactiveSuggestionUISpecification

- (void)setTitle:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 56), a2);
}

- (void)setSubtitle:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 48), a2);
}

- (uint64_t)setShouldClearOnEngagement:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 68) |= 0x40u;
    *(_BYTE *)(result + 67) = a2;
  }
  return result;
}

- (void)setReason:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)setPreferredLayoutConfigs:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (uint64_t)setPredictionReasons:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 68) |= 4u;
    *(_QWORD *)(result + 24) = a2;
  }
  return result;
}

- (uint64_t)setAllowedOnSpotlight:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 68) |= 0x20u;
    *(_BYTE *)(result + 66) = a2;
  }
  return result;
}

- (uint64_t)setAllowedOnLockscreen:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 68) |= 0x10u;
    *(_BYTE *)(result + 65) = a2;
  }
  return result;
}

- (uint64_t)setAllowedOnHomeScreen:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 68) |= 8u;
    *(_BYTE *)(result + 64) = a2;
  }
  return result;
}

- (uint64_t)preferredLayoutConfigs
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (void)addPreferredLayoutConfigs:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)title
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

- (BOOL)shouldClearOnEngagement
{
  if (result)
    return *(_BYTE *)(result + 67) != 0;
  return result;
}

- (uint64_t)reason
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

- (uint64_t)predictionReasons
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (uint64_t)hasContextStartDate
{
  if (result)
    return (*(unsigned __int8 *)(result + 68) >> 1) & 1;
  return result;
}

- (uint64_t)hasContextEndDate
{
  if (result)
    return *(_BYTE *)(result + 68) & 1;
  return result;
}

- (BOOL)allowedOnSpotlight
{
  if (result)
    return *(_BYTE *)(result + 66) != 0;
  return result;
}

- (BOOL)allowedOnLockscreen
{
  if (result)
    return *(_BYTE *)(result + 65) != 0;
  return result;
}

- (BOOL)allowedOnHomeScreen
{
  if (result)
    return *(_BYTE *)(result + 64) != 0;
  return result;
}

- (uint64_t)subtitle
{
  if (result)
    return *(_QWORD *)(result + 48);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_preferredLayoutConfigs, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char has;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_title)
    PBDataWriterWriteStringField();
  if (self->_subtitle)
    PBDataWriterWriteStringField();
  if (self->_reason)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_preferredLayoutConfigs;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_16:
      if ((has & 0x20) == 0)
        goto LABEL_17;
      goto LABEL_25;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_17:
    if ((has & 0x40) == 0)
      goto LABEL_18;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_18:
    if ((has & 4) == 0)
      goto LABEL_19;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_19:
    if ((has & 2) == 0)
      goto LABEL_20;
LABEL_28:
    PBDataWriterWriteDoubleField();
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_27:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_28;
LABEL_20:
  if ((has & 1) != 0)
LABEL_21:
    PBDataWriterWriteDoubleField();
LABEL_22:

}

- (BOOL)hasTitle
{
  if (result)
    return *(_QWORD *)(result + 56) != 0;
  return result;
}

- (BOOL)hasSubtitle
{
  if (result)
    return *(_QWORD *)(result + 48) != 0;
  return result;
}

- (BOOL)hasReason
{
  if (result)
    return *(_QWORD *)(result + 40) != 0;
  return result;
}

- (uint64_t)clearPreferredLayoutConfigs
{
  if (result)
    return objc_msgSend(*(id *)(result + 32), "removeAllObjects");
  return result;
}

- (uint64_t)preferredLayoutConfigsCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 32), "count");
  return result;
}

- (id)preferredLayoutConfigsAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[4], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (uint64_t)preferredLayoutConfigsType
{
  objc_opt_self();
  return objc_opt_class();
}

- (uint64_t)setHasAllowedOnLockscreen:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 16;
    else
      v2 = 0;
    *(_BYTE *)(result + 68) = *(_BYTE *)(result + 68) & 0xEF | v2;
  }
  return result;
}

- (uint64_t)hasAllowedOnLockscreen
{
  if (result)
    return (*(unsigned __int8 *)(result + 68) >> 4) & 1;
  return result;
}

- (uint64_t)setHasAllowedOnHomeScreen:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 8;
    else
      v2 = 0;
    *(_BYTE *)(result + 68) = *(_BYTE *)(result + 68) & 0xF7 | v2;
  }
  return result;
}

- (uint64_t)hasAllowedOnHomeScreen
{
  if (result)
    return (*(unsigned __int8 *)(result + 68) >> 3) & 1;
  return result;
}

- (uint64_t)setHasAllowedOnSpotlight:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 32;
    else
      v2 = 0;
    *(_BYTE *)(result + 68) = *(_BYTE *)(result + 68) & 0xDF | v2;
  }
  return result;
}

- (uint64_t)hasAllowedOnSpotlight
{
  if (result)
    return (*(unsigned __int8 *)(result + 68) >> 5) & 1;
  return result;
}

- (uint64_t)setHasShouldClearOnEngagement:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 64;
    else
      v2 = 0;
    *(_BYTE *)(result + 68) = *(_BYTE *)(result + 68) & 0xBF | v2;
  }
  return result;
}

- (uint64_t)hasShouldClearOnEngagement
{
  if (result)
    return (*(unsigned __int8 *)(result + 68) >> 6) & 1;
  return result;
}

- (uint64_t)setHasPredictionReasons:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 4;
    else
      v2 = 0;
    *(_BYTE *)(result + 68) = *(_BYTE *)(result + 68) & 0xFB | v2;
  }
  return result;
}

- (uint64_t)hasPredictionReasons
{
  if (result)
    return (*(unsigned __int8 *)(result + 68) >> 2) & 1;
  return result;
}

- (uint64_t)setContextStartDate:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 68) |= 2u;
    *(double *)(result + 16) = a2;
  }
  return result;
}

- (uint64_t)setHasContextStartDate:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 2;
    else
      v2 = 0;
    *(_BYTE *)(result + 68) = *(_BYTE *)(result + 68) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)setContextEndDate:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 68) |= 1u;
    *(double *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasContextEndDate:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 68) = *(_BYTE *)(result + 68) & 0xFE | a2;
  return result;
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
  v8.super_class = (Class)ATXPBProactiveSuggestionUISpecification;
  -[ATXPBProactiveSuggestionUISpecification description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBProactiveSuggestionUISpecification dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *title;
  NSString *subtitle;
  NSString *reason;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  char has;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("title"));
  subtitle = self->_subtitle;
  if (subtitle)
    objc_msgSend(v4, "setObject:forKey:", subtitle, CFSTR("subtitle"));
  reason = self->_reason;
  if (reason)
    objc_msgSend(v4, "setObject:forKey:", reason, CFSTR("reason"));
  if (-[NSMutableArray count](self->_preferredLayoutConfigs, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_preferredLayoutConfigs, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = self->_preferredLayoutConfigs;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v24);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("preferredLayoutConfigs"));
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowedOnLockscreen);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("allowedOnLockscreen"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_18:
      if ((has & 0x20) == 0)
        goto LABEL_19;
      goto LABEL_27;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowedOnHomeScreen, (_QWORD)v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("allowedOnHomeScreen"));

  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_19:
    if ((has & 0x40) == 0)
      goto LABEL_20;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowedOnSpotlight, (_QWORD)v24);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("allowedOnSpotlight"));

  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_20:
    if ((has & 4) == 0)
      goto LABEL_21;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldClearOnEngagement, (_QWORD)v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("shouldClearOnEngagement"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_21:
    if ((has & 2) == 0)
      goto LABEL_22;
LABEL_30:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_contextStartDate, (_QWORD)v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("contextStartDate"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      return v4;
    goto LABEL_23;
  }
LABEL_29:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_predictionReasons, (_QWORD)v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("predictionReasons"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_30;
LABEL_22:
  if ((has & 1) != 0)
  {
LABEL_23:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_contextEndDate, (_QWORD)v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("contextEndDate"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBProactiveSuggestionUISpecificationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(uint64_t)a1
{
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  id *v12;

  v3 = a2;
  if (!a1)
    goto LABEL_25;
  v4 = *(void **)(a1 + 56);
  v12 = v3;
  if (v4)
    -[ATXPBProactiveSuggestionUISpecification setTitle:]((uint64_t)v3, v4);
  v5 = *(void **)(a1 + 48);
  if (v5)
    -[ATXPBProactiveSuggestionUISpecification setSubtitle:]((uint64_t)v12, v5);
  v6 = *(void **)(a1 + 40);
  if (v6)
    -[ATXPBProactiveSuggestionUISpecification setReason:]((uint64_t)v12, v6);
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    if (v12)
      objc_msgSend(v12[4], "removeAllObjects");
    v7 = objc_msgSend(*(id *)(a1 + 32), "count");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
      {
        -[ATXPBProactiveSuggestionUISpecification preferredLayoutConfigsAtIndex:]((id *)a1, i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXPBProactiveSuggestionUISpecification addPreferredLayoutConfigs:]((uint64_t)v12, v10);

      }
    }
  }
  v11 = *(_BYTE *)(a1 + 68);
  if ((v11 & 0x10) != 0)
  {
    v3 = v12;
    *((_BYTE *)v12 + 65) = *(_BYTE *)(a1 + 65);
    *((_BYTE *)v12 + 68) |= 0x10u;
    v11 = *(_BYTE *)(a1 + 68);
    if ((v11 & 8) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  v3 = v12;
  if ((*(_BYTE *)(a1 + 68) & 8) != 0)
  {
LABEL_18:
    *((_BYTE *)v3 + 64) = *(_BYTE *)(a1 + 64);
    *((_BYTE *)v3 + 68) |= 8u;
    v11 = *(_BYTE *)(a1 + 68);
  }
LABEL_19:
  if ((v11 & 0x20) != 0)
  {
    *((_BYTE *)v3 + 66) = *(_BYTE *)(a1 + 66);
    *((_BYTE *)v3 + 68) |= 0x20u;
    v11 = *(_BYTE *)(a1 + 68);
    if ((v11 & 0x40) == 0)
    {
LABEL_21:
      if ((v11 & 4) == 0)
        goto LABEL_22;
      goto LABEL_28;
    }
  }
  else if ((v11 & 0x40) == 0)
  {
    goto LABEL_21;
  }
  *((_BYTE *)v3 + 67) = *(_BYTE *)(a1 + 67);
  *((_BYTE *)v3 + 68) |= 0x40u;
  v11 = *(_BYTE *)(a1 + 68);
  if ((v11 & 4) == 0)
  {
LABEL_22:
    if ((v11 & 2) == 0)
      goto LABEL_23;
LABEL_29:
    v3[2] = *(id *)(a1 + 16);
    *((_BYTE *)v3 + 68) |= 2u;
    if ((*(_BYTE *)(a1 + 68) & 1) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_28:
  v3[3] = *(id *)(a1 + 24);
  *((_BYTE *)v3 + 68) |= 4u;
  v11 = *(_BYTE *)(a1 + 68);
  if ((v11 & 2) != 0)
    goto LABEL_29;
LABEL_23:
  if ((v11 & 1) != 0)
  {
LABEL_24:
    v3[1] = *(id *)(a1 + 8);
    *((_BYTE *)v3 + 68) |= 1u;
  }
LABEL_25:

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
  uint64_t i;
  void *v17;
  char has;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v6;

  v8 = -[NSString copyWithZone:](self->_subtitle, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v8;

  v10 = -[NSString copyWithZone:](self->_reason, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = self->_preferredLayoutConfigs;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v20);
        -[ATXPBProactiveSuggestionUISpecification addPreferredLayoutConfigs:](v5, v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 65) = self->_allowedOnLockscreen;
    *(_BYTE *)(v5 + 68) |= 0x10u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_10:
      if ((has & 0x20) == 0)
        goto LABEL_11;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_10;
  }
  *(_BYTE *)(v5 + 64) = self->_allowedOnHomeScreen;
  *(_BYTE *)(v5 + 68) |= 8u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_20;
  }
LABEL_19:
  *(_BYTE *)(v5 + 66) = self->_allowedOnSpotlight;
  *(_BYTE *)(v5 + 68) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_12:
    if ((has & 4) == 0)
      goto LABEL_13;
    goto LABEL_21;
  }
LABEL_20:
  *(_BYTE *)(v5 + 67) = self->_shouldClearOnEngagement;
  *(_BYTE *)(v5 + 68) |= 0x40u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 2) == 0)
      goto LABEL_14;
LABEL_22:
    *(double *)(v5 + 16) = self->_contextStartDate;
    *(_BYTE *)(v5 + 68) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      return (id)v5;
    goto LABEL_15;
  }
LABEL_21:
  *(_QWORD *)(v5 + 24) = self->_predictionReasons;
  *(_BYTE *)(v5 + 68) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_22;
LABEL_14:
  if ((has & 1) != 0)
  {
LABEL_15:
    *(double *)(v5 + 8) = self->_contextEndDate;
    *(_BYTE *)(v5 + 68) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *title;
  NSString *subtitle;
  NSString *reason;
  NSMutableArray *preferredLayoutConfigs;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_56;
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](title, "isEqual:"))
      goto LABEL_56;
  }
  subtitle = self->_subtitle;
  if ((unint64_t)subtitle | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](subtitle, "isEqual:"))
      goto LABEL_56;
  }
  reason = self->_reason;
  if ((unint64_t)reason | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](reason, "isEqual:"))
      goto LABEL_56;
  }
  preferredLayoutConfigs = self->_preferredLayoutConfigs;
  if ((unint64_t)preferredLayoutConfigs | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](preferredLayoutConfigs, "isEqual:"))
      goto LABEL_56;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 0x10) == 0)
      goto LABEL_56;
    if (self->_allowedOnLockscreen)
    {
      if (!*((_BYTE *)v4 + 65))
        goto LABEL_56;
    }
    else if (*((_BYTE *)v4 + 65))
    {
      goto LABEL_56;
    }
  }
  else if ((*((_BYTE *)v4 + 68) & 0x10) != 0)
  {
    goto LABEL_56;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 8) == 0)
      goto LABEL_56;
    if (self->_allowedOnHomeScreen)
    {
      if (!*((_BYTE *)v4 + 64))
        goto LABEL_56;
    }
    else if (*((_BYTE *)v4 + 64))
    {
      goto LABEL_56;
    }
  }
  else if ((*((_BYTE *)v4 + 68) & 8) != 0)
  {
    goto LABEL_56;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 0x20) == 0)
      goto LABEL_56;
    if (self->_allowedOnSpotlight)
    {
      if (!*((_BYTE *)v4 + 66))
        goto LABEL_56;
    }
    else if (*((_BYTE *)v4 + 66))
    {
      goto LABEL_56;
    }
  }
  else if ((*((_BYTE *)v4 + 68) & 0x20) != 0)
  {
    goto LABEL_56;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 0x40) != 0)
    {
      if (self->_shouldClearOnEngagement)
      {
        if (!*((_BYTE *)v4 + 67))
          goto LABEL_56;
        goto LABEL_42;
      }
      if (!*((_BYTE *)v4 + 67))
        goto LABEL_42;
    }
LABEL_56:
    v9 = 0;
    goto LABEL_57;
  }
  if ((*((_BYTE *)v4 + 68) & 0x40) != 0)
    goto LABEL_56;
LABEL_42:
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 4) == 0 || self->_predictionReasons != *((_QWORD *)v4 + 3))
      goto LABEL_56;
  }
  else if ((*((_BYTE *)v4 + 68) & 4) != 0)
  {
    goto LABEL_56;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) == 0 || self->_contextStartDate != *((double *)v4 + 2))
      goto LABEL_56;
  }
  else if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
    goto LABEL_56;
  }
  v9 = (*((_BYTE *)v4 + 68) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_contextEndDate != *((double *)v4 + 1))
      goto LABEL_56;
    v9 = 1;
  }
LABEL_57:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  char has;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  double contextStartDate;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  unint64_t v15;
  double contextEndDate;
  double v17;
  long double v18;
  double v19;
  NSUInteger v21;
  NSUInteger v22;
  NSUInteger v23;

  v23 = -[NSString hash](self->_title, "hash");
  v22 = -[NSString hash](self->_subtitle, "hash");
  v21 = -[NSString hash](self->_reason, "hash");
  v3 = -[NSMutableArray hash](self->_preferredLayoutConfigs, "hash");
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v5 = 2654435761 * self->_allowedOnLockscreen;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v6 = 2654435761 * self->_allowedOnHomeScreen;
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    v7 = 2654435761 * self->_allowedOnSpotlight;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_5:
    v8 = 2654435761 * self->_shouldClearOnEngagement;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_15:
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_7;
LABEL_16:
    v14 = 0;
    goto LABEL_19;
  }
LABEL_14:
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_15;
LABEL_6:
  v9 = 2654435761u * self->_predictionReasons;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_16;
LABEL_7:
  contextStartDate = self->_contextStartDate;
  v11 = -contextStartDate;
  if (contextStartDate >= 0.0)
    v11 = self->_contextStartDate;
  v12 = floor(v11 + 0.5);
  v13 = (v11 - v12) * 1.84467441e19;
  v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0)
      v14 += (unint64_t)v13;
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
LABEL_19:
  if ((has & 1) != 0)
  {
    contextEndDate = self->_contextEndDate;
    v17 = -contextEndDate;
    if (contextEndDate >= 0.0)
      v17 = self->_contextEndDate;
    v18 = floor(v17 + 0.5);
    v19 = (v17 - v18) * 1.84467441e19;
    v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0)
        v15 += (unint64_t)v19;
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    v15 = 0;
  }
  return v22 ^ v23 ^ v21 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v14 ^ v15;
}

- (void)mergeFrom:(uint64_t)a1
{
  _QWORD *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  char v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!a1)
    goto LABEL_23;
  v5 = (void *)v3[7];
  if (v5)
    objc_storeStrong((id *)(a1 + 56), v5);
  v6 = (void *)*((_QWORD *)v4 + 6);
  if (v6)
    objc_storeStrong((id *)(a1 + 48), v6);
  v7 = (void *)*((_QWORD *)v4 + 5);
  if (v7)
    objc_storeStrong((id *)(a1 + 40), v7);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = *((id *)v4 + 4);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        -[ATXPBProactiveSuggestionUISpecification addPreferredLayoutConfigs:](a1, *(void **)(*((_QWORD *)&v14 + 1) + 8 * i));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  v13 = *((_BYTE *)v4 + 68);
  if ((v13 & 0x10) != 0)
  {
    *(_BYTE *)(a1 + 65) = *((_BYTE *)v4 + 65);
    *(_BYTE *)(a1 + 68) |= 0x10u;
    v13 = *((_BYTE *)v4 + 68);
    if ((v13 & 8) == 0)
    {
LABEL_17:
      if ((v13 & 0x20) == 0)
        goto LABEL_18;
      goto LABEL_26;
    }
  }
  else if ((*((_BYTE *)v4 + 68) & 8) == 0)
  {
    goto LABEL_17;
  }
  *(_BYTE *)(a1 + 64) = *((_BYTE *)v4 + 64);
  *(_BYTE *)(a1 + 68) |= 8u;
  v13 = *((_BYTE *)v4 + 68);
  if ((v13 & 0x20) == 0)
  {
LABEL_18:
    if ((v13 & 0x40) == 0)
      goto LABEL_19;
    goto LABEL_27;
  }
LABEL_26:
  *(_BYTE *)(a1 + 66) = *((_BYTE *)v4 + 66);
  *(_BYTE *)(a1 + 68) |= 0x20u;
  v13 = *((_BYTE *)v4 + 68);
  if ((v13 & 0x40) == 0)
  {
LABEL_19:
    if ((v13 & 4) == 0)
      goto LABEL_20;
    goto LABEL_28;
  }
LABEL_27:
  *(_BYTE *)(a1 + 67) = *((_BYTE *)v4 + 67);
  *(_BYTE *)(a1 + 68) |= 0x40u;
  v13 = *((_BYTE *)v4 + 68);
  if ((v13 & 4) == 0)
  {
LABEL_20:
    if ((v13 & 2) == 0)
      goto LABEL_21;
LABEL_29:
    *(_QWORD *)(a1 + 16) = *((_QWORD *)v4 + 2);
    *(_BYTE *)(a1 + 68) |= 2u;
    if ((*((_BYTE *)v4 + 68) & 1) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_28:
  *(_QWORD *)(a1 + 24) = *((_QWORD *)v4 + 3);
  *(_BYTE *)(a1 + 68) |= 4u;
  v13 = *((_BYTE *)v4 + 68);
  if ((v13 & 2) != 0)
    goto LABEL_29;
LABEL_21:
  if ((v13 & 1) != 0)
  {
LABEL_22:
    *(_QWORD *)(a1 + 8) = *((_QWORD *)v4 + 1);
    *(_BYTE *)(a1 + 68) |= 1u;
  }
LABEL_23:

}

- (double)contextStartDate
{
  if (a1)
    return *(double *)(a1 + 16);
  else
    return 0.0;
}

- (double)contextEndDate
{
  if (a1)
    return *(double *)(a1 + 8);
  else
    return 0.0;
}

@end
