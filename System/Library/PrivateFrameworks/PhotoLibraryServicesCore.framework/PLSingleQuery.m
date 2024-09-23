@implementation PLSingleQuery

- (void)setKey:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_key = a3;
}

- (void)setHasKey:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasKey
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setValueType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_valueType = a3;
}

- (void)setHasValueType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasValueType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasFirstValue
{
  return self->_firstValue != 0;
}

- (BOOL)hasSecondValue
{
  return self->_secondValue != 0;
}

- (void)setComparator:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_comparator = a3;
}

- (void)setHasComparator:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasComparator
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setUnit:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_unit = a3;
}

- (void)setHasUnit:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUnit
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)PLSingleQuery;
  -[PLSingleQuery description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSingleQuery dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  NSData *firstValue;
  NSData *secondValue;
  char v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_key);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("key"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_valueType);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("valueType"));

  }
  firstValue = self->_firstValue;
  if (firstValue)
    objc_msgSend(v3, "setObject:forKey:", firstValue, CFSTR("firstValue"));
  secondValue = self->_secondValue;
  if (secondValue)
    objc_msgSend(v3, "setObject:forKey:", secondValue, CFSTR("secondValue"));
  v9 = (char)self->_has;
  if ((v9 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_comparator);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("comparator"));

    v9 = (char)self->_has;
  }
  if ((v9 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_unit);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("unit"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PLSingleQueryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;
  id v6;

  v6 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_firstValue)
    PBDataWriterWriteDataField();
  if (self->_secondValue)
    PBDataWriterWriteDataField();
  v5 = (char)self->_has;
  if ((v5 & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = (char)self->_has;
  }
  if ((v5 & 4) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  char v6;
  _DWORD *v7;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[6] = self->_key;
    *((_BYTE *)v4 + 48) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v4[11] = self->_valueType;
    *((_BYTE *)v4 + 48) |= 8u;
  }
  v7 = v4;
  if (self->_firstValue)
  {
    objc_msgSend(v4, "setFirstValue:");
    v4 = v7;
  }
  if (self->_secondValue)
  {
    objc_msgSend(v7, "setSecondValue:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 1) != 0)
  {
    v4[2] = self->_comparator;
    *((_BYTE *)v4 + 48) |= 1u;
    v6 = (char)self->_has;
  }
  if ((v6 & 4) != 0)
  {
    v4[10] = self->_unit;
    *((_BYTE *)v4 + 48) |= 4u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_key;
    *(_BYTE *)(v5 + 48) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_valueType;
    *(_BYTE *)(v5 + 48) |= 8u;
  }
  v8 = -[NSData copyWithZone:](self->_firstValue, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v8;

  v10 = -[NSData copyWithZone:](self->_secondValue, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v10;

  v12 = (char)self->_has;
  if ((v12 & 1) != 0)
  {
    *(_DWORD *)(v6 + 8) = self->_comparator;
    *(_BYTE *)(v6 + 48) |= 1u;
    v12 = (char)self->_has;
  }
  if ((v12 & 4) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_unit;
    *(_BYTE *)(v6 + 48) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *firstValue;
  NSData *secondValue;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_key != *((_DWORD *)v4 + 6))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
LABEL_25:
    v7 = 0;
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 8) == 0 || self->_valueType != *((_DWORD *)v4 + 11))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 48) & 8) != 0)
  {
    goto LABEL_25;
  }
  firstValue = self->_firstValue;
  if ((unint64_t)firstValue | *((_QWORD *)v4 + 2) && !-[NSData isEqual:](firstValue, "isEqual:"))
    goto LABEL_25;
  secondValue = self->_secondValue;
  if ((unint64_t)secondValue | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](secondValue, "isEqual:"))
      goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_comparator != *((_DWORD *)v4 + 2))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_25;
  }
  v7 = (*((_BYTE *)v4 + 48) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0 || self->_unit != *((_DWORD *)v4 + 10))
      goto LABEL_25;
    v7 = 1;
  }
