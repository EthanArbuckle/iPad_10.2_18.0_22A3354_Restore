@implementation TransitMutablePreferences

- (id)copyWithZone:(_NSZone *)a3
{
  TransitPreferences *v4;
  void *v5;
  TransitPreferences *v6;

  v4 = +[TransitPreferences allocWithZone:](TransitPreferences, "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WatchSyncedPreferences defaults](self, "defaults"));
  v6 = -[WatchSyncedPreferences initWithDefaults:](v4, "initWithDefaults:", v5);

  -[TransitPreferences _copyPropertiesTo:](self, "_copyPropertiesTo:", v6);
  return v6;
}

- (void)toggleModeEnabled:(unint64_t)a3
{
  -[TransitPreferences setDisabledModes:](self, "setDisabledModes:", objc_msgSend((id)objc_opt_class(self), "disabledModesByTogglingMode:inModes:", a3, -[TransitPreferences disabledModes](self, "disabledModes")));
}

- (void)setMode:(unint64_t)a3 disabled:(BOOL)a4
{
  unint64_t v5;

  if (a4)
    v5 = -[TransitPreferences disabledModes](self, "disabledModes") | a3;
  else
    v5 = -[TransitPreferences disabledModes](self, "disabledModes") & ~a3;
  -[TransitPreferences setDisabledModes:](self, "setDisabledModes:", v5);
}

@end
