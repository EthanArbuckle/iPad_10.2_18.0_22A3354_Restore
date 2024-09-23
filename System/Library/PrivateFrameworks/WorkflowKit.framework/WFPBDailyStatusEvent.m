@implementation WFPBDailyStatusEvent

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("DailyStatus");
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (void)setInstalled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_installed = a3;
}

- (void)setHasInstalled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasInstalled
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setSharingEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_sharingEnabled = a3;
}

- (void)setHasSharingEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000000;
  else
    v3 = 0;
  self->_has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasSharingEnabled
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setPersonalAutomationsEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_personalAutomationsEnabled = a3;
}

- (void)setHasPersonalAutomationsEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasPersonalAutomationsEnabled
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setHomeAutomationsEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_homeAutomationsEnabled = a3;
}

- (void)setHasHomeAutomationsEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasHomeAutomationsEnabled
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setShortcutComplicationSlotsUsed:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_shortcutComplicationSlotsUsed = a3;
}

- (void)setHasShortcutComplicationSlotsUsed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasShortcutComplicationSlotsUsed
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setAppComplicationSlotsUsed:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_appComplicationSlotsUsed = a3;
}

- (void)setHasAppComplicationSlotsUsed:(BOOL)a3
{
  self->_has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasAppComplicationSlotsUsed
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setSleepEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_sleepEnabled = a3;
}

- (void)setHasSleepEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000000;
  else
    v3 = 0;
  self->_has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (BOOL)hasSleepEnabled
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setShortcutsCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_shortcutsCount = a3;
}

- (void)setHasShortcutsCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasShortcutsCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setFolderCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_folderCount = a3;
}

- (void)setHasFolderCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasFolderCount
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setAverageShortcutCountPerFolder:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_averageShortcutCountPerFolder = a3;
}

- (void)setHasAverageShortcutCountPerFolder:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasAverageShortcutCountPerFolder
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setUncategorizedShortcutCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_uncategorizedShortcutCount = a3;
}

- (void)setHasUncategorizedShortcutCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasUncategorizedShortcutCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setShortcutRunCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_shortcutRunCount = a3;
}

- (void)setHasShortcutRunCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasShortcutRunCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setAppSessionCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_appSessionCount = a3;
}

- (void)setHasAppSessionCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAppSessionCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setWatchShortcutCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_watchShortcutCount = a3;
}

- (void)setHasWatchShortcutCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasWatchShortcutCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setSleepShortcutsCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_sleepShortcutsCount = a3;
}

- (void)setHasSleepShortcutsCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasSleepShortcutsCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setNumberOfSmallWidgets:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_numberOfSmallWidgets = a3;
}

- (void)setHasNumberOfSmallWidgets:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasNumberOfSmallWidgets
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setNumberOfMediumWidgets:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_numberOfMediumWidgets = a3;
}

- (void)setHasNumberOfMediumWidgets:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasNumberOfMediumWidgets
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setNumberOfLargeWidgets:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_numberOfLargeWidgets = a3;
}

- (void)setHasNumberOfLargeWidgets:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasNumberOfLargeWidgets
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setNumberOfWidgetsOnHomeScreen:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_numberOfWidgetsOnHomeScreen = a3;
}

- (void)setHasNumberOfWidgetsOnHomeScreen:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasNumberOfWidgetsOnHomeScreen
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setNumberOfWidgetsOnLoL:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_numberOfWidgetsOnLoL = a3;
}

- (void)setHasNumberOfWidgetsOnLoL:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasNumberOfWidgetsOnLoL
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setNumberOfPersonalAutomationsEnabled:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_numberOfPersonalAutomationsEnabled = a3;
}

- (void)setHasNumberOfPersonalAutomationsEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasNumberOfPersonalAutomationsEnabled
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setNumberOfPersonalAutomationsFromSuggestionsEnabled:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_numberOfPersonalAutomationsFromSuggestionsEnabled = a3;
}

- (void)setHasNumberOfPersonalAutomationsFromSuggestionsEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasNumberOfPersonalAutomationsFromSuggestionsEnabled
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setNumberOfSuggestedAutomationsGenerated:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_numberOfSuggestedAutomationsGenerated = a3;
}

- (void)setHasNumberOfSuggestedAutomationsGenerated:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasNumberOfSuggestedAutomationsGenerated
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setNumberOfSuggestedAutomationsGeneratedUserAlreadyHas:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_numberOfSuggestedAutomationsGeneratedUserAlreadyHas = a3;
}

- (void)setHasNumberOfSuggestedAutomationsGeneratedUserAlreadyHas:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasNumberOfSuggestedAutomationsGeneratedUserAlreadyHas
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (BOOL)hasAutomationSuggestionsTrialIdentifier
{
  return self->_automationSuggestionsTrialIdentifier != 0;
}

- (void)setAutoShortcutsSectionsViewed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_autoShortcutsSectionsViewed = a3;
}

- (void)setHasAutoShortcutsSectionsViewed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasAutoShortcutsSectionsViewed
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setNumberOfRemoteWidgetsSetup:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_numberOfRemoteWidgetsSetup = a3;
}

- (void)setHasNumberOfRemoteWidgetsSetup:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasNumberOfRemoteWidgetsSetup
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setNumberOfLockScreenWidgets:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_numberOfLockScreenWidgets = a3;
}

- (void)setHasNumberOfLockScreenWidgets:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasNumberOfLockScreenWidgets
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setNumberOfExtraLargeWidgets:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_numberOfExtraLargeWidgets = a3;
}

- (void)setHasNumberOfExtraLargeWidgets:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasNumberOfExtraLargeWidgets
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setNumberOfSmallMultiShortcutWidgets:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_numberOfSmallMultiShortcutWidgets = a3;
}

