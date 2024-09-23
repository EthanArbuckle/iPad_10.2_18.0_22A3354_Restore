@implementation NSObject(TCObjectAdditions)

+ (BOOL)tc_overridesClassMethod:()TCObjectAdditions
{
  objc_class *v5;
  Method ClassMethod;

  v5 = (objc_class *)objc_opt_class();
  ClassMethod = class_getClassMethod(v5, a3);
  return ClassMethod != class_getClassMethod((Class)objc_msgSend(a1, "superclass"), a3);
}

@end
