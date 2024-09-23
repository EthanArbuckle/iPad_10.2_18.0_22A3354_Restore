@implementation ComponentCarrierInfo

- (void)setDlEarfcn:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_dlEarfcn = a3;
}

- (void)setHasDlEarfcn:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDlEarfcn
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)dlBandwidth
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_dlBandwidth;
  else
    return 0;
}

- (void)setDlBandwidth:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_dlBandwidth = a3;
}

- (void)setHasDlBandwidth:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDlBandwidth
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)dlBandwidthAsString:(int)a3
{
  if (a3 < 7)
    return off_1E857C210[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDlBandwidth:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_TX_BW_CONFIG_N6")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_TX_BW_CONFIG_N15")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_TX_BW_CONFIG_N25")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_TX_BW_CONFIG_N50")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_TX_BW_CONFIG_N75")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_TX_BW_CONFIG_N100")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_TX_BW_CONFIG_COUNT")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setDlRfBand:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_dlRfBand = a3;
}

- (void)setHasDlRfBand:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDlRfBand
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)ComponentCarrierInfo;
  -[ComponentCarrierInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ComponentCarrierInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  uint64_t dlBandwidth;
  __CFString *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    dlBandwidth = self->_dlBandwidth;
    if (dlBandwidth >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_dlBandwidth);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E857C210[dlBandwidth];
    }
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("dl_bandwidth"));

    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
    return v3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_dlEarfcn);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("dl_earfcn"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_dlRfBand);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("dl_rf_band"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ComponentCarrierInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteInt32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
LABEL_5:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    v4[2] = self->_dlBandwidth;
    *((_BYTE *)v4 + 20) |= 1u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v4[3] = self->_dlEarfcn;
  *((_BYTE *)v4 + 20) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    v4[4] = self->_dlRfBand;
    *((_BYTE *)v4 + 20) |= 4u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_dlEarfcn;
    *((_BYTE *)result + 20) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 2) = self->_dlBandwidth;
  *((_BYTE *)result + 20) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return result;
LABEL_4:
  *((_DWORD *)result + 4) = self->_dlRfBand;
  *((_BYTE *)result + 20) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 2) == 0 || self->_dlEarfcn != *((_DWORD *)v4 + 3))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 20) & 2) != 0)
  {
LABEL_16:
    v5 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_dlBandwidth != *((_DWORD *)v4 + 2))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    goto LABEL_16;
  }
  v5 = (*((_BYTE *)v4 + 20) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 4) == 0 || self->_dlRfBand != *((_DWORD *)v4 + 4))
      goto LABEL_16;
    v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_dlEarfcn;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_dlBandwidth;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_dlRfBand;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 2) == 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0)
      goto LABEL_3;
LABEL_7:
    self->_dlBandwidth = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    if ((*((_BYTE *)v4 + 20) & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_dlEarfcn = *((_DWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v5 & 4) != 0)
  {
LABEL_4:
    self->_dlRfBand = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_5:

}

- (unsigned)dlEarfcn
{
  return self->_dlEarfcn;
}

- (unsigned)dlRfBand
{
  return self->_dlRfBand;
}

@end
