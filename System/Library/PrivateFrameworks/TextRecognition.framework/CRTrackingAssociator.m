@implementation CRTrackingAssociator

+ (id)performAssociationOnCandidates:(id)a3 useRegionsAtOCRDispatchTime:(BOOL)a4 existingRegions:(id)a5 newRegionHandler:(id)a6 matchedRegionHandler:(id)a7
{
  return (id)objc_msgSend(a1, "performAssociationOnCandidates:useRegionsAtOCRDispatchTime:existingRegions:fineGrainedResults:newRegionHandler:matchedRegionHandler:", a3, a4, a5, 0, a6, a7);
}

+ (id)performAssociationOnCandidates:(id)a3 useRegionsAtOCRDispatchTime:(BOOL)a4 existingRegions:(id)a5 fineGrainedResults:(id)a6 newRegionHandler:(id)a7 matchedRegionHandler:(id)a8
{
  return 0;
}

@end
