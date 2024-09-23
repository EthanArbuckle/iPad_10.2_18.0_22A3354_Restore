@implementation PLDisplayAODStats

- (NSNumber)awakeCount
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAwakeCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSNumber)mediaCount
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMediaCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSNumber)flipbookCount
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFlipbookCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSNumber)flipbookDelay
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFlipbookDelay:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSNumber)mediaScanout
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMediaScanout:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSNumber)ambientCount
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAmbientCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSNumber)prcRepeatCoun
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPrcRepeatCoun:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSNumber)pdcRepeatCoun
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPdcRepeatCoun:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSNumber)llmCount
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLlmCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSNumber)aplSum
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAplSum:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSNumber)aplCount
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAplCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aplCount, 0);
  objc_storeStrong((id *)&self->_aplSum, 0);
  objc_storeStrong((id *)&self->_llmCount, 0);
  objc_storeStrong((id *)&self->_pdcRepeatCoun, 0);
  objc_storeStrong((id *)&self->_prcRepeatCoun, 0);
  objc_storeStrong((id *)&self->_ambientCount, 0);
  objc_storeStrong((id *)&self->_mediaScanout, 0);
  objc_storeStrong((id *)&self->_flipbookDelay, 0);
  objc_storeStrong((id *)&self->_flipbookCount, 0);
  objc_storeStrong((id *)&self->_mediaCount, 0);
  objc_storeStrong((id *)&self->_awakeCount, 0);
}

@end
