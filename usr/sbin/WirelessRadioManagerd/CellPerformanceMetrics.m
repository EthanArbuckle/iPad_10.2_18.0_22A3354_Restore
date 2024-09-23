@implementation CellPerformanceMetrics

- (void)dealloc
{
  objc_super v3;

  if (self)
    objc_setProperty_nonatomic(self, a2, 0, 16);
  v3.receiver = self;
  v3.super_class = (Class)CellPerformanceMetrics;
  -[CellPerformanceMetrics dealloc](&v3, "dealloc");
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CellPerformanceMetrics;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[CellPerformanceMetrics description](&v3, "description"), -[CellPerformanceMetrics dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *gci;
  __int16 has;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v4 = v3;
  gci = self->_gci;
  if (gci)
    objc_msgSend(v3, "setObject:forKey:", gci, CFSTR("gci"));
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlBandwidth), CFSTR("dl_bandwidth"));
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_5:
      if ((has & 0x80) == 0)
        goto LABEL_6;
      goto LABEL_20;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nrFr1), CFSTR("nr_fr1"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nrFr2), CFSTR("nr_fr2"));
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nrRsrp), CFSTR("nr_rsrp"));
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nrSinr), CFSTR("nr_sinr"));
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nrBw), CFSTR("nr_bw"));
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_stallRate), CFSTR("stall_rate"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_latency), CFSTR("latency"));
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_12:
    if ((has & 1) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_stCount), CFSTR("st_count"));
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_13:
    if ((has & 8) == 0)
      goto LABEL_14;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_count), CFSTR("count"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_14:
    if ((has & 0x10) == 0)
      goto LABEL_15;
LABEL_29:
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_lteRsrpFr2), CFSTR("lte_rsrp_fr2"));
    if ((*(_WORD *)&self->_has & 0x200) == 0)
      return v4;
    goto LABEL_16;
  }
LABEL_28:
  objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_lteRsrpFr1), CFSTR("lte_rsrp_fr1"));
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_29;
LABEL_15:
  if ((has & 0x200) != 0)
LABEL_16:
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nrSabw), CFSTR("nr_sabw"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10002F5EC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSString *gci;
  __int16 has;

  gci = self->_gci;
  if (gci)
    PBDataWriterWriteStringField(a3, gci, 1);
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(a3, self->_dlBandwidth, 2);
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_5:
      if ((has & 0x80) == 0)
        goto LABEL_6;
      goto LABEL_19;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field(a3, self->_nrFr1, 3);
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field(a3, self->_nrFr2, 4);
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field(a3, self->_nrRsrp, 5);
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field(a3, self->_nrSinr, 6);
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field(a3, self->_nrBw, 7);
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field(a3, self->_stallRate, 8);
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field(a3, self->_latency, 9);
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_12:
    if ((has & 1) == 0)
      goto LABEL_13;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field(a3, self->_stCount, 10);
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_13:
    if ((has & 8) == 0)
      goto LABEL_14;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field(a3, self->_count, 11);
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_14:
    if ((has & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteSint32Field(a3, self->_lteRsrpFr1, 12);
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_15:
    if ((has & 0x200) == 0)
      return;
LABEL_29:
    PBDataWriterWriteUint32Field(a3, self->_nrSabw, 14);
    return;
  }
LABEL_28:
  PBDataWriterWriteSint32Field(a3, self->_lteRsrpFr2, 13);
  if ((*(_WORD *)&self->_has & 0x200) != 0)
    goto LABEL_29;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  __int16 has;

  v5 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");

  v5[2] = -[NSString copyWithZone:](self->_gci, "copyWithZone:", a3);
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 3) = self->_dlBandwidth;
    *((_WORD *)v5 + 34) |= 2u;
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 10) = self->_nrFr1;
  *((_WORD *)v5 + 34) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v5 + 11) = self->_nrFr2;
  *((_WORD *)v5 + 34) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v5 + 12) = self->_nrRsrp;
  *((_WORD *)v5 + 34) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v5 + 14) = self->_nrSinr;
  *((_WORD *)v5 + 34) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v5 + 9) = self->_nrBw;
  *((_WORD *)v5 + 34) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v5 + 16) = self->_stallRate;
  *((_WORD *)v5 + 34) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x800) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v5 + 6) = self->_latency;
  *((_WORD *)v5 + 34) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_10:
    if ((has & 1) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v5 + 15) = self->_stCount;
  *((_WORD *)v5 + 34) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v5 + 2) = self->_count;
  *((_WORD *)v5 + 34) |= 1u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_13;
LABEL_27:
    *((_DWORD *)v5 + 8) = self->_lteRsrpFr2;
    *((_WORD *)v5 + 34) |= 0x10u;
    if ((*(_WORD *)&self->_has & 0x200) == 0)
      return v5;
    goto LABEL_14;
  }
LABEL_26:
  *((_DWORD *)v5 + 7) = self->_lteRsrpFr1;
  *((_WORD *)v5 + 34) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_27;
