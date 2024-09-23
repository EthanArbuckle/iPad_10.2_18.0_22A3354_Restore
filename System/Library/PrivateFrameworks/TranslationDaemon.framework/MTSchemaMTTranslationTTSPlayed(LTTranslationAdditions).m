@implementation MTSchemaMTTranslationTTSPlayed(LTTranslationAdditions)

+ (id)lt_initWithSourceOrTargetLanguage:()LTTranslationAdditions isAutoplayTranslation:playbackSpeed:audioChannel:
{
  id v10;
  void *v11;
  uint64_t v12;

  v10 = objc_alloc_init(MEMORY[0x24BE95270]);
  v11 = v10;
  if (a3 <= 2)
    objc_msgSend(v10, "setSourceOrTarget:", a3);
  objc_msgSend(v11, "setIsAutoplayTranslation:", a4);
  if (a5 <= 4)
    objc_msgSend(v11, "setPlaybackSpeed:", a5);
  if ((unint64_t)(a6 - 1) < 5)
    v12 = a6;
  else
    v12 = 0;
  objc_msgSend(v11, "setAudioChannel:", v12);
  return v11;
}

@end
