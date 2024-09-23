@implementation _UIOrbitalColorView.CogOrbitLayer

- (_TtCC5UIKit19_UIOrbitalColorViewP33_E7ADF61CB2C5BE84A3CEAD4215D687DF13CogOrbitLayer)init
{
  return (_TtCC5UIKit19_UIOrbitalColorViewP33_E7ADF61CB2C5BE84A3CEAD4215D687DF13CogOrbitLayer *)sub_1855D1064();
}

- (_TtCC5UIKit19_UIOrbitalColorViewP33_E7ADF61CB2C5BE84A3CEAD4215D687DF13CogOrbitLayer)initWithLayer:(id)a3
{
  return (_TtCC5UIKit19_UIOrbitalColorViewP33_E7ADF61CB2C5BE84A3CEAD4215D687DF13CogOrbitLayer *)sub_1855D2A94((uint64_t)self, (uint64_t)a2, (uint64_t)a3, sub_1855D12A8);
}

- (_TtCC5UIKit19_UIOrbitalColorViewP33_E7ADF61CB2C5BE84A3CEAD4215D687DF13CogOrbitLayer)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1855D2FC4();
}

- (void)layoutSublayers
{
  _TtCC5UIKit19_UIOrbitalColorViewP33_E7ADF61CB2C5BE84A3CEAD4215D687DF13CogOrbitLayer *v2;

  v2 = self;
  sub_1855D1560();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC5UIKit19_UIOrbitalColorViewP33_E7ADF61CB2C5BE84A3CEAD4215D687DF13CogOrbitLayer_clockwiseCog));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC5UIKit19_UIOrbitalColorViewP33_E7ADF61CB2C5BE84A3CEAD4215D687DF13CogOrbitLayer_counterClockwiseCog));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC5UIKit19_UIOrbitalColorViewP33_E7ADF61CB2C5BE84A3CEAD4215D687DF13CogOrbitLayer_container));
  swift_bridgeObjectRelease();
}

@end
