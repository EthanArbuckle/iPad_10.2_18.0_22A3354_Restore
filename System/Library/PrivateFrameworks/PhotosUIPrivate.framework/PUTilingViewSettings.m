@implementation PUTilingViewSettings

- (void)setDefaultValues
{
  uint64_t v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUTilingViewSettings;
  -[PTSettings setDefaultValues](&v5, sel_setDefaultValues);
  -[PUTilingViewSettings setLemonadeUseSystemSpringAnimations:](self, "setLemonadeUseSystemSpringAnimations:", 0);
  -[PUTilingViewSettings setLemonadeUseOvershootingSpringAnimations:](self, "setLemonadeUseOvershootingSpringAnimations:", 0);
  -[PUTilingViewSettings setAnimationDragCoefficient:](self, "setAnimationDragCoefficient:", 1.0);
  -[PUTilingViewSettings setUseSpringAnimations:](self, "setUseSpringAnimations:", 1);
  -[PUTilingViewSettings setUseSystemSpringAnimations:](self, "setUseSystemSpringAnimations:", 0);
  -[PUTilingViewSettings setSpringAnimationDuration:](self, "setSpringAnimationDuration:", 0.3);
  -[PUTilingViewSettings setDefaultAnimationDuration:](self, "setDefaultAnimationDuration:", 0.5);
  -[PUTilingViewSettings setUseOvershootingSpringAnimations:](self, "setUseOvershootingSpringAnimations:", 1);
  -[PUTilingViewSettings setTransitionDuration:](self, "setTransitionDuration:", 0.2);
  if (PLIsCamera())
    v3 = 2;
  else
    v3 = 0;
  -[PUTilingViewSettings setTransitionProgressBehavior:](self, "setTransitionProgressBehavior:", v3);
  if (PLIsCamera())
    v4 = 1.0;
  else
    v4 = 0.5;
  -[PUTilingViewSettings setInteractiveTransitionBackgroundDimming:](self, "setInteractiveTransitionBackgroundDimming:", v4);
  -[PUTilingViewSettings setTransitionChromeDelay:](self, "setTransitionChromeDelay:", 0.0);
  -[PUTilingViewSettings setAllowPaging:](self, "setAllowPaging:", 1);
  -[PUTilingViewSettings setAllowPreheating:](self, "setAllowPreheating:", 1);
  -[PUTilingViewSettings setAllowTileReuse:](self, "setAllowTileReuse:", 1);
  -[PUTilingViewSettings setCarryOverVelocities:](self, "setCarryOverVelocities:", 1);
  -[PUTilingViewSettings setAllowsEdgeAntialiasing:](self, "setAllowsEdgeAntialiasing:", 1);
  -[PUTilingViewSettings setTintTiles:](self, "setTintTiles:", 0);
  -[PUTilingViewSettings setShowVisibleRects:](self, "setShowVisibleRects:", 0);
  -[PUTilingViewSettings setRotateDisappearingTiles:](self, "setRotateDisappearingTiles:", 0);
  -[PUTilingViewSettings setShowSnapshottableTiles:](self, "setShowSnapshottableTiles:", 0);
}

- (void)setUseSystemSpringAnimations:(BOOL)a3
{
  self->_useSystemSpringAnimations = a3;
}

- (void)setUseSpringAnimations:(BOOL)a3
{
  self->_useSpringAnimations = a3;
}

- (void)setUseOvershootingSpringAnimations:(BOOL)a3
{
  self->_useOvershootingSpringAnimations = a3;
}

- (void)setTransitionProgressBehavior:(int64_t)a3
{
  self->_transitionProgressBehavior = a3;
}

- (void)setTransitionDuration:(double)a3
{
  self->_transitionDuration = a3;
}

- (void)setTransitionChromeDelay:(double)a3
{
  self->_transitionChromeDelay = a3;
}

- (void)setTintTiles:(BOOL)a3
{
  self->_tintTiles = a3;
}

- (void)setSpringAnimationDuration:(double)a3
{
  self->_springAnimationDuration = a3;
}

- (void)setShowVisibleRects:(BOOL)a3
{
  self->_showVisibleRects = a3;
}

- (void)setShowSnapshottableTiles:(BOOL)a3
{
  self->_showSnapshottableTiles = a3;
}

- (void)setRotateDisappearingTiles:(BOOL)a3
{
  self->_rotateDisappearingTiles = a3;
}

- (void)setInteractiveTransitionBackgroundDimming:(double)a3
{
  self->_interactiveTransitionBackgroundDimming = a3;
}

