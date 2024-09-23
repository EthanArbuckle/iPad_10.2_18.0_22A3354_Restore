@implementation PPPBFeatureIdFeatureValuePair

- (BOOL)hasFeatureId
{
  return self->_featureId != 0;
}

- (void)setValue:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_value = a3;
}

- (void)setHasValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasValue
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)PPPBFeatureIdFeatureValuePair;
  -[PPPBFeatureIdFeatureValuePair description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPPBFeatureIdFeatureValuePair dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  NSString *featureId;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  featureId = self->_featureId;
  if (featureId)
    objc_msgSend(v3, "setObject:forKey:", featureId, CFSTR("featureId"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(float *)&v4 = self->_value;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("value"));

  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return PPPBFeatureIdFeatureValuePairReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_featureId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (self->_featureId)
  {
    v5 = v4;
    objc_msgSend(v4, "setFeatureId:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = LODWORD(self->_value);
    *((_BYTE *)v4 + 20) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_featureId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(float *)(v5 + 16) = self->_value;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *featureId;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  featureId = self->_featureId;
  if ((unint64_t)featureId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](featureId, "isEqual:"))
      goto LABEL_8;
  }
  v6 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) != 0 && self->_value == *((float *)v4 + 4))
    {
      v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  float value;
  float v6;
  float v7;
  float v8;

  v3 = -[NSString hash](self->_featureId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    value = self->_value;
    v6 = -value;
    if (value >= 0.0)
      v6 = self->_value;
    v7 = floorf(v6 + 0.5);
    v8 = (float)(v6 - v7) * 1.8447e19;
    v4 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabsf(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  float *v4;
  float *v5;

  v4 = (float *)a3;
  if (*((_QWORD *)v4 + 1))
  {
    v5 = v4;
    -[PPPBFeatureIdFeatureValuePair setFeatureId:](self, "setFeatureId:");
    v4 = v5;
  }
  if (((_BYTE)v4[5] & 1) != 0)
  {
    self->_value = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)featureId
{
  return self->_featureId;
}

- (void)setFeatureId:(id)a3
{
  objc_storeStrong((id *)&self->_featureId, a3);
}

- (float)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureId, 0);
}

@end
