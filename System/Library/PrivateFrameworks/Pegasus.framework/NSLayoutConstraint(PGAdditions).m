@implementation NSLayoutConstraint(PGAdditions)

+ (id)PG_constraintWithItem:()PGAdditions attribute:relatedBy:toItem:attribute:multiplier:constant:priority:
{
  void *v5;
  double v6;

  objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = a4;
  objc_msgSend(v5, "setPriority:", v6);
  return v5;
}

@end
