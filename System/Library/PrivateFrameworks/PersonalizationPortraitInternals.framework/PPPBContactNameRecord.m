@implementation PPPBContactNameRecord

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setScore:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasScore
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSource:(unsigned __int8)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_source = a3;
}

- (void)setHasSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSource
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)sourceAsString:(unsigned __int8)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unsigned)StringAsSource:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[PPPBContactNameRecord StringAsSource:]", "PPPBContactNameRecord.m", 57, "0");
}

- (void)setChangeType:(unsigned __int8)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_changeType = a3;
}

- (void)setHasChangeType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasChangeType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)changeTypeAsString:(unsigned __int8)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unsigned)StringAsChangeType:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[PPPBContactNameRecord StringAsChangeType:]", "PPPBContactNameRecord.m", 79, "0");
}

- (BOOL)hasSourceIdentifier
{
  return self->_sourceIdentifier != 0;
}

- (BOOL)hasFirstName
{
  return self->_firstName != 0;
}

- (BOOL)hasPhoneticFirstName
{
  return self->_phoneticFirstName != 0;
}

- (BOOL)hasMiddleName
{
  return self->_middleName != 0;
}

- (BOOL)hasPhoneticMiddleName
{
  return self->_phoneticMiddleName != 0;
}

- (BOOL)hasLastName
{
  return self->_lastName != 0;
}

- (BOOL)hasPhoneticLastName
{
  return self->_phoneticLastName != 0;
}

- (BOOL)hasOrganizationName
{
  return self->_organizationName != 0;
}

- (BOOL)hasJobTitle
{
  return self->_jobTitle != 0;
}

- (BOOL)hasNickname
{
  return self->_nickname != 0;
}

- (void)clearRelatedNames
{
  -[NSMutableArray removeAllObjects](self->_relatedNames, "removeAllObjects");
}

- (void)addRelatedNames:(id)a3
{
  id v4;
  NSMutableArray *relatedNames;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  relatedNames = self->_relatedNames;
  v8 = v4;
  if (!relatedNames)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_relatedNames;
    self->_relatedNames = v6;

    v4 = v8;
    relatedNames = self->_relatedNames;
  }
  -[NSMutableArray addObject:](relatedNames, "addObject:", v4);

}

- (unint64_t)relatedNamesCount
{
  return -[NSMutableArray count](self->_relatedNames, "count");
}

- (id)relatedNamesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_relatedNames, "objectAtIndex:", a3);
}

- (void)clearStreetNames
{
  -[NSMutableArray removeAllObjects](self->_streetNames, "removeAllObjects");
}

- (void)addStreetNames:(id)a3
{
  id v4;
  NSMutableArray *streetNames;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  streetNames = self->_streetNames;
  v8 = v4;
  if (!streetNames)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_streetNames;
    self->_streetNames = v6;

    v4 = v8;
    streetNames = self->_streetNames;
  }
  -[NSMutableArray addObject:](streetNames, "addObject:", v4);

}

- (unint64_t)streetNamesCount
{
  return -[NSMutableArray count](self->_streetNames, "count");
}

- (id)streetNamesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_streetNames, "objectAtIndex:", a3);
}

- (void)clearCityNames
{
  -[NSMutableArray removeAllObjects](self->_cityNames, "removeAllObjects");
}

- (void)addCityNames:(id)a3
{
  id v4;
  NSMutableArray *cityNames;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  cityNames = self->_cityNames;
  v8 = v4;
  if (!cityNames)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_cityNames;
    self->_cityNames = v6;

    v4 = v8;
    cityNames = self->_cityNames;
  }
  -[NSMutableArray addObject:](cityNames, "addObject:", v4);

}

- (unint64_t)cityNamesCount
{
  return -[NSMutableArray count](self->_cityNames, "count");
}

- (id)cityNamesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_cityNames, "objectAtIndex:", a3);
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
  v8.super_class = (Class)PPPBContactNameRecord;
  -[PPPBContactNameRecord description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPPBContactNameRecord dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v7;
  void *v8;
  NSString *sourceIdentifier;
  NSString *firstName;
  NSString *phoneticFirstName;
  NSString *middleName;
  NSString *phoneticMiddleName;
  NSString *lastName;
  NSString *phoneticLastName;
  NSString *organizationName;
  NSString *jobTitle;
  NSString *nickname;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  NSMutableArray *streetNames;
  NSMutableArray *cityNames;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_score);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("score"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_source);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringValue");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("source"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_changeType);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("changeType"));

  }
