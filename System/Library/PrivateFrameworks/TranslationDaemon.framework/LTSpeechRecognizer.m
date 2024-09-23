@implementation LTSpeechRecognizer

void __66___LTSpeechRecognizer_startRecognitionWithAutoStop_resultHandler___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && !WeakRetained[2])
  {
    v3 = (void *)WeakRetained[4];
    WeakRetained[4] = 0;
    v10 = WeakRetained;

    *((_BYTE *)v10 + 24) = 0;
    v4 = MEMORY[0x2495AE9CC](*(_QWORD *)(a1 + 32));
    v5 = (void *)*((_QWORD *)v10 + 9);
    *((_QWORD *)v10 + 9) = v4;

    objc_msgSend(*((id *)v10 + 1), "setDetectUtterances:", *(unsigned __int8 *)(a1 + 48));
    objc_msgSend(*((id *)v10 + 1), "setConcatenateUtterances:", 0);
    v6 = (void *)*((_QWORD *)v10 + 1);
    objc_msgSend(*((id *)v10 + 8), "localeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "runRecognitionWithResultStream:language:task:samplingRate:", v10, v7, CFSTR("MtApp"), 16000);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)*((_QWORD *)v10 + 2);
    *((_QWORD *)v10 + 2) = v8;

    WeakRetained = v10;
  }

}

void __42___LTSpeechRecognizer_addSpeechAudioData___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[2], "addAudioSampleData:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

void __31___LTSpeechRecognizer_endAudio__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[2], "endAudio");
    WeakRetained = v2;
  }

}

void __40___LTSpeechRecognizer_cancelRecognition__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[1], "cancelRecognition");
    objc_msgSend(v3[2], "endAudio");
    v2 = v3[2];
    v3[2] = 0;

    WeakRetained = v3;
  }

}

void __50___LTSpeechRecognizer_triggerServerSideEndPointer__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[2], "triggerServerSideEndPointer");
    WeakRetained = v2;
  }

}

void __70___LTSpeechRecognizer_speechRecognizer_didFinishRecognitionWithError___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;

    if (!*((_BYTE *)v3 + 24))
    {
      v5 = v3[4];
      if (v5
        && (objc_msgSend(MEMORY[0x24BDF6448], "resultWithPackage:locale:modelVersion:isFinal:", v5, v3[8], v3[7], 1),
            (v6 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v7 = (void *)v6;
        v8 = *(_QWORD *)(a1 + 32);
      }
      else
      {
        v8 = *(_QWORD *)(a1 + 32);
        if (!v8)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (void *)MEMORY[0x24BDD1540];
          v11 = *MEMORY[0x24BDF6530];
          v16[0] = *MEMORY[0x24BDD0FC8];
          objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("EMPTY_RECOGNITION_ERROR_DESCRIPTION"), &stru_251A15610, 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v17[0] = v12;
          v16[1] = *MEMORY[0x24BDD0FD8];
          objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SPEECH_NOT_RECOGNIZED_ERROR_DESCRIPTION"), &stru_251A15610, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v17[1] = v13;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 10, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDF6448], "emptyResultWithLocale:isFinal:", v3[8], 1);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "_recognizedResult:error:", v7, v15);

          goto LABEL_10;
        }
        v7 = 0;
      }
      objc_msgSend(*(id *)(a1 + 40), "_recognizedResult:error:", v7, v8);
LABEL_10:

    }
  }

}

void __71___LTSpeechRecognizer_speechRecognizer_didRecognizeFinalResultPackage___block_invoke(id *a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  id v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (WeakRetained && !*((_BYTE *)WeakRetained + 24))
  {
    v6 = WeakRetained;
    if (objc_msgSend(WeakRetained[1], "detectUtterances"))
    {
      *((_BYTE *)v6 + 24) = 1;
      objc_msgSend(a1[4], "cancelRecognition");
      objc_msgSend(MEMORY[0x24BDF6448], "resultWithPackage:locale:modelVersion:isFinal:", a1[5], v6[8], v6[7], 1);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "_recognizedResult:error:", v4, 0);
    }
    else
    {
      v5 = a1[5];
      v4 = v6[4];
      v6[4] = v5;
    }

    v3 = v6;
  }

}

void __66___LTSpeechRecognizer_speechRecognizer_didRecognizePartialResult___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v18 = a1;
    v19 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "tokens");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", &stru_251A15610);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v21;
      do
      {
        v11 = 0;
        v12 = v9;
        do
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v6);
          v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v11);
          if (v12 && objc_msgSend(v12, "hasSpaceAfter"))
            objc_msgSend(v5, "appendString:", CFSTR(" "));
          v14 = (void *)MEMORY[0x24BE2E748];
          objc_msgSend(v13, "tokenName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "hatToQsrString:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
            objc_msgSend(v5, "appendString:", v16);
          v9 = v13;

          ++v11;
          v12 = v9;
        }
        while (v8 != v11);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    v3 = v19;
    objc_msgSend(MEMORY[0x24BDF6448], "resultWithResult:locale:modelVersion:isFinal:", *(_QWORD *)(v18 + 32), v19[8], v19[7], 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v18 + 40), "_recognizedResult:error:", v17, 0);

  }
}

@end
