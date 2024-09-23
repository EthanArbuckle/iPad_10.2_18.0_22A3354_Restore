@implementation AntBlockPowerLimitGnssImdBandPolicy

- (AntBlockPowerLimitGnssImdBandPolicy)init
{
  AntBlockPowerLimitGnssImdBandPolicy *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AntBlockPowerLimitGnssImdBandPolicy;
  result = -[AntBlockPowerLimitGnssImdBandPolicy init](&v3, "init");
  result->_mEnable = 0;
  *(_QWORD *)&result->_mCellularAntBitmap = &_mh_execute_header;
  result->_mCellularTxPowerCap = 0;
  return result;
}

- (void)setParameterEnable:(BOOL)a3 CellularAntBitmap:(unsigned int)a4 MitigationType:(unsigned int)a5 CellularTxPowerCap:(int)a6
{
  self->_mEnable = a3;
  self->_mCellularAntBitmap = a4;
  self->_mMitigationType = a5;
  self->_mCellularTxPowerCap = a6;
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

@end
