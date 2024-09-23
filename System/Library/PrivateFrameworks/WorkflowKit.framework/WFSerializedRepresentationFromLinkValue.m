@implementation WFSerializedRepresentationFromLinkValue

id __WFSerializedRepresentationFromLinkValue_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v2, "wfSerializedRepresentation");
  else
    WFSerializedRepresentationFromLinkValue(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
