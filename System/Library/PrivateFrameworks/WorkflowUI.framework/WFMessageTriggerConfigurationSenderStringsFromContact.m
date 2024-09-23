@implementation WFMessageTriggerConfigurationSenderStringsFromContact

uint64_t __WFMessageTriggerConfigurationSenderStringsFromContact_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

id __WFMessageTriggerConfigurationSenderStringsFromContact_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unformattedInternationalStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