- (void)setHasNumberOfSmallMultiShortcutWidgets:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($C78FFC96DE9D923BD21BCE108E8119F6)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasNumberOfSmallMultiShortcutWidgets
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)WFPBDailyStatusEvent;
  -[WFPBDailyStatusEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPBDailyStatusEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *key;
  $C78FFC96DE9D923BD21BCE108E8119F6 has;
  void *v7;
  NSString *automationSuggestionsTrialIdentifier;
  $C78FFC96DE9D923BD21BCE108E8119F6 v9;
  void *v10;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_installed);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("installed"));

    has = self->_has;
    if ((*(_DWORD *)&has & 0x8000000) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x4000000) == 0)
        goto LABEL_6;
      goto LABEL_39;
    }
  }
  else if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_sharingEnabled);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("sharingEnabled"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_7;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_personalAutomationsEnabled);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("personalAutomationsEnabled"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_8;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_homeAutomationsEnabled);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("homeAutomationsEnabled"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_9;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_shortcutComplicationSlotsUsed);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("shortcutComplicationSlotsUsed"));

  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_10;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_appComplicationSlotsUsed);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("appComplicationSlotsUsed"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_11;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_sleepEnabled);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("sleepEnabled"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_12;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_shortcutsCount);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("shortcutsCount"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_13;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_folderCount);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("folderCount"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_14;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_averageShortcutCountPerFolder);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("averageShortcutCountPerFolder"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_15;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_uncategorizedShortcutCount);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("uncategorizedShortcutCount"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_16;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_shortcutRunCount);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("shortcutRunCount"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_17;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_appSessionCount);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("appSessionCount"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_18;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_watchShortcutCount);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("watchShortcutCount"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_19;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_sleepShortcutsCount);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("sleepShortcutsCount"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_20;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfSmallWidgets);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("numberOfSmallWidgets"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfMediumWidgets);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("numberOfMediumWidgets"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_22;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfLargeWidgets);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("numberOfLargeWidgets"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_23;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfWidgetsOnHomeScreen);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("numberOfWidgetsOnHomeScreen"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_24;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfWidgetsOnLoL);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("numberOfWidgetsOnLoL"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_25;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfPersonalAutomationsEnabled);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("numberOfPersonalAutomationsEnabled"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_26;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfPersonalAutomationsFromSuggestionsEnabled);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("numberOfPersonalAutomationsFromSuggestionsEnabled"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_59:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfSuggestedAutomationsGenerated);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("numberOfSuggestedAutomationsGenerated"));

  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_27:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfSuggestedAutomationsGeneratedUserAlreadyHas);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("numberOfSuggestedAutomationsGeneratedUserAlreadyHas"));

  }
LABEL_28:
  automationSuggestionsTrialIdentifier = self->_automationSuggestionsTrialIdentifier;
  if (automationSuggestionsTrialIdentifier)
    objc_msgSend(v4, "setObject:forKey:", automationSuggestionsTrialIdentifier, CFSTR("automationSuggestionsTrialIdentifier"));
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x800000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_autoShortcutsSectionsViewed);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("autoShortcutsSectionsViewed"));

    v9 = self->_has;
    if ((*(_WORD *)&v9 & 0x400) == 0)
    {
LABEL_32:
      if ((*(_BYTE *)&v9 & 0x40) == 0)
        goto LABEL_33;
      goto LABEL_63;
    }
  }
  else if ((*(_WORD *)&v9 & 0x400) == 0)
  {
    goto LABEL_32;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfRemoteWidgetsSetup);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("numberOfRemoteWidgetsSetup"));

  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 0x40) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&v9 & 0x10) == 0)
      goto LABEL_34;
LABEL_64:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfExtraLargeWidgets);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("numberOfExtraLargeWidgets"));

    if ((*(_DWORD *)&self->_has & 0x800) == 0)
      return v4;
    goto LABEL_35;
  }
LABEL_63:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfLockScreenWidgets);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("numberOfLockScreenWidgets"));

  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 0x10) != 0)
    goto LABEL_64;
LABEL_34:
  if ((*(_WORD *)&v9 & 0x800) != 0)
  {
LABEL_35:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfSmallMultiShortcutWidgets);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("numberOfSmallMultiShortcutWidgets"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFPBDailyStatusEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $C78FFC96DE9D923BD21BCE108E8119F6 has;
  $C78FFC96DE9D923BD21BCE108E8119F6 v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v7;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x8000000) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x4000000) == 0)
        goto LABEL_6;
      goto LABEL_39;
    }
  }
  else if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  v4 = v7;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_7;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteBOOLField();
  v4 = v7;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_8;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteBOOLField();
  v4 = v7;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_9;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_10;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_11;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteBOOLField();
  v4 = v7;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_12;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_13;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_14;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_15;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_16;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_17;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_18;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_19;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_20;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_22;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_23;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_24;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_25;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_26;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_59:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_27:
    PBDataWriterWriteUint32Field();
    v4 = v7;
  }
LABEL_28:
  if (self->_automationSuggestionsTrialIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x800000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v7;
    v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x400) == 0)
    {
LABEL_32:
      if ((*(_BYTE *)&v6 & 0x40) == 0)
        goto LABEL_33;
      goto LABEL_63;
    }
  }
  else if ((*(_WORD *)&v6 & 0x400) == 0)
  {
    goto LABEL_32;
  }
  PBDataWriterWriteUint32Field();
  v4 = v7;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x40) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&v6 & 0x10) == 0)
      goto LABEL_34;
LABEL_64:
    PBDataWriterWriteUint32Field();
    v4 = v7;
    if ((*(_DWORD *)&self->_has & 0x800) == 0)
      goto LABEL_36;
    goto LABEL_35;
  }
LABEL_63:
  PBDataWriterWriteUint32Field();
  v4 = v7;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x10) != 0)
    goto LABEL_64;
LABEL_34:
  if ((*(_WORD *)&v6 & 0x800) != 0)
  {
LABEL_35:
    PBDataWriterWriteUint32Field();
    v4 = v7;
  }
LABEL_36:

}

- (void)copyTo:(id)a3
{
  id v4;
  $C78FFC96DE9D923BD21BCE108E8119F6 has;
  $C78FFC96DE9D923BD21BCE108E8119F6 v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    v4 = v7;
  }
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    *((_BYTE *)v4 + 118) = self->_installed;
    *((_DWORD *)v4 + 31) |= 0x2000000u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x8000000) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x4000000) == 0)
        goto LABEL_6;
      goto LABEL_39;
    }
  }
  else if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
    goto LABEL_5;
  }
  *((_BYTE *)v4 + 120) = self->_sharingEnabled;
  *((_DWORD *)v4 + 31) |= 0x8000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_7;
    goto LABEL_40;
  }
