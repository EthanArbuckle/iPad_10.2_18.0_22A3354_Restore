@implementation SUIARadialGradientView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  SUIARadialGradientView *v7;
  Swift::String_optional v8;
  Swift::Bool v9;

  if (a3)
  {
    v4 = sub_247C9FDB4();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  v8.value._countAndFlagsBits = v4;
  v8.value._object = v6;
  v9 = SUIARadialGradientView._shouldAnimateProperty(withKey:)(v8);

  swift_bridgeObjectRelease();
  return v9;
}

+ (Class)layerClass
{
  sub_247C84B94(0, &qword_2576F0D10);
  return (Class)swift_getObjCClassFromMetadata();
}

- (SUIARadialGradientView)initWithFrame:(CGRect)a3
{
  return (SUIARadialGradientView *)sub_247C9CF10();
}

- (SUIARadialGradientView)initWithCoder:(id)a3
{
  SUIARadialGradientView *result;

  result = (SUIARadialGradientView *)sub_247C9FF04();
  __break(1u);
  return result;
}

- (NSArray)colors
{
  SUIARadialGradientView *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = SUIARadialGradientView.colors.getter();

  if (v3)
  {
    sub_247C84B94(0, &qword_2576F0C40);
    v4 = (void *)sub_247C9FDFC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)setColors:(id)a3
{
  unint64_t v3;
  SUIARadialGradientView *v5;

  v3 = (unint64_t)a3;
  if (a3)
  {
    sub_247C84B94(0, &qword_2576F0C40);
    v3 = sub_247C9FE08();
  }
  v5 = self;
  SUIARadialGradientView.colors.setter(v3);

}

- (NSArray)locations
{
  SUIARadialGradientView *v2;
  id v3;
  id v4;
  void *v5;

  v2 = self;
  v3 = -[SUIARadialGradientView layer](v2, sel_layer);
  objc_opt_self();
  v4 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_locations);

  if (v4)
  {
    sub_247C84B94(0, &qword_2576F0C38);
    sub_247C9FE08();

    v5 = (void *)sub_247C9FDFC();
    swift_bridgeObjectRelease();
  }
  else
  {

    v5 = 0;
  }
  return (NSArray *)v5;
}

- (void)setLocations:(id)a3
{
  uint64_t v3;
  SUIARadialGradientView *v5;
  id v6;
  void *v7;
  id v8;

  v3 = (uint64_t)a3;
  if (a3)
  {
    sub_247C84B94(0, &qword_2576F0C38);
    v3 = sub_247C9FE08();
  }
  v5 = self;
  v6 = -[SUIARadialGradientView layer](v5, sel_layer);
  objc_opt_self();
  v7 = (void *)swift_dynamicCastObjCClassUnconditional();
  if (v3)
  {
    sub_247C84B94(0, &qword_2576F0C38);
    v8 = (id)sub_247C9FDFC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v7, sel_setLocations_, v8);

}

+ (void)calculateDescriptionForGradientMajorDiameter:(double)a3 ringWidth:(double)a4 blurRadius:(double)a5 numberOfSamples:(int64_t)a6 completion:(id)a7
{
  void *v11;

  v11 = _Block_copy(a7);
  sub_247C9EE28(a6, (uint64_t)v11, a3, a4, a5);
  _Block_release(v11);
}

@end
