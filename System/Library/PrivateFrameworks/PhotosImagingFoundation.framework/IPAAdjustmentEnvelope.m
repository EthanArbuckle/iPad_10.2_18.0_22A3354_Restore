@implementation IPAAdjustmentEnvelope

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  id *v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (id *)v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 8), self->_adjustmentStack);
    objc_storeStrong(v5 + 2, self->_originator);
    objc_storeStrong(v5 + 3, self->_format);
    objc_storeStrong(v5 + 4, self->_formatVersion);
  }
  return v5;
}

- (BOOL)containsPhotoAdjustments
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)containsVideoAdjustments
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (id)debugDescription
{
  void *v3;
  NSString *formatVersion;
  IPAAdjustmentStack *adjustmentStack;
  void *v6;
  void *v7;
  __int128 v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9 = *(_OWORD *)&self->_originator;
  formatVersion = self->_formatVersion;
  adjustmentStack = self->_adjustmentStack;
  -[IPAAdjustmentStack adjustments](adjustmentStack, "adjustments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<IPAAdjEnv:%p originator=%@ format=%@ formatVersion=%@ adjustments(%p).count=%lu>"), self, v9, formatVersion, adjustmentStack, objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (IPAAdjustmentStack)adjustmentStack
{
  return self->_adjustmentStack;
}

- (void)setAdjustmentStack:(id)a3
{
  objc_storeStrong((id *)&self->_adjustmentStack, a3);
}

- (NSString)originator
{
  return self->_originator;
}

- (void)setOriginator:(id)a3
{
  objc_storeStrong((id *)&self->_originator, a3);
}

- (NSString)format
{
  return self->_format;
}

- (void)setFormat:(id)a3
{
  objc_storeStrong((id *)&self->_format, a3);
}

- (NSString)formatVersion
{
  return self->_formatVersion;
}

- (void)setFormatVersion:(id)a3
{
  objc_storeStrong((id *)&self->_formatVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatVersion, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_originator, 0);
  objc_storeStrong((id *)&self->_adjustmentStack, 0);
}

@end
