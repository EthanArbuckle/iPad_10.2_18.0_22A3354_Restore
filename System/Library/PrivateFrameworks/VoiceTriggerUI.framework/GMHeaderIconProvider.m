@implementation GMHeaderIconProvider

- (_TtC14VoiceTriggerUI20GMHeaderIconProvider)init
{
  _QWORD *v2;
  objc_super v4;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14VoiceTriggerUI20GMHeaderIconProvider_gmIconID);
  *v2 = 0xD00000000000002DLL;
  v2[1] = 0x8000000229F56970;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for GMHeaderIconProvider();
  return -[GMHeaderIconProvider init](&v4, sel_init);
}

- (id)imageViewWithLabelWithLabelFontSize:(double)a3 labelBackgroundColor:(id)a4 labelForegroundColor:(id)a5
{
  id v8;
  id v9;
  _TtC14VoiceTriggerUI20GMHeaderIconProvider *v10;
  void *v11;

  v8 = a4;
  v9 = a5;
  v10 = self;
  v11 = (void *)sub_229F37D80((uint64_t)v8, v9, a3);

  return v11;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
