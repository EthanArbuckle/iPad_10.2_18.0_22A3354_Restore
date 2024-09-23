@implementation WFArriveLocationTrigger

+ (BOOL)isSupportedOnThisDevice
{
  return 1;
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(CFSTR("Arrive"));
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(CFSTR("Ex. “When I arrive at the gym”"));
}

+ (id)displayGlyph
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC7B70];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:", CFSTR("ArriveTriggerIcon"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (int64_t)triggerBacking
{
  return 1;
}

- (id)localizedDescriptionWithConfigurationSummary
{
  uint64_t v3;
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

  -[WFLocationTrigger startTime](self, "startTime");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[WFLocationTrigger endTime](self, "endTime"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    +[WFLocationTrigger timestampDateFormatter](WFLocationTrigger, "timestampDateFormatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("When I arrive at %1$@ between %2$@ and %3$@"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLocationTrigger region](self, "region");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLocationTrigger startTime](self, "startTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromDate:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLocationTrigger endTime](self, "endTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromDate:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v8, v10, v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("When I arrive at %@"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLocationTrigger region](self, "region");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringWithFormat:", v6, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)localizedPastTenseDescription
{
  return &stru_1E7AFA810;
}

@end
