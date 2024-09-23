@implementation AWDSafariUnableToSilentlyMigrateToCKBookmarksEvent

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDSafariUnableToSilentlyMigrateToCKBookmarksEvent;
  -[AWDSafariUnableToSilentlyMigrateToCKBookmarksEvent dealloc](&v3, sel_dealloc);
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

- (unint64_t)reasonsCount
{
  return self->_reasons.count;
}

- (int)reasons
{
  return self->_reasons.list;
}

- (void)clearReasons
{
  PBRepeatedInt32Clear();
}

- (void)addReason:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)reasonAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_reasons;
  unint64_t count;

  p_reasons = &self->_reasons;
  count = self->_reasons.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_reasons->list[a3];
}

- (void)setReasons:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (id)reasonsAsString:(int)a3
{
  if (a3 >= 9)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10E330[a3];
}

- (int)StringAsReasons:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("SIGNED_OUT_OF_ICLOUD_OR_ACCOUNT_IS_MAID")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("EXCLUDED_FROM_MIGRATION_RAMP")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("STILL_IN_GRACE_PERIOD")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("INELIGIBLE_MAC_OR_IOS_DEVICE_IN_CLOUD_TABS")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("INELIGIBLE_WINDOWS_DEVICE")) & 1) != 0)
    return 4;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("WINDOWS_INFO_NOT_AVAILABLE")) & 1) != 0)
    return 5;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("INELIGIBLE_DEVICE_IN_ACCOUNT_LIST")) & 1) != 0)
    return 6;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CLOUD_TAB_DEVICES_OUT_OF_DATE")) & 1) != 0)
    return 7;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("SAFARI_SYNC_DISABLED")))
    return 8;
  return 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDSafariUnableToSilentlyMigrateToCKBookmarksEvent;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDSafariUnableToSilentlyMigrateToCKBookmarksEvent description](&v3, sel_description), -[AWDSafariUnableToSilentlyMigrateToCKBookmarksEvent dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_reasons;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  __CFString *v8;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  p_reasons = &self->_reasons;
  if (self->_reasons.count)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:");
    if (p_reasons->count)
    {
      v6 = 0;
      do
      {
        v7 = p_reasons->list[v6];
        if (v7 >= 9)
          v8 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), p_reasons->list[v6]);
        else
          v8 = off_24C10E330[v7];
        objc_msgSend(v5, "addObject:", v8);
        ++v6;
      }
      while (v6 < p_reasons->count);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("reason"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSafariUnableToSilentlyMigrateToCKBookmarksEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_reasons;
  unint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  p_reasons = &self->_reasons;
  if (p_reasons->count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v5;
    }
    while (v5 < p_reasons->count);
  }
}

- (void)copyTo:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 4) = self->_timestamp;
    *((_BYTE *)a3 + 40) |= 1u;
  }
  if (-[AWDSafariUnableToSilentlyMigrateToCKBookmarksEvent reasonsCount](self, "reasonsCount"))
  {
    objc_msgSend(a3, "clearReasons");
    v5 = -[AWDSafariUnableToSilentlyMigrateToCKBookmarksEvent reasonsCount](self, "reasonsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addReason:", -[AWDSafariUnableToSilentlyMigrateToCKBookmarksEvent reasonAtIndex:](self, "reasonAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v4 + 32) = self->_timestamp;
    *(_BYTE *)(v4 + 40) |= 1u;
  }
  PBRepeatedInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (!objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()))
    return 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 40) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 4))
      return 0;
    return PBRepeatedInt32IsEqual();
  }
  if ((*((_BYTE *)a3 + 40) & 1) == 0)
    return PBRepeatedInt32IsEqual();
  return 0;
}

- (unint64_t)hash
{
  unint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761u * self->_timestamp;
  else
    v2 = 0;
  return PBRepeatedInt32Hash() ^ v2;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;

  if ((*((_BYTE *)a3 + 40) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = objc_msgSend(a3, "reasonsCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[AWDSafariUnableToSilentlyMigrateToCKBookmarksEvent addReason:](self, "addReason:", objc_msgSend(a3, "reasonAtIndex:", i));
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

@end