LABEL_26:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761 * self->_key;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_valueType;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSData hash](self->_firstValue, "hash");
  v6 = -[NSData hash](self->_secondValue, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = 2654435761 * self->_comparator;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_8;
LABEL_10:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_10;
LABEL_8:
  v8 = 2654435761 * self->_unit;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 2) != 0)
  {
    self->_key = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 48);
  }
  if ((v5 & 8) != 0)
  {
    self->_valueType = *((_DWORD *)v4 + 11);
    *(_BYTE *)&self->_has |= 8u;
  }
  v7 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[PLSingleQuery setFirstValue:](self, "setFirstValue:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[PLSingleQuery setSecondValue:](self, "setSecondValue:");
    v4 = v7;
  }
  v6 = *((_BYTE *)v4 + 48);
  if ((v6 & 1) != 0)
  {
    self->_comparator = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 48);
  }
  if ((v6 & 4) != 0)
  {
    self->_unit = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 4u;
  }

}

- (int)key
{
  return self->_key;
}

- (int)valueType
{
  return self->_valueType;
}

- (NSData)firstValue
{
  return self->_firstValue;
}

- (void)setFirstValue:(id)a3
{
  objc_storeStrong((id *)&self->_firstValue, a3);
}

- (NSData)secondValue
{
  return self->_secondValue;
}

- (void)setSecondValue:(id)a3
{
  objc_storeStrong((id *)&self->_secondValue, a3);
}

- (int)comparator
{
  return self->_comparator;
}

- (int)unit
{
  return self->_unit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondValue, 0);
  objc_storeStrong((id *)&self->_firstValue, 0);
}

- (double)doubleValue
{
  void *v4;
  double v5;
  void *v7;
  double v8;

  -[PLSingleQuery firstValue](self, "firstValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (-[PLSingleQuery valueType](self, "valueType") != 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSingleQuery+Utilities.m"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.valueType == kPLQueryValueType_isDouble"));

    }
    v8 = 0.0;
    objc_msgSend(v4, "getBytes:length:", &v8, 8);
    v5 = v8;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (void)setDoubleValue:(double)a3
{
  void *v5;
  id v6;

  dataFromDouble(a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (-[PLSingleQuery valueType](self, "valueType") != 2)
  {
    if (-[PLSingleQuery hasSecondValue](self, "hasSecondValue"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSingleQuery+Utilities.m"), 119, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!self.hasSecondValue"));

    }
    -[PLSingleQuery setValueType:](self, "setValueType:", 2);
  }
  -[PLSingleQuery setFirstValue:](self, "setFirstValue:", v6);

}

- (double)secondDoubleValue
{
  void *v4;
  double v5;
  void *v7;
  double v8;

  -[PLSingleQuery secondValue](self, "secondValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (-[PLSingleQuery valueType](self, "valueType") != 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSingleQuery+Utilities.m"), 130, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.valueType == kPLQueryValueType_isDouble"));

    }
    v8 = 0.0;
    objc_msgSend(v4, "getBytes:length:", &v8, 8);
    v5 = v8;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (void)setSecondDoubleValue:(double)a3
{
  void *v6;
  id v7;

  if (-[PLSingleQuery valueType](self, "valueType") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSingleQuery+Utilities.m"), 137, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.valueType == kPLQueryValueType_isDouble"));

  }
  dataFromDouble(a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PLSingleQuery setSecondValue:](self, "setSecondValue:", v7);

}

- (int64_t)integerValue
{
  void *v4;
  int64_t v5;
  void *v7;
  int64_t v8;

  -[PLSingleQuery firstValue](self, "firstValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (-[PLSingleQuery valueType](self, "valueType") != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSingleQuery+Utilities.m"), 148, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.valueType == kPLQueryValueType_isInteger"));

    }
    v8 = 0;
    objc_msgSend(v4, "getBytes:length:", &v8, 8);
    v5 = v8;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setIntegerValue:(int64_t)a3
{
  void *v5;
  id v6;

  dataFromInteger(a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (-[PLSingleQuery valueType](self, "valueType") != 1)
  {
    if (-[PLSingleQuery hasSecondValue](self, "hasSecondValue"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSingleQuery+Utilities.m"), 158, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!self.hasSecondValue"));

    }
    -[PLSingleQuery setValueType:](self, "setValueType:", 1);
  }
  -[PLSingleQuery setFirstValue:](self, "setFirstValue:", v6);

}

