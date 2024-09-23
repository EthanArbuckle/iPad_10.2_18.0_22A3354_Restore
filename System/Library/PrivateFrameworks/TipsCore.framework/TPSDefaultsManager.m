@implementation TPSDefaultsManager

+ (BOOL)isInternalDevice
{
  if (qword_1ED03D568 != -1)
    swift_once();
  swift_beginAccess();
  return byte_1ED03D560;
}

+ (BOOL)resetDataCache
{
  return sub_19A973634() & 1;
}

+ (NSString)requestURL
{
  return (NSString *)sub_19A91DDA4((uint64_t)a1, (uint64_t)a2, 0x27u);
}

+ (NSString)assetURL
{
  return (NSString *)sub_19A91DDA4((uint64_t)a1, (uint64_t)a2, 2u);
}

+ (NSString)assetRequestHostURL
{
  return (NSString *)sub_19A91DDA4((uint64_t)a1, (uint64_t)a2, 1u);
}

+ (BOOL)showCollectionIntro
{
  return sub_19A973C28() & 1;
}

+ (BOOL)ignoreTargetingValidator
{
  return sub_19A97303C() & 1;
}

+ (double)sessionTimeoutIntervalInSeconds
{
  double v3;
  __int128 v4;
  uint64_t v5;

  sub_19A91DE2C(0x2Bu, &v4);
  if (v5)
  {
    if ((swift_dynamicCast() & 1) != 0)
      return v3;
  }
  else
  {
    sub_19A91E1E0((uint64_t)&v4);
  }
  return 0.0;
}

+ (NSArray)matchedClientConditionTargeting
{
  return (NSArray *)sub_19A91BDE0((uint64_t)a1, (uint64_t)a2, 0x1Cu);
}

+ (NSNumber)standardNotificationInterval
{
  swift_getObjCClassMetadata();
  return (NSNumber *)sub_19A9263A4(0x2Fu);
}

+ (NSDate)lastMajorVersionUpdateDate
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D380);
  MEMORY[0x1E0C80A78]();
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19A91DE2C(0x1Au, &v10);
  if (v11)
  {
    v4 = sub_19A990ADC();
    v5 = swift_dynamicCast();
    v6 = *(_QWORD *)(v4 - 8);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v3, v5 ^ 1u, 1, v4);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v3, 1, v4) != 1)
    {
      v7 = (void *)sub_19A990AA0();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v3, v4);
      return (NSDate *)v7;
    }
  }
  else
  {
    sub_19A91E1E0((uint64_t)&v10);
    v9 = sub_19A990ADC();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v3, 1, 1, v9);
  }
  return (NSDate *)0;
}

+ (NSArray)matchedClientConditions
{
  return (NSArray *)sub_19A91BDE0((uint64_t)a1, (uint64_t)a2, 0x1Du);
}

+ (BOOL)suppressTipKitContent
{
  return sub_19A97451C() & 1;
}

+ (NSString)notificationDocument
{
  return (NSString *)sub_19A91DDA4((uint64_t)a1, (uint64_t)a2, 0x1Fu);
}

+ (NSString)assetRatioIdentifier
{
  return (NSString *)sub_19A91DDA4((uint64_t)a1, (uint64_t)a2, 0);
}

+ (BOOL)showAllCollections
{
  return sub_19A973930() & 1;
}

+ (NSString)featuredCollection
{
  return (NSString *)sub_19A91DDA4((uint64_t)a1, (uint64_t)a2, 0xDu);
}

+ (NSString)requestLanguage
{
  return (NSString *)sub_19A91DDA4((uint64_t)a1, (uint64_t)a2, 0x24u);
}

+ (NSString)deviceModel
{
  return (NSString *)sub_19A91DDA4((uint64_t)a1, (uint64_t)a2, 8u);
}

+ (int64_t)crunchingIntervalInDays
{
  uint64_t v2;
  __int128 v4;
  uint64_t v5;

  sub_19A91DE2C(6u, &v4);
  v2 = v5;
  sub_19A91E1E0((uint64_t)&v4);
  if (v2)
    return sub_19A972448(6u);
  else
    return sub_19A990818();
}

+ (int64_t)discoverabilityOverrideMaxDisplayCount
{
  return sub_19A972448(9u);
}

+ (int64_t)triggerMinObservationCount
{
  return sub_19A972448(0x32u);
}

+ (BOOL)debugActiveIAPs
{
  return sub_19A972744() & 1;
}

+ (BOOL)displayAllFeaturedTopics
{
  return sub_19A972A40() & 1;
}

+ (BOOL)ignoreCloud
{
  return sub_19A972D3C() & 1;
}

+ (void)setIsInternalDevice:(BOOL)a3
{
  if (qword_1ED03D568 != -1)
    swift_once();
  swift_beginAccess();
  byte_1ED03D560 = a3;
}

+ (BOOL)resetDaemonData
{
  return sub_19A973338() & 1;
}

+ (BOOL)showPagingLabelOnLongPress
{
  return sub_19A973F24() & 1;
}

+ (BOOL)suppressNotifications
{
  return sub_19A974220() & 1;
}

+ (NSString)displayContentForContext
{
  return (NSString *)sub_19A91DDA4((uint64_t)a1, (uint64_t)a2, 0xCu);
}

+ (NSString)hintActionText
{
  return (NSString *)sub_19A91DDA4((uint64_t)a1, (uint64_t)a2, 0xFu);
}

