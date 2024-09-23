@implementation PLModelMigratorRebuildProgressFraction

- (PLModelMigratorRebuildProgressFraction)initWithLegacyRecoveryEnabled:(BOOL)a3
{
  PLModelMigratorRebuildProgressFraction *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLModelMigratorRebuildProgressFraction;
  result = -[PLModelMigratorRebuildProgressFraction init](&v5, sel_init);
  if (result)
    result->_legacyRecoveryEnabled = a3;
  return result;
}

- (BOOL)isLegacyRecoveryEnabled
{
  return self->_legacyRecoveryEnabled;
}

- (float)progressFractionForType:(unsigned __int8)a3
{
  float v4;
  BOOL v5;
  float v6;
  float v7;

  if (a3 == 2)
  {
    v4 = 0.25;
    if (-[PLModelMigratorRebuildProgressFraction isRebuildEnabled](self, "isRebuildEnabled"))
      return v4;
    v5 = !-[PLModelMigratorRebuildProgressFraction isLegacyRecoveryEnabled](self, "isLegacyRecoveryEnabled");
    v6 = 1.0;
    goto LABEL_8;
  }
  v4 = 0.0;
  if (a3 == 1)
  {
    if (!-[PLModelMigratorRebuildProgressFraction isLegacyRecoveryEnabled](self, "isLegacyRecoveryEnabled"))
      return v4;
    v5 = !-[PLModelMigratorRebuildProgressFraction isRebuildEnabled](self, "isRebuildEnabled");
    v6 = 0.5;
    v7 = 0.25;
    goto LABEL_11;
  }
  if (!a3 && -[PLModelMigratorRebuildProgressFraction isRebuildEnabled](self, "isRebuildEnabled"))
  {
    v5 = !-[PLModelMigratorRebuildProgressFraction isLegacyRecoveryEnabled](self, "isLegacyRecoveryEnabled");
    v6 = 0.75;
LABEL_8:
    v7 = 0.5;
LABEL_11:
    if (v5)
      return v6;
    else
      return v7;
  }
  return v4;
}

- (BOOL)isRebuildEnabled
{
  return self->_rebuildEnabled;
}

- (void)setRebuildEnabled:(BOOL)a3
{
  self->_rebuildEnabled = a3;
}

@end
