@implementation BackdropGradientView

- (_TtC5FilesP33_927EDC10B2E512953ACC1C78BA98F69520BackdropGradientView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10027BBB8();
}

- (void)layoutSubviews
{
  _TtC5FilesP33_927EDC10B2E512953ACC1C78BA98F69520BackdropGradientView *v2;

  v2 = self;
  sub_10027AD30();

}

- (void)effectiveAppearanceDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for BackdropGradientView();
  v4 = a3;
  v5 = v6.receiver;
  -[BackdropGradientView effectiveAppearanceDidChange:](&v6, "effectiveAppearanceDidChange:", v4);
  sub_10027AE68(v4);

}

- (_TtC5FilesP33_927EDC10B2E512953ACC1C78BA98F69520BackdropGradientView)initWithFrame:(CGRect)a3
{
  sub_100226BB0((uint64_t)self, (uint64_t)a2, (uint64_t)"Files.BackdropGradientView", 26);
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)&self->gradient[OBJC_IVAR____TtC5FilesP33_927EDC10B2E512953ACC1C78BA98F69520BackdropGradientView_gradient];
  v4 = *(_QWORD *)&self->gradient[OBJC_IVAR____TtC5FilesP33_927EDC10B2E512953ACC1C78BA98F69520BackdropGradientView_gradient
                                + 8];

  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v4);

  swift_release(*(_QWORD *)&self->_UIVisualEffectBackdropView_opaque[OBJC_IVAR____TtC5FilesP33_927EDC10B2E512953ACC1C78BA98F69520BackdropGradientView_backdropConfiguration]);
}

@end
