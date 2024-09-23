@implementation PLAudioAgent

- (void)logEventForwardRouting
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  +[PLOperator entryKeyForType:andName:](PLAudioAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("Routing"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v12);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLAudioAgent audioIsActive](self, "audioIsActive"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Active"));

  -[PLAudioAgent activeRoute](self, "activeRoute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("ActiveRoute"));

  -[PLAudioAgent outputCategory](self, "outputCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("OutputCategory"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLAudioAgent headphonesConnected](self, "headphonesConnected"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("HeadphonesConnected"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLAudioAgent headsetHasInput](self, "headsetHasInput"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("HeadsetHasInput"));

  -[PLAudioAgent BTEndpointType](self, "BTEndpointType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("BTEndpointType"));

  -[PLAudioAgent entryRoutingOld](self, "entryRoutingOld");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v3, "compare:", v10);

  if (v11)
  {
    -[PLOperator logEntry:](self, "logEntry:", v3);
    -[PLAudioAgent modelAudioPower](self, "modelAudioPower");
  }
  -[PLAudioAgent setEntryRoutingOld:](self, "setEntryRoutingOld:", v3);

}

- (void)logEventForwardOutput
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[PLOperator entryKeyForType:andName:](PLAudioAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("Output"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLAudioAgent muted](self, "muted"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Muted"));

  -[PLAudioAgent volume](self, "volume");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("Volume"));

  -[PLOperator logEntry:](self, "logEntry:", v3);
  -[PLAudioAgent modelAudioPower](self, "modelAudioPower");

}

- (void)modelAudioPower
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  id v47;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
  {
    v3 = *MEMORY[0x1E0D80378];
    +[PLOperator entryKeyForType:andName:](PLAudioAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("Output"));
    v47 = (id)objc_claimAutoreleasedReturnValue();
    +[PLOperator entryKeyForType:andName:](PLAudioAgent, "entryKeyForType:andName:", v3, CFSTR("Routing"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator storage](self, "storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastEntryForKey:", v47);
    v6 = objc_claimAutoreleasedReturnValue();

    -[PLOperator storage](self, "storage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastEntryForKey:", v4);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = -[PLAudioAgent speakerIsPlayingAudio](self, "speakerIsPlayingAudio");
    v10 = -[PLAudioAgent headsetIsPlayingAudio](self, "headsetIsPlayingAudio");
    if (!(v6 | v8))
    {
      v14 = 0;
LABEL_33:

      return;
    }
    v11 = v10;
    if (v6)
    {
      if (v8)
      {
        objc_msgSend((id)v8, "entryDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v6, "entryDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "laterDate:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_10;
      }
      v15 = (void *)v6;
    }
    else
    {
      v15 = (void *)v8;
    }
    objc_msgSend(v15, "entryDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
    objc_msgSend((id)v8, "objectForKeyedSubscript:", CFSTR("Active"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "BOOLValue") & 1) != 0)
    {
      objc_msgSend((id)v6, "objectForKeyedSubscript:", CFSTR("Muted"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "BOOLValue");

      if ((v18 & 1) == 0)
      {
        objc_msgSend((id)v8, "objectForKeyedSubscript:", CFSTR("ActiveRoute"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "description");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = objc_msgSend(v20, "isEqual:", CFSTR("Speaker"));
        if ((v21 & 1) != 0)
          v22 = 0;
        else
          v22 = objc_msgSend(v20, "containsString:", CFSTR("Head"));

        goto LABEL_18;
      }
    }
    else
    {

    }
    v21 = v9 & ~-[PLAudioAgent speakerIsPlayingAudio](self, "speakerIsPlayingAudio");
    v22 = v11 & ~-[PLAudioAgent headsetIsPlayingAudio](self, "headsetIsPlayingAudio");
LABEL_18:
    objc_msgSend((id)v6, "objectForKeyedSubscript:", CFSTR("Volume"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    v25 = v24;

    if ((_DWORD)v21 == -[PLAudioAgent speakerIsPlayingAudio](self, "speakerIsPlayingAudio"))
    {
      -[PLAudioAgent currentVolume](self, "currentVolume");
      if (v32 != v25
        && -[PLAudioAgent speakerIsPlayingAudio](self, "speakerIsPlayingAudio")
        && -[PLAudioAgent shouldModelAudioPowerSpeakerTemp](self, "shouldModelAudioPowerSpeakerTemp"))
      {
        -[PLAudioAgent setCurrentVolume:](self, "setCurrentVolume:", v25);
        objc_msgSend((id)v8, "objectForKeyedSubscript:", CFSTR("ActiveRoute"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "description");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v6, "objectForKeyedSubscript:", CFSTR("Volume"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "doubleValue");
        -[PLAudioAgent audioPowerForRoute:forVolume:](self, "audioPowerForRoute:forVolume:", v34);
        v37 = v36;

        objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 15, v14, v37);

      }
    }
    else
    {
      objc_storeStrong((id *)&self->_lastAudioStateChangeDate, v14);
      -[PLAudioAgent setSpeakerIsPlayingAudio:](self, "setSpeakerIsPlayingAudio:", v21);
      if (-[PLAudioAgent speakerIsPlayingAudio](self, "speakerIsPlayingAudio"))
      {
        if (-[PLAudioAgent shouldModelAudioPowerSpeakerTemp](self, "shouldModelAudioPowerSpeakerTemp"))
        {
          objc_msgSend((id)v8, "objectForKeyedSubscript:", CFSTR("ActiveRoute"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "description");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v6, "objectForKeyedSubscript:", CFSTR("Volume"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "doubleValue");
          -[PLAudioAgent audioPowerForRoute:forVolume:](self, "audioPowerForRoute:forVolume:", v27);
          v30 = v29;

          objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 15, v14, v30);

        }
      }
      else
      {
        -[PLAudioAgent modelAudioPowerSpeaker:](self, "modelAudioPowerSpeaker:", 0);
      }
      -[PLAudioAgent modelAudioPowerCodec:](self, "modelAudioPowerCodec:", v14);
    }
    if ((_DWORD)v22 != -[PLAudioAgent headsetIsPlayingAudio](self, "headsetIsPlayingAudio"))
    {
      objc_storeStrong((id *)&self->_lastAudioStateChangeDate, v14);
      -[PLAudioAgent setHeadsetIsPlayingAudio:](self, "setHeadsetIsPlayingAudio:", v22);
      if ((_DWORD)v22)
      {
        objc_msgSend((id)v8, "objectForKeyedSubscript:", CFSTR("ActiveRoute"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "description");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v6, "objectForKeyedSubscript:", CFSTR("Volume"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "doubleValue");
        -[PLAudioAgent audioPowerForRoute:forVolume:](self, "audioPowerForRoute:forVolume:", v40);
        v43 = v42;

        objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v44;
        v46 = v43;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v44;
        v46 = 0.0;
      }
      objc_msgSend(v44, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 14, v14, v46);

    }
    goto LABEL_33;
  }
}

- (BOOL)speakerIsPlayingAudio
{
  return self->_speakerIsPlayingAudio;
}

- (BOOL)headsetIsPlayingAudio
{
  return self->_headsetIsPlayingAudio;
}

- (id)returnVolumeOrOutPutCategory:(int)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  __CFString *v11;
  id v13;
  float v14;

  v4 = 0;
  v5 = 0;
  v14 = -1.0;
  do
  {
    v6 = v4;
    objc_msgSend(MEMORY[0x1E0D48560], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v4;
    v8 = objc_msgSend(v7, "getActiveCategoryVolume:andName:", &v14, &v13);
    v4 = v13;

    if (v8)
    {
      if (!a3)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14 * 100.0);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      if (a3 == 1)
      {
        v9 = v4;
LABEL_8:
        v10 = v9;
        goto LABEL_9;
      }
    }
    v10 = 0;
LABEL_9:
    if (v5 > 4)
      break;
    ++v5;
  }
  while (!v10);
  if (v10)
  {
    v11 = v10;
  }
  else if (a3)
  {
    v11 = CFSTR("INVALID");
  }
  else
  {
    v11 = (__CFString *)&unk_1E86531D0;
  }

  return v11;
}

- (double)currentVolume
{
  return self->_currentVolume;
}

- (BOOL)muted
{
  void *v2;
  char v3;

  objc_msgSend((id)avSystemController, "attributeForKey:", *MEMORY[0x1E0D47FA8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)volume
{
  return -[PLAudioAgent returnVolumeOrOutPutCategory:](self, "returnVolumeOrOutPutCategory:", 0);
}

- (BOOL)shouldModelAudioPowerSpeakerTemp
{
  if (qword_1ED8835A0 != -1)
    dispatch_once(&qword_1ED8835A0, &__block_literal_global_293);
  return _MergedGlobals_1_37;
}

- (void)setEntryRoutingOld:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (id)outputCategory
{
  return -[PLAudioAgent returnVolumeOrOutPutCategory:](self, "returnVolumeOrOutPutCategory:", 1);
}

- (BOOL)headsetHasInput
{
  void *v2;
  char v3;

  objc_msgSend((id)avSystemController, "attributeForKey:", *MEMORY[0x1E0D47FC0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)headphonesConnected
{
  void *v2;
  char v3;

  objc_msgSend((id)avSystemController, "attributeForKey:", *MEMORY[0x1E0D47FC8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (PLEntry)entryRoutingOld
{
  return (PLEntry *)objc_getProperty(self, a2, 184, 1);
}

- (id)BTEndpointType
{
  void *v2;
  void *v3;
  NSObject *v4;
  __CFString *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)avSystemController, "attributeForKey:", *MEMORY[0x1E0D48050]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D480D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogAudio();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEBUG, "BTDetails_EndpointType: %@", (uint8_t *)&v7, 0xCu);
  }

  if (v3)
    v5 = v3;
  else
    v5 = &stru_1E8587D00;

  return v5;
}

void __39__PLAudioAgent_setupAVSystemController__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PLLogAudio();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v5;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Trigger from output %@: %@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardOutput");
}

- (void)setAudioIsActive:(BOOL)a3
{
  self->_audioIsActive = a3;
}

- (BOOL)audioIsActive
{
  return self->_audioIsActive;
}

- (id)activeRoute
{
  unsigned int v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  v2 = 0;
  v3 = (_QWORD *)MEMORY[0x1E0D47E40];
  do
  {
    objc_msgSend((id)avSystemController, "attributeForKey:", *v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v2 > 4)
      break;
    ++v2;
  }
  while (!v4);
  if (v4)
    v6 = v4;
  else
    v6 = CFSTR("INVALID");

  return v6;
}

- (void)setSpeakerIsPlayingAudio:(BOOL)a3
{
  self->_speakerIsPlayingAudio = a3;
}

- (void)modelAudioPowerCodec:(id)a3
{
  double v4;
  unsigned int v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
  {
    v4 = 0.0;
    if (-[PLAudioAgent speakerIsPlayingAudio](self, "speakerIsPlayingAudio"))
    {
      v5 = objc_msgSend(MEMORY[0x1E0D80020], "kPLAudioClassOfDevice") - 1005001;
      if (v5 > 0x2C)
        v4 = 35.0;
      else
        v4 = dbl_1CB388EE8[v5];
    }
    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 55, v7, v4);

  }
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAudioAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("AudioApp");
  objc_msgSend(a1, "entryEventPointDefinitionAudioApp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("SpeakerAmp");
  objc_msgSend(a1, "entryEventPointDefinitionSpeakerAmp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("Haptics");
  objc_msgSend(a1, "entryEventPointDefinitionHaptics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("HapticsAssertion");
  objc_msgSend(a1, "entryEventPointDefinitionHapticsAssertion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventPointDefinitionAudioApp
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[7];
  _QWORD v23[7];
  _QWORD v24[4];
  _QWORD v25[4];
  _QWORD v26[2];
  _QWORD v27[4];

  v27[2] = *MEMORY[0x1E0C80C00];
  v26[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v24[0] = *MEMORY[0x1E0D80318];
  v24[1] = v2;
  v25[0] = &unk_1E8653170;
  v25[1] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0D80250];
  v24[2] = *MEMORY[0x1E0D80308];
  v24[3] = v3;
  v25[2] = MEMORY[0x1E0C9AAB0];
  v25[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v21;
  v26[1] = *MEMORY[0x1E0D802F0];
  v22[0] = CFSTR("ApplicationName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_StringFormat_withAppName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v19;
  v22[1] = CFSTR("AssertionID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v17;
  v22[2] = CFSTR("AssertionName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_StringFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v15;
  v22[3] = CFSTR("AudioRoute");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v5;
  v22[4] = CFSTR("Operation");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v7;
  v22[5] = CFSTR("PID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v9;
  v22[6] = CFSTR("MirroringState");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_BoolFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)entryEventPointDefinitionSpeakerAmp
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E8653180;
  v12[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("Avg Watts Modelled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_RealFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventPointDefinitionHaptics
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[2];
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[2];
  _QWORD v20[4];

  v20[2] = *MEMORY[0x1E0C80C00];
  v19[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v17[0] = *MEMORY[0x1E0D80318];
  v17[1] = v2;
  v18[0] = &unk_1E8653190;
  v18[1] = MEMORY[0x1E0C9AAB0];
  v17[2] = *MEMORY[0x1E0D802A0];
  v16[0] = CFSTR("ApplicationName");
  v16[1] = CFSTR("EngineOnDuration");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v4;
  v19[1] = *MEMORY[0x1E0D802F0];
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance", CFSTR("ApplicationName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat_withBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v14[1] = CFSTR("EngineOnDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_RealFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v8;
  v14[2] = CFSTR("TimestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_DateFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointDefinitionHapticsAssertion
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  uint64_t v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14[0] = *MEMORY[0x1E0D80298];
  v12 = *MEMORY[0x1E0D80318];
  v13 = &unk_1E8653180;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E0D802F0];
  v10[0] = CFSTR("active_time");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("active_clients");
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)entryEventForwardDefinitions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[7];
  _QWORD v12[8];

  v12[7] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("Output");
  +[PLAudioAgent entryEventForwardDefinitionOutput](PLAudioAgent, "entryEventForwardDefinitionOutput");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  v11[1] = CFSTR("Routing");
  +[PLAudioAgent entryEventForwardDefinitionRouting](PLAudioAgent, "entryEventForwardDefinitionRouting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v3;
  v11[2] = CFSTR("NowPlaying");
  +[PLAudioAgent entryEventForwardDefinitionNowPlaying](PLAudioAgent, "entryEventForwardDefinitionNowPlaying");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v4;
  v11[3] = CFSTR("AudioDevice");
  +[PLAudioAgent entryEventForwardDefinitionAudioDevice](PLAudioAgent, "entryEventForwardDefinitionAudioDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v5;
  v11[4] = CFSTR("MutedTalkerDetection");
  +[PLAudioAgent entryEventForwardDefinitionMutedTalkerDetection](PLAudioAgent, "entryEventForwardDefinitionMutedTalkerDetection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v6;
  v11[5] = CFSTR("HapticsRunningCount");
  +[PLAudioAgent entryEventForwardDefinitionHapticsRunningCount](PLAudioAgent, "entryEventForwardDefinitionHapticsRunningCount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v7;
  v11[6] = CFSTR("HapticsPrewarmCount");
  +[PLAudioAgent entryEventForwardDefinitionHapticsPrewarmCount](PLAudioAgent, "entryEventForwardDefinitionHapticsPrewarmCount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventForwardDefinitionOutput
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v20[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v18[0] = *MEMORY[0x1E0D80318];
  v18[1] = v2;
  v19[0] = &unk_1E8653180;
  v19[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v3;
  v20[1] = *MEMORY[0x1E0D802F0];
  v16[0] = CFSTR("Muted");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = CFSTR("Volume");
  v17[0] = v5;
  v6 = *MEMORY[0x1E0D80360];
  v14[0] = *MEMORY[0x1E0D80358];
  v14[1] = v6;
  v15[0] = &unk_1E8633708;
  v15[1] = CFSTR("%");
  v14[2] = *MEMORY[0x1E0D802D0];
  v12 = *MEMORY[0x1E0D802C0];
  v13 = &unk_1E86531A0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)entryEventForwardDefinitionRouting
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[7];
  _QWORD v22[7];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[4];

  v26[2] = *MEMORY[0x1E0C80C00];
  v25[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v23[0] = *MEMORY[0x1E0D80318];
  v23[1] = v2;
  v24[0] = &unk_1E8653190;
  v24[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v20;
  v25[1] = *MEMORY[0x1E0D802F0];
  v21[0] = CFSTR("Active");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_BoolFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v18;
  v21[1] = CFSTR("OutputCategory");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_StringFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  v21[2] = CFSTR("ActiveRoute");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_StringFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v14;
  v21[3] = CFSTR("HeadphonesConnected");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v4;
  v21[4] = CFSTR("HeadsetHasInput");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_BoolFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v6;
  v21[5] = CFSTR("AudioSessionID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v8;
  v21[6] = CFSTR("BTEndpointType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_StringFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventForwardDefinitionNowPlaying
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1E8653180;
  v14[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("BundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat_withBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("State");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventForwardDefinitionAudioDevice
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventForwardDefinitionMutedTalkerDetection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = *MEMORY[0x1E0D80298];
  v10 = *MEMORY[0x1E0D80318];
  v11 = &unk_1E8653180;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("Muted");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventForwardDefinitionHapticsRunningCount
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[3];
  uint64_t v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v16[0] = *MEMORY[0x1E0D80298];
  v14 = *MEMORY[0x1E0D80318];
  v15 = &unk_1E86531B0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v2;
  v16[1] = *MEMORY[0x1E0D802F0];
  v12[0] = CFSTR("RunningCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("pid");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = CFSTR("subsystem");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)entryEventForwardDefinitionHapticsPrewarmCount
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v19[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802A0];
  v17[0] = *MEMORY[0x1E0D80318];
  v17[1] = v2;
  v18[0] = &unk_1E8653180;
  v18[1] = &unk_1E86508E8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E0D802F0];
  v15[0] = CFSTR("PrewarmCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v15[1] = CFSTR("pid");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  v15[2] = CFSTR("subsystem");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v8;
  v15[3] = CFSTR("process");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_StringFormat_withProcessName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventIntervalDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("ShazamRecording");
  +[PLAudioAgent entryEventIntervalDefinitionShazamRecording](PLAudioAgent, "entryEventIntervalDefinitionShazamRecording");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("RMSLogging");
  objc_msgSend(a1, "entryEventIntervalDefinitionRMSLogging");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("CoreAudioVAD");
  objc_msgSend(a1, "entryEventIntervalDefinitionCoreAudioVAD");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventIntervalDefinitionShazamRecording
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1E8653180;
  v14[1] = MEMORY[0x1E0C9AAB0];
  v13[2] = *MEMORY[0x1E0D802A0];
  v14[2] = &unk_1E8650900;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_DateFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("BundleID");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat_withBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventIntervalDefinitionRMSLogging
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[10];
  _QWORD v28[10];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[4];

  v32[2] = *MEMORY[0x1E0C80C00];
  v31[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v29[0] = *MEMORY[0x1E0D80318];
  v29[1] = v2;
  v30[0] = &unk_1E86531C0;
  v30[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v26;
  v31[1] = *MEMORY[0x1E0D802F0];
  v27[0] = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_DateFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v24;
  v27[1] = CFSTR("ApplicationName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_StringFormat_withBundleID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v22;
  v27[2] = CFSTR("maxRms");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_RealFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v20;
  v27[3] = CFSTR("minRms");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_RealFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v18;
  v27[4] = CFSTR("silence_duration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v16;
  v27[5] = CFSTR("quiet_duration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[5] = v14;
  v27[6] = CFSTR("audible_duration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28[6] = v4;
  v27[7] = CFSTR("node");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[7] = v6;
  v27[8] = CFSTR("pid");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[8] = v8;
  v27[9] = CFSTR("reporterID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[9] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventIntervalDefinitionCoreAudioVAD
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[8];
  _QWORD v23[8];
  uint64_t v24;
  void *v25;
  _QWORD v26[2];
  _QWORD v27[4];

  v27[2] = *MEMORY[0x1E0C80C00];
  v26[0] = *MEMORY[0x1E0D80298];
  v24 = *MEMORY[0x1E0D80318];
  v25 = &unk_1E8653190;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v21;
  v26[1] = *MEMORY[0x1E0D802F0];
  v22[0] = CFSTR("Client");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_StringFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v19;
  v22[1] = CFSTR("ClientID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_StringFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v17;
  v22[2] = CFSTR("StartTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_DateFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v15;
  v22[3] = CFSTR("EndTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_DateFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v13;
  v22[4] = CFSTR("State");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v3;
  v22[5] = CFSTR("Device");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v5;
  v22[6] = CFSTR("SID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v7;
  v22[7] = CFSTR("LifespanInSeconds");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (PLAudioAgent)init
{
  PLAudioAgent *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLAudioAgent;
  result = -[PLAgent init](&v3, sel_init);
  if (result)
  {
    result->_headsetIsPlayingAudio = 0;
    result->_speakerIsPlayingAudio = 0;
    result->_currentVolume = -1.0;
  }
  return result;
}

- (id)nowPlayingAppBundleID:(id)a3
{
  return (id)objc_msgSend((id)avSystemController, "attributeForKey:", *MEMORY[0x1E0D47FF0]);
}

- (void)handleNowPlayingApplicationIsPlayingDidChange:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLAudioAgent, "entryKeyForType:andName:", v4, CFSTR("NowPlaying"));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v18);
  -[PLAudioAgent nowPlayingAppBundleID:](self, "nowPlayingAppBundleID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("BundleID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLAudioAgent audioIsActive](self, "audioIsActive"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("State"));

  -[PLOperator storage](self, "storage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastEntryForKey:", v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("State"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("State"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 == objc_msgSend(v13, "integerValue"))
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("BundleID"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("BundleID"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BundleID"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqualToString:", v16);

        if ((v17 & 1) != 0)
          goto LABEL_9;
        goto LABEL_8;
      }

    }
  }
LABEL_8:
  -[PLOperator logEntry:](self, "logEntry:", v6);
LABEL_9:

}

- (void)setupAVSystemController
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  NSMutableArray *nsOutputNotifications;
  NSMutableArray *v10;
  NSMutableArray *nsRoutingNotifications;
  id v12;
  void *v13;
  PLEntry *v14;
  PLEntry *entryRoutingOld;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  NSDate *v50;
  NSDate *lastAudioStateChangeDate;
  void *v52;
  void *v53;
  id v54;
  id v55;
  id obj;
  _QWORD v57[5];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[5];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[5];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;
  _QWORD v76[5];
  _QWORD v77[7];

  v77[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (_QWORD *)MEMORY[0x1E0D48200];
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D48200], 0);

  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)avSystemController;
  avSystemController = v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_setupAVSystemController, *v4, 0);

  objc_msgSend((id)avSystemController, "attributeForKey:", *MEMORY[0x1E0D48060]);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  self->_audioIsActive = objc_msgSend(v53, "count") != 0;
  v8 = (NSMutableArray *)objc_opt_new();
  nsOutputNotifications = self->_nsOutputNotifications;
  self->_nsOutputNotifications = v8;

  v10 = (NSMutableArray *)objc_opt_new();
  nsRoutingNotifications = self->_nsRoutingNotifications;
  self->_nsRoutingNotifications = v10;

  v12 = objc_alloc(MEMORY[0x1E0D7FFB0]);
  +[PLOperator entryKeyForType:andName:](PLAudioAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("Routing"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (PLEntry *)objc_msgSend(v12, "initWithEntryKey:", v13);
  entryRoutingOld = self->_entryRoutingOld;
  self->_entryRoutingOld = v14;

  v16 = *MEMORY[0x1E0D47FB8];
  v77[0] = *MEMORY[0x1E0D482B0];
  v77[1] = v16;
  v17 = *MEMORY[0x1E0D480B0];
  v77[2] = *MEMORY[0x1E0D47FE8];
  v77[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x1E0D47EF0];
  v76[0] = *MEMORY[0x1E0D48270];
  v76[1] = v19;
  v20 = *MEMORY[0x1E0D47FD8];
  v76[2] = *MEMORY[0x1E0D48298];
  v76[3] = v20;
  v76[4] = *MEMORY[0x1E0D47E48];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 5);
  v21 = objc_claimAutoreleasedReturnValue();
  v75 = *MEMORY[0x1E0D48000];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v23, "addObjectsFromArray:", v18);
  v54 = (id)v21;
  objc_msgSend(v23, "addObjectsFromArray:", v21);
  objc_msgSend(v23, "addObjectsFromArray:", v22);
  v52 = v23;
  objc_msgSend((id)avSystemController, "setAttribute:forKey:error:", v23, *MEMORY[0x1E0D48280], 0);
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  obj = v18;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
  v25 = MEMORY[0x1E0C809B0];
  if (v24)
  {
    v26 = v24;
    v27 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v69 != v27)
          objc_enumerationMutation(obj);
        v29 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i);
        -[PLAudioAgent nsOutputNotifications](self, "nsOutputNotifications");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_alloc(MEMORY[0x1E0D80010]);
        v67[0] = v25;
        v67[1] = 3221225472;
        v67[2] = __39__PLAudioAgent_setupAVSystemController__block_invoke;
        v67[3] = &unk_1E8577F48;
        v67[4] = self;
        v32 = (void *)objc_msgSend(v31, "initWithOperator:forNotification:withBlock:", self, v29, v67);
        objc_msgSend(v30, "addObject:", v32);

      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
    }
    while (v26);
  }

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v55 = v54;
  v33 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v64;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v64 != v35)
          objc_enumerationMutation(v55);
        v37 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j);
        -[PLAudioAgent nsOutputNotifications](self, "nsOutputNotifications");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_alloc(MEMORY[0x1E0D80010]);
        v62[0] = v25;
        v62[1] = 3221225472;
        v62[2] = __39__PLAudioAgent_setupAVSystemController__block_invoke_152;
        v62[3] = &unk_1E8577F48;
        v62[4] = self;
        v40 = (void *)objc_msgSend(v39, "initWithOperator:forNotification:withBlock:", self, v37, v62);
        objc_msgSend(v38, "addObject:", v40);

      }
      v34 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
    }
    while (v34);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v41 = v22;
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v59;
    do
    {
      for (k = 0; k != v43; ++k)
      {
        if (*(_QWORD *)v59 != v44)
          objc_enumerationMutation(v41);
        v46 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * k);
        -[PLAudioAgent nsOutputNotifications](self, "nsOutputNotifications");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_alloc(MEMORY[0x1E0D80010]);
        v57[0] = v25;
        v57[1] = 3221225472;
        v57[2] = __39__PLAudioAgent_setupAVSystemController__block_invoke_155;
        v57[3] = &unk_1E8577F48;
        v57[4] = self;
        v49 = (void *)objc_msgSend(v48, "initWithOperator:forNotification:withBlock:", self, v46, v57);
        objc_msgSend(v47, "addObject:", v49);

      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
    }
    while (v43);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v50 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastAudioStateChangeDate = self->_lastAudioStateChangeDate;
  self->_lastAudioStateChangeDate = v50;

}

void __39__PLAudioAgent_setupAVSystemController__block_invoke_152(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PLLogAudio();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v12 = 138412546;
    v13 = v6;
    v14 = 2112;
    v15 = v5;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Trigger from routing %@: %@", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Sessions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Sessions"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setAudioIsActive:", objc_msgSend(v9, "count") != 0);
    PLLogAudio();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = objc_msgSend(*(id *)(a1 + 32), "audioIsActive");
      v12 = 67109120;
      LODWORD(v13) = v11;
      _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "audio state: %d", (uint8_t *)&v12, 8u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "logEventForwardRouting");

}

void __39__PLAudioAgent_setupAVSystemController__block_invoke_155(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PLLogAudio();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v5;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Trigger from nowPlaying %@: %@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "handleNowPlayingApplicationIsPlayingDidChange:", v5);
}

- (void)initOperatorDependancies
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSDictionary *v9;
  NSDictionary *audioPowerModel;
  void *v11;
  void *v12;
  void *v13;
  PLXPCListenerOperatorComposition *v14;
  PLXPCListenerOperatorComposition *hapticsPrewarmCountListener;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PLNSNotificationOperatorComposition *v22;
  PLNSNotificationOperatorComposition *thermalMonitorListener;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[11];

  -[PLAudioAgent setupAVSystemController](self, "setupAVSystemController");
  self->_accessoryPowerState = 1;
  +[PLOperator entryKeyForType:andName:](PLBatteryAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("LightningConnectorStatus"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v40[5] = MEMORY[0x1E0C809B0];
  v40[6] = 3221225472;
  v40[7] = __40__PLAudioAgent_initOperatorDependancies__block_invoke;
  v40[8] = &unk_1E8578710;
  v40[9] = self;
  v28 = (void *)v3;
  -[PLAudioAgent buildCallBack:withGroup:withHandler:](self, "buildCallBack:withGroup:withHandler:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAudioAgent setAccessoryPowerCallback:](self, "setAccessoryPowerCallback:", v5);

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D80078], "powerModelForOperatorName:", CFSTR("audio"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAudioAgent audioHardware](self, "audioHardware");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Speaker"));
    v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    audioPowerModel = self->_audioPowerModel;
    self->_audioPowerModel = v9;

  }
  v40[0] = v4;
  v40[1] = 3221225472;
  v40[2] = __40__PLAudioAgent_initOperatorDependancies__block_invoke_180;
  v40[3] = &unk_1E8578610;
  v40[4] = self;
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864C800, v40);
  -[PLAudioAgent setAudioAppXPCListener:](self, "setAudioAppXPCListener:");
  v39[0] = v4;
  v39[1] = 3221225472;
  v39[2] = __40__PLAudioAgent_initOperatorDependancies__block_invoke_187;
  v39[3] = &unk_1E8578610;
  v39[4] = self;
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864C828, v39);
  -[PLAudioAgent setScreenMirroringXPCListener:](self, "setScreenMirroringXPCListener:");
  v38[0] = v4;
  v38[1] = 3221225472;
  v38[2] = __40__PLAudioAgent_initOperatorDependancies__block_invoke_192;
  v38[3] = &unk_1E8578610;
  v38[4] = self;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864C850, v38);
  -[PLAudioAgent setSpeakerAmpXPCListener:](self, "setSpeakerAmpXPCListener:");
  v37[0] = v4;
  v37[1] = 3221225472;
  v37[2] = __40__PLAudioAgent_initOperatorDependancies__block_invoke_198;
  v37[3] = &unk_1E8578610;
  v37[4] = self;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864C878, v37);
  -[PLAudioAgent setHapticsXPCListener:](self, "setHapticsXPCListener:");
  v36[0] = v4;
  v36[1] = 3221225472;
  v36[2] = __40__PLAudioAgent_initOperatorDependancies__block_invoke_204;
  v36[3] = &unk_1E8578610;
  v36[4] = self;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864C8A0, v36);
  -[PLAudioAgent setHapticsAssertionXPCListener:](self, "setHapticsAssertionXPCListener:", v11);
  v35[0] = v4;
  v35[1] = 3221225472;
  v35[2] = __40__PLAudioAgent_initOperatorDependancies__block_invoke_210;
  v35[3] = &unk_1E8578610;
  v35[4] = self;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864C8C8, v35);
  -[PLAudioAgent setRMSLoggingXPCListener:](self, "setRMSLoggingXPCListener:", v12);
  v34[0] = v4;
  v34[1] = 3221225472;
  v34[2] = __40__PLAudioAgent_initOperatorDependancies__block_invoke_214;
  v34[3] = &unk_1E8578610;
  v34[4] = self;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864C8F0, v34);
  -[PLAudioAgent setHapticsRunningCountListener:](self, "setHapticsRunningCountListener:", v13);
  v33[0] = v4;
  v33[1] = 3221225472;
  v33[2] = __40__PLAudioAgent_initOperatorDependancies__block_invoke_218;
  v33[3] = &unk_1E8578610;
  v33[4] = self;
  v14 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864C918, v33);
  hapticsPrewarmCountListener = self->_hapticsPrewarmCountListener;
  self->_hapticsPrewarmCountListener = v14;

  v32[0] = v4;
  v32[1] = 3221225472;
  v32[2] = __40__PLAudioAgent_initOperatorDependancies__block_invoke_225;
  v32[3] = &unk_1E8578610;
  v32[4] = self;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864C940, v32);
  -[PLAudioAgent setCoreAudioVADXPCListener:](self, "setCoreAudioVADXPCListener:", v16);
  v31[0] = v4;
  v31[1] = 3221225472;
  v31[2] = __40__PLAudioAgent_initOperatorDependancies__block_invoke_230;
  v31[3] = &unk_1E8578610;
  v31[4] = self;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864C968, v31);
  -[PLAudioAgent setShazamRecordingXPCListener:](self, "setShazamRecordingXPCListener:", v17);
  v30[0] = v4;
  v30[1] = 3221225472;
  v30[2] = __40__PLAudioAgent_initOperatorDependancies__block_invoke_234;
  v30[3] = &unk_1E8578610;
  v30[4] = self;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864C990, v30);
  -[PLAudioAgent setMutedTalkerDetectionXPCListener:](self, "setMutedTalkerDetectionXPCListener:", v18);
  v29[0] = v4;
  v29[1] = 3221225472;
  v29[2] = __40__PLAudioAgent_initOperatorDependancies__block_invoke_241;
  v29[3] = &unk_1E8578610;
  v29[4] = self;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864C9B8, v29);
  -[PLAudioAgent setSingXPCListener:](self, "setSingXPCListener:", v19);
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 3, &unk_1E864C9E0, v21);

    if (!-[PLAudioAgent audioIsActive](self, "audioIsActive"))
      -[PLAudioAgent closeAudioAccountingEvents](self, "closeAudioAccountingEvents");
  }
  v22 = (PLNSNotificationOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80010]), "initWithOperator:forNotification:withBlock:", self, CFSTR("PLThermalMonitorNotification"), &__block_literal_global_251);
  thermalMonitorListener = self->_thermalMonitorListener;
  self->_thermalMonitorListener = v22;

}

uint64_t __40__PLAudioAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleLightningStatusCallback:", a2);
}

void __40__PLAudioAgent_initOperatorDependancies__block_invoke_180(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogAudio();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "got callback! %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointAudioApp:", v6);
}

void __40__PLAudioAgent_initOperatorDependancies__block_invoke_187(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogAudio();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "got callback! %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointAudioApp:", v6);
}

void __40__PLAudioAgent_initOperatorDependancies__block_invoke_192(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogAudio();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "got callback! %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointSpeakerAmp:", v6);
}

void __40__PLAudioAgent_initOperatorDependancies__block_invoke_198(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogAudio();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "got callback! %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointHaptics:", v6);
}

void __40__PLAudioAgent_initOperatorDependancies__block_invoke_204(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogAudio();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "got callback! %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointHapticsAssertion:", v6);
}

void __40__PLAudioAgent_initOperatorDependancies__block_invoke_210(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogAudio();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "got callback! %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventIntervalRMSLogging:", v6);
}

void __40__PLAudioAgent_initOperatorDependancies__block_invoke_214(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogAudio();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Got callback for PLAudioAgent_EventForward_HapticsRunningCount: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardHapticsRunningCount:", v6);
}

void __40__PLAudioAgent_initOperatorDependancies__block_invoke_218(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogAudio();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Haptics Prewarm Count callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardHapticsPrewarmCount:", v6);
}

void __40__PLAudioAgent_initOperatorDependancies__block_invoke_225(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogAudio();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Got callback for CoreAudioVAD payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventIntervalCoreAudioVAD:", v6);
}

void __40__PLAudioAgent_initOperatorDependancies__block_invoke_230(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogAudio();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Got callback for PLAudioAgent_EventInterval_ShazamRecording: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventIntervalShazamRecording:", v6);
}

void __40__PLAudioAgent_initOperatorDependancies__block_invoke_234(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogAudio();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "MutedTalkerDetection payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardMutedTalkerDetection:", v6);
}

void __40__PLAudioAgent_initOperatorDependancies__block_invoke_241(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogAudio();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Audio Sing payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardSing:", v6);
}

void __40__PLAudioAgent_initOperatorDependancies__block_invoke_250(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_debug_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_DEBUG, "Notification from ThermalMonitor: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (id)buildCallBack:(id)a3 withGroup:(BOOL)a4 withHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GroupID_%@"), v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v8;
  }
  v11 = v10;
  v12 = objc_alloc(MEMORY[0x1E0D7FFC8]);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __52__PLAudioAgent_buildCallBack_withGroup_withHandler___block_invoke;
  v16[3] = &unk_1E8578760;
  v17 = v9;
  v13 = v9;
  v14 = (void *)objc_msgSend(v12, "initWithOperator:forEntryKey:withBlock:", self, v11, v16);

  return v14;
}

uint64_t __52__PLAudioAgent_buildCallBack_withGroup_withHandler___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)handleLightningStatusCallback:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("IOAccessoryPowerMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAudioAgent setAccessoryPowerState:](self, "setAccessoryPowerState:", objc_msgSend(v4, "intValue"));

}

- (BOOL)initDefaultAudioDevice:(BOOL)a3
{
  _BOOL4 v3;
  AudioDevice *v5;
  id v6;
  uint64_t v7;
  void *v8;
  BOOL v9;

  v3 = a3;
  v5 = [AudioDevice alloc];
  if (!v3)
  {
    v6 = -[AudioDevice initOutputDeviceWithCtx:](v5, "initOutputDeviceWithCtx:", self);
    if ((objc_msgSend(v6, "updateDefaultAudioDeviceInfo") & 1) != 0)
    {
      v7 = 224;
      goto LABEL_6;
    }
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  v6 = -[AudioDevice initInputDeviceWithCtx:](v5, "initInputDeviceWithCtx:", self);
  if ((objc_msgSend(v6, "updateDefaultAudioDeviceInfo") & 1) == 0)
    goto LABEL_7;
  v7 = 232;
LABEL_6:
  v6 = v6;
  v8 = *(Class *)((char *)&self->super.super.super.isa + v7);
  *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)v6;

  objc_msgSend(v6, "addAudioDeviceListener");
  v9 = 1;
LABEL_8:

  return v9;
}

- (void)log
{
  -[PLAudioAgent logEventForwardOutput](self, "logEventForwardOutput");
  -[PLAudioAgent logEventForwardRouting](self, "logEventForwardRouting");
}

- (void)logEventPointAudioApp:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLAudioAgent, "entryKeyForType:andName:", v4, CFSTR("AudioApp"));
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v19, v5);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PlaybackStartTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PlaybackStartTime"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSince1970");
    v10 = v9;

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "convertFromSystemToMonotonic");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEntryDate:", v12);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PlaybackStopTime"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PlaybackStopTime"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSince1970");
    v16 = v15;

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "convertFromSystemToMonotonic");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEntryDate:", v18);

  }
  -[PLOperator logEntry:](self, "logEntry:", v6);
  -[PLAudioAgent createAudioAccountingEvents:](self, "createAudioAccountingEvents:", v6);
  -[PLAudioAgent createAirPlayAccountingEvents:](self, "createAirPlayAccountingEvents:", v6);
  -[PLAudioAgent createCarPlayAccountingEvents:](self, "createCarPlayAccountingEvents:", v6);
  -[PLAudioAgent createBluetoothAccountingEvents:](self, "createBluetoothAccountingEvents:", v6);

}

