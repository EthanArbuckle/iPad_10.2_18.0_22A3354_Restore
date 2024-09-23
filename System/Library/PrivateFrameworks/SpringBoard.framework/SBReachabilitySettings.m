@implementation SBReachabilitySettings

- (double)homeGestureSwipeDownHeight
{
  return self->_homeGestureSwipeDownHeight;
}

- (double)systemWideSwipeDownHeight
{
  return self->_systemWideSwipeDownHeight;
}

- (void)setDefaultValues
{
  void *v2;
  void *v3;
  void *v5;
  double v6;
  int v7;
  char v8;
  int v9;
  char v10;
  double v11;
  double v12;
  double v13;
  int v14;
  char v15;
  int v16;
  char v17;
  double v18;
  double v19;
  double v20;
  SBFFluidBehaviorSettings *animationSettings;
  void *v22;
  void *v23;
  _QWORD v24[2];
  int v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  CAFrameRateRange v33;

  -[SBReachabilitySettings setAllowOnAllDevices:](self, "setAllowOnAllDevices:", 0);
  -[SBReachabilitySettings setReachabilityDefaultKeepAlive:](self, "setReachabilityDefaultKeepAlive:", 8.0);
  -[SBReachabilitySettings setReachabilityInteractiveKeepAlive:](self, "setReachabilityInteractiveKeepAlive:", 1.5);
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1
      || SBFEffectiveHomeButtonType() != 2)
    {
      goto LABEL_10;
    }
LABEL_9:
    v6 = 0.408866995;
    goto LABEL_41;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "userInterfaceIdiom"))
  {

    goto LABEL_10;
  }
  v2 = (void *)SBFEffectiveHomeButtonType();

  if (v2 == (void *)2)
    goto LABEL_9;
LABEL_10:
  v7 = __sb__runningInSpringBoard();
  v8 = v7;
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_25;
LABEL_16:
    v9 = __sb__runningInSpringBoard();
    v10 = v9;
    if (v9)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_referenceBounds");
    }
    BSSizeRoundForScale();
    v12 = v11;
    v13 = *(double *)(MEMORY[0x1E0DAB260] + 56);
    if ((v10 & 1) == 0)

    if ((v8 & 1) == 0)
    if (v12 >= v13)
    {
      v6 = 0.486413043;
      goto LABEL_41;
    }
    goto LABEL_25;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "userInterfaceIdiom"))
    goto LABEL_16;

LABEL_25:
  v14 = __sb__runningInSpringBoard();
  v15 = v14;
  if (v14)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_40;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "userInterfaceIdiom"))
    {

LABEL_40:
      v6 = 0.3;
      goto LABEL_41;
    }
  }
  v16 = __sb__runningInSpringBoard();
  v17 = v16;
  if (v16)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v19 = v18;
  v20 = *(double *)(MEMORY[0x1E0DAB260] + 40);
  if ((v17 & 1) == 0)

  if ((v15 & 1) == 0)
  if (v19 < v20)
    goto LABEL_40;
  v6 = 0.357571214;
