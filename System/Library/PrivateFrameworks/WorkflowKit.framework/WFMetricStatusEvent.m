@implementation WFMetricStatusEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)installed
{
  return self->_installed;
}

- (void)setInstalled:(BOOL)a3
{
  self->_installed = a3;
}

- (BOOL)sharingEnabled
{
  return self->_sharingEnabled;
}

- (void)setSharingEnabled:(BOOL)a3
{
  self->_sharingEnabled = a3;
}

- (BOOL)personalAutomationsEnabled
{
  return self->_personalAutomationsEnabled;
}

- (void)setPersonalAutomationsEnabled:(BOOL)a3
{
  self->_personalAutomationsEnabled = a3;
}

- (BOOL)homeAutomationsEnabled
{
  return self->_homeAutomationsEnabled;
}

- (void)setHomeAutomationsEnabled:(BOOL)a3
{
  self->_homeAutomationsEnabled = a3;
}

- (BOOL)sleepEnabled
{
  return self->_sleepEnabled;
}

- (void)setSleepEnabled:(BOOL)a3
{
  self->_sleepEnabled = a3;
}

- (unsigned)shortcutComplicationSlotsUsed
{
  return self->_shortcutComplicationSlotsUsed;
}

- (void)setShortcutComplicationSlotsUsed:(unsigned int)a3
{
  self->_shortcutComplicationSlotsUsed = a3;
}

- (unsigned)appComplicationSlotsUsed
{
  return self->_appComplicationSlotsUsed;
}

- (void)setAppComplicationSlotsUsed:(unsigned int)a3
{
  self->_appComplicationSlotsUsed = a3;
}

- (unsigned)averageShortcutCountPerFolder
{
  return self->_averageShortcutCountPerFolder;
}

- (void)setAverageShortcutCountPerFolder:(unsigned int)a3
{
  self->_averageShortcutCountPerFolder = a3;
}

- (unsigned)shortcutsCount
{
  return self->_shortcutsCount;
}

- (void)setShortcutsCount:(unsigned int)a3
{
  self->_shortcutsCount = a3;
}

- (unsigned)uncategorizedShortcutCount
{
  return self->_uncategorizedShortcutCount;
}

- (void)setUncategorizedShortcutCount:(unsigned int)a3
{
  self->_uncategorizedShortcutCount = a3;
}

- (unsigned)watchShortcutCount
{
  return self->_watchShortcutCount;
}

- (void)setWatchShortcutCount:(unsigned int)a3
{
  self->_watchShortcutCount = a3;
}

- (unsigned)folderCount
{
  return self->_folderCount;
}

- (void)setFolderCount:(unsigned int)a3
{
  self->_folderCount = a3;
}

- (unsigned)numberOfPersonalAutomationsEnabled
{
  return self->_numberOfPersonalAutomationsEnabled;
}

- (void)setNumberOfPersonalAutomationsEnabled:(unsigned int)a3
{
  self->_numberOfPersonalAutomationsEnabled = a3;
}

- (unsigned)numberOfPersonalAutomationsFromSuggestionsEnabled
{
  return self->_numberOfPersonalAutomationsFromSuggestionsEnabled;
}

- (void)setNumberOfPersonalAutomationsFromSuggestionsEnabled:(unsigned int)a3
{
  self->_numberOfPersonalAutomationsFromSuggestionsEnabled = a3;
}

- (unsigned)shortcutRunCount
{
  return self->_shortcutRunCount;
}

- (void)setShortcutRunCount:(unsigned int)a3
{
  self->_shortcutRunCount = a3;
}

- (unsigned)appSessionCount
{
  return self->_appSessionCount;
}

- (void)setAppSessionCount:(unsigned int)a3
{
  self->_appSessionCount = a3;
}

- (unsigned)sleepShortcutsCount
{
  return self->_sleepShortcutsCount;
}

- (void)setSleepShortcutsCount:(unsigned int)a3
{
  self->_sleepShortcutsCount = a3;
}

- (unsigned)numberOfSmallWidgets
{
  return self->_numberOfSmallWidgets;
}

- (void)setNumberOfSmallWidgets:(unsigned int)a3
{
  self->_numberOfSmallWidgets = a3;
}

- (unsigned)numberOfSmallMultiShortcutWidgets
{
  return self->_numberOfSmallMultiShortcutWidgets;
}

- (void)setNumberOfSmallMultiShortcutWidgets:(unsigned int)a3
{
  self->_numberOfSmallMultiShortcutWidgets = a3;
}

- (unsigned)numberOfMediumWidgets
{
  return self->_numberOfMediumWidgets;
}

- (void)setNumberOfMediumWidgets:(unsigned int)a3
{
  self->_numberOfMediumWidgets = a3;
}

- (unsigned)numberOfLargeWidgets
{
  return self->_numberOfLargeWidgets;
}

- (void)setNumberOfLargeWidgets:(unsigned int)a3
{
  self->_numberOfLargeWidgets = a3;
}

- (unsigned)numberOfExtraLargeWidgets
{
  return self->_numberOfExtraLargeWidgets;
}

- (void)setNumberOfExtraLargeWidgets:(unsigned int)a3
{
  self->_numberOfExtraLargeWidgets = a3;
}

- (unsigned)numberOfWidgetsOnHomeScreen
{
  return self->_numberOfWidgetsOnHomeScreen;
}

- (void)setNumberOfWidgetsOnHomeScreen:(unsigned int)a3
{
  self->_numberOfWidgetsOnHomeScreen = a3;
}

- (unsigned)numberOfWidgetsOnLoL
{
  return self->_numberOfWidgetsOnLoL;
}

- (void)setNumberOfWidgetsOnLoL:(unsigned int)a3
{
  self->_numberOfWidgetsOnLoL = a3;
}

- (unsigned)numberOfLockScreenWidgets
{
  return self->_numberOfLockScreenWidgets;
}

- (void)setNumberOfLockScreenWidgets:(unsigned int)a3
{
  self->_numberOfLockScreenWidgets = a3;
}

- (unsigned)numberOfSuggestedAutomationsGenerated
{
  return self->_numberOfSuggestedAutomationsGenerated;
}

- (void)setNumberOfSuggestedAutomationsGenerated:(unsigned int)a3
{
  self->_numberOfSuggestedAutomationsGenerated = a3;
}

- (unsigned)numberOfSuggestedAutomationsGeneratedUserAlreadyHas
{
  return self->_numberOfSuggestedAutomationsGeneratedUserAlreadyHas;
}

- (void)setNumberOfSuggestedAutomationsGeneratedUserAlreadyHas:(unsigned int)a3
{
  self->_numberOfSuggestedAutomationsGeneratedUserAlreadyHas = a3;
}

- (unsigned)numberOfRemoteWidgetsSetup
{
  return self->_numberOfRemoteWidgetsSetup;
}

- (void)setNumberOfRemoteWidgetsSetup:(unsigned int)a3
{
  self->_numberOfRemoteWidgetsSetup = a3;
}

- (NSString)automationSuggestionsTrialIdentifier
{
  return self->_automationSuggestionsTrialIdentifier;
}

- (void)setAutomationSuggestionsTrialIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)autoShortcutsSectionsViewed
{
  return self->_autoShortcutsSectionsViewed;
}

- (void)setAutoShortcutsSectionsViewed:(BOOL)a3
{
  self->_autoShortcutsSectionsViewed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_automationSuggestionsTrialIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
