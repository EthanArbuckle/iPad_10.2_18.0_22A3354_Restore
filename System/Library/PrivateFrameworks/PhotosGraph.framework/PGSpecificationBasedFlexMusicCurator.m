@implementation PGSpecificationBasedFlexMusicCurator

- (PGSpecificationBasedFlexMusicCurator)initWithOptions:(id)a3
{
  objc_class *ObjectType;
  id v6;
  PGSpecificationBasedFlexMusicCurator *v7;
  char *v8;
  __int128 v9;
  __int128 v10;
  PGSpecificationBasedFlexMusicCurator *v11;
  objc_super v13;
  _OWORD v14[4];
  __int16 v15;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = a3;
  v7 = self;
  sub_1CA50F5C0(v6, (uint64_t)v14);
  v8 = (char *)v7 + OBJC_IVAR___PGSpecificationBasedFlexMusicCurator_curationSpecification;
  v9 = v14[3];
  *((_OWORD *)v8 + 2) = v14[2];
  *((_OWORD *)v8 + 3) = v9;
  *((_WORD *)v8 + 32) = v15;
  v10 = v14[1];
  *(_OWORD *)v8 = v14[0];
  *((_OWORD *)v8 + 1) = v10;

  v13.receiver = v7;
  v13.super_class = ObjectType;
  v11 = -[PGSpecificationBasedFlexMusicCurator init](&v13, sel_init);

  return v11;
}

- (id)musicCurationAndReturnError:(id *)a3
{
  void *v4;
  void *v5;
  id v6;

  sub_1CA2A3DA0();
  v4 = (void *)swift_allocError();
  swift_willThrow();
  if (a3)
  {
    v5 = (void *)sub_1CA85A358();

    v6 = v5;
    *a3 = v5;
  }
  else
  {

  }
  return 0;
}

- (PGSpecificationBasedFlexMusicCurator)init
{
  PGSpecificationBasedFlexMusicCurator *result;

  result = (PGSpecificationBasedFlexMusicCurator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
