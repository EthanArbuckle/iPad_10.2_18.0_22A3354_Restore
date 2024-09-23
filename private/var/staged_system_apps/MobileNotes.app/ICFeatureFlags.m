@implementation ICFeatureFlags

+ (BOOL)appShortcutsEnabled
{
  return sub_1002E2BA8((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for NotesFeature, (uint64_t (*)(void))sub_1000199D4, (uint64_t)"AppShortcuts", 12);
}

+ (BOOL)realtimeCollaborationEnabled
{
  return sub_1002E2BA8((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for NotesFeature, (uint64_t (*)(void))sub_1000199D4, (uint64_t)"RealtimeCollaboration", 21);
}

+ (BOOL)pagesHandoffEnabled
{
  return sub_1002E2BA8((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for NotesFeature, (uint64_t (*)(void))sub_1000199D4, (uint64_t)"PagesHandoff", 12);
}

+ (BOOL)lockedNotesV1NeoEnabled
{
  return sub_1002E2BA8((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for NotesFeature, (uint64_t (*)(void))sub_1000199D4, (uint64_t)"LockedNotesV1Neo", 16);
}

+ (BOOL)blockQuoteEnabled
{
  return sub_1002E2BA8((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for NotesFeature, (uint64_t (*)(void))sub_1000199D4, (uint64_t)"BlockQuote", 10);
}

+ (BOOL)imapSyncEnabled
{
  return sub_1002E2BA8((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for NotesFeature, (uint64_t (*)(void))sub_1000199D4, (uint64_t)"IMAPSync_iOS", 12);
}

+ (BOOL)audioTranscriptionEnabled
{
  return sub_1002E2BA8((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for NotesFeature, (uint64_t (*)(void))sub_1000199D4, (uint64_t)"AudioTranscription", 18);
}

+ (BOOL)callRecordingEnabled
{
  char v2;
  char v3;
  const char *v5;
  uint64_t v6;
  char v7;
  ValueMetadata *v8;
  unint64_t v9;

  v8 = &type metadata for NotesFeature;
  v9 = sub_1000199D4();
  v5 = "AudioTranscription";
  v6 = 18;
  v7 = 2;
  v2 = isFeatureEnabled(_:)(&v5);
  sub_1000153C0(&v5);
  if ((v2 & 1) != 0)
  {
    v8 = &type metadata for TelephonyUtilitiesFeature;
    v9 = sub_10013FA34();
    v5 = "CallRecording";
    v6 = 13;
    v7 = 2;
    v3 = isFeatureEnabled(_:)(&v5);
    sub_1000153C0(&v5);
  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

+ (BOOL)mathEnabled
{
  return sub_1002E2BA8((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for NotesFeature, (uint64_t (*)(void))sub_1000199D4, (uint64_t)"Math", 4);
}

+ (BOOL)graphingEnabled
{
  return sub_1002E2BA8((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for NotesFeature, (uint64_t (*)(void))sub_1000199D4, (uint64_t)"Graphing", 8);
}

+ (BOOL)scrubbingEnabled
{
  return sub_1002E2BA8((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for NotesFeature, (uint64_t (*)(void))sub_1000199D4, (uint64_t)"Scrubbing", 9);
}

+ (BOOL)greyParrotEnabled
{
  return sub_1002E2BA8((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for NotesFeature, (uint64_t (*)(void))sub_1000199D4, (uint64_t)"GreyParrot", 10);
}

+ (BOOL)greyParrotUniversalAppEnabled
{
  return sub_1002E2BA8((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for GreyParrotFeature, (uint64_t (*)(void))sub_10013FCD4, (uint64_t)"UniversalApp", 12);
}

+ (BOOL)emphasisEnabled
{
  return sub_1002E2BA8((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for NotesFeature, (uint64_t (*)(void))sub_1000199D4, (uint64_t)"Emphasis", 8);
}

+ (BOOL)inlineFormFillingEnabled
{
  return sub_1002E2BA8((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for NotesFeature, (uint64_t (*)(void))sub_1000199D4, (uint64_t)"InlineFormFilling", 17);
}

+ (BOOL)siriSMART
{
  return sub_1002E2BA8((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for SiriSMARTFeature, (uint64_t (*)(void))sub_10013FC08, (uint64_t)"SMART", 5);
}

+ (BOOL)uniquelyiPadFluidTransitionsEnabled
{
  return sub_1002E2BA8((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for UniquelyiPadFeature, (uint64_t (*)(void))sub_10013FB6C, (uint64_t)"uip_fluid_transitions", 21);
}

+ (BOOL)generationTool
{
  return sub_1002E2BA8((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for NotesFeature, (uint64_t (*)(void))sub_1000199D4, (uint64_t)"GenerationTool", 14);
}

- (_TtC11MobileNotes14ICFeatureFlags)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[ICFeatureFlags init](&v3, "init");
}

@end
