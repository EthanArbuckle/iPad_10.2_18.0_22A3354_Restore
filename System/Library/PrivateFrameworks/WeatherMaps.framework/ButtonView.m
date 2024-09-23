@implementation ButtonView

- (_TtC11WeatherMaps10ButtonView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DBE8B5E0();
}

- (void)recognizedHover:(id)a3
{
  id v4;
  _TtC11WeatherMaps10ButtonView *v5;

  v4 = a3;
  v5 = self;
  sub_1DBE8B698(v4);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC11WeatherMaps10ButtonView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_1DBE8B79C(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtC11WeatherMaps10ButtonView)initWithFrame:(CGRect)a3
{
  sub_1DBE8B97C();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  void *v8;

  sub_1DBE8BE6C((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps10ButtonView_menuDelegate);
  sub_1DBE8BE6C((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps10ButtonView_actionDelegate);
  v3 = (char *)self + OBJC_IVAR____TtC11WeatherMaps10ButtonView_button;
  v4 = *(uint64_t *)((char *)&self->super.super.super._constraintsExceptingSubviewAutoresizingConstraints
                  + OBJC_IVAR____TtC11WeatherMaps10ButtonView_button);
  v5 = *((_QWORD *)v3 + 4);
  v6 = *((_QWORD *)v3 + 5);
  v8 = (void *)*((_QWORD *)v3 + 13);
  v7 = v3[48];
  sub_1DBE8BD4C();
  sub_1DBE8BD54(v4, v5, v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_11(v8);
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  id v4;
  _TtC11WeatherMaps10ButtonView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v4 = a3;
  v5 = self;
  sub_1DBE8BAB0((uint64_t)v4);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  sub_1DBE8BC1C(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (SEL *)&selRef_contextMenuInteraction_willDisplayMenuForConfiguration_animator_, (void (*)(char *))sub_1DBECC7A0);
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  sub_1DBE8BC1C(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (SEL *)&selRef_contextMenuInteraction_willEndForConfiguration_animator_, (void (*)(char *))sub_1DBECC89C);
}

@end
