@implementation SBSwitcherChamoisSnapPaddingSettings

- (SBSwitcherChamoisSnapPaddingSettings)initWithDefaultValues
{
  SBSwitcherChamoisSnapPaddingSettings *v2;
  SBSwitcherChamoisSnapPaddingSettings *v3;
  double v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBSwitcherChamoisSnapPaddingSettings;
  v2 = -[PTSettings initWithDefaultValues](&v7, sel_initWithDefaultValues);
  v3 = v2;
  if (v2)
  {
    -[SBSwitcherChamoisSnapPaddingSettings setEdgePadding:](v2, "setEdgePadding:", 45.0);
    -[SBSwitcherChamoisSnapPaddingSettings edgePadding](v3, "edgePadding");
    -[SBSwitcherChamoisSnapPaddingSettings setSingleAppCenterPadding:](v3, "setSingleAppCenterPadding:", v4 + v4);
    -[SBSwitcherChamoisSnapPaddingSettings edgePadding](v3, "edgePadding");
    -[SBSwitcherChamoisSnapPaddingSettings setMultiAppCenterPadding:](v3, "setMultiAppCenterPadding:", v5 * 0.5);
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  SBSwitcherChamoisSnapPaddingSettings *v4;
  SBSwitcherChamoisSnapPaddingSettings *v5;
  char v6;

  v4 = (SBSwitcherChamoisSnapPaddingSettings *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SBSwitcherChamoisSnapPaddingSettings edgePadding](v5, "edgePadding");
      if (BSFloatEqualToFloat()
        && (-[SBSwitcherChamoisSnapPaddingSettings multiAppCenterPadding](v5, "multiAppCenterPadding"),
            BSFloatEqualToFloat()))
      {
        -[SBSwitcherChamoisSnapPaddingSettings singleAppCenterPadding](v5, "singleAppCenterPadding");
        v6 = BSFloatEqualToFloat();
      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[SBSwitcherChamoisSnapPaddingSettings edgePadding](self, "edgePadding");
  v4 = v3;
  -[SBSwitcherChamoisSnapPaddingSettings multiAppCenterPadding](self, "multiAppCenterPadding");
  v6 = v5 * 1000000.0 + v4 * 1000.0;
  -[SBSwitcherChamoisSnapPaddingSettings singleAppCenterPadding](self, "singleAppCenterPadding");
  return (unint64_t)(v6 + v7 * 1000000000.0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setEdgePadding:", self->_edgePadding);
  objc_msgSend(v4, "setMultiAppCenterPadding:", self->_multiAppCenterPadding);
  objc_msgSend(v4, "setSingleAppCenterPadding:", self->_singleAppCenterPadding);
  return v4;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[3];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83070];
  v3 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_edgePadding);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", CFSTR("Edge Padding"), v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "between:and:", 0.0, 300.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "precision:", 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v19;
  v4 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_singleAppCenterPadding);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowWithTitle:valueKeyPath:", CFSTR("Single App Center Padding"), v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "between:and:", 0.0, 300.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "precision:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v6;
  v7 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_multiAppCenterPadding);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rowWithTitle:valueKeyPath:", CFSTR("Multi App Center Padding"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "between:and:", 0.0, 300.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "precision:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "moduleWithTitle:contents:", CFSTR("Snap Padding Settings"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (double)multiAppCenterPadding
{
  return self->_multiAppCenterPadding;
}

- (void)setMultiAppCenterPadding:(double)a3
{
  self->_multiAppCenterPadding = a3;
}

- (double)singleAppCenterPadding
{
  return self->_singleAppCenterPadding;
}

- (void)setSingleAppCenterPadding:(double)a3
{
  self->_singleAppCenterPadding = a3;
}

- (double)edgePadding
{
  return self->_edgePadding;
}

- (void)setEdgePadding:(double)a3
{
  self->_edgePadding = a3;
}

@end