- (void)setDefaultAnimationDuration:(double)a3
{
  self->_defaultAnimationDuration = a3;
}

- (void)setCarryOverVelocities:(BOOL)a3
{
  self->_carryOverVelocities = a3;
}

- (void)setAnimationDragCoefficient:(double)a3
{
  self->_animationDragCoefficient = a3;
}

- (void)setAllowsEdgeAntialiasing:(BOOL)a3
{
  self->_allowsEdgeAntialiasing = a3;
}

- (void)setAllowTileReuse:(BOOL)a3
{
  self->_allowTileReuse = a3;
}

- (void)setAllowPreheating:(BOOL)a3
{
  self->_allowPreheating = a3;
}

- (void)setAllowPaging:(BOOL)a3
{
  self->_allowPaging = a3;
}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
}

- (BOOL)lemonadeUseSystemSpringAnimations
{
  return self->_lemonadeUseSystemSpringAnimations;
}

- (void)setLemonadeUseSystemSpringAnimations:(BOOL)a3
{
  self->_lemonadeUseSystemSpringAnimations = a3;
}

- (BOOL)lemonadeUseOvershootingSpringAnimations
{
  return self->_lemonadeUseOvershootingSpringAnimations;
}

- (void)setLemonadeUseOvershootingSpringAnimations:(BOOL)a3
{
  self->_lemonadeUseOvershootingSpringAnimations = a3;
}

- (double)animationDragCoefficient
{
  return self->_animationDragCoefficient;
}

- (BOOL)useSpringAnimations
{
  return self->_useSpringAnimations;
}

- (BOOL)useSystemSpringAnimations
{
  return self->_useSystemSpringAnimations;
}

- (double)springAnimationDuration
{
  return self->_springAnimationDuration;
}

- (double)defaultAnimationDuration
{
  return self->_defaultAnimationDuration;
}

- (BOOL)useOvershootingSpringAnimations
{
  return self->_useOvershootingSpringAnimations;
}

- (double)transitionDuration
{
  return self->_transitionDuration;
}

- (int64_t)transitionProgressBehavior
{
  return self->_transitionProgressBehavior;
}

- (double)interactiveTransitionBackgroundDimming
{
  return self->_interactiveTransitionBackgroundDimming;
}

- (double)transitionChromeDelay
{
  return self->_transitionChromeDelay;
}

- (BOOL)allowPaging
{
  return self->_allowPaging;
}

- (BOOL)allowPreheating
{
  return self->_allowPreheating;
}

- (BOOL)allowTileReuse
{
  return self->_allowTileReuse;
}

- (BOOL)allowsEdgeAntialiasing
{
  return self->_allowsEdgeAntialiasing;
}

- (BOOL)carryOverVelocities
{
  return self->_carryOverVelocities;
}

- (BOOL)tintTiles
{
  return self->_tintTiles;
}

- (BOOL)showVisibleRects
{
  return self->_showVisibleRects;
}

- (BOOL)rotateDisappearingTiles
{
  return self->_rotateDisappearingTiles;
}

- (BOOL)showSnapshottableTiles
{
  return self->_showSnapshottableTiles;
}