LABEL_39:
  *((_BYTE *)v4 + 119) = self->_personalAutomationsEnabled;
  *((_DWORD *)v4 + 31) |= 0x4000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_8;
    goto LABEL_41;
  }
LABEL_40:
  *((_BYTE *)v4 + 117) = self->_homeAutomationsEnabled;
  *((_DWORD *)v4 + 31) |= 0x1000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_9;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v4 + 23) = self->_shortcutComplicationSlotsUsed;
  *((_DWORD *)v4 + 31) |= 0x20000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_10;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v4 + 2) = self->_appComplicationSlotsUsed;
  *((_DWORD *)v4 + 31) |= 1u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_11;
    goto LABEL_44;
  }
LABEL_43:
  *((_BYTE *)v4 + 121) = self->_sleepEnabled;
  *((_DWORD *)v4 + 31) |= 0x10000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_12;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v4 + 25) = self->_shortcutsCount;
  *((_DWORD *)v4 + 31) |= 0x80000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_13;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v4 + 7) = self->_folderCount;
  *((_DWORD *)v4 + 31) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_14;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v4 + 6) = self->_averageShortcutCountPerFolder;
  *((_DWORD *)v4 + 31) |= 4u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_15;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v4 + 27) = self->_uncategorizedShortcutCount;
  *((_DWORD *)v4 + 31) |= 0x200000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_16;
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)v4 + 24) = self->_shortcutRunCount;
  *((_DWORD *)v4 + 31) |= 0x40000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_17;
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)v4 + 3) = self->_appSessionCount;
  *((_DWORD *)v4 + 31) |= 2u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_18;
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v4 + 28) = self->_watchShortcutCount;
  *((_DWORD *)v4 + 31) |= 0x400000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_19;
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)v4 + 26) = self->_sleepShortcutsCount;
  *((_DWORD *)v4 + 31) |= 0x100000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_20;
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)v4 + 18) = self->_numberOfSmallWidgets;
  *((_DWORD *)v4 + 31) |= 0x1000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)v4 + 13) = self->_numberOfMediumWidgets;
  *((_DWORD *)v4 + 31) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_22;
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)v4 + 11) = self->_numberOfLargeWidgets;
  *((_DWORD *)v4 + 31) |= 0x20u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_23;
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)v4 + 21) = self->_numberOfWidgetsOnHomeScreen;
  *((_DWORD *)v4 + 31) |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_24;
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)v4 + 22) = self->_numberOfWidgetsOnLoL;
  *((_DWORD *)v4 + 31) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_25;
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)v4 + 14) = self->_numberOfPersonalAutomationsEnabled;
  *((_DWORD *)v4 + 31) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_26;
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)v4 + 15) = self->_numberOfPersonalAutomationsFromSuggestionsEnabled;
  *((_DWORD *)v4 + 31) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_59:
  *((_DWORD *)v4 + 19) = self->_numberOfSuggestedAutomationsGenerated;
  *((_DWORD *)v4 + 31) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_27:
    *((_DWORD *)v4 + 20) = self->_numberOfSuggestedAutomationsGeneratedUserAlreadyHas;
    *((_DWORD *)v4 + 31) |= 0x4000u;
  }
LABEL_28:
  if (self->_automationSuggestionsTrialIdentifier)
  {
    objc_msgSend(v7, "setAutomationSuggestionsTrialIdentifier:");
    v4 = v7;
  }
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x800000) != 0)
  {
    *((_BYTE *)v4 + 116) = self->_autoShortcutsSectionsViewed;
    *((_DWORD *)v4 + 31) |= 0x800000u;
    v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x400) == 0)
    {
LABEL_32:
      if ((*(_BYTE *)&v6 & 0x40) == 0)
        goto LABEL_33;
      goto LABEL_63;
    }
  }
  else if ((*(_WORD *)&v6 & 0x400) == 0)
  {
    goto LABEL_32;
  }
  *((_DWORD *)v4 + 16) = self->_numberOfRemoteWidgetsSetup;
  *((_DWORD *)v4 + 31) |= 0x400u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x40) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&v6 & 0x10) == 0)
      goto LABEL_34;
LABEL_64:
    *((_DWORD *)v4 + 10) = self->_numberOfExtraLargeWidgets;
    *((_DWORD *)v4 + 31) |= 0x10u;
    if ((*(_DWORD *)&self->_has & 0x800) == 0)
      goto LABEL_36;
    goto LABEL_35;
  }
LABEL_63:
  *((_DWORD *)v4 + 12) = self->_numberOfLockScreenWidgets;
  *((_DWORD *)v4 + 31) |= 0x40u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x10) != 0)
    goto LABEL_64;
LABEL_34:
  if ((*(_WORD *)&v6 & 0x800) != 0)
  {
LABEL_35:
    *((_DWORD *)v4 + 17) = self->_numberOfSmallMultiShortcutWidgets;
    *((_DWORD *)v4 + 31) |= 0x800u;
  }
LABEL_36:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  $C78FFC96DE9D923BD21BCE108E8119F6 has;
  uint64_t v9;
  void *v10;
  $C78FFC96DE9D923BD21BCE108E8119F6 v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    *(_BYTE *)(v5 + 118) = self->_installed;
    *(_DWORD *)(v5 + 124) |= 0x2000000u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x8000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x4000000) == 0)
        goto LABEL_4;
      goto LABEL_35;
    }
  }
  else if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 120) = self->_sharingEnabled;
  *(_DWORD *)(v5 + 124) |= 0x8000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_5;
    goto LABEL_36;
  }
LABEL_35:
  *(_BYTE *)(v5 + 119) = self->_personalAutomationsEnabled;
  *(_DWORD *)(v5 + 124) |= 0x4000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_6;
    goto LABEL_37;
  }
