@implementation SVXSessionCreateSpeechRecordingAlertPolicy

void ___SVXSessionCreateSpeechRecordingAlertPolicy_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x24BE09350];
  v3 = a2;
  v4 = (id)objc_msgSend(v2, "newWithBuilder:", &__block_literal_global_678);
  objc_msgSend(v3, "setStartingAlertBehavior:", v4);

}

uint64_t ___SVXSessionCreateSpeechRecordingAlertPolicy_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setBeepSoundID:", 5);
}

@end