- (int64_t)secondIntegerValue
{
  void *v4;
  int64_t v5;
  void *v7;
  int64_t v8;

  -[PLSingleQuery secondValue](self, "secondValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (-[PLSingleQuery valueType](self, "valueType") != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSingleQuery+Utilities.m"), 169, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.valueType == kPLQueryValueType_isInteger"));

    }
    v8 = 0;
    objc_msgSend(v4, "getBytes:length:", &v8, 8);
    v5 = v8;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setSecondIntegerValue:(int64_t)a3
{
  void *v6;
  id v7;

  if (-[PLSingleQuery valueType](self, "valueType") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSingleQuery+Utilities.m"), 176, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.valueType == kPLQueryValueType_isInteger"));

  }
  dataFromInteger(a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PLSingleQuery setSecondValue:](self, "setSecondValue:", v7);

}

- (BOOL)BOOLValue
{
  return -[PLSingleQuery integerValue](self, "integerValue") != 0;
}

- (void)setBoolValue:(BOOL)a3
{
  -[PLSingleQuery setIntegerValue:](self, "setIntegerValue:", a3);
}

- (NSString)stringValue
{
  void *v4;
  void *v5;
  void *v7;

  -[PLSingleQuery firstValue](self, "firstValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (-[PLSingleQuery valueType](self, "valueType") != 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSingleQuery+Utilities.m"), 196, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.valueType == kPLQueryValueType_isString"));

    }
    stringFromData(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setStringValue:(id)a3
{
  void *v5;
  id v6;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (-[PLSingleQuery valueType](self, "valueType") != 3)
  {
    if (-[PLSingleQuery hasSecondValue](self, "hasSecondValue"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSingleQuery+Utilities.m"), 206, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!self.hasSecondValue"));

    }
    -[PLSingleQuery setValueType:](self, "setValueType:", 3);
  }
  -[PLSingleQuery setFirstValue:](self, "setFirstValue:", v6);

}

- (NSString)secondStringValue
{
  void *v4;
  void *v5;
  void *v7;

  -[PLSingleQuery secondValue](self, "secondValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (-[PLSingleQuery valueType](self, "valueType") != 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSingleQuery+Utilities.m"), 217, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.valueType == kPLQueryValueType_isString"));

    }
    stringFromData(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setSecondStringValue:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (v7 && -[PLSingleQuery valueType](self, "valueType") != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSingleQuery+Utilities.m"), 224, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!stringValue || (self.valueType == kPLQueryValueType_isString)"));

  }
  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSingleQuery setSecondValue:](self, "setSecondValue:", v5);

}

- (NSDate)dateValue
{
  void *v4;
  void *v5;
  void *v7;

  -[PLSingleQuery firstValue](self, "firstValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (-[PLSingleQuery valueType](self, "valueType") != 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSingleQuery+Utilities.m"), 235, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.valueType == kPLQueryValueType_isDate"));

    }
    dateFromData(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (NSDate *)v5;
}

- (void)setDateValue:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (v5)
  {
    dataFromDate(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (-[PLSingleQuery valueType](self, "valueType") != 4)
  {
    if (-[PLSingleQuery hasSecondValue](self, "hasSecondValue"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSingleQuery+Utilities.m"), 248, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!self.hasSecondValue"), v8);

    }
    -[PLSingleQuery setValueType:](self, "setValueType:", 4);
  }
  -[PLSingleQuery setFirstValue:](self, "setFirstValue:", v6);

}

- (NSDate)secondDateValue
{
  void *v4;
  void *v5;
  void *v7;

  -[PLSingleQuery secondValue](self, "secondValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (-[PLSingleQuery valueType](self, "valueType") != 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSingleQuery+Utilities.m"), 259, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.valueType == kPLQueryValueType_isDate"));

    }
    dateFromData(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (NSDate *)v5;
}

- (void)setSecondDateValue:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    if (-[PLSingleQuery valueType](self, "valueType") != 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSingleQuery+Utilities.m"), 266, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!dateValue || (self.valueType == kPLQueryValueType_isDate)"), v7);

    }
    dataFromDate(v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[PLSingleQuery setSecondValue:](self, "setSecondValue:", v5);

}

- (PLQueryCircularRegion)circularRegionValue
{
  void *v4;
  void *v5;
  void *v7;

  -[PLSingleQuery firstValue](self, "firstValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (-[PLSingleQuery valueType](self, "valueType") != 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSingleQuery+Utilities.m"), 279, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.valueType == kPLQueryValueType_isCircularRegion"));

    }
    circularRegionFromData(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (PLQueryCircularRegion *)v5;
}