- (void)logEventPointSpeakerAmp:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLAudioAgent, "entryKeyForType:andName:", v4, CFSTR("SpeakerAmp"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLAudioAgent modelAudioPowerSpeaker:](self, "modelAudioPowerSpeaker:", v6);
  -[PLOperator logEntry:](self, "logEntry:", v6);

}

- (void)logEventPointHaptics:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLAudioAgent, "entryKeyForType:andName:", v4, CFSTR("Haptics"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventPointHapticsAssertion:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLAudioAgent, "entryKeyForType:andName:", v4, CFSTR("HapticsAssertion"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v9);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Haptic_Active_Hardware_Time_Seconds"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("active_time"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Active_Clients"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("active_clients"));
  -[PLOperator logEntry:](self, "logEntry:", v6);

}

- (void)logEventForwardAudioDevice:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PLOperator entryKeyForType:andName:](PLAudioAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("AudioDevice"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0D7FFB0]);
  objc_msgSend(v4, "lastUpdateTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithEntryKey:withDate:", v5, v7);

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v4, "deviceID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("DeviceID"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v4, "sourceID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("SourceID"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v4, "transType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("TransType"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isInput"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("IsInput"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isRunning"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("IsRunning"));

    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "volume");
    objc_msgSend(v14, "numberWithFloat:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("Volume"));

    -[PLOperator logEntry:](self, "logEntry:", v8);
    PLLogAudio();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "lastUpdateTime");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v17;
      v20 = 2112;
      v21 = v8;
      _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "AudioDevice changed: %@, %@", (uint8_t *)&v18, 0x16u);

    }
  }

}

