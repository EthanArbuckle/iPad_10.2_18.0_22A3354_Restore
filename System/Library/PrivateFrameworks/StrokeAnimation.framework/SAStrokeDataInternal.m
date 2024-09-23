@implementation SAStrokeDataInternal

- (SAStrokeDataInternal)initWithCharacters:(id)a3 strokeAnimationRepresention:(id)a4 strokeNames:(id)a5 pronunciations:(id)a6
{
  if (a3)
    sub_2295E1678();
  sub_2295E15F4();
  if (a5)
    sub_2295E1678();
  if (a6)
    sub_2295E1678();
  return (SAStrokeDataInternal *)StrokeData.init(characters:strokeAnimationRepresention:strokeNames:pronunciations:)();
}

- (SAStrokeDataInternal)init
{
  StrokeData.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
