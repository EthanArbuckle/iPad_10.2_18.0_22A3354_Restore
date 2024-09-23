@implementation PPM2AttributedFeedback

- (int)source
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_source;
  else
    return 0;
}

- (void)setSource:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_source = a3;
}

- (void)setHasSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSource
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)sourceAsString:(int)a3
{
  if (a3 < 0x19)
    return off_1E7E16518[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSource:(id)a3
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

- (int)algorithm
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_algorithm;
  else
    return 0;
}

- (void)setAlgorithm:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_algorithm = a3;
}

- (void)setHasAlgorithm:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAlgorithm
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)algorithmAsString:(int)a3
{
  if (a3 < 0x16)
    return off_1E7E165E0[a3];
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

- (int)domain
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_domain;
  else
    return 0;
}

- (void)setDomain:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_domain = a3;
}

- (void)setHasDomain:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDomain
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)domainAsString:(int)a3
{
  if (a3 < 8)
    return off_1E7E16690[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDomain:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Topics")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NamedEntities")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Locations")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Events")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ContactsDomain")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Connections")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("QuickTypeBroker")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("UniversalSearchSpotlightTopics")))
  {
    v4 = 7;
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

- (BOOL)hasClientId
{
  return self->_clientId != 0;
}

- (BOOL)hasMappingId
{
  return self->_mappingId != 0;
}

- (int)type
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E7E166D0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Invalid")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EngagedExplicit")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EngagedImplicit")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RejectedExplicit")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RejectedImplicit")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Offered")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)category
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_category;
  else
    return 0;
}

- (void)setCategory:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_category = a3;
}

- (void)setHasCategory:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCategory
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)categoryAsString:(int)a3
{
  if (a3 < 0x16)
    return off_1E7E16700[a3];
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

- (void)setIsRemote:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isRemote = a3;
}

- (void)setHasIsRemote:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsRemote
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
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
  v8.super_class = (Class)PPM2AttributedFeedback;
  -[PPM2AttributedFeedback description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPM2AttributedFeedback dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  uint64_t source;
  __CFString *v6;
  uint64_t algorithm;
  __CFString *v8;
  uint64_t domain;
  __CFString *v10;
  NSString *activeTreatments;
  NSString *clientId;
  NSString *mappingId;
  char v14;
  uint64_t type;
  __CFString *v16;
  uint64_t category;
  __CFString *v18;
  NSString *dynamicCategory;
  void *v20;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    source = self->_source;
    if (source >= 0x19)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_source);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E7E16518[source];
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("source"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_17;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  algorithm = self->_algorithm;
  if (algorithm >= 0x16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_algorithm);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_1E7E165E0[algorithm];
  }
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("algorithm"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_13:
    domain = self->_domain;
    if (domain >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_domain);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E7E16690[domain];
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("domain"));

  }
