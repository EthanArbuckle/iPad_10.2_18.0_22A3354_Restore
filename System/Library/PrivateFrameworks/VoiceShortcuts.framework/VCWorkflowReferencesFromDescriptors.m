@implementation VCWorkflowReferencesFromDescriptors

id __VCWorkflowReferencesFromDescriptors_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (objc_msgSend(v3, "objectType"))
  {
    v4 = 0;
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "referenceForWorkflowID:includingTombstones:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

@end
