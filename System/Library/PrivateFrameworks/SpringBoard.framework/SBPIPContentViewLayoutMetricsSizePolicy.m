@implementation SBPIPContentViewLayoutMetricsSizePolicy

- (SBPIPContentViewLayoutMetricsSizePolicy)initWithSizePreferencesForLandscape:(id)a3 portrait:(id)a4 square:(id)a5
{
  id v10;
  id v11;
  id v12;
  void *v13;
  SBPIPContentViewLayoutMetricsSizePolicy *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v24;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (!v10 && !v11 && !v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPContentViewLayoutMetrics.m"), 102, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("landscapeSizePref != nil || portraitSizePref != nil || squareSizePref != nil"));

  }
  v25.receiver = self;
  v25.super_class = (Class)SBPIPContentViewLayoutMetricsSizePolicy;
  v14 = -[SBPIPContentViewLayoutMetricsSizePolicy init](&v25, sel_init);
  if (v14)
  {
    +[SBPIPSettingsDomain rootSettings](SBPIPSettingsDomain, "rootSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sizingSettings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "landcapeAspectRatioClosedIntervalLowerBound");
    v14->_landscapeAspectRatioInterval.minimum = v17;
    objc_msgSend(v16, "landcapeAspectRatioClosedIntervalUpperBound");
    v14->_landscapeAspectRatioInterval.maximum = v18;
    objc_msgSend(v16, "squareAspectRatioClosedIntervalLowerBound");
    v14->_squareAspectRatioInterval.minimum = v19;
    objc_msgSend(v16, "squareAspectRatioClosedIntervalUpperBound");
    v14->_squareAspectRatioInterval.maximum = v20;
    objc_msgSend(v16, "portraitAspectRatioClosedIntervalLowerBound");
    v14->_portraitAspectRatioInterval.minimum = v21;
    objc_msgSend(v16, "portraitAspectRatioClosedIntervalUpperBound");
    v14->_portraitAspectRatioInterval.maximum = v22;
    objc_storeStrong((id *)&v14->_landscapeSizePref, a3);
    objc_storeStrong((id *)&v14->_portraitSizePref, a4);
    objc_storeStrong((id *)&v14->_squareSizePref, a5);

  }
  return v14;
}

- (id)sizePreferencesForAspectRatio:(double)a3
{
  SBPIPContentViewLayoutSizePreferences **p_landscapeSizePref;
  id *p_portraitSizePref;
  SBPIPContentViewLayoutSizePreferences **p_squareSizePref;
  id v7;

  p_landscapeSizePref = &self->_landscapeSizePref;
  if (self->_landscapeSizePref
    && BSFloatGreaterThanOrEqualToFloat()
    && (BSFloatLessThanOrEqualToFloat() & 1) != 0)
  {
    goto LABEL_25;
  }
  p_portraitSizePref = (id *)&self->_portraitSizePref;
  if (self->_portraitSizePref
    && BSFloatGreaterThanOrEqualToFloat()
    && (BSFloatLessThanOrEqualToFloat() & 1) != 0)
  {
    p_landscapeSizePref = &self->_portraitSizePref;
LABEL_25:
    v7 = *p_landscapeSizePref;
    return v7;
  }
  p_squareSizePref = &self->_squareSizePref;
  if (self->_squareSizePref
    && BSFloatGreaterThanOrEqualToFloat()
    && (BSFloatLessThanOrEqualToFloat() & 1) != 0)
  {
    p_landscapeSizePref = &self->_squareSizePref;
    goto LABEL_25;
  }
  v7 = *p_landscapeSizePref;
  if (*p_landscapeSizePref)
  {
    if (self->_portraitSizePref)
    {
      if (!BSFloatLessThanOrEqualToFloat())
        p_landscapeSizePref = &self->_portraitSizePref;
      goto LABEL_25;
    }
    if (*p_squareSizePref)
    {
      if (!BSFloatLessThanOrEqualToFloat())
        p_landscapeSizePref = &self->_squareSizePref;
      goto LABEL_25;
    }
  }
  else
  {
    v7 = *p_squareSizePref;
    if (*p_portraitSizePref)
    {
      if (!v7)
      {
        v7 = *p_portraitSizePref;
        return v7;
      }
      objc_msgSend(*p_portraitSizePref, "shortSideMinimumSize");
      if (BSFloatLessThanOrEqualToFloat())
        p_landscapeSizePref = &self->_portraitSizePref;
      else
        p_landscapeSizePref = &self->_squareSizePref;
      goto LABEL_25;
    }
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_squareSizePref, 0);
  objc_storeStrong((id *)&self->_portraitSizePref, 0);
  objc_storeStrong((id *)&self->_landscapeSizePref, 0);
}

@end
