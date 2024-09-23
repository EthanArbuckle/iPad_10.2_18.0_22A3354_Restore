@implementation TUIElementStructProp

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIStructBuilding;
}

+ (BOOL)resolveAttributes
{
  return 0;
}

+ (id)attributesToEvaluate
{
  if (qword_2CB4C0 != -1)
    dispatch_once(&qword_2CB4C0, &stru_23FE90);
  return (id)qword_2CB4B8;
}

+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a5;
  objc_msgSend(v9, "setValue:forKey:", objc_msgSend(v8, "unresolvedValueForAttribute:node:", 215, a4.var0), (unsigned __int16)objc_msgSend(v8, "propertyNameForAttribute:node:", 137, a4.var0));

}

@end
