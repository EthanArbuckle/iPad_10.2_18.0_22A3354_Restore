@implementation OTAParamRC

- (void)dealloc
{
  objc_super v3;

  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  v3.receiver = self;
  v3.super_class = (Class)OTAParamRC;
  -[OTAParamRC dealloc](&v3, sel_dealloc);
}

- (BOOL)hasR0
{
  return self->_r0 != 0;
}

- (BOOL)hasR1
{
  return self->_r1 != 0;
}

- (BOOL)hasBaselineR1
{
  return self->_baselineR1 != 0;
}

- (BOOL)hasR2
{
  return self->_r2 != 0;
}

- (BOOL)hasBaselineR2
{
  return self->_baselineR2 != 0;
}

- (BOOL)hasRCFreq1
{
  return self->_rCFreq1 != 0;
}

- (BOOL)hasRCFreq2
{
  return self->_rCFreq2 != 0;
}

- (BOOL)hasRCFreq3
{
  return self->_rCFreq3 != 0;
}

- (unint64_t)agingCoeffForR0sCount
{
  return self->_agingCoeffForR0s.count;
}

- (float)agingCoeffForR0s
{
  return self->_agingCoeffForR0s.list;
}

- (void)clearAgingCoeffForR0s
{
  PBRepeatedFloatClear();
}

- (void)addAgingCoeffForR0:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)agingCoeffForR0AtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_agingCoeffForR0s;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_agingCoeffForR0s = &self->_agingCoeffForR0s;
  count = self->_agingCoeffForR0s.count;
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
  return p_agingCoeffForR0s->list[a3];
}

- (void)setAgingCoeffForR0s:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (unint64_t)agingCoeffForR0TemperatureCoeffsCount
{
  return self->_agingCoeffForR0TemperatureCoeffs.count;
}

- (float)agingCoeffForR0TemperatureCoeffs
{
  return self->_agingCoeffForR0TemperatureCoeffs.list;
}

- (void)clearAgingCoeffForR0TemperatureCoeffs
{
  PBRepeatedFloatClear();
}

- (void)addAgingCoeffForR0TemperatureCoeff:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)agingCoeffForR0TemperatureCoeffAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_agingCoeffForR0TemperatureCoeffs;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_agingCoeffForR0TemperatureCoeffs = &self->_agingCoeffForR0TemperatureCoeffs;
  count = self->_agingCoeffForR0TemperatureCoeffs.count;
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
  return p_agingCoeffForR0TemperatureCoeffs->list[a3];
}

- (void)setAgingCoeffForR0TemperatureCoeffs:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (unint64_t)agingCoeffForR1sCount
{
  return self->_agingCoeffForR1s.count;
}

- (float)agingCoeffForR1s
{
  return self->_agingCoeffForR1s.list;
}

- (void)clearAgingCoeffForR1s
{
  PBRepeatedFloatClear();
}

- (void)addAgingCoeffForR1:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)agingCoeffForR1AtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_agingCoeffForR1s;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_agingCoeffForR1s = &self->_agingCoeffForR1s;
  count = self->_agingCoeffForR1s.count;
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
  return p_agingCoeffForR1s->list[a3];
}

- (void)setAgingCoeffForR1s:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (unint64_t)agingCoeffForR1TemperatureCoeffsCount
{
  return self->_agingCoeffForR1TemperatureCoeffs.count;
}

- (float)agingCoeffForR1TemperatureCoeffs
{
  return self->_agingCoeffForR1TemperatureCoeffs.list;
}

- (void)clearAgingCoeffForR1TemperatureCoeffs
{
  PBRepeatedFloatClear();
}

- (void)addAgingCoeffForR1TemperatureCoeff:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)agingCoeffForR1TemperatureCoeffAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_agingCoeffForR1TemperatureCoeffs;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_agingCoeffForR1TemperatureCoeffs = &self->_agingCoeffForR1TemperatureCoeffs;
  count = self->_agingCoeffForR1TemperatureCoeffs.count;
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
  return p_agingCoeffForR1TemperatureCoeffs->list[a3];
}

- (void)setAgingCoeffForR1TemperatureCoeffs:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (unint64_t)agingCoeffForR2sCount
{
  return self->_agingCoeffForR2s.count;
}

- (float)agingCoeffForR2s
{
  return self->_agingCoeffForR2s.list;
}

- (void)clearAgingCoeffForR2s
{
  PBRepeatedFloatClear();
}

- (void)addAgingCoeffForR2:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)agingCoeffForR2AtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_agingCoeffForR2s;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_agingCoeffForR2s = &self->_agingCoeffForR2s;
  count = self->_agingCoeffForR2s.count;
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
  return p_agingCoeffForR2s->list[a3];
}

- (void)setAgingCoeffForR2s:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (unint64_t)agingCoeffForR2TemperatureCoeffsCount
{
  return self->_agingCoeffForR2TemperatureCoeffs.count;
}

- (float)agingCoeffForR2TemperatureCoeffs
{
  return self->_agingCoeffForR2TemperatureCoeffs.list;
}

- (void)clearAgingCoeffForR2TemperatureCoeffs
{
  PBRepeatedFloatClear();
}

- (void)addAgingCoeffForR2TemperatureCoeff:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)agingCoeffForR2TemperatureCoeffAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_agingCoeffForR2TemperatureCoeffs;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_agingCoeffForR2TemperatureCoeffs = &self->_agingCoeffForR2TemperatureCoeffs;
  count = self->_agingCoeffForR2TemperatureCoeffs.count;
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
  return p_agingCoeffForR2TemperatureCoeffs->list[a3];
}

- (void)setAgingCoeffForR2TemperatureCoeffs:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (unint64_t)baselineRdcsCount
{
  return self->_baselineRdcs.count;
}

- (float)baselineRdcs
{
  return self->_baselineRdcs.list;
}

- (void)clearBaselineRdcs
{
  PBRepeatedFloatClear();
}

- (void)addBaselineRdc:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)baselineRdcAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_baselineRdcs;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_baselineRdcs = &self->_baselineRdcs;
  count = self->_baselineRdcs.count;
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
  return p_baselineRdcs->list[a3];
}

- (void)setBaselineRdcs:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (BOOL)hasBaselineR0
{
  return self->_baselineR0 != 0;
}

- (BOOL)hasBmuResistance
{
  return self->_bmuResistance != 0;
}

- (unint64_t)gridOCVsCount
{
  return self->_gridOCVs.count;
}

- (float)gridOCVs
{
  return self->_gridOCVs.list;
}

- (void)clearGridOCVs
{
  PBRepeatedFloatClear();
}

- (void)addGridOCV:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)gridOCVAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_gridOCVs;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_gridOCVs = &self->_gridOCVs;
  count = self->_gridOCVs.count;
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
  return p_gridOCVs->list[a3];
}

- (void)setGridOCVs:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (BOOL)hasBaselineR3
{
  return self->_baselineR3 != 0;
}

- (void)setMaxRdcRatio:(float)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_maxRdcRatio = a3;
}

- (void)setHasMaxRdcRatio:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMaxRdcRatio
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setMaxRdcRatioR2Extrap:(float)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_maxRdcRatioR2Extrap = a3;
}

- (void)setHasMaxRdcRatioR2Extrap:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMaxRdcRatioR2Extrap
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setBaselineWRdc:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_baselineWRdc = a3;
}

- (void)setHasBaselineWRdc:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBaselineWRdc
{
  return *(_BYTE *)&self->_has & 1;
}

- (unint64_t)slopeForR0ExtrapsCount
{
  return self->_slopeForR0Extraps.count;
}

- (float)slopeForR0Extraps
{
  return self->_slopeForR0Extraps.list;
}

- (void)clearSlopeForR0Extraps
{
  PBRepeatedFloatClear();
}

- (void)addSlopeForR0Extrap:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)slopeForR0ExtrapAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_slopeForR0Extraps;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_slopeForR0Extraps = &self->_slopeForR0Extraps;
  count = self->_slopeForR0Extraps.count;
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
  return p_slopeForR0Extraps->list[a3];
}

- (void)setSlopeForR0Extraps:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (unint64_t)slopeForR1ExtrapsCount
{
  return self->_slopeForR1Extraps.count;
}

- (float)slopeForR1Extraps
{
  return self->_slopeForR1Extraps.list;
}

- (void)clearSlopeForR1Extraps
{
  PBRepeatedFloatClear();
}

- (void)addSlopeForR1Extrap:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)slopeForR1ExtrapAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_slopeForR1Extraps;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_slopeForR1Extraps = &self->_slopeForR1Extraps;
  count = self->_slopeForR1Extraps.count;
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
  return p_slopeForR1Extraps->list[a3];
}

- (void)setSlopeForR1Extraps:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (unint64_t)slopeForR2ExtrapsCount
{
  return self->_slopeForR2Extraps.count;
}

- (float)slopeForR2Extraps
{
  return self->_slopeForR2Extraps.list;
}

- (void)clearSlopeForR2Extraps
{
  PBRepeatedFloatClear();
}

- (void)addSlopeForR2Extrap:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)slopeForR2ExtrapAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_slopeForR2Extraps;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_slopeForR2Extraps = &self->_slopeForR2Extraps;
  count = self->_slopeForR2Extraps.count;
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
  return p_slopeForR2Extraps->list[a3];
}

- (void)setSlopeForR2Extraps:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (unint64_t)slopeForR3ExtrapsCount
{
  return self->_slopeForR3Extraps.count;
}

- (float)slopeForR3Extraps
{
  return self->_slopeForR3Extraps.list;
}

- (void)clearSlopeForR3Extraps
{
  PBRepeatedFloatClear();
}

- (void)addSlopeForR3Extrap:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)slopeForR3ExtrapAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_slopeForR3Extraps;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_slopeForR3Extraps = &self->_slopeForR3Extraps;
  count = self->_slopeForR3Extraps.count;
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
  return p_slopeForR3Extraps->list[a3];
}

- (void)setSlopeForR3Extraps:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (BOOL)hasR3
{
  return self->_r3 != 0;
}

- (BOOL)hasRCFreq4
{
  return self->_rCFreq4 != 0;
}

- (BOOL)hasBaselineR4
{
  return self->_baselineR4 != 0;
}

- (BOOL)hasBaselineRCFreq1
{
  return self->_baselineRCFreq1 != 0;
}

- (BOOL)hasBaselineRCFreq2
{
  return self->_baselineRCFreq2 != 0;
}

- (BOOL)hasBaselineRCFreq3
{
  return self->_baselineRCFreq3 != 0;
}

- (BOOL)hasBaselineRCFreq4
{
  return self->_baselineRCFreq4 != 0;
}

- (unint64_t)agingCoeffForR3sCount
{
  return self->_agingCoeffForR3s.count;
}

- (float)agingCoeffForR3s
{
  return self->_agingCoeffForR3s.list;
}

- (void)clearAgingCoeffForR3s
{
  PBRepeatedFloatClear();
}

- (void)addAgingCoeffForR3:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)agingCoeffForR3AtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_agingCoeffForR3s;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_agingCoeffForR3s = &self->_agingCoeffForR3s;
  count = self->_agingCoeffForR3s.count;
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
  return p_agingCoeffForR3s->list[a3];
}

- (void)setAgingCoeffForR3s:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (unint64_t)agingCoeffForR3TemperatureCoeffsCount
{
  return self->_agingCoeffForR3TemperatureCoeffs.count;
}

- (float)agingCoeffForR3TemperatureCoeffs
{
  return self->_agingCoeffForR3TemperatureCoeffs.list;
}

- (void)clearAgingCoeffForR3TemperatureCoeffs
{
  PBRepeatedFloatClear();
}

- (void)addAgingCoeffForR3TemperatureCoeff:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)agingCoeffForR3TemperatureCoeffAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_agingCoeffForR3TemperatureCoeffs;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_agingCoeffForR3TemperatureCoeffs = &self->_agingCoeffForR3TemperatureCoeffs;
  count = self->_agingCoeffForR3TemperatureCoeffs.count;
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
  return p_agingCoeffForR3TemperatureCoeffs->list[a3];
}

- (void)setAgingCoeffForR3TemperatureCoeffs:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (unint64_t)agingCoeffForRCFreq1sCount
{
  return self->_agingCoeffForRCFreq1s.count;
}

- (float)agingCoeffForRCFreq1s
{
  return self->_agingCoeffForRCFreq1s.list;
}

- (void)clearAgingCoeffForRCFreq1s
{
  PBRepeatedFloatClear();
}

- (void)addAgingCoeffForRCFreq1:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)agingCoeffForRCFreq1AtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_agingCoeffForRCFreq1s;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_agingCoeffForRCFreq1s = &self->_agingCoeffForRCFreq1s;
  count = self->_agingCoeffForRCFreq1s.count;
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
  return p_agingCoeffForRCFreq1s->list[a3];
}

- (void)setAgingCoeffForRCFreq1s:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (unint64_t)agingCoeffForRCFreq2sCount
{
  return self->_agingCoeffForRCFreq2s.count;
}

- (float)agingCoeffForRCFreq2s
{
  return self->_agingCoeffForRCFreq2s.list;
}

- (void)clearAgingCoeffForRCFreq2s
{
  PBRepeatedFloatClear();
}

- (void)addAgingCoeffForRCFreq2:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)agingCoeffForRCFreq2AtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_agingCoeffForRCFreq2s;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_agingCoeffForRCFreq2s = &self->_agingCoeffForRCFreq2s;
  count = self->_agingCoeffForRCFreq2s.count;
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
  return p_agingCoeffForRCFreq2s->list[a3];
}

- (void)setAgingCoeffForRCFreq2s:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (unint64_t)agingCoeffForRCFreq3sCount
{
  return self->_agingCoeffForRCFreq3s.count;
}

- (float)agingCoeffForRCFreq3s
{
  return self->_agingCoeffForRCFreq3s.list;
}

- (void)clearAgingCoeffForRCFreq3s
{
  PBRepeatedFloatClear();
}

