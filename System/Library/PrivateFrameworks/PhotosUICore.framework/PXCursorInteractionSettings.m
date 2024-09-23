@implementation PXCursorInteractionSettings

+ (PXCursorInteractionSettings)sharedInstance
{
  if (sharedInstance_onceToken_224295 != -1)
    dispatch_once(&sharedInstance_onceToken_224295, &__block_literal_global_224296);
  return (PXCursorInteractionSettings *)(id)sharedInstance_sharedInstance_224297;
}

- (BOOL)enableCuratedLibraryEffects
{
  return self->_enableCuratedLibraryEffects;
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXCursorInteractionSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXCursorInteractionSettings setDampingRatio:](self, "setDampingRatio:", 0.7);
  -[PXCursorInteractionSettings setYearsPadding:](self, "setYearsPadding:", 8.0);
  -[PXCursorInteractionSettings setMonthsPadding:](self, "setMonthsPadding:", 8.0);
  -[PXCursorInteractionSettings setDaysPadding:](self, "setDaysPadding:", 0.0);
  -[PXCursorInteractionSettings setAllPhotosAspectFitPadding:](self, "setAllPhotosAspectFitPadding:", 8.0);
  -[PXCursorInteractionSettings setAllPhotosAspectFillPadding:](self, "setAllPhotosAspectFillPadding:", 0.0);
  -[PXCursorInteractionSettings setAspectFitAnimationStyle:](self, "setAspectFitAnimationStyle:", 1);
  -[PXCursorInteractionSettings setAspectFillAnimationStyle:](self, "setAspectFillAnimationStyle:", 0);
  -[PXCursorInteractionSettings setEnableGridShadows:](self, "setEnableGridShadows:", 0);
  -[PXCursorInteractionSettings setEnableGridLift:](self, "setEnableGridLift:", 1);
  -[PXCursorInteractionSettings setEnableCardShadows:](self, "setEnableCardShadows:", 0);
  -[PXCursorInteractionSettings setEnableCardLift:](self, "setEnableCardLift:", 1);
  -[PXCursorInteractionSettings setEnableCuratedLibraryEffects:](self, "setEnableCuratedLibraryEffects:", 0);
  -[PXCursorInteractionSettings setEnableDetailsEffect:](self, "setEnableDetailsEffect:", 0);
  -[PXCursorInteractionSettings setEnableDaysEffect:](self, "setEnableDaysEffect:", 0);
}

- (void)setYearsPadding:(double)a3
{
  self->_yearsPadding = a3;
}

- (void)setMonthsPadding:(double)a3
{
  self->_monthsPadding = a3;
}

- (void)setEnableGridShadows:(BOOL)a3
{
  self->_enableGridShadows = a3;
}

- (void)setEnableGridLift:(BOOL)a3
{
  self->_enableGridLift = a3;
}

- (void)setEnableDetailsEffect:(BOOL)a3
{
  self->_enableDetailsEffect = a3;
}

- (void)setEnableDaysEffect:(BOOL)a3
{
  self->_enableDaysEffect = a3;
}

- (void)setEnableCuratedLibraryEffects:(BOOL)a3
{
  self->_enableCuratedLibraryEffects = a3;
}

- (void)setEnableCardShadows:(BOOL)a3
{
  self->_enableCardShadows = a3;
}

- (void)setEnableCardLift:(BOOL)a3
{
  self->_enableCardLift = a3;
}

- (void)setDaysPadding:(double)a3
{
  self->_daysPadding = a3;
}

- (void)setDampingRatio:(double)a3
{
  self->_dampingRatio = a3;
}

- (void)setAspectFitAnimationStyle:(int64_t)a3
{
  self->_aspectFitAnimationStyle = a3;
}

- (void)setAspectFillAnimationStyle:(int64_t)a3
{
  self->_aspectFillAnimationStyle = a3;
}

- (void)setAllPhotosAspectFitPadding:(double)a3
{
  self->_allPhotosAspectFitPadding = a3;
}

- (void)setAllPhotosAspectFillPadding:(double)a3
{
  self->_allPhotosAspectFillPadding = a3;
}

- (BOOL)enableDaysEffect
{
  return self->_enableDaysEffect;
}

