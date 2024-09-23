@implementation WFSymbolAlignment

+ (CGSize)absoluteOffsetFor:(id)a3 fontSize:(double)a4
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v4 = sub_20CE67638();
  sub_20CE3E4D8(v4, v5);
  v7 = v6;
  v9 = v8;
  swift_bridgeObjectRelease();
  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (WFSymbolAlignment)init
{
  return (WFSymbolAlignment *)SymbolAlignment.init()();
}

@end
