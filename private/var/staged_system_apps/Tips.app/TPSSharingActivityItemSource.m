@implementation TPSSharingActivityItemSource

- (_TtC4Tips28TPSSharingActivityItemSource)initWithTip:(id)a3
{
  id v3;
  _TtC4Tips28TPSSharingActivityItemSource *v4;

  v3 = a3;
  v4 = (_TtC4Tips28TPSSharingActivityItemSource *)sub_1000632E4(v3);

  return v4;
}

- (UIImage)appIcon
{
  return (UIImage *)sub_100063450();
}

- (UIImage)preview
{
  _TtC4Tips28TPSSharingActivityItemSource *v2;
  id v3;

  v2 = self;
  v3 = sub_100063094();

  return (UIImage *)v3;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4;
  _TtC4Tips28TPSSharingActivityItemSource *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1000636FC();

  return v6;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  _QWORD v4[2];

  v4[0] = 0;
  v4[1] = 0xE000000000000000;
  return (id)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(v4, &type metadata for String, a3);
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return 0;
}

- (_TtC4Tips28TPSSharingActivityItemSource)init
{
  _TtC4Tips28TPSSharingActivityItemSource *result;

  result = (_TtC4Tips28TPSSharingActivityItemSource *)_swift_stdlib_reportUnimplementedInitializer("Tips.TPSSharingActivityItemSource", 33, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
