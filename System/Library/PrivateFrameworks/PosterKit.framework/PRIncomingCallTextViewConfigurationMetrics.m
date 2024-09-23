@implementation PRIncomingCallTextViewConfigurationMetrics

+ (double)idealSpaceBetweenTopText:(id)a3 topFont:(id)a4 bottomText:(id)a5 bottomFont:(id)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  double v17;
  double v18;
  _QWORD v20[14];
  _BYTE v21[88];
  double v22;

  v8 = sub_18B72937C();
  v10 = v9;
  v11 = sub_18B72937C();
  v13 = v12;
  v14 = a4;
  v15 = a6;
  swift_bridgeObjectRetain();
  sub_18B70A89C(v8, v10, v14, (uint64_t)v20);
  v16 = v15;
  swift_bridgeObjectRetain();
  sub_18B70A89C(v11, v13, v16, (uint64_t)v21);
  sub_18B70AC94((uint64_t)v21);
  sub_18B70AC94((uint64_t)v20);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v17 = *(double *)&v20[12];
  v18 = v22;

  return round(v17 + v18);
}

- (PRIncomingCallTextViewConfigurationMetrics)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IncomingCallTextViewConfigurationMetrics();
  return -[PRIncomingCallTextViewConfigurationMetrics init](&v3, sel_init);
}

@end
