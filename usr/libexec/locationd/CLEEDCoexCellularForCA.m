@implementation CLEEDCoexCellularForCA

- (CLEEDCoexCellularForCA)initWithCoexMetricDict:(id)a3
{
  CLEEDCoexCellularForCA *v4;
  CLEEDCoexCellularForCA *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLEEDCoexCellularForCA;
  v4 = -[CLEEDCoexCellularForCA init](&v9, "init");
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      v4->_cellularRAT = objc_msgSend(objc_msgSend(a3, "valueForKey:", CFSTR("cellularRAT")), "intValue");
      v5->_cellularBand = (int)objc_msgSend(objc_msgSend(a3, "valueForKey:", CFSTR("cellularBand")), "intValue");
      v5->_minCellularRSRP = (int)objc_msgSend(objc_msgSend(a3, "valueForKey:", CFSTR("minCellularRSRP")), "intValue");
      v6 = (int)objc_msgSend(objc_msgSend(a3, "valueForKey:", CFSTR("maxCellularRSRP")), "intValue");
      v7 = 16;
    }
    else
    {
      *(_OWORD *)&v4->_maxCellularRSRP = xmmword_101C07710;
      v6 = -1;
      v7 = 32;
    }
    *(Class *)((char *)&v5->super.isa + v7) = (Class)v6;
  }
  return v5;
}

- (int64_t)maxCellularRSRP
{
  return self->_maxCellularRSRP;
}

- (void)setMaxCellularRSRP:(int64_t)a3
{
  self->_maxCellularRSRP = a3;
}

- (int64_t)minCellularRSRP
{
  return self->_minCellularRSRP;
}

- (void)setMinCellularRSRP:(int64_t)a3
{
  self->_minCellularRSRP = a3;
}

- (int64_t)cellularBand
{
  return self->_cellularBand;
}

- (void)setCellularBand:(int64_t)a3
{
  self->_cellularBand = a3;
}

- (int)cellularRAT
{
  return self->_cellularRAT;
}

- (void)setCellularRAT:(int)a3
{
  self->_cellularRAT = a3;
}

@end
