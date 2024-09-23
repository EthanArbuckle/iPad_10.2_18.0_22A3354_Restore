@implementation TTSSpeechAction

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  objc_msgSend_utterance(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAction_(v6, v7, 0, v8, v9);

  v10.receiver = self;
  v10.super_class = (Class)TTSSpeechAction;
  -[TTSSpeechAction dealloc](&v10, sel_dealloc);
}

- (void)setUtterance:(id)a3
{
  objc_setAssociatedObject(self, &unk_1EE6D5728, a3, (void *)1);
}

- (AVSpeechUtterance)utterance
{
  return (AVSpeechUtterance *)objc_getAssociatedObject(self, &unk_1EE6D5728);
}

+ (id)actionWithString:(id)a3 shouldQueue:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  TTSSpeechAction *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a4;
  v5 = a3;
  v6 = objc_alloc_init(TTSSpeechAction);
  objc_msgSend_setString_(v6, v7, (uint64_t)v5, v8, v9);

  objc_msgSend_setShouldQueue_(v6, v10, v4, v11, v12);
  return v6;
}

+ (id)actionWithAttributedString:(id)a3 shouldQueue:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  TTSSpeechAction *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a4;
  v5 = a3;
  v6 = objc_alloc_init(TTSSpeechAction);
  objc_msgSend_setAttributedString_(v6, v7, (uint64_t)v5, v8, v9);

  objc_msgSend_setShouldQueue_(v6, v10, v4, v11, v12);
  return v6;
}

+ (id)actionWithSSMLRepresentation:(id)a3 shouldQueue:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  NSObject *v6;
  TTSSpeechAction *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a4;
  v5 = a3;
  AXLogSpeechSynthesis();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_1A3AB2BDC();

  v7 = objc_alloc_init(TTSSpeechAction);
  objc_msgSend_setString_(v7, v8, (uint64_t)v5, v9, v10);
  objc_msgSend_setSsmlRepresentation_(v7, v11, (uint64_t)v5, v12, v13);
  objc_msgSend_setShouldQueue_(v7, v14, v4, v15, v16);

  return v7;
}