LABEL_7:
  sourceIdentifier = self->_sourceIdentifier;
  if (sourceIdentifier)
    objc_msgSend(v4, "setObject:forKey:", sourceIdentifier, CFSTR("sourceIdentifier"));
  firstName = self->_firstName;
  if (firstName)
    objc_msgSend(v4, "setObject:forKey:", firstName, CFSTR("firstName"));
  phoneticFirstName = self->_phoneticFirstName;
  if (phoneticFirstName)
    objc_msgSend(v4, "setObject:forKey:", phoneticFirstName, CFSTR("phoneticFirstName"));
  middleName = self->_middleName;
  if (middleName)
    objc_msgSend(v4, "setObject:forKey:", middleName, CFSTR("middleName"));
  phoneticMiddleName = self->_phoneticMiddleName;
  if (phoneticMiddleName)
    objc_msgSend(v4, "setObject:forKey:", phoneticMiddleName, CFSTR("phoneticMiddleName"));
  lastName = self->_lastName;
  if (lastName)
    objc_msgSend(v4, "setObject:forKey:", lastName, CFSTR("lastName"));
  phoneticLastName = self->_phoneticLastName;
  if (phoneticLastName)
    objc_msgSend(v4, "setObject:forKey:", phoneticLastName, CFSTR("phoneticLastName"));
  organizationName = self->_organizationName;
  if (organizationName)
    objc_msgSend(v4, "setObject:forKey:", organizationName, CFSTR("organizationName"));
  jobTitle = self->_jobTitle;
  if (jobTitle)
    objc_msgSend(v4, "setObject:forKey:", jobTitle, CFSTR("jobTitle"));
  nickname = self->_nickname;
  if (nickname)
    objc_msgSend(v4, "setObject:forKey:", nickname, CFSTR("nickname"));
  if (-[NSMutableArray count](self->_relatedNames, "count"))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_relatedNames, "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v20 = self->_relatedNames;
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v33 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v32);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v25);

        }
        v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v22);
    }

    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("relatedNames"));
  }
  streetNames = self->_streetNames;
  if (streetNames)
    objc_msgSend(v4, "setObject:forKey:", streetNames, CFSTR("streetNames"));
  cityNames = self->_cityNames;
  if (cityNames)
    objc_msgSend(v4, "setObject:forKey:", cityNames, CFSTR("cityNames"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PPPBContactNameRecordReadFrom((uint64_t)self, (uint64_t)a3);
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
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_identifier)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_6:
    PBDataWriterWriteInt32Field();
LABEL_7:
  if (self->_sourceIdentifier)
    PBDataWriterWriteStringField();
  if (self->_firstName)
    PBDataWriterWriteStringField();
  if (self->_phoneticFirstName)
    PBDataWriterWriteStringField();
  if (self->_middleName)
    PBDataWriterWriteStringField();
  if (self->_phoneticMiddleName)
    PBDataWriterWriteStringField();
  if (self->_lastName)
    PBDataWriterWriteStringField();
  if (self->_phoneticLastName)
    PBDataWriterWriteStringField();
  if (self->_organizationName)
    PBDataWriterWriteStringField();
  if (self->_jobTitle)
    PBDataWriterWriteStringField();
  if (self->_nickname)
    PBDataWriterWriteStringField();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = self->_relatedNames;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v8);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = self->_streetNames;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteStringField();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v13);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = self->_cityNames;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        PBDataWriterWriteStringField();
      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v18);
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t k;
  void *v17;
  id v18;

  v4 = a3;
  v18 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    v4 = v18;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_score;
    *((_BYTE *)v4 + 144) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_BYTE *)v4 + 120) = self->_source;
  *((_BYTE *)v4 + 144) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_6:
    *((_BYTE *)v4 + 16) = self->_changeType;
    *((_BYTE *)v4 + 144) |= 2u;
  }
