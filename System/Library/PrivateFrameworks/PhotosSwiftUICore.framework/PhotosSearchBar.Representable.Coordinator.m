@implementation PhotosSearchBar.Representable.Coordinator

- (_TtCVV17PhotosSwiftUICore15PhotosSearchBarP33_C1804BBFE1C0AEF33B5596BB912C852313Representable11Coordinator)init
{
  sub_2440C2EB8();
}

- (void).cxx_destruct
{
  _BYTE v2[208];

  memcpy(v2, (char *)self+ OBJC_IVAR____TtCVV17PhotosSwiftUICore15PhotosSearchBarP33_C1804BBFE1C0AEF33B5596BB912C852313Representable11Coordinator_parent, sizeof(v2));
  sub_2441E9510((uint64_t)v2);
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4;
  _TtCVV17PhotosSwiftUICore15PhotosSearchBarP33_C1804BBFE1C0AEF33B5596BB912C852313Representable11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_2441E61C4(v4);

}

- (void)textViewDidChange:(id)a3
{
  id v4;
  _TtCVV17PhotosSwiftUICore15PhotosSearchBarP33_C1804BBFE1C0AEF33B5596BB912C852313Representable11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_2441E62C8(v4);

}

- (void)textViewDidChangeSelection:(id)a3
{
  id v4;
  _TtCVV17PhotosSwiftUICore15PhotosSearchBarP33_C1804BBFE1C0AEF33B5596BB912C852313Representable11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_2441E63A4(v4);

}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtCVV17PhotosSwiftUICore15PhotosSearchBarP33_C1804BBFE1C0AEF33B5596BB912C852313Representable11Coordinator *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_2441E650C(v8, v9, v10);

  return v12;
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  _TtCVV17PhotosSwiftUICore15PhotosSearchBarP33_C1804BBFE1C0AEF33B5596BB912C852313Representable11Coordinator *v13;

  length = a4.length;
  location = a4.location;
  v9 = sub_2442876D0();
  v11 = v10;
  v12 = a3;
  v13 = self;
  LOBYTE(length) = sub_2441E69B4(v12, location, length, v9, v11);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void)tapAction:(id)a3
{
  id v4;
  _TtCVV17PhotosSwiftUICore15PhotosSearchBarP33_C1804BBFE1C0AEF33B5596BB912C852313Representable11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_2441E7518();

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return sub_24409ADB4() & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return sub_24409ADB4() & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceivePress:(id)a4
{
  return sub_24409ADB4() & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4
{
  return sub_24409ADB4() & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return sub_24409ADB4() & 1;
}

@end