+ (NSString)hintActionURL
{
  return (NSString *)sub_19A91DDA4((uint64_t)a1, (uint64_t)a2, 0x10u);
}

+ (NSString)hintBody
{
  return (NSString *)sub_19A91DDA4((uint64_t)a1, (uint64_t)a2, 0x11u);
}

+ (NSString)hintMonitoringEvents
{
  return (NSString *)sub_19A91DDA4((uint64_t)a1, (uint64_t)a2, 0x14u);
}

+ (NSString)hintTitle
{
  return (NSString *)sub_19A91DDA4((uint64_t)a1, (uint64_t)a2, 0x15u);
}

+ (NSString)minVersionForSpatialAudio
{
  return (NSString *)sub_19A91DDA4((uint64_t)a1, (uint64_t)a2, 0x1Eu);
}

+ (NSString)platform
{
  return (NSString *)sub_19A91DDA4((uint64_t)a1, (uint64_t)a2, 0x20u);
}

+ (NSString)requestHostURL
{
  return (NSString *)sub_19A91DDA4((uint64_t)a1, (uint64_t)a2, 0x22u);
}

+ (NSString)requestModel
{
  return (NSString *)sub_19A91DDA4((uint64_t)a1, (uint64_t)a2, 0x25u);
}

+ (NSString)requestPlatform
{
  return (NSString *)sub_19A91DDA4((uint64_t)a1, (uint64_t)a2, 0x26u);
}

+ (NSString)releaseType
{
  return (NSString *)sub_19A91DDA4((uint64_t)a1, (uint64_t)a2, 0x21u);
}

+ (NSString)requestVersion
{
  return (NSString *)sub_19A91DDA4((uint64_t)a1, (uint64_t)a2, 0x28u);
}

+ (NSString)widgetDocument
{
  return (NSString *)sub_19A91DDA4((uint64_t)a1, (uint64_t)a2, 0x36u);
}

+ (NSNumber)contentUpdatedDarwinNotificationInSeconds
{
  swift_getObjCClassMetadata();
  return (NSNumber *)sub_19A9263A4(3u);
}

+ (NSNumber)contextualEventDaysSinceLastMajorUpdateInSeconds
{
  swift_getObjCClassMetadata();
  return (NSNumber *)sub_19A9263A4(4u);
}

+ (NSNumber)hintCustomizationID
{
  swift_getObjCClassMetadata();
  return (NSNumber *)sub_19A9263A4(0x12u);
}

+ (NSNumber)holdoutGroup
{
  swift_getObjCClassMetadata();
  return (NSNumber *)sub_19A9263A4(0x16u);
}

+ (NSNumber)requestInterval
{
  swift_getObjCClassMetadata();
  return (NSNumber *)sub_19A9263A4(0x23u);
}

+ (NSNumber)userType
{
  swift_getObjCClassMetadata();
  return (NSNumber *)sub_19A9263A4(0x33u);
}

+ (double)contextualEventLookBackDaysInSeconds
{
  double v3;
  __int128 v4;
  uint64_t v5;

  sub_19A91DE2C(5u, &v4);
  if (v5)
  {
    if ((swift_dynamicCast() & 1) != 0)
      return v3;
  }
  else
  {
    sub_19A91E1E0((uint64_t)&v4);
  }
  return 0.0;
}

+ (double)discoverabilitySuppressionInterval
{
  double v3;
  __int128 v4;
  uint64_t v5;

  sub_19A91DE2C(0xAu, &v4);
  if (v5)
  {
    if ((swift_dynamicCast() & 1) != 0)
      return v3;
  }
  else
  {
    sub_19A91E1E0((uint64_t)&v4);
  }
  return 0.0;
}

+ (double)featuredDocumentInterval
{
  double v3;
  __int128 v4;
  uint64_t v5;

  sub_19A91DE2C(0xEu, &v4);
  if (v5)
  {
    if ((swift_dynamicCast() & 1) != 0)
      return v3;
  }
  else
  {
    sub_19A91E1E0((uint64_t)&v4);
  }
  return 0.0;
}

+ (double)hintMaxDurationTimeInterval
{
  double v3;
  __int128 v4;
  uint64_t v5;

  sub_19A91DE2C(0x13u, &v4);
  if (v5)
  {
    if ((swift_dynamicCast() & 1) != 0)
      return v3;
  }
  else
  {
    sub_19A91E1E0((uint64_t)&v4);
  }
  return 0.0;
}

+ (double)welcomeNotificationDelay
{
  double v3;
  __int128 v4;
  uint64_t v5;

  sub_19A91DE2C(0x34u, &v4);
  if (v5)
  {
    if ((swift_dynamicCast() & 1) != 0)
      return v3;
  }
  else
  {
    sub_19A91E1E0((uint64_t)&v4);
  }
  return 0.0;
}

+ (double)welcomeNotificationGracePeriod
{
  double v3;
  __int128 v4;
  uint64_t v5;

  sub_19A91DE2C(0x35u, &v4);
  if (v5)
  {
    if ((swift_dynamicCast() & 1) != 0)
      return v3;
  }
  else
  {
    sub_19A91E1E0((uint64_t)&v4);
  }
  return 0.0;
}

- (TPSDefaultsManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TipsDefaultsManager();
  return -[TPSDefaultsManager init](&v3, sel_init);
}

@end
