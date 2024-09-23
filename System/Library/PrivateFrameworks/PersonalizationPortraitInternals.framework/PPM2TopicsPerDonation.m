@implementation PPM2TopicsPerDonation

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
    return off_1E7E18728[a3];
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
    return off_1E7E187F0[a3];
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
  v8.super_class = (Class)PPM2TopicsPerDonation;
  -[PPM2TopicsPerDonation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPM2TopicsPerDonation dictionaryRepresentation](self, "dictionaryRepresentation");
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
  uint64_t algorithm;
  __CFString *v8;
  NSString *activeTreatments;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    donationSource = self->_donationSource;
    if (donationSource >= 0x19)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_donationSource);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E7E18728[donationSource];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("donationSource"));

  }
  groupId = self->_groupId;
  if (groupId)
    objc_msgSend(v3, "setObject:forKey:", groupId, CFSTR("groupId"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    algorithm = self->_algorithm;
    if (algorithm >= 0x16)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_algorithm);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E7E187F0[algorithm];
    }
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("algorithm"));

  }
  activeTreatments = self->_activeTreatments;
  if (activeTreatments)
    objc_msgSend(v3, "setObject:forKey:", activeTreatments, CFSTR("activeTreatments"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PPM2TopicsPerDonationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_groupId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_activeTreatments)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[5] = self->_donationSource;
    *((_BYTE *)v4 + 32) |= 2u;
  }
  v5 = v4;
  if (self->_groupId)
  {
    objc_msgSend(v4, "setGroupId:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_algorithm;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  if (self->_activeTreatments)
  {
    objc_msgSend(v5, "setActiveTreatments:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_donationSource;
    *(_BYTE *)(v5 + 32) |= 2u;
  }
  v7 = -[NSString copyWithZone:](self->_groupId, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_algorithm;
    *(_BYTE *)(v6 + 32) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_activeTreatments, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v9;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSString *groupId;
  NSString *activeTreatments;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 32);
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_donationSource != *((_DWORD *)v4 + 5))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_17;
  }
  groupId = self->_groupId;
  if ((unint64_t)groupId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](groupId, "isEqual:"))
    {
LABEL_17:
      v9 = 0;
      goto LABEL_18;
    }
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 32);
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_algorithm != *((_DWORD *)v4 + 4))
      goto LABEL_17;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_17;
  }
  activeTreatments = self->_activeTreatments;
  if ((unint64_t)activeTreatments | *((_QWORD *)v4 + 1))
    v9 = -[NSString isEqual:](activeTreatments, "isEqual:");
  else
    v9 = 1;
LABEL_18:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_donationSource;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_groupId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_algorithm;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[NSString hash](self->_activeTreatments, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[8] & 2) != 0)
  {
    self->_donationSource = v4[5];
    *(_BYTE *)&self->_has |= 2u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[PPM2TopicsPerDonation setGroupId:](self, "setGroupId:");
    v4 = v5;
  }
  if ((v4[8] & 1) != 0)
  {
    self->_algorithm = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[PPM2TopicsPerDonation setActiveTreatments:](self, "setActiveTreatments:");
    v4 = v5;
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
  objc_storeStrong((id *)&self->_groupId, 0);
  objc_storeStrong((id *)&self->_activeTreatments, 0);
}

@end
