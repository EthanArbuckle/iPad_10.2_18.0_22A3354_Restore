@implementation VCSettings

- (_TtC12VoiceControl10VCSettings)init
{
  _TtC12VoiceControl10VCSettings *v2;
  objc_super v4;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsMain) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsDaemon) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC12VoiceControl10VCSettings_testMode) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for VCSettings();
  v2 = -[VCSettings init](&v4, sel_init);
  sub_24A253344(0);

  return v2;
}

- (void).cxx_destruct
{

}

@end