LABEL_7:
  if (self->_sourceIdentifier)
    objc_msgSend(v18, "setSourceIdentifier:");
  if (self->_firstName)
    objc_msgSend(v18, "setFirstName:");
  if (self->_phoneticFirstName)
    objc_msgSend(v18, "setPhoneticFirstName:");
  if (self->_middleName)
    objc_msgSend(v18, "setMiddleName:");
  if (self->_phoneticMiddleName)
    objc_msgSend(v18, "setPhoneticMiddleName:");
  if (self->_lastName)
    objc_msgSend(v18, "setLastName:");
  if (self->_phoneticLastName)
    objc_msgSend(v18, "setPhoneticLastName:");
  if (self->_organizationName)
    objc_msgSend(v18, "setOrganizationName:");
  if (self->_jobTitle)
    objc_msgSend(v18, "setJobTitle:");
  if (self->_nickname)
    objc_msgSend(v18, "setNickname:");
  if (-[PPPBContactNameRecord relatedNamesCount](self, "relatedNamesCount"))
  {
    objc_msgSend(v18, "clearRelatedNames");
    v6 = -[PPPBContactNameRecord relatedNamesCount](self, "relatedNamesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[PPPBContactNameRecord relatedNamesAtIndex:](self, "relatedNamesAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addRelatedNames:", v9);

      }
    }
  }
  if (-[PPPBContactNameRecord streetNamesCount](self, "streetNamesCount"))
  {
    objc_msgSend(v18, "clearStreetNames");
    v10 = -[PPPBContactNameRecord streetNamesCount](self, "streetNamesCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[PPPBContactNameRecord streetNamesAtIndex:](self, "streetNamesAtIndex:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addStreetNames:", v13);

      }
    }
  }
  if (-[PPPBContactNameRecord cityNamesCount](self, "cityNamesCount"))
  {
    objc_msgSend(v18, "clearCityNames");
    v14 = -[PPPBContactNameRecord cityNamesCount](self, "cityNamesCount");
    if (v14)
    {
      v15 = v14;
      for (k = 0; k != v15; ++k)
      {
        -[PPPBContactNameRecord cityNamesAtIndex:](self, "cityNamesAtIndex:", k);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addCityNames:", v17);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSMutableArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  NSMutableArray *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  void *v46;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_score;
    *(_BYTE *)(v5 + 144) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 120) = self->_source;
  *(_BYTE *)(v5 + 144) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    *(_BYTE *)(v5 + 16) = self->_changeType;
    *(_BYTE *)(v5 + 144) |= 2u;
  }
LABEL_5:
  v9 = -[NSString copyWithZone:](self->_sourceIdentifier, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v9;

  v11 = -[NSString copyWithZone:](self->_firstName, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  v13 = -[NSString copyWithZone:](self->_phoneticFirstName, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v13;

  v15 = -[NSString copyWithZone:](self->_middleName, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v15;

  v17 = -[NSString copyWithZone:](self->_phoneticMiddleName, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v17;

  v19 = -[NSString copyWithZone:](self->_lastName, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v19;

  v21 = -[NSString copyWithZone:](self->_phoneticLastName, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v21;

  v23 = -[NSString copyWithZone:](self->_organizationName, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v23;

  v25 = -[NSString copyWithZone:](self->_jobTitle, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v25;

  v27 = -[NSString copyWithZone:](self->_nickname, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v27;

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v29 = self->_relatedNames;
  v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v57 != v32)
          objc_enumerationMutation(v29);
        v34 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRelatedNames:", v34);

      }
      v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    }
    while (v31);
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v35 = self->_streetNames;
  v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v53 != v38)
          objc_enumerationMutation(v35);
        v40 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addStreetNames:", v40);

      }
      v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
    }
    while (v37);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v41 = self->_cityNames;
  v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v49;
    do
    {
      for (k = 0; k != v43; ++k)
      {
        if (*(_QWORD *)v49 != v44)
          objc_enumerationMutation(v41);
        v46 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v48);
        objc_msgSend((id)v5, "addCityNames:", v46);

      }
      v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
    }
    while (v43);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  NSString *identifier;
  NSString *sourceIdentifier;
  NSString *firstName;
  NSString *phoneticFirstName;
  NSString *middleName;
  NSString *phoneticMiddleName;
  NSString *lastName;
  NSString *phoneticLastName;
  NSString *organizationName;
  NSString *jobTitle;
  NSString *nickname;
  NSMutableArray *relatedNames;
  NSMutableArray *streetNames;
  NSMutableArray *cityNames;
  char v19;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_45;
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[144] & 1) == 0 || self->_score != *((double *)v4 + 1))
      goto LABEL_45;
  }
  else if ((v4[144] & 1) != 0)
  {
LABEL_45:
    v19 = 0;
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[144] & 4) == 0 || self->_source != v4[120])
      goto LABEL_45;
  }
  else if ((v4[144] & 4) != 0)
  {
    goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[144] & 2) == 0 || self->_changeType != v4[16])
      goto LABEL_45;
  }
  else if ((v4[144] & 2) != 0)
  {
    goto LABEL_45;
  }
  sourceIdentifier = self->_sourceIdentifier;
  if ((unint64_t)sourceIdentifier | *((_QWORD *)v4 + 16)
    && !-[NSString isEqual:](sourceIdentifier, "isEqual:"))
  {
    goto LABEL_45;
  }
  firstName = self->_firstName;
  if ((unint64_t)firstName | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](firstName, "isEqual:"))
      goto LABEL_45;
  }
  phoneticFirstName = self->_phoneticFirstName;
  if ((unint64_t)phoneticFirstName | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](phoneticFirstName, "isEqual:"))
      goto LABEL_45;
  }
  middleName = self->_middleName;
  if ((unint64_t)middleName | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](middleName, "isEqual:"))
      goto LABEL_45;
  }
  phoneticMiddleName = self->_phoneticMiddleName;
  if ((unint64_t)phoneticMiddleName | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](phoneticMiddleName, "isEqual:"))
      goto LABEL_45;
  }
  lastName = self->_lastName;
  if ((unint64_t)lastName | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](lastName, "isEqual:"))
      goto LABEL_45;
  }
  phoneticLastName = self->_phoneticLastName;
  if ((unint64_t)phoneticLastName | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](phoneticLastName, "isEqual:"))
      goto LABEL_45;
  }
  organizationName = self->_organizationName;
  if ((unint64_t)organizationName | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](organizationName, "isEqual:"))
      goto LABEL_45;
  }
  jobTitle = self->_jobTitle;
  if ((unint64_t)jobTitle | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](jobTitle, "isEqual:"))
      goto LABEL_45;
  }
  nickname = self->_nickname;
  if ((unint64_t)nickname | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](nickname, "isEqual:"))
      goto LABEL_45;
  }
  relatedNames = self->_relatedNames;
  if ((unint64_t)relatedNames | *((_QWORD *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](relatedNames, "isEqual:"))
      goto LABEL_45;
  }
  streetNames = self->_streetNames;
  if ((unint64_t)streetNames | *((_QWORD *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](streetNames, "isEqual:"))
      goto LABEL_45;
  }
  cityNames = self->_cityNames;
  if ((unint64_t)cityNames | *((_QWORD *)v4 + 3))
    v19 = -[NSMutableArray isEqual:](cityNames, "isEqual:");
  else
    v19 = 1;
