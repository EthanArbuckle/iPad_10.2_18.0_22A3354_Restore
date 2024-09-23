@implementation _UIButtonSettings

- (BOOL)highlightMode
{
  return *(&self->super.__isObservingChildren + 1);
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIButtonSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[_UIButtonSettings setHighlightMode:](self, "setHighlightMode:", 0);
  -[_UIButtonSettings setHighlightSubclasses:](self, "setHighlightSubclasses:", 1);
  -[_UIButtonSettings setHighlightIgnoresBars:](self, "setHighlightIgnoresBars:", 1);
  -[_UIButtonSettings setHighlightBelow:](self, "setHighlightBelow:", 0);
  -[_UIButtonSettings setHighlightAlternateColor:](self, "setHighlightAlternateColor:", 0);
}

- (void)setHighlightSubclasses:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 2) = a3;
}

- (void)setHighlightMode:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 1) = a3;
}

- (void)setHighlightIgnoresBars:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 3) = a3;
}

- (void)setHighlightBelow:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 4) = a3;
}

- (void)setHighlightAlternateColor:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 5) = a3;
}

- (_UIButtonSettings)initWithDefaultValues
{
  _UIButtonSettings *v2;
  _UIButtonSettings *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIButtonSettings;
  v2 = -[PTSettings initWithDefaultValues](&v5, sel_initWithDefaultValues);
  v3 = v2;
  if (v2)
    -[PTSettings addKeyObserver:](v2, "addKeyObserver:", v2);
  return v3;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        _recursivelyLayoutUIButtons(*(void **)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Highlight UIButtons"), CFSTR("highlightMode"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v18;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Include Subclasses"), CFSTR("highlightSubclasses"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v17;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Ignore Bar Buttons"), CFSTR("highlightIgnoresBars"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v16;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Solid Highlight Below"), CFSTR("highlightBelow"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v3;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use Alternate Color"), CFSTR("highlightAlternateColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v5, CFSTR("Usage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v6;
  v7 = (void *)MEMORY[0x1E0D83078];
  v8 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rowWithTitle:action:", CFSTR("Restore Defaults"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionWithRows:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "moduleWithTitle:contents:", 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)highlightSubclasses
{
  return *(&self->super.__isObservingChildren + 2);
}

- (BOOL)highlightIgnoresBars
{
  return *(&self->super.__isObservingChildren + 3);
}

- (BOOL)highlightBelow
{
  return *(&self->super.__isObservingChildren + 4);
}

- (BOOL)highlightAlternateColor
{
  return *(&self->super.__isObservingChildren + 5);
}

@end
