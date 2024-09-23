@implementation PKWeatherEventViewHost

+ (id)createWithWeatherInformation:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t *v13;
  id v14;
  void *v15;
  uint64_t v17;

  v4 = type metadata accessor for WeatherEventView();
  v6 = MEMORY[0x1E0C80A78](v4, v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x1E0C80A78](v6, v9);
  v12 = (char *)&v17 - v11;
  *(uint64_t *)((char *)&v17 - v11) = (uint64_t)a3;
  v13 = (uint64_t *)((char *)&v17 + *(int *)(v10 + 20) - v11);
  *v13 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE4A9BF0);
  swift_storeEnumTagMultiPayload();
  objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1EE4A83D8));
  sub_19D542A80((uint64_t)v12, (uint64_t)v8);
  v14 = a3;
  v15 = (void *)sub_19DE85CA4();
  sub_19D542AC4((uint64_t)v12);
  objc_msgSend(v15, sel_setUserInteractionEnabled_, 0);

  return v15;
}

- (PKWeatherEventViewHost)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for WeatherEventViewHost();
  return -[PKWeatherEventViewHost init](&v3, sel_init);
}

@end
