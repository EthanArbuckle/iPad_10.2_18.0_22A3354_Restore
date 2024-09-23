@implementation NSLayoutConstraint(TelephonyUI)

+ (id)constraintWithItem:()TelephonyUI attribute:relatedBy:toItem:attribute:multiplier:constant:priority:
{
  void *v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = a3;
  objc_msgSend(v4, "setPriority:", v5);
  return v4;
}

@end