LABEL_36:
  *(_BYTE *)(v5 + 117) = self->_homeAutomationsEnabled;
  *(_DWORD *)(v5 + 124) |= 0x1000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_7;
    goto LABEL_38;
  }
LABEL_37:
  *(_DWORD *)(v5 + 92) = self->_shortcutComplicationSlotsUsed;
  *(_DWORD *)(v5 + 124) |= 0x20000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x10000000) == 0)
      goto LABEL_8;
    goto LABEL_39;
  }
LABEL_38:
  *(_DWORD *)(v5 + 8) = self->_appComplicationSlotsUsed;
  *(_DWORD *)(v5 + 124) |= 1u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_9;
    goto LABEL_40;
  }
LABEL_39:
  *(_BYTE *)(v5 + 121) = self->_sleepEnabled;
  *(_DWORD *)(v5 + 124) |= 0x10000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_10;
    goto LABEL_41;
  }
LABEL_40:
  *(_DWORD *)(v5 + 100) = self->_shortcutsCount;
  *(_DWORD *)(v5 + 124) |= 0x80000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_11;
    goto LABEL_42;
  }
LABEL_41:
  *(_DWORD *)(v5 + 28) = self->_folderCount;
  *(_DWORD *)(v5 + 124) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_12;
    goto LABEL_43;
  }
LABEL_42:
  *(_DWORD *)(v5 + 24) = self->_averageShortcutCountPerFolder;
  *(_DWORD *)(v5 + 124) |= 4u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_13;
    goto LABEL_44;
  }
LABEL_43:
  *(_DWORD *)(v5 + 108) = self->_uncategorizedShortcutCount;
  *(_DWORD *)(v5 + 124) |= 0x200000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_14;
    goto LABEL_45;
  }
LABEL_44:
  *(_DWORD *)(v5 + 96) = self->_shortcutRunCount;
  *(_DWORD *)(v5 + 124) |= 0x40000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_15;
    goto LABEL_46;
  }
LABEL_45:
  *(_DWORD *)(v5 + 12) = self->_appSessionCount;
  *(_DWORD *)(v5 + 124) |= 2u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_16;
    goto LABEL_47;
  }
LABEL_46:
  *(_DWORD *)(v5 + 112) = self->_watchShortcutCount;
  *(_DWORD *)(v5 + 124) |= 0x400000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_17;
    goto LABEL_48;
  }
LABEL_47:
  *(_DWORD *)(v5 + 104) = self->_sleepShortcutsCount;
  *(_DWORD *)(v5 + 124) |= 0x100000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_18;
    goto LABEL_49;
  }
LABEL_48:
  *(_DWORD *)(v5 + 72) = self->_numberOfSmallWidgets;
  *(_DWORD *)(v5 + 124) |= 0x1000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_19;
    goto LABEL_50;
  }
LABEL_49:
  *(_DWORD *)(v5 + 52) = self->_numberOfMediumWidgets;
  *(_DWORD *)(v5 + 124) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_20;
    goto LABEL_51;
  }
LABEL_50:
  *(_DWORD *)(v5 + 44) = self->_numberOfLargeWidgets;
  *(_DWORD *)(v5 + 124) |= 0x20u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_21;
    goto LABEL_52;
  }
LABEL_51:
  *(_DWORD *)(v5 + 84) = self->_numberOfWidgetsOnHomeScreen;
  *(_DWORD *)(v5 + 124) |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_22;
    goto LABEL_53;
  }
LABEL_52:
  *(_DWORD *)(v5 + 88) = self->_numberOfWidgetsOnLoL;
  *(_DWORD *)(v5 + 124) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_23;
    goto LABEL_54;
  }
LABEL_53:
  *(_DWORD *)(v5 + 56) = self->_numberOfPersonalAutomationsEnabled;
  *(_DWORD *)(v5 + 124) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_24;
    goto LABEL_55;
  }
LABEL_54:
  *(_DWORD *)(v5 + 60) = self->_numberOfPersonalAutomationsFromSuggestionsEnabled;
  *(_DWORD *)(v5 + 124) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_55:
  *(_DWORD *)(v5 + 76) = self->_numberOfSuggestedAutomationsGenerated;
  *(_DWORD *)(v5 + 124) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_25:
    *(_DWORD *)(v5 + 80) = self->_numberOfSuggestedAutomationsGeneratedUserAlreadyHas;
    *(_DWORD *)(v5 + 124) |= 0x4000u;
  }
LABEL_26:
  v9 = -[NSString copyWithZone:](self->_automationSuggestionsTrialIdentifier, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v9;

  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x800000) != 0)
  {
    *(_BYTE *)(v5 + 116) = self->_autoShortcutsSectionsViewed;
    *(_DWORD *)(v5 + 124) |= 0x800000u;
    v11 = self->_has;
    if ((*(_WORD *)&v11 & 0x400) == 0)
    {
LABEL_28:
      if ((*(_BYTE *)&v11 & 0x40) == 0)
        goto LABEL_29;
      goto LABEL_59;
    }
  }
  else if ((*(_WORD *)&v11 & 0x400) == 0)
  {
    goto LABEL_28;
  }
  *(_DWORD *)(v5 + 64) = self->_numberOfRemoteWidgetsSetup;
  *(_DWORD *)(v5 + 124) |= 0x400u;
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 0x40) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&v11 & 0x10) == 0)
      goto LABEL_30;
LABEL_60:
    *(_DWORD *)(v5 + 40) = self->_numberOfExtraLargeWidgets;
    *(_DWORD *)(v5 + 124) |= 0x10u;
    if ((*(_DWORD *)&self->_has & 0x800) == 0)
      return (id)v5;
    goto LABEL_31;
  }
LABEL_59:
  *(_DWORD *)(v5 + 48) = self->_numberOfLockScreenWidgets;
  *(_DWORD *)(v5 + 124) |= 0x40u;
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 0x10) != 0)
    goto LABEL_60;
