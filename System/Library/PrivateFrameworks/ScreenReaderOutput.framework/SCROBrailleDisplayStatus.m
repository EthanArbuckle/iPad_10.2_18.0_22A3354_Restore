@implementation SCROBrailleDisplayStatus

- (NSData)realData
{
  return self->_realData;
}

- (void)setRealData:(id)a3
{
  objc_storeStrong((id *)&self->_realData, a3);
}

- (NSData)virtualData
{
  return self->_virtualData;
}

- (void)setVirtualData:(id)a3
{
  objc_storeStrong((id *)&self->_virtualData, a3);
}

- (NSData)aggregatedData
{
  return self->_aggregatedData;
}

- (void)setAggregatedData:(id)a3
{
  objc_storeStrong((id *)&self->_aggregatedData, a3);
}

- (int)virtualAlignment
{
  return self->_virtualAlignment;
}

- (void)setVirtualAlignment:(int)a3
{
  self->_virtualAlignment = a3;
}

- (int64_t)masterStatusCellIndex
{
  return self->_masterStatusCellIndex;
}

- (void)setMasterStatusCellIndex:(int64_t)a3
{
  self->_masterStatusCellIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregatedData, 0);
  objc_storeStrong((id *)&self->_virtualData, 0);
  objc_storeStrong((id *)&self->_realData, 0);
}

@end