LABEL_46:

  return v19;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char has;
  unint64_t v5;
  double score;
  double v7;
  long double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  NSUInteger v21;
  uint64_t v22;
  uint64_t v23;

  v3 = -[NSString hash](self->_identifier, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    score = self->_score;
    v7 = -score;
    if (score >= 0.0)
      v7 = self->_score;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
      if ((has & 4) == 0)
      {
LABEL_13:
        v10 = 0;
        if ((has & 2) == 0)
          goto LABEL_14;
        goto LABEL_9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
      if ((has & 4) == 0)
        goto LABEL_13;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_13;
  }
  v10 = 2654435761 * self->_source;
  if ((has & 2) == 0)
  {
LABEL_14:
    v11 = 0;
    goto LABEL_15;
  }
LABEL_9:
  v11 = 2654435761 * self->_changeType;
LABEL_15:
  v12 = v5 ^ v3 ^ v10 ^ v11 ^ -[NSString hash](self->_sourceIdentifier, "hash");
  v13 = -[NSString hash](self->_firstName, "hash");
  v14 = v13 ^ -[NSString hash](self->_phoneticFirstName, "hash");
  v15 = v12 ^ v14 ^ -[NSString hash](self->_middleName, "hash");
  v16 = -[NSString hash](self->_phoneticMiddleName, "hash");
  v17 = v16 ^ -[NSString hash](self->_lastName, "hash");
  v18 = v17 ^ -[NSString hash](self->_phoneticLastName, "hash");
  v19 = v15 ^ v18 ^ -[NSString hash](self->_organizationName, "hash");
  v20 = -[NSString hash](self->_jobTitle, "hash");
  v21 = v20 ^ -[NSString hash](self->_nickname, "hash");
  v22 = v21 ^ -[NSMutableArray hash](self->_relatedNames, "hash");
  v23 = v22 ^ -[NSMutableArray hash](self->_streetNames, "hash");
  return v19 ^ v23 ^ -[NSMutableArray hash](self->_cityNames, "hash");
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
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 5))
    -[PPPBContactNameRecord setIdentifier:](self, "setIdentifier:");
  v5 = *((_BYTE *)v4 + 144);
  if ((v5 & 1) != 0)
  {
    self->_score = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 144);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*((_BYTE *)v4 + 144) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_source = *((_BYTE *)v4 + 120);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 144) & 2) != 0)
  {
LABEL_6:
    self->_changeType = *((_BYTE *)v4 + 16);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_7:
  if (*((_QWORD *)v4 + 16))
    -[PPPBContactNameRecord setSourceIdentifier:](self, "setSourceIdentifier:");
  if (*((_QWORD *)v4 + 4))
    -[PPPBContactNameRecord setFirstName:](self, "setFirstName:");
  if (*((_QWORD *)v4 + 11))
    -[PPPBContactNameRecord setPhoneticFirstName:](self, "setPhoneticFirstName:");
  if (*((_QWORD *)v4 + 8))
    -[PPPBContactNameRecord setMiddleName:](self, "setMiddleName:");
  if (*((_QWORD *)v4 + 13))
    -[PPPBContactNameRecord setPhoneticMiddleName:](self, "setPhoneticMiddleName:");
  if (*((_QWORD *)v4 + 7))
    -[PPPBContactNameRecord setLastName:](self, "setLastName:");
  if (*((_QWORD *)v4 + 12))
    -[PPPBContactNameRecord setPhoneticLastName:](self, "setPhoneticLastName:");
  if (*((_QWORD *)v4 + 10))
    -[PPPBContactNameRecord setOrganizationName:](self, "setOrganizationName:");
  if (*((_QWORD *)v4 + 6))
    -[PPPBContactNameRecord setJobTitle:](self, "setJobTitle:");
  if (*((_QWORD *)v4 + 9))
    -[PPPBContactNameRecord setNickname:](self, "setNickname:");
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = *((id *)v4 + 14);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        -[PPPBContactNameRecord addRelatedNames:](self, "addRelatedNames:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v8);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = *((id *)v4 + 17);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        -[PPPBContactNameRecord addStreetNames:](self, "addStreetNames:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v13);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = *((id *)v4 + 3);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        -[PPPBContactNameRecord addCityNames:](self, "addCityNames:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * k), (_QWORD)v21);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v18);
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

- (double)score
{
  return self->_score;
}

- (unsigned)source
{
  return self->_source;
}

- (unsigned)changeType
{
  return self->_changeType;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sourceIdentifier, a3);
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
  objc_storeStrong((id *)&self->_firstName, a3);
}

- (NSString)phoneticFirstName
{
  return self->_phoneticFirstName;
}

- (void)setPhoneticFirstName:(id)a3
{
  objc_storeStrong((id *)&self->_phoneticFirstName, a3);
}

- (NSString)middleName
{
  return self->_middleName;
}

- (void)setMiddleName:(id)a3
{
  objc_storeStrong((id *)&self->_middleName, a3);
}

- (NSString)phoneticMiddleName
{
  return self->_phoneticMiddleName;
}

- (void)setPhoneticMiddleName:(id)a3
{
  objc_storeStrong((id *)&self->_phoneticMiddleName, a3);
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
  objc_storeStrong((id *)&self->_lastName, a3);
}

- (NSString)phoneticLastName
{
  return self->_phoneticLastName;
}

- (void)setPhoneticLastName:(id)a3
{
  objc_storeStrong((id *)&self->_phoneticLastName, a3);
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
  objc_storeStrong((id *)&self->_organizationName, a3);
}

- (NSString)jobTitle
{
  return self->_jobTitle;
}

- (void)setJobTitle:(id)a3
{
  objc_storeStrong((id *)&self->_jobTitle, a3);
}

- (NSString)nickname
{
  return self->_nickname;
}

- (void)setNickname:(id)a3
{
  objc_storeStrong((id *)&self->_nickname, a3);
}

- (NSMutableArray)relatedNames
{
  return self->_relatedNames;
}

- (void)setRelatedNames:(id)a3
{
  objc_storeStrong((id *)&self->_relatedNames, a3);
}

- (NSMutableArray)streetNames
{
  return self->_streetNames;
}

- (void)setStreetNames:(id)a3
{
  objc_storeStrong((id *)&self->_streetNames, a3);
}

- (NSMutableArray)cityNames
{
  return self->_cityNames;
}

- (void)setCityNames:(id)a3
{
  objc_storeStrong((id *)&self->_cityNames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streetNames, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_relatedNames, 0);
  objc_storeStrong((id *)&self->_phoneticMiddleName, 0);
  objc_storeStrong((id *)&self->_phoneticLastName, 0);
  objc_storeStrong((id *)&self->_phoneticFirstName, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_jobTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_cityNames, 0);
}

+ (Class)relatedNamesType
{
  return (Class)objc_opt_class();
}

+ (Class)streetNamesType
{
  return (Class)objc_opt_class();
}

+ (Class)cityNamesType
{
  return (Class)objc_opt_class();
}

@end
