@implementation SVXSpeechSynthesisMetricsContextFactory

- (id)creationContextFromInstrumentMetrics:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v8;
  double v9;
  double v10;
  uint64_t v11;
  float v12;
  uint64_t v13;
  float v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[15];
  _QWORD v43[17];

  v43[15] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "sourceOfTTS");
  v6 = v5;
  v8 = v5 == 3 || v5 == 5;
  -[SVXSpeechSynthesisMetricsContextFactory timeSecondScale](self, "timeSecondScale");
  v10 = v9;
  v11 = objc_msgSend(v4, "synthesisEndTime");
  v12 = v10 * (double)(unint64_t)(v11 - objc_msgSend(v4, "synthesisBeginTime"));
  v13 = objc_msgSend(v4, "speechBeginTime");
  v14 = v10 * (double)(unint64_t)(v13 - objc_msgSend(v4, "requestCreatedTime"));
  v42[0] = CFSTR("character_count");
  v15 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "utterance");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v41, "length"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v40;
  v42[1] = CFSTR("voice_asset_key");
  objc_msgSend(v4, "voice");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "assetKey");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v18 = &stru_24D24F378;
  if (v16)
    v18 = (const __CFString *)v16;
  v43[1] = v18;
  v42[2] = CFSTR("is_warm_start");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "isWarmStart"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v38;
  v42[3] = CFSTR("is_cache_hit_from_disk");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6 == 8);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v37;
  v42[4] = CFSTR("is_server_tts");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v36;
  v42[5] = CFSTR("tts_synthesis_latency");
  *(float *)&v19 = v12;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v43[5] = v20;
  v42[6] = CFSTR("tts_total_latency");
  *(float *)&v21 = v14;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v43[6] = v22;
  v42[7] = CFSTR("audio_queue_latency");
  v23 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "audioStartLatency");
  objc_msgSend(v23, "numberWithDouble:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v43[7] = v24;
  v42[8] = CFSTR("synthesis_to_speech_time");
  v25 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "eagerRequestGapInterval");
  objc_msgSend(v25, "numberWithDouble:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v43[8] = v26;
  v43[9] = &unk_24D26EE90;
  v42[9] = CFSTR("wait_for_synthesis_to_finish_time");
  v42[10] = CFSTR("audio_duration");
  v27 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "audioDuration");
  objc_msgSend(v27, "numberWithDouble:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v43[10] = v28;
  v42[11] = CFSTR("is_speech_request");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "isAudibleRequest"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v43[11] = v29;
  v43[12] = MEMORY[0x24BDBD1C0];
  v42[12] = CFSTR("is_cache_hit_from_memory");
  v42[13] = CFSTR("synthesis_to_speech_time_gap");
  v43[13] = &unk_24D26EE90;
  v42[14] = CFSTR("audio_start_timestamp_diffs");
  v30 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "audioStartLatency");
  v32 = v31;

  objc_msgSend(v30, "numberWithDouble:", v32 / v10);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v43[14] = v33;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 15);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

- (double)timeSecondScale
{
  unint64_t v2;
  unint64_t v3;
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  LODWORD(v3) = info.denom;
  LODWORD(v2) = info.numer;
  return (double)v2 / (double)v3 / 1000000000.0;
}

@end
