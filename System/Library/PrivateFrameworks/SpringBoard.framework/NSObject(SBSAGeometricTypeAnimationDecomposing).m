@implementation NSObject(SBSAGeometricTypeAnimationDecomposing)

- (id)_independentlyAnimatableMemberKeyPathsForProperty:()SBSAGeometricTypeAnimationDecomposing
{
  if (_independentlyAnimatableMemberKeyPathsForProperty____onceToken != -1)
    dispatch_once(&_independentlyAnimatableMemberKeyPathsForProperty____onceToken, &__block_literal_global_91);
  return (id)_independentlyAnimatableMemberKeyPathsForProperty____emptySet;
}

- (void)_setValue:()SBSAGeometricTypeAnimationDecomposing byUpdatingMemberKeypaths:forKeyPath:
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSObject+SBSAGeometricTypeAnimationDecomposing.m"), 31, CFSTR("Subclass Responsibility"));

}

@end