- (void)addAgingCoeffForRCFreq3:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)agingCoeffForRCFreq3AtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_agingCoeffForRCFreq3s;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_agingCoeffForRCFreq3s = &self->_agingCoeffForRCFreq3s;
  count = self->_agingCoeffForRCFreq3s.count;
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
  return p_agingCoeffForRCFreq3s->list[a3];
}

- (void)setAgingCoeffForRCFreq3s:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (unint64_t)agingCoeffForRCFreq4sCount
{
  return self->_agingCoeffForRCFreq4s.count;
}

- (float)agingCoeffForRCFreq4s
{
  return self->_agingCoeffForRCFreq4s.list;
}

- (void)clearAgingCoeffForRCFreq4s
{
  PBRepeatedFloatClear();
}

- (void)addAgingCoeffForRCFreq4:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)agingCoeffForRCFreq4AtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_agingCoeffForRCFreq4s;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_agingCoeffForRCFreq4s = &self->_agingCoeffForRCFreq4s;
  count = self->_agingCoeffForRCFreq4s.count;
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
  return p_agingCoeffForRCFreq4s->list[a3];
}

- (void)setAgingCoeffForRCFreq4s:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (unint64_t)agingCoeffForRCFreq1TemperatureCoeffsCount
{
  return self->_agingCoeffForRCFreq1TemperatureCoeffs.count;
}

- (float)agingCoeffForRCFreq1TemperatureCoeffs
{
  return self->_agingCoeffForRCFreq1TemperatureCoeffs.list;
}

- (void)clearAgingCoeffForRCFreq1TemperatureCoeffs
{
  PBRepeatedFloatClear();
}

- (void)addAgingCoeffForRCFreq1TemperatureCoeff:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)agingCoeffForRCFreq1TemperatureCoeffAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_agingCoeffForRCFreq1TemperatureCoeffs;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_agingCoeffForRCFreq1TemperatureCoeffs = &self->_agingCoeffForRCFreq1TemperatureCoeffs;
  count = self->_agingCoeffForRCFreq1TemperatureCoeffs.count;
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
  return p_agingCoeffForRCFreq1TemperatureCoeffs->list[a3];
}

- (void)setAgingCoeffForRCFreq1TemperatureCoeffs:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (unint64_t)agingCoeffForRCFreq2TemperatureCoeffsCount
{
  return self->_agingCoeffForRCFreq2TemperatureCoeffs.count;
}

- (float)agingCoeffForRCFreq2TemperatureCoeffs
{
  return self->_agingCoeffForRCFreq2TemperatureCoeffs.list;
}

- (void)clearAgingCoeffForRCFreq2TemperatureCoeffs
{
  PBRepeatedFloatClear();
}

- (void)addAgingCoeffForRCFreq2TemperatureCoeff:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)agingCoeffForRCFreq2TemperatureCoeffAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_agingCoeffForRCFreq2TemperatureCoeffs;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_agingCoeffForRCFreq2TemperatureCoeffs = &self->_agingCoeffForRCFreq2TemperatureCoeffs;
  count = self->_agingCoeffForRCFreq2TemperatureCoeffs.count;
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
  return p_agingCoeffForRCFreq2TemperatureCoeffs->list[a3];
}

- (void)setAgingCoeffForRCFreq2TemperatureCoeffs:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (unint64_t)agingCoeffForRCFreq3TemperatureCoeffsCount
{
  return self->_agingCoeffForRCFreq3TemperatureCoeffs.count;
}

- (float)agingCoeffForRCFreq3TemperatureCoeffs
{
  return self->_agingCoeffForRCFreq3TemperatureCoeffs.list;
}

- (void)clearAgingCoeffForRCFreq3TemperatureCoeffs
{
  PBRepeatedFloatClear();
}

- (void)addAgingCoeffForRCFreq3TemperatureCoeff:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)agingCoeffForRCFreq3TemperatureCoeffAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_agingCoeffForRCFreq3TemperatureCoeffs;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_agingCoeffForRCFreq3TemperatureCoeffs = &self->_agingCoeffForRCFreq3TemperatureCoeffs;
  count = self->_agingCoeffForRCFreq3TemperatureCoeffs.count;
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
  return p_agingCoeffForRCFreq3TemperatureCoeffs->list[a3];
}

- (void)setAgingCoeffForRCFreq3TemperatureCoeffs:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (unint64_t)agingCoeffForRCFreq4TemperatureCoeffsCount
{
  return self->_agingCoeffForRCFreq4TemperatureCoeffs.count;
}

- (float)agingCoeffForRCFreq4TemperatureCoeffs
{
  return self->_agingCoeffForRCFreq4TemperatureCoeffs.list;
}

- (void)clearAgingCoeffForRCFreq4TemperatureCoeffs
{
  PBRepeatedFloatClear();
}

- (void)addAgingCoeffForRCFreq4TemperatureCoeff:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)agingCoeffForRCFreq4TemperatureCoeffAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_agingCoeffForRCFreq4TemperatureCoeffs;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_agingCoeffForRCFreq4TemperatureCoeffs = &self->_agingCoeffForRCFreq4TemperatureCoeffs;
  count = self->_agingCoeffForRCFreq4TemperatureCoeffs.count;
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
  return p_agingCoeffForRCFreq4TemperatureCoeffs->list[a3];
}

- (void)setAgingCoeffForRCFreq4TemperatureCoeffs:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (int)mLBConfig
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_mLBConfig;
  else
    return 0;
}

- (void)setMLBConfig:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_mLBConfig = a3;
}

- (void)setHasMLBConfig:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMLBConfig
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)mLBConfigAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("kPPMRegularMLB");
  if (a3 == 1)
  {
    v3 = CFSTR("kPPMNorthSouthSplitMLB");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsMLBConfig:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kPPMRegularMLB")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("kPPMNorthSouthSplitMLB"));

  return v4;
}

- (void)setWRdcRatioThresh:(float)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_wRdcRatioThresh = a3;
}

- (void)setHasWRdcRatioThresh:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasWRdcRatioThresh
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (unint64_t)gridWRdcRatiosCount
{
  return self->_gridWRdcRatios.count;
}

- (float)gridWRdcRatios
{
  return self->_gridWRdcRatios.list;
}

- (void)clearGridWRdcRatios
{
  PBRepeatedFloatClear();
}

- (void)addGridWRdcRatio:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)gridWRdcRatioAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_gridWRdcRatios;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_gridWRdcRatios = &self->_gridWRdcRatios;
  count = self->_gridWRdcRatios.count;
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
  return p_gridWRdcRatios->list[a3];
}

- (void)setGridWRdcRatios:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (unint64_t)coeffSOCsCount
{
  return self->_coeffSOCs.count;
}

- (float)coeffSOCs
{
  return self->_coeffSOCs.list;
}

- (void)clearCoeffSOCs
{
  PBRepeatedFloatClear();
}

- (void)addCoeffSOC:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)coeffSOCAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_coeffSOCs;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_coeffSOCs = &self->_coeffSOCs;
  count = self->_coeffSOCs.count;
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
  return p_coeffSOCs->list[a3];
}

- (void)setCoeffSOCs:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (unint64_t)coeffVsCount
{
  return self->_coeffVs.count;
}

- (float)coeffVs
{
  return self->_coeffVs.list;
}

- (void)clearCoeffVs
{
  PBRepeatedFloatClear();
}

- (void)addCoeffV:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)coeffVAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_coeffVs;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_coeffVs = &self->_coeffVs;
  count = self->_coeffVs.count;
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
  return p_coeffVs->list[a3];
}

- (void)setCoeffVs:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (BOOL)hasRdc
{
  return self->_rdc != 0;
}

- (unint64_t)agingCoeffForRdcsCount
{
  return self->_agingCoeffForRdcs.count;
}

- (float)agingCoeffForRdcs
{
  return self->_agingCoeffForRdcs.list;
}

- (void)clearAgingCoeffForRdcs
{
  PBRepeatedFloatClear();
}

- (void)addAgingCoeffForRdc:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)agingCoeffForRdcAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_agingCoeffForRdcs;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_agingCoeffForRdcs = &self->_agingCoeffForRdcs;
  count = self->_agingCoeffForRdcs.count;
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
  return p_agingCoeffForRdcs->list[a3];
}

- (void)setAgingCoeffForRdcs:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (unint64_t)agingCoeffForRdcTemperatureCoeffsCount
{
  return self->_agingCoeffForRdcTemperatureCoeffs.count;
}

- (float)agingCoeffForRdcTemperatureCoeffs
{
  return self->_agingCoeffForRdcTemperatureCoeffs.list;
}

- (void)clearAgingCoeffForRdcTemperatureCoeffs
{
  PBRepeatedFloatClear();
}

- (void)addAgingCoeffForRdcTemperatureCoeff:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)agingCoeffForRdcTemperatureCoeffAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_agingCoeffForRdcTemperatureCoeffs;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_agingCoeffForRdcTemperatureCoeffs = &self->_agingCoeffForRdcTemperatureCoeffs;
  count = self->_agingCoeffForRdcTemperatureCoeffs.count;
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
  return p_agingCoeffForRdcTemperatureCoeffs->list[a3];
}

- (void)setAgingCoeffForRdcTemperatureCoeffs:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (unint64_t)qmaxsCount
{
  return self->_qmaxs.count;
}

- (float)qmaxs
{
  return self->_qmaxs.list;
}

- (void)clearQmaxs
{
  PBRepeatedFloatClear();
}

- (void)addQmax:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)qmaxAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_qmaxs;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_qmaxs = &self->_qmaxs;
  count = self->_qmaxs.count;
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
  return p_qmaxs->list[a3];
}

- (void)setQmaxs:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (void)setMaxRdcR25Ratio:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_maxRdcR25Ratio = a3;
}

- (void)setHasMaxRdcR25Ratio:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMaxRdcR25Ratio
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)OTAParamRC;
  -[OTAParamRC description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTAParamRC dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  OTAResistanceData *r0;
  void *v5;
  OTAResistanceData *r1;
  void *v7;
  OTAResistanceData *baselineR1;
  void *v9;
  OTAResistanceData *r2;
  void *v11;
  OTAResistanceData *baselineR2;
  void *v13;
  OTAResistanceData *rCFreq1;
  void *v15;
  OTAResistanceData *rCFreq2;
  void *v17;
  OTAResistanceData *rCFreq3;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  OTAResistanceData *baselineR0;
  void *v28;
  OTABMUResistance *bmuResistance;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  OTAResistanceData *baselineR3;
  void *v35;
  char has;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  OTAResistanceData *r3;
  void *v43;
  OTAResistanceData *rCFreq4;
  void *v45;
  OTAResistanceData *baselineR4;
  void *v47;
  OTAResistanceData *baselineRCFreq1;
  void *v49;
  OTAResistanceData *baselineRCFreq2;
  void *v51;
  OTAResistanceData *baselineRCFreq3;
  void *v53;
  OTAResistanceData *baselineRCFreq4;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  char v67;
  int mLBConfig;
  __CFString *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  OTAResistanceData *rdc;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  double v81;
  void *v82;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  r0 = self->_r0;
  if (r0)
  {
    -[OTAResistanceData dictionaryRepresentation](r0, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("R0"));

  }
  r1 = self->_r1;
  if (r1)
  {
    -[OTAResistanceData dictionaryRepresentation](r1, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("R1"));

  }
  baselineR1 = self->_baselineR1;
  if (baselineR1)
  {
    -[OTAResistanceData dictionaryRepresentation](baselineR1, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("baselineR1"));

  }
  r2 = self->_r2;
  if (r2)
  {
    -[OTAResistanceData dictionaryRepresentation](r2, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("R2"));

  }
  baselineR2 = self->_baselineR2;
  if (baselineR2)
  {
    -[OTAResistanceData dictionaryRepresentation](baselineR2, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("baselineR2"));

  }
  rCFreq1 = self->_rCFreq1;
  if (rCFreq1)
  {
    -[OTAResistanceData dictionaryRepresentation](rCFreq1, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("RCFreq1"));

  }
  rCFreq2 = self->_rCFreq2;
  if (rCFreq2)
  {
    -[OTAResistanceData dictionaryRepresentation](rCFreq2, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("RCFreq2"));

  }
  rCFreq3 = self->_rCFreq3;
  if (rCFreq3)
  {
    -[OTAResistanceData dictionaryRepresentation](rCFreq3, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("RCFreq3"));

  }
  PBRepeatedFloatNSArray();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("agingCoeffForR0"));

  PBRepeatedFloatNSArray();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("agingCoeffForR0TemperatureCoeff"));

  PBRepeatedFloatNSArray();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("agingCoeffForR1"));

  PBRepeatedFloatNSArray();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("agingCoeffForR1TemperatureCoeff"));

  PBRepeatedFloatNSArray();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("agingCoeffForR2"));

  PBRepeatedFloatNSArray();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("agingCoeffForR2TemperatureCoeff"));

  PBRepeatedFloatNSArray();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("baselineRdc"));

  baselineR0 = self->_baselineR0;
  if (baselineR0)
  {
    -[OTAResistanceData dictionaryRepresentation](baselineR0, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("baselineR0"));

  }
  bmuResistance = self->_bmuResistance;
  if (bmuResistance)
  {
    -[OTABMUResistance dictionaryRepresentation](bmuResistance, "dictionaryRepresentation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("bmuResistance"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_chemID);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("chemID"));

  PBRepeatedFloatNSArray();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("gridOCV"));

  baselineR3 = self->_baselineR3;
  if (baselineR3)
  {
    -[OTAResistanceData dictionaryRepresentation](baselineR3, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("baselineR3"));

  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(float *)&v33 = self->_maxRdcRatio;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v33);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v70, CFSTR("maxRdcRatio"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_25:
      if ((has & 1) == 0)
        goto LABEL_27;
      goto LABEL_26;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_25;
  }
  *(float *)&v33 = self->_maxRdcRatioR2Extrap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v33);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v71, CFSTR("maxRdcRatioR2Extrap"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_26:
    *(float *)&v33 = self->_baselineWRdc;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v33);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("baselineWRdc"));

  }
