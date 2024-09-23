@implementation PPEventMetadata

- (PPEventMetadata)initWithTitlesAndParticipants:(id)a3 earliestStartTime:(double)a4 eventCount:(unint64_t)a5 eventHasAlarmCount:(unint64_t)a6
{
  id v12;
  PPEventMetadata *v13;
  PPEventMetadata *v14;
  void *v16;
  objc_super v17;

  v12 = a3;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPEventTuples.m"), 14, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("titlesAndParticipants != nil"));

  }
  v17.receiver = self;
  v17.super_class = (Class)PPEventMetadata;
  v13 = -[PPEventMetadata init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_titlesAndParticipants, a3);
    v14->_earliestStartTime = a4;
    v14->_eventCount = a5;
    v14->_eventHasAlarmCount = a6;
    v14->_ocnt_precomputedHash = -[PPEventMetadata _hash](v14, "_hash");
  }

  return v14;
}

- (id)copyWithReplacementTitlesAndParticipants:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTitlesAndParticipants:earliestStartTime:eventCount:eventHasAlarmCount:", v4, self->_eventCount, self->_eventHasAlarmCount, self->_earliestStartTime);

  return v5;
}

- (id)copyWithReplacementEarliestStartTime:(double)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTitlesAndParticipants:earliestStartTime:eventCount:eventHasAlarmCount:", self->_titlesAndParticipants, self->_eventCount, self->_eventHasAlarmCount, a3);
}

- (id)copyWithReplacementEventCount:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTitlesAndParticipants:earliestStartTime:eventCount:eventHasAlarmCount:", self->_titlesAndParticipants, a3, self->_eventHasAlarmCount, self->_earliestStartTime);
}

- (id)copyWithReplacementEventHasAlarmCount:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTitlesAndParticipants:earliestStartTime:eventCount:eventHasAlarmCount:", self->_titlesAndParticipants, self->_eventCount, a3, self->_earliestStartTime);
}

- (BOOL)isEqualToEventMetadata:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSDictionary *titlesAndParticipants;
  void *v10;
  int v11;
  double earliestStartTime;
  double v13;
  unint64_t eventCount;
  unint64_t eventHasAlarmCount;
  BOOL v16;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  v6 = self->_titlesAndParticipants != 0;
  objc_msgSend(v4, "titlesAndParticipants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_9;
  titlesAndParticipants = self->_titlesAndParticipants;
  if (titlesAndParticipants)
  {
    objc_msgSend(v5, "titlesAndParticipants");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSDictionary isEqual:](titlesAndParticipants, "isEqual:", v10);

    if (!v11)
      goto LABEL_9;
  }
  objc_msgSend(v5, "earliestStartTime", self->_earliestStartTime);
  earliestStartTime = self->_earliestStartTime;
  objc_msgSend(v5, "earliestStartTime");
  if (earliestStartTime == v13 && (eventCount = self->_eventCount, eventCount == objc_msgSend(v5, "eventCount")))
  {
    eventHasAlarmCount = self->_eventHasAlarmCount;
    v16 = eventHasAlarmCount == objc_msgSend(v5, "eventHasAlarmCount");
  }
  else
  {
LABEL_9:
    v16 = 0;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  PPEventMetadata *v4;
  PPEventMetadata *v5;
  BOOL v6;

  v4 = (PPEventMetadata *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PPEventMetadata isEqualToEventMetadata:](self, "isEqualToEventMetadata:", v5);

  return v6;
}

- (unint64_t)_hash
{
  uint64_t v3;
  double earliestStartTime;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;

  v3 = -[NSDictionary hash](self->_titlesAndParticipants, "hash");
  earliestStartTime = self->_earliestStartTime;
  v5 = -earliestStartTime;
  if (earliestStartTime >= 0.0)
    v5 = self->_earliestStartTime;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
  v9 = self->_eventCount - (v8 - v3 + 32 * v3) + 32 * (v8 - v3 + 32 * v3);
  return self->_eventHasAlarmCount - v9 + 32 * v9;
}

- (unint64_t)hash
{
  return self->_ocnt_precomputedHash;
}

- (id)description
{
  id v3;
  NSDictionary *titlesAndParticipants;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  titlesAndParticipants = self->_titlesAndParticipants;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_earliestStartTime);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_eventCount);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_eventHasAlarmCount);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<PPEventMetadata | titlesAndParticipants:%@ earliestStartTime:%@ eventCount:%@ eventHasAlarmCount:%@>"), titlesAndParticipants, v5, v6, v7);

  return v8;
}

- (NSDictionary)titlesAndParticipants
{
  return self->_titlesAndParticipants;
}

- (double)earliestStartTime
{
  return self->_earliestStartTime;
}

- (unint64_t)eventCount
{
  return self->_eventCount;
}

- (unint64_t)eventHasAlarmCount
{
  return self->_eventHasAlarmCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titlesAndParticipants, 0);
}

+ (PPEventMetadata)eventMetadataWithTitlesAndParticipants:(id)a3 earliestStartTime:(double)a4 eventCount:(unint64_t)a5 eventHasAlarmCount:(unint64_t)a6
{
  id v10;
  void *v11;

  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitlesAndParticipants:earliestStartTime:eventCount:eventHasAlarmCount:", v10, a5, a6, a4);

  return (PPEventMetadata *)v11;
}

@end
