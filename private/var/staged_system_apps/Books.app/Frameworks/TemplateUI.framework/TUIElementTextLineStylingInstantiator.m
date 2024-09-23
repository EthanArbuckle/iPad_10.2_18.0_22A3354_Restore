@implementation TUIElementTextLineStylingInstantiator

+ (Class)objectClass
{
  return (Class)objc_opt_class(_TUIElementTextLineStylingObject, a2);
}

+ (BOOL)instantiateChildren
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUITextModelBuilding;
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v9;
  id v10;
  id v11;
  objc_super v12;

  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___TUIElementTextLineStylingInstantiator;
  var0 = a4.var0;
  v9 = a5;
  v10 = a3;
  objc_msgSendSuper2(&v12, "configureObject:withNode:attributes:context:", v10, var0, v9, a6);
  v11 = objc_msgSend(v9, "integerForAttribute:withDefault:node:", 123, 0x7FFFFFFFFFFFFFFFLL, var0, v12.receiver, v12.super_class);

  objc_msgSend(v10, "setLines:", v11);
  objc_msgSend(v10, "setRelativeToDropLines:", 0);

}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector(v6, "ensureParagraphBoundary") & 1) != 0)
    objc_msgSend(v6, "ensureParagraphBoundary");
  if (objc_msgSend(v12, "lines") != (id)0x7FFFFFFFFFFFFFFFLL
    && (objc_opt_respondsToSelector(v6, "configureLineStylingForLines:relativeToDropCapLines:style:color:fontSpec:") & 1) != 0)
  {
    v7 = objc_msgSend(v12, "lines");
    v8 = objc_msgSend(v12, "relativeToDropLines");
    v9 = objc_msgSend(v12, "style");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "color"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fontSpec"));
    objc_msgSend(v6, "configureLineStylingForLines:relativeToDropCapLines:style:color:fontSpec:", v7, v8, v9, v10, v11);

  }
}

@end
