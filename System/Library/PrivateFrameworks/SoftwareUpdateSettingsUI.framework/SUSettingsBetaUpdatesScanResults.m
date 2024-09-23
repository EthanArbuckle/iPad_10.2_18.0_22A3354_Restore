@implementation SUSettingsBetaUpdatesScanResults

- (id)initFromScanParam:(id)a3 withUUID:(id)a4
{
  SUSettingsBetaUpdatesScanResults *v4;
  SUSettingsBetaUpdatesScanResults *v6;
  id v7;
  id v8;
  id v9;
  SUSettingsBetaUpdatesScanResults *v11;
  objc_super v12;
  id v13;
  id location[2];
  SUSettingsBetaUpdatesScanResults *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v4 = v15;
  v15 = 0;
  v12.receiver = v4;
  v12.super_class = (Class)SUSettingsBetaUpdatesScanResults;
  v11 = -[SUSettingsBetaUpdatesScanResults init](&v12, sel_init);
  v15 = v11;
  objc_storeStrong((id *)&v15, v11);
  if (v11)
  {
    -[SUSettingsBetaUpdatesScanResults setScanUUID:](v15, "setScanUUID:", v13);
    v7 = (id)objc_msgSend(location[0], "enrolledBetaProgram");
    -[SUSettingsBetaUpdatesScanResults setEnrolledBetaProgram:](v15, "setEnrolledBetaProgram:");

    v8 = (id)objc_msgSend(location[0], "betaPrograms");
    -[SUSettingsBetaUpdatesScanResults setBetaPrograms:](v15, "setBetaPrograms:");

    v9 = (id)objc_msgSend(location[0], "currentSeedingDevice");
    -[SUSettingsBetaUpdatesScanResults setCurrentSeedingDevice:](v15, "setCurrentSeedingDevice:");

  }
  v6 = v15;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v15, 0);
  return v6;
}

- (id)description
{
  objc_class *v2;
  void *v4;
  SDDevice *v5;
  NSArray *v6;
  SDBetaProgram *v7;
  NSString *v8;
  NSString *v9;
  id v10;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v2 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v2);
  v8 = -[SUSettingsBetaUpdatesScanResults scanUUID](self, "scanUUID");
  v7 = -[SUSettingsBetaUpdatesScanResults enrolledBetaProgram](self, "enrolledBetaProgram");
  v6 = -[SUSettingsBetaUpdatesScanResults betaPrograms](self, "betaPrograms");
  v5 = -[SUSettingsBetaUpdatesScanResults currentSeedingDevice](self, "currentSeedingDevice");
  v10 = (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p, \n\tscanUUID: %@, \n\tenrolledBetaProgram: %@, \n\tbetaPrograms: %@, \n\tcurrentSeedingDevice: %@ >"), v9, self, v8, v7, v6, v5);

  return v10;
}

- (NSString)scanUUID
{
  return self->_scanUUID;
}

- (void)setScanUUID:(id)a3
{
  objc_storeStrong((id *)&self->_scanUUID, a3);
}

- (SDDevice)currentSeedingDevice
{
  return self->_currentSeedingDevice;
}

- (void)setCurrentSeedingDevice:(id)a3
{
  objc_storeStrong((id *)&self->_currentSeedingDevice, a3);
}

- (NSArray)betaPrograms
{
  return self->_betaPrograms;
}

- (void)setBetaPrograms:(id)a3
{
  objc_storeStrong((id *)&self->_betaPrograms, a3);
}

- (SDBetaProgram)enrolledBetaProgram
{
  return self->_enrolledBetaProgram;
}

- (void)setEnrolledBetaProgram:(id)a3
{
  objc_storeStrong((id *)&self->_enrolledBetaProgram, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrolledBetaProgram, 0);
  objc_storeStrong((id *)&self->_betaPrograms, 0);
  objc_storeStrong((id *)&self->_currentSeedingDevice, 0);
  objc_storeStrong((id *)&self->_scanUUID, 0);
}

@end