LABEL_17:
  activeTreatments = self->_activeTreatments;
  if (activeTreatments)
    objc_msgSend(v3, "setObject:forKey:", activeTreatments, CFSTR("activeTreatments"));
  clientId = self->_clientId;
  if (clientId)
    objc_msgSend(v3, "setObject:forKey:", clientId, CFSTR("clientId"));
  mappingId = self->_mappingId;
  if (mappingId)
    objc_msgSend(v3, "setObject:forKey:", mappingId, CFSTR("mappingId"));
  v14 = (char)self->_has;
  if ((v14 & 0x10) != 0)
  {
    type = self->_type;
    if (type >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_1E7E166D0[type];
    }
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("type"));

    v14 = (char)self->_has;
  }
  if ((v14 & 2) != 0)
  {
    category = self->_category;
    if (category >= 0x16)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_category);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_1E7E16700[category];
    }
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("category"));

  }
  dynamicCategory = self->_dynamicCategory;
  if (dynamicCategory)
    objc_msgSend(v3, "setObject:forKey:", dynamicCategory, CFSTR("dynamicCategory"));
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isRemote);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("isRemote"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PPM2AttributedFeedbackReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;
  id v6;

  v6 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_4:
    PBDataWriterWriteInt32Field();
LABEL_5:
  if (self->_activeTreatments)
    PBDataWriterWriteStringField();
  if (self->_clientId)
    PBDataWriterWriteStringField();
  if (self->_mappingId)
    PBDataWriterWriteStringField();
  v5 = (char)self->_has;
  if ((v5 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = (char)self->_has;
  }
  if ((v5 & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_dynamicCategory)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  char v6;
  _DWORD *v7;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[14] = self->_source;
    *((_BYTE *)v4 + 68) |= 8u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_algorithm;
  *((_BYTE *)v4 + 68) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[8] = self->_domain;
    *((_BYTE *)v4 + 68) |= 4u;
  }
LABEL_5:
  v7 = v4;
  if (self->_activeTreatments)
  {
    objc_msgSend(v4, "setActiveTreatments:");
    v4 = v7;
  }
  if (self->_clientId)
  {
    objc_msgSend(v7, "setClientId:");
    v4 = v7;
  }
  if (self->_mappingId)
  {
    objc_msgSend(v7, "setMappingId:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
  {
    v4[15] = self->_type;
    *((_BYTE *)v4 + 68) |= 0x10u;
    v6 = (char)self->_has;
  }
  if ((v6 & 2) != 0)
  {
    v4[5] = self->_category;
    *((_BYTE *)v4 + 68) |= 2u;
  }
  if (self->_dynamicCategory)
  {
    objc_msgSend(v7, "setDynamicCategory:");
    v4 = v7;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *((_BYTE *)v4 + 64) = self->_isRemote;
    *((_BYTE *)v4 + 68) |= 0x20u;
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
  uint64_t v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_source;
    *(_BYTE *)(v5 + 68) |= 8u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 16) = self->_algorithm;
  *(_BYTE *)(v5 + 68) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 32) = self->_domain;
    *(_BYTE *)(v5 + 68) |= 4u;
  }
LABEL_5:
  v8 = -[NSString copyWithZone:](self->_activeTreatments, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v8;

  v10 = -[NSString copyWithZone:](self->_clientId, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v10;

  v12 = -[NSString copyWithZone:](self->_mappingId, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v12;

  v14 = (char)self->_has;
  if ((v14 & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 60) = self->_type;
    *(_BYTE *)(v6 + 68) |= 0x10u;
    v14 = (char)self->_has;
  }
  if ((v14 & 2) != 0)
  {
    *(_DWORD *)(v6 + 20) = self->_category;
    *(_BYTE *)(v6 + 68) |= 2u;
  }
  v15 = -[NSString copyWithZone:](self->_dynamicCategory, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v15;

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *(_BYTE *)(v6 + 64) = self->_isRemote;
    *(_BYTE *)(v6 + 68) |= 0x20u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *activeTreatments;
  NSString *clientId;
  NSString *mappingId;
  char has;
  char v9;
  NSString *dynamicCategory;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_38;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 8) == 0 || self->_source != *((_DWORD *)v4 + 14))
      goto LABEL_38;
  }
  else if ((*((_BYTE *)v4 + 68) & 8) != 0)
  {
    goto LABEL_38;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_algorithm != *((_DWORD *)v4 + 4))
      goto LABEL_38;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    goto LABEL_38;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 4) == 0 || self->_domain != *((_DWORD *)v4 + 8))
      goto LABEL_38;
  }
  else if ((*((_BYTE *)v4 + 68) & 4) != 0)
  {
    goto LABEL_38;
  }
  activeTreatments = self->_activeTreatments;
  if ((unint64_t)activeTreatments | *((_QWORD *)v4 + 1)
    && !-[NSString isEqual:](activeTreatments, "isEqual:"))
  {
    goto LABEL_38;
  }
  clientId = self->_clientId;
  if ((unint64_t)clientId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](clientId, "isEqual:"))
      goto LABEL_38;
  }
  mappingId = self->_mappingId;
  if ((unint64_t)mappingId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](mappingId, "isEqual:"))
      goto LABEL_38;
  }
  has = (char)self->_has;
  v9 = *((_BYTE *)v4 + 68);
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 0x10) == 0 || self->_type != *((_DWORD *)v4 + 15))
      goto LABEL_38;
  }
  else if ((*((_BYTE *)v4 + 68) & 0x10) != 0)
  {
    goto LABEL_38;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) == 0 || self->_category != *((_DWORD *)v4 + 5))
      goto LABEL_38;
  }
  else if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
    goto LABEL_38;
  }
  dynamicCategory = self->_dynamicCategory;
  if ((unint64_t)dynamicCategory | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](dynamicCategory, "isEqual:"))
      goto LABEL_38;
    has = (char)self->_has;
    v9 = *((_BYTE *)v4 + 68);
  }
  v11 = (v9 & 0x20) == 0;
  if ((has & 0x20) != 0)
  {
    if ((v9 & 0x20) != 0)
    {
      if (self->_isRemote)
      {
        if (!*((_BYTE *)v4 + 64))
          goto LABEL_38;
      }
      else if (*((_BYTE *)v4 + 64))
      {
        goto LABEL_38;
      }
      v11 = 1;
      goto LABEL_39;
    }
LABEL_38:
    v11 = 0;
  }
