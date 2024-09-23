@implementation PGSpecificationBasedMusicCurator

- (PGSpecificationBasedMusicCurator)initWithOptions:(id)a3
{
  objc_class *ObjectType;
  char *v6;
  id v7;
  PGSpecificationBasedMusicCurator *v8;
  char *v9;
  __int128 v10;
  __int128 v11;
  PGSpecificationBasedMusicCurator *v12;
  objc_super v14;
  _OWORD v15[4];
  __int16 v16;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PGSpecificationBasedMusicCurator_maxAppleMusicSongs) = (Class)9;
  v6 = (char *)self + OBJC_IVAR___PGSpecificationBasedMusicCurator_fetchOptions;
  *((_QWORD *)v6 + 1) = 0x101010101010101;
  *((_QWORD *)v6 + 2) = 0x101010101010101;
  *(_QWORD *)v6 = 0x101010101010101;
  *(_OWORD *)(v6 + 24) = xmmword_1CA8DB980;
  *((_QWORD *)v6 + 5) = 0xD00000000000001ELL;
  *((_QWORD *)v6 + 6) = 0x80000001CA8DB840;
  v7 = a3;
  v8 = self;
  sub_1CA50F5C0(v7, (uint64_t)v15);
  v9 = (char *)v8 + OBJC_IVAR___PGSpecificationBasedMusicCurator_curationSpecification;
  v10 = v15[3];
  *((_OWORD *)v9 + 2) = v15[2];
  *((_OWORD *)v9 + 3) = v10;
  *((_WORD *)v9 + 32) = v16;
  v11 = v15[1];
  *(_OWORD *)v9 = v15[0];
  *((_OWORD *)v9 + 1) = v11;

  v14.receiver = v8;
  v14.super_class = ObjectType;
  v12 = -[PGSpecificationBasedMusicCurator init](&v14, sel_init);

  return v12;
}

- (id)musicCurationAndReturnError:(id *)a3
{
  PGSpecificationBasedMusicCurator *v3;
  _QWORD *v4;

  v3 = self;
  v4 = sub_1CA2F5D60();

  return v4;
}

- (PGSpecificationBasedMusicCurator)init
{
  PGSpecificationBasedMusicCurator *result;

  result = (PGSpecificationBasedMusicCurator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
