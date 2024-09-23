@implementation BFFTimeRemainingController

- (BFFTimeRemainingController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  BFFTimeRemainingController *v5;
  NSDateComponentsFormatter *v6;
  NSDateComponentsFormatter *durationFormatter;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BFFTimeRemainingController;
  v5 = -[OBSetupAssistantProgressController initWithTitle:detailText:icon:](&v9, sel_initWithTitle_detailText_icon_, a3, a4, a5);
  if (v5)
  {
    v6 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x24BDD14F8]);
    durationFormatter = v5->_durationFormatter;
    v5->_durationFormatter = v6;

    -[NSDateComponentsFormatter setUnitsStyle:](v5->_durationFormatter, "setUnitsStyle:", 3);
    -[NSDateComponentsFormatter setMaximumUnitCount:](v5->_durationFormatter, "setMaximumUnitCount:", 1);
    -[NSDateComponentsFormatter setAllowedUnits:](v5->_durationFormatter, "setAllowedUnits:", 240);
    -[NSDateComponentsFormatter setIncludesApproximationPhrase:](v5->_durationFormatter, "setIncludesApproximationPhrase:", 1);
  }
  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BFFTimeRemainingController;
  -[OBSetupAssistantProgressController viewDidLoad](&v8, sel_viewDidLoad);
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
  -[OBSetupAssistantProgressController setProgressText:](self, "setProgressText:", v7);

}

- (void)setTimeRemainingEstimate:(double)a3
{
  id v4;

  -[BFFTimeRemainingController timeRemainingString:](self, "timeRemainingString:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[OBSetupAssistantProgressController setProgressText:](self, "setProgressText:", v4);

}

- (void)setProgress:(double)a3
{
  objc_super v3;

  if (a3 < 0.02)
    a3 = 0.02;
  v3.receiver = self;
  v3.super_class = (Class)BFFTimeRemainingController;
  -[OBSetupAssistantProgressController setProgress:](&v3, sel_setProgress_, a3);
}

- (id)timeRemainingString:(double)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3 > 604800.0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("ESTIMATING_TIME_REMAINING");
LABEL_6:
    objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24D234A48, CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  if (a3 <= 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("LESS_THAN_ONE_MINUTE_REMAINING");
    goto LABEL_6;
  }
  -[NSDateComponentsFormatter stringFromTimeInterval:](self->_durationFormatter, "stringFromTimeInterval:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("TIME_REMAINING"), &stru_24D234A48, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingString:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSDateComponentsFormatter)durationFormatter
{
  return (NSDateComponentsFormatter *)objc_getProperty(self, a2, 1200, 1);
}

- (void)setDurationFormatter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1200);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durationFormatter, 0);
}

@end
