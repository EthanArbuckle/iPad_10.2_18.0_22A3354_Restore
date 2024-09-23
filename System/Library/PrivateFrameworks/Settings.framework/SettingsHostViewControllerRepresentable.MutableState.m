@implementation SettingsHostViewControllerRepresentable.MutableState

- (void)hostViewController:(id)a3 didPrepareToHost:(id)a4
{
  id v6;
  id v7;
  _TtCV8Settings39SettingsHostViewControllerRepresentableP33_660F061974F96B10B28E661239591CBA12MutableState *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1DB441AEC();

}

- (void)hostViewController:(id)a3 didEndHosting:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtCV8Settings39SettingsHostViewControllerRepresentableP33_660F061974F96B10B28E661239591CBA12MutableState *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_1DB441DC4();

}

- (void)hostViewController:(id)a3 didFailToHost:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtCV8Settings39SettingsHostViewControllerRepresentableP33_660F061974F96B10B28E661239591CBA12MutableState *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_1DB4420B8(a5);

}

- (void)hostViewController:(id)a3 didBeginHosting:(id)a4
{
  id v6;
  id v7;
  _TtCV8Settings39SettingsHostViewControllerRepresentableP33_660F061974F96B10B28E661239591CBA12MutableState *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1DB4427E4();

}

- (_TtCV8Settings39SettingsHostViewControllerRepresentableP33_660F061974F96B10B28E661239591CBA12MutableState)init
{
  _TtCV8Settings39SettingsHostViewControllerRepresentableP33_660F061974F96B10B28E661239591CBA12MutableState *result;

  result = (_TtCV8Settings39SettingsHostViewControllerRepresentableP33_660F061974F96B10B28E661239591CBA12MutableState *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV8Settings39SettingsHostViewControllerRepresentableP33_660F061974F96B10B28E661239591CBA12MutableState_role));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV8Settings39SettingsHostViewControllerRepresentableP33_660F061974F96B10B28E661239591CBA12MutableState__hostViewController));
  swift_unknownObjectRelease();
  sub_1DB442B10(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCV8Settings39SettingsHostViewControllerRepresentableP33_660F061974F96B10B28E661239591CBA12MutableState_completion));
}

@end