LABEL_30:
  if ((*(_WORD *)&v11 & 0x800) != 0)
  {
LABEL_31:
    *(_DWORD *)(v5 + 68) = self->_numberOfSmallMultiShortcutWidgets;
    *(_DWORD *)(v5 + 124) |= 0x800u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *key;
  $C78FFC96DE9D923BD21BCE108E8119F6 has;
  int v7;
  NSString *automationSuggestionsTrialIdentifier;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_170;
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_170;
  }
  has = self->_has;
  v7 = *((_DWORD *)v4 + 31);
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v7 & 0x2000000) == 0)
      goto LABEL_170;
    if (self->_installed)
    {
      if (!*((_BYTE *)v4 + 118))
        goto LABEL_170;
    }
    else if (*((_BYTE *)v4 + 118))
    {
      goto LABEL_170;
    }
  }
  else if ((v7 & 0x2000000) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v7 & 0x8000000) == 0)
      goto LABEL_170;
    if (self->_sharingEnabled)
    {
      if (!*((_BYTE *)v4 + 120))
        goto LABEL_170;
    }
    else if (*((_BYTE *)v4 + 120))
    {
      goto LABEL_170;
    }
  }
  else if ((v7 & 0x8000000) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v7 & 0x4000000) == 0)
      goto LABEL_170;
    if (self->_personalAutomationsEnabled)
    {
      if (!*((_BYTE *)v4 + 119))
        goto LABEL_170;
    }
    else if (*((_BYTE *)v4 + 119))
    {
      goto LABEL_170;
    }
  }
  else if ((v7 & 0x4000000) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v7 & 0x1000000) == 0)
      goto LABEL_170;
    if (self->_homeAutomationsEnabled)
    {
      if (!*((_BYTE *)v4 + 117))
        goto LABEL_170;
    }
    else if (*((_BYTE *)v4 + 117))
    {
      goto LABEL_170;
    }
  }
  else if ((v7 & 0x1000000) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0 || self->_shortcutComplicationSlotsUsed != *((_DWORD *)v4 + 23))
      goto LABEL_170;
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_appComplicationSlotsUsed != *((_DWORD *)v4 + 2))
      goto LABEL_170;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v7 & 0x10000000) == 0)
      goto LABEL_170;
    if (self->_sleepEnabled)
    {
      if (!*((_BYTE *)v4 + 121))
        goto LABEL_170;
    }
    else if (*((_BYTE *)v4 + 121))
    {
      goto LABEL_170;
    }
  }
  else if ((v7 & 0x10000000) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v7 & 0x80000) == 0 || self->_shortcutsCount != *((_DWORD *)v4 + 25))
      goto LABEL_170;
  }
  else if ((v7 & 0x80000) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_folderCount != *((_DWORD *)v4 + 7))
      goto LABEL_170;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_averageShortcutCountPerFolder != *((_DWORD *)v4 + 6))
      goto LABEL_170;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v7 & 0x200000) == 0 || self->_uncategorizedShortcutCount != *((_DWORD *)v4 + 27))
      goto LABEL_170;
  }
  else if ((v7 & 0x200000) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_shortcutRunCount != *((_DWORD *)v4 + 24))
      goto LABEL_170;
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_appSessionCount != *((_DWORD *)v4 + 3))
      goto LABEL_170;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v7 & 0x400000) == 0 || self->_watchShortcutCount != *((_DWORD *)v4 + 28))
      goto LABEL_170;
  }
  else if ((v7 & 0x400000) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v7 & 0x100000) == 0 || self->_sleepShortcutsCount != *((_DWORD *)v4 + 26))
      goto LABEL_170;
  }
  else if ((v7 & 0x100000) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_numberOfSmallWidgets != *((_DWORD *)v4 + 18))
      goto LABEL_170;
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_numberOfMediumWidgets != *((_DWORD *)v4 + 13))
      goto LABEL_170;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_numberOfLargeWidgets != *((_DWORD *)v4 + 11))
      goto LABEL_170;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_numberOfWidgetsOnHomeScreen != *((_DWORD *)v4 + 21))
      goto LABEL_170;
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_numberOfWidgetsOnLoL != *((_DWORD *)v4 + 22))
      goto LABEL_170;
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_numberOfPersonalAutomationsEnabled != *((_DWORD *)v4 + 14))
      goto LABEL_170;
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_numberOfPersonalAutomationsFromSuggestionsEnabled != *((_DWORD *)v4 + 15))
      goto LABEL_170;
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_numberOfSuggestedAutomationsGenerated != *((_DWORD *)v4 + 19))
      goto LABEL_170;
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_numberOfSuggestedAutomationsGeneratedUserAlreadyHas != *((_DWORD *)v4 + 20))
      goto LABEL_170;
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_170;
  }
  automationSuggestionsTrialIdentifier = self->_automationSuggestionsTrialIdentifier;
  if ((unint64_t)automationSuggestionsTrialIdentifier | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](automationSuggestionsTrialIdentifier, "isEqual:"))
      goto LABEL_170;
    has = self->_has;
    v7 = *((_DWORD *)v4 + 31);
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v7 & 0x800000) != 0)
    {
      if (self->_autoShortcutsSectionsViewed)
      {
        if (!*((_BYTE *)v4 + 116))
          goto LABEL_170;
        goto LABEL_150;
      }
      if (!*((_BYTE *)v4 + 116))
        goto LABEL_150;
    }
LABEL_170:
    v9 = 0;
    goto LABEL_171;
  }
  if ((v7 & 0x800000) != 0)
    goto LABEL_170;
LABEL_150:
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_numberOfRemoteWidgetsSetup != *((_DWORD *)v4 + 16))
      goto LABEL_170;
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_numberOfLockScreenWidgets != *((_DWORD *)v4 + 12))
      goto LABEL_170;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_numberOfExtraLargeWidgets != *((_DWORD *)v4 + 10))
      goto LABEL_170;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_170;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_numberOfSmallMultiShortcutWidgets != *((_DWORD *)v4 + 17))
      goto LABEL_170;
    v9 = 1;
  }
  else
  {
    v9 = (v7 & 0x800) == 0;
  }
LABEL_171:

  return v9;
}

