@implementation BundledNotificationDelaySamePropensitiesInput

- (NSSet)featureNames
{
  void *v2;

  sub_21DB956E8((uint64_t)&unk_24E190220);
  swift_arrayDestroy();
  v2 = (void *)sub_21DB96D10();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v4;
  double v5;
  void *v6;
  id v7;

  if (sub_21DB96B78() == 0x694D74657366666FLL && v4 == 0xEA0000000000736ELL || (sub_21DB96EFC() & 1) != 0)
  {
    v5 = *(double *)self->offsetMins;
    v6 = (void *)objc_opt_self();
    swift_retain();
    v7 = objc_msgSend(v6, sel_featureValueWithDouble_, v5);
    swift_release();
  }
  else
  {
    v7 = 0;
  }
  swift_bridgeObjectRelease();
  return v7;
}

@end
