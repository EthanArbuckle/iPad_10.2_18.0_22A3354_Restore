@implementation ALCLStairClimbingModel

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALCLStairClimbingModel;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALCLStairClimbingModel description](&v3, "description"), -[ALCLStairClimbingModel dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  double v4;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  *(float *)&v4 = self->_machineFrequency;
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4), CFSTR("machineFrequency"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100959B58((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteFloatField(a3, 1, self->_machineFrequency);
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = LODWORD(self->_machineFrequency);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = LODWORD(self->_machineFrequency);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
    LOBYTE(v5) = self->_machineFrequency == *((float *)a3 + 2);
  return v5;
}

- (unint64_t)hash
{
  float machineFrequency;
  float v3;
  float v4;
  float v5;
  float v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  machineFrequency = self->_machineFrequency;
  v3 = -machineFrequency;
  if (machineFrequency >= 0.0)
    v3 = self->_machineFrequency;
  v4 = floorf(v3 + 0.5);
  v5 = (float)(v3 - v4) * 1.8447e19;
  v6 = fmodf(v4, 1.8447e19);
  v7 = 2654435761u * (unint64_t)v6;
  v8 = v7 + (unint64_t)v5;
  if (v5 <= 0.0)
    v8 = 2654435761u * (unint64_t)v6;
  v9 = v7 - (unint64_t)fabsf(v5);
  if (v5 < 0.0)
    return v9;
  else
    return v8;
}

- (void)mergeFrom:(id)a3
{
  self->_machineFrequency = *((float *)a3 + 2);
}

- (float)machineFrequency
{
  return self->_machineFrequency;
}

- (void)setMachineFrequency:(float)a3
{
  self->_machineFrequency = a3;
}

@end
