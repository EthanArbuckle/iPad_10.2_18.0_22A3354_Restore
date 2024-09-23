@implementation ALMotionState

- (void)dealloc
{
  objc_super v3;

  -[ALMotionState setMotion:](self, "setMotion:", 0);
  -[ALMotionState setNatalieFeatures:](self, "setNatalieFeatures:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ALMotionState;
  -[ALMotionState dealloc](&v3, "dealloc");
}

- (void)setTimestamp:(double)a3
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

- (BOOL)hasNatalieFeatures
{
  return self->_natalieFeatures != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALMotionState;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALMotionState description](&v3, "description"), -[ALMotionState dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  ALCMMotionContextMotionState *motion;
  ALCLNatalieFeatures *natalieFeatures;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestamp), CFSTR("timestamp"));
  motion = self->_motion;
  if (motion)
    objc_msgSend(v3, "setObject:forKey:", -[ALCMMotionContextMotionState dictionaryRepresentation](motion, "dictionaryRepresentation"), CFSTR("motion"));
  natalieFeatures = self->_natalieFeatures;
  if (natalieFeatures)
    objc_msgSend(v3, "setObject:forKey:", -[ALCLNatalieFeatures dictionaryRepresentation](natalieFeatures, "dictionaryRepresentation"), CFSTR("natalieFeatures"));
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_regularEntry), CFSTR("regularEntry"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1004B7EF4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  ALCMMotionContextMotionState *motion;
  ALCLNatalieFeatures *natalieFeatures;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField(a3, 1, self->_timestamp);
  motion = self->_motion;
  if (!motion)
    sub_1018FC518();
  PBDataWriterWriteSubmessage(a3, motion, 2);
  natalieFeatures = self->_natalieFeatures;
  if (natalieFeatures)
    PBDataWriterWriteSubmessage(a3, natalieFeatures, 3);
  PBDataWriterWriteBOOLField(a3, self->_regularEntry, 4);
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)a3 + 36) |= 1u;
  }
  objc_msgSend(a3, "setMotion:", self->_motion);
  if (self->_natalieFeatures)
    objc_msgSend(a3, "setNatalieFeatures:");
  *((_BYTE *)a3 + 32) = self->_regularEntry;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  id *v6;

  v5 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = *(id *)&self->_timestamp;
    *((_BYTE *)v5 + 36) |= 1u;
  }

  v6[2] = -[ALCMMotionContextMotionState copyWithZone:](self->_motion, "copyWithZone:", a3);
  v6[3] = -[ALCLNatalieFeatures copyWithZone:](self->_natalieFeatures, "copyWithZone:", a3);
  *((_BYTE *)v6 + 32) = self->_regularEntry;
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  ALCMMotionContextMotionState *motion;
  ALCLNatalieFeatures *natalieFeatures;
  int v8;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 1) == 0 || self->_timestamp != *((double *)a3 + 1))
        goto LABEL_13;
    }
    else if ((*((_BYTE *)a3 + 36) & 1) != 0)
    {
LABEL_13:
      LOBYTE(v5) = 0;
      return v5;
    }
    motion = self->_motion;
    if (!((unint64_t)motion | *((_QWORD *)a3 + 2))
      || (v5 = -[ALCMMotionContextMotionState isEqual:](motion, "isEqual:")) != 0)
    {
      natalieFeatures = self->_natalieFeatures;
      if (!((unint64_t)natalieFeatures | *((_QWORD *)a3 + 3))
        || (v5 = -[ALCLNatalieFeatures isEqual:](natalieFeatures, "isEqual:")) != 0)
      {
        v8 = *((unsigned __int8 *)a3 + 32);
        if (self->_regularEntry)
          LOBYTE(v5) = v8 != 0;
        else
          LOBYTE(v5) = v8 == 0;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  double timestamp;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    timestamp = self->_timestamp;
    v5 = -timestamp;
    if (timestamp >= 0.0)
      v5 = self->_timestamp;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v8 = -[ALCMMotionContextMotionState hash](self->_motion, "hash") ^ v3;
  return v8 ^ -[ALCLNatalieFeatures hash](self->_natalieFeatures, "hash") ^ (2654435761 * self->_regularEntry);
}

- (void)mergeFrom:(id)a3
{
  ALCMMotionContextMotionState *motion;
  uint64_t v6;
  ALCLNatalieFeatures *natalieFeatures;
  uint64_t v8;

  if ((*((_BYTE *)a3 + 36) & 1) != 0)
  {
    self->_timestamp = *((double *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  motion = self->_motion;
  v6 = *((_QWORD *)a3 + 2);
  if (motion)
  {
    if (v6)
      -[ALCMMotionContextMotionState mergeFrom:](motion, "mergeFrom:");
  }
  else if (v6)
  {
    -[ALMotionState setMotion:](self, "setMotion:");
  }
  natalieFeatures = self->_natalieFeatures;
  v8 = *((_QWORD *)a3 + 3);
  if (natalieFeatures)
  {
    if (v8)
      -[ALCLNatalieFeatures mergeFrom:](natalieFeatures, "mergeFrom:");
  }
  else if (v8)
  {
    -[ALMotionState setNatalieFeatures:](self, "setNatalieFeatures:");
  }
  self->_regularEntry = *((_BYTE *)a3 + 32);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (ALCMMotionContextMotionState)motion
{
  return self->_motion;
}

- (void)setMotion:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (ALCLNatalieFeatures)natalieFeatures
{
  return self->_natalieFeatures;
}

- (void)setNatalieFeatures:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (BOOL)regularEntry
{
  return self->_regularEntry;
}

- (void)setRegularEntry:(BOOL)a3
{
  self->_regularEntry = a3;
}

@end
