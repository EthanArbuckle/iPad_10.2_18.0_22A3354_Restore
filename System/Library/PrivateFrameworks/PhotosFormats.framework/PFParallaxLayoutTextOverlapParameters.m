@implementation PFParallaxLayoutTextOverlapParameters

+ (PFParallaxLayoutTextOverlapParameters)systemParameters
{
  PFParallaxLayoutTextOverlapParameters *result;
  void *v3;
  SEL v4;
  id v5;

  if (systemParameters_once[0] != -1)
    dispatch_once(systemParameters_once, &__block_literal_global_5835);
  if (sSystemParameters)
    return (PFParallaxLayoutTextOverlapParameters *)(id)sSystemParameters;
  v3 = (void *)_PFAssertFailHandler();
  +[PFParallaxLayoutTextOverlapParameters setSystemParameters:](v3, v4, v5);
  return result;
}

+ (void)setSystemParameters:(id)a3
{
  objc_storeStrong((id *)&sSystemParameters, a3);
}

+ (PFParallaxLayoutTextOverlapParameters)standardNumericTextParameters
{
  return (PFParallaxLayoutTextOverlapParameters *)objc_alloc_init(PFParallaxLayoutNumericTextOverlapParameters);
}

+ (PFParallaxLayoutTextOverlapParameters)standardAlphabeticTextParameters
{
  return (PFParallaxLayoutTextOverlapParameters *)objc_alloc_init(PFParallaxLayoutAlphabeticalTextOverlapParameters);
}

- (double)maxTopOverlapForTopRect:(CGRect)a3 isInteractive:(BOOL)a4
{
  PFParallaxLayoutTextOverlapParameters *v4;
  SEL v5;

  v4 = (PFParallaxLayoutTextOverlapParameters *)_PFAssertFailHandler();
  return -[PFParallaxLayoutTextOverlapParameters bottomAreaHeight](v4, v5);
}

- (double)bottomAreaHeight
{
  return self->_bottomAreaHeight;
}

- (double)targetBottomOverlap
{
  return self->_targetBottomOverlap;
}

- (double)maxBottomOverlap
{
  return self->_maxBottomOverlap;
}

void __57__PFParallaxLayoutTextOverlapParameters_systemParameters__block_invoke()
{
  uint64_t v0;
  void *v1;

  if (!sSystemParameters)
  {
    +[PFParallaxLayoutTextOverlapParameters standardNumericTextParameters](PFParallaxLayoutTextOverlapParameters, "standardNumericTextParameters");
    v0 = objc_claimAutoreleasedReturnValue();
    v1 = (void *)sSystemParameters;
    sSystemParameters = v0;

  }
}

@end