void __45__PXCursorInteractionSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cursorInteractionSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_224297;
  sharedInstance_sharedInstance_224297 = v0;

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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
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
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[2];
  _QWORD v65[5];
  _QWORD v66[7];

  v66[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  v32 = (id)MEMORY[0x1E0D83078];
  v3 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_animationDuration);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", CFSTR("Animation Duration"), v61);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "minValue:maxValue:", 0.05, 1.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "px_increment:", 0.01);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v58;
  v4 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_dampingRatio);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowWithTitle:valueKeyPath:", CFSTR("Damping Ratio"), v57);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "minValue:maxValue:", 0.01, 2.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "px_increment:", 0.01);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v65[1] = v54;
  v5 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_yearsPadding);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rowWithTitle:valueKeyPath:", CFSTR("Years Padding"), v53);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "minValue:maxValue:", 0.0, 20.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "px_increment:", 2.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v65[2] = v50;
  v6 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_monthsPadding);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rowWithTitle:valueKeyPath:", CFSTR("Months Padding"), v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "minValue:maxValue:", 0.0, 20.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "px_increment:", 2.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v65[3] = v46;
  v7 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_allPhotosAspectFitPadding);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rowWithTitle:valueKeyPath:", CFSTR("All Photos Aspect Fit Padding"), v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "minValue:maxValue:", 0.0, 20.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "px_increment:", 2.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v65[4] = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 5);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v41, CFSTR("Curated Library"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v40;
  v8 = (void *)MEMORY[0x1E0D83078];
  v9 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableGridShadows);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rowWithTitle:valueKeyPath:", CFSTR("Enable Shadows"), v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v38;
  v10 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableGridLift);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rowWithTitle:valueKeyPath:", CFSTR("Enable Lift"), v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionWithRows:title:", v35, CFSTR("Padded Grids"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v34;
  v11 = (void *)MEMORY[0x1E0D83078];
  v12 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableCardShadows);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rowWithTitle:valueKeyPath:", CFSTR("Enable Shadows"), v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v30;
  v13 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableCardLift);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rowWithTitle:valueKeyPath:", CFSTR("Enable Lift"), v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sectionWithRows:title:", v14, CFSTR("Cards"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v66[2] = v15;
  v16 = (void *)MEMORY[0x1E0D83078];
  v17 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableCuratedLibraryEffects);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rowWithTitle:valueKeyPath:", CFSTR("Enable Curated Library"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v19;
  v20 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableDetailsEffect);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "rowWithTitle:valueKeyPath:", CFSTR("Enable Details View"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sectionWithRows:title:", v23, CFSTR("Enablement"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v66[3] = v24;
  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v66[4] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "moduleWithTitle:contents:", CFSTR("Cursor Interaction"), v26);
  v33 = (id)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (int64_t)gridInteractionOptions
{
  int64_t v3;

  v3 = -[PXCursorInteractionSettings enableGridShadows](self, "enableGridShadows");
  if (-[PXCursorInteractionSettings enableGridLift](self, "enableGridLift"))
    return v3 | 2;
  else
    return v3;
}

- (int64_t)cardInteractionOptions
{
  int64_t v3;

  v3 = -[PXCursorInteractionSettings enableCardShadows](self, "enableCardShadows");
  if (-[PXCursorInteractionSettings enableCardLift](self, "enableCardLift"))
    return v3 | 2;
  else
    return v3;
}

- (int64_t)interactionOptionsForZoomLevel:(int64_t)a3 isAllPhotosAspectFit:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  switch(a3)
  {
    case 0:
    case 3:
      return 0;
    case 1:
    case 2:
      return -[PXCursorInteractionSettings cardInteractionOptions](self, "cardInteractionOptions");
    case 4:
      if (a4)
        return -[PXCursorInteractionSettings gridInteractionOptions](self, "gridInteractionOptions");
      else
        return 0;
    default:
      v14 = v5;
      v15 = v4;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v7, v6, v14, v15, v8, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCursorInteractionSettings.m"), 74, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
}

- (double)paddingForZoomLevel:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double result;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  switch(a3)
  {
    case 0:
      result = 0.0;
      break;
    case 1:
      -[PXCursorInteractionSettings yearsPadding](self, "yearsPadding");
      break;
    case 2:
      -[PXCursorInteractionSettings monthsPadding](self, "monthsPadding");
      break;
    case 3:
      -[PXCursorInteractionSettings daysPadding](self, "daysPadding");
      break;
    case 4:
      -[PXCursorInteractionSettings allPhotosAspectFitPadding](self, "allPhotosAspectFitPadding");
      break;
    default:
      v13 = v4;
      v14 = v3;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v6, v5, v13, v14, v7, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCursorInteractionSettings.m"), 90, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
  return result;
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(double)a3
{
  self->_animationDuration = a3;
}

- (double)dampingRatio
{
  return self->_dampingRatio;
}

- (double)yearsPadding
{
  return self->_yearsPadding;
}

- (double)monthsPadding
{
  return self->_monthsPadding;
}

- (double)daysPadding
{
  return self->_daysPadding;
}

- (double)allPhotosAspectFitPadding
{
  return self->_allPhotosAspectFitPadding;
}

- (double)allPhotosAspectFillPadding
{
  return self->_allPhotosAspectFillPadding;
}

- (int64_t)aspectFitAnimationStyle
{
  return self->_aspectFitAnimationStyle;
}

- (int64_t)aspectFillAnimationStyle
{
  return self->_aspectFillAnimationStyle;
}

- (BOOL)enableGridShadows
{
  return self->_enableGridShadows;
}

- (BOOL)enableGridLift
{
  return self->_enableGridLift;
}

- (BOOL)enableCardShadows
{
  return self->_enableCardShadows;
}

- (BOOL)enableCardLift
{
  return self->_enableCardLift;
}

- (BOOL)enableDetailsEffect
{
  return self->_enableDetailsEffect;
}

@end
