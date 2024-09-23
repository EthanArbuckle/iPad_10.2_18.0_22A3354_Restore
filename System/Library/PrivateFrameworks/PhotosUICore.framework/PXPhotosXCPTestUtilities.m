@implementation PXPhotosXCPTestUtilities

+ (NSURL)urlToOpen
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  sub_1A67ECD50(0, (unint64_t *)&qword_1EE8C2740, (void (*)(uint64_t))MEMORY[0x1E0CAFFF8]);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v13 - v3;
  if (qword_1EE925850 != -1)
    swift_once();
  sub_1A67ECD50(0, &qword_1EE8D4938, (void (*)(uint64_t))type metadata accessor for PhotosAppTestLaunchConfiguration);
  v6 = __swift_project_value_buffer(v5, (uint64_t)qword_1EE92A338);
  swift_beginAccess();
  v7 = type metadata accessor for PhotosAppTestLaunchConfiguration();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v6, 1, v7))
  {
    v8 = sub_1A7ADC8A0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v4, 1, 1, v8);
    return (NSURL *)0;
  }
  else
  {
    sub_1A6970154(v6, (uint64_t)v4, (unint64_t *)&qword_1EE8C2740, (void (*)(uint64_t))MEMORY[0x1E0CAFFF8]);
    v10 = sub_1A7ADC8A0();
    v11 = *(_QWORD *)(v10 - 8);
    v12 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v4, 1, v10) != 1)
    {
      v12 = (void *)sub_1A7ADC7C8();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v4, v10);
    }
    return (NSURL *)v12;
  }
}

- (PXPhotosXCPTestUtilities)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PhotosXCPTestUtilities();
  return -[PXPhotosXCPTestUtilities init](&v3, sel_init);
}

+ (uint64_t)handleAppStartedLaunching
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE v17[24];

  sub_1A67ECD50(0, &qword_1EE8D4938, (void (*)(uint64_t))type metadata accessor for PhotosAppTestLaunchConfiguration);
  v1 = v0;
  MEMORY[0x1E0C80A78](v0);
  v3 = &v17[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v4);
  v6 = &v17[-v5];
  if (qword_1EE925850 != -1)
    swift_once();
  v7 = __swift_project_value_buffer(v1, (uint64_t)qword_1EE92A338);
  swift_beginAccess();
  sub_1A6970154(v7, (uint64_t)v6, &qword_1EE8D4938, (void (*)(uint64_t))type metadata accessor for PhotosAppTestLaunchConfiguration);
  v8 = type metadata accessor for PhotosAppTestLaunchConfiguration();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8);
  result = sub_1A67EC074((uint64_t)v6, &qword_1EE8D4938, (void (*)(uint64_t))type metadata accessor for PhotosAppTestLaunchConfiguration);
  if (v10 == 1)
  {
    v12 = sub_1A7AE48A4();
    v13 = *(_QWORD *)(v12 + 16);
    if (v13)
    {
      v6 = (_BYTE *)v12;
      sub_1A7AE4DF0();
      swift_unknownObjectRetain_n();
      v14 = swift_dynamicCastClass();
      if (!v14)
      {
        swift_bridgeObjectRelease();
        v14 = MEMORY[0x1E0DEE9D8];
      }
      v15 = *(_QWORD *)(v14 + 16);
      swift_release();
      if (v15 == v13 - 1)
      {
        v16 = swift_dynamicCastClass();
        if (!v16)
        {
          swift_bridgeObjectRelease();
          v16 = MEMORY[0x1E0DEE9D8];
        }
        goto LABEL_10;
      }
    }
    else
    {
      __break(1u);
    }
    swift_bridgeObjectRelease();
    v16 = sub_1A6960428((uint64_t)v6, (uint64_t)(v6 + 32), 1, (2 * v13) | 1);
LABEL_10:
    swift_bridgeObjectRelease();
    PhotosAppTestLaunchConfiguration.init(launchArguments:)(v16, (uint64_t)v3);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v3, 0, 1, v8);
    swift_beginAccess();
    sub_1A6D181D4((uint64_t)v3, v7);
    return swift_endAccess();
  }
  return result;
}

@end
