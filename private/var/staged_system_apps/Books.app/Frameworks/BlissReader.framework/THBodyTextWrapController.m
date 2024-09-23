@implementation THBodyTextWrapController

- (id)floatingDrawableLayoutsForTarget:(id)a3
{
  uint64_t v4;
  double v5;
  id v6;

  v4 = objc_opt_class(THBodyLayout, a2);
  *(_QWORD *)&v5 = TSUDynamicCast(v4, a3).n128_u64[0];
  return objc_msgSend(objc_msgSend(v6, "pageLayout", v5), "floatingDrawableLayouts");
}

- (unint64_t)zOrderOfDrawable:(id)a3 forTarget:(id)a4
{
  uint64_t v6;
  double v7;
  id v8;

  v6 = objc_opt_class(THBodyLayout, a2);
  *(_QWORD *)&v7 = TSUDynamicCast(v6, a4).n128_u64[0];
  return (unint64_t)objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(v8, "parent", v7), "info"), "drawablesZOrder"), "zOrderOfDrawable:", a3);
}

@end
