@implementation THGlossaryTextWrapController

- (id)floatingDrawableLayoutsForTarget:(id)a3
{
  uint64_t v4;
  double v5;
  void *v6;
  void *v7;

  v4 = objc_opt_class(THGlossaryEntryLayout, a2);
  *(_QWORD *)&v5 = TSUDynamicCast(v4, objc_msgSend(a3, "parent")).n128_u64[0];
  v7 = v6;
  if (objc_msgSend(v6, "bodyLayout", v5) == a3 && objc_msgSend(v7, "shouldWrapAgainstFloatingDrawables"))
    return objc_msgSend(objc_msgSend(v7, "floatingLayout"), "children");
  else
    return objc_alloc_init((Class)NSArray);
}

- (unint64_t)zOrderOfDrawable:(id)a3 forTarget:(id)a4
{
  uint64_t v6;
  double v7;
  id v8;

  v6 = objc_opt_class(THGlossaryEntryLayout, a2);
  *(_QWORD *)&v7 = TSUDynamicCast(v6, objc_msgSend(a4, "parent")).n128_u64[0];
  return objc_msgSend(objc_msgSend(v8, "info", v7), "bodyStorage") != a3;
}

@end
