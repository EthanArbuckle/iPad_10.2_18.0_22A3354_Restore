@implementation SBDisplayAssertionPreferences

- (SBDisplayAssertionPreferences)init
{
  SBDisplayAssertionPreferences *v2;
  SBDisplayAssertionPreferences *v3;
  SBDisplayArrangementItem *displayArrangement;
  NSString *disableSystemIdleSleepReason;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBDisplayAssertionPreferences;
  v2 = -[SBDisplayAssertionPreferences init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_wantsControlOfDisplay = 0;
    displayArrangement = v2->_displayArrangement;
    v2->_displayArrangement = 0;

    disableSystemIdleSleepReason = v3->_disableSystemIdleSleepReason;
    v3->_disableSystemIdleSleepReason = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SBDisplayAssertionPreferences *v4;

  v4 = objc_alloc_init(SBDisplayAssertionPreferences);
  -[SBDisplayAssertionPreferences setWantsControlOfDisplay:](v4, "setWantsControlOfDisplay:", self->_wantsControlOfDisplay);
  -[SBDisplayAssertionPreferences setDisplayArrangement:](v4, "setDisplayArrangement:", self->_displayArrangement);
  -[SBDisplayAssertionPreferences setDisableSystemIdleSleepReason:](v4, "setDisableSystemIdleSleepReason:", self->_disableSystemIdleSleepReason);
  -[SBDisplayAssertionPreferences setPowerLogEntry:](v4, "setPowerLogEntry:", self->_powerLogEntry);
  -[SBDisplayAssertionPreferences setCloneMirroringMode:](v4, "setCloneMirroringMode:", self->_cloneMirroringMode);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SBDisplayAssertionPreferences *v4;
  SBDisplayAssertionPreferences *v5;
  BOOL v6;

  v4 = (SBDisplayAssertionPreferences *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = self->_wantsControlOfDisplay == v5->_wantsControlOfDisplay
        && -[SBDisplayArrangementItem isEqual:](self->_displayArrangement, "isEqual:", v5->_displayArrangement)
        && -[NSString isEqualToString:](self->_disableSystemIdleSleepReason, "isEqualToString:", v5->_disableSystemIdleSleepReason)&& -[SBDisplayPowerLogEntry isEqual:](self->_powerLogEntry, "isEqual:", v5->_powerLogEntry)&& self->_cloneMirroringMode == v5->_cloneMirroringMode;

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
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:", self->_wantsControlOfDisplay);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_displayArrangement);
  v6 = (id)objc_msgSend(v3, "appendString:", self->_disableSystemIdleSleepReason);
  v7 = (id)objc_msgSend(v3, "appendObject:", self->_powerLogEntry);
  v8 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_cloneMirroringMode);
  v9 = objc_msgSend(v3, "hash");

  return v9;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  unint64_t cloneMirroringMode;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", self->_wantsControlOfDisplay, CFSTR("wantsControl"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_displayArrangement, CFSTR("arrangement"));
  objc_msgSend(v3, "appendString:withName:", self->_disableSystemIdleSleepReason, CFSTR("disableSystemIdleSleepReason"));
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", self->_powerLogEntry, CFSTR("powerLogEntry"));
  cloneMirroringMode = self->_cloneMirroringMode;
  v8 = CFSTR("<.Invalid>");
  if (cloneMirroringMode == 1)
    v8 = CFSTR(".Default");
  if (cloneMirroringMode == 2)
    v9 = CFSTR(".Disabled");
  else
    v9 = v8;
  objc_msgSend(v3, "appendString:withName:", v9, CFSTR("cloneMirroringMode"));
  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)wantsControlOfDisplay
{
  return self->_wantsControlOfDisplay;
}

- (void)setWantsControlOfDisplay:(BOOL)a3
{
  self->_wantsControlOfDisplay = a3;
}

- (SBDisplayArrangementItem)displayArrangement
{
  return self->_displayArrangement;
}

- (void)setDisplayArrangement:(id)a3
{
  objc_storeStrong((id *)&self->_displayArrangement, a3);
}

- (NSString)disableSystemIdleSleepReason
{
  return self->_disableSystemIdleSleepReason;
}

- (void)setDisableSystemIdleSleepReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SBDisplayPowerLogEntry)powerLogEntry
{
  return self->_powerLogEntry;
}

- (void)setPowerLogEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)cloneMirroringMode
{
  return self->_cloneMirroringMode;
}

- (void)setCloneMirroringMode:(unint64_t)a3
{
  self->_cloneMirroringMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerLogEntry, 0);
  objc_storeStrong((id *)&self->_disableSystemIdleSleepReason, 0);
  objc_storeStrong((id *)&self->_displayArrangement, 0);
}

@end