LABEL_41:
  -[SBReachabilitySettings setYOffsetFactor:](self, "setYOffsetFactor:", v6);
  -[SBReachabilitySettings setHomeGestureSwipeDownHysteresis:](self, "setHomeGestureSwipeDownHysteresis:", 10.0);
  -[SBReachabilitySettings setHomeGestureSwipeDownHeight:](self, "setHomeGestureSwipeDownHeight:", 78.0);
  -[SBReachabilitySettings setSystemWideSwipeDownHeight:](self, "setSystemWideSwipeDownHeight:", 200.0);
  -[SBFFluidBehaviorSettings setDefaultValues](self->_animationSettings, "setDefaultValues");
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_animationSettings, "setDampingRatio:", 1.02);
  -[SBFFluidBehaviorSettings setResponse:](self->_animationSettings, "setResponse:", 0.4);
  -[SBFFluidBehaviorSettings setTrackingResponse:](self->_animationSettings, "setTrackingResponse:", 0.1);
  animationSettings = self->_animationSettings;
  v33 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](animationSettings, "setFrameRateRange:highFrameRateReason:", 1114136, *(double *)&v33.minimum, *(double *)&v33.maximum, *(double *)&v33.preferred);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9DC8]), "initWithDefaultValues");
  -[SBReachabilitySettings setJindoTintColorMatrixSettings:](self, "setJindoTintColorMatrixSettings:", v22);

  -[SBReachabilitySettings jindoTintColorMatrixSettings](self, "jindoTintColorMatrixSettings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = 0;
  v24[1] = 0;
  v25 = 1065353216;
  v27 = 0;
  v26 = 0;
  v28 = 1065353216;
  v29 = 0;
  v30 = 0;
  v31 = xmmword_1D0E8B2E0;
  v32 = 1034147594;
  objc_msgSend(v23, "setColorMatrix:", v24);

  -[SBReachabilitySettings setJindoInertDisableOffset:](self, "setJindoInertDisableOffset:", 0.12);
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
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[7];
  void *v59;
  _QWORD v60[3];
  _QWORD v61[6];
  _QWORD v62[2];
  _QWORD v63[2];
  void *v64;
  _QWORD v65[3];

  v65[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowWithTitle:action:", CFSTR("Restore Defaults"), v3);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D83070];
  v65[0] = v57;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:", v5);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Allow on all devices"), CFSTR("allowOnAllDevices"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D83070];
  v64 = v56;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionWithRows:title:", v7, CFSTR("General Settings (Must Kill SpringBoard)"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Default"), CFSTR("reachabilityDefaultKeepAlive"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minValue:maxValue:", 1.0, 15.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("After Touch"), CFSTR("reachabilityInteractiveKeepAlive"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minValue:maxValue:", 1.0, 15.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D83070];
  v63[0] = v55;
  v63[1] = v53;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionWithRows:title:", v11, CFSTR("Reachability Keep Alive"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Offset Factor"), CFSTR("yOffsetFactor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "minValue:maxValue:", 0.0, 1.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Offset Factor"), CFSTR("yOffsetFactor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "between:and:", 0.0, 1.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D83070];
  v62[0] = v51;
  v62[1] = v50;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sectionWithRows:title:", v15, CFSTR("Positioning"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Home Gesture Swipe Down Hysteresis"), CFSTR("homeGestureSwipeDownHysteresis"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "minValue:maxValue:", 0.0, 20.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Home Gesture Swipe Down Hysteresis"), CFSTR("homeGestureSwipeDownHysteresis"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "between:and:", 0.0, 20.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Home Gesture Swipe Down Height"), CFSTR("homeGestureSwipeDownHeight"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "minValue:maxValue:", 0.0, 200.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Home Gesture Swipe Down Height"), CFSTR("homeGestureSwipeDownHeight"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "between:and:", 0.0, 200.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("System Wide Swipe Down Height"), CFSTR("systemWideSwipeDownHeight"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "minValue:maxValue:", 0.0, 1000.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("System Wide Swipe Down Height"), CFSTR("systemWideSwipeDownHeight"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "between:and:", 0.0, 1000.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0D83070];
  v61[0] = v47;
  v61[1] = v46;
  v61[2] = v45;
  v61[3] = v44;
  v61[4] = v43;
  v61[5] = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sectionWithRows:title:", v23, CFSTR("Gesture"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Color matrix over content"), CFSTR("jindoTintColorMatrixSettings"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v25;
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Inert disable animation offset"), CFSTR("jindoInertDisableOffset"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "between:and:", 0.0, 2.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "precision:", 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v28;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Inert disable animation offset"), CFSTR("jindoInertDisableOffset"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "minValue:maxValue:", 0.0, 2.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v60[2] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sectionWithRows:title:", v31, CFSTR("Jindo"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = (void *)MEMORY[0x1E0D83070];
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Animation Settings"), CFSTR("animationSettings"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "sectionWithRows:title:", v35, CFSTR("Miscellaneous"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = (void *)MEMORY[0x1E0D83070];
  v58[0] = v54;
  v58[1] = v52;
  v58[2] = v49;
  v58[3] = v48;
  v58[4] = v41;
  v58[5] = v32;
  v58[6] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 7);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "moduleWithTitle:contents:", CFSTR("Reachability"), v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

- (double)yOffset
{
  void *v2;
  int v4;
  char v5;
  double v6;
  double v7;

  v4 = __sb__runningInSpringBoard();
  v5 = v4;
  if (v4)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_referenceBounds");
  }
  -[SBReachabilitySettings yOffsetFactor](self, "yOffsetFactor");
  SBFloatRoundForMainScreenScale();
  v7 = v6;
  if ((v5 & 1) == 0)

  return v7;
}

- (BOOL)allowOnAllDevices
{
  return self->_allowOnAllDevices;
}

- (void)setAllowOnAllDevices:(BOOL)a3
{
  self->_allowOnAllDevices = a3;
}

- (double)reachabilityDefaultKeepAlive
{
  return self->_reachabilityDefaultKeepAlive;
}

- (void)setReachabilityDefaultKeepAlive:(double)a3
{
  self->_reachabilityDefaultKeepAlive = a3;
}

- (double)reachabilityInteractiveKeepAlive
{
  return self->_reachabilityInteractiveKeepAlive;
}

- (void)setReachabilityInteractiveKeepAlive:(double)a3
{
  self->_reachabilityInteractiveKeepAlive = a3;
}

- (double)yOffsetFactor
{
  return self->_yOffsetFactor;
}

- (void)setYOffsetFactor:(double)a3
{
  self->_yOffsetFactor = a3;
}

- (double)homeGestureSwipeDownHysteresis
{
  return self->_homeGestureSwipeDownHysteresis;
}

- (void)setHomeGestureSwipeDownHysteresis:(double)a3
{
  self->_homeGestureSwipeDownHysteresis = a3;
}

- (void)setHomeGestureSwipeDownHeight:(double)a3
{
  self->_homeGestureSwipeDownHeight = a3;
}

- (void)setSystemWideSwipeDownHeight:(double)a3
{
  self->_systemWideSwipeDownHeight = a3;
}

- (SBFFluidBehaviorSettings)animationSettings
{
  return self->_animationSettings;
}

- (void)setAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_animationSettings, a3);
}

- (SBFCAColorMatrixSettings)jindoTintColorMatrixSettings
{
  return self->_jindoTintColorMatrixSettings;
}

- (void)setJindoTintColorMatrixSettings:(id)a3
{
  objc_storeStrong((id *)&self->_jindoTintColorMatrixSettings, a3);
}

- (double)jindoInertDisableOffset
{
  return self->_jindoInertDisableOffset;
}

- (void)setJindoInertDisableOffset:(double)a3
{
  self->_jindoInertDisableOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jindoTintColorMatrixSettings, 0);
  objc_storeStrong((id *)&self->_animationSettings, 0);
}

@end
