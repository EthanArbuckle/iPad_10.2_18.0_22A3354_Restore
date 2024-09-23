@implementation PUPickerSearchBar

- (PUPickerSearchBar)initWithPhotoLibrary:(id)a3 searchHandler:(id)a4 scopeHandler:(id)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = _Block_copy(a4);
  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v8;
  return (PUPickerSearchBar *)sub_1AAC385F8(a3, (uint64_t)sub_1AAC394E4, v9, (uint64_t)sub_1AAC394EC, v10);
}

- (void)updateSearchText:(id)a3
{
  id v4;
  PUPickerSearchBar *v5;

  v4 = a3;
  v5 = self;
  sub_1AAC38D5C();

}

- (void)updateContainer:(id)a3
{
  id v5;
  PUPickerSearchBar *v6;

  v5 = a3;
  v6 = self;
  sub_1AAC38DDC(a3);

}

- (PUPickerSearchBar)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AAC38EA4();
}

- (CGSize)intrinsicContentSize
{
  PUPickerSearchBar *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_1AAC38F84();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (PUPickerSearchBar)initWithFrame:(CGRect)a3
{
  sub_1AAC38F9C();
}

- (void).cxx_destruct
{
  swift_release();

}

@end
