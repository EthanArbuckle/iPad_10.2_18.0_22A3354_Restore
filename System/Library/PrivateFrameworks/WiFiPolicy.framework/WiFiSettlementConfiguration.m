@implementation WiFiSettlementConfiguration

- (unint64_t)maxScansWithoutMatchForUnsettlement
{
  return self->_maxScansWithoutMatchForUnsettlement;
}

- (double)lowConfidenceSettlementTime
{
  return self->_lowConfidenceSettlementTime;
}

- (double)highConfidenceSettlementTime
{
  return self->_highConfidenceSettlementTime;
}

- (WiFiSettlementConfiguration)init
{
  WiFiSettlementConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WiFiSettlementConfiguration;
  result = -[WiFiSettlementConfiguration init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_maxScansWithoutMatchForUnsettlement = xmmword_1CC50E8F0;
    *(_OWORD *)&result->_lowConfidenceSettlementTime = xmmword_1CC50E900;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ : %p "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("maxNetworks: %lu "), -[WiFiSettlementConfiguration maxNetworksForSettlement](self, "maxNetworksForSettlement"));
  objc_msgSend(v6, "appendFormat:", CFSTR("maxScans: %lu "), -[WiFiSettlementConfiguration maxScansWithoutMatchForUnsettlement](self, "maxScansWithoutMatchForUnsettlement"));
  -[WiFiSettlementConfiguration lowConfidenceSettlementTime](self, "lowConfidenceSettlementTime");
  objc_msgSend(v6, "appendFormat:", CFSTR("low: %f "), v7);
  -[WiFiSettlementConfiguration highConfidenceSettlementTime](self, "highConfidenceSettlementTime");
  objc_msgSend(v6, "appendFormat:", CFSTR("high: %f"), v8);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (void)setMaxScansWithoutMatchForUnsettlement:(unint64_t)a3
{
  self->_maxScansWithoutMatchForUnsettlement = a3;
}

- (unint64_t)maxNetworksForSettlement
{
  return self->_maxNetworksForSettlement;
}

- (void)setMaxNetworksForSettlement:(unint64_t)a3
{
  self->_maxNetworksForSettlement = a3;
}

- (void)setLowConfidenceSettlementTime:(double)a3
{
  self->_lowConfidenceSettlementTime = a3;
}

- (void)setHighConfidenceSettlementTime:(double)a3
{
  self->_highConfidenceSettlementTime = a3;
}

@end