- (unint64_t)hash
{
  $C78FFC96DE9D923BD21BCE108E8119F6 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  $C78FFC96DE9D923BD21BCE108E8119F6 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSUInteger v37;

  v37 = -[NSString hash](self->_key, "hash");
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    v36 = 2654435761 * self->_installed;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
    {
LABEL_3:
      v35 = 2654435761 * self->_sharingEnabled;
      if ((*(_DWORD *)&has & 0x4000000) != 0)
        goto LABEL_4;
      goto LABEL_28;
    }
  }
  else
  {
    v36 = 0;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
      goto LABEL_3;
  }
  v35 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_4:
    v34 = 2654435761 * self->_personalAutomationsEnabled;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
      goto LABEL_5;
    goto LABEL_29;
  }
LABEL_28:
  v34 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_5:
    v33 = 2654435761 * self->_homeAutomationsEnabled;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_6;
    goto LABEL_30;
  }
LABEL_29:
  v33 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_6:
    v32 = 2654435761 * self->_shortcutComplicationSlotsUsed;
    if ((*(_BYTE *)&has & 1) != 0)
      goto LABEL_7;
    goto LABEL_31;
  }
LABEL_30:
  v32 = 0;
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_7:
    v31 = 2654435761 * self->_appComplicationSlotsUsed;
    if ((*(_DWORD *)&has & 0x10000000) != 0)
      goto LABEL_8;
    goto LABEL_32;
  }
LABEL_31:
  v31 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_8:
    v30 = 2654435761 * self->_sleepEnabled;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_9;
    goto LABEL_33;
  }
LABEL_32:
  v30 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_9:
    v29 = 2654435761 * self->_shortcutsCount;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_10;
    goto LABEL_34;
  }
LABEL_33:
  v29 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_10:
    v28 = 2654435761 * self->_folderCount;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_11;
    goto LABEL_35;
  }
LABEL_34:
  v28 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_11:
    v27 = 2654435761 * self->_averageShortcutCountPerFolder;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_12;
    goto LABEL_36;
  }
LABEL_35:
  v27 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_12:
    v26 = 2654435761 * self->_uncategorizedShortcutCount;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_13;
    goto LABEL_37;
  }
LABEL_36:
  v26 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_13:
    v25 = 2654435761 * self->_shortcutRunCount;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_14;
    goto LABEL_38;
  }
LABEL_37:
  v25 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_14:
    v24 = 2654435761 * self->_appSessionCount;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_15;
    goto LABEL_39;
  }
LABEL_38:
  v24 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_15:
    v23 = 2654435761 * self->_watchShortcutCount;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_16;
    goto LABEL_40;
  }
LABEL_39:
  v23 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_16:
    v22 = 2654435761 * self->_sleepShortcutsCount;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_17;
    goto LABEL_41;
  }
LABEL_40:
  v22 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_17:
    v20 = 2654435761 * self->_numberOfSmallWidgets;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_18;
    goto LABEL_42;
  }
LABEL_41:
  v20 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_18:
    v4 = 2654435761 * self->_numberOfMediumWidgets;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_19;
    goto LABEL_43;
  }
LABEL_42:
  v4 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_19:
    v5 = 2654435761 * self->_numberOfLargeWidgets;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_20;
    goto LABEL_44;
  }
LABEL_43:
  v5 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_20:
    v6 = 2654435761 * self->_numberOfWidgetsOnHomeScreen;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_21;
    goto LABEL_45;
  }
LABEL_44:
  v6 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_21:
    v7 = 2654435761 * self->_numberOfWidgetsOnLoL;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_22;
    goto LABEL_46;
  }
LABEL_45:
  v7 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_22:
    v8 = 2654435761 * self->_numberOfPersonalAutomationsEnabled;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_23;
    goto LABEL_47;
  }
LABEL_46:
  v8 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_23:
    v9 = 2654435761 * self->_numberOfPersonalAutomationsFromSuggestionsEnabled;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_24;
LABEL_48:
    v10 = 0;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_25;
    goto LABEL_49;
  }
LABEL_47:
  v9 = 0;
  if ((*(_WORD *)&has & 0x2000) == 0)
    goto LABEL_48;
LABEL_24:
  v10 = 2654435761 * self->_numberOfSuggestedAutomationsGenerated;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_25:
    v11 = 2654435761 * self->_numberOfSuggestedAutomationsGeneratedUserAlreadyHas;
    goto LABEL_50;
  }
LABEL_49:
  v11 = 0;
LABEL_50:
  v12 = -[NSString hash](self->_automationSuggestionsTrialIdentifier, "hash", v20);
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x800000) != 0)
  {
    v14 = 2654435761 * self->_autoShortcutsSectionsViewed;
    if ((*(_WORD *)&v13 & 0x400) != 0)
    {
LABEL_52:
      v15 = 2654435761 * self->_numberOfRemoteWidgetsSetup;
      if ((*(_BYTE *)&v13 & 0x40) != 0)
        goto LABEL_53;
      goto LABEL_58;
    }
  }
  else
  {
    v14 = 0;
    if ((*(_WORD *)&v13 & 0x400) != 0)
      goto LABEL_52;
  }
  v15 = 0;
  if ((*(_BYTE *)&v13 & 0x40) != 0)
  {
LABEL_53:
    v16 = 2654435761 * self->_numberOfLockScreenWidgets;
    if ((*(_BYTE *)&v13 & 0x10) != 0)
      goto LABEL_54;
LABEL_59:
    v17 = 0;
    if ((*(_WORD *)&v13 & 0x800) != 0)
      goto LABEL_55;
LABEL_60:
    v18 = 0;
    return v36 ^ v37 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
  }
LABEL_58:
  v16 = 0;
  if ((*(_BYTE *)&v13 & 0x10) == 0)
    goto LABEL_59;
LABEL_54:
  v17 = 2654435761 * self->_numberOfExtraLargeWidgets;
  if ((*(_WORD *)&v13 & 0x800) == 0)
    goto LABEL_60;
