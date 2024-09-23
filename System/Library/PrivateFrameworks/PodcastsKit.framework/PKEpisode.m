@implementation PKEpisode

- (void)updateForDatabaseMatch
{
  PKEpisode *v2;

  v2 = self;
  sub_22FB26A7C();

}

- (PKEpisode)init
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  PKEpisode *result;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___PKEpisode_guid);
  *v2 = 0;
  v2[1] = 0;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___PKEpisode_uuid);
  *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___PKEpisode_episodeUuid);
  *v4 = 0;
  v4[1] = 0;

  result = (PKEpisode *)sub_22FB37D10();
  __break(1u);
  return result;
}

- (PKEpisode)initWithTitle:(id)a3 releaseDate:(id)a4 isExplicit:(BOOL)a5 duration:(double)a6 storeId:(id)a7 show:(id)a8 guid:(id)a9 uuid:(id)a10 streamUrl:(id)a11
{
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  PKEpisode *v32;
  uint64_t v34;
  uint64_t v35;
  _BOOL4 v36;
  PKEpisode *v37;

  v36 = a5;
  v37 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E3C3D8);
  MEMORY[0x24BDAC7A8]();
  v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = sub_22FB37B18();
  v19 = v18;
  if (a4)
  {
    sub_22FB379C8();
    v20 = sub_22FB379E0();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v17, 0, 1, v20);
  }
  else
  {
    v21 = sub_22FB379E0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v17, 1, 1, v21);
  }
  v22 = a10;
  if (a9)
  {
    a9 = (id)sub_22FB37B18();
    v24 = v23;
    v25 = (uint64_t)a11;
    if (a10)
      goto LABEL_6;
LABEL_9:
    v26 = 0;
    if (v25)
      goto LABEL_7;
LABEL_10:
    v29 = 0;
    goto LABEL_11;
  }
  v24 = 0;
  v25 = (uint64_t)a11;
  if (!a10)
    goto LABEL_9;
LABEL_6:
  v26 = sub_22FB37B18();
  v22 = v27;
  if (!v25)
    goto LABEL_10;
LABEL_7:
  v25 = sub_22FB37B18();
  v29 = v28;
LABEL_11:
  v30 = a7;
  v31 = a8;
  v32 = (PKEpisode *)sub_22FB2870C(v35, v19, (uint64_t)v17, v36, v30, v31, (uint64_t)a9, v24, a6, v26, (uint64_t)v22, v25, v29);

  return v32;
}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_255E3C3D0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_255E3C3D0 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  PKEpisode *v5;

  v4 = a3;
  v5 = self;
  Episode.encode(with:)((NSCoder)v4);

}

- (PKEpisode)initWithCoder:(id)a3
{
  return (PKEpisode *)Episode.init(coder:)(a3);
}

- (NSString)title
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_22FB37B0C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSDate)releaseDate
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255E3C3D8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22FB27D04((uint64_t)self + OBJC_IVAR___PKEpisode_releaseDate, (uint64_t)v4);
  v5 = sub_22FB379E0();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
  {
    v7 = (void *)sub_22FB379A4();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  }
  return (NSDate *)v7;
}

- (BOOL)isExplicit
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___PKEpisode_isExplicit);
}

- (double)duration
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___PKEpisode_duration);
}

- (PKEpisodeStoreId)storeId
{
  return (PKEpisodeStoreId *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___PKEpisode_storeId));
}

- (PKShow)show
{
  return (PKShow *)*(id *)((char *)&self->super.isa + OBJC_IVAR___PKEpisode_show);
}

- (NSString)guid
{
  return (NSString *)sub_22FB28418((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___PKEpisode_guid);
}

- (void)setGuid:(id)a3
{
  sub_22FB2847C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___PKEpisode_guid);
}

- (NSString)uuid
{
  return (NSString *)sub_22FB28418((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___PKEpisode_uuid);
}

- (void)setUuid:(id)a3
{
  sub_22FB2847C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___PKEpisode_uuid);
}

- (NSString)streamUrl
{
  return (NSString *)sub_22FB28418((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___PKEpisode_streamUrl);
}

- (NSString)episodeUuid
{
  return (NSString *)sub_22FB28418((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___PKEpisode_episodeUuid);
}

- (void)setEpisodeUuid:(id)a3
{
  sub_22FB2847C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___PKEpisode_episodeUuid);
}

+ (int64_t)mediaTaskType
{
  return 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_22FB27D4C((uint64_t)self + OBJC_IVAR___PKEpisode_releaseDate);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (id)contentFrom:(id)a3
{
  uint64_t v3;
  void *v4;

  swift_getObjCClassMetadata();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E3C720);
  v3 = sub_22FB37BC0();
  sub_22FB2BB4C(v3);
  swift_bridgeObjectRelease();
  v4 = (void *)sub_22FB37BB4();
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)itemFrom:(id)a3
{
  uint64_t v3;
  id v4;

  v3 = sub_22FB37B00();
  v4 = sub_22FB2B510(v3);
  swift_bridgeObjectRelease();
  return v4;
}

- (id)initFrom:(id)a3
{
  return sub_22FB2BE00(a3);
}

- (id)lookupEpisode
{
  PKEpisode *v2;
  id v3;

  v2 = self;
  v3 = sub_22FB2C100();

  return v3;
}

+ (void)fetchEpisodeFrom:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;

  v5 = _Block_copy(a4);
  _Block_copy(v5);
  v6 = a3;
  sub_22FB36774(a3, (void (**)(_QWORD, _QWORD, _QWORD))v5);
  _Block_release(v5);
  _Block_release(v5);

}

@end
