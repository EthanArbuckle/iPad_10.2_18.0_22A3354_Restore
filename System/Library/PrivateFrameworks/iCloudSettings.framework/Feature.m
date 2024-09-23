@implementation Feature

- (NSString)title
{
  return (NSString *)sub_24B5C205C();
}

- (void)setTitle:(id)a3
{
  sub_24B5C2128((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC14iCloudSettings7Feature_title);
}

- (NSString)subtitle
{
  return (NSString *)sub_24B5C205C();
}

- (void)setSubtitle:(id)a3
{
  sub_24B5C2128((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC14iCloudSettings7Feature_subtitle);
}

- (NSString)featureId
{
  return (NSString *)sub_24B519158((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings7Feature_featureId);
}

- (_TtC14iCloudSettings6Action)action
{
  return (_TtC14iCloudSettings6Action *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                + OBJC_IVAR____TtC14iCloudSettings7Feature_action));
}

- (NSString)iTunesItemId
{
  return (NSString *)sub_24B519158((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings7Feature_iTunesItemId);
}

- (NSString)bundleIdentifier
{
  return (NSString *)sub_24B519158((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings7Feature_bundleIdentifier);
}

- (_TtC14iCloudSettings5Icons)icons
{
  return (_TtC14iCloudSettings5Icons *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                               + OBJC_IVAR____TtC14iCloudSettings7Feature_icons));
}

- (id)init:(id)a3
{
  uint64_t v3;

  v3 = sub_24B5E4290();
  return Feature.init(_:)(v3);
}

- (_TtC14iCloudSettings7Feature)initWithFeatureId:(id)a3 title:(id)a4 subtitle:(id)a5 icons:(id)a6 action:(id)a7 iTunesItemId:(id)a8 bundleIdentifier:(id)a9
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  id v29;
  id v30;
  objc_super v34;

  v11 = sub_24B5E42F0();
  v13 = v12;
  v14 = sub_24B5E42F0();
  v16 = v15;
  v17 = sub_24B5E42F0();
  v19 = v18;
  if (!a8)
  {
    v20 = 0;
    if (a9)
      goto LABEL_3;
LABEL_5:
    v22 = 0;
    v23 = 0;
    goto LABEL_6;
  }
  v20 = sub_24B5E42F0();
  a8 = v21;
  if (!a9)
    goto LABEL_5;
LABEL_3:
  v22 = sub_24B5E42F0();
LABEL_6:
  v24 = (uint64_t *)((char *)self + OBJC_IVAR____TtC14iCloudSettings7Feature_featureId);
  *v24 = v11;
  v24[1] = v13;
  v25 = (uint64_t *)((char *)self + OBJC_IVAR____TtC14iCloudSettings7Feature_title);
  *v25 = v14;
  v25[1] = v16;
  v26 = (uint64_t *)((char *)self + OBJC_IVAR____TtC14iCloudSettings7Feature_subtitle);
  *v26 = v17;
  v26[1] = v19;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings7Feature_action) = (Class)a7;
  v27 = (uint64_t *)((char *)self + OBJC_IVAR____TtC14iCloudSettings7Feature_iTunesItemId);
  *v27 = v20;
  v27[1] = (uint64_t)a8;
  v28 = (uint64_t *)((char *)self + OBJC_IVAR____TtC14iCloudSettings7Feature_bundleIdentifier);
  *v28 = v22;
  v28[1] = v23;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings7Feature_icons) = (Class)a6;
  v34.receiver = self;
  v34.super_class = (Class)type metadata accessor for Feature();
  v29 = a6;
  v30 = a7;
  return -[Feature init](&v34, sel_init);
}

- (_TtC14iCloudSettings7Feature)init
{
  _TtC14iCloudSettings7Feature *result;

  result = (_TtC14iCloudSettings7Feature *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
