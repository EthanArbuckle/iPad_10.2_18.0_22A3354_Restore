@implementation TUIElementComponentRender

+ (id)containerAttributes
{
  if (qword_2CB5D8 != -1)
    dispatch_once(&qword_2CB5D8, &stru_2408E8);
  return (id)qword_2CB5D0;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(_TUIElementComponentRenderObject, a2);
}

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIModelBuilding;
}

+ (id)builderProtocols
{
  return 0;
}

+ (BOOL)resolveAttributes
{
  return 1;
}

+ (id)attributesToIgnoreWhenResolving
{
  if (qword_2CB5E8 != -1)
    dispatch_once(&qword_2CB5E8, &stru_240908);
  return (id)qword_2CB5E0;
}

+ (BOOL)instantiateChildren
{
  return 0;
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v8;

  var0 = a4.var0;
  v8 = a3;
  objc_msgSend(v8, "setNameReference:", objc_msgSend(a5, "nameReferenceForAttribute:node:", 137, var0));

}

+ (void)instantiateNode:(id)a3 withObject:(id)a4 context:(id)a5
{
  id v7;
  unsigned int v8;
  void *v9;
  id v10;

  v10 = a4;
  v7 = a5;
  v8 = objc_msgSend(v10, "nameReference");
  v9 = objc_autoreleasePoolPush();
  objc_msgSend(v7, "instantiateRender:withChildrenOfNode:", v8, a3.var0);
  objc_autoreleasePoolPop(v9);

}

@end
