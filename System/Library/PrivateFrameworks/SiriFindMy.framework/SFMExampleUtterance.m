@implementation SFMExampleUtterance

- (NSString)utteranceText
{
  _TtC10SiriFindMy19SFMExampleUtterance *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  SFMExampleUtterance.utteranceText.getter();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1CCCF2A90();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setUtteranceText:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC10SiriFindMy19SFMExampleUtterance *v7;

  if (a3)
  {
    v4 = sub_1CCCF2A9C();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_1CCCCDCFC(v4, v6);

}

- (id)initForRole:(id)a3
{
  id v4;
  id result;

  v4 = a3;
  SFMExampleUtterance.init(forRole:)((uint64_t)a3);
  return result;
}

- (_TtC10SiriFindMy19SFMExampleUtterance)init
{
  SFMExampleUtterance.init()();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10SiriFindMy19SFMExampleUtterance_languageProvider);

  sub_1CCBE5AC4(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC10SiriFindMy19SFMExampleUtterance____lazy_storage___utteranceText), *(_QWORD *)&self->languageProvider[OBJC_IVAR____TtC10SiriFindMy19SFMExampleUtterance____lazy_storage___utteranceText]);
}

@end
