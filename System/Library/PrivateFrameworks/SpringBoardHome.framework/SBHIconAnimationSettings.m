@implementation SBHIconAnimationSettings

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  CAFrameRateRange v13;

  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAnimationType:", 1);

  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMass:", 2.0);

  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStiffness:", 700.0);

  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDamping:", 600.0);

  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCurve:", 393216);

  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "controlPoint1Settings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPointValue:", 0.3825, 0.091);

  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "controlPoint2Settings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPointValue:", 0.98, 0.785);

  -[SBHIconAnimationSettings centralAnimationSettings](self, "centralAnimationSettings");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v12, "setFrameRateRange:highFrameRateReason:", 1114123, *(double *)&v13.minimum, *(double *)&v13.maximum, *(double *)&v13.preferred);

}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0DA9D80], "_moduleWithSectionTitle:delay:frameRate:", CFSTR("Icon Animation"), 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "submoduleWithModule:childSettingsKeyPath:", v3, CFSTR("centralAnimationSettings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0D83078];
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "moduleWithTitle:contents:", 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (SBFAnimationSettings)centralAnimationSettings
{
  return self->_centralAnimationSettings;
}

- (void)setCentralAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_centralAnimationSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centralAnimationSettings, 0);
}

@end
