@implementation UIViewDrawEventProducer

- (void)dealloc
{
  _TtC16ScreenSharingKit23UIViewDrawEventProducer *v2;
  objc_super v3;
  char v4;

  v4 = 1;
  v2 = self;
  sub_245955E0C();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for UIViewDrawEventProducer();
  -[UIViewDrawEventProducer dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{

  swift_release();
  sub_245874234((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit23UIViewDrawEventProducer_previousTapEventDate, &qword_2574C0188);
  sub_245874234((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit23UIViewDrawEventProducer_activeStrokeID, &qword_2574BAB60);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16ScreenSharingKit23UIViewDrawEventProducer_localDrawingView));
  swift_bridgeObjectRelease();
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16ScreenSharingKit23UIViewDrawEventProducer____lazy_storage___tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16ScreenSharingKit23UIViewDrawEventProducer____lazy_storage___panGestureRecognizer));
}

- (void)handleTap:(id)a3
{
  id v4;
  _TtC16ScreenSharingKit23UIViewDrawEventProducer *v5;

  v4 = a3;
  v5 = self;
  sub_24592538C(v4);

}

- (void)handlePan:(id)a3
{
  id v4;
  _TtC16ScreenSharingKit23UIViewDrawEventProducer *v5;

  v4 = a3;
  v5 = self;
  sub_245925740(v4);

}

- (_TtC16ScreenSharingKit23UIViewDrawEventProducer)init
{
  return (_TtC16ScreenSharingKit23UIViewDrawEventProducer *)sub_245925FF4();
}

@end
