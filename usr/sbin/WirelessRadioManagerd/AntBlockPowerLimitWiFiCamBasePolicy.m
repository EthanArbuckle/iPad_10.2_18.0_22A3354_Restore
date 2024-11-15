@implementation AntBlockPowerLimitWiFiCamBasePolicy

- (AntBlockPowerLimitWiFiCamBasePolicy)init
{
  AntBlockPowerLimitWiFiCamBasePolicy *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AntBlockPowerLimitWiFiCamBasePolicy;
  result = -[AntBlockPowerLimitWiFiCamBasePolicy init](&v3, "init");
  result->_mEnable = 0;
  return result;
}

- (void)setParameterEnable:(BOOL)a3 CellularAntBitmap:(unsigned int)a4 MitigationType:(unsigned int)a5 CellularTxPowerCap:(int)a6 CoexTech:(unsigned int)a7 CellularBand:(unsigned int)a8 CellFreq:(unsigned int)a9 CellBW:(unsigned int)a10
{
  self->_mEnable = a3;
  self->_mCellularAntBitmap = a4;
  self->_mMitigationType = a5;
  self->_mCellularTxPowerCap = a6;
  self->_mCellularCoexTech = a7;
  self->_mCellularBand = a8;
  self->_mCellularFrequencyKHz = a9;
  self->_mCellularBandwidthKHz = a10;
}

- (void)setParameterConditionId:(unsigned int)a3
{
  self->_mConditionId = a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("CNV Ant blocking policy: setParameterConditionId = %u"), *(_QWORD *)&a3);
}

- (void)setParameterUsbRate:(unsigned int)a3
{
  self->_mUsbRate = a3;
}

- (BOOL)mEnable
{
  return self->_mEnable;
}

- (void)setMEnable:(BOOL)a3
{
  self->_mEnable = a3;
}

- (unsigned)mCellularAntBitmap
{
  return self->_mCellularAntBitmap;
}

- (void)setMCellularAntBitmap:(unsigned int)a3
{
  self->_mCellularAntBitmap = a3;
}

- (unsigned)mMitigationType
{
  return self->_mMitigationType;
}

- (void)setMMitigationType:(unsigned int)a3
{
  self->_mMitigationType = a3;
}

- (int)mCellularTxPowerCap
{
  return self->_mCellularTxPowerCap;
}

- (void)setMCellularTxPowerCap:(int)a3
{
  self->_mCellularTxPowerCap = a3;
}

- (unsigned)mCellularCoexTech
{
  return self->_mCellularCoexTech;
}

- (void)setMCellularCoexTech:(unsigned int)a3
{
  self->_mCellularCoexTech = a3;
}

- (unsigned)mCellularBand
{
  return self->_mCellularBand;
}

- (void)setMCellularBand:(unsigned int)a3
{
  self->_mCellularBand = a3;
}

- (unsigned)mCellularFrequencyKHz
{
  return self->_mCellularFrequencyKHz;
}

- (void)setMCellularFrequencyKHz:(unsigned int)a3
{
  self->_mCellularFrequencyKHz = a3;
}

- (unsigned)mCellularBandwidthKHz
{
  return self->_mCellularBandwidthKHz;
}

- (void)setMCellularBandwidthKHz:(unsigned int)a3
{
  self->_mCellularBandwidthKHz = a3;
}

- (unsigned)mConditionId
{
  return self->_mConditionId;
}

- (void)setMConditionId:(unsigned int)a3
{
  self->_mConditionId = a3;
}

- (unsigned)mUsbRate
{
  return self->_mUsbRate;
}

- (void)setMUsbRate:(unsigned int)a3
{
  self->_mUsbRate = a3;
}

@end