LABEL_27:
  PBRepeatedFloatNSArray();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("slopeForR0Extrap"));

  PBRepeatedFloatNSArray();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("slopeForR1Extrap"));

  PBRepeatedFloatNSArray();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("slopeForR2Extrap"));

  PBRepeatedFloatNSArray();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("slopeForR3Extrap"));

  r3 = self->_r3;
  if (r3)
  {
    -[OTAResistanceData dictionaryRepresentation](r3, "dictionaryRepresentation");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("R3"));

  }
  rCFreq4 = self->_rCFreq4;
  if (rCFreq4)
  {
    -[OTAResistanceData dictionaryRepresentation](rCFreq4, "dictionaryRepresentation");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("RCFreq4"));

  }
  baselineR4 = self->_baselineR4;
  if (baselineR4)
  {
    -[OTAResistanceData dictionaryRepresentation](baselineR4, "dictionaryRepresentation");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("baselineR4"));

  }
  baselineRCFreq1 = self->_baselineRCFreq1;
  if (baselineRCFreq1)
  {
    -[OTAResistanceData dictionaryRepresentation](baselineRCFreq1, "dictionaryRepresentation");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("baselineRCFreq1"));

  }
  baselineRCFreq2 = self->_baselineRCFreq2;
  if (baselineRCFreq2)
  {
    -[OTAResistanceData dictionaryRepresentation](baselineRCFreq2, "dictionaryRepresentation");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v51, CFSTR("baselineRCFreq2"));

  }
  baselineRCFreq3 = self->_baselineRCFreq3;
  if (baselineRCFreq3)
  {
    -[OTAResistanceData dictionaryRepresentation](baselineRCFreq3, "dictionaryRepresentation");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v53, CFSTR("baselineRCFreq3"));

  }
  baselineRCFreq4 = self->_baselineRCFreq4;
  if (baselineRCFreq4)
  {
    -[OTAResistanceData dictionaryRepresentation](baselineRCFreq4, "dictionaryRepresentation");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v55, CFSTR("baselineRCFreq4"));

  }
  PBRepeatedFloatNSArray();
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v56, CFSTR("agingCoeffForR3"));

  PBRepeatedFloatNSArray();
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v57, CFSTR("agingCoeffForR3TemperatureCoeff"));

  PBRepeatedFloatNSArray();
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v58, CFSTR("agingCoeffForRCFreq1"));

  PBRepeatedFloatNSArray();
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v59, CFSTR("agingCoeffForRCFreq2"));

  PBRepeatedFloatNSArray();
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v60, CFSTR("agingCoeffForRCFreq3"));

  PBRepeatedFloatNSArray();
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v61, CFSTR("agingCoeffForRCFreq4"));

  PBRepeatedFloatNSArray();
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v62, CFSTR("agingCoeffForRCFreq1TemperatureCoeff"));

  PBRepeatedFloatNSArray();
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v63, CFSTR("agingCoeffForRCFreq2TemperatureCoeff"));

  PBRepeatedFloatNSArray();
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v64, CFSTR("agingCoeffForRCFreq3TemperatureCoeff"));

  PBRepeatedFloatNSArray();
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v65, CFSTR("agingCoeffForRCFreq4TemperatureCoeff"));

  v67 = (char)self->_has;
  if ((v67 & 2) != 0)
  {
    mLBConfig = self->_mLBConfig;
    if (mLBConfig)
    {
      if (mLBConfig == 1)
      {
        v69 = CFSTR("kPPMNorthSouthSplitMLB");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_mLBConfig);
        v69 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v69 = CFSTR("kPPMRegularMLB");
    }
    objc_msgSend(v3, "setObject:forKey:", v69, CFSTR("MLBConfig"));

    v67 = (char)self->_has;
  }
  if ((v67 & 0x20) != 0)
  {
    *(float *)&v66 = self->_wRdcRatioThresh;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v66);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v72, CFSTR("wRdcRatioThresh"));

  }
  PBRepeatedFloatNSArray();
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v73, CFSTR("gridWRdcRatio"));

  PBRepeatedFloatNSArray();
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v74, CFSTR("coeffSOC"));

  PBRepeatedFloatNSArray();
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v75, CFSTR("coeffV"));

  rdc = self->_rdc;
  if (rdc)
  {
    -[OTAResistanceData dictionaryRepresentation](rdc, "dictionaryRepresentation");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v77, CFSTR("Rdc"));

  }
  PBRepeatedFloatNSArray();
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v78, CFSTR("agingCoeffForRdc"));

  PBRepeatedFloatNSArray();
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v79, CFSTR("agingCoeffForRdcTemperatureCoeff"));

  PBRepeatedFloatNSArray();
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v80, CFSTR("Qmax"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(float *)&v81 = self->_maxRdcR25Ratio;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v82, CFSTR("maxRdcR25Ratio"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return OTAParamRCReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char has;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  id v35;

  v35 = a3;
  if (self->_r0)
    PBDataWriterWriteSubmessage();
  if (self->_r1)
    PBDataWriterWriteSubmessage();
  if (self->_baselineR1)
    PBDataWriterWriteSubmessage();
  if (self->_r2)
    PBDataWriterWriteSubmessage();
  if (self->_baselineR2)
    PBDataWriterWriteSubmessage();
  if (self->_rCFreq1)
    PBDataWriterWriteSubmessage();
  if (self->_rCFreq2)
    PBDataWriterWriteSubmessage();
  if (self->_rCFreq3)
    PBDataWriterWriteSubmessage();
  if (self->_agingCoeffForR0s.count)
  {
    v4 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      ++v4;
    }
    while (v4 < self->_agingCoeffForR0s.count);
  }
  if (self->_agingCoeffForR0TemperatureCoeffs.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      ++v5;
    }
    while (v5 < self->_agingCoeffForR0TemperatureCoeffs.count);
  }
  if (self->_agingCoeffForR1s.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      ++v6;
    }
    while (v6 < self->_agingCoeffForR1s.count);
  }
  if (self->_agingCoeffForR1TemperatureCoeffs.count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      ++v7;
    }
    while (v7 < self->_agingCoeffForR1TemperatureCoeffs.count);
  }
  if (self->_agingCoeffForR2s.count)
  {
    v8 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      ++v8;
    }
    while (v8 < self->_agingCoeffForR2s.count);
  }
  if (self->_agingCoeffForR2TemperatureCoeffs.count)
  {
    v9 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      ++v9;
    }
    while (v9 < self->_agingCoeffForR2TemperatureCoeffs.count);
  }
  if (self->_baselineRdcs.count)
  {
    v10 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      ++v10;
    }
    while (v10 < self->_baselineRdcs.count);
  }
  if (self->_baselineR0)
    PBDataWriterWriteSubmessage();
  if (self->_bmuResistance)
    PBDataWriterWriteSubmessage();
  PBDataWriterWriteUint32Field();
  if (self->_gridOCVs.count)
  {
    v11 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      ++v11;
    }
    while (v11 < self->_gridOCVs.count);
  }
  if (self->_baselineR3)
    PBDataWriterWriteSubmessage();
  has = (char)self->_has;
  v13 = v35;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteFloatField();
    v13 = v35;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_49:
      if ((has & 1) == 0)
        goto LABEL_51;
      goto LABEL_50;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_49;
  }
  PBDataWriterWriteFloatField();
  v13 = v35;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_50:
    PBDataWriterWriteFloatField();
    v13 = v35;
  }
LABEL_51:
  if (self->_slopeForR0Extraps.count)
  {
    v14 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v14;
    }
    while (v14 < self->_slopeForR0Extraps.count);
  }
  if (self->_slopeForR1Extraps.count)
  {
    v15 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v15;
    }
    while (v15 < self->_slopeForR1Extraps.count);
  }
  if (self->_slopeForR2Extraps.count)
  {
    v16 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v16;
    }
    while (v16 < self->_slopeForR2Extraps.count);
  }
  if (self->_slopeForR3Extraps.count)
  {
    v17 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v17;
    }
    while (v17 < self->_slopeForR3Extraps.count);
  }
  if (self->_r3)
  {
    PBDataWriterWriteSubmessage();
    v13 = v35;
  }
  if (self->_rCFreq4)
  {
    PBDataWriterWriteSubmessage();
    v13 = v35;
  }
  if (self->_baselineR4)
  {
    PBDataWriterWriteSubmessage();
    v13 = v35;
  }
  if (self->_baselineRCFreq1)
  {
    PBDataWriterWriteSubmessage();
    v13 = v35;
  }
  if (self->_baselineRCFreq2)
  {
    PBDataWriterWriteSubmessage();
    v13 = v35;
  }
  if (self->_baselineRCFreq3)
  {
    PBDataWriterWriteSubmessage();
    v13 = v35;
  }
  if (self->_baselineRCFreq4)
  {
    PBDataWriterWriteSubmessage();
    v13 = v35;
  }
  if (self->_agingCoeffForR3s.count)
  {
    v18 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v18;
    }
    while (v18 < self->_agingCoeffForR3s.count);
  }
  if (self->_agingCoeffForR3TemperatureCoeffs.count)
  {
    v19 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v19;
    }
    while (v19 < self->_agingCoeffForR3TemperatureCoeffs.count);
  }
  if (self->_agingCoeffForRCFreq1s.count)
  {
    v20 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v20;
    }
    while (v20 < self->_agingCoeffForRCFreq1s.count);
  }
  if (self->_agingCoeffForRCFreq2s.count)
  {
    v21 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v21;
    }
    while (v21 < self->_agingCoeffForRCFreq2s.count);
  }
  if (self->_agingCoeffForRCFreq3s.count)
  {
    v22 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v22;
    }
    while (v22 < self->_agingCoeffForRCFreq3s.count);
  }
  if (self->_agingCoeffForRCFreq4s.count)
  {
    v23 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v23;
    }
    while (v23 < self->_agingCoeffForRCFreq4s.count);
  }
  if (self->_agingCoeffForRCFreq1TemperatureCoeffs.count)
  {
    v24 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v24;
    }
    while (v24 < self->_agingCoeffForRCFreq1TemperatureCoeffs.count);
  }
  if (self->_agingCoeffForRCFreq2TemperatureCoeffs.count)
  {
    v25 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v25;
    }
    while (v25 < self->_agingCoeffForRCFreq2TemperatureCoeffs.count);
  }
  if (self->_agingCoeffForRCFreq3TemperatureCoeffs.count)
  {
    v26 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v26;
    }
    while (v26 < self->_agingCoeffForRCFreq3TemperatureCoeffs.count);
  }
  if (self->_agingCoeffForRCFreq4TemperatureCoeffs.count)
  {
    v27 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v27;
    }
    while (v27 < self->_agingCoeffForRCFreq4TemperatureCoeffs.count);
  }
  v28 = (char)self->_has;
  if ((v28 & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v13 = v35;
    v28 = (char)self->_has;
  }
  if ((v28 & 0x20) != 0)
  {
    PBDataWriterWriteFloatField();
    v13 = v35;
  }
  if (self->_gridWRdcRatios.count)
  {
    v29 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v29;
    }
    while (v29 < self->_gridWRdcRatios.count);
  }
  if (self->_coeffSOCs.count)
  {
    v30 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v30;
    }
    while (v30 < self->_coeffSOCs.count);
  }
  if (self->_coeffVs.count)
  {
    v31 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v31;
    }
    while (v31 < self->_coeffVs.count);
  }
  if (self->_rdc)
  {
    PBDataWriterWriteSubmessage();
    v13 = v35;
  }
  if (self->_agingCoeffForRdcs.count)
  {
    v32 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v32;
    }
    while (v32 < self->_agingCoeffForRdcs.count);
  }
  if (self->_agingCoeffForRdcTemperatureCoeffs.count)
  {
    v33 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v33;
    }
    while (v33 < self->_agingCoeffForRdcTemperatureCoeffs.count);
  }
  if (self->_qmaxs.count)
  {
    v34 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v13 = v35;
      ++v34;
    }
    while (v34 < self->_qmaxs.count);
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteFloatField();
    v13 = v35;
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
  unint64_t v10;
  unint64_t v11;
  uint64_t k;
  unint64_t v13;
  unint64_t v14;
  uint64_t m;
  unint64_t v16;
  unint64_t v17;
  uint64_t n;
  unint64_t v19;
  unint64_t v20;
  uint64_t ii;
  unint64_t v22;
  unint64_t v23;
  uint64_t jj;
  _DWORD *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t kk;
  char has;
  unint64_t v30;
  unint64_t v31;
  uint64_t mm;
  unint64_t v33;
  unint64_t v34;
  uint64_t nn;
  unint64_t v36;
  unint64_t v37;
  uint64_t i1;
  unint64_t v39;
  unint64_t v40;
  uint64_t i2;
  unint64_t v42;
  unint64_t v43;
  uint64_t i3;
  unint64_t v45;
  unint64_t v46;
  uint64_t i4;
  unint64_t v48;
  unint64_t v49;
  uint64_t i5;
  unint64_t v51;
  unint64_t v52;
  uint64_t i6;
  unint64_t v54;
  unint64_t v55;
  uint64_t i7;
  unint64_t v57;
  unint64_t v58;
  uint64_t i8;
  unint64_t v60;
  unint64_t v61;
  uint64_t i9;
  unint64_t v63;
  unint64_t v64;
  uint64_t i10;
  unint64_t v66;
  unint64_t v67;
  uint64_t i11;
  unint64_t v69;
  unint64_t v70;
  uint64_t i12;
  char v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t i13;
  unint64_t v76;
  unint64_t v77;
  uint64_t i14;
  unint64_t v79;
  unint64_t v80;
  uint64_t i15;
  unint64_t v82;
  unint64_t v83;
  uint64_t i16;
  unint64_t v85;
  unint64_t v86;
  uint64_t i17;
  unint64_t v88;
  unint64_t v89;
  uint64_t i18;
  id v91;

  v91 = a3;
  if (self->_r0)
    objc_msgSend(v91, "setR0:");
  if (self->_r1)
    objc_msgSend(v91, "setR1:");
  if (self->_baselineR1)
    objc_msgSend(v91, "setBaselineR1:");
  if (self->_r2)
    objc_msgSend(v91, "setR2:");
  if (self->_baselineR2)
    objc_msgSend(v91, "setBaselineR2:");
  if (self->_rCFreq1)
    objc_msgSend(v91, "setRCFreq1:");
  if (self->_rCFreq2)
    objc_msgSend(v91, "setRCFreq2:");
  if (self->_rCFreq3)
    objc_msgSend(v91, "setRCFreq3:");
  if (-[OTAParamRC agingCoeffForR0sCount](self, "agingCoeffForR0sCount"))
  {
    objc_msgSend(v91, "clearAgingCoeffForR0s");
    v4 = -[OTAParamRC agingCoeffForR0sCount](self, "agingCoeffForR0sCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[OTAParamRC agingCoeffForR0AtIndex:](self, "agingCoeffForR0AtIndex:", i);
        objc_msgSend(v91, "addAgingCoeffForR0:");
      }
    }
  }
  if (-[OTAParamRC agingCoeffForR0TemperatureCoeffsCount](self, "agingCoeffForR0TemperatureCoeffsCount"))
  {
    objc_msgSend(v91, "clearAgingCoeffForR0TemperatureCoeffs");
    v7 = -[OTAParamRC agingCoeffForR0TemperatureCoeffsCount](self, "agingCoeffForR0TemperatureCoeffsCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
      {
        -[OTAParamRC agingCoeffForR0TemperatureCoeffAtIndex:](self, "agingCoeffForR0TemperatureCoeffAtIndex:", j);
        objc_msgSend(v91, "addAgingCoeffForR0TemperatureCoeff:");
      }
    }
  }
  if (-[OTAParamRC agingCoeffForR1sCount](self, "agingCoeffForR1sCount"))
  {
    objc_msgSend(v91, "clearAgingCoeffForR1s");
    v10 = -[OTAParamRC agingCoeffForR1sCount](self, "agingCoeffForR1sCount");
    if (v10)
    {
      v11 = v10;
      for (k = 0; k != v11; ++k)
      {
        -[OTAParamRC agingCoeffForR1AtIndex:](self, "agingCoeffForR1AtIndex:", k);
        objc_msgSend(v91, "addAgingCoeffForR1:");
      }
    }
  }
  if (-[OTAParamRC agingCoeffForR1TemperatureCoeffsCount](self, "agingCoeffForR1TemperatureCoeffsCount"))
  {
    objc_msgSend(v91, "clearAgingCoeffForR1TemperatureCoeffs");
    v13 = -[OTAParamRC agingCoeffForR1TemperatureCoeffsCount](self, "agingCoeffForR1TemperatureCoeffsCount");
    if (v13)
    {
      v14 = v13;
      for (m = 0; m != v14; ++m)
      {
        -[OTAParamRC agingCoeffForR1TemperatureCoeffAtIndex:](self, "agingCoeffForR1TemperatureCoeffAtIndex:", m);
        objc_msgSend(v91, "addAgingCoeffForR1TemperatureCoeff:");
      }
    }
  }
  if (-[OTAParamRC agingCoeffForR2sCount](self, "agingCoeffForR2sCount"))
  {
    objc_msgSend(v91, "clearAgingCoeffForR2s");
    v16 = -[OTAParamRC agingCoeffForR2sCount](self, "agingCoeffForR2sCount");
    if (v16)
    {
      v17 = v16;
      for (n = 0; n != v17; ++n)
      {
        -[OTAParamRC agingCoeffForR2AtIndex:](self, "agingCoeffForR2AtIndex:", n);
        objc_msgSend(v91, "addAgingCoeffForR2:");
      }
    }
  }
  if (-[OTAParamRC agingCoeffForR2TemperatureCoeffsCount](self, "agingCoeffForR2TemperatureCoeffsCount"))
  {
    objc_msgSend(v91, "clearAgingCoeffForR2TemperatureCoeffs");
    v19 = -[OTAParamRC agingCoeffForR2TemperatureCoeffsCount](self, "agingCoeffForR2TemperatureCoeffsCount");
    if (v19)
    {
      v20 = v19;
      for (ii = 0; ii != v20; ++ii)
      {
        -[OTAParamRC agingCoeffForR2TemperatureCoeffAtIndex:](self, "agingCoeffForR2TemperatureCoeffAtIndex:", ii);
        objc_msgSend(v91, "addAgingCoeffForR2TemperatureCoeff:");
      }
    }
  }
  if (-[OTAParamRC baselineRdcsCount](self, "baselineRdcsCount"))
  {
    objc_msgSend(v91, "clearBaselineRdcs");
    v22 = -[OTAParamRC baselineRdcsCount](self, "baselineRdcsCount");
    if (v22)
    {
      v23 = v22;
      for (jj = 0; jj != v23; ++jj)
      {
        -[OTAParamRC baselineRdcAtIndex:](self, "baselineRdcAtIndex:", jj);
        objc_msgSend(v91, "addBaselineRdc:");
      }
    }
  }
  if (self->_baselineR0)
    objc_msgSend(v91, "setBaselineR0:");
  v25 = v91;
  if (self->_bmuResistance)
  {
    objc_msgSend(v91, "setBmuResistance:");
    v25 = v91;
  }
  v25[192] = self->_chemID;
  if (-[OTAParamRC gridOCVsCount](self, "gridOCVsCount"))
  {
    objc_msgSend(v91, "clearGridOCVs");
    v26 = -[OTAParamRC gridOCVsCount](self, "gridOCVsCount");
    if (v26)
    {
      v27 = v26;
      for (kk = 0; kk != v27; ++kk)
      {
        -[OTAParamRC gridOCVAtIndex:](self, "gridOCVAtIndex:", kk);
        objc_msgSend(v91, "addGridOCV:");
      }
    }
  }
  if (self->_baselineR3)
    objc_msgSend(v91, "setBaselineR3:");
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_57;
LABEL_163:
    *((_DWORD *)v91 + 196) = LODWORD(self->_maxRdcRatioR2Extrap);
    *((_BYTE *)v91 + 868) |= 0x10u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_59;
    goto LABEL_58;
  }
  *((_DWORD *)v91 + 195) = LODWORD(self->_maxRdcRatio);
  *((_BYTE *)v91 + 868) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_163;
