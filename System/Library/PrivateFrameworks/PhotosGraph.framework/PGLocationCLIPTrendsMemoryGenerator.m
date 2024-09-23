@implementation PGLocationCLIPTrendsMemoryGenerator

- (PGLocationCLIPTrendsMemoryGenerator)initWithMemoryGenerationContext:(id)a3 configurations:(id)a4
{
  PGLocationCLIPTrendsMemoryGenerator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PGLocationCLIPTrendsMemoryGenerator;
  v4 = -[PGLocationTrendsMemoryGenerator initWithMemoryGenerationContext:configurations:](&v6, sel_initWithMemoryGenerationContext_configurations_, a3, a4);
  if (v4)
    v4->_minimumSceneAnalysisVersion = objc_msgSend(MEMORY[0x1E0D781F8], "latestVersion");
  return v4;
}

- (unint64_t)minimumSceneAnalysisVersion
{
  return self->_minimumSceneAnalysisVersion;
}

- (void)setMinimumSceneAnalysisVersion:(unint64_t)a3
{
  self->_minimumSceneAnalysisVersion = a3;
}

@end