LABEL_55:
  v18 = 2654435761 * self->_numberOfSmallMultiShortcutWidgets;
  return v36 ^ v37 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;
  int v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[WFPBDailyStatusEvent setKey:](self, "setKey:");
    v4 = v7;
  }
  v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x2000000) != 0)
  {
    self->_installed = *((_BYTE *)v4 + 118);
    *(_DWORD *)&self->_has |= 0x2000000u;
    v5 = *((_DWORD *)v4 + 31);
    if ((v5 & 0x8000000) == 0)
    {
LABEL_5:
      if ((v5 & 0x4000000) == 0)
        goto LABEL_6;
      goto LABEL_39;
    }
  }
  else if ((v5 & 0x8000000) == 0)
  {
    goto LABEL_5;
  }
  self->_sharingEnabled = *((_BYTE *)v4 + 120);
  *(_DWORD *)&self->_has |= 0x8000000u;
  v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_6:
    if ((v5 & 0x1000000) == 0)
      goto LABEL_7;
    goto LABEL_40;
  }
LABEL_39:
  self->_personalAutomationsEnabled = *((_BYTE *)v4 + 119);
  *(_DWORD *)&self->_has |= 0x4000000u;
  v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_7:
    if ((v5 & 0x20000) == 0)
      goto LABEL_8;
    goto LABEL_41;
  }
LABEL_40:
  self->_homeAutomationsEnabled = *((_BYTE *)v4 + 117);
  *(_DWORD *)&self->_has |= 0x1000000u;
  v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x20000) == 0)
  {
LABEL_8:
    if ((v5 & 1) == 0)
      goto LABEL_9;
    goto LABEL_42;
  }
LABEL_41:
  self->_shortcutComplicationSlotsUsed = *((_DWORD *)v4 + 23);
  *(_DWORD *)&self->_has |= 0x20000u;
  v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 1) == 0)
  {
LABEL_9:
    if ((v5 & 0x10000000) == 0)
      goto LABEL_10;
    goto LABEL_43;
  }
LABEL_42:
  self->_appComplicationSlotsUsed = *((_DWORD *)v4 + 2);
  *(_DWORD *)&self->_has |= 1u;
  v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x10000000) == 0)
  {
LABEL_10:
    if ((v5 & 0x80000) == 0)
      goto LABEL_11;
    goto LABEL_44;
  }
LABEL_43:
  self->_sleepEnabled = *((_BYTE *)v4 + 121);
  *(_DWORD *)&self->_has |= 0x10000000u;
  v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x80000) == 0)
  {
LABEL_11:
    if ((v5 & 8) == 0)
      goto LABEL_12;
    goto LABEL_45;
  }
LABEL_44:
  self->_shortcutsCount = *((_DWORD *)v4 + 25);
  *(_DWORD *)&self->_has |= 0x80000u;
  v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 8) == 0)
  {
LABEL_12:
    if ((v5 & 4) == 0)
      goto LABEL_13;
    goto LABEL_46;
  }
LABEL_45:
  self->_folderCount = *((_DWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 8u;
  v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 4) == 0)
  {
LABEL_13:
    if ((v5 & 0x200000) == 0)
      goto LABEL_14;
    goto LABEL_47;
  }
LABEL_46:
  self->_averageShortcutCountPerFolder = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 4u;
  v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x200000) == 0)
  {
LABEL_14:
    if ((v5 & 0x40000) == 0)
      goto LABEL_15;
    goto LABEL_48;
  }
LABEL_47:
  self->_uncategorizedShortcutCount = *((_DWORD *)v4 + 27);
  *(_DWORD *)&self->_has |= 0x200000u;
  v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x40000) == 0)
  {
LABEL_15:
    if ((v5 & 2) == 0)
      goto LABEL_16;
    goto LABEL_49;
  }
LABEL_48:
  self->_shortcutRunCount = *((_DWORD *)v4 + 24);
  *(_DWORD *)&self->_has |= 0x40000u;
  v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 2) == 0)
  {
LABEL_16:
    if ((v5 & 0x400000) == 0)
      goto LABEL_17;
    goto LABEL_50;
  }
LABEL_49:
  self->_appSessionCount = *((_DWORD *)v4 + 3);
  *(_DWORD *)&self->_has |= 2u;
  v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x400000) == 0)
  {
LABEL_17:
    if ((v5 & 0x100000) == 0)
      goto LABEL_18;
    goto LABEL_51;
  }
LABEL_50:
  self->_watchShortcutCount = *((_DWORD *)v4 + 28);
  *(_DWORD *)&self->_has |= 0x400000u;
  v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x100000) == 0)
  {
LABEL_18:
    if ((v5 & 0x1000) == 0)
      goto LABEL_19;
    goto LABEL_52;
  }
LABEL_51:
  self->_sleepShortcutsCount = *((_DWORD *)v4 + 26);
  *(_DWORD *)&self->_has |= 0x100000u;
  v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x1000) == 0)
  {
LABEL_19:
    if ((v5 & 0x80) == 0)
      goto LABEL_20;
    goto LABEL_53;
  }
LABEL_52:
  self->_numberOfSmallWidgets = *((_DWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x1000u;
  v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x80) == 0)
  {
LABEL_20:
    if ((v5 & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_54;
  }
LABEL_53:
  self->_numberOfMediumWidgets = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x80u;
  v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x20) == 0)
  {
LABEL_21:
    if ((v5 & 0x8000) == 0)
      goto LABEL_22;
    goto LABEL_55;
  }
LABEL_54:
  self->_numberOfLargeWidgets = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x20u;
  v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x8000) == 0)
  {
LABEL_22:
    if ((v5 & 0x10000) == 0)
      goto LABEL_23;
    goto LABEL_56;
  }
LABEL_55:
  self->_numberOfWidgetsOnHomeScreen = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x8000u;
  v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x10000) == 0)
  {
LABEL_23:
    if ((v5 & 0x100) == 0)
      goto LABEL_24;
    goto LABEL_57;
  }
LABEL_56:
  self->_numberOfWidgetsOnLoL = *((_DWORD *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x10000u;
  v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x100) == 0)
  {
LABEL_24:
    if ((v5 & 0x200) == 0)
      goto LABEL_25;
    goto LABEL_58;
  }
LABEL_57:
  self->_numberOfPersonalAutomationsEnabled = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x100u;
  v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x200) == 0)
  {
LABEL_25:
    if ((v5 & 0x2000) == 0)
      goto LABEL_26;
    goto LABEL_59;
  }
