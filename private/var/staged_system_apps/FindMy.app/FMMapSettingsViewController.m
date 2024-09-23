@implementation FMMapSettingsViewController

- (_TtC6FindMy27FMMapSettingsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000E4708();
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self);
  v4 = v5.receiver;
  -[FMMapSettingsViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
  sub_1000E3CF0();
  sub_1000E3EB4();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC6FindMy27FMMapSettingsViewController *v4;

  v4 = self;
  sub_1000E251C(a3);

}

- (void)selectDefaultOption
{
  uint64_t v2;
  uint64_t v3;
  _TtC6FindMy27FMMapSettingsViewController *v4;

  v2 = (*(_QWORD **)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC6FindMy27FMBaseContentViewController_mediator))[7];
  v3 = v2 + OBJC_IVAR____TtC6FindMy21FMSelectionController_selectedMapMode;
  *(_WORD *)v3 = 0;
  *(_BYTE *)(v3 + 2) = 1;
  v4 = self;
  swift_retain(v2);
  sub_1001F5BB0();
  swift_release(v2);
  sub_1000E3CF0();

}

- (void)selectHybridOption
{
  uint64_t v2;
  uint64_t v3;
  _TtC6FindMy27FMMapSettingsViewController *v4;

  v2 = (*(_QWORD **)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC6FindMy27FMBaseContentViewController_mediator))[7];
  v3 = v2 + OBJC_IVAR____TtC6FindMy21FMSelectionController_selectedMapMode;
  *(_WORD *)v3 = 1;
  *(_BYTE *)(v3 + 2) = 1;
  v4 = self;
  swift_retain(v2);
  sub_1001F5BB0();
  swift_release(v2);
  sub_1000E3CF0();

}

- (void)selectSatelliteOption
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  _BYTE *v6;
  _TtC6FindMy27FMMapSettingsViewController *v7;

  v2 = (*(_QWORD **)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC6FindMy27FMBaseContentViewController_mediator))[7];
  v3 = qword_1005D1CD0;
  v7 = self;
  swift_retain(v2);
  if (v3 != -1)
    swift_once(&qword_1005D1CD0, sub_1001E0268);
  v4 = HIBYTE(word_1005F51B0);
  v5 = byte_1005F51B2;
  v6 = (_BYTE *)(v2 + OBJC_IVAR____TtC6FindMy21FMSelectionController_selectedMapMode);
  *v6 = word_1005F51B0;
  v6[1] = v4;
  v6[2] = v5;
  sub_1001F5BB0();
  swift_release(v2);
  sub_1000E3CF0();

}

- (void)selectMilesOption
{
  uint64_t v2;
  _TtC6FindMy27FMMapSettingsViewController *v3;

  v2 = (*(_QWORD **)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC6FindMy27FMBaseContentViewController_mediator))[7];
  *(_QWORD *)(v2 + OBJC_IVAR____TtC6FindMy21FMSelectionController_selectedUnit) = 3;
  v3 = self;
  swift_retain(v2);
  sub_1001F5F74();
  swift_release(v2);
  sub_1000E3EB4();

}

- (void)selectKMOption
{
  uint64_t v2;
  _TtC6FindMy27FMMapSettingsViewController *v3;

  v2 = (*(_QWORD **)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC6FindMy27FMBaseContentViewController_mediator))[7];
  *(_QWORD *)(v2 + OBJC_IVAR____TtC6FindMy21FMSelectionController_selectedUnit) = 2;
  v3 = self;
  swift_retain(v2);
  sub_1001F5F74();
  swift_release(v2);
  sub_1000E3EB4();

}

- (void)attributionPressed
{
  _TtC6FindMy27FMMapSettingsViewController *v2;

  v2 = self;
  sub_1000E42CC();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMMapSettingsViewController_optionPlatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMMapSettingsViewController_defaultOption));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMMapSettingsViewController_hybridOption));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMMapSettingsViewController_satelliteOption));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMMapSettingsViewController_distanceOptionPlatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMMapSettingsViewController_milesOption));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMMapSettingsViewController_kmOption));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMMapSettingsViewController_attribution));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMMapSettingsViewController_attributionButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMMapSettingsViewController_verticalStackView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy27FMMapSettingsViewController_selectionSubscription));
}

@end