- (void)logEventForwardHapticsRunningCount:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLAudioAgent, "entryKeyForType:andName:", v4, CFSTR("HapticsRunningCount"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventForwardHapticsPrewarmCount:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLAudioAgent, "entryKeyForType:andName:", v4, CFSTR("HapticsPrewarmCount"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventForwardMutedTalkerDetection:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLAudioAgent, "entryKeyForType:andName:", v4, CFSTR("MutedTalkerDetection"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventForwardSing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = (id)objc_msgSend(v4, "mutableCopy");
  v5 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TimestampSent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "doubleValue");
  objc_msgSend(v5, "dateWithTimeIntervalSince1970:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "convertFromSystemToMonotonic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "removeObjectForKey:", CFSTR("TimestampSent"));
  -[PLOperator logForSubsystem:category:data:date:](self, "logForSubsystem:category:data:date:", CFSTR("Audio"), CFSTR("Sing"), v9, v8);

}

- (void)logEventIntervalRMSLogging:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v4 = *MEMORY[0x1E0D80380];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLAudioAgent, "entryKeyForType:andName:", v4, CFSTR("RMSLogging"));
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("StartTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  objc_msgSend(v6, "dateWithTimeIntervalSince1970:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "convertFromSystemToMonotonic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v21, v9);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ApplicationName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("ApplicationName"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("maxRms"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("maxRms"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("minRms"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("minRms"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("silence"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("silence_duration"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("quiet"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("quiet_duration"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("audible"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("audible_duration"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("node"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, CFSTR("node"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pid"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, CFSTR("pid"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("reporterID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, CFSTR("reporterID"));
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v20, CFSTR("timestampEnd"));

  -[PLOperator logEntry:](self, "logEntry:", v10);
}

- (void)logEventIntervalShazamRecording:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = *MEMORY[0x1E0D80380];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLAudioAgent, "entryKeyForType:andName:", v4, CFSTR("ShazamRecording"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v13, v5);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertFromSystemToMonotonic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEntryDate:", v8);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "convertFromSystemToMonotonic");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("timestampEnd"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("timestampEnd"));

  }
  -[PLOperator logEntry:](self, "logEntry:", v6);

}

