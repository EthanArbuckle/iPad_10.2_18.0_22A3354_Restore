@implementation SBFZStackParticipantIdentifierDescriptionsForIdentifiers

void ___SBFZStackParticipantIdentifierDescriptionsForIdentifiers_block_invoke(uint64_t a1, unint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  _SBFZStackParticipantIdentifierDescription(a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