LABEL_39:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v13;

  if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    v13 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v13 = 2654435761 * self->_source;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_algorithm;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_domain;
    goto LABEL_8;
  }
LABEL_7:
  v4 = 0;
LABEL_8:
  v5 = -[NSString hash](self->_activeTreatments, "hash");
  v6 = -[NSString hash](self->_clientId, "hash");
  v7 = -[NSString hash](self->_mappingId, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v8 = 2654435761 * self->_type;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_10;
  }
  else
  {
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_10:
      v9 = 2654435761 * self->_category;
      goto LABEL_13;
    }
  }
  v9 = 0;
LABEL_13:
  v10 = -[NSString hash](self->_dynamicCategory, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v11 = 2654435761 * self->_isRemote;
  else
    v11 = 0;
  return v3 ^ v13 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 68);
  if ((v5 & 8) != 0)
  {
    self->_source = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 68);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 68) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_algorithm = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 68) & 4) != 0)
  {
LABEL_4:
    self->_domain = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_5:
  v7 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[PPM2AttributedFeedback setActiveTreatments:](self, "setActiveTreatments:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[PPM2AttributedFeedback setClientId:](self, "setClientId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[PPM2AttributedFeedback setMappingId:](self, "setMappingId:");
    v4 = v7;
  }
  v6 = *((_BYTE *)v4 + 68);
  if ((v6 & 0x10) != 0)
  {
    self->_type = *((_DWORD *)v4 + 15);
    *(_BYTE *)&self->_has |= 0x10u;
    v6 = *((_BYTE *)v4 + 68);
  }
  if ((v6 & 2) != 0)
  {
    self->_category = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[PPM2AttributedFeedback setDynamicCategory:](self, "setDynamicCategory:");
    v4 = v7;
  }
  if ((*((_BYTE *)v4 + 68) & 0x20) != 0)
  {
    self->_isRemote = *((_BYTE *)v4 + 64);
    *(_BYTE *)&self->_has |= 0x20u;
  }

}

- (NSString)activeTreatments
{
  return self->_activeTreatments;
}

- (void)setActiveTreatments:(id)a3
{
  objc_storeStrong((id *)&self->_activeTreatments, a3);
}

- (NSString)clientId
{
  return self->_clientId;
}

- (void)setClientId:(id)a3
{
  objc_storeStrong((id *)&self->_clientId, a3);
}

- (NSString)mappingId
{
  return self->_mappingId;
}

- (void)setMappingId:(id)a3
{
  objc_storeStrong((id *)&self->_mappingId, a3);
}

- (NSString)dynamicCategory
{
  return self->_dynamicCategory;
}

- (void)setDynamicCategory:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicCategory, a3);
}

- (BOOL)isRemote
{
  return self->_isRemote;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mappingId, 0);
  objc_storeStrong((id *)&self->_dynamicCategory, 0);
  objc_storeStrong((id *)&self->_clientId, 0);
  objc_storeStrong((id *)&self->_activeTreatments, 0);
}

+ (id)options
{
  if (options_once_3704 != -1)
    dispatch_once(&options_once_3704, &__block_literal_global_3705);
  return (id)options_sOptions_3706;
}

void __33__PPM2AttributedFeedback_options__block_invoke()
{
  void *v0;

  v0 = (void *)options_sOptions_3706;
  options_sOptions_3706 = (uint64_t)&unk_1E7E5BEA0;

}

@end
