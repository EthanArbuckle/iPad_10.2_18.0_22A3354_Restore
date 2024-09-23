@implementation PPM2TopicItemDonation

- (int)donationSource
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_donationSource;
  else
    return 0;
}

- (void)setDonationSource:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_donationSource = a3;
}

- (void)setHasDonationSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDonationSource
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)donationSourceAsString:(int)a3
{
  if (a3 < 0x19)
    return off_1E7E15690[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDonationSource:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Safari")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("News")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Mail")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Messages")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CoreRoutine")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Siri")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Photos")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Health")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Podcasts")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Calendar")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Parsec")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NowPlaying")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Notes")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Maps")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ContactsSource")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Reminders")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UnknownFirstParty")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UnknownThirdParty")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UnknownSource")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Music")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Wallet")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Facetime")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Camera")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TVRemoteNotifications")) & 1) != 0)
  {
    v4 = 23;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TVApp")))
  {
    v4 = 24;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasGroupId
{
  return self->_groupId != 0;
}

- (void)setNewItem:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_newItem = a3;
}

- (void)setHasNewItem:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNewItem
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int)algorithm
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_algorithm;
  else
    return 0;
}

- (void)setAlgorithm:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_algorithm = a3;
}

- (void)setHasAlgorithm:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAlgorithm
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)algorithmAsString:(int)a3
{
  if (a3 < 0x16)
    return off_1E7E15758[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAlgorithm:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LookupHint")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CoreNLP")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CoreRoutineImport")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DataDetectors")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NSUALocation")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TrustedLocation")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapsInteraction")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CustomTagger")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EventKitImport")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PhotosKnowledgeGraph")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ContextKit")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SiriDonation")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NE2T")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HighLevelTopicExtraction")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ParsecDonation")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PodcastsInteraction")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HealthKitImport")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NowPlayingDonation")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ContactsImport")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AugmentedGazetteer")) & 1) != 0)
  {
    v4 = 20;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("KnowledgeGraph")))
  {
    v4 = 21;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasActiveTreatments
{
  return self->_activeTreatments != 0;
}

- (void)setUserCreated:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_userCreated = a3;
}

- (void)setHasUserCreated:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasUserCreated
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setRank:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_rank = a3;
}

- (void)setHasRank:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRank
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)PPM2TopicItemDonation;
  -[PPM2TopicItemDonation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPM2TopicItemDonation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t donationSource;
  __CFString *v5;
  NSString *groupId;
  char has;
  void *v8;
  uint64_t algorithm;
  __CFString *v10;
  NSString *activeTreatments;
  char v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    donationSource = self->_donationSource;
    if (donationSource >= 0x19)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_donationSource);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E7E15690[donationSource];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("donationSource"));

  }
  groupId = self->_groupId;
  if (groupId)
    objc_msgSend(v3, "setObject:forKey:", groupId, CFSTR("groupId"));
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_newItem);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("newItem"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    algorithm = self->_algorithm;
    if (algorithm >= 0x16)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_algorithm);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E7E15758[algorithm];
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("algorithm"));

  }
  activeTreatments = self->_activeTreatments;
  if (activeTreatments)
    objc_msgSend(v3, "setObject:forKey:", activeTreatments, CFSTR("activeTreatments"));
  v12 = (char)self->_has;
  if ((v12 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_userCreated);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("userCreated"));

    v12 = (char)self->_has;
  }
  if ((v12 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_rank);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("rank"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PPM2TopicItemDonationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;
  id v6;

  v6 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_groupId)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_activeTreatments)
    PBDataWriterWriteStringField();
  v5 = (char)self->_has;
  if ((v5 & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = (char)self->_has;
  }
  if ((v5 & 1) != 0)
    PBDataWriterWriteInt64Field();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  char v6;
  _DWORD *v7;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[7] = self->_donationSource;
    *((_BYTE *)v4 + 44) |= 4u;
  }
  v7 = v4;
  if (self->_groupId)
  {
    objc_msgSend(v4, "setGroupId:");
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_BYTE *)v4 + 40) = self->_newItem;
    *((_BYTE *)v4 + 44) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[6] = self->_algorithm;
    *((_BYTE *)v4 + 44) |= 2u;
  }
  if (self->_activeTreatments)
  {
    objc_msgSend(v7, "setActiveTreatments:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
  {
    *((_BYTE *)v4 + 41) = self->_userCreated;
    *((_BYTE *)v4 + 44) |= 0x10u;
    v6 = (char)self->_has;
  }
  if ((v6 & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_rank;
    *((_BYTE *)v4 + 44) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char has;
  uint64_t v10;
  void *v11;
  char v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_donationSource;
    *(_BYTE *)(v5 + 44) |= 4u;
  }
  v7 = -[NSString copyWithZone:](self->_groupId, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v7;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_BYTE *)(v6 + 40) = self->_newItem;
    *(_BYTE *)(v6 + 44) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_algorithm;
    *(_BYTE *)(v6 + 44) |= 2u;
  }
  v10 = -[NSString copyWithZone:](self->_activeTreatments, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v10;

  v12 = (char)self->_has;
  if ((v12 & 0x10) != 0)
  {
    *(_BYTE *)(v6 + 41) = self->_userCreated;
    *(_BYTE *)(v6 + 44) |= 0x10u;
    v12 = (char)self->_has;
  }
  if ((v12 & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_rank;
    *(_BYTE *)(v6 + 44) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSString *groupId;
  NSString *activeTreatments;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_38;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 44);
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_donationSource != *((_DWORD *)v4 + 7))
      goto LABEL_38;
  }
  else if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    goto LABEL_38;
  }
  groupId = self->_groupId;
  if ((unint64_t)groupId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](groupId, "isEqual:"))
      goto LABEL_38;
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 44);
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0)
      goto LABEL_38;
    if (self->_newItem)
    {
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_38;
    }
    else if (*((_BYTE *)v4 + 40))
    {
      goto LABEL_38;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_38;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_algorithm != *((_DWORD *)v4 + 6))
      goto LABEL_38;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_38;
  }
  activeTreatments = self->_activeTreatments;
  if ((unint64_t)activeTreatments | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](activeTreatments, "isEqual:"))
      goto LABEL_38;
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 44);
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) != 0)
    {
      if (self->_userCreated)
      {
        if (!*((_BYTE *)v4 + 41))
          goto LABEL_38;
        goto LABEL_34;
      }
      if (!*((_BYTE *)v4 + 41))
        goto LABEL_34;
    }
