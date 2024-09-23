@implementation KCellularFwCoreStats

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasGeraStats
{
  return self->_geraStats != 0;
}

- (BOOL)hasUtraFddStats
{
  return self->_utraFddStats != 0;
}

- (BOOL)hasUtraTddStats
{
  return self->_utraTddStats != 0;
}

- (BOOL)hasEutraStats
{
  return self->_eutraStats != 0;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSubsId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)KCellularFwCoreStats;
  -[KCellularFwCoreStats description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCellularFwCoreStats dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  GeraStats *geraStats;
  void *v6;
  UtraFddStats *utraFddStats;
  void *v8;
  UtraTddStats *utraTddStats;
  void *v10;
  EutraStats *eutraStats;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  }
  geraStats = self->_geraStats;
  if (geraStats)
  {
    -[GeraStats dictionaryRepresentation](geraStats, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("gera_stats"));

  }
  utraFddStats = self->_utraFddStats;
  if (utraFddStats)
  {
    -[UtraFddStats dictionaryRepresentation](utraFddStats, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("utra_fdd_stats"));

  }
  utraTddStats = self->_utraTddStats;
  if (utraTddStats)
  {
    -[UtraTddStats dictionaryRepresentation](utraTddStats, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("utra_tdd_stats"));

  }
  eutraStats = self->_eutraStats;
  if (eutraStats)
  {
    -[EutraStats dictionaryRepresentation](eutraStats, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("eutra_stats"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_subsId);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("subs_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return KCellularFwCoreStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_geraStats)
    PBDataWriterWriteSubmessage();
  if (self->_utraFddStats)
    PBDataWriterWriteSubmessage();
  if (self->_utraTddStats)
    PBDataWriterWriteSubmessage();
  if (self->_eutraStats)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 56) |= 1u;
  }
  v5 = v4;
  if (self->_geraStats)
  {
    objc_msgSend(v4, "setGeraStats:");
    v4 = v5;
  }
  if (self->_utraFddStats)
  {
    objc_msgSend(v5, "setUtraFddStats:");
    v4 = v5;
  }
  if (self->_utraTddStats)
  {
    objc_msgSend(v5, "setUtraTddStats:");
    v4 = v5;
  }
  if (self->_eutraStats)
  {
    objc_msgSend(v5, "setEutraStats:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_subsId;
    *((_BYTE *)v4 + 56) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v7 = -[GeraStats copyWithZone:](self->_geraStats, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v7;

  v9 = -[UtraFddStats copyWithZone:](self->_utraFddStats, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v9;

  v11 = -[UtraTddStats copyWithZone:](self->_utraTddStats, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v11;

  v13 = -[EutraStats copyWithZone:](self->_eutraStats, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v13;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_subsId;
    *(_BYTE *)(v6 + 56) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GeraStats *geraStats;
  UtraFddStats *utraFddStats;
  UtraTddStats *utraTddStats;
  EutraStats *eutraStats;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_19:
    v9 = 0;
    goto LABEL_20;
  }
  geraStats = self->_geraStats;
  if ((unint64_t)geraStats | *((_QWORD *)v4 + 3) && !-[GeraStats isEqual:](geraStats, "isEqual:"))
    goto LABEL_19;
  utraFddStats = self->_utraFddStats;
  if ((unint64_t)utraFddStats | *((_QWORD *)v4 + 5))
  {
    if (!-[UtraFddStats isEqual:](utraFddStats, "isEqual:"))
      goto LABEL_19;
  }
  utraTddStats = self->_utraTddStats;
  if ((unint64_t)utraTddStats | *((_QWORD *)v4 + 6))
  {
    if (!-[UtraTddStats isEqual:](utraTddStats, "isEqual:"))
      goto LABEL_19;
  }
  eutraStats = self->_eutraStats;
  if ((unint64_t)eutraStats | *((_QWORD *)v4 + 2))
  {
    if (!-[EutraStats isEqual:](eutraStats, "isEqual:"))
      goto LABEL_19;
  }
  v9 = (*((_BYTE *)v4 + 56) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_subsId != *((_DWORD *)v4 + 8))
      goto LABEL_19;
    v9 = 1;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[GeraStats hash](self->_geraStats, "hash");
  v5 = -[UtraFddStats hash](self->_utraFddStats, "hash");
  v6 = -[UtraTddStats hash](self->_utraTddStats, "hash");
  v7 = -[EutraStats hash](self->_eutraStats, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v8 = 2654435761 * self->_subsId;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  id v5;
  GeraStats *geraStats;
  uint64_t v7;
  UtraFddStats *utraFddStats;
  uint64_t v9;
  UtraTddStats *utraTddStats;
  uint64_t v11;
  EutraStats *eutraStats;
  uint64_t v13;
  id v14;

  v4 = a3;
  v5 = v4;
  if ((v4[7] & 1) != 0)
  {
    self->_timestamp = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  geraStats = self->_geraStats;
  v7 = *((_QWORD *)v5 + 3);
  v14 = v5;
  if (geraStats)
  {
    if (!v7)
      goto LABEL_9;
    -[GeraStats mergeFrom:](geraStats, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[KCellularFwCoreStats setGeraStats:](self, "setGeraStats:");
  }
  v5 = v14;
LABEL_9:
  utraFddStats = self->_utraFddStats;
  v9 = *((_QWORD *)v5 + 5);
  if (utraFddStats)
  {
    if (!v9)
      goto LABEL_15;
    -[UtraFddStats mergeFrom:](utraFddStats, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_15;
    -[KCellularFwCoreStats setUtraFddStats:](self, "setUtraFddStats:");
  }
  v5 = v14;
LABEL_15:
  utraTddStats = self->_utraTddStats;
  v11 = *((_QWORD *)v5 + 6);
  if (utraTddStats)
  {
    if (!v11)
      goto LABEL_21;
    -[UtraTddStats mergeFrom:](utraTddStats, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_21;
    -[KCellularFwCoreStats setUtraTddStats:](self, "setUtraTddStats:");
  }
  v5 = v14;
LABEL_21:
  eutraStats = self->_eutraStats;
  v13 = *((_QWORD *)v5 + 2);
  if (eutraStats)
  {
    if (!v13)
      goto LABEL_27;
    -[EutraStats mergeFrom:](eutraStats, "mergeFrom:");
  }
  else
  {
    if (!v13)
      goto LABEL_27;
    -[KCellularFwCoreStats setEutraStats:](self, "setEutraStats:");
  }
  v5 = v14;
LABEL_27:
  if ((*((_BYTE *)v5 + 56) & 2) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 8);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (GeraStats)geraStats
{
  return self->_geraStats;
}

- (void)setGeraStats:(id)a3
{
  objc_storeStrong((id *)&self->_geraStats, a3);
}

- (UtraFddStats)utraFddStats
{
  return self->_utraFddStats;
}

- (void)setUtraFddStats:(id)a3
{
  objc_storeStrong((id *)&self->_utraFddStats, a3);
}

- (UtraTddStats)utraTddStats
{
  return self->_utraTddStats;
}

- (void)setUtraTddStats:(id)a3
{
  objc_storeStrong((id *)&self->_utraTddStats, a3);
}

- (EutraStats)eutraStats
{
  return self->_eutraStats;
}

- (void)setEutraStats:(id)a3
{
  objc_storeStrong((id *)&self->_eutraStats, a3);
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utraTddStats, 0);
  objc_storeStrong((id *)&self->_utraFddStats, 0);
  objc_storeStrong((id *)&self->_geraStats, 0);
  objc_storeStrong((id *)&self->_eutraStats, 0);
}

@end
