@implementation PXFailingMockAudioSession

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  return self;
}

- (void)_fail
{
  -[PXAudioSession performInternalChanges:](self, "performInternalChanges:", &__block_literal_global_25_185904);
}

void __34__PXFailingMockAudioSession__fail__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_msgSend(v2, "setStatus:", 4);
  objc_msgSend(MEMORY[0x1E0CB35C8], "px_audioSessionErrorWithCode:", 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setError:", v3);

}

@end
