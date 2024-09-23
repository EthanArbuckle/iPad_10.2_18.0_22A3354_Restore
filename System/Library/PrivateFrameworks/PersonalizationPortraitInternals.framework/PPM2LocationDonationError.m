@implementation PPM2LocationDonationError

- (int)reason
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_reason;
  else
    return 0;
}

- (void)setReason:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_reason = a3;
}

- (void)setHasReason:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReason
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)reasonAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("ZeroLocations");
  if (a3 == 1)
  {
    v3 = CFSTR("DisabledBundleId");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ZeroLocations")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("DisabledBundleId"));

  return v4;
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
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
  v8.super_class = (Class)PPM2LocationDonationError;
  -[PPM2LocationDonationError description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPM2LocationDonationError dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  int reason;
  __CFString *v5;
  NSString *bundleId;
  NSString *activeTreatments;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    reason = self->_reason;
    if (reason)
    {
      if (reason == 1)
      {
        v5 = CFSTR("DisabledBundleId");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_reason);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v5 = CFSTR("ZeroLocations");
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("reason"));

  }
  bundleId = self->_bundleId;
  if (bundleId)
    objc_msgSend(v3, "setObject:forKey:", bundleId, CFSTR("bundleId"));
  activeTreatments = self->_activeTreatments;
  if (activeTreatments)
    objc_msgSend(v3, "setObject:forKey:", activeTreatments, CFSTR("activeTreatments"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PPM2LocationDonationErrorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_bundleId)
  {
    PBDataWriterWriteStringField();
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[6] = self->_reason;
    *((_BYTE *)v4 + 28) |= 1u;
  }
  v5 = v4;
  if (self->_bundleId)
  {
    objc_msgSend(v4, "setBundleId:");
    v4 = v5;
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
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_reason;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_bundleId, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  v9 = -[NSString copyWithZone:](self->_activeTreatments, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *bundleId;
  NSString *activeTreatments;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_reason != *((_DWORD *)v4 + 6))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((_QWORD *)v4 + 2) && !-[NSString isEqual:](bundleId, "isEqual:"))
    goto LABEL_11;
  activeTreatments = self->_activeTreatments;
  if ((unint64_t)activeTreatments | *((_QWORD *)v4 + 1))
    v7 = -[NSString isEqual:](activeTreatments, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_reason;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_bundleId, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_activeTreatments, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[7] & 1) != 0)
  {
    self->_reason = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[PPM2LocationDonationError setBundleId:](self, "setBundleId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[PPM2LocationDonationError setActiveTreatments:](self, "setActiveTreatments:");
    v4 = v5;
  }

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
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_activeTreatments, 0);
}

@end
