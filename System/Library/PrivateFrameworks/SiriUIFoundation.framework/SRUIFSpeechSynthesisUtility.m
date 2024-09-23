@implementation SRUIFSpeechSynthesisUtility

+ (BOOL)isSpeechSynthesisErrorUserCancelled:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "code");
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v4 == 1 && (objc_msgSend(v5, "isEqualToString:", CFSTR("TTSError")) & 1) != 0;
  return v6;
}

@end
