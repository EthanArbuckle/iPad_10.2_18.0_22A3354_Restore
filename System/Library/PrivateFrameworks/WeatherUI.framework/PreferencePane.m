@implementation PreferencePane

- (NSString)name
{
  _TtC9WeatherUI14PreferencePane *v2;
  void *v3;

  v2 = self;
  sub_1AFFA80D8();

  v3 = (void *)sub_1B0008554();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setName:(id)a3
{
  _TtC9WeatherUI14PreferencePane *v4;

  sub_1B0008584();
  v4 = self;
  sub_1AFFA8194();

}

- (NSArray)panes
{
  _TtC9WeatherUI14PreferencePane *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_1AFFA84F8();

  if (v3)
  {
    type metadata accessor for PreferencePane();
    v4 = (void *)sub_1B000877C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)setPanes:(id)a3
{
  _TtC9WeatherUI14PreferencePane *v4;

  if (a3)
  {
    type metadata accessor for PreferencePane();
    sub_1B0008788();
  }
  v4 = self;
  sub_1AFFA85B8();

}

- (unsigned)changeSequence
{
  return sub_1AFFA8884();
}

- (void)setChangeSequence:(unsigned int)a3
{
  sub_1AFFA88E8(a3);
}

- (NSArray)sliders
{
  return (NSArray *)sub_1AFFA8A48((uint64_t)self, (uint64_t)a2, sub_1AFFA896C);
}

- (void)setSliders:(id)a3
{
  _TtC9WeatherUI14PreferencePane *v4;

  sub_1B0008788();
  v4 = self;
  sub_1AFFA89CC();

}

- (NSArray)toggles
{
  return (NSArray *)sub_1AFFA8A48((uint64_t)self, (uint64_t)a2, sub_1AFFA8A84);
}

- (void)setToggles:(id)a3
{
  _TtC9WeatherUI14PreferencePane *v4;

  sub_1B0008788();
  v4 = self;
  sub_1AFFA8AE4();

}

- (NSArray)pickersSelections
{
  return (NSArray *)sub_1AFFA8A48((uint64_t)self, (uint64_t)a2, sub_1AFFA8B60);
}

- (void)setPickersSelections:(id)a3
{
  _TtC9WeatherUI14PreferencePane *v4;

  sub_1B0008788();
  v4 = self;
  sub_1AFFA8BC0();

}

- (NSDictionary)defaultSliders
{
  return (NSDictionary *)sub_1AFFA8D3C((uint64_t)self, (uint64_t)a2, sub_1AFFA8C44);
}

- (void)setDefaultSliders:(id)a3
{
  _TtC9WeatherUI14PreferencePane *v4;

  sub_1B0008470();
  v4 = self;
  sub_1AFFA8CB8();

}

- (NSDictionary)defaultToggles
{
  return (NSDictionary *)sub_1AFFA8D3C((uint64_t)self, (uint64_t)a2, sub_1AFFA8D84);
}

- (void)setDefaultToggles:(id)a3
{
  _TtC9WeatherUI14PreferencePane *v4;

  sub_1B0008470();
  v4 = self;
  sub_1AFFA8DF8();

}

- (NSDictionary)defaultPickersSelections
{
  return (NSDictionary *)sub_1AFFA8D3C((uint64_t)self, (uint64_t)a2, sub_1AFFA8E7C);
}

- (void)setDefaultPickersSelections:(id)a3
{
  _TtC9WeatherUI14PreferencePane *v4;

  sub_1B0008470();
  v4 = self;
  sub_1AFFA8F20();

}

- (NSDictionary)pickerOptions
{
  uint64_t v2;
  void *v3;

  sub_1AFFA9030();
  if (v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1EFD08);
    v3 = (void *)sub_1B0008464();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSDictionary *)v3;
}

- (void)setPickerOptions:(id)a3
{
  _TtC9WeatherUI14PreferencePane *v4;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1EFD08);
    sub_1B0008470();
  }
  v4 = self;
  sub_1AFFA90E0();

}

- (_TtP9WeatherUI22PreferencePaneDelegate_)delegate
{
  id v2;

  sub_1AFFA91A0();
  return (_TtP9WeatherUI22PreferencePaneDelegate_ *)v2;
}

