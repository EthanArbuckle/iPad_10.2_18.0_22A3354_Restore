@implementation CellularThroughputPredictionInput

- (CellularThroughputPredictionInput)initWithMaxOfActualLowBandwidth_d:(double)a3 cellSinr:(double)a4 cellNrRSRQ:(double)a5 cellLteRSRQ:(double)a6 cellNrRSRP:(double)a7 lqmScorecellular:(double)a8 cellChannelBW:(double)a9 cellNrSNR:(double)a10 cellRsrp:(double)a11 ratType:(double)a12 cellEstimatedBW:(double)a13 cellNsaEnabled:(double)a14 cellBandInfo:(double)a15 pActualLowBandwidth:(double)a16 NRType:(double)a17
{
  CellularThroughputPredictionInput *result;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)CellularThroughputPredictionInput;
  result = -[CellularThroughputPredictionInput init](&v26, "init");
  if (result)
  {
    result->_maxOfActualLowBandwidth_d = a3;
    result->_cellSinr = a4;
    result->_cellNrRSRQ = a5;
    result->_cellLteRSRQ = a6;
    result->_cellNrRSRP = a7;
    result->_lqmScorecellular = a8;
    result->_cellChannelBW = a9;
    result->_cellNrSNR = a10;
    result->_cellRsrp = a11;
    result->_ratType = a12;
    result->_cellEstimatedBW = a13;
    result->_cellNsaEnabled = a14;
    result->_cellBandInfo = a15;
    result->_pActualLowBandwidth = a16;
    result->_NRType = a17;
  }
  return result;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &off_100241E50);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("maxOfActualLowBandwidth_d")) & 1) != 0)
  {
    v5 = 8;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("cellSinr")) & 1) != 0)
  {
    v5 = 16;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("cellNrRSRQ")) & 1) != 0)
  {
    v5 = 24;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("cellLteRSRQ")) & 1) != 0)
  {
    v5 = 32;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("cellNrRSRP")) & 1) != 0)
  {
    v5 = 40;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("lqmScorecellular")) & 1) != 0)
  {
    v5 = 48;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("cellChannelBW")) & 1) != 0)
  {
    v5 = 56;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("cellNrSNR")) & 1) != 0)
  {
    v5 = 64;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("cellRsrp")) & 1) != 0)
  {
    v5 = 72;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("ratType")) & 1) != 0)
  {
    v5 = 80;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("cellEstimatedBW")) & 1) != 0)
  {
    v5 = 88;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("cellNsaEnabled")) & 1) != 0)
  {
    v5 = 96;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("cellBandInfo")) & 1) != 0)
  {
    v5 = 104;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("pActualLowBandwidth")) & 1) != 0)
  {
    v5 = 112;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("NRType")))
    {
      v7 = 0;
      goto LABEL_32;
    }
    v5 = 120;
  }
  v6 = objc_msgSend(sub_100097210(), "featureValueWithDouble:", *(double *)((char *)&self->super.isa + v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
LABEL_32:

  return v7;
}

- (double)maxOfActualLowBandwidth_d
{
  return self->_maxOfActualLowBandwidth_d;
}

- (void)setMaxOfActualLowBandwidth_d:(double)a3
{
  self->_maxOfActualLowBandwidth_d = a3;
}

- (double)cellSinr
{
  return self->_cellSinr;
}

- (void)setCellSinr:(double)a3
{
  self->_cellSinr = a3;
}

- (double)cellNrRSRQ
{
  return self->_cellNrRSRQ;
}

- (void)setCellNrRSRQ:(double)a3
{
  self->_cellNrRSRQ = a3;
}

- (double)cellLteRSRQ
{
  return self->_cellLteRSRQ;
}

- (void)setCellLteRSRQ:(double)a3
{
  self->_cellLteRSRQ = a3;
}

- (double)cellNrRSRP
{
  return self->_cellNrRSRP;
}

- (void)setCellNrRSRP:(double)a3
{
  self->_cellNrRSRP = a3;
}

- (double)lqmScorecellular
{
  return self->_lqmScorecellular;
}

- (void)setLqmScorecellular:(double)a3
{
  self->_lqmScorecellular = a3;
}

- (double)cellChannelBW
{
  return self->_cellChannelBW;
}

- (void)setCellChannelBW:(double)a3
{
  self->_cellChannelBW = a3;
}

- (double)cellNrSNR
{
  return self->_cellNrSNR;
}

- (void)setCellNrSNR:(double)a3
{
  self->_cellNrSNR = a3;
}

- (double)cellRsrp
{
  return self->_cellRsrp;
}

- (void)setCellRsrp:(double)a3
{
  self->_cellRsrp = a3;
}

- (double)ratType
{
  return self->_ratType;
}

- (void)setRatType:(double)a3
{
  self->_ratType = a3;
}

- (double)cellEstimatedBW
{
  return self->_cellEstimatedBW;
}

- (void)setCellEstimatedBW:(double)a3
{
  self->_cellEstimatedBW = a3;
}

- (double)cellNsaEnabled
{
  return self->_cellNsaEnabled;
}

- (void)setCellNsaEnabled:(double)a3
{
  self->_cellNsaEnabled = a3;
}

- (double)cellBandInfo
{
  return self->_cellBandInfo;
}

- (void)setCellBandInfo:(double)a3
{
  self->_cellBandInfo = a3;
}

- (double)pActualLowBandwidth
{
  return self->_pActualLowBandwidth;
}

- (void)setPActualLowBandwidth:(double)a3
{
  self->_pActualLowBandwidth = a3;
}

- (double)NRType
{
  return self->_NRType;
}

- (void)setNRType:(double)a3
{
  self->_NRType = a3;
}

@end
