@implementation PSLastCommunicatedFeatures

id __91___PSLastCommunicatedFeatures_lastCommunicationFromCandidates_direction_mechanisms_caches___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v4;

  +[_PSLastCommunicatedFeatures lastInteractionFromCandidate:caches:direction:mechanisms:](_PSLastCommunicatedFeatures, "lastInteractionFromCandidate:caches:direction:mechanisms:", a2, a1[4], a1[6], a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[_PSLastCommunicatedFeatures timeIntervalSinceNowForInteraction:](_PSLastCommunicatedFeatures, "timeIntervalSinceNowForInteraction:", v2);
    +[_PSLastCommunicatedFeatures featureValueFromTimeInterval:](_PSLastCommunicatedFeatures, "featureValueFromTimeInterval:");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D020D0]), "initWithIntValue:doubleValue:stringValue:BOOLValue:timeBucketValue:", 0, 0, 0, 0, 0);
  }
  v4 = (void *)v3;

  return v4;
}

@end
