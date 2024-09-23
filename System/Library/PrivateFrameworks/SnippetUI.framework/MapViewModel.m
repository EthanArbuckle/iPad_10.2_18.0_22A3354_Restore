@implementation MapViewModel

- (_TtC9SnippetUI12MapViewModel)init
{
  sub_21F0D0174();
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554A1EA8);
  OUTLINED_FUNCTION_7_45(v3);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F9E7A0);
  OUTLINED_FUNCTION_7_45(v4);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9SnippetUI12MapViewModel____lazy_storage___locationManager));
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4;
  _TtC9SnippetUI12MapViewModel *v5;

  v4 = a3;
  v5 = self;
  sub_21F0D094C(v4);

}

@end
