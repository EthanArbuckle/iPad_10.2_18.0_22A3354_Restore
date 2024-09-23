@implementation TTSSpeechRequest

- (NSString)text
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_speechString(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defrostedTransformedString(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSString *languageCode;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_text(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_length(v10, v11, v12, v13, v14);
  objc_msgSend_numberWithUnsignedInteger_(v5, v16, v15, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  languageCode = self->_languageCode;
  objc_msgSend_voice(self, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_footprint(v25, v26, v27, v28, v29);
  if ((unint64_t)(v30 - 1) > 4)
    objc_msgSend_stringWithFormat_(v3, v31, (uint64_t)CFSTR("[%@ %p] %@ language: %@ footprint: %@ rate: %lf pitch: %lf volume: %lf"), v32, v33, v4, self, v19, languageCode, 0, *(_QWORD *)&self->_rate, *(_QWORD *)&self->_pitch, *(_QWORD *)&self->_volume);
  else
    objc_msgSend_stringWithFormat_(v3, v31, (uint64_t)CFSTR("[%@ %p] %@ language: %@ footprint: %@ rate: %lf pitch: %lf volume: %lf"), v32, v33, v4, self, v19, languageCode, off_1E4AA0D08[v30 - 1], *(_QWORD *)&self->_rate, *(_QWORD *)&self->_pitch, *(_QWORD *)&self->_volume);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *jobIdentifier;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  id v32;

  jobIdentifier = self->_jobIdentifier;
  v32 = a3;
  objc_msgSend_encodeObject_forKey_(v32, v5, (uint64_t)jobIdentifier, (uint64_t)CFSTR("jobIdentifier"), v6);
  objc_msgSend_encodeObject_forKey_(v32, v7, (uint64_t)self->_languageCode, (uint64_t)CFSTR("languageCode"), v8);
  objc_msgSend_encodeObject_forKey_(v32, v9, (uint64_t)self->_voice, (uint64_t)CFSTR("voice"), v10);
  objc_msgSend_encodeInteger_forKey_(v32, v11, self->_gender, (uint64_t)CFSTR("gender"), v12);
  objc_msgSend_encodeDouble_forKey_(v32, v13, (uint64_t)CFSTR("rate"), v14, v15, self->_rate);
  objc_msgSend_encodeDouble_forKey_(v32, v16, (uint64_t)CFSTR("pitch"), v17, v18, self->_pitch);
  objc_msgSend_encodeDouble_forKey_(v32, v19, (uint64_t)CFSTR("volume"), v20, v21, self->_volume);
  objc_msgSend_encodeBool_forKey_(v32, v22, self->_maintainsInput, (uint64_t)CFSTR("maintainsInput"), v23);
  objc_msgSend_encodeBool_forKey_(v32, v24, self->_audioSessionIDIsValid, (uint64_t)CFSTR("audioSessionIDIsValid"), v25);
  objc_msgSend_encodeInt32_forKey_(v32, v26, self->_audioSessionID, (uint64_t)CFSTR("audioSessionID"), v27);
  objc_msgSend_encodeInt32_forKey_(v32, v28, self->_audioQueueFlags, (uint64_t)CFSTR("audioQueueFlags"), v29);
  objc_msgSend_encodeObject_forKey_(v32, v30, (uint64_t)self->_synthesisProviderVoice, (uint64_t)CFSTR("synthesisProviderVoice"), v31);

}

- (TTSSpeechRequest)initWithCoder:(id)a3
{
  id v4;
  TTSSpeechRequest *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  objc_super v91;

  v4 = a3;
  v91.receiver = self;
  v91.super_class = (Class)TTSSpeechRequest;
  v5 = -[TTSSpeechRequest init](&v91, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("languageCode"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLanguageCode_(v5, v10, (uint64_t)v9, v11, v12);

    v13 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, (uint64_t)CFSTR("voice"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setVoice_(v5, v17, (uint64_t)v16, v18, v19);

    v20 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v21, v20, (uint64_t)CFSTR("jobIdentifier"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setJobIdentifier_(v5, v24, (uint64_t)v23, v25, v26);

    v30 = objc_msgSend_decodeIntegerForKey_(v4, v27, (uint64_t)CFSTR("gender"), v28, v29);
    objc_msgSend_setGender_(v5, v31, v30, v32, v33);
    objc_msgSend_decodeDoubleForKey_(v4, v34, (uint64_t)CFSTR("rate"), v35, v36);
    objc_msgSend_setRate_(v5, v37, v38, v39, v40);
    objc_msgSend_decodeDoubleForKey_(v4, v41, (uint64_t)CFSTR("pitch"), v42, v43);
    objc_msgSend_setPitch_(v5, v44, v45, v46, v47);
    objc_msgSend_decodeDoubleForKey_(v4, v48, (uint64_t)CFSTR("volume"), v49, v50);
    objc_msgSend_setVolume_(v5, v51, v52, v53, v54);
    v58 = objc_msgSend_decodeBoolForKey_(v4, v55, (uint64_t)CFSTR("maintainsInput"), v56, v57);
    objc_msgSend_setMaintainsInput_(v5, v59, v58, v60, v61);
    v65 = objc_msgSend_decodeBoolForKey_(v4, v62, (uint64_t)CFSTR("audioSessionIDIsValid"), v63, v64);
    objc_msgSend_setAudioSessionIDIsValid_(v5, v66, v65, v67, v68);
    v72 = objc_msgSend_decodeInt32ForKey_(v4, v69, (uint64_t)CFSTR("audioSessionID"), v70, v71);
    objc_msgSend_setAudioSessionID_(v5, v73, v72, v74, v75);
    v79 = objc_msgSend_decodeInt32ForKey_(v4, v76, (uint64_t)CFSTR("audioQueueFlags"), v77, v78);
    objc_msgSend_setAudioQueueFlags_(v5, v80, v79, v81, v82);
    v83 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v84, v83, (uint64_t)CFSTR("synthesisProviderVoice"), v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSynthesisProviderVoice_(v5, v87, (uint64_t)v86, v88, v89);

  }
  return v5;
}

- (void)speechRequestDidStartForService:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  id v11;

  v4 = a3;
  objc_msgSend_delegate(self, v5, v6, v7, v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_speechRequestDidStart_forService_(v11, v9, (uint64_t)self, (uint64_t)v4, v10);

}

- (void)speechRequestDidPauseForService:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  id v11;

  v4 = a3;
  objc_msgSend_delegate(self, v5, v6, v7, v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_speechRequestDidPause_forService_(v11, v9, (uint64_t)self, (uint64_t)v4, v10);

}

- (void)speechRequestDidContinueForService:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  id v11;

  v4 = a3;
  objc_msgSend_delegate(self, v5, v6, v7, v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_speechRequestDidContinue_forService_(v11, v9, (uint64_t)self, (uint64_t)v4, v10);

}

- (void)speechRequestMarker:(id)a3 didStartForService:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend_delegate(self, v8, v9, v10, v11);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_speechRequest_withMarker_didStartForService_(v13, v12, (uint64_t)self, (uint64_t)v7, (uint64_t)v6);

}

- (void)speechRequestDidStopWithSuccess:(BOOL)a3 phonemesSpoken:(id)a4 forService:(id)a5 error:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;

  v8 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if ((objc_msgSend_sentSpeechDone(self, v13, v14, v15, v16) & 1) != 0)
  {
    AXTTSLogCommon();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      sub_1A3AB2238((uint64_t)self, v21);

  }
  else
  {
    objc_msgSend_delegate(self, v17, v18, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_speechRequest_didStopWithSuccess_phonemesSpoken_forService_error_(v22, v23, (uint64_t)self, v8, (uint64_t)v10, v11, v12);

    objc_msgSend_setSentSpeechDone_(self, v24, 1, v25, v26);
  }

}

- (NSString)jobIdentifier
{
  return self->_jobIdentifier;
}

- (void)setJobIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_jobIdentifier, a3);
}

- (TTSSpeechVoice)voice
{
  return self->_voice;
}

- (void)setVoice:(id)a3
{
  objc_storeStrong((id *)&self->_voice, a3);
}

- (TTSSpeechString)speechString
{
  return self->_speechString;
}

- (void)setSpeechString:(id)a3
{
  objc_storeStrong((id *)&self->_speechString, a3);
}

- (TTSSpeechString)unescapedSpeechString
{
  return self->_unescapedSpeechString;
}

- (void)setUnescapedSpeechString:(id)a3
{
  objc_storeStrong((id *)&self->_unescapedSpeechString, a3);
}

- (AVSpeechSynthesisProviderVoice)synthesisProviderVoice
{
  return self->_synthesisProviderVoice;
}

- (void)setSynthesisProviderVoice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int64_t)gender
{
  return self->_gender;
}

- (void)setGender:(int64_t)a3
{
  self->_gender = a3;
}

- (double)rate
{
  return self->_rate;
}

- (void)setRate:(double)a3
{
  self->_rate = a3;
}

- (double)pitch
{
  return self->_pitch;
}

- (void)setPitch:(double)a3
{
  self->_pitch = a3;
}

- (double)volume
{
  return self->_volume;
}

- (void)setVolume:(double)a3
{
  self->_volume = a3;
}

- (BOOL)maintainsInput
{
  return self->_maintainsInput;
}

- (void)setMaintainsInput:(BOOL)a3
{
  self->_maintainsInput = a3;
}

- (BOOL)audioSessionIDIsValid
{
  return self->_audioSessionIDIsValid;
}

- (void)setAudioSessionIDIsValid:(BOOL)a3
{
  self->_audioSessionIDIsValid = a3;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (void)setAudioSessionID:(unsigned int)a3
{
  self->_audioSessionID = a3;
}

- (unsigned)audioQueueFlags
{
  return self->_audioQueueFlags;
}

- (void)setAudioQueueFlags:(unsigned int)a3
{
  self->_audioQueueFlags = a3;
}

- (double)latency
{
  return self->_latency;
}

- (void)setLatency:(double)a3
{
  self->_latency = a3;
}

- (double)dispatchTime
{
  return self->_dispatchTime;
}

- (void)setDispatchTime:(double)a3
{
  self->_dispatchTime = a3;
}

- (double)handledTime
{
  return self->_handledTime;
}

- (void)setHandledTime:(double)a3
{
  self->_handledTime = a3;
}

- (NSArray)channels
{
  return self->_channels;
}

- (void)setChannels:(id)a3
{
  objc_storeStrong((id *)&self->_channels, a3);
}

- (unint64_t)synthesizerInstanceID
{
  return self->_synthesizerInstanceID;
}

- (void)setSynthesizerInstanceID:(unint64_t)a3
{
  self->_synthesizerInstanceID = a3;
}

- (void)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(void *)a3
{
  self->_clientContext = a3;
}

- (id)audioBufferCallback
{
  return self->_audioBufferCallback;
}

- (void)setAudioBufferCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (id)latencyCallback
{
  return self->_latencyCallback;
}

- (void)setLatencyCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (BOOL)synthesizeSilently
{
  return self->_synthesizeSilently;
}

- (void)setSynthesizeSilently:(BOOL)a3
{
  self->_synthesizeSilently = a3;
}

- (OS_voucher)voucher
{
  return self->_voucher;
}

- (void)setVoucher:(id)a3
{
  objc_storeStrong((id *)&self->_voucher, a3);
}

- (NSDictionary)voiceSettings
{
  return self->_voiceSettings;
}

- (void)setVoiceSettings:(id)a3
{
  objc_storeStrong((id *)&self->_voiceSettings, a3);
}

- (BOOL)sentSpeechDone
{
  return self->_sentSpeechDone;
}

- (void)setSentSpeechDone:(BOOL)a3
{
  self->_sentSpeechDone = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceSettings, 0);
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong(&self->_latencyCallback, 0);
  objc_storeStrong(&self->_audioBufferCallback, 0);
  objc_storeStrong((id *)&self->_channels, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_synthesisProviderVoice, 0);
  objc_storeStrong((id *)&self->_unescapedSpeechString, 0);
  objc_storeStrong((id *)&self->_speechString, 0);
  objc_storeStrong((id *)&self->_voice, 0);
  objc_storeStrong((id *)&self->_jobIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
