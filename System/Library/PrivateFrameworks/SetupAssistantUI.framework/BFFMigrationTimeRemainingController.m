@implementation BFFMigrationTimeRemainingController

- (BFFMigrationTimeRemainingController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  BFFMigrationTimeRemainingController *v5;
  NSDateComponentsFormatter *v6;
  NSDateComponentsFormatter *elapsedDurationFormatter;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BFFMigrationTimeRemainingController;
  v5 = -[BFFTimeRemainingController initWithTitle:detailText:icon:](&v9, sel_initWithTitle_detailText_icon_, a3, a4, a5);
  if (v5)
  {
    v6 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x24BDD14F8]);
    elapsedDurationFormatter = v5->_elapsedDurationFormatter;
    v5->_elapsedDurationFormatter = v6;

    -[NSDateComponentsFormatter setUnitsStyle:](v5->_elapsedDurationFormatter, "setUnitsStyle:", 3);
    -[NSDateComponentsFormatter setAllowedUnits:](v5->_elapsedDurationFormatter, "setAllowedUnits:", 240);
  }
  return v5;
}

- (void)setDeviceConnectionInformation:(id)a3
{
  -[BFFMigrationTimeRemainingController setConnectionInfo:](self, "setConnectionInfo:", a3);
  -[BFFMigrationTimeRemainingController updateProgressSubtext](self, "updateProgressSubtext");
}

- (void)setDeviceTransferProgress:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "progress");
  -[BFFTimeRemainingController setProgress:](self, "setProgress:");
  -[BFFMigrationTimeRemainingController setMigrationProgress:](self, "setMigrationProgress:", v4);

  -[BFFMigrationTimeRemainingController updateProgressSubtext](self, "updateProgressSubtext");
}

- (void)updateProgressSubtext
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  const __CFString *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;

  -[BFFMigrationTimeRemainingController migrationProgress](self, "migrationProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFMigrationTimeRemainingController timeRemainingString:](self, "timeRemainingString:", (double)objc_msgSend(v3, "minutesRemaining") * 60.0);
  v32 = (id)objc_claimAutoreleasedReturnValue();

  if (os_variant_has_internal_ui())
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[BFFMigrationTimeRemainingController migrationProgress](self, "migrationProgress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "phaseDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Internal: %@\n"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BFFMigrationTimeRemainingController setInternalProgressText:](self, "setInternalProgressText:", v7);

    v8 = (void *)MEMORY[0x24BDD16F0];
    v9 = (void *)MEMORY[0x24BDD16E0];
    -[BFFMigrationTimeRemainingController migrationProgress](self, "migrationProgress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithUnsignedLongLong:", objc_msgSend(v10, "filesTransferred"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringFromNumber:numberStyle:", v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x24BDD16F0];
    v14 = (void *)MEMORY[0x24BDD16E0];
    -[BFFMigrationTimeRemainingController migrationProgress](self, "migrationProgress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithUnsignedLongLong:", objc_msgSend(v15, "bytesTransferred"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringFromNumber:numberStyle:", v16, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[BFFMigrationTimeRemainingController elapsedDurationFormatter](self, "elapsedDurationFormatter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[BFFMigrationTimeRemainingController migrationProgress](self, "migrationProgress");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fileTransferStartDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "timeIntervalSinceNow");
    objc_msgSend(v18, "stringFromTimeInterval:", -v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[BFFMigrationTimeRemainingController connectionInfo](self, "connectionInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "connectionType");

    v25 = CFSTR("Unknown");
    if (v24 == 2)
      v25 = CFSTR("Wireless");
    if (v24 == 1)
      v26 = CFSTR("Wired");
    else
      v26 = v25;
    -[BFFMigrationTimeRemainingController internalProgressText](self, "internalProgressText");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringByAppendingFormat:", CFSTR("%@ files (%@ bytes)\nElapsed Time: %@\nConnection Type: %@"), v12, v17, v22, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[BFFMigrationTimeRemainingController setInternalProgressText:](self, "setInternalProgressText:", v28);

    objc_msgSend(MEMORY[0x24BE858A8], "buddyPreferencesEphemeral");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v28) = objc_msgSend(v29, "BOOLForKey:", CFSTR("showInternalUI"));

    if ((_DWORD)v28)
    {
      -[BFFMigrationTimeRemainingController internalProgressText](self, "internalProgressText");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringByAppendingFormat:", CFSTR("\n%@"), v30);
      v31 = objc_claimAutoreleasedReturnValue();

      v32 = (id)v31;
    }

  }
  -[OBSetupAssistantProgressController setProgressText:](self, "setProgressText:", v32);

}

- (id)timeRemainingString:(double)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  if (a3 >= 0.0)
  {
    v9.receiver = self;
    v9.super_class = (Class)BFFMigrationTimeRemainingController;
    -[BFFTimeRemainingController timeRemainingString:](&v9, sel_timeRemainingString_);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("TIME_REMAINING"), &stru_24D234A48, CFSTR("Localizable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ESTIMATING_TIME_REMAINING"), &stru_24D234A48, CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
}

- (NSString)internalProgressText
{
  return (NSString *)objc_getProperty(self, a2, 1208, 1);
}

- (void)setInternalProgressText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1208);
}

- (NSDateComponentsFormatter)elapsedDurationFormatter
{
  return self->_elapsedDurationFormatter;
}

- (void)setElapsedDurationFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_elapsedDurationFormatter, a3);
}

- (MBDeviceTransferConnectionInfo)connectionInfo
{
  return self->_connectionInfo;
}

- (void)setConnectionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_connectionInfo, a3);
}

- (MBDeviceTransferProgress)migrationProgress
{
  return self->_migrationProgress;
}

- (void)setMigrationProgress:(id)a3
{
  objc_storeStrong((id *)&self->_migrationProgress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationProgress, 0);
  objc_storeStrong((id *)&self->_connectionInfo, 0);
  objc_storeStrong((id *)&self->_elapsedDurationFormatter, 0);
  objc_storeStrong((id *)&self->_internalProgressText, 0);
}

@end
