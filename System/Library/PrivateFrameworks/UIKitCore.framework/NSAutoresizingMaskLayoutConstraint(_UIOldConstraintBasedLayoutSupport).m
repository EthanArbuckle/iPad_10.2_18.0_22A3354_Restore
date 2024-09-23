@implementation NSAutoresizingMaskLayoutConstraint(_UIOldConstraintBasedLayoutSupport)

+ (void)oldUIConstraintsWithAutoresizingMask:()_UIOldConstraintBasedLayoutSupport subitem:frame:superitem:bounds:
{
  id v7;
  id v8;

  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  objc_claimAutoreleasedReturnValue();
  __asm { BR              X10 }
}

@end
