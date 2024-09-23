@implementation ImageJoeColorAnalyzer

- (id)colorsForImage:(id)a3
{
  void *v5;
  id v6;
  id result;
  id v8;
  unint64_t v9;
  uint64_t v10;
  Class isa;

  v5 = (void *)objc_opt_self(ImageColorAnalyzer);
  v6 = a3;
  swift_retain(self);
  result = objc_msgSend(v5, "colorsForImage:", v6);
  if (result)
  {
    v8 = result;
    v9 = sub_1000340C4();
    v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v8, v9);

    swift_release(self);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v10);
    return isa;
  }
  else
  {
    __break(1u);
  }
  return result;
}

@end