LABEL_57:
  if ((has & 1) != 0)
  {
LABEL_58:
    *((_DWORD *)v91 + 188) = LODWORD(self->_baselineWRdc);
    *((_BYTE *)v91 + 868) |= 1u;
  }
LABEL_59:
  if (-[OTAParamRC slopeForR0ExtrapsCount](self, "slopeForR0ExtrapsCount"))
  {
    objc_msgSend(v91, "clearSlopeForR0Extraps");
    v30 = -[OTAParamRC slopeForR0ExtrapsCount](self, "slopeForR0ExtrapsCount");
    if (v30)
    {
      v31 = v30;
      for (mm = 0; mm != v31; ++mm)
      {
        -[OTAParamRC slopeForR0ExtrapAtIndex:](self, "slopeForR0ExtrapAtIndex:", mm);
        objc_msgSend(v91, "addSlopeForR0Extrap:");
      }
    }
  }
  if (-[OTAParamRC slopeForR1ExtrapsCount](self, "slopeForR1ExtrapsCount"))
  {
    objc_msgSend(v91, "clearSlopeForR1Extraps");
    v33 = -[OTAParamRC slopeForR1ExtrapsCount](self, "slopeForR1ExtrapsCount");
    if (v33)
    {
      v34 = v33;
      for (nn = 0; nn != v34; ++nn)
      {
        -[OTAParamRC slopeForR1ExtrapAtIndex:](self, "slopeForR1ExtrapAtIndex:", nn);
        objc_msgSend(v91, "addSlopeForR1Extrap:");
      }
    }
  }
  if (-[OTAParamRC slopeForR2ExtrapsCount](self, "slopeForR2ExtrapsCount"))
  {
    objc_msgSend(v91, "clearSlopeForR2Extraps");
    v36 = -[OTAParamRC slopeForR2ExtrapsCount](self, "slopeForR2ExtrapsCount");
    if (v36)
    {
      v37 = v36;
      for (i1 = 0; i1 != v37; ++i1)
      {
        -[OTAParamRC slopeForR2ExtrapAtIndex:](self, "slopeForR2ExtrapAtIndex:", i1);
        objc_msgSend(v91, "addSlopeForR2Extrap:");
      }
    }
  }
  if (-[OTAParamRC slopeForR3ExtrapsCount](self, "slopeForR3ExtrapsCount"))
  {
    objc_msgSend(v91, "clearSlopeForR3Extraps");
    v39 = -[OTAParamRC slopeForR3ExtrapsCount](self, "slopeForR3ExtrapsCount");
    if (v39)
    {
      v40 = v39;
      for (i2 = 0; i2 != v40; ++i2)
      {
        -[OTAParamRC slopeForR3ExtrapAtIndex:](self, "slopeForR3ExtrapAtIndex:", i2);
        objc_msgSend(v91, "addSlopeForR3Extrap:");
      }
    }
  }
  if (self->_r3)
    objc_msgSend(v91, "setR3:");
  if (self->_rCFreq4)
    objc_msgSend(v91, "setRCFreq4:");
  if (self->_baselineR4)
    objc_msgSend(v91, "setBaselineR4:");
  if (self->_baselineRCFreq1)
    objc_msgSend(v91, "setBaselineRCFreq1:");
  if (self->_baselineRCFreq2)
    objc_msgSend(v91, "setBaselineRCFreq2:");
  if (self->_baselineRCFreq3)
    objc_msgSend(v91, "setBaselineRCFreq3:");
  if (self->_baselineRCFreq4)
    objc_msgSend(v91, "setBaselineRCFreq4:");
  if (-[OTAParamRC agingCoeffForR3sCount](self, "agingCoeffForR3sCount"))
  {
    objc_msgSend(v91, "clearAgingCoeffForR3s");
    v42 = -[OTAParamRC agingCoeffForR3sCount](self, "agingCoeffForR3sCount");
    if (v42)
    {
      v43 = v42;
      for (i3 = 0; i3 != v43; ++i3)
      {
        -[OTAParamRC agingCoeffForR3AtIndex:](self, "agingCoeffForR3AtIndex:", i3);
        objc_msgSend(v91, "addAgingCoeffForR3:");
      }
    }
  }
  if (-[OTAParamRC agingCoeffForR3TemperatureCoeffsCount](self, "agingCoeffForR3TemperatureCoeffsCount"))
  {
    objc_msgSend(v91, "clearAgingCoeffForR3TemperatureCoeffs");
    v45 = -[OTAParamRC agingCoeffForR3TemperatureCoeffsCount](self, "agingCoeffForR3TemperatureCoeffsCount");
    if (v45)
    {
      v46 = v45;
      for (i4 = 0; i4 != v46; ++i4)
      {
        -[OTAParamRC agingCoeffForR3TemperatureCoeffAtIndex:](self, "agingCoeffForR3TemperatureCoeffAtIndex:", i4);
        objc_msgSend(v91, "addAgingCoeffForR3TemperatureCoeff:");
      }
    }
  }
  if (-[OTAParamRC agingCoeffForRCFreq1sCount](self, "agingCoeffForRCFreq1sCount"))
  {
    objc_msgSend(v91, "clearAgingCoeffForRCFreq1s");
    v48 = -[OTAParamRC agingCoeffForRCFreq1sCount](self, "agingCoeffForRCFreq1sCount");
    if (v48)
    {
      v49 = v48;
      for (i5 = 0; i5 != v49; ++i5)
      {
        -[OTAParamRC agingCoeffForRCFreq1AtIndex:](self, "agingCoeffForRCFreq1AtIndex:", i5);
        objc_msgSend(v91, "addAgingCoeffForRCFreq1:");
      }
    }
  }
  if (-[OTAParamRC agingCoeffForRCFreq2sCount](self, "agingCoeffForRCFreq2sCount"))
  {
    objc_msgSend(v91, "clearAgingCoeffForRCFreq2s");
    v51 = -[OTAParamRC agingCoeffForRCFreq2sCount](self, "agingCoeffForRCFreq2sCount");
    if (v51)
    {
      v52 = v51;
      for (i6 = 0; i6 != v52; ++i6)
      {
        -[OTAParamRC agingCoeffForRCFreq2AtIndex:](self, "agingCoeffForRCFreq2AtIndex:", i6);
        objc_msgSend(v91, "addAgingCoeffForRCFreq2:");
      }
    }
  }
  if (-[OTAParamRC agingCoeffForRCFreq3sCount](self, "agingCoeffForRCFreq3sCount"))
  {
    objc_msgSend(v91, "clearAgingCoeffForRCFreq3s");
    v54 = -[OTAParamRC agingCoeffForRCFreq3sCount](self, "agingCoeffForRCFreq3sCount");
    if (v54)
    {
      v55 = v54;
      for (i7 = 0; i7 != v55; ++i7)
      {
        -[OTAParamRC agingCoeffForRCFreq3AtIndex:](self, "agingCoeffForRCFreq3AtIndex:", i7);
        objc_msgSend(v91, "addAgingCoeffForRCFreq3:");
      }
    }
  }
  if (-[OTAParamRC agingCoeffForRCFreq4sCount](self, "agingCoeffForRCFreq4sCount"))
  {
    objc_msgSend(v91, "clearAgingCoeffForRCFreq4s");
    v57 = -[OTAParamRC agingCoeffForRCFreq4sCount](self, "agingCoeffForRCFreq4sCount");
    if (v57)
    {
      v58 = v57;
      for (i8 = 0; i8 != v58; ++i8)
      {
        -[OTAParamRC agingCoeffForRCFreq4AtIndex:](self, "agingCoeffForRCFreq4AtIndex:", i8);
        objc_msgSend(v91, "addAgingCoeffForRCFreq4:");
      }
    }
  }
  if (-[OTAParamRC agingCoeffForRCFreq1TemperatureCoeffsCount](self, "agingCoeffForRCFreq1TemperatureCoeffsCount"))
  {
    objc_msgSend(v91, "clearAgingCoeffForRCFreq1TemperatureCoeffs");
    v60 = -[OTAParamRC agingCoeffForRCFreq1TemperatureCoeffsCount](self, "agingCoeffForRCFreq1TemperatureCoeffsCount");
    if (v60)
    {
      v61 = v60;
      for (i9 = 0; i9 != v61; ++i9)
      {
        -[OTAParamRC agingCoeffForRCFreq1TemperatureCoeffAtIndex:](self, "agingCoeffForRCFreq1TemperatureCoeffAtIndex:", i9);
        objc_msgSend(v91, "addAgingCoeffForRCFreq1TemperatureCoeff:");
      }
    }
  }
  if (-[OTAParamRC agingCoeffForRCFreq2TemperatureCoeffsCount](self, "agingCoeffForRCFreq2TemperatureCoeffsCount"))
  {
    objc_msgSend(v91, "clearAgingCoeffForRCFreq2TemperatureCoeffs");
    v63 = -[OTAParamRC agingCoeffForRCFreq2TemperatureCoeffsCount](self, "agingCoeffForRCFreq2TemperatureCoeffsCount");
    if (v63)
    {
      v64 = v63;
      for (i10 = 0; i10 != v64; ++i10)
      {
        -[OTAParamRC agingCoeffForRCFreq2TemperatureCoeffAtIndex:](self, "agingCoeffForRCFreq2TemperatureCoeffAtIndex:", i10);
        objc_msgSend(v91, "addAgingCoeffForRCFreq2TemperatureCoeff:");
      }
    }
  }
  if (-[OTAParamRC agingCoeffForRCFreq3TemperatureCoeffsCount](self, "agingCoeffForRCFreq3TemperatureCoeffsCount"))
  {
    objc_msgSend(v91, "clearAgingCoeffForRCFreq3TemperatureCoeffs");
    v66 = -[OTAParamRC agingCoeffForRCFreq3TemperatureCoeffsCount](self, "agingCoeffForRCFreq3TemperatureCoeffsCount");
    if (v66)
    {
      v67 = v66;
      for (i11 = 0; i11 != v67; ++i11)
      {
        -[OTAParamRC agingCoeffForRCFreq3TemperatureCoeffAtIndex:](self, "agingCoeffForRCFreq3TemperatureCoeffAtIndex:", i11);
        objc_msgSend(v91, "addAgingCoeffForRCFreq3TemperatureCoeff:");
      }
    }
  }
  if (-[OTAParamRC agingCoeffForRCFreq4TemperatureCoeffsCount](self, "agingCoeffForRCFreq4TemperatureCoeffsCount"))
  {
    objc_msgSend(v91, "clearAgingCoeffForRCFreq4TemperatureCoeffs");
    v69 = -[OTAParamRC agingCoeffForRCFreq4TemperatureCoeffsCount](self, "agingCoeffForRCFreq4TemperatureCoeffsCount");
    if (v69)
    {
      v70 = v69;
      for (i12 = 0; i12 != v70; ++i12)
      {
        -[OTAParamRC agingCoeffForRCFreq4TemperatureCoeffAtIndex:](self, "agingCoeffForRCFreq4TemperatureCoeffAtIndex:", i12);
        objc_msgSend(v91, "addAgingCoeffForRCFreq4TemperatureCoeff:");
      }
    }
  }
  v72 = (char)self->_has;
  if ((v72 & 2) != 0)
  {
    *((_DWORD *)v91 + 193) = self->_mLBConfig;
    *((_BYTE *)v91 + 868) |= 2u;
    v72 = (char)self->_has;
  }
  if ((v72 & 0x20) != 0)
  {
    *((_DWORD *)v91 + 216) = LODWORD(self->_wRdcRatioThresh);
    *((_BYTE *)v91 + 868) |= 0x20u;
  }
  if (-[OTAParamRC gridWRdcRatiosCount](self, "gridWRdcRatiosCount"))
  {
    objc_msgSend(v91, "clearGridWRdcRatios");
    v73 = -[OTAParamRC gridWRdcRatiosCount](self, "gridWRdcRatiosCount");
    if (v73)
    {
      v74 = v73;
      for (i13 = 0; i13 != v74; ++i13)
      {
        -[OTAParamRC gridWRdcRatioAtIndex:](self, "gridWRdcRatioAtIndex:", i13);
        objc_msgSend(v91, "addGridWRdcRatio:");
      }
    }
  }
  if (-[OTAParamRC coeffSOCsCount](self, "coeffSOCsCount"))
  {
    objc_msgSend(v91, "clearCoeffSOCs");
    v76 = -[OTAParamRC coeffSOCsCount](self, "coeffSOCsCount");
    if (v76)
    {
      v77 = v76;
      for (i14 = 0; i14 != v77; ++i14)
      {
        -[OTAParamRC coeffSOCAtIndex:](self, "coeffSOCAtIndex:", i14);
        objc_msgSend(v91, "addCoeffSOC:");
      }
    }
  }
  if (-[OTAParamRC coeffVsCount](self, "coeffVsCount"))
  {
    objc_msgSend(v91, "clearCoeffVs");
    v79 = -[OTAParamRC coeffVsCount](self, "coeffVsCount");
    if (v79)
    {
      v80 = v79;
      for (i15 = 0; i15 != v80; ++i15)
      {
        -[OTAParamRC coeffVAtIndex:](self, "coeffVAtIndex:", i15);
        objc_msgSend(v91, "addCoeffV:");
      }
    }
  }
  if (self->_rdc)
    objc_msgSend(v91, "setRdc:");
  if (-[OTAParamRC agingCoeffForRdcsCount](self, "agingCoeffForRdcsCount"))
  {
    objc_msgSend(v91, "clearAgingCoeffForRdcs");
    v82 = -[OTAParamRC agingCoeffForRdcsCount](self, "agingCoeffForRdcsCount");
    if (v82)
    {
      v83 = v82;
      for (i16 = 0; i16 != v83; ++i16)
      {
        -[OTAParamRC agingCoeffForRdcAtIndex:](self, "agingCoeffForRdcAtIndex:", i16);
        objc_msgSend(v91, "addAgingCoeffForRdc:");
      }
    }
  }
  if (-[OTAParamRC agingCoeffForRdcTemperatureCoeffsCount](self, "agingCoeffForRdcTemperatureCoeffsCount"))
  {
    objc_msgSend(v91, "clearAgingCoeffForRdcTemperatureCoeffs");
    v85 = -[OTAParamRC agingCoeffForRdcTemperatureCoeffsCount](self, "agingCoeffForRdcTemperatureCoeffsCount");
    if (v85)
    {
      v86 = v85;
      for (i17 = 0; i17 != v86; ++i17)
      {
        -[OTAParamRC agingCoeffForRdcTemperatureCoeffAtIndex:](self, "agingCoeffForRdcTemperatureCoeffAtIndex:", i17);
        objc_msgSend(v91, "addAgingCoeffForRdcTemperatureCoeff:");
      }
    }
  }
  if (-[OTAParamRC qmaxsCount](self, "qmaxsCount"))
  {
    objc_msgSend(v91, "clearQmaxs");
    v88 = -[OTAParamRC qmaxsCount](self, "qmaxsCount");
    if (v88)
    {
      v89 = v88;
      for (i18 = 0; i18 != v89; ++i18)
      {
        -[OTAParamRC qmaxAtIndex:](self, "qmaxAtIndex:", i18);
        objc_msgSend(v91, "addQmax:");
      }
    }
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v91 + 194) = LODWORD(self->_maxRdcR25Ratio);
    *((_BYTE *)v91 + 868) |= 4u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  char has;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  char v43;
  id v44;
  void *v45;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[OTAResistanceData copyWithZone:](self->_r0, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 792);
  *(_QWORD *)(v5 + 792) = v6;

  v8 = -[OTAResistanceData copyWithZone:](self->_r1, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 800);
  *(_QWORD *)(v5 + 800) = v8;

  v10 = -[OTAResistanceData copyWithZone:](self->_baselineR1, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 688);
  *(_QWORD *)(v5 + 688) = v10;

  v12 = -[OTAResistanceData copyWithZone:](self->_r2, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 808);
  *(_QWORD *)(v5 + 808) = v12;

  v14 = -[OTAResistanceData copyWithZone:](self->_baselineR2, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 696);
  *(_QWORD *)(v5 + 696) = v14;

  v16 = -[OTAResistanceData copyWithZone:](self->_rCFreq1, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 824);
  *(_QWORD *)(v5 + 824) = v16;

  v18 = -[OTAResistanceData copyWithZone:](self->_rCFreq2, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 832);
  *(_QWORD *)(v5 + 832) = v18;

  v20 = -[OTAResistanceData copyWithZone:](self->_rCFreq3, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 840);
  *(_QWORD *)(v5 + 840) = v20;

  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  v22 = -[OTAResistanceData copyWithZone:](self->_baselineR0, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 680);
  *(_QWORD *)(v5 + 680) = v22;

  v24 = -[OTABMUResistance copyWithZone:](self->_bmuResistance, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 760);
  *(_QWORD *)(v5 + 760) = v24;

  *(_DWORD *)(v5 + 768) = self->_chemID;
  PBRepeatedFloatCopy();
  v26 = -[OTAResistanceData copyWithZone:](self->_baselineR3, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 704);
  *(_QWORD *)(v5 + 704) = v26;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(float *)(v5 + 780) = self->_maxRdcRatio;
    *(_BYTE *)(v5 + 868) |= 8u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(float *)(v5 + 784) = self->_maxRdcRatioR2Extrap;
  *(_BYTE *)(v5 + 868) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    *(float *)(v5 + 752) = self->_baselineWRdc;
    *(_BYTE *)(v5 + 868) |= 1u;
  }
