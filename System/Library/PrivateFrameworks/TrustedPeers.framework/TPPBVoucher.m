@implementation TPPBVoucher

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
  if (a3 < 6)
    return off_1EA8BF728[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTORE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SAME_DEVICE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SOS_UPGRADE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SECURE_CHANNEL")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RECOVERY_KEY")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasBeneficiary
{
  return self->_beneficiary != 0;
}

- (BOOL)hasSponsor
{
  return self->_sponsor != 0;
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
  v8.super_class = (Class)TPPBVoucher;
  -[TPPBVoucher description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPBVoucher dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t reason;
  __CFString *v5;
  NSString *beneficiary;
  NSString *sponsor;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    reason = self->_reason;
    if (reason >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_reason);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1EA8BF728[reason];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("reason"));

  }
  beneficiary = self->_beneficiary;
  if (beneficiary)
    objc_msgSend(v3, "setObject:forKey:", beneficiary, CFSTR("beneficiary"));
  sponsor = self->_sponsor;
  if (sponsor)
    objc_msgSend(v3, "setObject:forKey:", sponsor, CFSTR("sponsor"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TPPBVoucherReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_beneficiary)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_sponsor)
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
    v4[4] = self->_reason;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  v5 = v4;
  if (self->_beneficiary)
  {
    objc_msgSend(v4, "setBeneficiary:");
    v4 = v5;
  }
  if (self->_sponsor)
  {
    objc_msgSend(v5, "setSponsor:");
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
    *(_DWORD *)(v5 + 16) = self->_reason;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_beneficiary, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  v9 = -[NSString copyWithZone:](self->_sponsor, "copyWithZone:", a3);
  v10 = (void *)v6[3];
  v6[3] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *beneficiary;
  NSString *sponsor;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_reason != *((_DWORD *)v4 + 4))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  beneficiary = self->_beneficiary;
  if ((unint64_t)beneficiary | *((_QWORD *)v4 + 1)
    && !-[NSString isEqual:](beneficiary, "isEqual:"))
  {
    goto LABEL_11;
  }
  sponsor = self->_sponsor;
  if ((unint64_t)sponsor | *((_QWORD *)v4 + 3))
    v7 = -[NSString isEqual:](sponsor, "isEqual:");
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
  v4 = -[NSString hash](self->_beneficiary, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_sponsor, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[8] & 1) != 0)
  {
    self->_reason = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[TPPBVoucher setBeneficiary:](self, "setBeneficiary:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[TPPBVoucher setSponsor:](self, "setSponsor:");
    v4 = v5;
  }

}

- (NSString)beneficiary
{
  return self->_beneficiary;
}

- (void)setBeneficiary:(id)a3
{
  objc_storeStrong((id *)&self->_beneficiary, a3);
}

- (NSString)sponsor
{
  return self->_sponsor;
}

- (void)setSponsor:(id)a3
{
  objc_storeStrong((id *)&self->_sponsor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sponsor, 0);
  objc_storeStrong((id *)&self->_beneficiary, 0);
}

@end
