@implementation MusicAppTheme

+ (UIColor)titleColor
{
  return (UIColor *)sub_FDFF8((uint64_t)a1, (uint64_t)a2, &qword_1F95B0, (id *)&qword_210338, (uint64_t)sub_FDF98);
}

+ (UIColor)secondaryLabelColor
{
  return (UIColor *)sub_FDFF8((uint64_t)a1, (uint64_t)a2, &qword_1F95B8, (id *)&qword_210340, (uint64_t)sub_FDFC8);
}

+ (UIColor)systemLightGrayColor
{
  return (UIColor *)sub_FDFF8((uint64_t)a1, (uint64_t)a2, &qword_1F95D0, (id *)&qword_210358, (uint64_t)sub_FE184);
}

+ (double)defaultLibraryAddKeepLocalControlHeight
{
  return 28.0;
}

+ (CGSize)cloudDownloadImageSizeForTraitCollection:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = a3;
  sub_FF750((uint64_t)v3);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

+ (id)cloudDownloadImageForTintColor:(id)a3 outlineColor:(id)a4 traitCollection:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  swift_getObjCClassMetadata(a1);
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)sub_FE790(v8, v9, v10);

  return v11;
}

- (MusicAppTheme)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Theme();
  return -[MusicAppTheme init](&v3, "init");
}

@end