- (void)logEventIntervalCoreAudioVAD:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  PLAudioAgent *v61;
  PLAudioAgent *v62;
  _QWORD v63[4];
  id v64;
  id v65;
  _QWORD v66[4];
  id v67;
  id v68;
  uint8_t buf[4];
  _QWORD v70[2];
  _QWORD v71[3];

  v71[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("State"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  +[PLOperator entryKeyForType:andName:](PLAudioAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80380], CFSTR("CoreAudioVAD"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ClientID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Client"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("EndTime IS NULL AND ClientID = '%@' AND Client = '%@'"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLOperator storage](self, "storage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastEntryForKey:withFilters:", v7, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == 1)
  {
    if (v14)
    {
      PLLogAudio();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109378;
        LODWORD(v70[0]) = 1;
        WORD2(v70[0]) = 2112;
        *(_QWORD *)((char *)v70 + 6) = v14;
        _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "CoreAudioVad Active Session state = %d, will update existing table openEntry = %@", buf, 0x12u);
      }

      v66[0] = MEMORY[0x1E0C809B0];
      v66[1] = 3221225472;
      v66[2] = __45__PLAudioAgent_logEventIntervalCoreAudioVAD___block_invoke;
      v66[3] = &unk_1E85791E0;
      v67 = v14;
      v68 = v4;
      -[PLOperator updateEntry:withBlock:](self, "updateEntry:withBlock:", v67, v66);

      v16 = v67;
    }
    else
    {
      v61 = self;
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v4);
      v19 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("StartTime"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "doubleValue");
      objc_msgSend(v19, "dateWithTimeIntervalSince1970:");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "convertFromSystemToMonotonic");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (void *)MEMORY[0x1E0C99D68];
      v24 = v22;
      objc_msgSend(v22, "timeIntervalSince1970");
      objc_msgSend(v23, "dateWithTimeIntervalSince1970:", round(v25 / 60.0) * 60.0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v26, CFSTR("StartTime"));

      v27 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LifespanInSeconds"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "numberWithDouble:", round((double)(int)objc_msgSend(v28, "intValue") / 60.0) * 60.0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v29, CFSTR("LifespanInSeconds"));

      v30 = (void *)MEMORY[0x1E0D80078];
      v31 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SID"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringWithFormat:", CFSTR("%@"), v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "hashString:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v34, CFSTR("SID"));

      PLLogAudio();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109378;
        LODWORD(v70[0]) = 1;
        WORD2(v70[0]) = 2112;
        *(_QWORD *)((char *)v70 + 6) = v16;
        _os_log_debug_impl(&dword_1CAF47000, v35, OS_LOG_TYPE_DEBUG, "CoreAudioVad Active Session state = %d, creating new table entry =  %@", buf, 0x12u);
      }

      -[PLOperator logEntry:](v61, "logEntry:", v16);
    }
  }
  else
  {
    PLLogAudio();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
    if (v14)
    {
      if (v18)
      {
        *(_DWORD *)buf = 67109378;
        LODWORD(v70[0]) = v6;
        WORD2(v70[0]) = 2112;
        *(_QWORD *)((char *)v70 + 6) = v14;
        _os_log_debug_impl(&dword_1CAF47000, v17, OS_LOG_TYPE_DEBUG, "CoreAudioVad state = %d Found OpenEntry openEntry = %@", buf, 0x12u);
      }

      v63[0] = MEMORY[0x1E0C809B0];
      v63[1] = 3221225472;
      v63[2] = __45__PLAudioAgent_logEventIntervalCoreAudioVAD___block_invoke_292;
      v63[3] = &unk_1E85791E0;
      v64 = v4;
      v65 = v14;
      -[PLOperator updateEntry:withBlock:](self, "updateEntry:withBlock:", v65, v63);

      v16 = v64;
    }
    else
    {
      v62 = self;
      if (v18)
      {
        *(_DWORD *)buf = 138412290;
        v70[0] = v4;
        _os_log_debug_impl(&dword_1CAF47000, v17, OS_LOG_TYPE_DEBUG, "CoreAudioVad Didn't find OpenEntry, payload = %@", buf, 0xCu);
      }

      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v4);
      v36 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("StartTime"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "doubleValue");
      objc_msgSend(v36, "dateWithTimeIntervalSince1970:");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v38, "convertFromSystemToMonotonic");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = (void *)MEMORY[0x1E0C99D68];
      v60 = v39;
      objc_msgSend(v39, "timeIntervalSince1970");
      objc_msgSend(v40, "dateWithTimeIntervalSince1970:", round(v41 / 60.0) * 60.0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v42, CFSTR("StartTime"));

      v43 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EndTime"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "doubleValue");
      objc_msgSend(v43, "dateWithTimeIntervalSince1970:");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v45, "convertFromSystemToMonotonic");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = (void *)MEMORY[0x1E0C99D68];
      v48 = v46;
      objc_msgSend(v46, "timeIntervalSince1970");
      objc_msgSend(v47, "dateWithTimeIntervalSince1970:", round(v49 / 60.0) * 60.0);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v50, CFSTR("EndTime"));

      v51 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LifespanInSeconds"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "numberWithDouble:", round((double)(int)objc_msgSend(v52, "intValue") / 60.0) * 60.0);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v53, CFSTR("LifespanInSeconds"));

      v54 = (void *)MEMORY[0x1E0D80078];
      v55 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SID"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "stringWithFormat:", CFSTR("%@"), v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "hashString:", v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v58, CFSTR("SID"));

      PLLogAudio();
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v70[0] = v16;
        _os_log_debug_impl(&dword_1CAF47000, v59, OS_LOG_TYPE_DEBUG, "CoreAudioVad Didn't find OpenEntry calling logEntry entry = %@", buf, 0xCu);
      }

      -[PLOperator logEntry:](v62, "logEntry:", v16);
    }
  }

}

