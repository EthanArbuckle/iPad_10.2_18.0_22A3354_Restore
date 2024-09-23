@implementation PGPhotosChallengeEvaluationContext

- (PGGraph)graph
{
  return (PGGraph *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR___PGPhotosChallengeEvaluationContext_graph));
}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                   + OBJC_IVAR___PGPhotosChallengeEvaluationContext_photoLibrary));
}

- (CLSSceneTaxonomyHierarchy)sceneTaxonomy
{
  return (CLSSceneTaxonomyHierarchy *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                              + OBJC_IVAR___PGPhotosChallengeEvaluationContext_sceneTaxonomy));
}

- (CLSServiceManager)serviceManager
{
  return (CLSServiceManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR___PGPhotosChallengeEvaluationContext_serviceManager));
}

- (CLSPublicEventManager)publicEventManager
{
  return (CLSPublicEventManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR___PGPhotosChallengeEvaluationContext_publicEventManager));
}

- (PGPhotosChallengeEvaluationContext)init
{
  PGPhotosChallengeEvaluationContext *result;

  result = (PGPhotosChallengeEvaluationContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
