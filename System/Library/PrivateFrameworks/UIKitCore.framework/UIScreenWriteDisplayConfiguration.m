@implementation UIScreenWriteDisplayConfiguration

void ___UIScreenWriteDisplayConfiguration_block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v2;
  void *v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained[24])
  {
    v4 = WeakRetained;
    -[UIScreen _capturingAssertionForReason:]((id *)WeakRetained, CFSTR("Initial CADisplay cloned value"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v4[24];
    v4[24] = v2;

    WeakRetained = v4;
  }

}

@end
