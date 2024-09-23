@implementation SBFLegibilitySettings

- (void)setDefaultValues
{
  -[SBFLegibilitySettings setSlideToUnlockDarkShadowStrength:](self, "setSlideToUnlockDarkShadowStrength:", 0.35);
  -[SBFLegibilitySettings setSlideToUnlockLightShadowStrength:](self, "setSlideToUnlockLightShadowStrength:", 0.75);
  -[SBFLegibilitySettings setAppIconGrabberDarkShadowStrength:](self, "setAppIconGrabberDarkShadowStrength:", 0.35);
  -[SBFLegibilitySettings setAppIconGrabberLightShadowStrength:](self, "setAppIconGrabberLightShadowStrength:", 0.75);
  -[SBFLegibilitySettings setTimeDarkShadowStrength:](self, "setTimeDarkShadowStrength:", 0.25);
  -[SBFLegibilitySettings setTimeLightShadowStrength:](self, "setTimeLightShadowStrength:", 0.25);
  -[SBFLegibilitySettings setDateDarkShadowStrength:](self, "setDateDarkShadowStrength:", 0.35);
  -[SBFLegibilitySettings setDateLightShadowStrength:](self, "setDateLightShadowStrength:", 0.35);
  -[SBFLegibilitySettings setStatusTextDarkShadowStrength:](self, "setStatusTextDarkShadowStrength:", 0.35);
  -[SBFLegibilitySettings setStatusTextLightShadowStrength:](self, "setStatusTextLightShadowStrength:", 0.35);
  -[SBFLegibilitySettings setIconLabelDarkShadowStrength:](self, "setIconLabelDarkShadowStrength:", 0.3);
  -[SBFLegibilitySettings setIconLabelLightShadowStrength:](self, "setIconLabelLightShadowStrength:", 0.0);
  -[SBFLegibilitySettings setFolderTitleDarkShadowStrength:](self, "setFolderTitleDarkShadowStrength:", 0.25);
  -[SBFLegibilitySettings setFolderTitleLightShadowStrength:](self, "setFolderTitleLightShadowStrength:", 0.25);
  -[SBFLegibilitySettings setTimerDialDarkShadowStrength:](self, "setTimerDialDarkShadowStrength:", 0.15);
  -[SBFLegibilitySettings setTimerDialLightShadowStrength:](self, "setTimerDialLightShadowStrength:", 0.15);
  -[SBFLegibilitySettings setTimerTextDarkShadowStrength:](self, "setTimerTextDarkShadowStrength:", 0.35);
  -[SBFLegibilitySettings setTimerTextLightShadowStrength:](self, "setTimerTextLightShadowStrength:", 0.35);
  -[SBFLegibilitySettings setLogoutButtonGlyphDarkShadowStrength:](self, "setLogoutButtonGlyphDarkShadowStrength:", 0.35);
  -[SBFLegibilitySettings setLogoutButtonGlyphLightShadowStrength:](self, "setLogoutButtonGlyphLightShadowStrength:", 0.75);
  -[SBFLegibilitySettings setLogoutButtonTextDarkShadowStrength:](self, "setLogoutButtonTextDarkShadowStrength:", 0.35);
  -[SBFLegibilitySettings setLogoutButtonTextLightShadowStrength:](self, "setLogoutButtonTextLightShadowStrength:", 0.35);
  -[SBFLegibilitySettings setUserPictureDarkShadowStrength:](self, "setUserPictureDarkShadowStrength:", 0.15);
  -[SBFLegibilitySettings setUserPictureLightShadowStrength:](self, "setUserPictureLightShadowStrength:", 0.15);
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[22];

  v49[20] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Slide To Unlock Dark Shadow Strength"), CFSTR("slideToUnlockDarkShadowStrength"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "minValue:maxValue:", 0.0, 5.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v46;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Slide To Unlock Light Shadow Strength"), CFSTR("slideToUnlockLightShadowStrength"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "minValue:maxValue:", 0.0, 5.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v44;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("App Icon Grabber Dark Shadow Strength"), CFSTR("appIconGrabberDarkShadowStrength"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "minValue:maxValue:", 0.0, 5.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v42;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("App Icon Grabber Light Shadow Strength"), CFSTR("appIconGrabberLightShadowStrength"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "minValue:maxValue:", 0.0, 5.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v40;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Time Dark Shadow Strength"), CFSTR("timeDarkShadowStrength"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "minValue:maxValue:", 0.0, 5.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v49[4] = v38;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Time Light Shadow Strength"), CFSTR("timeLightShadowStrength"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "minValue:maxValue:", 0.0, 5.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v49[5] = v36;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Date Dark Shadow Strength"), CFSTR("dateDarkShadowStrength"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "minValue:maxValue:", 0.0, 5.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v49[6] = v34;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Date Light Shadow Strength"), CFSTR("dateLightShadowStrength"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "minValue:maxValue:", 0.0, 5.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v49[7] = v32;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Icon Label Dark Shadow Strength"), CFSTR("iconLabelDarkShadowStrength"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "minValue:maxValue:", 0.0, 5.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v49[8] = v30;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Icon Label Light Shadow Strength"), CFSTR("iconLabelLightShadowStrength"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "minValue:maxValue:", 0.0, 5.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v49[9] = v28;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Folder Title Dark Shadow Strength"), CFSTR("folderTitleDarkShadowStrength"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "minValue:maxValue:", 0.0, 5.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v49[10] = v26;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Folder Title Light Shadow Strength"), CFSTR("folderTitleLightShadowStrength"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "minValue:maxValue:", 0.0, 5.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v49[11] = v24;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Logout Button Glyph Dark Shadow Strength"), CFSTR("logoutButtonGlyphDarkShadowStrength"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "minValue:maxValue:", 0.0, 5.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v49[12] = v22;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Logout Button Glyph Light Shadow Strength"), CFSTR("logoutButtonGlyphLightShadowStrength"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "minValue:maxValue:", 0.0, 5.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v49[13] = v20;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Logout Button Text Dark Shadow Strength"), CFSTR("logoutButtonTextDarkShadowStrength"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "minValue:maxValue:", 0.0, 5.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v49[14] = v17;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Logout Button Text Light Shadow Strength"), CFSTR("logoutButtonTextLightShadowStrength"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minValue:maxValue:", 0.0, 5.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v49[15] = v3;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Status Text Dark Shadow Strength"), CFSTR("statusTextDarkShadowStrength"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minValue:maxValue:", 0.0, 5.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v49[16] = v5;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Status Text Light Shadow Strength"), CFSTR("statusTextLightShadowStrength"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minValue:maxValue:", 0.0, 5.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v49[17] = v7;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("User Picture Dark Shadow Strength"), CFSTR("userPictureDarkShadowStrength"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minValue:maxValue:", 0.0, 5.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v49[18] = v9;
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("User Picture Light Shadow Strength"), CFSTR("userPictureLightShadowStrength"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minValue:maxValue:", 0.0, 5.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v49[19] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83070], "sectionWithRows:title:", v19, CFSTR("Lock Screen Settings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0D83070];
  v48 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "moduleWithTitle:contents:", CFSTR("Legibility Settings"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (double)slideToUnlockStrengthForStyle:(int64_t)a3
{
  double result;

  if (a3 == 1)
  {
    -[SBFLegibilitySettings slideToUnlockDarkShadowStrength](self, "slideToUnlockDarkShadowStrength");
  }
  else if (a3 == 2)
  {
    -[SBFLegibilitySettings slideToUnlockLightShadowStrength](self, "slideToUnlockLightShadowStrength");
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (double)appIconGrabberStrengthForStyle:(int64_t)a3
{
  double result;

  if (a3 == 1)
  {
    -[SBFLegibilitySettings appIconGrabberDarkShadowStrength](self, "appIconGrabberDarkShadowStrength");
  }
  else if (a3 == 2)
  {
    -[SBFLegibilitySettings appIconGrabberLightShadowStrength](self, "appIconGrabberLightShadowStrength");
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (double)timeStrengthForStyle:(int64_t)a3
{
  double result;

  if (a3 == 1)
  {
    -[SBFLegibilitySettings timeDarkShadowStrength](self, "timeDarkShadowStrength");
  }
  else if (a3 == 2)
  {
    -[SBFLegibilitySettings timeLightShadowStrength](self, "timeLightShadowStrength");
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (double)dateStrengthForStyle:(int64_t)a3
{
  double result;

  if (a3 == 1)
  {
    -[SBFLegibilitySettings dateDarkShadowStrength](self, "dateDarkShadowStrength");
  }
  else if (a3 == 2)
  {
    -[SBFLegibilitySettings dateLightShadowStrength](self, "dateLightShadowStrength");
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (double)statusTextStrengthForStyle:(int64_t)a3
{
  double result;

  if (a3 == 1)
  {
    -[SBFLegibilitySettings statusTextDarkShadowStrength](self, "statusTextDarkShadowStrength");
  }
  else if (a3 == 2)
  {
    -[SBFLegibilitySettings statusTextLightShadowStrength](self, "statusTextLightShadowStrength");
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (double)iconLabelStrengthForStyle:(int64_t)a3
{
  double result;

  if (a3 == 1)
  {
    -[SBFLegibilitySettings iconLabelDarkShadowStrength](self, "iconLabelDarkShadowStrength");
  }
  else if (a3 == 2)
  {
    -[SBFLegibilitySettings iconLabelLightShadowStrength](self, "iconLabelLightShadowStrength");
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (double)folderTitleStrengthForStyle:(int64_t)a3
{
  double result;

  if (a3 == 1)
  {
    -[SBFLegibilitySettings folderTitleDarkShadowStrength](self, "folderTitleDarkShadowStrength");
  }
  else if (a3 == 2)
  {
    -[SBFLegibilitySettings folderTitleLightShadowStrength](self, "folderTitleLightShadowStrength");
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (double)timerTextStrengthForStyle:(int64_t)a3
{
  double result;

  if (a3 == 1)
  {
    -[SBFLegibilitySettings timerTextDarkShadowStrength](self, "timerTextDarkShadowStrength");
  }
  else if (a3 == 2)
  {
    -[SBFLegibilitySettings timerTextLightShadowStrength](self, "timerTextLightShadowStrength");
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (double)timerDialStrengthForStyle:(int64_t)a3
{
  double result;

  if (a3 == 1)
  {
    -[SBFLegibilitySettings timerDialDarkShadowStrength](self, "timerDialDarkShadowStrength");
  }
  else if (a3 == 2)
  {
    -[SBFLegibilitySettings timerDialLightShadowStrength](self, "timerDialLightShadowStrength");
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (double)logoutButtonGlyphStrengthForStyle:(int64_t)a3
{
  double result;

  if (a3 == 1)
  {
    -[SBFLegibilitySettings logoutButtonGlyphDarkShadowStrength](self, "logoutButtonGlyphDarkShadowStrength");
  }
  else if (a3 == 2)
  {
    -[SBFLegibilitySettings logoutButtonGlyphLightShadowStrength](self, "logoutButtonGlyphLightShadowStrength");
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (double)logoutButtonTextStrengthForStyle:(int64_t)a3
{
  double result;

  if (a3 == 1)
  {
    -[SBFLegibilitySettings logoutButtonTextDarkShadowStrength](self, "logoutButtonTextDarkShadowStrength");
  }
  else if (a3 == 2)
  {
    -[SBFLegibilitySettings logoutButtonTextLightShadowStrength](self, "logoutButtonTextLightShadowStrength");
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (double)userPictureStrengthForStyle:(int64_t)a3
{
  double result;

  if (a3 == 1)
  {
    -[SBFLegibilitySettings userPictureDarkShadowStrength](self, "userPictureDarkShadowStrength");
  }
  else if (a3 == 2)
  {
    -[SBFLegibilitySettings userPictureLightShadowStrength](self, "userPictureLightShadowStrength");
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (double)slideToUnlockDarkShadowStrength
{
  return self->_slideToUnlockDarkShadowStrength;
}

- (void)setSlideToUnlockDarkShadowStrength:(double)a3
{
  self->_slideToUnlockDarkShadowStrength = a3;
}

- (double)slideToUnlockLightShadowStrength
{
  return self->_slideToUnlockLightShadowStrength;
}

- (void)setSlideToUnlockLightShadowStrength:(double)a3
{
  self->_slideToUnlockLightShadowStrength = a3;
}

- (double)appIconGrabberDarkShadowStrength
{
  return self->_appIconGrabberDarkShadowStrength;
}

- (void)setAppIconGrabberDarkShadowStrength:(double)a3
{
  self->_appIconGrabberDarkShadowStrength = a3;
}

- (double)appIconGrabberLightShadowStrength
{
  return self->_appIconGrabberLightShadowStrength;
}

- (void)setAppIconGrabberLightShadowStrength:(double)a3
{
  self->_appIconGrabberLightShadowStrength = a3;
}

- (double)timeDarkShadowStrength
{
  return self->_timeDarkShadowStrength;
}

- (void)setTimeDarkShadowStrength:(double)a3
{
  self->_timeDarkShadowStrength = a3;
}

- (double)timeLightShadowStrength
{
  return self->_timeLightShadowStrength;
}

- (void)setTimeLightShadowStrength:(double)a3
{
  self->_timeLightShadowStrength = a3;
}

- (double)dateDarkShadowStrength
{
  return self->_dateDarkShadowStrength;
}

- (void)setDateDarkShadowStrength:(double)a3
{
  self->_dateDarkShadowStrength = a3;
}

- (double)dateLightShadowStrength
{
  return self->_dateLightShadowStrength;
}

- (void)setDateLightShadowStrength:(double)a3
{
  self->_dateLightShadowStrength = a3;
}

- (double)statusTextDarkShadowStrength
{
  return self->_statusTextDarkShadowStrength;
}

- (void)setStatusTextDarkShadowStrength:(double)a3
{
  self->_statusTextDarkShadowStrength = a3;
}

- (double)statusTextLightShadowStrength
{
  return self->_statusTextLightShadowStrength;
}

- (void)setStatusTextLightShadowStrength:(double)a3
{
  self->_statusTextLightShadowStrength = a3;
}

- (double)iconLabelDarkShadowStrength
{
  return self->_iconLabelDarkShadowStrength;
}

- (void)setIconLabelDarkShadowStrength:(double)a3
{
  self->_iconLabelDarkShadowStrength = a3;
}

- (double)iconLabelLightShadowStrength
{
  return self->_iconLabelLightShadowStrength;
}

- (void)setIconLabelLightShadowStrength:(double)a3
{
  self->_iconLabelLightShadowStrength = a3;
}

- (double)folderTitleDarkShadowStrength
{
  return self->_folderTitleDarkShadowStrength;
}

- (void)setFolderTitleDarkShadowStrength:(double)a3
{
  self->_folderTitleDarkShadowStrength = a3;
}

- (double)folderTitleLightShadowStrength
{
  return self->_folderTitleLightShadowStrength;
}

- (void)setFolderTitleLightShadowStrength:(double)a3
{
  self->_folderTitleLightShadowStrength = a3;
}

- (double)timerTextDarkShadowStrength
{
  return self->_timerTextDarkShadowStrength;
}

- (void)setTimerTextDarkShadowStrength:(double)a3
{
  self->_timerTextDarkShadowStrength = a3;
}

- (double)timerTextLightShadowStrength
{
  return self->_timerTextLightShadowStrength;
}

- (void)setTimerTextLightShadowStrength:(double)a3
{
  self->_timerTextLightShadowStrength = a3;
}

- (double)timerDialDarkShadowStrength
{
  return self->_timerDialDarkShadowStrength;
}

- (void)setTimerDialDarkShadowStrength:(double)a3
{
  self->_timerDialDarkShadowStrength = a3;
}

- (double)timerDialLightShadowStrength
{
  return self->_timerDialLightShadowStrength;
}

- (void)setTimerDialLightShadowStrength:(double)a3
{
  self->_timerDialLightShadowStrength = a3;
}

- (double)logoutButtonGlyphDarkShadowStrength
{
  return self->_logoutButtonGlyphDarkShadowStrength;
}

- (void)setLogoutButtonGlyphDarkShadowStrength:(double)a3
{
  self->_logoutButtonGlyphDarkShadowStrength = a3;
}

- (double)logoutButtonGlyphLightShadowStrength
{
  return self->_logoutButtonGlyphLightShadowStrength;
}

- (void)setLogoutButtonGlyphLightShadowStrength:(double)a3
{
  self->_logoutButtonGlyphLightShadowStrength = a3;
}

- (double)logoutButtonTextDarkShadowStrength
{
  return self->_logoutButtonTextDarkShadowStrength;
}

- (void)setLogoutButtonTextDarkShadowStrength:(double)a3
{
  self->_logoutButtonTextDarkShadowStrength = a3;
}

- (double)logoutButtonTextLightShadowStrength
{
  return self->_logoutButtonTextLightShadowStrength;
}

- (void)setLogoutButtonTextLightShadowStrength:(double)a3
{
  self->_logoutButtonTextLightShadowStrength = a3;
}

- (double)userPictureDarkShadowStrength
{
  return self->_userPictureDarkShadowStrength;
}

- (void)setUserPictureDarkShadowStrength:(double)a3
{
  self->_userPictureDarkShadowStrength = a3;
}

- (double)userPictureLightShadowStrength
{
  return self->_userPictureLightShadowStrength;
}

- (void)setUserPictureLightShadowStrength:(double)a3
{
  self->_userPictureLightShadowStrength = a3;
}

@end
