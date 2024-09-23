@implementation PPM2NamedEntityNewItemDonation

- (int)donationSource
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_donationSource;
  else
    return 0;
}

- (void)setDonationSource:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_donationSource = a3;
}

- (void)setHasDonationSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDonationSource
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)donationSourceAsString:(int)a3
{
  if (a3 < 0x19)
    return off_1E7E1A8F8[a3];
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

- (int)category
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_category;
  else
    return 0;
}

- (void)setCategory:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_category = a3;
}

- (void)setHasCategory:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCategory
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)categoryAsString:(int)a3
{
  if (a3 < 0x16)
    return off_1E7E1A9C0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCategory:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UnknownCategory")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Person")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Organization")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Location")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Restaurant")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ActivityLocation")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Media")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Artist")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("StreetAddress")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("City")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("State")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Country")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FullAddress")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TouristAttraction")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EventTitle")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SportsTeam")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ProfessionalAthlete")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Musician")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Movie")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Dynamic")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Politician")) & 1) != 0)
  {
    v4 = 20;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TelevisionShow")))
  {
    v4 = 21;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasDynamicCategory
{
  return self->_dynamicCategory != 0;
}

- (BOOL)hasGroupId
{
  return self->_groupId != 0;
}

- (void)setNewItem:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_newItem = a3;
}

- (void)setHasNewItem:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNewItem
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
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
    return off_1E7E1AA70[a3];
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
  *(_BYTE *)&self->_has |= 0x20u;
  self->_userCreated = a3;
}

- (void)setHasUserCreated:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasUserCreated
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
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
  v8.super_class = (Class)PPM2NamedEntityNewItemDonation;
  -[PPM2NamedEntityNewItemDonation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPM2NamedEntityNewItemDonation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  uint64_t donationSource;
  __CFString *v6;
  uint64_t category;
  __CFString *v8;
  NSString *dynamicCategory;
  NSString *groupId;
  char v11;
  void *v12;
  uint64_t algorithm;
  __CFString *v14;
  NSString *activeTreatments;
  char v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    donationSource = self->_donationSource;
    if (donationSource >= 0x19)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_donationSource);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E7E1A8F8[donationSource];
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("donationSource"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    category = self->_category;
    if (category >= 0x16)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_category);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E7E1A9C0[category];
    }
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("category"));

  }
  dynamicCategory = self->_dynamicCategory;
  if (dynamicCategory)
    objc_msgSend(v3, "setObject:forKey:", dynamicCategory, CFSTR("dynamicCategory"));
  groupId = self->_groupId;
  if (groupId)
    objc_msgSend(v3, "setObject:forKey:", groupId, CFSTR("groupId"));
  v11 = (char)self->_has;
  if ((v11 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_newItem);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("newItem"));

    v11 = (char)self->_has;
  }
  if ((v11 & 2) != 0)
  {
    algorithm = self->_algorithm;
    if (algorithm >= 0x16)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_algorithm);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E7E1AA70[algorithm];
    }
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("algorithm"));

  }
  activeTreatments = self->_activeTreatments;
  if (activeTreatments)
    objc_msgSend(v3, "setObject:forKey:", activeTreatments, CFSTR("activeTreatments"));
  v16 = (char)self->_has;
  if ((v16 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_userCreated);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("userCreated"));

    v16 = (char)self->_has;
  }
  if ((v16 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_rank);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("rank"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PPM2NamedEntityNewItemDonationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;
  char v6;
  id v7;

  v7 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_dynamicCategory)
    PBDataWriterWriteStringField();
  if (self->_groupId)
    PBDataWriterWriteStringField();
  v5 = (char)self->_has;
  if ((v5 & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = (char)self->_has;
  }
  if ((v5 & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_activeTreatments)
    PBDataWriterWriteStringField();
  v6 = (char)self->_has;
  if ((v6 & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = (char)self->_has;
  }
  if ((v6 & 1) != 0)
    PBDataWriterWriteInt64Field();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  char v6;
  char v7;
  _DWORD *v8;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[8] = self->_donationSource;
    *((_BYTE *)v4 + 60) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[7] = self->_category;
    *((_BYTE *)v4 + 60) |= 4u;
  }
  v8 = v4;
  if (self->_dynamicCategory)
  {
    objc_msgSend(v4, "setDynamicCategory:");
    v4 = v8;
  }
  if (self->_groupId)
  {
    objc_msgSend(v8, "setGroupId:");
    v4 = v8;
  }
  v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
  {
    *((_BYTE *)v4 + 56) = self->_newItem;
    *((_BYTE *)v4 + 60) |= 0x10u;
    v6 = (char)self->_has;
  }
  if ((v6 & 2) != 0)
  {
    v4[6] = self->_algorithm;
    *((_BYTE *)v4 + 60) |= 2u;
  }
  if (self->_activeTreatments)
  {
    objc_msgSend(v8, "setActiveTreatments:");
    v4 = v8;
  }
  v7 = (char)self->_has;
  if ((v7 & 0x20) != 0)
  {
    *((_BYTE *)v4 + 57) = self->_userCreated;
    *((_BYTE *)v4 + 60) |= 0x20u;
    v7 = (char)self->_has;
  }
  if ((v7 & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_rank;
    *((_BYTE *)v4 + 60) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  char v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_donationSource;
    *(_BYTE *)(v5 + 60) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_category;
    *(_BYTE *)(v5 + 60) |= 4u;
  }
  v8 = -[NSString copyWithZone:](self->_dynamicCategory, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v8;

  v10 = -[NSString copyWithZone:](self->_groupId, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v10;

  v12 = (char)self->_has;
  if ((v12 & 0x10) != 0)
  {
    *(_BYTE *)(v6 + 56) = self->_newItem;
    *(_BYTE *)(v6 + 60) |= 0x10u;
    v12 = (char)self->_has;
  }
  if ((v12 & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_algorithm;
    *(_BYTE *)(v6 + 60) |= 2u;
  }
  v13 = -[NSString copyWithZone:](self->_activeTreatments, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v13;

  v15 = (char)self->_has;
  if ((v15 & 0x20) != 0)
  {
    *(_BYTE *)(v6 + 57) = self->_userCreated;
    *(_BYTE *)(v6 + 60) |= 0x20u;
    v15 = (char)self->_has;
  }
  if ((v15 & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_rank;
    *(_BYTE *)(v6 + 60) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *dynamicCategory;
  NSString *groupId;
  char has;
  char v8;
  NSString *activeTreatments;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_44;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 8) == 0 || self->_donationSource != *((_DWORD *)v4 + 8))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 60) & 8) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 4) == 0 || self->_category != *((_DWORD *)v4 + 7))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 60) & 4) != 0)
  {
    goto LABEL_44;
  }
  dynamicCategory = self->_dynamicCategory;
  if ((unint64_t)dynamicCategory | *((_QWORD *)v4 + 5)
    && !-[NSString isEqual:](dynamicCategory, "isEqual:"))
  {
    goto LABEL_44;
  }
  groupId = self->_groupId;
  if ((unint64_t)groupId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](groupId, "isEqual:"))
      goto LABEL_44;
  }
  has = (char)self->_has;
  v8 = *((_BYTE *)v4 + 60);
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 0x10) == 0)
      goto LABEL_44;
    if (self->_newItem)
    {
      if (!*((_BYTE *)v4 + 56))
        goto LABEL_44;
    }
    else if (*((_BYTE *)v4 + 56))
    {
      goto LABEL_44;
    }
  }
  else if ((*((_BYTE *)v4 + 60) & 0x10) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_algorithm != *((_DWORD *)v4 + 6))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_44;
  }
  activeTreatments = self->_activeTreatments;
  if ((unint64_t)activeTreatments | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](activeTreatments, "isEqual:"))
      goto LABEL_44;
    has = (char)self->_has;
    v8 = *((_BYTE *)v4 + 60);
  }
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) != 0)
    {
      if (self->_userCreated)
      {
        if (!*((_BYTE *)v4 + 57))
          goto LABEL_44;
        goto LABEL_40;
      }
      if (!*((_BYTE *)v4 + 57))
        goto LABEL_40;
    }
