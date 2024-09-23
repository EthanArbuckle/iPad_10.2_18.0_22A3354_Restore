@implementation OTAResistanceData

- (void)dealloc
{
  objc_super v3;

  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  v3.receiver = self;
  v3.super_class = (Class)OTAResistanceData;
  -[OTAResistanceData dealloc](&v3, sel_dealloc);
}

- (unint64_t)resistance25CsCount
{
  return self->_resistance25Cs.count;
}

- (float)resistance25Cs
{
  return self->_resistance25Cs.list;
}

- (void)clearResistance25Cs
{
  PBRepeatedFloatClear();
}

- (void)addResistance25C:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)resistance25CAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_resistance25Cs;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_resistance25Cs = &self->_resistance25Cs;
  count = self->_resistance25Cs.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_resistance25Cs->list[a3];
}

- (void)setResistance25Cs:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (unint64_t)temperatureCoeffsCount
{
  return self->_temperatureCoeffs.count;
}

- (float)temperatureCoeffs
{
  return self->_temperatureCoeffs.list;
}

- (void)clearTemperatureCoeffs
{
  PBRepeatedFloatClear();
}

- (void)addTemperatureCoeff:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)temperatureCoeffAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_temperatureCoeffs;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_temperatureCoeffs = &self->_temperatureCoeffs;
  count = self->_temperatureCoeffs.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_temperatureCoeffs->list[a3];
}

- (void)setTemperatureCoeffs:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
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
  v8.super_class = (Class)OTAResistanceData;
  -[OTAResistanceData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTAResistanceData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PBRepeatedFloatNSArray();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("resistance25C"));

  PBRepeatedFloatNSArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("temperatureCoeff"));

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return OTAResistanceDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  $7401700F6E393C0442CED440453508D3 *p_temperatureCoeffs;
  unint64_t v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (self->_resistance25Cs.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v4 = v8;
      ++v5;
    }
    while (v5 < self->_resistance25Cs.count);
  }
  p_temperatureCoeffs = &self->_temperatureCoeffs;
  if (p_temperatureCoeffs->count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v4 = v8;
      ++v7;
    }
    while (v7 < p_temperatureCoeffs->count);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  uint64_t j;
  id v10;

  v10 = a3;
  if (-[OTAResistanceData resistance25CsCount](self, "resistance25CsCount"))
  {
    objc_msgSend(v10, "clearResistance25Cs");
    v4 = -[OTAResistanceData resistance25CsCount](self, "resistance25CsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[OTAResistanceData resistance25CAtIndex:](self, "resistance25CAtIndex:", i);
        objc_msgSend(v10, "addResistance25C:");
      }
    }
  }
  if (-[OTAResistanceData temperatureCoeffsCount](self, "temperatureCoeffsCount"))
  {
    objc_msgSend(v10, "clearTemperatureCoeffs");
    v7 = -[OTAResistanceData temperatureCoeffsCount](self, "temperatureCoeffsCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
      {
        -[OTAResistanceData temperatureCoeffAtIndex:](self, "temperatureCoeffAtIndex:", j);
        objc_msgSend(v10, "addTemperatureCoeff:");
      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;

  v3 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char IsEqual;

  v3 = a3;
  if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) && PBRepeatedFloatIsEqual())
    IsEqual = PBRepeatedFloatIsEqual();
  else
    IsEqual = 0;

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v2;

  v2 = PBRepeatedFloatHash();
  return PBRepeatedFloatHash() ^ v2;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  id v10;

  v10 = a3;
  v4 = objc_msgSend(v10, "resistance25CsCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
    {
      objc_msgSend(v10, "resistance25CAtIndex:", i);
      -[OTAResistanceData addResistance25C:](self, "addResistance25C:");
    }
  }
  v7 = objc_msgSend(v10, "temperatureCoeffsCount");
  if (v7)
  {
    v8 = v7;
    for (j = 0; j != v8; ++j)
    {
      objc_msgSend(v10, "temperatureCoeffAtIndex:", j);
      -[OTAResistanceData addTemperatureCoeff:](self, "addTemperatureCoeff:");
    }
  }

}

@end
