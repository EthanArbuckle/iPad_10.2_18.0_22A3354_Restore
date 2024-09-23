@implementation ZN2md19FeatureFlagProviderC2EPU28objcproto17OS

_QWORD *___ZN2md19FeatureFlagProviderC2EPU28objcproto17OS_dispatch_queue8NSObject_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 32);
  **(_BYTE **)(v4 + 40) = 1;
  return updateFeatureFlag(0, *(float **)(v4 + 56), a4);
}

_QWORD *___ZN2md19FeatureFlagProviderC2EPU28objcproto17OS_dispatch_queue8NSObject_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 32);
  **(_BYTE **)(v4 + 40) = 1;
  return updateFeatureFlag(1, *(float **)(v4 + 56), a4);
}

_QWORD *___ZN2md19FeatureFlagProviderC2EPU28objcproto17OS_dispatch_queue8NSObject_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 32);
  **(_BYTE **)(v4 + 40) = 1;
  return updateFeatureFlag(2, *(float **)(v4 + 56), a4);
}

@end
