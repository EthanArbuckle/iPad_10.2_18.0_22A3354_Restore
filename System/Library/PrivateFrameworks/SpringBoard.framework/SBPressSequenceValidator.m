@implementation SBPressSequenceValidator

- (SBPressSequenceValidator)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPressSequenceValidator.m"), 53, CFSTR("Use initWithSettings:"));

  return -[SBPressSequenceValidator initWithSettings:](self, "initWithSettings:", 0);
}

- (SBPressSequenceValidator)initWithSettings:(id)a3
{
  id v6;
  SBPressSequenceValidator *v7;
  SBPressSequenceValidator *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPressSequenceValidator.m"), 58, CFSTR("SBPressSequenceValidator must be given non nil settings"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SBPressSequenceValidator;
  v7 = -[SBPressSequenceValidator init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_settings, a3);

  return v8;
}

- (BOOL)pressEventIsValidInSequence:(id)a3 endingDownEvent:(BOOL)a4 duration:(double)a5
{
  _BOOL4 v6;
  id v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v15;
  double v16;
  NSObject *v17;
  const char *v18;
  double v19;
  double v20;
  double v22;
  double v23;
  BOOL v24;
  void *v26;
  int v27;
  double v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v6 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = objc_msgSend(v9, "count");
  v11 = v10;
  if (v6)
  {
    -[SBPressSequenceValidator _pressDownBoundsForDesiredIndex:sequence:](self, "_pressDownBoundsForDesiredIndex:sequence:", v10, v9);
    if (v12 <= a5 && v13 >= a5)
    {
LABEL_18:
      v24 = 1;
      goto LABEL_19;
    }
    v15 = v12;
    v16 = v13;
    SBLogButtonsCombo();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v27 = 134218496;
      v28 = a5;
      v29 = 2048;
      v30 = v15;
      v31 = 2048;
      v32 = v16;
      v18 = "down press duration:%g out of bounds (%g - %g)";
LABEL_21:
      _os_log_debug_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEBUG, v18, (uint8_t *)&v27, 0x20u);
    }
  }
  else
  {
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPressSequenceValidator.m"), 79, CFSTR("SBPressSequence asked to evaluate an up event with no down event present in the sequence"));

    }
    -[SBPressSequenceValidator _pressUpBoundsForDesiredIndex:sequence:](self, "_pressUpBoundsForDesiredIndex:sequence:", objc_msgSend(v9, "count", v11) - 1, v9);
    if (v19 <= a5 && v20 >= a5)
      goto LABEL_18;
    v22 = v19;
    v23 = v20;
    SBLogButtonsCombo();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v27 = 134218496;
      v28 = a5;
      v29 = 2048;
      v30 = v22;
      v31 = 2048;
      v32 = v23;
      v18 = "up press duration:%g out of bounds (%g - %g)";
      goto LABEL_21;
    }
  }

  v24 = 0;
LABEL_19:

  return v24;
}

- (double)timeUntilNextPressEventIsInValidInSequence:(id)a3 lastPressEventInSequenceIsDown:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  double v8;
  double v9;

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "count");
  if (v4)
    -[SBPressSequenceValidator _pressUpBoundsForDesiredIndex:sequence:](self, "_pressUpBoundsForDesiredIndex:sequence:", v7 - 1, v6);
  else
    -[SBPressSequenceValidator _pressDownBoundsForDesiredIndex:sequence:](self, "_pressDownBoundsForDesiredIndex:sequence:", v7, v6);
  v9 = v8;

  return v9;
}

- (_SBPressSequenceValidatorBounds)_pressDownBoundsForDesiredIndex:(unint64_t)a3 sequence:(id)a4
{
  id v6;
  int64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t i;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;
  _SBPressSequenceValidatorBounds result;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = -[SBPressSequenceValidator _modeForDesiredIndex:isDownEvent:](self, "_modeForDesiredIndex:isDownEvent:", a3, 1);
  if (-[SBPressSequenceSettings indexOfPressDownToUseForVarianceAndGrowth](self->_settings, "indexOfPressDownToUseForVarianceAndGrowth") >= a3)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndex:", -[SBPressSequenceSettings indexOfPressDownToUseForVarianceAndGrowth](self->_settings, "indexOfPressDownToUseForVarianceAndGrowth"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v7 == 2)
  {
    objc_msgSend(v8, "durationDown");
    v13 = v12;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v14 = v6;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v30;
      v18 = v13;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v30 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "durationDown", (_QWORD)v29);
          if (v18 >= v20)
            v18 = v20;
          if (v13 < v20)
            v13 = v20;
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v16);
    }
    else
    {
      v18 = v13;
    }

    -[SBPressSequenceSettings pressDownVariance](self->_settings, "pressDownVariance");
    v9 = v18 - v25;
    goto LABEL_24;
  }
  if (v7 == 1)
  {
    objc_msgSend(v8, "durationDown");
    v22 = v21;
    -[SBPressSequenceSettings pressDownVariance](self->_settings, "pressDownVariance");
    v9 = v22 - v23;
    objc_msgSend(v8, "durationDown");
    v13 = v24;
LABEL_24:
    -[SBPressSequenceSettings pressDownVariance](self->_settings, "pressDownVariance", (_QWORD)v29);
    v11 = v13 + v26;
    goto LABEL_25;
  }
  v9 = 0.0;
  if (v7)
  {
    v11 = 0.0;
  }
  else
  {
    -[SBPressSequenceSettings maxDefaultPressDownDuration](self->_settings, "maxDefaultPressDownDuration");
    v11 = v10;
  }