LABEL_13:
  if ((has & 0x200) != 0)
  {
LABEL_14:
    *((_DWORD *)v5 + 13) = self->_nrSabw;
    *((_WORD *)v5 + 34) |= 0x200u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  NSString *gci;
  __int16 has;
  __int16 v8;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self));
  if (v5)
  {
    gci = self->_gci;
    if (!((unint64_t)gci | *((_QWORD *)a3 + 2))
      || (v5 = -[NSString isEqual:](gci, "isEqual:")) != 0)
    {
      has = (__int16)self->_has;
      v8 = *((_WORD *)a3 + 34);
      if ((has & 2) != 0)
      {
        if ((v8 & 2) == 0 || self->_dlBandwidth != *((_DWORD *)a3 + 3))
          goto LABEL_68;
      }
      else if ((v8 & 2) != 0)
      {
LABEL_68:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((has & 0x40) != 0)
      {
        if ((v8 & 0x40) == 0 || self->_nrFr1 != *((_DWORD *)a3 + 10))
          goto LABEL_68;
      }
      else if ((v8 & 0x40) != 0)
      {
        goto LABEL_68;
      }
      if ((has & 0x80) != 0)
      {
        if ((v8 & 0x80) == 0 || self->_nrFr2 != *((_DWORD *)a3 + 11))
          goto LABEL_68;
      }
      else if ((v8 & 0x80) != 0)
      {
        goto LABEL_68;
      }
      if ((*(_WORD *)&self->_has & 0x100) != 0)
      {
        if ((*((_WORD *)a3 + 34) & 0x100) == 0 || self->_nrRsrp != *((_DWORD *)a3 + 12))
          goto LABEL_68;
      }
      else if ((*((_WORD *)a3 + 34) & 0x100) != 0)
      {
        goto LABEL_68;
      }
      if ((*(_WORD *)&self->_has & 0x400) != 0)
      {
        if ((*((_WORD *)a3 + 34) & 0x400) == 0 || self->_nrSinr != *((_DWORD *)a3 + 14))
          goto LABEL_68;
      }
      else if ((*((_WORD *)a3 + 34) & 0x400) != 0)
      {
        goto LABEL_68;
      }
      if ((has & 0x20) != 0)
      {
        if ((v8 & 0x20) == 0 || self->_nrBw != *((_DWORD *)a3 + 9))
          goto LABEL_68;
      }
      else if ((v8 & 0x20) != 0)
      {
        goto LABEL_68;
      }
      if ((*(_WORD *)&self->_has & 0x1000) != 0)
      {
        if ((*((_WORD *)a3 + 34) & 0x1000) == 0 || self->_stallRate != *((_DWORD *)a3 + 16))
          goto LABEL_68;
      }
      else if ((*((_WORD *)a3 + 34) & 0x1000) != 0)
      {
        goto LABEL_68;
      }
      if ((has & 4) != 0)
      {
        if ((v8 & 4) == 0 || self->_latency != *((_DWORD *)a3 + 6))
          goto LABEL_68;
      }
      else if ((v8 & 4) != 0)
      {
        goto LABEL_68;
      }
      if ((*(_WORD *)&self->_has & 0x800) != 0)
      {
        if ((*((_WORD *)a3 + 34) & 0x800) == 0 || self->_stCount != *((_DWORD *)a3 + 15))
          goto LABEL_68;
      }
      else if ((*((_WORD *)a3 + 34) & 0x800) != 0)
      {
        goto LABEL_68;
      }
      if ((has & 1) != 0)
      {
        if ((v8 & 1) == 0 || self->_count != *((_DWORD *)a3 + 2))
          goto LABEL_68;
      }
      else if ((v8 & 1) != 0)
      {
        goto LABEL_68;
      }
      if ((has & 8) != 0)
      {
        if ((v8 & 8) == 0 || self->_lteRsrpFr1 != *((_DWORD *)a3 + 7))
          goto LABEL_68;
      }
      else if ((v8 & 8) != 0)
      {
        goto LABEL_68;
      }
      if ((has & 0x10) != 0)
      {
        if ((v8 & 0x10) == 0 || self->_lteRsrpFr2 != *((_DWORD *)a3 + 8))
          goto LABEL_68;
      }
      else if ((v8 & 0x10) != 0)
      {
        goto LABEL_68;
      }
      LOBYTE(v5) = (v8 & 0x200) == 0;
      if ((*(_WORD *)&self->_has & 0x200) != 0)
      {
        if ((*((_WORD *)a3 + 34) & 0x200) == 0 || self->_nrSabw != *((_DWORD *)a3 + 13))
          goto LABEL_68;
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  __int16 has;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = -[NSString hash](self->_gci, "hash");
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v5 = 2654435761 * self->_dlBandwidth;
    if ((has & 0x40) != 0)
    {
LABEL_3:
      v6 = 2654435761 * self->_nrFr1;
      if ((has & 0x80) != 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else
  {
    v5 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_3;
  }
  v6 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    v7 = 2654435761 * self->_nrFr2;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  v7 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_5:
    v8 = 2654435761 * self->_nrRsrp;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  v8 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_6:
    v9 = 2654435761 * self->_nrSinr;
    if ((has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  v9 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    v10 = 2654435761 * self->_nrBw;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  v10 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_8:
    v11 = 2654435761 * self->_stallRate;
    if ((has & 4) != 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  v11 = 0;
  if ((has & 4) != 0)
  {
LABEL_9:
    v12 = 2654435761 * self->_latency;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  v12 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_10:
    v13 = 2654435761 * self->_stCount;
    if ((has & 1) != 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  v13 = 0;
  if ((has & 1) != 0)
  {
LABEL_11:
    v14 = 2654435761 * self->_count;
    if ((has & 8) != 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  v14 = 0;
  if ((has & 8) != 0)
  {
LABEL_12:
    v15 = 2654435761 * self->_lteRsrpFr1;
    if ((has & 0x10) != 0)
      goto LABEL_13;
LABEL_26:
    v16 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_14;
LABEL_27:
    v17 = 0;
    return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
  }
LABEL_25:
  v15 = 0;
  if ((has & 0x10) == 0)
    goto LABEL_26;
LABEL_13:
  v16 = 2654435761 * self->_lteRsrpFr2;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_27;
LABEL_14:
  v17 = 2654435761 * self->_nrSabw;
  return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
}

@end
