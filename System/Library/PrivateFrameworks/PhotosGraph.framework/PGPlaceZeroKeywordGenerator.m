@implementation PGPlaceZeroKeywordGenerator

- (PGPlaceZeroKeywordGenerator)initWithGraph:(id)a3 photoLibrary:(id)a4 searchComputationCache:(id)a5 options:(id)a6
{
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  PGPlaceZeroKeywordGenerator *v13;

  v9 = sub_1CA85B414();
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (PGPlaceZeroKeywordGenerator *)sub_1CA4FAC80(v10, v11, v12, v9);

  return v13;
}

- (id)generatePlaceZeroKeywords
{
  PGPlaceZeroKeywordGenerator *v2;

  v2 = self;
  sub_1CA4F2AB4();
}

- (PGPlaceZeroKeywordGenerator)init
{
  PGPlaceZeroKeywordGenerator *result;

  result = (PGPlaceZeroKeywordGenerator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
