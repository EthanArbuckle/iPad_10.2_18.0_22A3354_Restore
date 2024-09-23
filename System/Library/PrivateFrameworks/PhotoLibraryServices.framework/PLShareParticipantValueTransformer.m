@implementation PLShareParticipantValueTransformer

+ (NSArray)allowedTopLevelClasses
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___PLShareParticipantValueTransformer;
  objc_msgSendSuper2(&v7, sel_allowedTopLevelClasses);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  objc_msgSend(v5, "addObject:", objc_opt_class());
  return (NSArray *)v5;
}

@end
