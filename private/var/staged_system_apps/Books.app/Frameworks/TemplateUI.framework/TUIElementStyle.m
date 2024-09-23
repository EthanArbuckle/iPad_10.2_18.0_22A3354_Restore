@implementation TUIElementStyle

+ (id)supportedAttributes
{
  return +[TUIAttributeSet supportedAttributesStyling](TUIAttributeSet, "supportedAttributesStyling");
}

+ (unint64_t)definesScopes
{
  return 0;
}

+ (BOOL)needsAttributesEvaluated
{
  return 0;
}

+ (BOOL)resolveAttributes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return 0;
}

+ (id)attributesToEvaluate
{
  if (qword_2CB300 != -1)
    dispatch_once(&qword_2CB300, &stru_23EB40);
  return (id)qword_2CB2F8;
}

+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v8;
  id v9;
  unsigned int v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;

  v8 = a5;
  v9 = a6;
  v13 = 0uLL;
  v14 = 0;
  if (v8)
    objc_msgSend(v8, "styleDefinitionWithNode:nameAttribute:inheritAttribute:", a4.var0, 137, 106);
  v10 = objc_msgSend(v8, "closureForNode:", a4.var0);
  v11 = v13;
  v12 = v14;
  objc_msgSend(v9, "defineStyle:closure:", &v11, v10);

}

@end
