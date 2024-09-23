@implementation PEAdjustmentDataCacheKey

- (PEAdjustmentDataCacheKey)initWithAsset:(id)a3 originalAdjustmentData:(BOOL)a4
{
  id v5;
  PEAdjustmentDataCacheKey *v6;
  uint64_t v7;
  NSString *localIdentifier;
  void *v9;
  double v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PEAdjustmentDataCacheKey;
  v5 = a3;
  v6 = -[PEAdjustmentDataCacheKey init](&v12, sel_init);
  objc_msgSend(v5, "localIdentifier", v12.receiver, v12.super_class);
  v7 = objc_claimAutoreleasedReturnValue();
  localIdentifier = v6->_localIdentifier;
  v6->_localIdentifier = (NSString *)v7;

  objc_msgSend(v5, "adjustmentTimestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v6->_adjustmentDate = v10;

  v6->_originalAdjustmentData = a4;
  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_localIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unsigned __int8 *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = (unsigned __int8 *)v5;
    v7 = *((double *)v5 + 2) == self->_adjustmentDate
      && objc_msgSend(*((id *)v5 + 1), "isEqual:", self->_localIdentifier)
      && v6[24] == self->_originalAdjustmentData;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localIdentifier, 0);
}

@end
