@implementation JSLocalizerObject

- (id)string:(id)a3 :(id)a4
{
  id v7;
  id v8;
  _TtC10PodcastsUI17JSLocalizerObject *v9;
  void *v10;
  void *v11;

  swift_getObjectType();
  sub_1DA53F9A4();
  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = (void *)sub_1DA6701D4();
  v11 = (void *)sub_1DA6701E0();

  return v11;
}

- (id)decimal:(id)a3 :(id)a4 :(id)a5 :(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _TtC10PodcastsUI17JSLocalizerObject *v15;
  void *v16;
  void *v17;

  swift_getObjectType();
  sub_1DA53F9A4();
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = self;
  v16 = (void *)sub_1DA6701D4();
  v17 = (void *)sub_1DA6701E0();

  return v17;
}

- (id)stringWithCount:(id)a3 :(id)a4 :(id)a5
{
  id v9;
  id v10;
  id v11;
  _TtC10PodcastsUI17JSLocalizerObject *v12;
  void *v13;
  void *v14;

  swift_getObjectType();
  sub_1DA53F9A4();
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = self;
  v13 = (void *)sub_1DA6701D4();
  v14 = (void *)sub_1DA6701E0();

  return v14;
}

- (id)formattedCount:(id)a3
{
  return sub_1DA542454(self, (uint64_t)a2, a3);
}

- (id)fileSize:(id)a3
{
  return sub_1DA542454(self, (uint64_t)a2, a3);
}

- (id)formattedDateWithContext:(id)a3 :(id)a4 :(id)a5
{
  id v9;
  id v10;
  id v11;
  _TtC10PodcastsUI17JSLocalizerObject *v12;
  void *v13;
  void *v14;

  swift_getObjectType();
  sub_1DA53F9A4();
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = self;
  v13 = (void *)sub_1DA6701D4();
  v14 = (void *)sub_1DA6701E0();

  return v14;
}

- (id)formattedDateInSentence:(id)a3 :(id)a4 :(id)a5
{
  id v9;
  id v10;
  id v11;
  _TtC10PodcastsUI17JSLocalizerObject *v12;
  void *v13;
  void *v14;

  sub_1DA53F9A4();
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = self;
  v13 = (void *)sub_1DA6701D4();
  v14 = (void *)sub_1DA6701E0();

  return v14;
}

- (id)relativeDate:(id)a3
{
  id v5;
  _TtC10PodcastsUI17JSLocalizerObject *v6;
  void *v7;
  void *v8;

  swift_getObjectType();
  sub_1DA53F9A4();
  v5 = a3;
  v6 = self;
  v7 = (void *)sub_1DA6701D4();
  v8 = (void *)sub_1DA6701E0();

  return v8;
}

- (_TtC10PodcastsUI17JSLocalizerObject)init
{
  _TtC10PodcastsUI17JSLocalizerObject *result;

  result = (_TtC10PodcastsUI17JSLocalizerObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC10PodcastsUI17JSLocalizerObject_localizer);
}

@end