- (void)setCircularRegionValue:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (-[PLSingleQuery valueType](self, "valueType") != 5)
  {
    if (-[PLSingleQuery hasSecondValue](self, "hasSecondValue"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSingleQuery+Utilities.m"), 291, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!self.hasSecondValue"), v8);

    }
    -[PLSingleQuery setValueType:](self, "setValueType:", 5);
  }
  -[PLSingleQuery setFirstValue:](self, "setFirstValue:", v6);

}

- (PLQueryCircularRegion)secondCircularRegionValue
{
  void *v4;
  void *v5;
  void *v7;

  -[PLSingleQuery secondValue](self, "secondValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (-[PLSingleQuery valueType](self, "valueType") != 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSingleQuery+Utilities.m"), 301, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.valueType == kPLQueryValueType_isCircularRegion"));

    }
    circularRegionFromData(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (PLQueryCircularRegion *)v5;
}

- (void)setSecondCircularRegionValue:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    if (-[PLSingleQuery valueType](self, "valueType") != 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSingleQuery+Utilities.m"), 308, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!circularRegionValue || (self.valueType == kPLQueryValueType_isCircularRegion)"));

    }
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[PLSingleQuery setSecondValue:](self, "setSecondValue:", v5);

}

- (int)migratedComparator
{
  int v3;
  int v4;
  BOOL v5;
  int v6;
  int v8;
  int v9;
  int v10;
  int v12;

  v3 = -[PLSingleQuery comparator](self, "comparator");
  v4 = -[PLSingleQuery key](self, "key");
  if (v4 > 399)
  {
    if ((v4 - 400) >= 4 && v4 != 550 && v4 != 500)
      return v3;
LABEL_3:
    v5 = v3 == 2;
    v6 = 23;
LABEL_4:
    if (v5)
      return v6;
    return v3;
  }
  if (v4 > 300)
  {
    if (v4 != 301 && v4 != 305)
      return v3;
    goto LABEL_3;
  }
  if ((v4 - 200) >= 2)
  {
    if (v3 == 2 || v3 == 50)
      v12 = 23;
    else
      v12 = v3;
    if (v3 == 51)
      v6 = 22;
    else
      v6 = v12;
    v5 = v4 == 100;
    goto LABEL_4;
  }
  v8 = -[PLSingleQuery valueType](self, "valueType");
  if (v3 == 4)
    v9 = 41;
  else
    v9 = v3;
  if (v3 == 5)
    v10 = 40;
  else
    v10 = v9;
  if (v8 == 1)
    return v10;
  return v3;
}

- (void)setValueAndType:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  void *v6;
  const __CFNumber *number;

  number = (const __CFNumber *)a3;
  if (!-[PLSingleQuery hasValueType](self, "hasValueType"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = CFNumberGetType(number) - 5;
      if (v4 >= 0xC)
        v5 = 1;
      else
        v5 = dword_199EB0B88[v4];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = 3;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v5 = 4;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_13;
          v5 = 5;
        }
      }
    }
    -[PLSingleQuery setValueType:](self, "setValueType:", v5);
  }
LABEL_13:
  if (-[PLSingleQuery hasValueType](self, "hasValueType"))
  {
    if (!-[PLSingleQuery hasFirstValue](self, "hasFirstValue"))
    {
      convertToData(number);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSingleQuery setFirstValue:](self, "setFirstValue:", v6);
      goto LABEL_18;
    }
    if (!-[PLSingleQuery hasSecondValue](self, "hasSecondValue"))
    {
      convertToData(number);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSingleQuery setSecondValue:](self, "setSecondValue:", v6);
LABEL_18:

    }
  }

}

