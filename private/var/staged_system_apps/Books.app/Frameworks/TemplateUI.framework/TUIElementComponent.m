@implementation TUIElementComponent

+ (id)containerAttributes
{
  if (qword_2CB598 != -1)
    dispatch_once(&qword_2CB598, &stru_240868);
  return (id)qword_2CB590;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(_TUIElementComponentObject, a2);
}

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return 0;
}

+ (id)attributesToIgnoreWhenResolving
{
  if (qword_2CB5A8 != -1)
    dispatch_once(&qword_2CB5A8, &stru_240888);
  return (id)qword_2CB5A0;
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

  v7 = a5;
  objc_msgSend(v7, "instantiateComponentWithReference:withChildrenOfNode:", objc_msgSend(a4, "nameReference"), a3.var0);

}

@end
