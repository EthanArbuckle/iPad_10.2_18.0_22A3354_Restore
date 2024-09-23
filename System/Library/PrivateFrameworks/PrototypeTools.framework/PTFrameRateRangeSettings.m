@implementation PTFrameRateRangeSettings

- (void)setFrameRateRange:(CAFrameRateRange)a3 highFrameRateReason:(unsigned int)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)&a4;
  -[PTFrameRateRangeSettings setFrameRateRange:](self, "setFrameRateRange:", *(double *)&a3.minimum, *(double *)&a3.maximum, *(double *)&a3.preferred);
  -[PTFrameRateRangeSettings setHighFrameRateReason:](self, "setHighFrameRateReason:", v4);
}

- (void)setPreferred:(int)a3
{
  self->_preferred = a3;
}

- (void)setFrameRateRange:(CAFrameRateRange)a3
{
  float preferred;
  float maximum;
  float minimum;
  unint64_t v7;
  _BOOL4 IsEqualToRange;
  unint64_t preset;
  CAFrameRateRange v10;
  CAFrameRateRange v11;
  CAFrameRateRange v12;
  CAFrameRateRange v13;

  preferred = a3.preferred;
  maximum = a3.maximum;
  minimum = a3.minimum;
  if (!CAFrameRateRangeIsEqualToRange(*MEMORY[0x1E0CD23C0], a3))
  {
    v10 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    v12.minimum = minimum;
    v12.maximum = maximum;
    v12.preferred = preferred;
    if (CAFrameRateRangeIsEqualToRange(v10, v12))
    {
      if (self->_preset == 1)
        goto LABEL_14;
      -[PTFrameRateRangeSettings willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("preset"));
      v7 = 1;
    }
    else
    {
      v11 = CAFrameRateRangeMake(80.0, 120.0, 80.0);
      v13.minimum = minimum;
      v13.maximum = maximum;
      v13.preferred = preferred;
      IsEqualToRange = CAFrameRateRangeIsEqualToRange(v11, v13);
      preset = self->_preset;
      if (IsEqualToRange)
      {
        if (preset == 2)
          goto LABEL_14;
        -[PTFrameRateRangeSettings willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("preset"));
        v7 = 2;
      }
      else
      {
        if (preset == 3)
          goto LABEL_14;
        -[PTFrameRateRangeSettings willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("preset"));
        v7 = 3;
      }
    }
    self->_preset = v7;
    goto LABEL_13;
  }
  if (self->_preset)
  {
    -[PTFrameRateRangeSettings willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("preset"));
    self->_preset = 0;
LABEL_13:
    -[PTFrameRateRangeSettings didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("preset"));
  }
LABEL_14:
  -[PTFrameRateRangeSettings setMinimum:](self, "setMinimum:", (int)minimum);
  -[PTFrameRateRangeSettings setMaximum:](self, "setMaximum:", (int)maximum);
  -[PTFrameRateRangeSettings setPreferred:](self, "setPreferred:", (int)preferred);
}

- (void)setMinimum:(int)a3
{
  self->_minimum = a3;
}

- (void)setMaximum:(int)a3
{
  self->_maximum = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if ((-[PTFrameRateRangeSettings isEqual:](self, "isEqual:", v4) & 1) == 0)
  {
    *(_DWORD *)(v4 + 52) = self->_minimum;
    *(_DWORD *)(v4 + 56) = self->_maximum;
    *(_DWORD *)(v4 + 60) = self->_preferred;
    *(_QWORD *)(v4 + 64) = self->_preset;
    *(_WORD *)(v4 + 48) = self->_reasonComponent;
    *(_WORD *)(v4 + 50) = self->_reason;
  }
  return (id)v4;
}

- (void)setDefaultValues
{
  float v2;
  float v3;

  v2 = *(float *)(MEMORY[0x1E0CD23C0] + 4);
  v3 = *(float *)(MEMORY[0x1E0CD23C0] + 8);
  self->_minimum = (int)*MEMORY[0x1E0CD23C0];
  self->_maximum = (int)v2;
  self->_preferred = (int)v3;
  self->_preset = 0;
  self->_reasonComponent = 0;
  self->_reason = 0;
}

- (unsigned)highFrameRateReason
{
  return self->_reason | (self->_reasonComponent << 16);
}

- (void)setReason:(unsigned __int16)a3
{
  self->_reason = a3;
}

- (CAFrameRateRange)frameRateRange
{
  return CAFrameRateRangeMake((float)self->_minimum, (float)self->_maximum, (float)self->_preferred);
}

- (void)setHighFrameRateReason:(unsigned int)a3
{
  unsigned __int16 v3;

  v3 = a3;
  -[PTFrameRateRangeSettings setReasonComponent:](self, "setReasonComponent:", HIWORD(a3));
  -[PTFrameRateRangeSettings setReason:](self, "setReason:", v3);
}

- (void)setReasonComponent:(unsigned __int16)a3
{
  self->_reasonComponent = a3;
}