- (id)logDescription
{
  id v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  unsigned int v10;
  __CFString *v11;
  __CFString *v12;
  void (**v13)(_QWORD);
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  __CFString *v22;
  __CFString *v23;
  id v24;
  _QWORD v26[5];
  id v27;
  id v28;
  uint64_t *v29;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p> {"), v5, self);

  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v6 = MEMORY[0x1E0C809B0];
  v36 = 0;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __42__PLSingleQuery_Utilities__logDescription__block_invoke;
  v30[3] = &unk_1E376C748;
  v32 = &v33;
  v7 = v3;
  v31 = v7;
  v8 = (void (**)(_QWORD))MEMORY[0x19AEC3014](v30);
  if (-[PLSingleQuery hasKey](self, "hasKey"))
  {
    PLStringFromPLQueryKey(-[PLSingleQuery key](self, "key"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR(" key = %@"), v9);

    *((_BYTE *)v34 + 24) = 1;
  }
  if (-[PLSingleQuery hasValueType](self, "hasValueType"))
  {
    v8[2](v8);
    v10 = -[PLSingleQuery valueType](self, "valueType") - 1;
    if (v10 > 4)
      v11 = CFSTR("kPLQueryValueType_unknown");
    else
      v11 = *(&off_1E376B9D8 + v10);
    v12 = v11;
    objc_msgSend(v7, "appendFormat:", CFSTR(" valueType = %@"), v12);

    *((_BYTE *)v34 + 24) = 1;
  }
  v26[0] = v6;
  v26[1] = 3221225472;
  v26[2] = __42__PLSingleQuery_Utilities__logDescription__block_invoke_2;
  v26[3] = &unk_1E3769F30;
  v13 = v8;
  v28 = v13;
  v29 = &v33;
  v26[4] = self;
  v14 = v7;
  v27 = v14;
  v15 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19AEC3014](v26);
  -[PLSingleQuery firstValue](self, "firstValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[PLSingleQuery firstValue](self, "firstValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const __CFString *, void *))v15)[2](v15, CFSTR("firstValue"), v17);

  }
  -[PLSingleQuery secondValue](self, "secondValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[PLSingleQuery secondValue](self, "secondValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const __CFString *, void *))v15)[2](v15, CFSTR("secondValue"), v19);

  }
  if (-[PLSingleQuery hasComparator](self, "hasComparator"))
  {
    v13[2](v13);
    PLStringFromPLQueryComparatorType(-[PLSingleQuery comparator](self, "comparator"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appendFormat:", CFSTR(" comparator = %@"), v20);

    *((_BYTE *)v34 + 24) = 1;
  }
  if (-[PLSingleQuery hasUnit](self, "hasUnit"))
  {
    v13[2](v13);
    v21 = -[PLSingleQuery unit](self, "unit") - 1;
    if (v21 > 4)
      v22 = CFSTR("kPLQueryUnit_unused");
    else
      v22 = *(&off_1E376BA00 + v21);
    v23 = v22;
    objc_msgSend(v14, "appendFormat:", CFSTR(" unit = %@"), v23);

    *((_BYTE *)v34 + 24) = 0;
  }
  objc_msgSend(v14, "appendFormat:", CFSTR(" }"));
  v24 = v14;

  _Block_object_dispose(&v33, 8);
  return v24;
}

uint64_t __42__PLSingleQuery_Utilities__logDescription__block_invoke(uint64_t result)
{
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    return objc_msgSend(*(id *)(result + 32), "appendFormat:", CFSTR(","));
  return result;
}

void __42__PLSingleQuery_Utilities__logDescription__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;

  v5 = a2;
  v6 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  switch(objc_msgSend(*(id *)(a1 + 32), "valueType"))
  {
    case 1u:
      v7 = objc_msgSend(*(id *)(a1 + 32), "key");
      v8 = *(void **)(a1 + 40);
      if (v7 == 5)
      {
        v13 = 0;
        objc_msgSend(v6, "getBytes:length:", &v13, 8);
        if ((v13 - 1) > 0x10)
          v9 = CFSTR("kPLQueryValue_unknown");
        else
          v9 = *(&off_1E376BA28 + (v13 - 1));
        v10 = v9;
        goto LABEL_13;
      }
      v13 = 0;
      objc_msgSend(v6, "getBytes:length:", &v13, 8);
      objc_msgSend(v8, "appendFormat:", CFSTR(" %@ = %ld (%@)"), v5, v13, v6);
      break;
    case 2u:
      v11 = *(void **)(a1 + 40);
      v13 = 0;
      objc_msgSend(v6, "getBytes:length:", &v13, 8);
      objc_msgSend(v11, "appendFormat:", CFSTR(" %@ = %lf (%@)"), v5, v13, v6);
      break;
    case 3u:
      v8 = *(void **)(a1 + 40);
      stringFromData(v6);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 4u:
      v8 = *(void **)(a1 + 40);
      dateFromData(v6);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 5u:
      v8 = *(void **)(a1 + 40);
      circularRegionFromData(v6);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_13:
      v12 = v10;
      objc_msgSend(v8, "appendFormat:", CFSTR(" %@ = %@ (%@)"), v5, v10, v6);

      break;
    default:
      break;
  }

}

@end
