@implementation _UIPointerEffectSettings

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIPointerEffectSettings;
  -[PTSettings setDefaultValues](&v5, sel_setDefaultValues);
  -[_UIPointerEffectSettings setDefaultPointerCornerRadius:](self, "setDefaultPointerCornerRadius:", 8.0);
  -[_UIPointerEffectSettings setSlipFactorX:](self, "setSlipFactorX:", 0.099);
  -[_UIPointerEffectSettings setSlipFactorY:](self, "setSlipFactorY:", 0.09);
  -[_UIPointerEffectSettings setParallaxAmount:](self, "setParallaxAmount:", 0.3);
  -[_UIPointerEffectSettings setMaxSlipPoints:](self, "setMaxSlipPoints:", 15.0);
  -[_UIPointerEffectSettings setScaleUpPoints:](self, "setScaleUpPoints:", 4.0);
  -[_UIPointerEffectSettings setScaleUpAnimationResponse:](self, "setScaleUpAnimationResponse:", 0.32);
  -[_UIPointerEffectSettings setScaleUpAnimationDampingRatio:](self, "setScaleUpAnimationDampingRatio:", 0.7);
  -[_UIPointerEffectSettings setDampedAnimationResponse:](self, "setDampedAnimationResponse:", 0.4);
  -[_UIPointerEffectSettings setDampedAnimationDampingRatio:](self, "setDampedAnimationDampingRatio:", 1.0);
  -[_UIPointerEffectSettings setLiftForceFloor:](self, "setLiftForceFloor:", 0.1);
  -[_UIPointerEffectSettings setLiftForceExponent:](self, "setLiftForceExponent:", 0.2);
  -[_UIPointerEffectSettings liftProgress](self, "liftProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDampingRatio:", 1.0);

  -[_UIPointerEffectSettings liftProgress](self, "liftProgress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResponse:", 0.5);

}

+ (BOOL)pointerSlipMatchesContentSlip
{
  return 0;
}

+ (id)settingsControllerModule
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
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
  _QWORD v62[4];
  void *v63;
  _QWORD v64[6];
  _QWORD v65[6];
  _QWORD v66[3];

  v66[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Default Corner Radius"), CFSTR("defaultPointerCornerRadius"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "between:and:", 0.0, 2.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "precision:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionWithRows:title:", v7, CFSTR("Pointer Appearance"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", objc_msgSend(a1, "pointerSlipMatchesContentSlip") ^ 1);
  v8 = objc_claimAutoreleasedReturnValue();
  v58 = (void *)MEMORY[0x1E0D83078];
  v60 = (void *)v8;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Slip X"), CFSTR("slipFactorX"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "between:and:", 0.0, 1.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "precision:", 3);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v52;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Slip Y"), CFSTR("slipFactorY"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "between:and:", 0.0, 1.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "precision:", 3);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v65[1] = v46;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Parallax Amount"), CFSTR("parallaxAmount"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "between:and:", 0.0, 1.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "precision:", 3);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "condition:", v8);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v65[2] = v39;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Max Slip Points"), CFSTR("maxSlipPoints"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "between:and:", 0.0, 100.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "precision:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v65[3] = v11;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Lift Force Floor"), CFSTR("liftForceFloor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "between:and:", 0.0, 1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "precision:", 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v65[4] = v14;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Lift Force Exponent"), CFSTR("liftForceExponent"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "between:and:", 0.0, 1.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "precision:", 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v65[5] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "sectionWithRows:title:", v18, CFSTR("Pointer & Effect Motion"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Scale Up Points"), CFSTR("scaleUpPoints"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "between:and:", 0.0, 20.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "precision:", 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v53;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Scale Animation Response"), CFSTR("scaleUpAnimationResponse"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "between:and:", 0.0, 1.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "precision:", 2);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v47;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Scale Animation Damping Ratio"), CFSTR("scaleUpAnimationDampingRatio"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "between:and:", 0.0, 1.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "precision:", 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v64[2] = v20;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Shadow & Tint Animation Response"), CFSTR("dampedAnimationResponse"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "between:and:", 0.0, 1.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "precision:", 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v64[3] = v23;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Shadow & Tint Animation Damping Ratio"), CFSTR("dampedAnimationDampingRatio"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "between:and:", 0.0, 1.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "precision:", 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v64[4] = v26;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Lift Progress Animation"), CFSTR("liftProgress"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v64[5] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "sectionWithRows:title:", v28, CFSTR("Effect Animations"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "rowWithTitle:action:", CFSTR("Restore Defaults"), v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = (void *)MEMORY[0x1E0D83078];
  v63 = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "sectionWithRows:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (void *)MEMORY[0x1E0D83078];
  v62[0] = v61;
  v62[1] = v59;
  v62[2] = v45;
  v62[3] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "moduleWithTitle:contents:", 0, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

- (double)defaultPointerCornerRadius
{
  return self->_defaultPointerCornerRadius;
}

- (void)setDefaultPointerCornerRadius:(double)a3
{
  self->_defaultPointerCornerRadius = a3;
}

- (double)overrideSlipPoints
{
  return self->_overrideSlipPoints;
}

- (void)setOverrideSlipPoints:(double)a3
{
  self->_overrideSlipPoints = a3;
}

- (double)slipFactorX
{
  return self->_slipFactorX;
}

- (void)setSlipFactorX:(double)a3
{
  self->_slipFactorX = a3;
}

- (double)slipFactorY
{
  return self->_slipFactorY;
}

- (void)setSlipFactorY:(double)a3
{
  self->_slipFactorY = a3;
}

- (double)parallaxAmount
{
  return self->_parallaxAmount;
}

- (void)setParallaxAmount:(double)a3
{
  self->_parallaxAmount = a3;
}

- (double)maxSlipPoints
{
  return self->_maxSlipPoints;
}

- (void)setMaxSlipPoints:(double)a3
{
  self->_maxSlipPoints = a3;
}

- (double)scaleUpPoints
{
  return self->_scaleUpPoints;
}

- (void)setScaleUpPoints:(double)a3
{
  self->_scaleUpPoints = a3;
}

- (double)scaleUpAnimationResponse
{
  return self->_scaleUpAnimationResponse;
}

- (void)setScaleUpAnimationResponse:(double)a3
{
  self->_scaleUpAnimationResponse = a3;
}

- (double)scaleUpAnimationDampingRatio
{
  return self->_scaleUpAnimationDampingRatio;
}

- (void)setScaleUpAnimationDampingRatio:(double)a3
{
  self->_scaleUpAnimationDampingRatio = a3;
}

- (double)dampedAnimationResponse
{
  return self->_dampedAnimationResponse;
}

- (void)setDampedAnimationResponse:(double)a3
{
  self->_dampedAnimationResponse = a3;
}

- (double)dampedAnimationDampingRatio
{
  return self->_dampedAnimationDampingRatio;
}

- (void)setDampedAnimationDampingRatio:(double)a3
{
  self->_dampedAnimationDampingRatio = a3;
}

- (double)liftForceFloor
{
  return self->_liftForceFloor;
}

- (void)setLiftForceFloor:(double)a3
{
  self->_liftForceFloor = a3;
}

- (double)liftForceExponent
{
  return self->_liftForceExponent;
}

- (void)setLiftForceExponent:(double)a3
{
  self->_liftForceExponent = a3;
}

- (_UISpringAnimationPrototypeSettings)liftProgress
{
  return self->_liftProgress;
}

- (void)setLiftProgress:(id)a3
{
  objc_storeStrong((id *)&self->_liftProgress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liftProgress, 0);
}

@end
