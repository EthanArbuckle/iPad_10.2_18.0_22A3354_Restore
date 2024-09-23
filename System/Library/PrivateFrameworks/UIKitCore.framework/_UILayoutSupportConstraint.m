@implementation _UILayoutSupportConstraint

+ (id)classFallbacksForKeyedArchiver
{
  objc_class *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v2 = (objc_class *)objc_opt_class();
  v4[0] = NSStringFromClass(v2);
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
}

@end
