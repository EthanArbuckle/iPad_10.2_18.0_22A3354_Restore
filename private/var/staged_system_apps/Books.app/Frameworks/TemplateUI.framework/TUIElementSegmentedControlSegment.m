@implementation TUIElementSegmentedControlSegment

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUISegmentBuilding;
}

+ (BOOL)instantiateChildren
{
  return 0;
}

+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  id v11;

  v11 = a3;
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "stringForAttribute:node:", 215, a4.var0));
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = CFSTR("(null)");
  objc_msgSend(v11, "addSegmentWithTitle:", v10);

}

@end
