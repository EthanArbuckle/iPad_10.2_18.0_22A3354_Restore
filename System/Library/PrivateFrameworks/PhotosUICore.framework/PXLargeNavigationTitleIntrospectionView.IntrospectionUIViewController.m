@implementation PXLargeNavigationTitleIntrospectionView.IntrospectionUIViewController

- (_TtCV12PhotosUICoreP33_B710F56EBF55D875B7CD9A668821701039PXLargeNavigationTitleIntrospectionView29IntrospectionUIViewController)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtCV12PhotosUICoreP33_B710F56EBF55D875B7CD9A668821701039PXLargeNavigationTitleIntrospectionView29IntrospectionUIViewController *result;

  v4 = (char *)self
     + OBJC_IVAR____TtCV12PhotosUICoreP33_B710F56EBF55D875B7CD9A668821701039PXLargeNavigationTitleIntrospectionView29IntrospectionUIViewController_configuration;
  *(_QWORD *)v4 = 0;
  *((_WORD *)v4 + 4) = 513;
  v5 = a3;

  result = (_TtCV12PhotosUICoreP33_B710F56EBF55D875B7CD9A668821701039PXLargeNavigationTitleIntrospectionView29IntrospectionUIViewController *)sub_1A7AE4AFC();
  __break(1u);
  return result;
}

- (void)willMoveToParentViewController:(id)a3
{
  char *v4;
  id v5;
  uint64_t v6;
  __int16 v7;
  __int16 v8;
  char *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for PXLargeNavigationTitleIntrospectionView.IntrospectionUIViewController();
  v4 = (char *)v10.receiver;
  v5 = a3;
  -[PXLargeNavigationTitleIntrospectionView.IntrospectionUIViewController willMoveToParentViewController:](&v10, sel_willMoveToParentViewController_, v5);
  if (v5)
  {
    v6 = *(_QWORD *)&v4[OBJC_IVAR____TtCV12PhotosUICoreP33_B710F56EBF55D875B7CD9A668821701039PXLargeNavigationTitleIntrospectionView29IntrospectionUIViewController_configuration];
    v7 = v4[OBJC_IVAR____TtCV12PhotosUICoreP33_B710F56EBF55D875B7CD9A668821701039PXLargeNavigationTitleIntrospectionView29IntrospectionUIViewController_configuration
                           + 8];
    v8 = v4[OBJC_IVAR____TtCV12PhotosUICoreP33_B710F56EBF55D875B7CD9A668821701039PXLargeNavigationTitleIntrospectionView29IntrospectionUIViewController_configuration
                           + 9];
    v9 = (char *)v5;
    sub_1A6F6DD3C(v6, v7 | (v8 << 8), v5);

    v4 = v9;
  }

}

- (_TtCV12PhotosUICoreP33_B710F56EBF55D875B7CD9A668821701039PXLargeNavigationTitleIntrospectionView29IntrospectionUIViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtCV12PhotosUICoreP33_B710F56EBF55D875B7CD9A668821701039PXLargeNavigationTitleIntrospectionView29IntrospectionUIViewController *result;

  v4 = a4;
  result = (_TtCV12PhotosUICoreP33_B710F56EBF55D875B7CD9A668821701039PXLargeNavigationTitleIntrospectionView29IntrospectionUIViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