+ (PUTilingViewSettings)sharedInstance
{
  if (sharedInstance_onceToken_96819 != -1)
    dispatch_once(&sharedInstance_onceToken_96819, &__block_literal_global_96820);
  return (PUTilingViewSettings *)(id)sharedInstance_sharedInstance_96821;
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
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  _QWORD v102[6];
  void *v103;
  _QWORD v104[4];
  _QWORD v105[5];
  _QWORD v106[4];
  _QWORD v107[6];
  _QWORD v108[4];

  v108[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  v3 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_lemonadeUseSystemSpringAnimations);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", CFSTR("System Spring Animations"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "conditionFormat:", CFSTR("useSpringAnimations == 1"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v108[0] = v6;
  v7 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_lemonadeUseOvershootingSpringAnimations);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rowWithTitle:valueKeyPath:", CFSTR("Overshoot When Zooming In"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v108[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v108, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v10, CFSTR("Lemonade Overrides"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();

  v99 = (void *)MEMORY[0x1E0D83078];
  v11 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_animationDragCoefficient);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rowWithTitle:valueKeyPath:", CFSTR("Slow Animations"), v96);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "possibleValues:titles:", &unk_1E59BA9D8, &unk_1E59BA9F0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v107[0] = v89;
  v12 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_useSpringAnimations);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rowWithTitle:valueKeyPath:", CFSTR("Spring Animations"), v87);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v107[1] = v85;
  v13 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_useSystemSpringAnimations);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rowWithTitle:valueKeyPath:", CFSTR("System Spring Animations"), v83);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "conditionFormat:", CFSTR("useSpringAnimations == 1"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v107[2] = v81;
  v14 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_springAnimationDuration);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rowWithTitle:valueKeyPath:", CFSTR("Spring Animation Duration"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "conditionFormat:", CFSTR("useSpringAnimations == 1 && useSystemSpringAnimations == 0"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v107[3] = v17;
  v18 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_defaultAnimationDuration);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "rowWithTitle:valueKeyPath:", CFSTR("Default Animation Duration"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "minValue:maxValue:", 0.0, 1.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "conditionFormat:", CFSTR("useSpringAnimations == 0"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v107[4] = v22;
  v23 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_useOvershootingSpringAnimations);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "rowWithTitle:valueKeyPath:", CFSTR("Overshoot When Zooming In"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v107[5] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v107, 6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "sectionWithRows:title:", v26, CFSTR("Animations"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  v97 = (void *)MEMORY[0x1E0D83078];
  v27 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_transitionDuration);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "rowWithTitle:valueKeyPath:", CFSTR("Duration"), v93);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "minValue:maxValue:", 0.0, 0.5);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v106[0] = v88;
  v28 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_transitionProgressBehavior);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "rowWithTitle:valueKeyPath:", CFSTR("Progress Behavior"), v86);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "possibleValues:titles:", &unk_1E59BAA08, &unk_1E59BAA20);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v106[1] = v29;
  v30 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_interactiveTransitionBackgroundDimming);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "rowWithTitle:valueKeyPath:", CFSTR("Interactive Background Dimming"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "minValue:maxValue:", 0.0, 1.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "pu_increment:", 0.100000001);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v106[2] = v34;
  v35 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_transitionChromeDelay);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "rowWithTitle:valueKeyPath:", CFSTR("Chrome Delay"), v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "minValue:maxValue:", 0.0, 0.899999976);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "pu_increment:", 0.100000001);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v106[3] = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "sectionWithRows:title:", v40, CFSTR("Transitions"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  v94 = (void *)MEMORY[0x1E0D83078];
  v41 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_allowPaging);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "rowWithTitle:valueKeyPath:", CFSTR("Paging"), v91);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v105[0] = v42;
  v43 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_allowPreheating);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "rowWithTitle:valueKeyPath:", CFSTR("Preheating"), v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v105[1] = v45;
  v46 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_allowTileReuse);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "rowWithTitle:valueKeyPath:", CFSTR("Tile Reuse"), v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v105[2] = v48;
  v49 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_allowsEdgeAntialiasing);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "rowWithTitle:valueKeyPath:", CFSTR("Edge Antialiasing"), v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v105[3] = v51;
  v52 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_carryOverVelocities);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "rowWithTitle:valueKeyPath:", CFSTR("Carry Over Velocities"), v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v105[4] = v54;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 5);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "sectionWithRows:title:", v55, CFSTR("Features"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = (void *)MEMORY[0x1E0D83078];
  v57 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_tintTiles);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "rowWithTitle:valueKeyPath:", CFSTR("Tint Tiles"), v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v104[0] = v59;
  v60 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showVisibleRects);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "rowWithTitle:valueKeyPath:", CFSTR("Visible Rects"), v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v104[1] = v62;
  v63 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_rotateDisappearingTiles);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "rowWithTitle:valueKeyPath:", CFSTR("Rotate Disappearing Tiles"), v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v104[2] = v65;
  v66 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showSnapshottableTiles);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "rowWithTitle:valueKeyPath:", CFSTR("Show Snapshottable Tiles"), v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v104[3] = v68;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v104, 4);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "sectionWithRows:title:", v69, CFSTR("Debugging"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  v71 = (void *)MEMORY[0x1E0D83078];
  v72 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "rowWithTitle:action:", CFSTR("Restore Defaults"), v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = v74;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v103, 1);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "sectionWithRows:", v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  v77 = (void *)MEMORY[0x1E0D83078];
  v102[0] = v101;
  v102[1] = v100;
  v102[2] = v98;
  v102[3] = v95;
  v102[4] = v70;
  v102[5] = v76;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 6);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "moduleWithTitle:contents:", CFSTR("Tiling View"), v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  return v79;
}

void __38__PUTilingViewSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tilingViewSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_96821;
  sharedInstance_sharedInstance_96821 = v0;

}

@end
