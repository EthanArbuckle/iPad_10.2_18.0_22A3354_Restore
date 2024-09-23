@implementation DOCLevelOfDetailButton

- (void)tintColorDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCLevelOfDetailButton(0);
  v2 = v3.receiver;
  -[DOCLevelOfDetailButton tintColorDidChange](&v3, "tintColorDidChange");
  objc_msgSend(v2, "setNeedsUpdateConfiguration", v3.receiver, v3.super_class);

}

- (_TtC5Files22DOCLevelOfDetailButton)initWithFrame:(CGRect)a3
{
  sub_100226BB0((uint64_t)self, (uint64_t)a2, (uint64_t)"Files.DOCLevelOfDetailButton", 28);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Files22DOCLevelOfDetailButton_metadataView);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files22DOCLevelOfDetailButton_observationContext));
  sub_1003DB8C8((uint64_t)self + OBJC_IVAR____TtC5Files22DOCLevelOfDetailButton_metrics);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.hoverEffectsAllowedIfInteractionDisabled[OBJC_IVAR____TtC5Files22DOCLevelOfDetailButton_levelOfDetailTitle]);
}

@end
