@implementation UISplitViewController

- (int64_t)preferredStatusBarStyle
{
  UISplitViewController *v2;
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t result;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v2 = self;
  v3 = -[UISplitViewController viewControllers](v2, "viewControllers");
  v4 = sub_10004A07C(0, (unint64_t *)&qword_10119D470, UIViewController_ptr);
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);

  if ((unint64_t)v5 >> 62)
  {
    if (v5 < 0)
      v10 = v5;
    else
      v10 = v5 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v11 = _CocoaArrayWrapper.endIndex.getter(v10);
    swift_bridgeObjectRelease(v5);
    if (v11)
      goto LABEL_3;
LABEL_11:

    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (!*(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_11;
LABEL_3:
  if ((v5 & 0xC000000000000001) != 0)
  {
    v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v5);
    goto LABEL_6;
  }
  if (*(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v7 = *(id *)(v5 + 32);
LABEL_6:
    v8 = v7;
    v9 = objc_msgSend(v7, "preferredStatusBarStyle", swift_bridgeObjectRelease(v5).n128_f64[0]);

    return (int64_t)v9;
  }
  __break(1u);
  return result;
}

@end
