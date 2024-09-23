@implementation LTServerSpeechSession

uint64_t __45___LTServerSpeechSession_addSpeechAudioData___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_translateSpeechAudioData:", a2);
}

void __50___LTServerSpeechSession_languageDetectionResult___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[17] = 1;
    if (WeakRetained[18])
      objc_msgSend(WeakRetained, "delegateTranslationDidFinishWithError:", *((_QWORD *)WeakRetained + 3));
  }

}

void __56___LTServerSpeechSession_translationDidFinishWithError___block_invoke(uint64_t a1)
{
  id *v2;
  id *v3;
  uint64_t v4;
  char v5;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    if (*((_BYTE *)WeakRetained + 16) && !*((_BYTE *)WeakRetained + 17))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v3 = (id *)(a1 + 32);
      if (!v4
        || (v5 = objc_msgSend(WeakRetained[10], "forceLanguageDetectionResult"), v2 = WeakRetained, (v5 & 1) != 0))
      {
        *((_BYTE *)v2 + 18) = 1;
        objc_storeStrong(v2 + 3, *v3);
        goto LABEL_6;
      }
    }
    else
    {
      v3 = (id *)(a1 + 32);
    }
    objc_msgSend(v2, "delegateTranslationDidFinishWithError:", *v3);
  }
LABEL_6:

}

@end
