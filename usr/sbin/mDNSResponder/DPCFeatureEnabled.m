@implementation DPCFeatureEnabled

void __DPCFeatureEnabled_block_invoke(id a1)
{
  DPCFeatureEnabled_sEnabled = _os_feature_enabled_impl("mDNSResponder", "discovery_proxy_client");
}

@end
