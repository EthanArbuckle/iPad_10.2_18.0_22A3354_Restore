@implementation WFAppEntityContextualAction

- (_TtC14VoiceShortcuts27WFAppEntityContextualAction)initWithIdentifier:(id)a3 displayTitle:(id)a4 entityType:(int64_t)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_1C1546BD0();
  v8 = v7;
  v9 = sub_1C1546BD0();
  return (_TtC14VoiceShortcuts27WFAppEntityContextualAction *)sub_1C14B9A58(v6, v8, v9, v10, a5);
}

- (_TtC14VoiceShortcuts27WFAppEntityContextualAction)initWithCoder:(id)a3
{
  sub_1C14B9BF8();
}

- (CSSearchableItem)spotlightItem
{
  _TtC14VoiceShortcuts27WFAppEntityContextualAction *v2;
  id v3;

  v2 = self;
  v3 = sub_1C14B9C8C();

  return (CSSearchableItem *)v3;
}

+ (id)spotlightDomainIdentifierForEntityType:(int64_t)a3
{
  void *v3;

  sub_1C14B9EA4(a3);
  v3 = (void *)sub_1C1546BAC();
  swift_bridgeObjectRelease();
  return v3;
}

- (_TtC14VoiceShortcuts27WFAppEntityContextualAction)initWithIdentifier:(id)a3 wfActionIdentifier:(id)a4 associatedAppBundleIdentifier:(id)a5 parameters:(id)a6 displayFormatString:(id)a7 title:(id)a8 subtitleFormatString:(id)a9 icon:(id)a10
{
  id v12;

  sub_1C1546BD0();
  if (a4)
    sub_1C1546BD0();
  if (a5)
    sub_1C1546BD0();
  sub_1C14BA2C0();
  sub_1C1546C84();
  sub_1C1546BD0();
  sub_1C1546BD0();
  if (a9)
    sub_1C1546BD0();
  v12 = a10;
  sub_1C14B9F34();
}

- (_TtC14VoiceShortcuts27WFAppEntityContextualAction)initWithIdentifier:(id)a3 wfActionIdentifier:(id)a4 associatedAppBundleIdentifier:(id)a5 parameters:(id)a6 displayFormatString:(id)a7 title:(id)a8 subtitleFormatString:(id)a9 icon:(id)a10 accessoryIcon:(id)a11 actionShowsUserInterface:(BOOL)a12 actionHasResult:(BOOL)a13 isReversible:(BOOL)a14
{
  id v16;
  id v17;

  sub_1C1546BD0();
  if (a4)
    sub_1C1546BD0();
  if (a5)
    sub_1C1546BD0();
  sub_1C14BA2C0();
  sub_1C1546C84();
  sub_1C1546BD0();
  sub_1C1546BD0();
  if (a9)
    sub_1C1546BD0();
  v16 = a10;
  v17 = a11;
  sub_1C14B9FE4();
}

- (_TtC14VoiceShortcuts27WFAppEntityContextualAction)initWithIdentifier:(id)a3 wfActionIdentifier:(id)a4 type:(unint64_t)a5 correspondingSystemActionType:(unint64_t)a6 associatedAppBundleIdentifier:(id)a7 resultFileOperation:(int64_t)a8 alternate:(BOOL)a9 filteringBehavior:(id)a10 parameters:(id)a11 displayFormatString:(id)a12 title:(id)a13 subtitleFormatString:(id)a14 icon:(id)a15
{
  id v17;
  id v18;

  sub_1C1546BD0();
  if (a4)
    sub_1C1546BD0();
  if (a7)
    sub_1C1546BD0();
  if (a11)
  {
    sub_1C14BA2C0();
    sub_1C1546C84();
  }
  sub_1C1546BD0();
  sub_1C1546BD0();
  if (a14)
    sub_1C1546BD0();
  v17 = a10;
  v18 = a15;
  sub_1C14BA0A8();
}

- (_TtC14VoiceShortcuts27WFAppEntityContextualAction)initWithIdentifier:(id)a3 wfActionIdentifier:(id)a4 type:(unint64_t)a5 correspondingSystemActionType:(unint64_t)a6 associatedAppBundleIdentifier:(id)a7 resultFileOperation:(int64_t)a8 alternate:(BOOL)a9 filteringBehavior:(id)a10 parameters:(id)a11 displayFormatString:(id)a12 title:(id)a13 subtitleFormatString:(id)a14 icon:(id)a15 accessoryIcon:(id)a16 actionShowsUserInterface:(BOOL)a17 isReversible:(BOOL)a18
{
  id v20;
  id v21;
  id v22;

  sub_1C1546BD0();
  if (a4)
    sub_1C1546BD0();
  if (a7)
    sub_1C1546BD0();
  if (a11)
  {
    sub_1C14BA2C0();
    sub_1C1546C84();
  }
  sub_1C1546BD0();
  sub_1C1546BD0();
  if (a14)
    sub_1C1546BD0();
  v20 = a10;
  v21 = a15;
  v22 = a16;
  sub_1C14BA164();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
