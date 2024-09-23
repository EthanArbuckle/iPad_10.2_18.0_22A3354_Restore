@implementation AWDSpringBoardFolderStats

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDSpringBoardFolderStats;
  -[AWDSpringBoardFolderStats dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTotalNumberOfFolders:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_totalNumberOfFolders = a3;
}

- (void)setHasTotalNumberOfFolders:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTotalNumberOfFolders
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setNumberOfPagesInRootFolder:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numberOfPagesInRootFolder = a3;
}

- (void)setHasNumberOfPagesInRootFolder:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumberOfPagesInRootFolder
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTotalNumberOfIconsInDock:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_totalNumberOfIconsInDock = a3;
}

- (void)setHasTotalNumberOfIconsInDock:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTotalNumberOfIconsInDock
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setNumberOfFoldersInDock:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numberOfFoldersInDock = a3;
}

- (void)setHasNumberOfFoldersInDock:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumberOfFoldersInDock
{
  return *(_BYTE *)&self->_has & 1;
}

- (unint64_t)numberOfFoldersPerPagesCount
{
  return self->_numberOfFoldersPerPages.count;
}

- (unint64_t)numberOfFoldersPerPages
{
  return self->_numberOfFoldersPerPages.list;
}

- (void)clearNumberOfFoldersPerPages
{
  PBRepeatedUInt64Clear();
}

- (void)addNumberOfFoldersPerPage:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)numberOfFoldersPerPageAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_numberOfFoldersPerPages;
  unint64_t count;

  p_numberOfFoldersPerPages = &self->_numberOfFoldersPerPages;
  count = self->_numberOfFoldersPerPages.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_numberOfFoldersPerPages->list[a3];
}

- (void)setNumberOfFoldersPerPages:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDSpringBoardFolderStats;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDSpringBoardFolderStats description](&v3, sel_description), -[AWDSpringBoardFolderStats dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_totalNumberOfFolders), CFSTR("totalNumberOfFolders"));
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
LABEL_11:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_totalNumberOfIconsInDock), CFSTR("totalNumberOfIconsInDock"));
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_numberOfPagesInRootFolder), CFSTR("numberOfPagesInRootFolder"));
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 1) != 0)
LABEL_6:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_numberOfFoldersInDock), CFSTR("numberOfFoldersInDock"));
LABEL_7:
  objc_msgSend(v3, "setObject:forKey:", PBRepeatedUInt64NSArray(), CFSTR("numberOfFoldersPerPage"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSpringBoardFolderStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  $D9041E0417540B7714261C3B5E8BB314 *p_numberOfFoldersPerPages;
  unint64_t v6;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_14:
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_6:
    PBDataWriterWriteUint64Field();
LABEL_7:
  p_numberOfFoldersPerPages = &self->_numberOfFoldersPerPages;
  if (p_numberOfFoldersPerPages->count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v6;
    }
    while (v6 < p_numberOfFoldersPerPages->count);
  }
}

- (void)copyTo:(id)a3
{
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)a3 + 6) = self->_timestamp;
    *((_BYTE *)a3 + 72) |= 4u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 7) = self->_totalNumberOfFolders;
  *((_BYTE *)a3 + 72) |= 8u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
LABEL_15:
    *((_QWORD *)a3 + 8) = self->_totalNumberOfIconsInDock;
    *((_BYTE *)a3 + 72) |= 0x10u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_14:
  *((_QWORD *)a3 + 5) = self->_numberOfPagesInRootFolder;
  *((_BYTE *)a3 + 72) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_15;
LABEL_5:
  if ((has & 1) != 0)
  {
LABEL_6:
    *((_QWORD *)a3 + 4) = self->_numberOfFoldersInDock;
    *((_BYTE *)a3 + 72) |= 1u;
  }
