@implementation CSSecureLogInitIfNeeded

void __CSSecureLogInitIfNeeded_block_invoke()
{
  os_log_t v0;
  void *v1;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v0 = os_log_create("com.apple.corespeech", "ExclaveKit");
  v1 = (void *)CSLogContextFacilityCoreSpeechExclave;
  CSLogContextFacilityCoreSpeechExclave = (uint64_t)v0;

  v2 = CSLogContextFacilityCoreSpeechExclave;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeechExclave, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "CSSecureLogInitIfNeeded_block_invoke";
    _os_log_impl(&dword_2117D4000, v2, OS_LOG_TYPE_DEFAULT, "%s ::: CoreSpeech Secure logging initialized", (uint8_t *)&v3, 0xCu);
  }
}

@end
