@implementation _UIKeyShortcutHUDCellConfigurationState

- (_UIKeyShortcutHUDCellConfigurationState)initWithCellConfigurationState:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIKeyShortcutHUDCellConfigurationState;
  return (_UIKeyShortcutHUDCellConfigurationState *)-[UICellConfigurationState _initWithState:](&v4, sel__initWithState_, a3);
}

- (BOOL)isFlashing
{
  void *v2;
  char v3;

  -[UIViewConfigurationState objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("com.apple.uikit.key-shortcut-hud.flashing-configuration-state"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setFlashing:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIViewConfigurationState setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v4, CFSTR("com.apple.uikit.key-shortcut-hud.flashing-configuration-state"));

}

- (BOOL)isCategoryVisible
{
  void *v2;
  char v3;

  -[UIViewConfigurationState objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("com.apple.uikit.key-shortcut-hud.category-visible-configuration-state"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setCategoryVisible:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIViewConfigurationState setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v4, CFSTR("com.apple.uikit.key-shortcut-hud.category-visible-configuration-state"));

}

- (BOOL)drawsBackground
{
  void *v2;
  char v3;

  -[UIViewConfigurationState objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("com.apple.uikit.key-shortcut-hud.draws-background-configuration-state"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setDrawsBackground:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIViewConfigurationState setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v4, CFSTR("com.apple.uikit.key-shortcut-hud.draws-background-configuration-state"));

}

@end