LABEL_38:
    v9 = 0;
    goto LABEL_39;
  }
  if ((v6 & 0x10) != 0)
    goto LABEL_38;
LABEL_34:
  v9 = (v6 & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_rank != *((_QWORD *)v4 + 1))
      goto LABEL_38;
    v9 = 1;
  }
LABEL_39:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v3 = 2654435761 * self->_donationSource;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_groupId, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v5 = 2654435761 * self->_newItem;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_6:
      v6 = 2654435761 * self->_algorithm;
      goto LABEL_9;
    }
  }
  v6 = 0;
LABEL_9:
  v7 = -[NSString hash](self->_activeTreatments, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v8 = 2654435761 * self->_userCreated;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_11;
LABEL_13:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_13;
LABEL_11:
  v9 = 2654435761 * self->_rank;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;

  v4 = a3;
  if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    self->_donationSource = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 4u;
  }
  v7 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[PPM2TopicItemDonation setGroupId:](self, "setGroupId:");
    v4 = v7;
  }
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 8) != 0)
  {
    self->_newItem = *((_BYTE *)v4 + 40);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 44);
  }
  if ((v5 & 2) != 0)
  {
    self->_algorithm = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[PPM2TopicItemDonation setActiveTreatments:](self, "setActiveTreatments:");
    v4 = v7;
  }
  v6 = *((_BYTE *)v4 + 44);
  if ((v6 & 0x10) != 0)
  {
    self->_userCreated = *((_BYTE *)v4 + 41);
    *(_BYTE *)&self->_has |= 0x10u;
    v6 = *((_BYTE *)v4 + 44);
  }
  if ((v6 & 1) != 0)
  {
    self->_rank = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)groupId
{
  return self->_groupId;
}

- (void)setGroupId:(id)a3
{
  objc_storeStrong((id *)&self->_groupId, a3);
}

- (BOOL)newItem
{
  return self->_newItem;
}

- (NSString)activeTreatments
{
  return self->_activeTreatments;
}

- (void)setActiveTreatments:(id)a3
{
  objc_storeStrong((id *)&self->_activeTreatments, a3);
}

- (BOOL)userCreated
{
  return self->_userCreated;
}

- (int64_t)rank
{
  return self->_rank;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupId, 0);
  objc_storeStrong((id *)&self->_activeTreatments, 0);
}

@end
