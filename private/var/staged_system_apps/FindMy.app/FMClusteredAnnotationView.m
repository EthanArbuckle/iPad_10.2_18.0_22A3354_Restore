@implementation FMClusteredAnnotationView

- (MKAnnotation)annotation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[FMClusteredAnnotationView annotation](&v3, "annotation");
}

- (void)setAnnotation:(id)a3
{
  _TtC6FindMy25FMClusteredAnnotationView *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_100075904((uint64_t)a3);

  swift_unknownObjectRelease(a3);
}

- (_TtC6FindMy25FMClusteredAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a4)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = swift_unknownObjectRetain(a3);
  return (_TtC6FindMy25FMClusteredAnnotationView *)sub_100074B10(v8, v5, v7);
}

- (_TtC6FindMy25FMClusteredAnnotationView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100075A24();
}

- (void)prepareForDisplay
{
  _TtC6FindMy25FMClusteredAnnotationView *v2;

  v2 = self;
  sub_100075418();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType(self);
  v4 = a3;
  v5 = (char *)v8.receiver;
  -[FMClusteredAnnotationView traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v6 = *(_QWORD *)&v5[OBJC_IVAR____TtC6FindMy25FMClusteredAnnotationView_annotations];
  swift_bridgeObjectRetain(v6);
  sub_100073E8C(v7);
  swift_bridgeObjectRelease(v6);
  sub_100075270();

}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMClusteredAnnotationView_balloonLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMClusteredAnnotationView_firstImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMClusteredAnnotationView_secondImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMClusteredAnnotationView_thirdImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMClusteredAnnotationView_additionalCount));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMClusteredAnnotationView_additionalText));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMClusteredAnnotationView_puckBackgroundLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMClusteredAnnotationView_puckIcon));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMClusteredAnnotationView_cachedHomeIcon));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy25FMClusteredAnnotationView_annotations));
}

@end