LABEL_5:
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  v29 = -[OTAResistanceData copyWithZone:](self->_r3, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 816);
  *(_QWORD *)(v5 + 816) = v29;

  v31 = -[OTAResistanceData copyWithZone:](self->_rCFreq4, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 848);
  *(_QWORD *)(v5 + 848) = v31;

  v33 = -[OTAResistanceData copyWithZone:](self->_baselineR4, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 712);
  *(_QWORD *)(v5 + 712) = v33;

  v35 = -[OTAResistanceData copyWithZone:](self->_baselineRCFreq1, "copyWithZone:", a3);
  v36 = *(void **)(v5 + 720);
  *(_QWORD *)(v5 + 720) = v35;

  v37 = -[OTAResistanceData copyWithZone:](self->_baselineRCFreq2, "copyWithZone:", a3);
  v38 = *(void **)(v5 + 728);
  *(_QWORD *)(v5 + 728) = v37;

  v39 = -[OTAResistanceData copyWithZone:](self->_baselineRCFreq3, "copyWithZone:", a3);
  v40 = *(void **)(v5 + 736);
  *(_QWORD *)(v5 + 736) = v39;

  v41 = -[OTAResistanceData copyWithZone:](self->_baselineRCFreq4, "copyWithZone:", a3);
  v42 = *(void **)(v5 + 744);
  *(_QWORD *)(v5 + 744) = v41;

  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  v43 = (char)self->_has;
  if ((v43 & 2) != 0)
  {
    *(_DWORD *)(v5 + 772) = self->_mLBConfig;
    *(_BYTE *)(v5 + 868) |= 2u;
    v43 = (char)self->_has;
  }
  if ((v43 & 0x20) != 0)
  {
    *(float *)(v5 + 864) = self->_wRdcRatioThresh;
    *(_BYTE *)(v5 + 868) |= 0x20u;
  }
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  v44 = -[OTAResistanceData copyWithZone:](self->_rdc, "copyWithZone:", a3);
  v45 = *(void **)(v5 + 856);
  *(_QWORD *)(v5 + 856) = v44;

  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(float *)(v5 + 776) = self->_maxRdcR25Ratio;
    *(_BYTE *)(v5 + 868) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  OTAResistanceData *r0;
  OTAResistanceData *r1;
  OTAResistanceData *baselineR1;
  OTAResistanceData *r2;
  OTAResistanceData *baselineR2;
  OTAResistanceData *rCFreq1;
  OTAResistanceData *rCFreq2;
  OTAResistanceData *rCFreq3;
  OTAResistanceData *baselineR0;
  OTABMUResistance *bmuResistance;
  OTAResistanceData *baselineR3;
  OTAResistanceData *r3;
  OTAResistanceData *rCFreq4;
  OTAResistanceData *baselineR4;
  OTAResistanceData *baselineRCFreq1;
  OTAResistanceData *baselineRCFreq2;
  OTAResistanceData *baselineRCFreq3;
  OTAResistanceData *baselineRCFreq4;
  OTAResistanceData *rdc;
  BOOL v24;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_99;
  r0 = self->_r0;
  if ((unint64_t)r0 | *((_QWORD *)v4 + 99))
  {
    if (!-[OTAResistanceData isEqual:](r0, "isEqual:"))
      goto LABEL_99;
  }
  r1 = self->_r1;
  if ((unint64_t)r1 | *((_QWORD *)v4 + 100))
  {
    if (!-[OTAResistanceData isEqual:](r1, "isEqual:"))
      goto LABEL_99;
  }
  baselineR1 = self->_baselineR1;
  if ((unint64_t)baselineR1 | *((_QWORD *)v4 + 86))
  {
    if (!-[OTAResistanceData isEqual:](baselineR1, "isEqual:"))
      goto LABEL_99;
  }
  r2 = self->_r2;
  if ((unint64_t)r2 | *((_QWORD *)v4 + 101))
  {
    if (!-[OTAResistanceData isEqual:](r2, "isEqual:"))
      goto LABEL_99;
  }
  baselineR2 = self->_baselineR2;
  if ((unint64_t)baselineR2 | *((_QWORD *)v4 + 87))
  {
    if (!-[OTAResistanceData isEqual:](baselineR2, "isEqual:"))
      goto LABEL_99;
  }
  rCFreq1 = self->_rCFreq1;
  if ((unint64_t)rCFreq1 | *((_QWORD *)v4 + 103))
  {
    if (!-[OTAResistanceData isEqual:](rCFreq1, "isEqual:"))
      goto LABEL_99;
  }
  rCFreq2 = self->_rCFreq2;
  if ((unint64_t)rCFreq2 | *((_QWORD *)v4 + 104))
  {
    if (!-[OTAResistanceData isEqual:](rCFreq2, "isEqual:"))
      goto LABEL_99;
  }
  rCFreq3 = self->_rCFreq3;
  if ((unint64_t)rCFreq3 | *((_QWORD *)v4 + 105))
  {
    if (!-[OTAResistanceData isEqual:](rCFreq3, "isEqual:"))
      goto LABEL_99;
  }
  if (!PBRepeatedFloatIsEqual())
    goto LABEL_99;
  if (!PBRepeatedFloatIsEqual())
    goto LABEL_99;
  if (!PBRepeatedFloatIsEqual())
    goto LABEL_99;
  if (!PBRepeatedFloatIsEqual())
    goto LABEL_99;
  if (!PBRepeatedFloatIsEqual())
    goto LABEL_99;
  if (!PBRepeatedFloatIsEqual())
    goto LABEL_99;
  if (!PBRepeatedFloatIsEqual())
    goto LABEL_99;
  baselineR0 = self->_baselineR0;
  if ((unint64_t)baselineR0 | *((_QWORD *)v4 + 85))
  {
    if (!-[OTAResistanceData isEqual:](baselineR0, "isEqual:"))
      goto LABEL_99;
  }
  bmuResistance = self->_bmuResistance;
  if ((unint64_t)bmuResistance | *((_QWORD *)v4 + 95))
  {
    if (!-[OTABMUResistance isEqual:](bmuResistance, "isEqual:"))
      goto LABEL_99;
  }
  if (self->_chemID != *((_DWORD *)v4 + 192))
    goto LABEL_99;
  if (!PBRepeatedFloatIsEqual())
    goto LABEL_99;
  baselineR3 = self->_baselineR3;
  if ((unint64_t)baselineR3 | *((_QWORD *)v4 + 88))
  {
    if (!-[OTAResistanceData isEqual:](baselineR3, "isEqual:"))
      goto LABEL_99;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 868) & 8) == 0 || self->_maxRdcRatio != *((float *)v4 + 195))
      goto LABEL_99;
  }
  else if ((*((_BYTE *)v4 + 868) & 8) != 0)
  {
LABEL_99:
    v24 = 0;
    goto LABEL_100;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 868) & 0x10) == 0 || self->_maxRdcRatioR2Extrap != *((float *)v4 + 196))
      goto LABEL_99;
  }
  else if ((*((_BYTE *)v4 + 868) & 0x10) != 0)
  {
    goto LABEL_99;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 868) & 1) == 0 || self->_baselineWRdc != *((float *)v4 + 188))
      goto LABEL_99;
  }
  else if ((*((_BYTE *)v4 + 868) & 1) != 0)
  {
    goto LABEL_99;
  }
  if (!PBRepeatedFloatIsEqual())
    goto LABEL_99;
  if (!PBRepeatedFloatIsEqual())
    goto LABEL_99;
  if (!PBRepeatedFloatIsEqual())
    goto LABEL_99;
  if (!PBRepeatedFloatIsEqual())
    goto LABEL_99;
  r3 = self->_r3;
  if ((unint64_t)r3 | *((_QWORD *)v4 + 102))
  {
    if (!-[OTAResistanceData isEqual:](r3, "isEqual:"))
      goto LABEL_99;
  }
  rCFreq4 = self->_rCFreq4;
  if ((unint64_t)rCFreq4 | *((_QWORD *)v4 + 106))
  {
    if (!-[OTAResistanceData isEqual:](rCFreq4, "isEqual:"))
      goto LABEL_99;
  }
  baselineR4 = self->_baselineR4;
  if ((unint64_t)baselineR4 | *((_QWORD *)v4 + 89))
  {
    if (!-[OTAResistanceData isEqual:](baselineR4, "isEqual:"))
      goto LABEL_99;
  }
  baselineRCFreq1 = self->_baselineRCFreq1;
  if ((unint64_t)baselineRCFreq1 | *((_QWORD *)v4 + 90))
  {
    if (!-[OTAResistanceData isEqual:](baselineRCFreq1, "isEqual:"))
      goto LABEL_99;
  }
  baselineRCFreq2 = self->_baselineRCFreq2;
  if ((unint64_t)baselineRCFreq2 | *((_QWORD *)v4 + 91))
  {
    if (!-[OTAResistanceData isEqual:](baselineRCFreq2, "isEqual:"))
      goto LABEL_99;
  }
  baselineRCFreq3 = self->_baselineRCFreq3;
  if ((unint64_t)baselineRCFreq3 | *((_QWORD *)v4 + 92))
  {
    if (!-[OTAResistanceData isEqual:](baselineRCFreq3, "isEqual:"))
      goto LABEL_99;
  }
  baselineRCFreq4 = self->_baselineRCFreq4;
  if ((unint64_t)baselineRCFreq4 | *((_QWORD *)v4 + 93))
  {
    if (!-[OTAResistanceData isEqual:](baselineRCFreq4, "isEqual:"))
      goto LABEL_99;
  }
  if (!PBRepeatedFloatIsEqual()
    || !PBRepeatedFloatIsEqual()
    || !PBRepeatedFloatIsEqual()
    || !PBRepeatedFloatIsEqual()
    || !PBRepeatedFloatIsEqual()
    || !PBRepeatedFloatIsEqual()
    || !PBRepeatedFloatIsEqual()
    || !PBRepeatedFloatIsEqual()
    || !PBRepeatedFloatIsEqual()
    || !PBRepeatedFloatIsEqual())
  {
    goto LABEL_99;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 868) & 2) == 0 || self->_mLBConfig != *((_DWORD *)v4 + 193))
      goto LABEL_99;
  }
  else if ((*((_BYTE *)v4 + 868) & 2) != 0)
  {
    goto LABEL_99;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 868) & 0x20) == 0 || self->_wRdcRatioThresh != *((float *)v4 + 216))
      goto LABEL_99;
  }
  else if ((*((_BYTE *)v4 + 868) & 0x20) != 0)
  {
    goto LABEL_99;
  }
  if (!PBRepeatedFloatIsEqual())
    goto LABEL_99;
  if (!PBRepeatedFloatIsEqual())
    goto LABEL_99;
  if (!PBRepeatedFloatIsEqual())
    goto LABEL_99;
  rdc = self->_rdc;
  if ((unint64_t)rdc | *((_QWORD *)v4 + 107))
  {
    if (!-[OTAResistanceData isEqual:](rdc, "isEqual:"))
      goto LABEL_99;
  }
  if (!PBRepeatedFloatIsEqual()
    || !PBRepeatedFloatIsEqual()
    || !PBRepeatedFloatIsEqual())
  {
    goto LABEL_99;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 868) & 4) == 0 || self->_maxRdcR25Ratio != *((float *)v4 + 194))
      goto LABEL_99;
    v24 = 1;
  }
  else
  {
    v24 = (*((_BYTE *)v4 + 868) & 4) == 0;
  }