+ (id)settingsControllerModule
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[9];

  v31[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF.preset == 3"));
  v2 = objc_claimAutoreleasedReturnValue();
  +[PTRowAction actionWithHandler:](PTRowAction, "actionWithHandler:", &__block_literal_global);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PTButtonRow rowWithTitle:action:](PTButtonRow, "rowWithTitle:action:", CFSTR("Validate min<=pref<=max OR min<=max, pref=unspecified"), v3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  +[PTRow rowWithTitle:valueKeyPath:](PTChoiceRow, "rowWithTitle:valueKeyPath:", CFSTR("Preset"), CFSTR("preset"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "possibleValues:titles:", &unk_1E7062230, &unk_1E7062218);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v28;
  +[PTRow rowWithTitle:valueKeyPath:](PTChoiceRow, "rowWithTitle:valueKeyPath:", CFSTR("minimum"), CFSTR("minimum"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "possibleValues:titles:", &unk_1E7062260, &unk_1E7062248);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "condition:", v2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v25;
  +[PTRow rowWithTitle:valueKeyPath:](PTChoiceRow, "rowWithTitle:valueKeyPath:", CFSTR("maximum"), CFSTR("maximum"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "possibleValues:titles:", &unk_1E7062260, &unk_1E7062248);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "condition:", v2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v22;
  +[PTRow rowWithTitle:valueKeyPath:](PTChoiceRow, "rowWithTitle:valueKeyPath:", CFSTR("preferred"), CFSTR("preferred"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "possibleValues:titles:", &unk_1E7062260, &unk_1E7062248);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v2;
  v21 = (void *)v2;
  objc_msgSend(v4, "condition:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v6;
  +[PTRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("reason component"), CFSTR("reasonComponent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "between:and:", 0.0, 65535.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "precision:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v9;
  +[PTRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("reason"), CFSTR("reason"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "between:and:", 0.0, 65535.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "precision:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31[5] = v12;
  objc_msgSend(v20, "condition:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31[6] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[PTModule sectionWithRows:](PTModule, "sectionWithRows:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PTModule moduleWithTitle:contents:](PTModule, "moduleWithTitle:contents:", CFSTR("Frame Rate Range"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

uint64_t __52__PTFrameRateRangeSettings_settingsControllerModule__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;

  objc_msgSend(a3, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "validate");

  return 1;
}

- (void)setPreset:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  float v8;

  -[PTFrameRateRangeSettings willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("preset"));
  self->_preset = a3;
  -[PTFrameRateRangeSettings didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("preset"));
  if (a3 == 2)
  {
    v8 = 80.0;
LABEL_7:
    *(CAFrameRateRange *)&v5 = CAFrameRateRangeMake(80.0, 120.0, v8);
    goto LABEL_8;
  }
  if (a3 == 1)
  {
    v8 = 120.0;
    goto LABEL_7;
  }
  if (a3)
    return;
  LODWORD(v5) = *MEMORY[0x1E0CD23C0];
  LODWORD(v6) = *(_DWORD *)(MEMORY[0x1E0CD23C0] + 4);
  LODWORD(v7) = *(_DWORD *)(MEMORY[0x1E0CD23C0] + 8);
LABEL_8:
  -[PTFrameRateRangeSettings setFrameRateRange:](self, "setFrameRateRange:", v5, v6, v7);
}

+ (BOOL)ignoresKey:(id)a3
{
  id v3;
  char v4;
  char v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("frameRateRange"));
  v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("highFrameRateReason"));

  return v4 | v5;
}

- (id)drillDownSummary
{
  __CFString *v3;

  if (-[PTFrameRateRangeSettings preset](self, "preset"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%d, %d, %d)"), self->_minimum, self->_maximum, self->_preferred);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("(CAFrameRateRangeDefault)");
  }
  return v3;
}

- (void)validate
{
  double v2;
  double v3;
  double v4;
  int minimum;
  int preferred;
  int maximum;
  BOOL v8;
  char v9;
  BOOL v10;

  minimum = self->_minimum;
  preferred = self->_preferred;
  maximum = self->_maximum;
  if (preferred)
    v8 = 0;
  else
    v8 = minimum <= maximum;
  v9 = v8;
  v10 = preferred <= maximum && minimum <= preferred;
  if (!v10 && (v9 & 1) == 0)
  {
    LODWORD(v2) = *MEMORY[0x1E0CD23C0];
    LODWORD(v3) = *(_DWORD *)(MEMORY[0x1E0CD23C0] + 4);
    LODWORD(v4) = *(_DWORD *)(MEMORY[0x1E0CD23C0] + 8);
    -[PTFrameRateRangeSettings setFrameRateRange:](self, "setFrameRateRange:", v2, v3, v4);
  }
}

- (void)setFrameRateRange:(CAFrameRateRange)a3 reasonComponent:(unsigned __int16)a4 reason:(unsigned __int16)a5
{
  -[PTFrameRateRangeSettings setFrameRateRange:highFrameRateReason:](self, "setFrameRateRange:highFrameRateReason:", a5 | (a4 << 16), *(double *)&a3.minimum, *(double *)&a3.maximum, *(double *)&a3.preferred);
}

- (NSString)description
{
  return (NSString *)-[PTFrameRateRangeSettings descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PTFrameRateRangeSettings succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[PTFrameRateRangeSettings descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  PTFrameRateRangeSettings *v11;

  -[PTFrameRateRangeSettings succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__PTFrameRateRangeSettings_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E7058150;
  v5 = v4;
  v10 = v5;
  v11 = self;
  v6 = (id)objc_msgSend(v5, "modifyBody:", v9);
  v7 = v5;

  return v7;
}

id __66__PTFrameRateRangeSettings_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "drillDownSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("frameRateRange"));

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "highFrameRateReason"), CFSTR("highFrameRateReason"));
}

- (int)minimum
{
  return self->_minimum;
}

- (int)maximum
{
  return self->_maximum;
}

- (int)preferred
{
  return self->_preferred;
}

- (unint64_t)preset
{
  return self->_preset;
}

- (unsigned)reasonComponent
{
  return self->_reasonComponent;
}

- (unsigned)reason
{
  return self->_reason;
}

@end
