@implementation TTRITemplateSharingRouter.ShareSheetItem

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = type metadata accessor for URL(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v6, (char *)self+ OBJC_IVAR____TtCC9Reminders25TTRITemplateSharingRouterP33_B88B83D8B282D69A84EFFB48896895C814ShareSheetItem_url, v4);
  return (id)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(v6, v4);
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v5 = type metadata accessor for URL(0);
  __chkstk_darwin(v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v7, (char *)self+ OBJC_IVAR____TtCC9Reminders25TTRITemplateSharingRouterP33_B88B83D8B282D69A84EFFB48896895C814ShareSheetItem_url, v5);
  return (id)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(v7, v5);
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtCC9Reminders25TTRITemplateSharingRouterP33_B88B83D8B282D69A84EFFB48896895C814ShareSheetItem_linkMetadata));
}

- (_TtCC9Reminders25TTRITemplateSharingRouterP33_B88B83D8B282D69A84EFFB48896895C814ShareSheetItem)init
{
  _TtCC9Reminders25TTRITemplateSharingRouterP33_B88B83D8B282D69A84EFFB48896895C814ShareSheetItem *result;

  result = (_TtCC9Reminders25TTRITemplateSharingRouterP33_B88B83D8B282D69A84EFFB48896895C814ShareSheetItem *)_swift_stdlib_reportUnimplementedInitializer("Reminders.ShareSheetItem", 24, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self
     + OBJC_IVAR____TtCC9Reminders25TTRITemplateSharingRouterP33_B88B83D8B282D69A84EFFB48896895C814ShareSheetItem_url;
  v4 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC9Reminders25TTRITemplateSharingRouterP33_B88B83D8B282D69A84EFFB48896895C814ShareSheetItem_linkMetadata));
}

@end
