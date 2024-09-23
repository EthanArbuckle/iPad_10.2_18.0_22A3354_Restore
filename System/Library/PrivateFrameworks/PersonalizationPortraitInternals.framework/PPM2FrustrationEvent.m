@implementation PPM2FrustrationEvent

- (BOOL)hasClientId
{
  return self->_clientId != 0;
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

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
    return off_1E7E1C9B8[a3];
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PPM2FrustrationEvent;
  -[PPM2FrustrationEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPM2FrustrationEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *clientId;
  NSString *bundleId;
  uint64_t domain;
  __CFString *v8;
  NSString *activeTreatments;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  clientId = self->_clientId;
  if (clientId)
    objc_msgSend(v3, "setObject:forKey:", clientId, CFSTR("clientId"));
  bundleId = self->_bundleId;
  if (bundleId)
    objc_msgSend(v4, "setObject:forKey:", bundleId, CFSTR("bundleId"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    domain = self->_domain;
    if (domain >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_domain);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E7E1C9B8[domain];
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("domain"));

  }
  activeTreatments = self->_activeTreatments;
  if (activeTreatments)
    objc_msgSend(v4, "setObject:forKey:", activeTreatments, CFSTR("activeTreatments"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PPM2FrustrationEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_clientId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_bundleId)
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
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_clientId)
  {
    objc_msgSend(v4, "setClientId:");
    v4 = v5;
  }
  if (self->_bundleId)
  {
    objc_msgSend(v5, "setBundleId:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_domain;
    *((_BYTE *)v4 + 36) |= 1u;
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
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_clientId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_bundleId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_domain;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_activeTreatments, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *clientId;
  NSString *bundleId;
  NSString *activeTreatments;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  clientId = self->_clientId;
  if ((unint64_t)clientId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](clientId, "isEqual:"))
      goto LABEL_13;
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_domain != *((_DWORD *)v4 + 8))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  activeTreatments = self->_activeTreatments;
  if ((unint64_t)activeTreatments | *((_QWORD *)v4 + 1))
    v8 = -[NSString isEqual:](activeTreatments, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_clientId, "hash");
  v4 = -[NSString hash](self->_bundleId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_domain;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[NSString hash](self->_activeTreatments, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v4 = (int *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[PPM2FrustrationEvent setClientId:](self, "setClientId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[PPM2FrustrationEvent setBundleId:](self, "setBundleId:");
    v4 = v5;
  }
  if ((v4[9] & 1) != 0)
  {
    self->_domain = v4[8];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[PPM2FrustrationEvent setActiveTreatments:](self, "setActiveTreatments:");
    v4 = v5;
  }

}

- (NSString)clientId
{
  return self->_clientId;
}

- (void)setClientId:(id)a3
{
  objc_storeStrong((id *)&self->_clientId, a3);
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
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
  objc_storeStrong((id *)&self->_clientId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_activeTreatments, 0);
}

+ (id)options
{
  if (options_once_17490 != -1)
    dispatch_once(&options_once_17490, &__block_literal_global_17491);
  return (id)options_sOptions_17492;
}

void __31__PPM2FrustrationEvent_options__block_invoke()
{
  void *v0;

  v0 = (void *)options_sOptions_17492;
  options_sOptions_17492 = (uint64_t)&unk_1E7E5BFB8;

}

@end
