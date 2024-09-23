@implementation KCellularLtePdcchStateStats

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)KCellularLtePdcchStateStats;
  -[KCellularLtePdcchStateStats dealloc](&v3, sel_dealloc);
}

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

- (unint64_t)pccPdcchStatesCount
{
  return self->_pccPdcchStates.count;
}

- (unsigned)pccPdcchStates
{
  return self->_pccPdcchStates.list;
}

- (void)clearPccPdcchStates
{
  PBRepeatedUInt32Clear();
}

- (void)addPccPdcchState:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)pccPdcchStateAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_pccPdcchStates;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_pccPdcchStates = &self->_pccPdcchStates;
  count = self->_pccPdcchStates.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_pccPdcchStates->list[a3];
}

- (void)setPccPdcchStates:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)scc0PdcchStatesCount
{
  return self->_scc0PdcchStates.count;
}

- (unsigned)scc0PdcchStates
{
  return self->_scc0PdcchStates.list;
}

- (void)clearScc0PdcchStates
{
  PBRepeatedUInt32Clear();
}

- (void)addScc0PdcchState:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)scc0PdcchStateAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_scc0PdcchStates;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_scc0PdcchStates = &self->_scc0PdcchStates;
  count = self->_scc0PdcchStates.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_scc0PdcchStates->list[a3];
}

- (void)setScc0PdcchStates:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)scc1PdcchStatesCount
{
  return self->_scc1PdcchStates.count;
}

- (unsigned)scc1PdcchStates
{
  return self->_scc1PdcchStates.list;
}

- (void)clearScc1PdcchStates
{
  PBRepeatedUInt32Clear();
}

- (void)addScc1PdcchState:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)scc1PdcchStateAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_scc1PdcchStates;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_scc1PdcchStates = &self->_scc1PdcchStates;
  count = self->_scc1PdcchStates.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_scc1PdcchStates->list[a3];
}

- (void)setScc1PdcchStates:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (void)setDurationMs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_durationMs = a3;
}

- (void)setHasDurationMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDurationMs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (unint64_t)scc2PdcchStatesCount
{
  return self->_scc2PdcchStates.count;
}

- (unsigned)scc2PdcchStates
{
  return self->_scc2PdcchStates.list;
}

- (void)clearScc2PdcchStates
{
  PBRepeatedUInt32Clear();
}

- (void)addScc2PdcchState:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)scc2PdcchStateAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_scc2PdcchStates;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_scc2PdcchStates = &self->_scc2PdcchStates;
  count = self->_scc2PdcchStates.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_scc2PdcchStates->list[a3];
}

- (void)setScc2PdcchStates:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)scc3PdcchStatesCount
{
  return self->_scc3PdcchStates.count;
}

- (unsigned)scc3PdcchStates
{
  return self->_scc3PdcchStates.list;
}

- (void)clearScc3PdcchStates
{
  PBRepeatedUInt32Clear();
}

- (void)addScc3PdcchState:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)scc3PdcchStateAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_scc3PdcchStates;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_scc3PdcchStates = &self->_scc3PdcchStates;
  count = self->_scc3PdcchStates.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_scc3PdcchStates->list[a3];
}

