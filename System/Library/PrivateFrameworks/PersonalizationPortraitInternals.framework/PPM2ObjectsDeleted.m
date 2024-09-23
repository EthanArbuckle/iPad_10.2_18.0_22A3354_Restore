@implementation PPM2ObjectsDeleted

- (int)domain
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_domain;
  else
    return 0;
}

- (void)setDomain:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_domain = a3;
}

- (void)setHasDomain:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDomain
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)domainAsString:(int)a3
{
  if (a3 < 8)
    return off_1E7E1DCE8[a3];
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

- (void)setError:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_error = a3;
}

- (void)setHasError:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasError
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
    return off_1E7E1DD28[a3];
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PPM2ObjectsDeleted;
  -[PPM2ObjectsDeleted description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPM2ObjectsDeleted dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  uint64_t domain;
  __CFString *v6;
  void *v7;
  uint64_t donationSource;
  __CFString *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_error);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("error"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_10;
  }
  domain = self->_domain;
  if (domain >= 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_domain);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = off_1E7E1DCE8[domain];
  }
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("domain"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_3:
  if ((has & 2) == 0)
    return v3;
LABEL_10:
  donationSource = self->_donationSource;
  if (donationSource >= 0x19)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_donationSource);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E7E1DD28[donationSource];
  }
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("donationSource"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PPM2ObjectsDeletedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteBOOLField();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_5:

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    v4[16] = self->_error;
    v4[20] |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_DWORD *)v4 + 2) = self->_domain;
  v4[20] |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)v4 + 3) = self->_donationSource;
    v4[20] |= 2u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_domain;
    *((_BYTE *)result + 20) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 16) = self->_error;
  *((_BYTE *)result + 20) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return result;
LABEL_4:
  *((_DWORD *)result + 3) = self->_donationSource;
  *((_BYTE *)result + 20) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_domain != *((_DWORD *)v4 + 2))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 4) != 0)
    {
      if (self->_error)
      {
        if (!*((_BYTE *)v4 + 16))
          goto LABEL_19;
        goto LABEL_15;
      }
      if (!*((_BYTE *)v4 + 16))
        goto LABEL_15;
    }
LABEL_19:
    v5 = 0;
    goto LABEL_20;
  }
  if ((*((_BYTE *)v4 + 20) & 4) != 0)
    goto LABEL_19;
LABEL_15:
  v5 = (*((_BYTE *)v4 + 20) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 2) == 0 || self->_donationSource != *((_DWORD *)v4 + 3))
      goto LABEL_19;
    v5 = 1;
  }
LABEL_20:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_domain;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_error;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_donationSource;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 1) == 0)
  {
    if ((*((_BYTE *)v4 + 20) & 4) == 0)
      goto LABEL_3;
LABEL_7:
    self->_error = *((_BYTE *)v4 + 16);
    *(_BYTE *)&self->_has |= 4u;
    if ((*((_BYTE *)v4 + 20) & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_domain = *((_DWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v5 & 2) != 0)
  {
LABEL_4:
    self->_donationSource = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_5:

}

- (BOOL)error
{
  return self->_error;
}

+ (id)options
{
  if (options_once_19533 != -1)
    dispatch_once(&options_once_19533, &__block_literal_global_19534);
  return (id)options_sOptions_19535;
}

void __29__PPM2ObjectsDeleted_options__block_invoke()
{
  void *v0;

  v0 = (void *)options_sOptions_19535;
  options_sOptions_19535 = (uint64_t)&unk_1E7E5BFE0;

}

@end
