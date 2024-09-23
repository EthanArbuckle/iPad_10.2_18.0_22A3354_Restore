@implementation SBDashBoardThermalStatusProvider

- (SBDashBoardThermalStatusProvider)init
{
  void *v3;
  SBDashBoardThermalStatusProvider *v4;

  +[SBThermalController sharedInstance](SBThermalController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBDashBoardThermalStatusProvider initWithThermalController:](self, "initWithThermalController:", v3);

  return v4;
}

- (SBDashBoardThermalStatusProvider)initWithThermalController:(id)a3
{
  id v5;
  SBDashBoardThermalStatusProvider *v6;
  SBDashBoardThermalStatusProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBDashBoardThermalStatusProvider;
  v6 = -[SBDashBoardThermalStatusProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_thermalController, a3);

  return v7;
}

- (int64_t)thermalStatus
{
  unint64_t v2;

  v2 = -[SBThermalController level](self->_thermalController, "level");
  if (v2 > 3)
    return -1;
  else
    return qword_1D0E88E18[v2];
}

+ (id)thermometerGlyphForThermalStatus:(int64_t)a3
{
  void *v3;
  __CFString *v4;
  void *v5;
  int v6;
  char v7;
  _BOOL4 v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;

  if ((unint64_t)(a3 + 1) > 2)
  {
    v9 = 0;
  }
  else
  {
    v4 = off_1E8EA6178[a3 + 1];
    v5 = (void *)MEMORY[0x1E0CEA650];
    v6 = __sb__runningInSpringBoard();
    v7 = v6;
    if (v6)
    {
      v8 = SBFEffectiveDeviceClass() == 2;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v3, "userInterfaceIdiom") == 1;
    }
    v10 = 58.0;
    if (v8)
      v10 = 80.0;
    objc_msgSend(v5, "configurationWithPointSize:weight:", 3, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationPreferringMulticolor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configurationByApplyingConfiguration:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v7 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", v4, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thermalController, 0);
}

@end
