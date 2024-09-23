@implementation SBHIconSettings

- (SBFParallaxSettings)badgeParallaxSettings
{
  return self->_badgeParallaxSettings;
}

- (double)iconHitboxPaddingY
{
  return self->_iconHitboxPaddingY;
}

- (double)iconHitboxPaddingX
{
  return self->_iconHitboxPaddingX;
}

- (BOOL)alwaysHitTestNearestIcon
{
  return self->_alwaysHitTestNearestIcon;
}

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  id v13;

  -[SBHIconSettings setSuppressJitter:](self, "setSuppressJitter:", 0);
  -[SBHIconSettings setAlwaysHitTestNearestIcon:](self, "setAlwaysHitTestNearestIcon:", 0);
  -[SBHIconSettings setIconHitboxPaddingX:](self, "setIconHitboxPaddingX:", 10.0);
  -[SBHIconSettings setIconHitboxPaddingY:](self, "setIconHitboxPaddingY:", 10.0);
  -[SBHIconSettings badgeParallaxSettings](self, "badgeParallaxSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSlideEnabled:", 1);

  -[SBHIconSettings badgeParallaxSettings](self, "badgeParallaxSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSlideDirectionX:", 1);

  -[SBHIconSettings badgeParallaxSettings](self, "badgeParallaxSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSlideDirectionY:", 1);

  -[SBHIconSettings badgeParallaxSettings](self, "badgeParallaxSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSlidePixelsX:", 8.0);

  -[SBHIconSettings badgeParallaxSettings](self, "badgeParallaxSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSlidePixelsY:", 8.0);

  -[SBHIconSettings iconParallaxSettings](self, "iconParallaxSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSlideEnabled:", 1);

  -[SBHIconSettings iconParallaxSettings](self, "iconParallaxSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSlideDirectionX:", 1);

  -[SBHIconSettings iconParallaxSettings](self, "iconParallaxSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSlideDirectionY:", 1);

  v11 = *MEMORY[0x1E0DC5AC8];
  -[SBHIconSettings iconParallaxSettings](self, "iconParallaxSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSlidePixelsX:", v11);

  -[SBHIconSettings iconParallaxSettings](self, "iconParallaxSettings");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSlidePixelsY:", v11);

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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  _QWORD v25[4];
  void *v26;
  _QWORD v27[2];
  _QWORD v28[3];
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Suppress Icon Jitter"), CFSTR("suppressJitter"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v3, CFSTR("Close-Box Debug"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Always Hit-test nearest icon"), CFSTR("alwaysHitTestNearestIcon"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v4;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Hitbox Padding (horizontal)"), CFSTR("iconHitboxPaddingX"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minValue:maxValue:", 0.0, 200.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v6;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Hitbox Padding (vertical)"), CFSTR("iconHitboxPaddingY"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minValue:maxValue:", 0.0, 200.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v9, CFSTR("Close-Box Debug"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Icon Parallax"), CFSTR("iconParallaxSettings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v11;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Badge Parallax"), CFSTR("badgeParallaxSettings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "action");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rowWithTitle:action:", CFSTR("Restore Defaults"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0D83078];
  v25[0] = v24;
  v25[1] = v10;
  v25[2] = v14;
  v25[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "moduleWithTitle:contents:", CFSTR("Icons"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (BOOL)suppressJitter
{
  return self->_suppressJitter;
}

- (void)setSuppressJitter:(BOOL)a3
{
  self->_suppressJitter = a3;
}

- (void)setAlwaysHitTestNearestIcon:(BOOL)a3
{
  self->_alwaysHitTestNearestIcon = a3;
}

- (void)setIconHitboxPaddingX:(double)a3
{
  self->_iconHitboxPaddingX = a3;
}

- (void)setIconHitboxPaddingY:(double)a3
{
  self->_iconHitboxPaddingY = a3;
}

- (SBFParallaxSettings)iconParallaxSettings
{
  return self->_iconParallaxSettings;
}

- (void)setIconParallaxSettings:(id)a3
{
  objc_storeStrong((id *)&self->_iconParallaxSettings, a3);
}

- (void)setBadgeParallaxSettings:(id)a3
{
  objc_storeStrong((id *)&self->_badgeParallaxSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeParallaxSettings, 0);
  objc_storeStrong((id *)&self->_iconParallaxSettings, 0);
}

@end
