@implementation AWDCoreRoutineLocationAwarenessBasicHistogram

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLocationAwarenessBasicHistogram;
  -[AWDCoreRoutineLocationAwarenessBasicHistogram dealloc](&v3, sel_dealloc);
}

- (unint64_t)countsCount
{
  return self->_counts.count;
}

- (int)counts
{
  return self->_counts.list;
}

- (void)clearCounts
{
  PBRepeatedInt32Clear();
}

- (void)addCount:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)countAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_counts;
  unint64_t count;

  p_counts = &self->_counts;
  count = self->_counts.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_counts->list[a3];
}

- (void)setCounts:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLocationAwarenessBasicHistogram;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutineLocationAwarenessBasicHistogram description](&v3, sel_description), -[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  objc_msgSend(v2, "setObject:forKey:", PBRepeatedInt32NSArray(), CFSTR("count"));
  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineLocationAwarenessBasicHistogramReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_counts;
  unint64_t v4;

  p_counts = &self->_counts;
  if (self->_counts.count)
  {
    v4 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v4;
    }
    while (v4 < p_counts->count);
  }
}

- (void)copyTo:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;

  if (-[AWDCoreRoutineLocationAwarenessBasicHistogram countsCount](self, "countsCount"))
  {
    objc_msgSend(a3, "clearCounts");
    v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram countsCount](self, "countsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addCount:", -[AWDCoreRoutineLocationAwarenessBasicHistogram countAtIndex:](self, "countAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;

  v3 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedInt32Copy();
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  int v3;

  v3 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v3)
    LOBYTE(v3) = PBRepeatedInt32IsEqual();
  return v3;
}

- (unint64_t)hash
{
  return PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;

  v5 = objc_msgSend(a3, "countsCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[AWDCoreRoutineLocationAwarenessBasicHistogram addCount:](self, "addCount:", objc_msgSend(a3, "countAtIndex:", i));
  }
}

@end
