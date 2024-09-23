@implementation TUIElementInstantiate

+ (id)containerAttributes
{
  if (qword_2CB270 != -1)
    dispatch_once(&qword_2CB270, &stru_23E318);
  return (id)qword_2CB268;
}

+ (unint64_t)definesScopes
{
  return 63;
}

+ (id)requiredBuilderProtocol
{
  return 0;
}

+ (BOOL)resolveAttributes
{
  return 0;
}

+ (BOOL)instantiateChildren
{
  return 0;
}

+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v9;
  id v10;
  unsigned int v11;
  void *v12;
  id v13;

  v13 = a3;
  v9 = a5;
  v10 = a6;
  v11 = objc_msgSend(v9, "nameReferenceForAttribute:node:", 137, a4.var0);
  v12 = objc_autoreleasePoolPush();
  objc_msgSend(v10, "instantiateElementReference:withChildrenOfNode:", v11, a4.var0);
  objc_autoreleasePoolPop(v12);

}

@end