LABEL_25:

  v27 = v9;
  v28 = v11;
  result.var1 = v28;
  result.var0 = v27;
  return result;
}

- (_SBPressSequenceValidatorBounds)_pressUpBoundsForDesiredIndex:(unint64_t)a3 sequence:(id)a4
{
  id v6;
  int64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t i;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;
  _SBPressSequenceValidatorBounds result;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = -[SBPressSequenceValidator _modeForDesiredIndex:isDownEvent:](self, "_modeForDesiredIndex:isDownEvent:", a3, 0);
  if (-[SBPressSequenceSettings indexOfPressUpToUseForVarianceAndGrowth](self->_settings, "indexOfPressUpToUseForVarianceAndGrowth") >= a3)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndex:", -[SBPressSequenceSettings indexOfPressUpToUseForVarianceAndGrowth](self->_settings, "indexOfPressUpToUseForVarianceAndGrowth"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v7 == 2)
  {
    objc_msgSend(v8, "durationUp");
    v18 = v17;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v19 = v6;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v37;
      v23 = v18;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v37 != v22)
            objc_enumerationMutation(v19);
          v25 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v19, "lastObject", (_QWORD)v36);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25 != v26)
          {
            objc_msgSend(v25, "durationUp");
            if (v23 >= v27)
              v23 = v27;
            if (v18 < v27)
              v18 = v27;
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v21);
    }
    else
    {
      v23 = v18;
    }

    -[SBPressSequenceSettings pressUpVariance](self->_settings, "pressUpVariance");
    v9 = v23 - v32;
    goto LABEL_30;
  }
  if (v7 == 1)
  {
    objc_msgSend(v8, "durationUp");
    v29 = v28;
    -[SBPressSequenceSettings pressUpVariance](self->_settings, "pressUpVariance");
    v9 = v29 - v30;
    objc_msgSend(v8, "durationUp");
    v18 = v31;
LABEL_30:
    -[SBPressSequenceSettings pressUpVariance](self->_settings, "pressUpVariance", (_QWORD)v36);
    v11 = v18 + v33;
    goto LABEL_31;
  }
  v9 = 0.0;
  if (v7)
  {
    v11 = 0.0;
  }
  else
  {
    -[SBPressSequenceSettings maxDefaultPressUpDuration](self->_settings, "maxDefaultPressUpDuration");
    v11 = v10;
    -[SBPressSequenceSettings maxDownToDownDuration](self->_settings, "maxDownToDownDuration");
    if ((BSFloatEqualToFloat() & 1) == 0)
    {
      v12 = 0.0;
      if (objc_msgSend(v6, "count") > a3)
      {
        objc_msgSend(v6, "objectAtIndex:", a3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "durationDown");
        v12 = v14;

      }
      -[SBPressSequenceSettings maxDownToDownDuration](self->_settings, "maxDownToDownDuration");
      v16 = v15 - v12;
      if (v11 >= v16)
        v11 = v16;
    }
  }
LABEL_31:

  v34 = v9;
  v35 = v11;
  result.var1 = v35;
  result.var0 = v34;
  return result;
}

- (int64_t)_modeForDesiredIndex:(unint64_t)a3 isDownEvent:(BOOL)a4
{
  _BOOL4 v4;
  SBPressSequenceSettings *settings;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  unint64_t v13;
  int v14;
  _BOOL4 v15;
  unint64_t v16;
  int v17;
  int v18;
  void *v20;

  v4 = a4;
  settings = self->_settings;
  if (a4)
  {
    v9 = -[SBPressSequenceSettings indexOfPressDownToUseForVarianceAndGrowth](settings, "indexOfPressDownToUseForVarianceAndGrowth");
    v10 = -[SBPressSequenceSettings numberOfPressDownGrowthTerms](self->_settings, "numberOfPressDownGrowthTerms");
  }
  else
  {
    v9 = -[SBPressSequenceSettings indexOfPressUpToUseForVarianceAndGrowth](settings, "indexOfPressUpToUseForVarianceAndGrowth");
    v10 = -[SBPressSequenceSettings numberOfPressUpGrowthTerms](self->_settings, "numberOfPressUpGrowthTerms");
  }
  v11 = v4 - 1;
  if (v9 < a3)
  {
    v13 = v11 - v10;
    v12 = v11 - v10 + -[SBPressSequenceSettings numberOfPresses](self->_settings, "numberOfPresses") > a3;
    v14 = 1;
  }
  else
  {
    v12 = 0;
    v13 = v11 - v10;
    v14 = 2;
  }
  v15 = v9 >= a3;
  v16 = v13 + -[SBPressSequenceSettings numberOfPresses](self->_settings, "numberOfPresses");
  if (v12)
    v17 = v14;
  else
    v17 = v15;
  if (v16 > a3)
    v18 = 0;
  else
    v18 = -1;
  if (v17 == v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPressSequenceValidator.m"), 215, CFSTR("SBPressSequenceValidator found 0 validations when it should have found at least 1"), 0);

  }
  if (v16 > a3)
    return v12;
  else
    return 2;
}

- (SBPressSequenceSettings)settings
{
  return self->_settings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
