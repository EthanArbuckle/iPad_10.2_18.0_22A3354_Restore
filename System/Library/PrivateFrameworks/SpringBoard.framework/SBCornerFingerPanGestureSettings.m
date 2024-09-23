@implementation SBCornerFingerPanGestureSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBCornerFingerPanGestureSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[SBCornerFingerPanGestureSettings setTuning:](self, "setTuning:", 1);
}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83020], "rowWithTitle:valueKeyPath:", CFSTR("Tuning Profile"), CFSTR("tuning"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPossibleTitles:", &unk_1E91CEA58);
  objc_msgSend(v2, "setPossibleShortTitles:", &unk_1E91CEA70);
  objc_msgSend(v2, "setPossibleValues:", &unk_1E91CEA88);
  v3 = (void *)MEMORY[0x1E0D83070];
  v11[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionWithRows:title:", v4, CFSTR("Tuning Configuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D83070];
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "moduleWithTitle:contents:", CFSTR("Corner Finger Gesture"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (double)angleDegreesAscendingLUT:(BOOL)a3
{
  unint64_t tuning;
  double *result;
  double *v5;
  double *v6;

  tuning = self->_tuning;
  result = (double *)&LUT_2;
  switch(tuning)
  {
    case 0uLL:
      v5 = (double *)&LUT_LANDSCAPE_0;
      v6 = (double *)&LUT_PORTRAIT_0;
      goto LABEL_5;
    case 1uLL:
      v5 = (double *)&LUT_LANDSCAPE_1;
      v6 = (double *)&LUT_PORTRAIT_1;
LABEL_5:
      if (a3)
        result = v6;
      else
        result = v5;
      break;
    case 2uLL:
      return result;
    case 3uLL:
      result = (double *)&LUT_3;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (double)distanceMillimetersValues:(BOOL)a3
{
  unint64_t tuning;
  double *result;
  double *v5;
  double *v6;

  tuning = self->_tuning;
  result = (double *)&DIST_2;
  switch(tuning)
  {
    case 0uLL:
      v5 = (double *)&DIST_LANDSCAPE_0;
      v6 = (double *)&DIST_PORTRAIT_0;
      goto LABEL_5;
    case 1uLL:
      v5 = (double *)&DIST_LANDSCAPE_1;
      v6 = (double *)&DIST_PORTRAIT_1;
LABEL_5:
      if (a3)
        result = v6;
      else
        result = v5;
      break;
    case 2uLL:
      return result;
    case 3uLL:
      result = (double *)&DIST_3;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (unint64_t)vectorCount:(BOOL)a3
{
  unint64_t tuning;
  BOOL v4;
  unint64_t v5;

  tuning = self->_tuning;
  if (tuning - 2 < 2)
    return 17;
  if (tuning == 1)
  {
    v4 = !a3;
    v5 = 15;
  }
  else
  {
    if (tuning)
      return 0;
    v4 = !a3;
    v5 = 14;
  }
  if (v4)
    return v5;
  else
    return 18;
}

- (double)maximumActiveDistance:(BOOL)a3
{
  _BOOL8 v3;
  double *v5;
  unint64_t v6;
  double v7;

  v3 = a3;
  v5 = -[SBCornerFingerPanGestureSettings distanceMillimetersValues:](self, "distanceMillimetersValues:");
  if (!-[SBCornerFingerPanGestureSettings vectorCount:](self, "vectorCount:", v3))
    return 0.0;
  v6 = 0;
  v7 = 0.0;
  do
    v7 = fmax(v7, v5[v6++]);
  while (v6 < -[SBCornerFingerPanGestureSettings vectorCount:](self, "vectorCount:", v3));
  return v7;
}

- (unint64_t)tuning
{
  return self->_tuning;
}

- (void)setTuning:(unint64_t)a3
{
  self->_tuning = a3;
}

@end
