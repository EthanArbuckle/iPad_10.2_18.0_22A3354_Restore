@implementation PalettePresentationInteraction

- (UIView)view
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC9SeymourUI30PalettePresentationInteraction_view));
}

- (void)setView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SeymourUI30PalettePresentationInteraction_view);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SeymourUI30PalettePresentationInteraction_view) = (Class)a3;
  v3 = a3;

}

- (_TtC9SeymourUI30PalettePresentationInteraction)init
{
  return (_TtC9SeymourUI30PalettePresentationInteraction *)sub_22B182920();
}

- (void).cxx_destruct
{
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI30PalettePresentationInteraction_delegate);

  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9SeymourUI30PalettePresentationInteraction_panGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9SeymourUI30PalettePresentationInteraction_tapGestureRecognizer));
}

- (void)didMoveToView:(id)a3
{
  id v5;
  _TtC9SeymourUI30PalettePresentationInteraction *v6;

  v5 = a3;
  v6 = self;
  sub_22B182B7C(a3);

}

- (void)willMoveToView:(id)a3
{
  id v5;
  _TtC9SeymourUI30PalettePresentationInteraction *v6;

  v5 = a3;
  v6 = self;
  sub_22B182CB4(a3);

}

@end
