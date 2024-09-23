@implementation BrowseCategoryTableViewCell

- (NSString)uniqueIdentifier
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->horizontalPadding[OBJC_IVAR____TtC4Maps27BrowseCategoryTableViewCell_uniqueIdentifier];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (void)setUniqueIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps27BrowseCategoryTableViewCell_uniqueIdentifier);
  v6 = *(_QWORD *)&self->horizontalPadding[OBJC_IVAR____TtC4Maps27BrowseCategoryTableViewCell_uniqueIdentifier];
  *v5 = v4;
  v5[1] = v7;
  swift_bridgeObjectRelease(v6);
}

+ (NSString)identifier
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  uint64_t ObjCClassMetadata;

  ObjCClassMetadata = swift_getObjCClassMetadata(a1);
  v2 = sub_100008B04(qword_1014930D0);
  String.init<A>(describing:)(&ObjCClassMetadata, v2);
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (_TtC4Maps27BrowseCategoryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC4Maps27BrowseCategoryTableViewCell *)sub_100017760(a3, (uint64_t)a4, v6);
}

- (_TtC4Maps27BrowseCategoryTableViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000181C0();
}

- (void)prepareForReuse
{
  id v2;
  id v3;
  NSString v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for BrowseCategoryTableViewCell();
  v2 = v6.receiver;
  -[BrowseCategoryTableViewCell prepareForReuse](&v6, "prepareForReuse");
  v3 = sub_100017684();
  v4 = String._bridgeToObjectiveC()();
  objc_msgSend(v3, "setText:", v4, v6.receiver, v6.super_class);

  v5 = sub_1000175BC();
  objc_msgSend(v5, "setImage:", 0);

}

- (void)updateContents:(id)a3 uniqueID:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC4Maps27BrowseCategoryTableViewCell *v11;
  id v12;
  NSString v13;
  uint64_t *v14;
  uint64_t v15;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v10 = v9;
  v11 = self;
  v12 = sub_100017684();
  v13 = String._bridgeToObjectiveC()();
  objc_msgSend(v12, "setText:", v13);

  v14 = (uint64_t *)((char *)v11 + OBJC_IVAR____TtC4Maps27BrowseCategoryTableViewCell_uniqueIdentifier);
  v15 = *(_QWORD *)&v11->horizontalPadding[OBJC_IVAR____TtC4Maps27BrowseCategoryTableViewCell_uniqueIdentifier];
  *v14 = v8;
  v14[1] = v10;

  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v15);
}

- (void)setThumbnailImage:(id)a3
{
  id v4;
  _TtC4Maps27BrowseCategoryTableViewCell *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1000175BC();
  objc_msgSend(v6, "setImage:", v4);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->horizontalPadding[OBJC_IVAR____TtC4Maps27BrowseCategoryTableViewCell_uniqueIdentifier]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27BrowseCategoryTableViewCell____lazy_storage___cellImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27BrowseCategoryTableViewCell____lazy_storage___cellTitleLabel));
}

@end