void __45__PLAudioAgent_logEventIntervalCoreAudioVAD___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("LifespanInSeconds"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithDouble:", round((double)(int)objc_msgSend(v3, "intValue") / 60.0) * 60.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, CFSTR("LifespanInSeconds"));

  PLLogAudio();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "CoreAudioVad updated openEntry = %@", (uint8_t *)&v7, 0xCu);
  }

}

void __45__PLAudioAgent_logEventIntervalCoreAudioVAD___block_invoke_292(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("EndTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  objc_msgSend(v2, "dateWithTimeIntervalSince1970:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "convertFromSystemToMonotonic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "timeIntervalSince1970");
  objc_msgSend(v6, "dateWithTimeIntervalSince1970:", round(v7 / 60.0) * 60.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, CFSTR("EndTime"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("State"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, CFSTR("State"));

  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("LifespanInSeconds"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithDouble:", round((double)(int)objc_msgSend(v11, "intValue") / 60.0) * 60.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v12, CFSTR("LifespanInSeconds"));

  PLLogAudio();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = *(_QWORD *)(a1 + 40);
    v15 = 138412290;
    v16 = v14;
    _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "CoreAudioVad updateEntry:openEntry = %@", (uint8_t *)&v15, 0xCu);
  }

}

uint64_t __48__PLAudioAgent_shouldModelAudioPowerSpeakerTemp__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D80020], "isiPad");
  if ((_DWORD)result)
  {
    if ((objc_msgSend(MEMORY[0x1E0D80020], "isDeviceClass:", 100032) & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0D80020], "isDeviceClass:", 100033) & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0D80020], "isDeviceClass:", 100034) & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0D80020], "isDeviceClass:", 100035) & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0D80020], "isDeviceClass:", 100036) & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0D80020], "isDeviceClass:", 100037) & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0D80020], "isDeviceClass:", 100038) & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0D80020], "isDeviceClass:", 100039) & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0D80020], "isDeviceClass:", 100040) & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0D80020], "isDeviceClass:", 100041) & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0D80020], "isDeviceClass:", 100042) & 1) != 0)
    {
      result = 1;
    }
    else
    {
      result = objc_msgSend(MEMORY[0x1E0D80020], "isDeviceClass:", 100043);
    }
  }
  _MergedGlobals_1_37 = result;
  return result;
}

