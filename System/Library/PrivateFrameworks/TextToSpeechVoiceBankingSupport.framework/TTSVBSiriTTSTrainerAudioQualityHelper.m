@implementation TTSVBSiriTTSTrainerAudioQualityHelper

+ (id)assessAudioForBuffers:(id)a3
{
  id v3;
  _TtC31TextToSpeechVoiceBankingSupport28TTSVBAudioQualityMeasurement *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a3;
  v4 = objc_alloc_init(_TtC31TextToSpeechVoiceBankingSupport28TTSVBAudioQualityMeasurement);
  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v5 = (void *)getSiriTTSTrainerAudioQualityHelperClass_softClass;
  v13 = getSiriTTSTrainerAudioQualityHelperClass_softClass;
  if (!getSiriTTSTrainerAudioQualityHelperClass_softClass)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __getSiriTTSTrainerAudioQualityHelperClass_block_invoke;
    v9[3] = &unk_25198E470;
    v9[4] = &v10;
    __getSiriTTSTrainerAudioQualityHelperClass_block_invoke((uint64_t)v9);
    v5 = (void *)v11[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v10, 8);
  objc_msgSend(v6, "assessAudioQualityWithBuffers:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "SPL");
  -[TTSVBAudioQualityMeasurement setSpl:](v4, "setSpl:");
  objc_msgSend(v7, "SPL_end");
  -[TTSVBAudioQualityMeasurement setSplEnd:](v4, "setSplEnd:");
  objc_msgSend(v7, "SPL_unnormalized");
  -[TTSVBAudioQualityMeasurement setSplUnnormalized:](v4, "setSplUnnormalized:");
  objc_msgSend(v7, "SPL_unnormalized_end");
  -[TTSVBAudioQualityMeasurement setSplEndUnnormalized:](v4, "setSplEndUnnormalized:");
  objc_msgSend(v7, "SPL_threshold");
  -[TTSVBAudioQualityMeasurement setSplThreshold:](v4, "setSplThreshold:");
  objc_msgSend(v7, "SNR");
  -[TTSVBAudioQualityMeasurement setSnr:](v4, "setSnr:");
  objc_msgSend(v7, "SNR_end");
  -[TTSVBAudioQualityMeasurement setSnrEnd:](v4, "setSnrEnd:");
  objc_msgSend(v7, "SNR_unnormalized");
  -[TTSVBAudioQualityMeasurement setSnrUnnormalized:](v4, "setSnrUnnormalized:");
  objc_msgSend(v7, "SNR_unnormalized_end");
  -[TTSVBAudioQualityMeasurement setSnrEndUnnormalized:](v4, "setSnrEndUnnormalized:");
  objc_msgSend(v7, "SNR_threshold");
  -[TTSVBAudioQualityMeasurement setSnrThreshold:](v4, "setSnrThreshold:");

  return v4;
}

@end