- (TTSSpeechAction)init
{
  TTSSpeechAction *result;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TTSSpeechAction;
  result = -[TTSSpeechAction init](&v9, sel_init);
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&result->_pitch = _Q0;
  result->_shouldPrecomposeString = 1;
  v8 = 4.0;
  if (!byte_1EE6D5788)
    v8 = 0.5;
  result->_speakingRate = v8;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TTSSpeechAction *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;

  v4 = objc_alloc_init(TTSSpeechAction);
  objc_msgSend_string(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend_copy(v9, v10, v11, v12, v13);
  objc_msgSend_setString_(v4, v15, (uint64_t)v14, v16, v17);

  objc_msgSend_language(self, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend_copy(v22, v23, v24, v25, v26);
  objc_msgSend_setLanguage_(v4, v28, (uint64_t)v27, v29, v30);

  return v4;
}

- (void)preprocessAction
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  _BOOL4 shouldProcessEmoticons;
  char shouldProcessEmoji;
  NSMutableArray *v38;
  NSMutableArray *emojiRangeReplacements;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  _TtC12TextToSpeech15SSMLVoiceTagger *v72;

  if (self->_shouldPrecomposeString)
  {
    objc_msgSend_string(self, a2, v2, v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_precomposedStringWithCanonicalMapping(v6, v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setString_(self, v12, (uint64_t)v11, v13, v14);

    objc_msgSend_ssmlRepresentation(self, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_precomposedStringWithCanonicalMapping(v19, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSsmlRepresentation_(self, v25, (uint64_t)v24, v26, v27);

  }
  objc_msgSend_language(self, a2, v2, v3, v4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v32)
  {
    if (!self->_shouldDetectLanguage)
      goto LABEL_7;
    objc_msgSend__detectLanguageFromContent(self, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLanguage_(self, v33, (uint64_t)v32, v34, v35);
  }

LABEL_7:
  shouldProcessEmoticons = self->_shouldProcessEmoticons;
  if (!self->_shouldProcessEmoji)
  {
    if (!self->_shouldProcessEmoticons)
      goto LABEL_14;
    shouldProcessEmoticons = 1;
  }
  if (shouldProcessEmoticons)
    shouldProcessEmoji = self->_shouldProcessEmoji | 2;
  else
    shouldProcessEmoji = self->_shouldProcessEmoji;
  v38 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  emojiRangeReplacements = self->_emojiRangeReplacements;
  self->_emojiRangeReplacements = v38;

  objc_msgSend_string(self, v40, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_language(self, v45, v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_voiceIdentifier(self, v50, v51, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  TTSSpeechTransformTextWithLanguageAndVoiceIdentifier(v44, shouldProcessEmoji, v49, v54, self->_emojiRangeReplacements);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setProcessedString_(self, v56, (uint64_t)v55, v57, v58);

LABEL_14:
  objc_msgSend_ssmlRepresentation(self, v28, v29, v30, v31);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    v72 = objc_alloc_init(_TtC12TextToSpeech15SSMLVoiceTagger);
    objc_msgSend_ssmlRepresentation(self, v60, v61, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tagSSML_(v72, v65, (uint64_t)v64, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTaggedSSML_(self, v69, (uint64_t)v68, v70, v71);

  }
}

- (id)_detectLanguageFromContent
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  __CFString *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  NSObject *v70;
  NSObject *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint8_t buf[4];
  uint64_t v77;
  uint64_t v78;
  CFRange v79;

  v78 = *MEMORY[0x1E0C80C00];
  objc_msgSend_string(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v7, (uint64_t)CFSTR("content is nil, language detection not possible"), v9, v10);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v37, (uint64_t)CFSTR("%s:%d %@"), v38, v39, "-[TTSSpeechAction _detectLanguageFromContent]", 231, v31);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (qword_1ED1B5680 != -1)
      dispatch_once(&qword_1ED1B5680, &unk_1E4A9F448);
    v36 = (void *)qword_1ED1B5688;
    if (!os_log_type_enabled((os_log_t)qword_1ED1B5688, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
LABEL_10:
    v40 = objc_retainAutorelease(v35);
    v41 = v36;
    *(_DWORD *)buf = 136446210;
    v77 = objc_msgSend_UTF8String(v40, v42, v43, v44, v45);
    _os_log_impl(&dword_1A3940000, v41, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
LABEL_11:

LABEL_12:
    v46 = 0;
    goto LABEL_13;
  }
  objc_msgSend_string(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_length(v11, v12, v13, v14, v15);

  if (v16 <= 0x15D)
  {
    v21 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_string(self, v17, v18, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend_length(v22, v23, v24, v25, v26);
    objc_msgSend_stringWithFormat_(v21, v28, (uint64_t)CFSTR("Not enough characters (%lu) to accurately detect language"), v29, v30, v27);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v32, (uint64_t)CFSTR("%s:%d %@"), v33, v34, "-[TTSSpeechAction _detectLanguageFromContent]", 238, v31);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (qword_1ED1B5680 != -1)
      dispatch_once(&qword_1ED1B5680, &unk_1E4AA12D8);
    v36 = (void *)qword_1ED1B5688;
    if (!os_log_type_enabled((os_log_t)qword_1ED1B5688, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    goto LABEL_10;
  }
  objc_msgSend_string(self, v17, v18, v19, v20);
  v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_string(self, v49, v50, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v79.length = objc_msgSend_length(v53, v54, v55, v56, v57);
  v79.location = 0;
  v31 = (void *)CFStringTokenizerCopyBestStringLanguage(v48, v79);

  if (!v31)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v58, (uint64_t)CFSTR("could not determine content language, returning default"), v59, v60);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v66, (uint64_t)CFSTR("%s:%d %@"), v67, v68, "-[TTSSpeechAction _detectLanguageFromContent]", 245, v35);
    v41 = objc_claimAutoreleasedReturnValue();
    if (qword_1ED1B5680 != -1)
      dispatch_once(&qword_1ED1B5680, &unk_1E4AA12F8);
    v69 = (void *)qword_1ED1B5688;
    if (os_log_type_enabled((os_log_t)qword_1ED1B5688, OS_LOG_TYPE_DEFAULT))
    {
      v70 = objc_retainAutorelease(v41);
      v71 = v69;
      *(_DWORD *)buf = 136446210;
      v77 = objc_msgSend_UTF8String(v70, v72, v73, v74, v75);
      _os_log_impl(&dword_1A3940000, v71, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    goto LABEL_11;
  }
  v61 = TTSPreferencesCopyDefaultOutputLanguageIdentifierForUserPreferences();
  v65 = v61;
  if (v61 && objc_msgSend_rangeOfString_(v61, v62, (uint64_t)v31, v63, v64) != 0x7FFFFFFFFFFFFFFFLL)
    v46 = 0;
  else
    v46 = v31;

LABEL_13:
  return v46;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("<TTSSpeechAction: %p> %@ :Pitch %f : Language: %@, voiceId: %@"), v2, v3, self, self->_string, *(_QWORD *)&self->_pitch, self->_language, self->_voiceIdentifier);
}

+ (void)test_setUseMaxSpeechRate:(BOOL)a3
{
  byte_1EE6D5788 = a3;
}

- (BOOL)shouldQueue
{
  return self->_shouldQueue;
}

- (void)setShouldQueue:(BOOL)a3
{
  self->_shouldQueue = a3;
}

- (BOOL)cannotInterrupt
{
  return self->_cannotInterrupt;
}

- (void)setCannotInterrupt:(BOOL)a3
{
  self->_cannotInterrupt = a3;
}

- (BOOL)shouldDetectLanguage
{
  return self->_shouldDetectLanguage;
}

- (void)setShouldDetectLanguage:(BOOL)a3
{
  self->_shouldDetectLanguage = a3;
}

- (BOOL)shouldProcessEmoji
{
  return self->_shouldProcessEmoji;
}

- (void)setShouldProcessEmoji:(BOOL)a3
{
  self->_shouldProcessEmoji = a3;
}

- (BOOL)shouldProcessEmoticons
{
  return self->_shouldProcessEmoticons;
}

- (void)setShouldProcessEmoticons:(BOOL)a3
{
  self->_shouldProcessEmoticons = a3;
}

- (BOOL)shouldPrecomposeString
{
  return self->_shouldPrecomposeString;
}

- (void)setShouldPrecomposeString:(BOOL)a3
{
  self->_shouldPrecomposeString = a3;
}

- (BOOL)ignoreCustomSubstitutions
{
  return self->_ignoreCustomSubstitutions;
}

- (void)setIgnoreCustomSubstitutions:(BOOL)a3
{
  self->_ignoreCustomSubstitutions = a3;
}

- (BOOL)synthesizeSilently
{
  return self->_synthesizeSilently;
}

- (void)setSynthesizeSilently:(BOOL)a3
{
  self->_synthesizeSilently = a3;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
}

- (NSString)voiceIdentifier
{
  return self->_voiceIdentifier;
}

- (void)setVoiceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_voiceIdentifier, a3);
}

- (AXCVoiceSelection)voiceSelection
{
  return self->_voiceSelection;
}

- (void)setVoiceSelection:(id)a3
{
  objc_storeStrong((id *)&self->_voiceSelection, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (id)audioBufferCallback
{
  return self->_audioBufferCallback;
}

- (void)setAudioBufferCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (id)markerCallback
{
  return self->_markerCallback;
}

- (void)setMarkerCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (void)setAttributedString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)ssmlRepresentation
{
  return self->_ssmlRepresentation;
}

- (void)setSsmlRepresentation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (id)completionCallback
{
  return self->_completionCallback;
}

- (void)setCompletionCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)onPauseCallback
{
  return self->_onPauseCallback;
}

- (void)setOnPauseCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)onResumeCallback
{
  return self->_onResumeCallback;
}

- (void)setOnResumeCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)onWillSpeakRangeCallback
{
  return self->_onWillSpeakRangeCallback;
}

- (void)setOnWillSpeakRangeCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)onMarkerCallback
{
  return self->_onMarkerCallback;
}

- (void)setOnMarkerCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)onSpeechStartCallback
{
  return self->_onSpeechStartCallback;
}

- (void)setOnSpeechStartCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (double)speakingRate
{
  return self->_speakingRate;
}

- (void)setSpeakingRate:(double)a3
{
  self->_speakingRate = a3;
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

- (int64_t)wordCallbackPostProcessedOffset
{
  return self->_wordCallbackPostProcessedOffset;
}

- (void)setWordCallbackPostProcessedOffset:(int64_t)a3
{
  self->_wordCallbackPostProcessedOffset = a3;
}

- (NSString)finalSpokenString
{
  return self->_finalSpokenString;
}

- (void)setFinalSpokenString:(id)a3
{
  objc_storeStrong((id *)&self->_finalSpokenString, a3);
}

- (NSString)processedString
{
  return self->_processedString;
}

- (void)setProcessedString:(id)a3
{
  objc_storeStrong((id *)&self->_processedString, a3);
}

- (_TtC12TextToSpeech10TaggedSSML)taggedSSML
{
  return self->_taggedSSML;
}

- (void)setTaggedSSML:(id)a3
{
  objc_storeStrong((id *)&self->_taggedSSML, a3);
}

- (unint64_t)currentSSMLSnippetIndex
{
  return self->_currentSSMLSnippetIndex;
}

- (void)setCurrentSSMLSnippetIndex:(unint64_t)a3
{
  self->_currentSSMLSnippetIndex = a3;
}

- (NSMutableArray)emojiRangeReplacements
{
  return self->_emojiRangeReplacements;
}

- (void)setEmojiRangeReplacements:(id)a3
{
  objc_storeStrong((id *)&self->_emojiRangeReplacements, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emojiRangeReplacements, 0);
  objc_storeStrong((id *)&self->_taggedSSML, 0);
  objc_storeStrong((id *)&self->_processedString, 0);
  objc_storeStrong((id *)&self->_finalSpokenString, 0);
  objc_storeStrong((id *)&self->_ssmlRepresentation, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong(&self->_markerCallback, 0);
  objc_storeStrong(&self->_audioBufferCallback, 0);
  objc_storeStrong((id *)&self->_voiceSelection, 0);
  objc_storeStrong((id *)&self->_voiceIdentifier, 0);
  objc_storeStrong(&self->_onMarkerCallback, 0);
  objc_storeStrong(&self->_onSpeechStartCallback, 0);
  objc_storeStrong(&self->_onWillSpeakRangeCallback, 0);
  objc_storeStrong(&self->_onResumeCallback, 0);
  objc_storeStrong(&self->_onPauseCallback, 0);
  objc_storeStrong(&self->_completionCallback, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