- (double)modelAudioPowerWithVolume:(double)a3
{
  void *v6;
  void *v7;
  double v8;
  double v9;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0)
    return 0.0;
  v6 = (void *)MEMORY[0x1E0D80078];
  -[PLAudioAgent audioPowerModel](self, "audioPowerModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scaledPowerBasedOnPoint:withPowerModel:", v7, a3);
  v9 = v8;

  return v9;
}

- (void)modelAudioPowerSpeaker:(id)a3
{
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  id v25;

  v25 = a3;
  v4 = objc_msgSend(MEMORY[0x1E0D80020], "isHomePod");
  v5 = v25;
  if ((v4 & 1) == 0)
  {
    if (!v25)
      goto LABEL_10;
    objc_msgSend(v25, "entryDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_10;
    if (-[PLAudioAgent speakerIsPlayingAudio](self, "speakerIsPlayingAudio"))
    {
      +[PLOperator entryKeyForType:andName:](PLAudioAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("SpeakerAmp"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLOperator storage](self, "storage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastEntryForKey:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "entryDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dateByAddingTimeInterval:", -60.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "laterDate:", self->_lastAudioStateChangeDate);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v9, "entryDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "laterDate:", v13);
        v14 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v14;
      }
      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("Avg Watts Modelled"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "doubleValue");
      -[PLAudioAgent convertSpeakerProtectionModeledPowerToTotalSpeakerPower:](self, "convertSpeakerProtectionModeledPowerToTotalSpeakerPower:", v16 * 1000.0);
      v18 = v17;

      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 15, v12, v18);

      goto LABEL_11;
    }
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("Avg Watts Modelled"));
    v20 = objc_claimAutoreleasedReturnValue();
    if (!v20)
      goto LABEL_10;
    v21 = (void *)v20;
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("Avg Watts Modelled"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    v24 = v23;

    v5 = v25;
    if (v24 <= 0.0)
    {
LABEL_10:
      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAudioAgent lastAudioStateChangeDate](self, "lastAudioStateChangeDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 15, v7, 0.0);
LABEL_11:

      v5 = v25;
    }
  }

}