- (void)setScc3PdcchStates:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (void)setSubsId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSubsId
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
  v8.super_class = (Class)KCellularLtePdcchStateStats;
  -[KCellularLtePdcchStateStats description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCellularLtePdcchStateStats dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  }
  PBRepeatedUInt32NSArray();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("pcc_pdcch_state"));

  PBRepeatedUInt32NSArray();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("scc0_pdcch_state"));

  PBRepeatedUInt32NSArray();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("scc1_pdcch_state"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_durationMs);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("duration_ms"));

  }
  PBRepeatedUInt32NSArray();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("scc2_pdcch_state"));

  PBRepeatedUInt32NSArray();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("scc3_pdcch_state"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_subsId);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("subs_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return KCellularLtePdcchStateStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v10;
  }
  if (self->_pccPdcchStates.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      v4 = v10;
      ++v5;
    }
    while (v5 < self->_pccPdcchStates.count);
  }
  if (self->_scc0PdcchStates.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      v4 = v10;
      ++v6;
    }
    while (v6 < self->_scc0PdcchStates.count);
  }
  if (self->_scc1PdcchStates.count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      v4 = v10;
      ++v7;
    }
    while (v7 < self->_scc1PdcchStates.count);
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v10;
  }
  if (self->_scc2PdcchStates.count)
  {
    v8 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      v4 = v10;
      ++v8;
    }
    while (v8 < self->_scc2PdcchStates.count);
  }
  if (self->_scc3PdcchStates.count)
  {
    v9 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      v4 = v10;
      ++v9;
    }
    while (v9 < self->_scc3PdcchStates.count);
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v10;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  unint64_t v11;
  unint64_t v12;
  uint64_t k;
  unint64_t v14;
  unint64_t v15;
  uint64_t m;
  unint64_t v17;
  unint64_t v18;
  uint64_t n;
  id v20;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[16] = self->_timestamp;
    *((_BYTE *)v4 + 144) |= 1u;
  }
  v20 = v4;
  if (-[KCellularLtePdcchStateStats pccPdcchStatesCount](self, "pccPdcchStatesCount"))
  {
    objc_msgSend(v20, "clearPccPdcchStates");
    v5 = -[KCellularLtePdcchStateStats pccPdcchStatesCount](self, "pccPdcchStatesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(v20, "addPccPdcchState:", -[KCellularLtePdcchStateStats pccPdcchStateAtIndex:](self, "pccPdcchStateAtIndex:", i));
    }
  }
  if (-[KCellularLtePdcchStateStats scc0PdcchStatesCount](self, "scc0PdcchStatesCount"))
  {
    objc_msgSend(v20, "clearScc0PdcchStates");
    v8 = -[KCellularLtePdcchStateStats scc0PdcchStatesCount](self, "scc0PdcchStatesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(v20, "addScc0PdcchState:", -[KCellularLtePdcchStateStats scc0PdcchStateAtIndex:](self, "scc0PdcchStateAtIndex:", j));
    }
  }
  if (-[KCellularLtePdcchStateStats scc1PdcchStatesCount](self, "scc1PdcchStatesCount"))
  {
    objc_msgSend(v20, "clearScc1PdcchStates");
    v11 = -[KCellularLtePdcchStateStats scc1PdcchStatesCount](self, "scc1PdcchStatesCount");
    if (v11)
    {
      v12 = v11;
      for (k = 0; k != v12; ++k)
        objc_msgSend(v20, "addScc1PdcchState:", -[KCellularLtePdcchStateStats scc1PdcchStateAtIndex:](self, "scc1PdcchStateAtIndex:", k));
    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v20 + 34) = self->_durationMs;
    *((_BYTE *)v20 + 144) |= 2u;
  }
  if (-[KCellularLtePdcchStateStats scc2PdcchStatesCount](self, "scc2PdcchStatesCount"))
  {
    objc_msgSend(v20, "clearScc2PdcchStates");
    v14 = -[KCellularLtePdcchStateStats scc2PdcchStatesCount](self, "scc2PdcchStatesCount");
    if (v14)
    {
      v15 = v14;
      for (m = 0; m != v15; ++m)
        objc_msgSend(v20, "addScc2PdcchState:", -[KCellularLtePdcchStateStats scc2PdcchStateAtIndex:](self, "scc2PdcchStateAtIndex:", m));
    }
  }
  if (-[KCellularLtePdcchStateStats scc3PdcchStatesCount](self, "scc3PdcchStatesCount"))
  {
    objc_msgSend(v20, "clearScc3PdcchStates");
    v17 = -[KCellularLtePdcchStateStats scc3PdcchStatesCount](self, "scc3PdcchStatesCount");
    if (v17)
    {
      v18 = v17;
      for (n = 0; n != v18; ++n)
        objc_msgSend(v20, "addScc3PdcchState:", -[KCellularLtePdcchStateStats scc3PdcchStateAtIndex:](self, "scc3PdcchStateAtIndex:", n));
    }
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v20 + 35) = self->_subsId;
    *((_BYTE *)v20 + 144) |= 4u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v4 + 128) = self->_timestamp;
    *(_BYTE *)(v4 + 144) |= 1u;
  }
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_durationMs;
    *(_BYTE *)(v5 + 144) |= 2u;
  }
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 140) = self->_subsId;
    *(_BYTE *)(v5 + 144) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 144) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 16))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 144) & 1) != 0)
  {
LABEL_21:
    v5 = 0;
    goto LABEL_22;
  }
  if (!PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual())
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 144) & 2) == 0 || self->_durationMs != *((_DWORD *)v4 + 34))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 144) & 2) != 0)
  {
    goto LABEL_21;
  }
  if (!PBRepeatedUInt32IsEqual() || !PBRepeatedUInt32IsEqual())
    goto LABEL_21;
  v5 = (*((_BYTE *)v4 + 144) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 144) & 4) == 0 || self->_subsId != *((_DWORD *)v4 + 35))
      goto LABEL_21;
    v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = PBRepeatedUInt32Hash();
  v5 = PBRepeatedUInt32Hash();
  v6 = PBRepeatedUInt32Hash();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v7 = 2654435761 * self->_durationMs;
  else
    v7 = 0;
  v8 = PBRepeatedUInt32Hash();
  v9 = PBRepeatedUInt32Hash();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v10 = 2654435761 * self->_subsId;
  else
    v10 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  uint64_t v11;
  uint64_t v12;
  uint64_t k;
  uint64_t v14;
  uint64_t v15;
  uint64_t m;
  uint64_t v17;
  uint64_t v18;
  uint64_t n;
  unsigned int *v20;

  v4 = (unsigned int *)a3;
  if ((v4[36] & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 16);
    *(_BYTE *)&self->_has |= 1u;
  }
  v20 = v4;
  v5 = objc_msgSend(v4, "pccPdcchStatesCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[KCellularLtePdcchStateStats addPccPdcchState:](self, "addPccPdcchState:", objc_msgSend(v20, "pccPdcchStateAtIndex:", i));
  }
  v8 = objc_msgSend(v20, "scc0PdcchStatesCount");
  if (v8)
  {
    v9 = v8;
    for (j = 0; j != v9; ++j)
      -[KCellularLtePdcchStateStats addScc0PdcchState:](self, "addScc0PdcchState:", objc_msgSend(v20, "scc0PdcchStateAtIndex:", j));
  }
  v11 = objc_msgSend(v20, "scc1PdcchStatesCount");
  if (v11)
  {
    v12 = v11;
    for (k = 0; k != v12; ++k)
      -[KCellularLtePdcchStateStats addScc1PdcchState:](self, "addScc1PdcchState:", objc_msgSend(v20, "scc1PdcchStateAtIndex:", k));
  }
  if ((v20[36] & 2) != 0)
  {
    self->_durationMs = v20[34];
    *(_BYTE *)&self->_has |= 2u;
  }
  v14 = objc_msgSend(v20, "scc2PdcchStatesCount");
  if (v14)
  {
    v15 = v14;
    for (m = 0; m != v15; ++m)
      -[KCellularLtePdcchStateStats addScc2PdcchState:](self, "addScc2PdcchState:", objc_msgSend(v20, "scc2PdcchStateAtIndex:", m));
  }
  v17 = objc_msgSend(v20, "scc3PdcchStatesCount");
  if (v17)
  {
    v18 = v17;
    for (n = 0; n != v18; ++n)
      -[KCellularLtePdcchStateStats addScc3PdcchState:](self, "addScc3PdcchState:", objc_msgSend(v20, "scc3PdcchStateAtIndex:", n));
  }
  if ((v20[36] & 4) != 0)
  {
    self->_subsId = v20[35];
    *(_BYTE *)&self->_has |= 4u;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)durationMs
{
  return self->_durationMs;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end
