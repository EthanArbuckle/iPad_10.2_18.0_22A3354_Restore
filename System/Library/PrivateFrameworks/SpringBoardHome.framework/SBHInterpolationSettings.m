@implementation SBHInterpolationSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHInterpolationSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[SBHInterpolationSettings setLowerBoundFactor:](self, "setLowerBoundFactor:", 1.0);
  -[SBHInterpolationSettings setUpperBoundFactor:](self, "setUpperBoundFactor:", 1.0);
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
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Lower Bound Factor"), CFSTR("lowerBoundFactor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "between:and:", 0.0, 1000.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "precision:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Upper Bound Factor"), CFSTR("upperBoundFactor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "between:and:", 0.0, 1000.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "precision:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v9, CFSTR("Interpolation Boundary Factors"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D83078];
  v15 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "moduleWithTitle:contents:", 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (double)lowerBoundFactor
{
  return self->_lowerBoundFactor;
}

- (void)setLowerBoundFactor:(double)a3
{
  self->_lowerBoundFactor = a3;
}

- (double)upperBoundFactor
{
  return self->_upperBoundFactor;
}

- (void)setUpperBoundFactor:(double)a3
{
  self->_upperBoundFactor = a3;
}

@end
