@implementation SHSheetPulsingEvent

+ (id)startPulsingEventWithActivityUUID:(id)a3 localizedTitle:(id)a4
{
  id v5;
  id v6;
  SHSheetPulsingEvent *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(SHSheetPulsingEvent);
  -[SHSheetPulsingEvent setActivityUUID:](v7, "setActivityUUID:", v6);

  -[SHSheetPulsingEvent setLocalizedTitle:](v7, "setLocalizedTitle:", v5);
  -[SHSheetPulsingEvent setIsPulsing:](v7, "setIsPulsing:", 1);
  return v7;
}

+ (id)stopPulsingEventWithActivityUUID:(id)a3
{
  id v3;
  SHSheetPulsingEvent *v4;

  v3 = a3;
  v4 = objc_alloc_init(SHSheetPulsingEvent);
  -[SHSheetPulsingEvent setActivityUUID:](v4, "setActivityUUID:", v3);

  -[SHSheetPulsingEvent setIsPulsing:](v4, "setIsPulsing:", 0);
  return v4;
}

- (SHSheetPulsingEvent)initWithBSXPCCoder:(id)a3
{
  id v4;
  SHSheetPulsingEvent *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHSheetPulsingEvent;
  v5 = -[SHSheetPulsingEvent init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityUUID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetPulsingEvent setActivityUUID:](v5, "setActivityUUID:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedTitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetPulsingEvent setLocalizedTitle:](v5, "setLocalizedTitle:", v7);

    -[SHSheetPulsingEvent setIsPulsing:](v5, "setIsPulsing:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPulsing")));
  }

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SHSheetPulsingEvent activityUUID](self, "activityUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("activityUUID"));

  -[SHSheetPulsingEvent localizedTitle](self, "localizedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("localizedTitle"));

  objc_msgSend(v6, "encodeBool:forKey:", -[SHSheetPulsingEvent isPulsing](self, "isPulsing"), CFSTR("isPulsing"));
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (NSUUID)activityUUID
{
  return self->_activityUUID;
}

- (void)setActivityUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isPulsing
{
  return self->_isPulsing;
}

- (void)setIsPulsing:(BOOL)a3
{
  self->_isPulsing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_activityUUID, 0);
}

@end