- (double)convertSpeakerProtectionModeledPowerToTotalSpeakerPower:(double)a3
{
  double result;
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  double v18;
  double v19;
  double v20;

  result = 0.0;
  if (a3 > 0.0)
  {
    if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod", 0.0) & 1) != 0)
    {
LABEL_3:
      result = a3;
    }
    else
    {
      v5 = objc_msgSend(MEMORY[0x1E0D80020], "kPLAudioClassOfDevice") - 1005001;
      result = a3;
      switch(v5)
      {
        case 0:
          v13 = log(a3 + 0.1);
          v14 = 1.5;
          goto LABEL_19;
        case 1:
          v15 = a3 * -0.0014;
          v16 = 3.03;
          goto LABEL_24;
        case 2:
          v8 = log(a3 * 0.005 + 1.0);
          v9 = 810.0;
          goto LABEL_28;
        case 3:
          v10 = log(a3 * 0.002 + 1.0);
          v11 = a3 * 0.4;
          v12 = 110.0;
          goto LABEL_38;
        case 4:
          v13 = log(a3 * 0.05 + 1.0);
          v14 = 10.0;
LABEL_19:
          result = a3 + v13 * v14;
          goto LABEL_4;
        case 5:
          result = 0.0;
          if (a3 < 0.1)
            goto LABEL_4;
          v6 = a3 * 1.51 + a3 * -0.0003 * a3;
          v17 = 0x4048000000000000;
          goto LABEL_55;
        case 6:
        case 7:
          result = 0.0;
          if (a3 < 0.001)
            goto LABEL_4;
          v6 = a3 * 0.96 + a3 * -0.00009 * a3;
          v7 = 97.0;
          break;
        case 8:
          v10 = log(a3 + 1.0);
          v11 = a3 * 0.5;
          v12 = 6.0;
          goto LABEL_38;
        case 9:
          v15 = a3 * -0.0013;
          v16 = 1.75;
LABEL_24:
          result = a3 * v16 + v15 * a3;
          goto LABEL_4;
        case 10:
          v10 = log(a3 + 1.0);
          v11 = a3 * 0.725;
          v12 = 9.0;
          goto LABEL_38;
        case 11:
          v10 = log(a3 + 1.0);
          v11 = a3 * 1.2;
          v12 = 10.0;
          goto LABEL_38;
        case 12:
        case 13:
          v8 = log(a3 * 0.006 + 1.0);
          v9 = 410.0;
          goto LABEL_28;
        case 14:
          v8 = log(a3 * 0.007 + 1.0);
          v9 = 450.0;
LABEL_28:
          result = v8 * v9;
          goto LABEL_4;
        case 15:
          v10 = log(a3 * 0.9 + 1.0);
          v11 = a3 * 1.35;
          v12 = 13.0;
          goto LABEL_38;
        case 16:
        case 17:
          v10 = log(a3 * 8.0 + 1.0);
          v11 = a3 * 1.07;
          v12 = 3.5;
          goto LABEL_38;
        case 18:
        case 19:
        case 23:
        case 26:
        case 30:
        case 38:
        case 39:
        case 40:
          goto LABEL_4;
        case 20:
          v18 = log(a3 + 1.0);
          v19 = a3 * 1.075;
          v20 = 7.0;
          goto LABEL_32;
        case 21:
          v18 = log(a3 + 1.0);
          v19 = a3 * 0.97;
          v20 = 5.0;
LABEL_32:
          result = v19 + v18 * v20;
          goto LABEL_34;
        case 22:
          result = a3 + log(a3 * 5.0 + 1.0) * 10.0;
LABEL_34:
          if (result < 0.0)
            result = 0.0;
          goto LABEL_4;
        case 24:
          v10 = log(a3 + 1.0);
          v11 = a3 * 1.5;
          v12 = 11.0;
          goto LABEL_38;
        case 25:
          v10 = log(a3 + 1.0);
          v11 = a3 * 1.38;
          v12 = 7.0;
LABEL_38:
          result = v11 + v10 * v12;
          goto LABEL_4;
        case 27:
          result = 0.0;
          if (a3 < 0.1)
            goto LABEL_4;
          v6 = a3 * 1.87 + a3 * -0.0002 * a3;
          v7 = 95.26;
          break;
        case 28:
          result = 0.0;
          if (a3 < 0.1)
            goto LABEL_4;
          v6 = a3 * 1.89 + a3 * -0.0001 * a3;
          v7 = -17.5;
          break;
        case 29:
          result = 0.0;
          if (a3 < 0.1)
            goto LABEL_4;
          v6 = a3 * 1.44 + a3 * -0.000167 * a3;
          v7 = 15.0;
          break;
        case 31:
          result = 0.0;
          if (a3 < 0.1)
            goto LABEL_4;
          v6 = a3 * 1.81 + a3 * -0.0000852 * a3;
          v7 = 123.12;
          break;
        case 32:
          result = 0.0;
          if (a3 < 0.1)
            goto LABEL_4;
          v6 = a3 * 1.85 + a3 * -0.00018 * a3;
          v7 = 22.35;
          break;
        case 33:
          result = 0.0;
          if (a3 < 0.1)
            goto LABEL_4;
          v6 = a3 * 1.16 + a3 * 0.0000309 * a3;
          v7 = -46.18;
          break;
        case 34:
          result = 0.0;
          if (a3 < 0.1)
            goto LABEL_4;
          v6 = a3 * 1.015 + a3 * 0.0000866 * a3;
          v7 = -23.0;
          break;
        case 35:
          result = 0.0;
          if (a3 < 0.1)
            goto LABEL_4;
          v6 = a3 * 1.19 + a3 * -0.0000202 * a3;
          v17 = 0xC049000000000000;
LABEL_55:
          v7 = *(double *)&v17;
          break;
        case 36:
          result = 0.0;
          if (a3 >= 0.1)
            result = a3 * 1.404 + -55.2;
          goto LABEL_4;
        case 37:
          result = 0.0;
          if (a3 < 0.1)
            goto LABEL_4;
          v6 = a3 * 0.9261 + a3 * 0.00007412 * a3;
          v7 = 38.265;
          break;
        case 41:
          result = 0.0;
          if (a3 < 0.1)
            goto LABEL_4;
          v6 = a3 * 1.0808 + a3 * -0.0003205 * a3;
          v7 = 14.1368;
          break;
        case 42:
          result = 0.0;
          if (a3 < 0.1)
            goto LABEL_4;
          v6 = a3 * 1.1128 + a3 * -0.0002358 * a3;
          v7 = 13.3804;
          break;
        case 43:
          result = 0.0;
          if (a3 < 0.1)
            goto LABEL_4;
          v6 = a3 * 1.6664 + a3 * -0.0003566 * a3;
          v7 = -268.816;
          break;
        case 44:
          result = 0.0;
          if (a3 < 0.1)
            goto LABEL_4;
          v6 = a3 * 1.6392 + a3 * -0.0001588 * a3;
          v7 = 6.333;
          break;
        default:
          goto LABEL_3;
      }
      result = v6 + v7;
    }
LABEL_4:
    if (result > 3000.0)
      result = 3000.0;
    if (result <= 0.0)
      return 0.0;
  }
  return result;
}

- (double)audioPowerForRoute:(id)a3 forVolume:(double)a4
{
  __CFString *v6;
  char v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  double v34;
  double v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[5];
  _QWORD block[5];
  uint8_t v60[128];
  uint8_t buf[4];
  NSObject *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v7 = objc_msgSend(MEMORY[0x1E0D80020], "isHomePod");
  v8 = 0.0;
  if (v6 && (v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D80078], "powerModelForOperatorName:", CFSTR("audio"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(MEMORY[0x1E0D80020], "kPLAudioClassOfDevice"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsString:", v11);

    if ((v13 & 1) != 0)
    {
      if (-[PLAudioAgent accessoryPowerState](self, "accessoryPowerState") == 4
        && ((-[__CFString isEqual:](v6, "isEqual:", CFSTR("Headphone")) & 1) != 0
         || -[__CFString isEqual:](v6, "isEqual:", CFSTR("Headset"))))
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        v16 = CFSTR("Lightning");
      }
      else if (-[PLAudioAgent accessoryPowerState](self, "accessoryPowerState") == 6
             && ((-[__CFString isEqual:](v6, "isEqual:", CFSTR("Headphone")) & 1) != 0
              || -[__CFString isEqual:](v6, "isEqual:", CFSTR("Headset"))))
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        v16 = CFSTR("Lightning_VoltageMonitor");
      }
      else
      {
        v24 = -[__CFString isEqual:](v6, "isEqual:", CFSTR("Speaker"));
        objc_msgSend(v9, "objectForKeyedSubscript:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v24)
          v16 = CFSTR("Speaker");
        else
          v16 = v6;
      }
      objc_msgSend(v14, "objectForKeyedSubscript:", v16);
      v18 = objc_claimAutoreleasedReturnValue();

      if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        -[NSObject allKeys](v18, "allKeys");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "sortedArrayUsingSelector:", sel_compareFloat_);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v23 = v26;
        v27 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
        if (v27)
        {
          v28 = v27;
          v29 = 0;
          v30 = *(_QWORD *)v55;
LABEL_25:
          v31 = 0;
          v32 = v29;
          while (1)
          {
            if (*(_QWORD *)v55 != v30)
              objc_enumerationMutation(v23);
            v33 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v31);
            objc_msgSend(v33, "doubleValue");
            v35 = v34;
            v29 = v33;
            if (v35 > a4)
              break;

            ++v31;
            v32 = v29;
            if (v28 == v31)
            {
              v28 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
              if (v28)
                goto LABEL_25;
              goto LABEL_41;
            }
          }

          if (!v29)
            goto LABEL_42;
          -[NSObject objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", v32);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "doubleValue");
          v43 = v42;

          -[NSObject objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", v29);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "doubleValue");
          v46 = v45;

          -[NSObject doubleValue](v32, "doubleValue");
          v48 = a4 - v47;
          -[NSObject doubleValue](v29, "doubleValue");
          v50 = v49;
          -[NSObject doubleValue](v32, "doubleValue");
          v8 = v43 + v48 / (v50 - v51) * (v46 - v43);
        }
        else
        {
          v29 = 0;
LABEL_41:

          v32 = v29;
LABEL_42:
          -[NSObject objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", v32);
          v29 = objc_claimAutoreleasedReturnValue();
          -[NSObject doubleValue](v29, "doubleValue");
          v8 = v52;
        }

      }
      else
      {
        if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          goto LABEL_46;
        v36 = objc_opt_class();
        v58[0] = MEMORY[0x1E0C809B0];
        v58[1] = 3221225472;
        v58[2] = __45__PLAudioAgent_audioPowerForRoute_forVolume___block_invoke_311;
        v58[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v58[4] = v36;
        if (qword_1ED8835B0 != -1)
          dispatch_once(&qword_1ED8835B0, v58);
        if (!byte_1ED88358A)
          goto LABEL_46;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No audio power model exists for audio class: %@ and route: %@"), v11, v6);
        v23 = objc_claimAutoreleasedReturnValue();
        v37 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLAudioAgent.m");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "lastPathComponent");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAudioAgent audioPowerForRoute:forVolume:]");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v39, v40, 1809);

        PLLogCommon();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v62 = v23;
          _os_log_debug_impl(&dword_1CAF47000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }

    }
    else
    {
      if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        goto LABEL_47;
      v17 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45__PLAudioAgent_audioPowerForRoute_forVolume___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v17;
      if (qword_1ED8835A8 != -1)
        dispatch_once(&qword_1ED8835A8, block);
      if (!byte_1ED883589)
        goto LABEL_47;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No audio power model exists for audio class: %@"), v11);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLAudioAgent.m");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastPathComponent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAudioAgent audioPowerForRoute:forVolume:]");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 1790);

      PLLogCommon();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v62 = v18;
        _os_log_debug_impl(&dword_1CAF47000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }

LABEL_46:
LABEL_47:

  }
  return v8;
}

uint64_t __45__PLAudioAgent_audioPowerForRoute_forVolume___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883589 = result;
  return result;
}

uint64_t __45__PLAudioAgent_audioPowerForRoute_forVolume___block_invoke_311(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88358A = result;
  return result;
}

