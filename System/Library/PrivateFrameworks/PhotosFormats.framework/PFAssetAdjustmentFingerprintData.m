@implementation PFAssetAdjustmentFingerprintData

- (NSString)adjustmentType
{
  return self->_adjustmentType;
}

- (void)setAdjustmentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)adjustmentCompoundVersion
{
  return self->_adjustmentCompoundVersion;
}

- (void)setAdjustmentCompoundVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)adjustmentCreatorCode
{
  return self->_adjustmentCreatorCode;
}

- (void)setAdjustmentCreatorCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)adjustmentSourceType
{
  return self->_adjustmentSourceType;
}

- (void)setAdjustmentSourceType:(unint64_t)a3
{
  self->_adjustmentSourceType = a3;
}

- (NSData)simpleAdjustmentData
{
  return self->_simpleAdjustmentData;
}

- (void)setSimpleAdjustmentData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSData)baseImage
{
  return self->_baseImage;
}

- (void)setBaseImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)baseImageFingerprint
{
  return self->_baseImageFingerprint;
}

- (void)setBaseImageFingerprint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSData)largeAdjustmentData
{
  return self->_largeAdjustmentData;
}

- (void)setLargeAdjustmentData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)largeAdjustmentDataFingerprint
{
  return self->_largeAdjustmentDataFingerprint;
}

- (void)setLargeAdjustmentDataFingerprint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSData)secondaryAdjustmentData
{
  return self->_secondaryAdjustmentData;
}

- (void)setSecondaryAdjustmentData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryAdjustmentData, 0);
  objc_storeStrong((id *)&self->_largeAdjustmentDataFingerprint, 0);
  objc_storeStrong((id *)&self->_largeAdjustmentData, 0);
  objc_storeStrong((id *)&self->_baseImageFingerprint, 0);
  objc_storeStrong((id *)&self->_baseImage, 0);
  objc_storeStrong((id *)&self->_simpleAdjustmentData, 0);
  objc_storeStrong((id *)&self->_adjustmentCreatorCode, 0);
  objc_storeStrong((id *)&self->_adjustmentCompoundVersion, 0);
  objc_storeStrong((id *)&self->_adjustmentType, 0);
}

@end
