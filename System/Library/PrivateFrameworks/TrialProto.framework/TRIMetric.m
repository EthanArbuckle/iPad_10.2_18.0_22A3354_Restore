@implementation TRIMetric

+ (id)metricWithName:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIMetric+Factory.m"), 14, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setName:", v5);

  return v6;
}

+ (id)metricWithName:(id)a3 doubleValue:(double)a4
{
  id v7;
  void *v8;
  void *v10;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIMetric+Factory.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setName:", v7);
  objc_msgSend(v8, "setDoubleValue:", a4);

  return v8;
}

+ (id)metricWithName:(id)a3 integerValue:(int64_t)a4
{
  id v7;
  void *v8;
  void *v10;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIMetric+Factory.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setName:", v7);
  objc_msgSend(v8, "setIntegerValue:", a4);

  return v8;
}

+ (id)metricWithName:(id)a3 categoricalValue:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIMetric+Factory.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIMetric+Factory.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("value"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setName:", v7);
  objc_msgSend(v10, "setCategoricalValue:", v9);

  return v10;
}

+ (id)metricWithName:(id)a3 userDefinedValue:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIMetric+Factory.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIMetric+Factory.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("value"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setName:", v7);
  objc_msgSend(v10, "setUserDefinedValue:", v9);

  return v10;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setDoubleValue:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_doubleValue = a3;
}

- (void)setHasDoubleValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDoubleValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setIntegerValue:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_integerValue = a3;
}

- (void)setHasIntegerValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIntegerValue
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasCategoricalValue
{
  return self->_categoricalValue != 0;
}

- (BOOL)hasUserDefinedValue
{
  return self->_userDefinedValue != 0;
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
  v8.super_class = (Class)TRIMetric;
  -[TRIMetric description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIMetric dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *name;
  char has;
  void *v7;
  void *v8;
  NSString *categoricalValue;
  NSData *userDefinedValue;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_doubleValue);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("double_value"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_integerValue);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("integer_value"));

  }
  categoricalValue = self->_categoricalValue;
  if (categoricalValue)
    objc_msgSend(v4, "setObject:forKey:", categoricalValue, CFSTR("categorical_value"));
  userDefinedValue = self->_userDefinedValue;
  if (userDefinedValue)
    objc_msgSend(v4, "setObject:forKey:", userDefinedValue, CFSTR("user_defined_value"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TRIMetricReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
  if (self->_categoricalValue)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_userDefinedValue)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_doubleValue;
    *((_BYTE *)v4 + 48) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_integerValue;
    *((_BYTE *)v4 + 48) |= 2u;
  }
  if (self->_categoricalValue)
  {
    objc_msgSend(v6, "setCategoricalValue:");
    v4 = v6;
  }
  if (self->_userDefinedValue)
  {
    objc_msgSend(v6, "setUserDefinedValue:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_doubleValue;
    *(_BYTE *)(v5 + 48) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_integerValue;
    *(_BYTE *)(v5 + 48) |= 2u;
  }
  v9 = -[NSString copyWithZone:](self->_categoricalValue, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[NSData copyWithZone:](self->_userDefinedValue, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  NSString *categoricalValue;
  NSData *userDefinedValue;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_doubleValue != *((double *)v4 + 1))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_18:
    v8 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_integerValue != *((_QWORD *)v4 + 2))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_18;
  }
  categoricalValue = self->_categoricalValue;
  if ((unint64_t)categoricalValue | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](categoricalValue, "isEqual:"))
  {
    goto LABEL_18;
  }
  userDefinedValue = self->_userDefinedValue;
  if ((unint64_t)userDefinedValue | *((_QWORD *)v4 + 5))
    v8 = -[NSData isEqual:](userDefinedValue, "isEqual:");
  else
    v8 = 1;
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char has;
  unint64_t v5;
  double doubleValue;
  double v7;
  long double v8;
  double v9;
  uint64_t v10;
  NSUInteger v11;

  v3 = -[NSString hash](self->_name, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    doubleValue = self->_doubleValue;
    v7 = -doubleValue;
    if (doubleValue >= 0.0)
      v7 = self->_doubleValue;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((has & 2) != 0)
    v10 = 2654435761 * self->_integerValue;
  else
    v10 = 0;
  v11 = v5 ^ v3 ^ v10 ^ -[NSString hash](self->_categoricalValue, "hash");
  return v11 ^ -[NSData hash](self->_userDefinedValue, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[TRIMetric setName:](self, "setName:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 1) != 0)
  {
    self->_doubleValue = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 48);
  }
  if ((v5 & 2) != 0)
  {
    self->_integerValue = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[TRIMetric setCategoricalValue:](self, "setCategoricalValue:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[TRIMetric setUserDefinedValue:](self, "setUserDefinedValue:");
    v4 = v6;
  }

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (int64_t)integerValue
{
  return self->_integerValue;
}

- (NSString)categoricalValue
{
  return self->_categoricalValue;
}

- (void)setCategoricalValue:(id)a3
{
  objc_storeStrong((id *)&self->_categoricalValue, a3);
}

- (NSData)userDefinedValue
{
  return self->_userDefinedValue;
}

- (void)setUserDefinedValue:(id)a3
{
  objc_storeStrong((id *)&self->_userDefinedValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefinedValue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_categoricalValue, 0);
}

@end