LABEL_100:

  return v24;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  float maxRdcRatio;
  float v6;
  float v7;
  float v8;
  unint64_t v9;
  float maxRdcRatioR2Extrap;
  float v11;
  float v12;
  float v13;
  unint64_t v14;
  float baselineWRdc;
  float v16;
  float v17;
  float v18;
  unint64_t v19;
  float wRdcRatioThresh;
  float v21;
  float v22;
  float v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  float maxRdcR25Ratio;
  float v32;
  float v33;
  float v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unsigned int chemID;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;

  v81 = -[OTAResistanceData hash](self->_r0, "hash");
  v80 = -[OTAResistanceData hash](self->_r1, "hash");
  v79 = -[OTAResistanceData hash](self->_baselineR1, "hash");
  v78 = -[OTAResistanceData hash](self->_r2, "hash");
  v77 = -[OTAResistanceData hash](self->_baselineR2, "hash");
  v76 = -[OTAResistanceData hash](self->_rCFreq1, "hash");
  v75 = -[OTAResistanceData hash](self->_rCFreq2, "hash");
  v74 = -[OTAResistanceData hash](self->_rCFreq3, "hash");
  v73 = PBRepeatedFloatHash();
  v72 = PBRepeatedFloatHash();
  v71 = PBRepeatedFloatHash();
  v70 = PBRepeatedFloatHash();
  v69 = PBRepeatedFloatHash();
  v68 = PBRepeatedFloatHash();
  v67 = PBRepeatedFloatHash();
  v66 = -[OTAResistanceData hash](self->_baselineR0, "hash");
  v65 = -[OTABMUResistance hash](self->_bmuResistance, "hash");
  chemID = self->_chemID;
  v64 = PBRepeatedFloatHash();
  v63 = -[OTAResistanceData hash](self->_baselineR3, "hash");
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    maxRdcRatio = self->_maxRdcRatio;
    v6 = -maxRdcRatio;
    if (maxRdcRatio >= 0.0)
      v6 = self->_maxRdcRatio;
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
  if ((has & 0x10) != 0)
  {
    maxRdcRatioR2Extrap = self->_maxRdcRatioR2Extrap;
    v11 = -maxRdcRatioR2Extrap;
    if (maxRdcRatioR2Extrap >= 0.0)
      v11 = self->_maxRdcRatioR2Extrap;
    v12 = floorf(v11 + 0.5);
    v13 = (float)(v11 - v12) * 1.8447e19;
    v9 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabsf(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  v60 = v9;
  if ((has & 1) != 0)
  {
    baselineWRdc = self->_baselineWRdc;
    v16 = -baselineWRdc;
    if (baselineWRdc >= 0.0)
      v16 = self->_baselineWRdc;
    v17 = floorf(v16 + 0.5);
    v18 = (float)(v16 - v17) * 1.8447e19;
    v14 = 2654435761u * (unint64_t)fmodf(v17, 1.8447e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabsf(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  v59 = v14;
  v58 = PBRepeatedFloatHash();
  v57 = PBRepeatedFloatHash();
  v56 = PBRepeatedFloatHash();
  v55 = PBRepeatedFloatHash();
  v54 = -[OTAResistanceData hash](self->_r3, "hash");
  v53 = -[OTAResistanceData hash](self->_rCFreq4, "hash");
  v52 = -[OTAResistanceData hash](self->_baselineR4, "hash");
  v51 = -[OTAResistanceData hash](self->_baselineRCFreq1, "hash");
  v50 = -[OTAResistanceData hash](self->_baselineRCFreq2, "hash");
  v49 = -[OTAResistanceData hash](self->_baselineRCFreq3, "hash");
  v48 = -[OTAResistanceData hash](self->_baselineRCFreq4, "hash");
  v47 = PBRepeatedFloatHash();
  v46 = PBRepeatedFloatHash();
  v45 = PBRepeatedFloatHash();
  v44 = PBRepeatedFloatHash();
  v43 = PBRepeatedFloatHash();
  v42 = PBRepeatedFloatHash();
  v41 = PBRepeatedFloatHash();
  v40 = PBRepeatedFloatHash();
  v39 = PBRepeatedFloatHash();
  v38 = PBRepeatedFloatHash();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v37 = 2654435761 * self->_mLBConfig;
  else
    v37 = 0;
  v61 = v4;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    wRdcRatioThresh = self->_wRdcRatioThresh;
    v21 = -wRdcRatioThresh;
    if (wRdcRatioThresh >= 0.0)
      v21 = self->_wRdcRatioThresh;
    v22 = floorf(v21 + 0.5);
    v23 = (float)(v21 - v22) * 1.8447e19;
    v19 = 2654435761u * (unint64_t)fmodf(v22, 1.8447e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabsf(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  v36 = PBRepeatedFloatHash();
  v24 = PBRepeatedFloatHash();
  v25 = PBRepeatedFloatHash();
  v26 = -[OTAResistanceData hash](self->_rdc, "hash");
  v27 = PBRepeatedFloatHash();
  v28 = PBRepeatedFloatHash();
  v29 = PBRepeatedFloatHash();
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    maxRdcR25Ratio = self->_maxRdcR25Ratio;
    v32 = -maxRdcR25Ratio;
    if (maxRdcR25Ratio >= 0.0)
      v32 = self->_maxRdcR25Ratio;
    v33 = floorf(v32 + 0.5);
    v34 = (float)(v32 - v33) * 1.8447e19;
    v30 = 2654435761u * (unint64_t)fmodf(v33, 1.8447e19);
    if (v34 >= 0.0)
    {
      if (v34 > 0.0)
        v30 += (unint64_t)v34;
    }
    else
    {
      v30 -= (unint64_t)fabsf(v34);
    }
  }
  else
  {
    v30 = 0;
  }
  return v80 ^ v81 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ (2654435761 * chemID) ^ v64 ^ v63 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v19 ^ v36 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  OTAResistanceData *r0;
  uint64_t v6;
  OTAResistanceData *r1;
  uint64_t v8;
  OTAResistanceData *baselineR1;
  uint64_t v10;
  OTAResistanceData *r2;
  uint64_t v12;
  OTAResistanceData *baselineR2;
  uint64_t v14;
  OTAResistanceData *rCFreq1;
  uint64_t v16;
  OTAResistanceData *rCFreq2;
  uint64_t v18;
  OTAResistanceData *rCFreq3;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  uint64_t v33;
  uint64_t v34;
  uint64_t n;
  uint64_t v36;
  uint64_t v37;
  uint64_t ii;
  uint64_t v39;
  uint64_t v40;
  uint64_t jj;
  OTAResistanceData *baselineR0;
  id v43;
  uint64_t v44;
  OTABMUResistance *bmuResistance;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t kk;
  OTAResistanceData *baselineR3;
  id v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t mm;
  uint64_t v57;
  uint64_t v58;
  uint64_t nn;
  uint64_t v60;
  uint64_t v61;
  uint64_t i1;
  uint64_t v63;
  uint64_t v64;
  uint64_t i2;
  OTAResistanceData *r3;
  _QWORD *v67;
  uint64_t v68;
  OTAResistanceData *rCFreq4;
  uint64_t v70;
  OTAResistanceData *baselineR4;
  uint64_t v72;
  OTAResistanceData *baselineRCFreq1;
  uint64_t v74;
  OTAResistanceData *baselineRCFreq2;
  uint64_t v76;
  OTAResistanceData *baselineRCFreq3;
  uint64_t v78;
  OTAResistanceData *baselineRCFreq4;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t i3;
  uint64_t v84;
  uint64_t v85;
  uint64_t i4;
  uint64_t v87;
  uint64_t v88;
  uint64_t i5;
  uint64_t v90;
  uint64_t v91;
  uint64_t i6;
  uint64_t v93;
  uint64_t v94;
  uint64_t i7;
  uint64_t v96;
  uint64_t v97;
  uint64_t i8;
  uint64_t v99;
  uint64_t v100;
  uint64_t i9;
  uint64_t v102;
  uint64_t v103;
  uint64_t i10;
  uint64_t v105;
  uint64_t v106;
  uint64_t i11;
  uint64_t v108;
  uint64_t v109;
  uint64_t i12;
  char v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t i13;
  uint64_t v115;
  uint64_t v116;
  uint64_t i14;
  uint64_t v118;
  uint64_t v119;
  uint64_t i15;
  OTAResistanceData *rdc;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t i16;
  uint64_t v127;
  uint64_t v128;
  uint64_t i17;
  uint64_t v130;
  uint64_t v131;
  uint64_t i18;
  id v133;

  v4 = a3;
  r0 = self->_r0;
  v6 = v4[99];
  v133 = v4;
  if (r0)
  {
    if (!v6)
      goto LABEL_7;
    -[OTAResistanceData mergeFrom:](r0, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[OTAParamRC setR0:](self, "setR0:");
  }
  v4 = v133;
LABEL_7:
  r1 = self->_r1;
  v8 = v4[100];
  if (r1)
  {
    if (!v8)
      goto LABEL_13;
    -[OTAResistanceData mergeFrom:](r1, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[OTAParamRC setR1:](self, "setR1:");
  }
  v4 = v133;
LABEL_13:
  baselineR1 = self->_baselineR1;
  v10 = v4[86];
  if (baselineR1)
  {
    if (!v10)
      goto LABEL_19;
    -[OTAResistanceData mergeFrom:](baselineR1, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_19;
    -[OTAParamRC setBaselineR1:](self, "setBaselineR1:");
  }
  v4 = v133;
LABEL_19:
  r2 = self->_r2;
  v12 = v4[101];
  if (r2)
  {
    if (!v12)
      goto LABEL_25;
    -[OTAResistanceData mergeFrom:](r2, "mergeFrom:");
  }
  else
  {
    if (!v12)
      goto LABEL_25;
    -[OTAParamRC setR2:](self, "setR2:");
  }
  v4 = v133;
LABEL_25:
  baselineR2 = self->_baselineR2;
  v14 = v4[87];
  if (baselineR2)
  {
    if (!v14)
      goto LABEL_31;
    -[OTAResistanceData mergeFrom:](baselineR2, "mergeFrom:");
  }
  else
  {
    if (!v14)
      goto LABEL_31;
    -[OTAParamRC setBaselineR2:](self, "setBaselineR2:");
  }
  v4 = v133;
LABEL_31:
  rCFreq1 = self->_rCFreq1;
  v16 = v4[103];
  if (rCFreq1)
  {
    if (!v16)
      goto LABEL_37;
    -[OTAResistanceData mergeFrom:](rCFreq1, "mergeFrom:");
  }
  else
  {
    if (!v16)
      goto LABEL_37;
    -[OTAParamRC setRCFreq1:](self, "setRCFreq1:");
  }
  v4 = v133;
LABEL_37:
  rCFreq2 = self->_rCFreq2;
  v18 = v4[104];
  if (rCFreq2)
  {
    if (!v18)
      goto LABEL_43;
    -[OTAResistanceData mergeFrom:](rCFreq2, "mergeFrom:");
  }
  else
  {
    if (!v18)
      goto LABEL_43;
    -[OTAParamRC setRCFreq2:](self, "setRCFreq2:");
  }
  v4 = v133;
LABEL_43:
  rCFreq3 = self->_rCFreq3;
  v20 = v4[105];
  if (rCFreq3)
  {
    if (!v20)
      goto LABEL_49;
    -[OTAResistanceData mergeFrom:](rCFreq3, "mergeFrom:");
  }
  else
  {
    if (!v20)
      goto LABEL_49;
    -[OTAParamRC setRCFreq3:](self, "setRCFreq3:");
  }
  v4 = v133;
LABEL_49:
  v21 = objc_msgSend(v4, "agingCoeffForR0sCount");
  if (v21)
  {
    v22 = v21;
    for (i = 0; i != v22; ++i)
    {
      objc_msgSend(v133, "agingCoeffForR0AtIndex:", i);
      -[OTAParamRC addAgingCoeffForR0:](self, "addAgingCoeffForR0:");
    }
  }
  v24 = objc_msgSend(v133, "agingCoeffForR0TemperatureCoeffsCount");
  if (v24)
  {
    v25 = v24;
    for (j = 0; j != v25; ++j)
    {
      objc_msgSend(v133, "agingCoeffForR0TemperatureCoeffAtIndex:", j);
      -[OTAParamRC addAgingCoeffForR0TemperatureCoeff:](self, "addAgingCoeffForR0TemperatureCoeff:");
    }
  }
  v27 = objc_msgSend(v133, "agingCoeffForR1sCount");
  if (v27)
  {
    v28 = v27;
    for (k = 0; k != v28; ++k)
    {
      objc_msgSend(v133, "agingCoeffForR1AtIndex:", k);
      -[OTAParamRC addAgingCoeffForR1:](self, "addAgingCoeffForR1:");
    }
  }
  v30 = objc_msgSend(v133, "agingCoeffForR1TemperatureCoeffsCount");
  if (v30)
  {
    v31 = v30;
    for (m = 0; m != v31; ++m)
    {
      objc_msgSend(v133, "agingCoeffForR1TemperatureCoeffAtIndex:", m);
      -[OTAParamRC addAgingCoeffForR1TemperatureCoeff:](self, "addAgingCoeffForR1TemperatureCoeff:");
    }
  }
  v33 = objc_msgSend(v133, "agingCoeffForR2sCount");
  if (v33)
  {
    v34 = v33;
    for (n = 0; n != v34; ++n)
    {
      objc_msgSend(v133, "agingCoeffForR2AtIndex:", n);
      -[OTAParamRC addAgingCoeffForR2:](self, "addAgingCoeffForR2:");
    }
  }
  v36 = objc_msgSend(v133, "agingCoeffForR2TemperatureCoeffsCount");
  if (v36)
  {
    v37 = v36;
    for (ii = 0; ii != v37; ++ii)
    {
      objc_msgSend(v133, "agingCoeffForR2TemperatureCoeffAtIndex:", ii);
      -[OTAParamRC addAgingCoeffForR2TemperatureCoeff:](self, "addAgingCoeffForR2TemperatureCoeff:");
    }
  }
  v39 = objc_msgSend(v133, "baselineRdcsCount");
  if (v39)
  {
    v40 = v39;
    for (jj = 0; jj != v40; ++jj)
    {
      objc_msgSend(v133, "baselineRdcAtIndex:", jj);
      -[OTAParamRC addBaselineRdc:](self, "addBaselineRdc:");
    }
  }
  baselineR0 = self->_baselineR0;
  v43 = v133;
  v44 = *((_QWORD *)v133 + 85);
  if (baselineR0)
  {
    if (!v44)
      goto LABEL_76;
    -[OTAResistanceData mergeFrom:](baselineR0, "mergeFrom:");
  }
  else
  {
    if (!v44)
      goto LABEL_76;
    -[OTAParamRC setBaselineR0:](self, "setBaselineR0:");
  }
  v43 = v133;
LABEL_76:
  bmuResistance = self->_bmuResistance;
  v46 = *((_QWORD *)v43 + 95);
  if (bmuResistance)
  {
    if (!v46)
      goto LABEL_82;
    -[OTABMUResistance mergeFrom:](bmuResistance, "mergeFrom:");
  }
  else
  {
    if (!v46)
      goto LABEL_82;
    -[OTAParamRC setBmuResistance:](self, "setBmuResistance:");
  }
  v43 = v133;
LABEL_82:
  self->_chemID = *((_DWORD *)v43 + 192);
  v47 = objc_msgSend(v43, "gridOCVsCount");
  if (v47)
  {
    v48 = v47;
    for (kk = 0; kk != v48; ++kk)
    {
      objc_msgSend(v133, "gridOCVAtIndex:", kk);
      -[OTAParamRC addGridOCV:](self, "addGridOCV:");
    }
  }
  baselineR3 = self->_baselineR3;
  v51 = v133;
  v52 = *((_QWORD *)v133 + 88);
  if (baselineR3)
  {
    if (!v52)
      goto LABEL_91;
    -[OTAResistanceData mergeFrom:](baselineR3, "mergeFrom:");
  }
  else
  {
    if (!v52)
      goto LABEL_91;
    -[OTAParamRC setBaselineR3:](self, "setBaselineR3:");
  }
  v51 = v133;
LABEL_91:
  v53 = *((_BYTE *)v51 + 868);
  if ((v53 & 8) != 0)
  {
    self->_maxRdcRatio = *((float *)v51 + 195);
    *(_BYTE *)&self->_has |= 8u;
    v53 = *((_BYTE *)v51 + 868);
    if ((v53 & 0x10) == 0)
    {
LABEL_93:
      if ((v53 & 1) == 0)
        goto LABEL_95;
      goto LABEL_94;
    }
  }
  else if ((*((_BYTE *)v51 + 868) & 0x10) == 0)
  {
    goto LABEL_93;
  }
  self->_maxRdcRatioR2Extrap = *((float *)v51 + 196);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((*((_BYTE *)v51 + 868) & 1) != 0)
  {
LABEL_94:
    self->_baselineWRdc = *((float *)v51 + 188);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_95:
  v54 = objc_msgSend(v51, "slopeForR0ExtrapsCount");
  if (v54)
  {
    v55 = v54;
    for (mm = 0; mm != v55; ++mm)
    {
      objc_msgSend(v133, "slopeForR0ExtrapAtIndex:", mm);
      -[OTAParamRC addSlopeForR0Extrap:](self, "addSlopeForR0Extrap:");
    }
  }
  v57 = objc_msgSend(v133, "slopeForR1ExtrapsCount");
  if (v57)
  {
    v58 = v57;
    for (nn = 0; nn != v58; ++nn)
    {
      objc_msgSend(v133, "slopeForR1ExtrapAtIndex:", nn);
      -[OTAParamRC addSlopeForR1Extrap:](self, "addSlopeForR1Extrap:");
    }
  }
  v60 = objc_msgSend(v133, "slopeForR2ExtrapsCount");
  if (v60)
  {
    v61 = v60;
    for (i1 = 0; i1 != v61; ++i1)
    {
      objc_msgSend(v133, "slopeForR2ExtrapAtIndex:", i1);
      -[OTAParamRC addSlopeForR2Extrap:](self, "addSlopeForR2Extrap:");
    }
  }
  v63 = objc_msgSend(v133, "slopeForR3ExtrapsCount");
  if (v63)
  {
    v64 = v63;
    for (i2 = 0; i2 != v64; ++i2)
    {
      objc_msgSend(v133, "slopeForR3ExtrapAtIndex:", i2);
      -[OTAParamRC addSlopeForR3Extrap:](self, "addSlopeForR3Extrap:");
    }
  }
  r3 = self->_r3;
  v67 = v133;
  v68 = *((_QWORD *)v133 + 102);
  if (r3)
  {
    if (!v68)
      goto LABEL_116;
    -[OTAResistanceData mergeFrom:](r3, "mergeFrom:");
  }
  else
  {
    if (!v68)
      goto LABEL_116;
    -[OTAParamRC setR3:](self, "setR3:");
  }
  v67 = v133;
LABEL_116:
  rCFreq4 = self->_rCFreq4;
  v70 = v67[106];
  if (rCFreq4)
  {
    if (!v70)
      goto LABEL_122;
    -[OTAResistanceData mergeFrom:](rCFreq4, "mergeFrom:");
  }
  else
  {
    if (!v70)
      goto LABEL_122;
    -[OTAParamRC setRCFreq4:](self, "setRCFreq4:");
  }
  v67 = v133;
LABEL_122:
  baselineR4 = self->_baselineR4;
  v72 = v67[89];
  if (baselineR4)
  {
    if (!v72)
      goto LABEL_128;
    -[OTAResistanceData mergeFrom:](baselineR4, "mergeFrom:");
  }
  else
  {
    if (!v72)
      goto LABEL_128;
    -[OTAParamRC setBaselineR4:](self, "setBaselineR4:");
  }
  v67 = v133;
LABEL_128:
  baselineRCFreq1 = self->_baselineRCFreq1;
  v74 = v67[90];
  if (baselineRCFreq1)
  {
    if (!v74)
      goto LABEL_134;
    -[OTAResistanceData mergeFrom:](baselineRCFreq1, "mergeFrom:");
  }
  else
  {
    if (!v74)
      goto LABEL_134;
    -[OTAParamRC setBaselineRCFreq1:](self, "setBaselineRCFreq1:");
  }
  v67 = v133;
LABEL_134:
  baselineRCFreq2 = self->_baselineRCFreq2;
  v76 = v67[91];
  if (baselineRCFreq2)
  {
    if (!v76)
      goto LABEL_140;
    -[OTAResistanceData mergeFrom:](baselineRCFreq2, "mergeFrom:");
  }
  else
  {
    if (!v76)
      goto LABEL_140;
    -[OTAParamRC setBaselineRCFreq2:](self, "setBaselineRCFreq2:");
  }
  v67 = v133;
LABEL_140:
  baselineRCFreq3 = self->_baselineRCFreq3;
  v78 = v67[92];
  if (baselineRCFreq3)
  {
    if (!v78)
      goto LABEL_146;
    -[OTAResistanceData mergeFrom:](baselineRCFreq3, "mergeFrom:");
  }
  else
  {
    if (!v78)
      goto LABEL_146;
    -[OTAParamRC setBaselineRCFreq3:](self, "setBaselineRCFreq3:");
  }
  v67 = v133;
LABEL_146:
  baselineRCFreq4 = self->_baselineRCFreq4;
  v80 = v67[93];
  if (baselineRCFreq4)
  {
    if (!v80)
      goto LABEL_152;
    -[OTAResistanceData mergeFrom:](baselineRCFreq4, "mergeFrom:");
  }
  else
  {
    if (!v80)
      goto LABEL_152;
    -[OTAParamRC setBaselineRCFreq4:](self, "setBaselineRCFreq4:");
  }
  v67 = v133;
LABEL_152:
  v81 = objc_msgSend(v67, "agingCoeffForR3sCount");
  if (v81)
  {
    v82 = v81;
    for (i3 = 0; i3 != v82; ++i3)
    {
      objc_msgSend(v133, "agingCoeffForR3AtIndex:", i3);
      -[OTAParamRC addAgingCoeffForR3:](self, "addAgingCoeffForR3:");
    }
  }
  v84 = objc_msgSend(v133, "agingCoeffForR3TemperatureCoeffsCount");
  if (v84)
  {
    v85 = v84;
    for (i4 = 0; i4 != v85; ++i4)
    {
      objc_msgSend(v133, "agingCoeffForR3TemperatureCoeffAtIndex:", i4);
      -[OTAParamRC addAgingCoeffForR3TemperatureCoeff:](self, "addAgingCoeffForR3TemperatureCoeff:");
    }
  }
  v87 = objc_msgSend(v133, "agingCoeffForRCFreq1sCount");
  if (v87)
  {
    v88 = v87;
    for (i5 = 0; i5 != v88; ++i5)
    {
      objc_msgSend(v133, "agingCoeffForRCFreq1AtIndex:", i5);
      -[OTAParamRC addAgingCoeffForRCFreq1:](self, "addAgingCoeffForRCFreq1:");
    }
  }
  v90 = objc_msgSend(v133, "agingCoeffForRCFreq2sCount");
  if (v90)
  {
    v91 = v90;
    for (i6 = 0; i6 != v91; ++i6)
    {
      objc_msgSend(v133, "agingCoeffForRCFreq2AtIndex:", i6);
      -[OTAParamRC addAgingCoeffForRCFreq2:](self, "addAgingCoeffForRCFreq2:");
    }
  }
  v93 = objc_msgSend(v133, "agingCoeffForRCFreq3sCount");
  if (v93)
  {
    v94 = v93;
    for (i7 = 0; i7 != v94; ++i7)
    {
      objc_msgSend(v133, "agingCoeffForRCFreq3AtIndex:", i7);
      -[OTAParamRC addAgingCoeffForRCFreq3:](self, "addAgingCoeffForRCFreq3:");
    }
  }
  v96 = objc_msgSend(v133, "agingCoeffForRCFreq4sCount");
  if (v96)
  {
    v97 = v96;
    for (i8 = 0; i8 != v97; ++i8)
    {
      objc_msgSend(v133, "agingCoeffForRCFreq4AtIndex:", i8);
      -[OTAParamRC addAgingCoeffForRCFreq4:](self, "addAgingCoeffForRCFreq4:");
    }
  }
  v99 = objc_msgSend(v133, "agingCoeffForRCFreq1TemperatureCoeffsCount");
  if (v99)
  {
    v100 = v99;
    for (i9 = 0; i9 != v100; ++i9)
    {
      objc_msgSend(v133, "agingCoeffForRCFreq1TemperatureCoeffAtIndex:", i9);
      -[OTAParamRC addAgingCoeffForRCFreq1TemperatureCoeff:](self, "addAgingCoeffForRCFreq1TemperatureCoeff:");
    }
  }
  v102 = objc_msgSend(v133, "agingCoeffForRCFreq2TemperatureCoeffsCount");
  if (v102)
  {
    v103 = v102;
    for (i10 = 0; i10 != v103; ++i10)
    {
      objc_msgSend(v133, "agingCoeffForRCFreq2TemperatureCoeffAtIndex:", i10);
      -[OTAParamRC addAgingCoeffForRCFreq2TemperatureCoeff:](self, "addAgingCoeffForRCFreq2TemperatureCoeff:");
    }
  }
  v105 = objc_msgSend(v133, "agingCoeffForRCFreq3TemperatureCoeffsCount");
  if (v105)
  {
    v106 = v105;
    for (i11 = 0; i11 != v106; ++i11)
    {
      objc_msgSend(v133, "agingCoeffForRCFreq3TemperatureCoeffAtIndex:", i11);
      -[OTAParamRC addAgingCoeffForRCFreq3TemperatureCoeff:](self, "addAgingCoeffForRCFreq3TemperatureCoeff:");
    }
  }
  v108 = objc_msgSend(v133, "agingCoeffForRCFreq4TemperatureCoeffsCount");
  if (v108)
  {
    v109 = v108;
    for (i12 = 0; i12 != v109; ++i12)
    {
      objc_msgSend(v133, "agingCoeffForRCFreq4TemperatureCoeffAtIndex:", i12);
      -[OTAParamRC addAgingCoeffForRCFreq4TemperatureCoeff:](self, "addAgingCoeffForRCFreq4TemperatureCoeff:");
    }
  }
  v111 = *((_BYTE *)v133 + 868);
  if ((v111 & 2) != 0)
  {
    self->_mLBConfig = *((_DWORD *)v133 + 193);
    *(_BYTE *)&self->_has |= 2u;
    v111 = *((_BYTE *)v133 + 868);
  }
  if ((v111 & 0x20) != 0)
  {
    self->_wRdcRatioThresh = *((float *)v133 + 216);
    *(_BYTE *)&self->_has |= 0x20u;
  }
  v112 = objc_msgSend(v133, "gridWRdcRatiosCount");
  if (v112)
  {
    v113 = v112;
    for (i13 = 0; i13 != v113; ++i13)
    {
      objc_msgSend(v133, "gridWRdcRatioAtIndex:", i13);
      -[OTAParamRC addGridWRdcRatio:](self, "addGridWRdcRatio:");
    }
  }
  v115 = objc_msgSend(v133, "coeffSOCsCount");
  if (v115)
  {
    v116 = v115;
    for (i14 = 0; i14 != v116; ++i14)
    {
      objc_msgSend(v133, "coeffSOCAtIndex:", i14);
      -[OTAParamRC addCoeffSOC:](self, "addCoeffSOC:");
    }
  }
  v118 = objc_msgSend(v133, "coeffVsCount");
  if (v118)
  {
    v119 = v118;
    for (i15 = 0; i15 != v119; ++i15)
    {
      objc_msgSend(v133, "coeffVAtIndex:", i15);
      -[OTAParamRC addCoeffV:](self, "addCoeffV:");
    }
  }
  rdc = self->_rdc;
  v122 = v133;
  v123 = *((_QWORD *)v133 + 107);
  if (rdc)
  {
    if (!v123)
      goto LABEL_201;
    -[OTAResistanceData mergeFrom:](rdc, "mergeFrom:");
  }
  else
  {
    if (!v123)
      goto LABEL_201;
    -[OTAParamRC setRdc:](self, "setRdc:");
  }
  v122 = v133;
LABEL_201:
  v124 = objc_msgSend(v122, "agingCoeffForRdcsCount");
  if (v124)
  {
    v125 = v124;
    for (i16 = 0; i16 != v125; ++i16)
    {
      objc_msgSend(v133, "agingCoeffForRdcAtIndex:", i16);
      -[OTAParamRC addAgingCoeffForRdc:](self, "addAgingCoeffForRdc:");
    }
  }
  v127 = objc_msgSend(v133, "agingCoeffForRdcTemperatureCoeffsCount");
  if (v127)
  {
    v128 = v127;
    for (i17 = 0; i17 != v128; ++i17)
    {
      objc_msgSend(v133, "agingCoeffForRdcTemperatureCoeffAtIndex:", i17);
      -[OTAParamRC addAgingCoeffForRdcTemperatureCoeff:](self, "addAgingCoeffForRdcTemperatureCoeff:");
    }
  }
  v130 = objc_msgSend(v133, "qmaxsCount");
  if (v130)
  {
    v131 = v130;
    for (i18 = 0; i18 != v131; ++i18)
    {
      objc_msgSend(v133, "qmaxAtIndex:", i18);
      -[OTAParamRC addQmax:](self, "addQmax:");
    }
  }
  if ((*((_BYTE *)v133 + 868) & 4) != 0)
  {
    self->_maxRdcR25Ratio = *((float *)v133 + 194);
    *(_BYTE *)&self->_has |= 4u;
  }

}

- (OTAResistanceData)r0
{
  return self->_r0;
}

- (void)setR0:(id)a3
{
  objc_storeStrong((id *)&self->_r0, a3);
}

- (OTAResistanceData)r1
{
  return self->_r1;
}

- (void)setR1:(id)a3
{
  objc_storeStrong((id *)&self->_r1, a3);
}

- (OTAResistanceData)baselineR1
{
  return self->_baselineR1;
}

- (void)setBaselineR1:(id)a3
{
  objc_storeStrong((id *)&self->_baselineR1, a3);
}

- (OTAResistanceData)r2
{
  return self->_r2;
}

- (void)setR2:(id)a3
{
  objc_storeStrong((id *)&self->_r2, a3);
}

- (OTAResistanceData)baselineR2
{
  return self->_baselineR2;
}

- (void)setBaselineR2:(id)a3
{
  objc_storeStrong((id *)&self->_baselineR2, a3);
}

- (OTAResistanceData)rCFreq1
{
  return self->_rCFreq1;
}

- (void)setRCFreq1:(id)a3
{
  objc_storeStrong((id *)&self->_rCFreq1, a3);
}

- (OTAResistanceData)rCFreq2
{
  return self->_rCFreq2;
}

- (void)setRCFreq2:(id)a3
{
  objc_storeStrong((id *)&self->_rCFreq2, a3);
}

- (OTAResistanceData)rCFreq3
{
  return self->_rCFreq3;
}

- (void)setRCFreq3:(id)a3
{
  objc_storeStrong((id *)&self->_rCFreq3, a3);
}

- (OTAResistanceData)baselineR0
{
  return self->_baselineR0;
}

- (void)setBaselineR0:(id)a3
{
  objc_storeStrong((id *)&self->_baselineR0, a3);
}

- (OTABMUResistance)bmuResistance
{
  return self->_bmuResistance;
}

- (void)setBmuResistance:(id)a3
{
  objc_storeStrong((id *)&self->_bmuResistance, a3);
}

- (unsigned)chemID
{
  return self->_chemID;
}

- (void)setChemID:(unsigned int)a3
{
  self->_chemID = a3;
}

- (OTAResistanceData)baselineR3
{
  return self->_baselineR3;
}

- (void)setBaselineR3:(id)a3
{
  objc_storeStrong((id *)&self->_baselineR3, a3);
}

- (float)maxRdcRatio
{
  return self->_maxRdcRatio;
}

- (float)maxRdcRatioR2Extrap
{
  return self->_maxRdcRatioR2Extrap;
}

- (float)baselineWRdc
{
  return self->_baselineWRdc;
}

- (OTAResistanceData)r3
{
  return self->_r3;
}

- (void)setR3:(id)a3
{
  objc_storeStrong((id *)&self->_r3, a3);
}

- (OTAResistanceData)rCFreq4
{
  return self->_rCFreq4;
}

- (void)setRCFreq4:(id)a3
{
  objc_storeStrong((id *)&self->_rCFreq4, a3);
}

- (OTAResistanceData)baselineR4
{
  return self->_baselineR4;
}

- (void)setBaselineR4:(id)a3
{
  objc_storeStrong((id *)&self->_baselineR4, a3);
}

- (OTAResistanceData)baselineRCFreq1
{
  return self->_baselineRCFreq1;
}

- (void)setBaselineRCFreq1:(id)a3
{
  objc_storeStrong((id *)&self->_baselineRCFreq1, a3);
}

- (OTAResistanceData)baselineRCFreq2
{
  return self->_baselineRCFreq2;
}

- (void)setBaselineRCFreq2:(id)a3
{
  objc_storeStrong((id *)&self->_baselineRCFreq2, a3);
}

- (OTAResistanceData)baselineRCFreq3
{
  return self->_baselineRCFreq3;
}

- (void)setBaselineRCFreq3:(id)a3
{
  objc_storeStrong((id *)&self->_baselineRCFreq3, a3);
}

- (OTAResistanceData)baselineRCFreq4
{
  return self->_baselineRCFreq4;
}

- (void)setBaselineRCFreq4:(id)a3
{
  objc_storeStrong((id *)&self->_baselineRCFreq4, a3);
}

- (float)wRdcRatioThresh
{
  return self->_wRdcRatioThresh;
}

- (OTAResistanceData)rdc
{
  return self->_rdc;
}

- (void)setRdc:(id)a3
{
  objc_storeStrong((id *)&self->_rdc, a3);
}

- (float)maxRdcR25Ratio
{
  return self->_maxRdcR25Ratio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rdc, 0);
  objc_storeStrong((id *)&self->_rCFreq4, 0);
  objc_storeStrong((id *)&self->_rCFreq3, 0);
  objc_storeStrong((id *)&self->_rCFreq2, 0);
  objc_storeStrong((id *)&self->_rCFreq1, 0);
  objc_storeStrong((id *)&self->_r3, 0);
  objc_storeStrong((id *)&self->_r2, 0);
  objc_storeStrong((id *)&self->_r1, 0);
  objc_storeStrong((id *)&self->_r0, 0);
  objc_storeStrong((id *)&self->_bmuResistance, 0);
  objc_storeStrong((id *)&self->_baselineRCFreq4, 0);
  objc_storeStrong((id *)&self->_baselineRCFreq3, 0);
  objc_storeStrong((id *)&self->_baselineRCFreq2, 0);
  objc_storeStrong((id *)&self->_baselineRCFreq1, 0);
  objc_storeStrong((id *)&self->_baselineR4, 0);
  objc_storeStrong((id *)&self->_baselineR3, 0);
  objc_storeStrong((id *)&self->_baselineR2, 0);
  objc_storeStrong((id *)&self->_baselineR1, 0);
  objc_storeStrong((id *)&self->_baselineR0, 0);
}

@end