LABEL_44:
    v10 = 0;
    goto LABEL_45;
  }
  if ((v8 & 0x20) != 0)
    goto LABEL_44;
LABEL_40:
  v10 = (v8 & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_rank != *((_QWORD *)v4 + 1))
      goto LABEL_44;
    v10 = 1;
  }
LABEL_45:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v3 = 2654435761 * self->_donationSource;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_category;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_dynamicCategory, "hash");
  v6 = -[NSString hash](self->_groupId, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v7 = 2654435761 * self->_newItem;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_8;
  }
  else
  {
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_8:
      v8 = 2654435761 * self->_algorithm;
      goto LABEL_11;
    }
  }
  v8 = 0;
LABEL_11:
  v9 = -[NSString hash](self->_activeTreatments, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v10 = 2654435761 * self->_userCreated;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_13;
LABEL_15:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
  v10 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_15;
LABEL_13:
  v11 = 2654435761 * self->_rank;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  char v7;
  id v8;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 60);
  if ((v5 & 8) != 0)
  {
    self->_donationSource = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 60);
  }
  if ((v5 & 4) != 0)
  {
    self->_category = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 4u;
  }
  v8 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[PPM2NamedEntityNewItemDonation setDynamicCategory:](self, "setDynamicCategory:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[PPM2NamedEntityNewItemDonation setGroupId:](self, "setGroupId:");
    v4 = v8;
  }
  v6 = *((_BYTE *)v4 + 60);
  if ((v6 & 0x10) != 0)
  {
    self->_newItem = *((_BYTE *)v4 + 56);
    *(_BYTE *)&self->_has |= 0x10u;
    v6 = *((_BYTE *)v4 + 60);
  }
  if ((v6 & 2) != 0)
  {
    self->_algorithm = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[PPM2NamedEntityNewItemDonation setActiveTreatments:](self, "setActiveTreatments:");
    v4 = v8;
  }
  v7 = *((_BYTE *)v4 + 60);
  if ((v7 & 0x20) != 0)
  {
    self->_userCreated = *((_BYTE *)v4 + 57);
    *(_BYTE *)&self->_has |= 0x20u;
    v7 = *((_BYTE *)v4 + 60);
  }
  if ((v7 & 1) != 0)
  {
    self->_rank = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)dynamicCategory
{
  return self->_dynamicCategory;
}

- (void)setDynamicCategory:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicCategory, a3);
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
  objc_storeStrong((id *)&self->_dynamicCategory, 0);
  objc_storeStrong((id *)&self->_activeTreatments, 0);
}

@end
