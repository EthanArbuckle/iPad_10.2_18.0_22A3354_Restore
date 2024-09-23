@implementation UITraitCollection

- (int64_t)sourceOutlineStyle
{
  UITraitCollection *v2;
  unint64_t v3;
  int64_t v4;
  int64_t result;
  unint64_t v6;

  v2 = self;
  v3 = -[UITraitCollection sourceListPresentationContext](v2, "sourceListPresentationContext");
  v4 = v3;
  if (v3 >= 2)
  {
    v6 = v3;
    result = _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)(&type metadata for DOCSourceOutlinePresentationContext, &v6, &type metadata for DOCSourceOutlinePresentationContext, &type metadata for Int);
    __break(1u);
  }
  else
  {

    return v4;
  }
  return result;
}

- (int64_t)sourceListPresentationContext
{
  return -[UITraitCollection _splitViewControllerContext](self, "_splitViewControllerContext") == 0;
}

- (_TtC5Files21DOCNavigationBarStyle)preferredNavigationBarStyle_objc
{
  UITraitCollection *v2;
  BOOL v3;
  objc_class *v4;
  _BYTE *v5;
  UITraitCollection *v6;
  objc_super v8;

  v2 = self;
  v3 = DOCUsePadIdiomForTraits(v2)
    && (id)-[UITraitCollection horizontalSizeClass](v2, "horizontalSizeClass") == (id)2;
  v4 = (objc_class *)type metadata accessor for DOCNavigationBarStyle();
  v5 = objc_allocWithZone(v4);
  v5[OBJC_IVAR____TtC5Files21DOCNavigationBarStyle_style] = v3;
  v8.receiver = v5;
  v8.super_class = v4;
  v6 = -[UITraitCollection init](&v8, "init");

  return (_TtC5Files21DOCNavigationBarStyle *)v6;
}

@end
