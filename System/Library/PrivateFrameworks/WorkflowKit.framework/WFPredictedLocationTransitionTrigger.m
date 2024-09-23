@implementation WFPredictedLocationTransitionTrigger

- (BOOL)hasValidConfiguration
{
  return 1;
}

- (id)localizedDescriptionWithConfigurationSummary
{
  unint64_t v3;
  unint64_t v4;
  __CFString **v5;

  v3 = -[WFPredictedLocationTransitionTrigger destinationType](self, "destinationType");
  if (v3)
  {
    if (v3 != 1)
      return (id)v3;
    v4 = -[WFPredictedLocationTransitionTrigger minutesBefore](self, "minutesBefore");
    if (v4 < 6)
    {
      v5 = &off_1E7AED298[v4];
LABEL_7:
      WFLocalizedString(*v5);
      v3 = objc_claimAutoreleasedReturnValue();
      return (id)v3;
    }
  }
  v3 = -[WFPredictedLocationTransitionTrigger minutesBefore](self, "minutesBefore");
  if (v3 < 6)
  {
    v5 = &off_1E7AED2C8[v3];
    goto LABEL_7;
  }
  return (id)v3;
}

- (id)localizedPastTenseDescription
{
  return &stru_1E7AFA810;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFPredictedLocationTransitionTrigger;
  v4 = a3;
  -[WFTrigger encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[WFPredictedLocationTransitionTrigger destinationType](self, "destinationType", v7.receiver, v7.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("destinationType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[WFPredictedLocationTransitionTrigger minutesBefore](self, "minutesBefore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("minutesBefore"));

}

- (WFPredictedLocationTransitionTrigger)initWithCoder:(id)a3
{
  id v4;
  WFPredictedLocationTransitionTrigger *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  WFPredictedLocationTransitionTrigger *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFPredictedLocationTransitionTrigger;
  v5 = -[WFTrigger initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("destinationType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v8 = objc_msgSend(v6, "unsignedIntegerValue");
    else
      v8 = 0;
    -[WFPredictedLocationTransitionTrigger setDestinationType:](v5, "setDestinationType:", v8);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minutesBefore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      v11 = objc_msgSend(v9, "unsignedIntegerValue");
    else
      v11 = 0;
    -[WFPredictedLocationTransitionTrigger setMinutesBefore:](v5, "setMinutesBefore:", v11);
    v12 = v5;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFPredictedLocationTransitionTrigger;
  v4 = -[WFTrigger copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setDestinationType:", -[WFPredictedLocationTransitionTrigger destinationType](self, "destinationType"));
  objc_msgSend(v4, "setMinutesBefore:", -[WFPredictedLocationTransitionTrigger minutesBefore](self, "minutesBefore"));
  return v4;
}

- (unint64_t)destinationType
{
  return self->_destinationType;
}

- (void)setDestinationType:(unint64_t)a3
{
  self->_destinationType = a3;
}

- (unint64_t)minutesBefore
{
  return self->_minutesBefore;
}

- (void)setMinutesBefore:(unint64_t)a3
{
  self->_minutesBefore = a3;
}

+ (BOOL)isSupportedOnThisDevice
{
  return 1;
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(CFSTR("Before I Commute"));
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(CFSTR("Ex. “15 minutes before I leave for work”"));
}

+ (id)displayGlyph
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC7B70];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:", CFSTR("LeaveTriggerIcon"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (int64_t)triggerBacking
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
