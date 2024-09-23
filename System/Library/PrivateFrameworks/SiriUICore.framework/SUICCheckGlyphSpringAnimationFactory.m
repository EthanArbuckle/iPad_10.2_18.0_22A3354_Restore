@implementation SUICCheckGlyphSpringAnimationFactory

void __77___SUICCheckGlyphSpringAnimationFactory_springAnimationWithKeyPath_velocity___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend((id)_SUICDefaultSpringAnimationFactory, "setVelocity:", *(double *)(a1 + 48));
  objc_msgSend((id)_SUICDefaultSpringAnimationFactory, "springAnimationWithKeyPath:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
