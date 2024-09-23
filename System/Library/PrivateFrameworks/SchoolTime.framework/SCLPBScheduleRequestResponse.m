@implementation SCLPBScheduleRequestResponse

- (BOOL)hasScheduleSettings
{
  return self->_scheduleSettings != 0;
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
  v8.super_class = (Class)SCLPBScheduleRequestResponse;
  -[SCLPBScheduleRequestResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLPBScheduleRequestResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SCLPBScheduleSettings *scheduleSettings;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  scheduleSettings = self->_scheduleSettings;
  if (scheduleSettings)
  {
    -[SCLPBScheduleSettings dictionaryRepresentation](scheduleSettings, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("scheduleSettings"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SCLPBScheduleRequestResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_scheduleSettings)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  SCLPBScheduleSettings *scheduleSettings;

  scheduleSettings = self->_scheduleSettings;
  if (scheduleSettings)
    objc_msgSend(a3, "setScheduleSettings:", scheduleSettings);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SCLPBScheduleSettings copyWithZone:](self->_scheduleSettings, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SCLPBScheduleSettings *scheduleSettings;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    scheduleSettings = self->_scheduleSettings;
    if ((unint64_t)scheduleSettings | v4[1])
      v6 = -[SCLPBScheduleSettings isEqual:](scheduleSettings, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[SCLPBScheduleSettings hash](self->_scheduleSettings, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SCLPBScheduleSettings *scheduleSettings;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  scheduleSettings = self->_scheduleSettings;
  v6 = v4[1];
  if (scheduleSettings)
  {
    if (v6)
    {
      v7 = v4;
      -[SCLPBScheduleSettings mergeFrom:](scheduleSettings, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[SCLPBScheduleRequestResponse setScheduleSettings:](self, "setScheduleSettings:");
    goto LABEL_6;
  }

}

- (SCLPBScheduleSettings)scheduleSettings
{
  return self->_scheduleSettings;
}

- (void)setScheduleSettings:(id)a3
{
  objc_storeStrong((id *)&self->_scheduleSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleSettings, 0);
}

@end
