@implementation ShareOtherContextAction.ActivityItemProvider

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];

  v4 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCC8Podcasts23ShareOtherContextActionP33_EEA9E3C8BAC5199A99988C7A83F9625320ActivityItemProvider_title);
  v3 = *(_QWORD *)&self->title[OBJC_IVAR____TtCC8Podcasts23ShareOtherContextActionP33_EEA9E3C8BAC5199A99988C7A83F9625320ActivityItemProvider_title];
  v6[0] = v4;
  v6[1] = v3;
  swift_bridgeObjectRetain(v3);
  return (id)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(v6, &type metadata for String);
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  uint64_t v4;
  NSString v5;

  v4 = *(_QWORD *)&self->title[OBJC_IVAR____TtCC8Podcasts23ShareOtherContextActionP33_EEA9E3C8BAC5199A99988C7A83F9625320ActivityItemProvider_title];
  swift_bridgeObjectRetain(v4);
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return v5;
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
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v7, (char *)self+ OBJC_IVAR____TtCC8Podcasts23ShareOtherContextActionP33_EEA9E3C8BAC5199A99988C7A83F9625320ActivityItemProvider_link, v5);
  return (id)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(v7, v5);
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v5;
  id v6;
  _TtCC8Podcasts23ShareOtherContextActionP33_EEA9E3C8BAC5199A99988C7A83F9625320ActivityItemProvider *v7;
  id v8;
  void *v9;
  void *v10;
  NSString v11;

  v5 = objc_allocWithZone((Class)LPLinkMetadata);
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v5, "init");
  URL._bridgeToObjectiveC()((NSURL *)OBJC_IVAR____TtCC8Podcasts23ShareOtherContextActionP33_EEA9E3C8BAC5199A99988C7A83F9625320ActivityItemProvider_link);
  v10 = v9;
  objc_msgSend(v8, "setURL:", v9);

  v11 = String._bridgeToObjectiveC()();
  objc_msgSend(v8, "setTitle:", v11);

  return v8;
}

- (_TtCC8Podcasts23ShareOtherContextActionP33_EEA9E3C8BAC5199A99988C7A83F9625320ActivityItemProvider)init
{
  _TtCC8Podcasts23ShareOtherContextActionP33_EEA9E3C8BAC5199A99988C7A83F9625320ActivityItemProvider *result;

  result = (_TtCC8Podcasts23ShareOtherContextActionP33_EEA9E3C8BAC5199A99988C7A83F9625320ActivityItemProvider *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.ActivityItemProvider", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(_QWORD *)&self->title[OBJC_IVAR____TtCC8Podcasts23ShareOtherContextActionP33_EEA9E3C8BAC5199A99988C7A83F9625320ActivityItemProvider_title]);
  v3 = (char *)self
     + OBJC_IVAR____TtCC8Podcasts23ShareOtherContextActionP33_EEA9E3C8BAC5199A99988C7A83F9625320ActivityItemProvider_link;
  v4 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
