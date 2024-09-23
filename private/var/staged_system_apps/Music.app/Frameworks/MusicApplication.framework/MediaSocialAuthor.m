@implementation MediaSocialAuthor

- (_TtC16MusicApplication17MediaSocialAuthor)init
{
  return (_TtC16MusicApplication17MediaSocialAuthor *)sub_AD4A68();
}

- (id)copyWithZone:(void *)a3
{
  _TtC16MusicApplication17MediaSocialAuthor *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  _QWORD v8[3];
  uint64_t v9;

  v3 = self;
  sub_AD4B1C(v8);

  v4 = v9;
  v5 = __swift_project_boxed_opaque_existential_1(v8, v9);
  v6 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v5, v4);
  __swift_destroy_boxed_opaque_existential_1(v8);
  return v6;
}

- (int64_t)hash
{
  _TtC16MusicApplication17MediaSocialAuthor *v2;
  id v3;

  v2 = self;
  v3 = sub_AD4CD8();

  return (int64_t)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->name[OBJC_IVAR____TtC16MusicApplication17MediaSocialAuthor_name]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->name[OBJC_IVAR____TtC16MusicApplication17MediaSocialAuthor_authorType]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->name[OBJC_IVAR____TtC16MusicApplication17MediaSocialAuthor_dsid]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->name[OBJC_IVAR____TtC16MusicApplication17MediaSocialAuthor_identifier]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16MusicApplication17MediaSocialAuthor_permissions));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16MusicApplication17MediaSocialAuthor_storePlatformData));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication17MediaSocialAuthor_lookupItemArtworkInfo));
}

@end