LABEL_7:
  if (-[AWDSpringBoardFolderStats numberOfFoldersPerPagesCount](self, "numberOfFoldersPerPagesCount"))
  {
    objc_msgSend(a3, "clearNumberOfFoldersPerPages");
    v6 = -[AWDSpringBoardFolderStats numberOfFoldersPerPagesCount](self, "numberOfFoldersPerPagesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addNumberOfFoldersPerPage:", -[AWDSpringBoardFolderStats numberOfFoldersPerPageAtIndex:](self, "numberOfFoldersPerPageAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  char has;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_QWORD *)(v4 + 48) = self->_timestamp;
    *(_BYTE *)(v4 + 72) |= 4u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v4 + 56) = self->_totalNumberOfFolders;
  *(_BYTE *)(v4 + 72) |= 8u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
LABEL_11:
    *(_QWORD *)(v4 + 64) = self->_totalNumberOfIconsInDock;
    *(_BYTE *)(v4 + 72) |= 0x10u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  *(_QWORD *)(v4 + 40) = self->_numberOfPagesInRootFolder;
  *(_BYTE *)(v4 + 72) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 1) != 0)
  {
LABEL_6:
    *(_QWORD *)(v4 + 32) = self->_numberOfFoldersInDock;
    *(_BYTE *)(v4 + 72) |= 1u;
  }
LABEL_7:
  PBRepeatedUInt64Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (!objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()))
    return 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 72) & 4) == 0 || self->_timestamp != *((_QWORD *)a3 + 6))
      return 0;
LABEL_7:
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 8) == 0 || self->_totalNumberOfFolders != *((_QWORD *)a3 + 7))
        return 0;
    }
    else if ((*((_BYTE *)a3 + 72) & 8) != 0)
    {
      return 0;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 2) == 0 || self->_numberOfPagesInRootFolder != *((_QWORD *)a3 + 5))
        return 0;
    }
    else if ((*((_BYTE *)a3 + 72) & 2) != 0)
    {
      return 0;
    }
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 0x10) == 0 || self->_totalNumberOfIconsInDock != *((_QWORD *)a3 + 8))
        return 0;
    }
    else if ((*((_BYTE *)a3 + 72) & 0x10) != 0)
    {
      return 0;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 72) & 1) == 0 || self->_numberOfFoldersInDock != *((_QWORD *)a3 + 4))
        return 0;
    }
    else if ((*((_BYTE *)a3 + 72) & 1) != 0)
    {
      return 0;
    }
    return PBRepeatedUInt64IsEqual();
  }
  if ((*((_BYTE *)a3 + 72) & 4) == 0)
    goto LABEL_7;
  return 0;
}

- (unint64_t)hash
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v3 = 2654435761u * self->_totalNumberOfFolders;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    v4 = 2654435761u * self->_numberOfPagesInRootFolder;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_5;
LABEL_10:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
LABEL_11:
    v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ PBRepeatedUInt64Hash();
  }
LABEL_9:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_10;
LABEL_5:
  v5 = 2654435761u * self->_totalNumberOfIconsInDock;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_11;
LABEL_6:
  v6 = 2654435761u * self->_numberOfFoldersInDock;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ PBRepeatedUInt64Hash();
}

- (void)mergeFrom:(id)a3
{
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;

  v5 = *((_BYTE *)a3 + 72);
  if ((v5 & 4) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)a3 + 72);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)a3 + 72) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_totalNumberOfFolders = *((_QWORD *)a3 + 7);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)a3 + 72);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  self->_numberOfPagesInRootFolder = *((_QWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)a3 + 72);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_14:
  self->_totalNumberOfIconsInDock = *((_QWORD *)a3 + 8);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((*((_BYTE *)a3 + 72) & 1) != 0)
  {
LABEL_6:
    self->_numberOfFoldersInDock = *((_QWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_7:
  v6 = objc_msgSend(a3, "numberOfFoldersPerPagesCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[AWDSpringBoardFolderStats addNumberOfFoldersPerPage:](self, "addNumberOfFoldersPerPage:", objc_msgSend(a3, "numberOfFoldersPerPageAtIndex:", i));
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)totalNumberOfFolders
{
  return self->_totalNumberOfFolders;
}

- (unint64_t)numberOfPagesInRootFolder
{
  return self->_numberOfPagesInRootFolder;
}

- (unint64_t)totalNumberOfIconsInDock
{
  return self->_totalNumberOfIconsInDock;
}

- (unint64_t)numberOfFoldersInDock
{
  return self->_numberOfFoldersInDock;
}

@end
