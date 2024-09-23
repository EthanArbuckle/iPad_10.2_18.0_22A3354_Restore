@implementation DOCContentDimmingOverlay

- (void)setActive:(BOOL)a3
{
  _TtC5Files24DOCContentDimmingOverlay *v3;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files24DOCContentDimmingOverlay_active) = a3;
  v3 = self;
  sub_1000A83AC();

}

- (void)setAutohideWhenPossibleDropTarget:(BOOL)a3
{
  _TtC5Files24DOCContentDimmingOverlay *v3;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC5Files24DOCContentDimmingOverlay_autohideWhenPossibleDropTarget) = a3;
  v3 = self;
  sub_1000A81D8();
  sub_1000A83AC();

}

- (id)initForCovering:(id)a3
{
  swift_unknownObjectRetain(a3);
  return sub_1000155CC(a3);
}

- (BOOL)autohideWhenPossibleDropTarget
{
  return *((_BYTE *)&self->super.super.super.isa
         + OBJC_IVAR____TtC5Files24DOCContentDimmingOverlay_autohideWhenPossibleDropTarget);
}

- (BOOL)active
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files24DOCContentDimmingOverlay_active);
}

- (_TtC5Files24DOCContentDimmingOverlay)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000DC4AC();
}

- (BOOL)isHidden
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCContentDimmingOverlay();
  return -[DOCContentDimmingOverlay isHidden](&v3, "isHidden");
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCContentDimmingOverlay();
  -[DOCContentDimmingOverlay setHidden:](&v4, "setHidden:", v3);
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  id v6;
  id v7;
  id v8;
  _TtC5Files24DOCContentDimmingOverlay *v9;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v9 = self;
  v7 = objc_msgSend(a4, "localDragSession");
  v8 = v7;
  if (v7)
    swift_unknownObjectRelease(v7);
  *((_BYTE *)&v9->super.super.super.isa + OBJC_IVAR____TtC5Files24DOCContentDimmingOverlay_hasDropTargetRequiringAutohide) = v8 != 0;
  sub_1000A83AC();

  swift_unknownObjectRelease(a4);
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  id v6;
  _TtC5Files24DOCContentDimmingOverlay *v7;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC5Files24DOCContentDimmingOverlay_hasDropTargetRequiringAutohide) = 0;
  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_1000A83AC();

  swift_unknownObjectRelease(a4);
}

- (_TtC5Files24DOCContentDimmingOverlay)initWithFrame:(CGRect)a3
{
  _TtC5Files24DOCContentDimmingOverlay *result;

  result = (_TtC5Files24DOCContentDimmingOverlay *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCContentDimmingOverlay", 30, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files24DOCContentDimmingOverlay_dropInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files24DOCContentDimmingOverlay_dragMonitorKVO));
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files24DOCContentDimmingOverlay_dimmable);
}

@end