LABEL_58:
  self->_numberOfPersonalAutomationsFromSuggestionsEnabled = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x200u;
  v5 = *((_DWORD *)v4 + 31);
  if ((v5 & 0x2000) == 0)
  {
LABEL_26:
    if ((v5 & 0x4000) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_59:
  self->_numberOfSuggestedAutomationsGenerated = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x2000u;
  if ((*((_DWORD *)v4 + 31) & 0x4000) != 0)
  {
LABEL_27:
    self->_numberOfSuggestedAutomationsGeneratedUserAlreadyHas = *((_DWORD *)v4 + 20);
    *(_DWORD *)&self->_has |= 0x4000u;
  }
LABEL_28:
  if (*((_QWORD *)v4 + 2))
  {
    -[WFPBDailyStatusEvent setAutomationSuggestionsTrialIdentifier:](self, "setAutomationSuggestionsTrialIdentifier:");
    v4 = v7;
  }
  v6 = *((_DWORD *)v4 + 31);
  if ((v6 & 0x800000) != 0)
  {
    self->_autoShortcutsSectionsViewed = *((_BYTE *)v4 + 116);
    *(_DWORD *)&self->_has |= 0x800000u;
    v6 = *((_DWORD *)v4 + 31);
    if ((v6 & 0x400) == 0)
    {
LABEL_32:
      if ((v6 & 0x40) == 0)
        goto LABEL_33;
      goto LABEL_63;
    }
  }
  else if ((v6 & 0x400) == 0)
  {
    goto LABEL_32;
  }
  self->_numberOfRemoteWidgetsSetup = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x400u;
  v6 = *((_DWORD *)v4 + 31);
  if ((v6 & 0x40) == 0)
  {
LABEL_33:
    if ((v6 & 0x10) == 0)
      goto LABEL_34;
LABEL_64:
    self->_numberOfExtraLargeWidgets = *((_DWORD *)v4 + 10);
    *(_DWORD *)&self->_has |= 0x10u;
    if ((*((_DWORD *)v4 + 31) & 0x800) == 0)
      goto LABEL_36;
    goto LABEL_35;
  }
LABEL_63:
  self->_numberOfLockScreenWidgets = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x40u;
  v6 = *((_DWORD *)v4 + 31);
  if ((v6 & 0x10) != 0)
    goto LABEL_64;
LABEL_34:
  if ((v6 & 0x800) != 0)
  {
LABEL_35:
    self->_numberOfSmallMultiShortcutWidgets = *((_DWORD *)v4 + 17);
    *(_DWORD *)&self->_has |= 0x800u;
  }
LABEL_36:

}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (BOOL)installed
{
  return self->_installed;
}

- (BOOL)sharingEnabled
{
  return self->_sharingEnabled;
}

- (BOOL)personalAutomationsEnabled
{
  return self->_personalAutomationsEnabled;
}

- (BOOL)homeAutomationsEnabled
{
  return self->_homeAutomationsEnabled;
}

- (unsigned)shortcutComplicationSlotsUsed
{
  return self->_shortcutComplicationSlotsUsed;
}

- (unsigned)appComplicationSlotsUsed
{
  return self->_appComplicationSlotsUsed;
}

- (BOOL)sleepEnabled
{
  return self->_sleepEnabled;
}

- (unsigned)shortcutsCount
{
  return self->_shortcutsCount;
}

- (unsigned)folderCount
{
  return self->_folderCount;
}

- (unsigned)averageShortcutCountPerFolder
{
  return self->_averageShortcutCountPerFolder;
}

- (unsigned)uncategorizedShortcutCount
{
  return self->_uncategorizedShortcutCount;
}

- (unsigned)shortcutRunCount
{
  return self->_shortcutRunCount;
}

- (unsigned)appSessionCount
{
  return self->_appSessionCount;
}

- (unsigned)watchShortcutCount
{
  return self->_watchShortcutCount;
}

- (unsigned)sleepShortcutsCount
{
  return self->_sleepShortcutsCount;
}

- (unsigned)numberOfSmallWidgets
{
  return self->_numberOfSmallWidgets;
}

- (unsigned)numberOfMediumWidgets
{
  return self->_numberOfMediumWidgets;
}

- (unsigned)numberOfLargeWidgets
{
  return self->_numberOfLargeWidgets;
}

- (unsigned)numberOfWidgetsOnHomeScreen
{
  return self->_numberOfWidgetsOnHomeScreen;
}

- (unsigned)numberOfWidgetsOnLoL
{
  return self->_numberOfWidgetsOnLoL;
}

- (unsigned)numberOfPersonalAutomationsEnabled
{
  return self->_numberOfPersonalAutomationsEnabled;
}

- (unsigned)numberOfPersonalAutomationsFromSuggestionsEnabled
{
  return self->_numberOfPersonalAutomationsFromSuggestionsEnabled;
}

- (unsigned)numberOfSuggestedAutomationsGenerated
{
  return self->_numberOfSuggestedAutomationsGenerated;
}

- (unsigned)numberOfSuggestedAutomationsGeneratedUserAlreadyHas
{
  return self->_numberOfSuggestedAutomationsGeneratedUserAlreadyHas;
}

- (NSString)automationSuggestionsTrialIdentifier
{
  return self->_automationSuggestionsTrialIdentifier;
}

- (void)setAutomationSuggestionsTrialIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_automationSuggestionsTrialIdentifier, a3);
}

- (BOOL)autoShortcutsSectionsViewed
{
  return self->_autoShortcutsSectionsViewed;
}

- (unsigned)numberOfRemoteWidgetsSetup
{
  return self->_numberOfRemoteWidgetsSetup;
}

- (unsigned)numberOfLockScreenWidgets
{
  return self->_numberOfLockScreenWidgets;
}

- (unsigned)numberOfExtraLargeWidgets
{
  return self->_numberOfExtraLargeWidgets;
}

- (unsigned)numberOfSmallMultiShortcutWidgets
{
  return self->_numberOfSmallMultiShortcutWidgets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_automationSuggestionsTrialIdentifier, 0);
}

@end
