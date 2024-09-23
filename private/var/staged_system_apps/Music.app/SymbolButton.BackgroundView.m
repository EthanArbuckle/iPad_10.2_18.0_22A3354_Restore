@implementation SymbolButton.BackgroundView

- (_TtCC11MusicCoreUI12SymbolButtonP33_0D6450BB937596549C350B7D294A2A9314BackgroundView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtCC11MusicCoreUI12SymbolButtonP33_0D6450BB937596549C350B7D294A2A9314BackgroundView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtCC11MusicCoreUI12SymbolButtonP33_0D6450BB937596549C350B7D294A2A9314BackgroundView_configuration);
  *v4 = 0;
  v4[1] = 0x3FF0000000000000;
  v5 = a3;

  result = (_TtCC11MusicCoreUI12SymbolButtonP33_0D6450BB937596549C350B7D294A2A9314BackgroundView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "MusicCoreUI/SymbolButton.swift", 30, 2, 1397, 0);
  __break(1u);
  return result;
}

- (void)tintColorDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SymbolButton.BackgroundView();
  v2 = v3.receiver;
  -[SymbolButton.BackgroundView tintColorDidChange](&v3, "tintColorDidChange");
  sub_100CCC86C();

}

- (_TtCC11MusicCoreUI12SymbolButtonP33_0D6450BB937596549C350B7D294A2A9314BackgroundView)initWithFrame:(CGRect)a3
{
  sub_1000535F0((uint64_t)self, (uint64_t)a2, (uint64_t)"MusicCoreUI.BackgroundView", 26);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC11MusicCoreUI12SymbolButtonP33_0D6450BB937596549C350B7D294A2A9314BackgroundView_configuration));
}

@end
