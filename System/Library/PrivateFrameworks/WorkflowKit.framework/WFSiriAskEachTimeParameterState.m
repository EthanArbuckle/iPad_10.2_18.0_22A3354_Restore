@implementation WFSiriAskEachTimeParameterState

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NSArray)containedVariables
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (unint64_t)hash
{
  return 0;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  v7 = (id)objc_opt_new();
  (*((void (**)(id, id, _QWORD))a5 + 2))(v6, v7, 0);

}

- (WFPropertyListObject)serializedRepresentation
{
  return 0;
}

@end
