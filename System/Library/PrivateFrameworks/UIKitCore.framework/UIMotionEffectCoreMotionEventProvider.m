@implementation UIMotionEffectCoreMotionEventProvider

uint64_t __62___UIMotionEffectCoreMotionEventProvider_stopGeneratingEvents__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setDeviceMotionCallback:info:interval:fsync:", 0, 0, 0, 0.0);
}

uint64_t __63___UIMotionEffectCoreMotionEventProvider_startGeneratingEvents__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  objc_msgSend(v2, "deviceMotionUpdateInterval");
  return objc_msgSend(v2, "setDeviceMotionCallback:info:interval:fsync:", _HandleNewDeviceMotion, v1, 0);
}

@end