- (void)closeAudioAccountingEvents
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = MEMORY[0x1E0C9AA70];
    objc_msgSend(v2, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 7, MEMORY[0x1E0C9AA70], v5);

    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 26, v3, v5);

  }
}

- (void)createAudioAccountingEvents:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;

  v14 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ApplicationName"));
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Operation"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("AudioPlayback_Start"));

      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ApplicationName"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "entryDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "createDistributionEventForwardWithDistributionID:withAddingChildNodeName:withStartDate:", 7, v9, v10);
LABEL_7:

        goto LABEL_8;
      }
    }
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Operation"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("AudioPlayback_Stop"));

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ApplicationName"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "entryDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "createDistributionEventForwardWithDistributionID:withRemovingChildNodeName:withStartDate:", 7, v9, v10);
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (void)createAirPlayAccountingEvents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0)
    goto LABEL_15;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AudioRoute"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("AirPlay")) & 1) != 0)
    goto LABEL_5;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AudioRoute"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Airtunes")) & 1) != 0)
  {

LABEL_5:
LABEL_6:
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ApplicationName"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Operation"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Operation"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "description");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("AudioPlayback_Stop"));

        objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "entryDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          objc_msgSend(v14, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 3, &unk_1E864CA30, v15);

          objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ApplicationName"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v30;
          v39[0] = &unk_1E8653180;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "entryDate");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 36, v31, v32);

          objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ApplicationName"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v34;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "entryDate");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 3, v35, v36);

          goto LABEL_15;
        }
        objc_msgSend(v14, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 3, &unk_1E864CA08, v15);

        objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "entryDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 36, MEMORY[0x1E0C9AA70], v17);

        v18 = (void *)MEMORY[0x1E0D7FED8];
        goto LABEL_13;
      }
    }
    goto LABEL_15;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AudioRoute"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "description");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("AirTunes"));

  if ((v21 & 1) != 0)
    goto LABEL_6;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AudioRoute"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "entryDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 3, &unk_1E864CA58, v24);

    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "entryDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 36, MEMORY[0x1E0C9AA70], v26);

    v18 = (void *)MEMORY[0x1E0D7FED8];
LABEL_13:
    objc_msgSend(v18, "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "entryDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 3, MEMORY[0x1E0C9AA60], v28);

  }
LABEL_15:

}

- (void)createCarPlayAccountingEvents:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
  {
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("AudioRoute"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("CarAudioOutput"));

    if (!v5)
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("AudioRoute"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

      goto LABEL_11;
    }
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ApplicationName"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Operation"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Operation"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("AudioPlayback_Stop"));

        objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ApplicationName"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "entryDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v12, "createDistributionEventForwardWithDistributionID:withRemovingChildNodeName:withStartDate:", 26, v13, v14);
        else
          objc_msgSend(v12, "createDistributionEventForwardWithDistributionID:withAddingChildNodeName:withStartDate:", 26, v13, v14);

        goto LABEL_10;
      }
    }
  }
LABEL_11:

}

- (void)createBluetoothAccountingEvents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0)
    goto LABEL_24;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AudioRoute"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("HeadsetBT")))
  {

LABEL_5:
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ApplicationName"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Operation"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Operation"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "description");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("AudioPlayback_Stop"));

        objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (!v14)
        {
          objc_msgSend(v15, "currentDistributionEventForwardWithDistributionID:", 8);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          v16 = v17;
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v31;
            do
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v31 != v20)
                  objc_enumerationMutation(v16);
                v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
                if ((objc_msgSend(v22, "isEqualToString:", CFSTR("Hotspot"), (_QWORD)v30) & 1) == 0
                  && (objc_msgSend(v22, "isEqualToString:", CFSTR("IDSWatchBT")) & 1) == 0)
                {
                  objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v3, "entryDate");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "createDistributionEventForwardWithDistributionID:withRemovingChildNodeName:withStartDate:", 8, v22, v24);

                }
              }
              v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
            }
            while (v19);
          }

          objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ApplicationName"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "entryDate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "createDistributionEventForwardWithDistributionID:withAddingChildNodeName:withStartDate:", 8, v26, v27);

          goto LABEL_23;
        }
LABEL_22:
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ApplicationName"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "entryDate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "createDistributionEventForwardWithDistributionID:withRemovingChildNodeName:withStartDate:", 8, v25, v26);
LABEL_23:

        goto LABEL_24;
      }
    }
    goto LABEL_24;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AudioRoute"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("HeadphonesBT"));

  if (v8)
    goto LABEL_5;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AudioRoute"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ApplicationName"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
  }
LABEL_24:

}

- (int)accessoryPowerState
{
  return self->_accessoryPowerState;
}

- (void)setAccessoryPowerState:(int)a3
{
  self->_accessoryPowerState = a3;
}

- (NSMutableArray)nsOutputNotifications
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (NSMutableArray)nsRoutingNotifications
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
}

- (PLEntryNotificationOperatorComposition)accessoryPowerCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAccessoryPowerCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PLNSNotificationOperatorComposition)thermalMonitorListener
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setThermalMonitorListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PLXPCListenerOperatorComposition)audioAppXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAudioAppXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (PLXPCListenerOperatorComposition)screenMirroringXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setScreenMirroringXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (PLXPCListenerOperatorComposition)speakerAmpXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSpeakerAmpXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (PLXPCListenerOperatorComposition)hapticsXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setHapticsXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (PLXPCListenerOperatorComposition)hapticsAssertionXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setHapticsAssertionXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (PLXPCListenerOperatorComposition)hapticsPrewarmCountListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 128, 1);
}

- (void)setHapticsPrewarmCountListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (PLXPCListenerOperatorComposition)hapticsRunningCountListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 136, 1);
}

- (void)setHapticsRunningCountListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (PLXPCListenerOperatorComposition)RMSLoggingXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 144, 1);
}

- (void)setRMSLoggingXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (PLXPCListenerOperatorComposition)CoreAudioVADXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 152, 1);
}

- (void)setCoreAudioVADXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (PLXPCListenerOperatorComposition)shazamRecordingXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 160, 1);
}

- (void)setShazamRecordingXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (PLXPCListenerOperatorComposition)mutedTalkerDetectionXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 168, 1);
}

- (void)setMutedTalkerDetectionXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (PLXPCListenerOperatorComposition)singXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 176, 1);
}

- (void)setSingXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (void)setHeadsetIsPlayingAudio:(BOOL)a3
{
  self->_headsetIsPlayingAudio = a3;
}

- (void)setCurrentVolume:(double)a3
{
  self->_currentVolume = a3;
}

- (NSString)audioHardware
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (NSDictionary)audioPowerModel
{
  return (NSDictionary *)objc_getProperty(self, a2, 208, 1);
}

- (NSDate)lastAudioStateChangeDate
{
  return (NSDate *)objc_getProperty(self, a2, 216, 1);
}

- (void)setLastAudioStateChangeDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (AudioDevice)defaultOutputDevice
{
  return self->_defaultOutputDevice;
}

- (void)setDefaultOutputDevice:(id)a3
{
  objc_storeStrong((id *)&self->_defaultOutputDevice, a3);
}

- (AudioDevice)defaultInputDevice
{
  return self->_defaultInputDevice;
}

- (void)setDefaultInputDevice:(id)a3
{
  objc_storeStrong((id *)&self->_defaultInputDevice, a3);
}

- (id)defaultOutputDeviceHandlerBlock
{
  return self->_defaultOutputDeviceHandlerBlock;
}

- (void)setDefaultOutputDeviceHandlerBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (id)defaultInputDeviceHandlerBlock
{
  return self->_defaultInputDeviceHandlerBlock;
}

- (void)setDefaultInputDeviceHandlerBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultInputDeviceHandlerBlock, 0);
  objc_storeStrong(&self->_defaultOutputDeviceHandlerBlock, 0);
  objc_storeStrong((id *)&self->_defaultInputDevice, 0);
  objc_storeStrong((id *)&self->_defaultOutputDevice, 0);
  objc_storeStrong((id *)&self->_lastAudioStateChangeDate, 0);
  objc_storeStrong((id *)&self->_audioPowerModel, 0);
  objc_storeStrong((id *)&self->_audioHardware, 0);
  objc_storeStrong((id *)&self->_entryRoutingOld, 0);
  objc_storeStrong((id *)&self->_singXPCListener, 0);
  objc_storeStrong((id *)&self->_mutedTalkerDetectionXPCListener, 0);
  objc_storeStrong((id *)&self->_shazamRecordingXPCListener, 0);
  objc_storeStrong((id *)&self->_CoreAudioVADXPCListener, 0);
  objc_storeStrong((id *)&self->_RMSLoggingXPCListener, 0);
  objc_storeStrong((id *)&self->_hapticsRunningCountListener, 0);
  objc_storeStrong((id *)&self->_hapticsPrewarmCountListener, 0);
  objc_storeStrong((id *)&self->_hapticsAssertionXPCListener, 0);
  objc_storeStrong((id *)&self->_hapticsXPCListener, 0);
  objc_storeStrong((id *)&self->_speakerAmpXPCListener, 0);
  objc_storeStrong((id *)&self->_screenMirroringXPCListener, 0);
  objc_storeStrong((id *)&self->_audioAppXPCListener, 0);
  objc_storeStrong((id *)&self->_thermalMonitorListener, 0);
  objc_storeStrong((id *)&self->_accessoryPowerCallback, 0);
  objc_storeStrong((id *)&self->_nsRoutingNotifications, 0);
  objc_storeStrong((id *)&self->_nsOutputNotifications, 0);
}

@end
