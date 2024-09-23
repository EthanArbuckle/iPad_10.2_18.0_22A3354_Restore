@implementation ICMoveHeaderView

- (ICMoveHeaderView)initWithFrame:(CGRect)a3
{
  return (ICMoveHeaderView *)sub_1002E4084(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (ICMoveHeaderView)initWithCoder:(id)a3
{
  return (ICMoveHeaderView *)sub_1002E44A0(a3);
}

- (void)updateUIForCurrentTraitCollection
{
  ICMoveHeaderView *v2;

  v2 = self;
  sub_1002E45F8();

}

+ (double)absoluteHeight
{
  if (qword_1005CEC38 != -1)
    swift_once(&qword_1005CEC38, sub_1002E4CA8);
  return *(double *)&qword_100601BF0;
}

- (NSString)reuseIdentifier
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  uint64_t ObjectType;

  ObjectType = swift_getObjectType(self);
  v2 = sub_100012E18(&qword_1005D8338);
  String.init<A>(describing:)(&ObjectType, v2);
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  ICMoveHeaderView *v17;
  double v18;
  uint64_t v19;

  v5 = sub_100012E18(&qword_1005D7610);
  __chkstk_darwin(v5);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for UIBackgroundConfiguration(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for UICellConfigurationState(0, v12);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v17 = self;
  static UIBackgroundConfiguration.clear()(v17);
  -[ICMoveHeaderView directionalLayoutMargins](v17, "directionalLayoutMargins");
  UIBackgroundConfiguration.backgroundInsets.setter(-[ICMoveHeaderView directionalLayoutMargins](v17, "directionalLayoutMargins"), 0.0, v18, 0.0);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v7, v11, v8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
  UICollectionViewCell.backgroundConfiguration.setter(v7);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

- (NSManagedObjectContext)modernContext
{
  return (NSManagedObjectContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                           + OBJC_IVAR___ICMoveHeaderView_modernContext));
}

- (void)setModernContext:(id)a3
{
  ICMoveHeaderView *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1002E5FAC(a3, &OBJC_IVAR___ICMoveHeaderView_modernContext, &OBJC_IVAR___ICMovePreviewView_modernContext);

}

- (NSManagedObjectContext)htmlContext
{
  return (NSManagedObjectContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                           + OBJC_IVAR___ICMoveHeaderView_htmlContext));
}

- (void)setHtmlContext:(id)a3
{
  ICMoveHeaderView *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1002E5FAC(a3, &OBJC_IVAR___ICMoveHeaderView_htmlContext, &OBJC_IVAR___ICMovePreviewView_htmlContext);

}

- (NSArray)objectIds
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICMoveHeaderView_objectIds);
  sub_1000163BC(0, (unint64_t *)&qword_1005D2500, NSManagedObjectID_ptr);
  swift_bridgeObjectRetain(v2);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (void)setObjectIds:(id)a3
{
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;
  ICMoveHeaderView *v8;

  v5 = sub_1000163BC(0, (unint64_t *)&qword_1005D2500, NSManagedObjectID_ptr);
  v6 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICMoveHeaderView_objectIds);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICMoveHeaderView_objectIds) = v6;
  v8 = self;
  swift_bridgeObjectRelease(v7);
  sub_1002E50D0();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICMoveHeaderView____lazy_storage___previewView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICMoveHeaderView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICMoveHeaderView____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICMoveHeaderView____lazy_storage___textStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICMoveHeaderView____lazy_storage___stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICMoveHeaderView_modernContext));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR___ICMoveHeaderView_objectIds));
}

@end
