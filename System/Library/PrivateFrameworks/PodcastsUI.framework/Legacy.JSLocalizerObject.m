@implementation Legacy.JSLocalizerObject

- (NSString)identifier
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DA66F88C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (id)decimal:(id)a3 :(int64_t)a4 :(int64_t)a5
{
  _TtCO10PodcastsUI6Legacy17JSLocalizerObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v8 = self;
  v9 = a3;
  sub_1DA5EA520(a3, a4, a5);
  v11 = v10;

  if (v11)
  {
    v12 = (void *)sub_1DA66F88C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)duration:(double)a3
{
  void *v3;
  void *v6;
  _TtCO10PodcastsUI6Legacy17JSLocalizerObject *v7;
  id v8;
  void *v9;

  if (a3 != 0.0)
  {
    v6 = (void *)objc_opt_self();
    v7 = self;
    v8 = objc_msgSend(v6, sel_prettyShortStringWithDuration_abbreviated_, 0, a3);
    if (v8)
    {
      v9 = v8;
      sub_1DA66F8BC();

      v3 = (void *)sub_1DA66F88C();
      swift_bridgeObjectRelease();
      return v3;
    }

  }
  v3 = 0;
  return v3;
}

- (id)duration:(double)a3 abbreviated:(BOOL)a4
{
  void *v4;
  _BOOL8 v5;
  void *v8;
  _TtCO10PodcastsUI6Legacy17JSLocalizerObject *v9;
  id v10;
  void *v11;

  if (a3 != 0.0)
  {
    v5 = a4;
    v8 = (void *)objc_opt_self();
    v9 = self;
    v10 = objc_msgSend(v8, sel_prettyShortStringWithDuration_abbreviated_, v5, a3);
    if (v10)
    {
      v11 = v10;
      sub_1DA66F8BC();

      v4 = (void *)sub_1DA66F88C();
      swift_bridgeObjectRelease();
      return v4;
    }

  }
  v4 = 0;
  return v4;
}

- (id)formatDate:(id)a3 :(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _TtCO10PodcastsUI6Legacy17JSLocalizerObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDADE6C8);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1DA66F8BC();
  v11 = v10;
  if (a4)
  {
    sub_1DA66C40C();
    v12 = sub_1DA66C430();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v8, 0, 1, v12);
  }
  else
  {
    v13 = sub_1DA66C430();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v8, 1, 1, v13);
  }
  v14 = self;
  sub_1DA5EABA8(v9, v11, (uint64_t)v8);
  v16 = v15;

  swift_bridgeObjectRelease();
  sub_1DA47E2F0((uint64_t)v8, &qword_1EDADE6C8);
  if (!v16)
    return 0;
  v17 = (void *)sub_1DA66F88C();
  swift_bridgeObjectRelease();
  return v17;
}

- (id)formattedCount:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtCO10PodcastsUI6Legacy17JSLocalizerObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;

  v5 = sub_1DA66C4D8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = self;
  v10 = a3;
  sub_1DA66C49C();
  sub_1DA5EB0E0(a3);
  v12 = v11;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  if (!v12)
    return 0;
  v13 = (void *)sub_1DA66F88C();
  swift_bridgeObjectRelease();
  return v13;
}

- (id)friendlyDate:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _TtCO10PodcastsUI6Legacy17JSLocalizerObject *v14;
  void *v15;
  uint64_t v16;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDADE6C8);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v16 - v9;
  if (a3)
  {
    sub_1DA66C40C();
    v11 = sub_1DA66C430();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    v11 = sub_1DA66C430();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  }
  sub_1DA5BAD58((uint64_t)v10, (uint64_t)v7);
  sub_1DA66C430();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v7, 1, v11) == 1)
  {
    sub_1DA47E2F0((uint64_t)v7, &qword_1EDADE6C8);
    sub_1DA47E2F0((uint64_t)v10, &qword_1EDADE6C8);
    return 0;
  }
  else
  {
    v14 = self;
    sub_1DA66C3D0();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v11);

    sub_1DA47E2F0((uint64_t)v10, &qword_1EDADE6C8);
    v15 = (void *)sub_1DA66F88C();
    swift_bridgeObjectRelease();
    return v15;
  }
}

- (id)stringWithCount:(id)a3 :(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtCO10PodcastsUI6Legacy17JSLocalizerObject *v9;
  void *v10;

  v6 = sub_1DA66F8BC();
  v8 = v7;
  v9 = self;
  sub_1DA5EB578(v6, v8, a4);

  swift_bridgeObjectRelease();
  v10 = (void *)sub_1DA66F88C();
  swift_bridgeObjectRelease();
  return v10;
}

- (id)timeAgo:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _TtCO10PodcastsUI6Legacy17JSLocalizerObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDADE6C8);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1DA66C40C();
    v8 = sub_1DA66C430();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = sub_1DA66C430();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = self;
  sub_1DA5EB7BC((uint64_t)v7);
  v12 = v11;

  sub_1DA47E2F0((uint64_t)v7, &qword_1EDADE6C8);
  if (!v12)
    return 0;
  v13 = (void *)sub_1DA66F88C();
  swift_bridgeObjectRelease();
  return v13;
}

- (id)timeRange:(id)a3 :(id)a4 :(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _TtCO10PodcastsUI6Legacy17JSLocalizerObject *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void (*v21)(char *, uint64_t);
  void *v22;
  uint64_t v24;

  v6 = sub_1DA66C430();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v24 - v11;
  sub_1DA66C40C();
  sub_1DA66C40C();
  v13 = sub_1DA66F8BC();
  v15 = v14;
  v16 = self;
  v17 = sub_1DA5EBD80(v13, v15);
  v18 = (void *)sub_1DA66C3F4();
  v19 = (void *)sub_1DA66C3F4();
  v20 = objc_msgSend(v17, sel_stringFromDate_toDate_, v18, v19);

  sub_1DA66F8BC();
  swift_bridgeObjectRelease();

  v21 = *(void (**)(char *, uint64_t))(v7 + 8);
  v21(v9, v6);
  v21(v12, v6);
  v22 = (void *)sub_1DA66F88C();
  swift_bridgeObjectRelease();
  return v22;
}

- (id)timeRangeWithFormat:(id)a3 :(id)a4 :(id)a5 :(id)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _TtCO10PodcastsUI6Legacy17JSLocalizerObject *v20;
  void (*v21)(char *, uint64_t);
  void *v22;
  uint64_t v24;

  v8 = sub_1DA66C430();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v24 - v13;
  sub_1DA66C40C();
  sub_1DA66C40C();
  v15 = sub_1DA66F8BC();
  v17 = v16;
  if (a6)
  {
    v18 = sub_1DA66F8BC();
    a6 = v19;
  }
  else
  {
    v18 = 0;
  }
  v20 = self;
  sub_1DA5EC078((uint64_t)v14, (uint64_t)v11, v15, v17, v18, (uint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v21 = *(void (**)(char *, uint64_t))(v9 + 8);
  v21(v11, v8);
  v21(v14, v8);
  v22 = (void *)sub_1DA66F88C();
  swift_bridgeObjectRelease();
  return v22;
}

- (_TtCO10PodcastsUI6Legacy17JSLocalizerObject)init
{
  _TtCO10PodcastsUI6Legacy17JSLocalizerObject *result;

  result = (_TtCO10PodcastsUI6Legacy17JSLocalizerObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtCO10PodcastsUI6Legacy17JSLocalizerObject_locale;
  v4 = sub_1DA66C4D8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
