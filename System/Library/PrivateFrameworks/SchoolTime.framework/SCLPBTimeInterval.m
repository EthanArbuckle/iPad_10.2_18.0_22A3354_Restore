@implementation SCLPBTimeInterval

- (BOOL)hasStartTime
{
  return self->_startTime != 0;
}

- (BOOL)hasEndTime
{
  return self->_endTime != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)SCLPBTimeInterval;
  -[SCLPBTimeInterval description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLPBTimeInterval dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SCLPBScheduleTime *startTime;
  void *v5;
  SCLPBScheduleTime *endTime;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  startTime = self->_startTime;
  if (startTime)
  {
    -[SCLPBScheduleTime dictionaryRepresentation](startTime, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("startTime"));

  }
  endTime = self->_endTime;
  if (endTime)
  {
    -[SCLPBScheduleTime dictionaryRepresentation](endTime, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("endTime"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SCLPBTimeIntervalReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_startTime)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_endTime)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_startTime)
  {
    objc_msgSend(v4, "setStartTime:");
    v4 = v5;
  }
  if (self->_endTime)
  {
    objc_msgSend(v5, "setEndTime:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SCLPBScheduleTime copyWithZone:](self->_startTime, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[SCLPBScheduleTime copyWithZone:](self->_endTime, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SCLPBScheduleTime *startTime;
  SCLPBScheduleTime *endTime;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((startTime = self->_startTime, !((unint64_t)startTime | v4[2]))
     || -[SCLPBScheduleTime isEqual:](startTime, "isEqual:")))
  {
    endTime = self->_endTime;
    if ((unint64_t)endTime | v4[1])
      v7 = -[SCLPBScheduleTime isEqual:](endTime, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[SCLPBScheduleTime hash](self->_startTime, "hash");
  return -[SCLPBScheduleTime hash](self->_endTime, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SCLPBScheduleTime *startTime;
  uint64_t v6;
  SCLPBScheduleTime *endTime;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  startTime = self->_startTime;
  v6 = v4[2];
  v9 = v4;
  if (startTime)
  {
    if (!v6)
      goto LABEL_7;
    -[SCLPBScheduleTime mergeFrom:](startTime, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[SCLPBTimeInterval setStartTime:](self, "setStartTime:");
  }
  v4 = v9;
LABEL_7:
  endTime = self->_endTime;
  v8 = v4[1];
  if (endTime)
  {
    if (v8)
    {
      -[SCLPBScheduleTime mergeFrom:](endTime, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[SCLPBTimeInterval setEndTime:](self, "setEndTime:");
    goto LABEL_12;
  }

}

- (SCLPBScheduleTime)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
}

- (SCLPBScheduleTime)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
  objc_storeStrong((id *)&self->_endTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
}

@end
