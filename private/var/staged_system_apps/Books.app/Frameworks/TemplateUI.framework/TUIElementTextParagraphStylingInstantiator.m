@implementation TUIElementTextParagraphStylingInstantiator

+ (Class)objectClass
{
  return (Class)objc_opt_class(_TUIElementTextParagraphStylingObject, a2);
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
  double v11;
  double v12;
  objc_super v13;

  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___TUIElementTextParagraphStylingInstantiator;
  var0 = a4.var0;
  v9 = a5;
  v10 = a3;
  objc_msgSendSuper2(&v13, "configureObject:withNode:attributes:context:", v10, var0, v9, a6);
  objc_msgSend(v9, "floatForAttribute:node:", 109, var0, v13.receiver, v13.super_class);
  objc_msgSend(v10, "setIndentFirstLine:");
  objc_msgSend(v9, "floatForAttribute:node:", 110, var0);
  objc_msgSend(v10, "setIndentLeading:");
  objc_msgSend(v9, "floatForAttribute:node:", 111, var0);
  v12 = v11;

  objc_msgSend(v10, "setIndentTrailing:", v12);
}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector(v6, "ensureParagraphBoundary") & 1) != 0)
    objc_msgSend(v6, "ensureParagraphBoundary");
  if ((objc_opt_respondsToSelector(v6, "configureParagraphStyle:") & 1) != 0)
    objc_msgSend(v6, "configureParagraphStyle:", v7);

}

@end
