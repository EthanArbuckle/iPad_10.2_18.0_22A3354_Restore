@implementation PPM2NamedEntitySourceLanguage

- (BOOL)hasDetectedLanguage
{
  return self->_detectedLanguage != 0;
}

- (BOOL)hasSystemLanguage
{
  return self->_systemLanguage != 0;
}

- (void)setLanguageCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_languageCount = a3;
}

- (void)setHasLanguageCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLanguageCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)donationSource
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_donationSource;
  else
    return 0;
}

- (void)setDonationSource:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_donationSource = a3;
}

- (void)setHasDonationSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDonationSource
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)donationSourceAsString:(int)a3
{
  if (a3 < 0x19)
    return off_1E7E189D8[a3];
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
    return off_1E7E18AA0[a3];
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PPM2NamedEntitySourceLanguage;
  -[PPM2NamedEntitySourceLanguage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPM2NamedEntitySourceLanguage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *detectedLanguage;
  NSString *systemLanguage;
  char has;
  void *v8;
  uint64_t donationSource;
  __CFString *v10;
  uint64_t algorithm;
  __CFString *v12;
  NSString *activeTreatments;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  detectedLanguage = self->_detectedLanguage;
  if (detectedLanguage)
    objc_msgSend(v3, "setObject:forKey:", detectedLanguage, CFSTR("detectedLanguage"));
  systemLanguage = self->_systemLanguage;
  if (systemLanguage)
    objc_msgSend(v4, "setObject:forKey:", systemLanguage, CFSTR("systemLanguage"));
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
LABEL_10:
    donationSource = self->_donationSource;
    if (donationSource >= 0x19)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_donationSource);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E7E189D8[donationSource];
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("donationSource"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_18;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_languageCount);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("languageCount"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_10;
LABEL_7:
  if ((has & 1) != 0)
  {
LABEL_14:
    algorithm = self->_algorithm;
    if (algorithm >= 0x16)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_algorithm);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E7E18AA0[algorithm];
    }
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("algorithm"));

  }
LABEL_18:
  activeTreatments = self->_activeTreatments;
  if (activeTreatments)
    objc_msgSend(v4, "setObject:forKey:", activeTreatments, CFSTR("activeTreatments"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PPM2NamedEntitySourceLanguageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_detectedLanguage)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_systemLanguage)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 1) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_8:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_9:
  if (self->_activeTreatments)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_detectedLanguage)
  {
    objc_msgSend(v4, "setDetectedLanguage:");
    v4 = v6;
  }
  if (self->_systemLanguage)
  {
    objc_msgSend(v6, "setSystemLanguage:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 9) = self->_languageCount;
    *((_BYTE *)v4 + 48) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 1) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 8) = self->_donationSource;
  *((_BYTE *)v4 + 48) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_8:
    *((_DWORD *)v4 + 4) = self->_algorithm;
    *((_BYTE *)v4 + 48) |= 1u;
  }
LABEL_9:
  if (self->_activeTreatments)
  {
    objc_msgSend(v6, "setActiveTreatments:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char has;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_detectedLanguage, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_systemLanguage, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(_DWORD *)(v5 + 32) = self->_donationSource;
    *(_BYTE *)(v5 + 48) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 36) = self->_languageCount;
  *(_BYTE *)(v5 + 48) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 16) = self->_algorithm;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
LABEL_5:
  v11 = -[NSString copyWithZone:](self->_activeTreatments, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v11;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *detectedLanguage;
  NSString *systemLanguage;
  NSString *activeTreatments;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  detectedLanguage = self->_detectedLanguage;
  if ((unint64_t)detectedLanguage | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](detectedLanguage, "isEqual:"))
      goto LABEL_23;
  }
  systemLanguage = self->_systemLanguage;
  if ((unint64_t)systemLanguage | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](systemLanguage, "isEqual:"))
      goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0 || self->_languageCount != *((_DWORD *)v4 + 9))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
LABEL_23:
    v8 = 0;
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_donationSource != *((_DWORD *)v4 + 8))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_algorithm != *((_DWORD *)v4 + 4))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_23;
  }
  activeTreatments = self->_activeTreatments;
  if ((unint64_t)activeTreatments | *((_QWORD *)v4 + 1))
    v8 = -[NSString isEqual:](activeTreatments, "isEqual:");
  else
    v8 = 1;
LABEL_24:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_detectedLanguage, "hash");
  v4 = -[NSString hash](self->_systemLanguage, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSString hash](self->_activeTreatments, "hash");
  }
  v5 = 2654435761 * self->_languageCount;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v6 = 2654435761 * self->_donationSource;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v7 = 2654435761 * self->_algorithm;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSString hash](self->_activeTreatments, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[PPM2NamedEntitySourceLanguage setDetectedLanguage:](self, "setDetectedLanguage:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[PPM2NamedEntitySourceLanguage setSystemLanguage:](self, "setSystemLanguage:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 4) != 0)
  {
    self->_languageCount = *((_DWORD *)v4 + 9);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 48);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 1) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*((_BYTE *)v4 + 48) & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_donationSource = *((_DWORD *)v4 + 8);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_8:
    self->_algorithm = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_9:
  if (*((_QWORD *)v4 + 1))
  {
    -[PPM2NamedEntitySourceLanguage setActiveTreatments:](self, "setActiveTreatments:");
    v4 = v6;
  }

}

- (NSString)detectedLanguage
{
  return self->_detectedLanguage;
}

- (void)setDetectedLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_detectedLanguage, a3);
}

- (NSString)systemLanguage
{
  return self->_systemLanguage;
}

- (void)setSystemLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_systemLanguage, a3);
}

- (unsigned)languageCount
{
  return self->_languageCount;
}

- (NSString)activeTreatments
{
  return self->_activeTreatments;
}

- (void)setActiveTreatments:(id)a3
{
  objc_storeStrong((id *)&self->_activeTreatments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemLanguage, 0);
  objc_storeStrong((id *)&self->_detectedLanguage, 0);
  objc_storeStrong((id *)&self->_activeTreatments, 0);
}

@end
