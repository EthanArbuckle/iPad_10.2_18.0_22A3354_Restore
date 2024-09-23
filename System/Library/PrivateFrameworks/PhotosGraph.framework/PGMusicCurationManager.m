@implementation PGMusicCurationManager

- (id)adjustCurationForCollection:(id)a3 initialCuration:(id)a4 cache:(id)a5 progressReporter:(id)a6 error:(id *)a7
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  PGMusicCurationManager *v17;
  char *v18;

  v11 = sub_1CA85B534();
  v13 = v12;
  v14 = (char *)a4;
  v15 = a5;
  v16 = a6;
  v17 = self;
  v18 = sub_1CA387FAC(v11, v13, v14, v15);
  swift_bridgeObjectRelease();

  return v18;
}

- (PGMusicCurationManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[PGMusicCurationManager init](&v3, sel_init);
}

@end