- (void)setDelegate:(id)a3
{
  _TtC9WeatherUI14PreferencePane *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1AFFA9228();

}

- (_TtC9WeatherUI14PreferencePane)initWithName:(id)a3 panes:(id)a4
{
  _TtC9WeatherUI14PreferencePane *result;

  sub_1B0008584();
  type metadata accessor for PreferencePane();
  sub_1B0008788();
  PreferencePane.init(name:panes:)();
  return result;
}

- (_TtC9WeatherUI14PreferencePane)initWithName:(id)a3 userDefaults:(id)a4 sliders:(id)a5 toggles:(id)a6 pickerOptions:(id)a7 pickerSelections:(id)a8
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v9 = sub_1B0008584();
  v11 = v10;
  v12 = sub_1B0008470();
  v13 = sub_1B0008470();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1EFD08);
  v14 = sub_1B0008470();
  v15 = sub_1B0008470();
  v16 = a4;
  return (_TtC9WeatherUI14PreferencePane *)PreferencePane.init(name:userDefaults:sliders:toggles:pickerOptions:pickerSelections:)(v9, v11, a4, v12, v13, v14, v15);
}

- (id)getValueForKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC9WeatherUI14PreferencePane *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  __n128 v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD v16[3];
  uint64_t v17;

  v4 = sub_1B0008584();
  v6 = v5;
  v7 = self;
  sub_1AFFAA3E0(v4, v6, (uint64_t)v16);

  swift_bridgeObjectRelease();
  v8 = v17;
  if (!v17)
    return 0;
  v9 = __swift_project_boxed_opaque_existential_1(v16, v17);
  v10 = *(_QWORD *)(v8 - 8);
  v11 = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v10 + 16))(v13, v11);
  v14 = (void *)sub_1B0008F98();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  return v14;
}

- (void)set:(id)a3 forKey:(id)a4
{
  id v6;
  _TtC9WeatherUI14PreferencePane *v7;
  id v8;
  _TtC9WeatherUI14PreferencePane *v9;
  _OWORD v10[2];

  if (a3)
  {
    v6 = a4;
    v7 = self;
    swift_unknownObjectRetain();
    sub_1B0008C44();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v8 = a4;
    v9 = self;
  }
  sub_1B0008584();

  sub_1AFFAA728((uint64_t)v10);
  swift_bridgeObjectRelease();
  sub_1AFF6A69C((uint64_t)v10);
}

- (void)preferencePaneDidChangeWithPreference:(id)a3
{
  id v4;
  _TtC9WeatherUI14PreferencePane *v5;

  v4 = a3;
  v5 = self;
  sub_1AFFAA960();

}

- (void)reset
{
  _TtC9WeatherUI14PreferencePane *v2;

  v2 = self;
  sub_1AFFAAA48();

}

- (_TtC9WeatherUI14PreferencePane)init
{
  PreferencePane.init()();
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE784E0);
  OUTLINED_FUNCTION_21_93(v3);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1F0718);
  OUTLINED_FUNCTION_21_93(v4);
  OUTLINED_FUNCTION_7_136();
  OUTLINED_FUNCTION_7_136();
  OUTLINED_FUNCTION_7_136();
  OUTLINED_FUNCTION_7_136();
  OUTLINED_FUNCTION_7_136();
  OUTLINED_FUNCTION_7_136();
  OUTLINED_FUNCTION_7_136();
  sub_1AFB4996C((uint64_t)self + OBJC_IVAR____TtC9WeatherUI14PreferencePane_delegate);

}

+ (_TtC9WeatherUI14PreferencePane)calliopeRenderingPreferencePane
{
  return (_TtC9WeatherUI14PreferencePane *)static PreferencePane.calliopeRenderingPreferencePane.getter();
}

+ (_TtC9WeatherUI14PreferencePane)aegirRenderingPreferencePane
{
  return (_TtC9WeatherUI14PreferencePane *)static PreferencePane.aegirRenderingPreferencePane.getter();
}

- (id)fractionValueForOption:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _TtC9WeatherUI14PreferencePane *v7;
  Swift::String v8;
  void *v9;

  v4 = sub_1B0008584();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  v9 = (void *)PreferencePane.fractionValue(forOption:)(v8);

  swift_bridgeObjectRelease();
  return v9;
}

@end
