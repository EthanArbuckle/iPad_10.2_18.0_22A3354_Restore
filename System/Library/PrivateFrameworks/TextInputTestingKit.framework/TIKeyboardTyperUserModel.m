@implementation TIKeyboardTyperUserModel

- (TIKeyboardTyperUserModel)initWithModel:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  __CFString *v30;
  __CFString *v31;
  __CFString *v32;
  __CFString *v33;
  __CFString *v34;
  __CFString *v35;
  __CFString *v36;
  __CFString *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  int v66;
  void *v67;
  void *v68;
  int v69;
  void *v70;
  void *v71;
  int v72;
  void *v73;
  void *v74;
  int v75;
  void *v76;
  void *v77;
  int v78;
  void *v79;
  void *v80;
  int v81;
  void *v82;
  void *v83;
  int v84;
  void *v85;
  void *v86;
  int v87;
  void *v88;
  void *v89;
  int v90;
  void *v91;
  void *v92;
  int v93;
  __CFString *v94;
  __CFString *v95;
  objc_super v102;

  v4 = a3;
  v102.receiver = self;
  v102.super_class = (Class)TIKeyboardTyperUserModel;
  v5 = -[TIKeyboardTyperUserModel init](&v102, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)*((_QWORD *)v5 + 13);
    *((_QWORD *)v5 + 13) = v6;

    objc_msgSend(v4, "objectForKey:", CFSTR("PREFERS_CONTINUOUS_PATH"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
      v8 = CFSTR("NO");
    v5[8] = -[__CFString BOOLValue](v8, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("CONTINUOUS_PATH_APPEND_SPACE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10)
      v10 = (void *)MEMORY[0x24BDBD1C0];
    v5[9] = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("BASE_KEY_FOR_VARIANTS"));
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v12)
      v12 = CFSTR("YES");
    v5[10] = -[__CFString BOOLValue](v12, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("PREFERS_PREDICTION_SELECTION"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v5[11] = objc_msgSend(v14, "BOOLValue");
    }
    else
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("PREFERS_AUTOCORRECTION_LISTS"));
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (!v16)
        v16 = CFSTR("NO");
      v5[11] = -[__CFString BOOLValue](v16, "BOOLValue");

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("PREFERS_INLINE_SELECTION"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (!v18)
      v18 = CFSTR("NO");
    v5[12] = -[__CFString BOOLValue](v18, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("PREFERS_SPACEBAR_DOUBLETAP"));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (!v20)
      v20 = CFSTR("NO");
    v5[13] = -[__CFString BOOLValue](v20, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("PREFERS_TO_CORRECT_ERRORS"));
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (!v22)
      v22 = CFSTR("NO");
    v5[14] = -[__CFString BOOLValue](v22, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("PREFERS_AUTOCORRECT_FOR_CAPS"));
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (!v24)
      v24 = CFSTR("NO");
    v5[16] = -[__CFString BOOLValue](v24, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("PREFERS_AUTOCORRECT_FOR_APOSTROPHES"));
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (!v26)
      v26 = CFSTR("NO");
    v5[17] = -[__CFString BOOLValue](v26, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("PREFERS_MANUAL_REVISION_FOR_BAD_AUTOCORRECT"));
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (!v28)
      v28 = CFSTR("NO");
    v5[22] = -[__CFString BOOLValue](v28, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("DECOMPOSE_INPUT_STRING"));
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (!v30)
      v30 = CFSTR("NO");
    v5[18] = -[__CFString BOOLValue](v30, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("PREFERS_TRANSLITERATION"));
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (!v32)
      v32 = CFSTR("NO");
    v5[19] = -[__CFString BOOLValue](v32, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("TRANSLITERATE_WITH_SPACES"));
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (!v34)
      v34 = CFSTR("NO");
    v5[20] = -[__CFString BOOLValue](v34, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("USE_PARTIAL_CANDIDATES"));
    v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (!v36)
      v36 = CFSTR("0");
    v5[21] = -[__CFString BOOLValue](v36, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("AVERAGE_KEY_TAPS_PER_SECOND"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (!v38)
      v38 = &unk_24FD5FDE8;
    objc_msgSend(v38, "floatValue");
    *((_DWORD *)v5 + 9) = v40;

    objc_msgSend(v4, "objectForKey:", CFSTR("PROB_BEGIN_CORRECTING_AFTER_WORD"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (!v41)
      v41 = &unk_24FD5FDF8;
    objc_msgSend(v41, "floatValue");
    *((_DWORD *)v5 + 6) = v43;

    objc_msgSend(v4, "objectForKey:", CFSTR("PROB_BEGIN_CORRECTING_AFTER_WORD_TERMINATOR"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v44;
    if (!v44)
      v44 = &unk_24FD5FDF8;
    objc_msgSend(v44, "floatValue");
    *((_DWORD *)v5 + 7) = v46;

    objc_msgSend(v4, "objectForKey:", CFSTR("PROB_REJECT_BAD_AUTOCORRECTION"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if (!v47)
      v47 = &unk_24FD5FDF8;
    objc_msgSend(v47, "floatValue");
    *((_DWORD *)v5 + 8) = v49;

    objc_msgSend(v4, "objectForKey:", CFSTR("MAX_PRIOR_SEGMENTS_CHECKED_FOR_ERRORS"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v50;
    if (!v50)
      v50 = &unk_24FD5F750;
    *((_QWORD *)v5 + 12) = objc_msgSend(v50, "integerValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("PROB_TRANSPOSE_LETTERS"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v52;
    if (!v52)
      v52 = &unk_24FD5FDF8;
    objc_msgSend(v52, "floatValue");
    *((_DWORD *)v5 + 10) = v54;

    objc_msgSend(v4, "objectForKey:", CFSTR("PROB_TRANSPOSE_LETTER_AND_SPACE"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v55;
    if (!v55)
      v55 = &unk_24FD5FDF8;
    objc_msgSend(v55, "floatValue");
    *((_DWORD *)v5 + 11) = v57;

    objc_msgSend(v4, "objectForKey:", CFSTR("PROB_SKIP_LETTER"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v58;
    if (!v58)
      v58 = &unk_24FD5FDF8;
    objc_msgSend(v58, "floatValue");
    *((_DWORD *)v5 + 12) = v60;

    objc_msgSend(v4, "objectForKey:", CFSTR("PROB_SKIP_INITIAL_LETTER"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v61;
    if (!v61)
      v61 = &unk_24FD5FDF8;
    objc_msgSend(v61, "floatValue");
    *((_DWORD *)v5 + 13) = v63;

    objc_msgSend(v4, "objectForKey:", CFSTR("PROB_SKIP_REPEAT_LETTER"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v64;
    if (!v64)
      v64 = &unk_24FD5FDF8;
    objc_msgSend(v64, "floatValue");
    *((_DWORD *)v5 + 14) = v66;

    objc_msgSend(v4, "objectForKey:", CFSTR("PROB_SKIP_SPACE"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v67;
    if (!v67)
      v67 = &unk_24FD5FDF8;
    objc_msgSend(v67, "floatValue");
    *((_DWORD *)v5 + 15) = v69;

    objc_msgSend(v4, "objectForKey:", CFSTR("PROB_DOUBLE_TAP_LETTER"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v70;
    if (!v70)
      v70 = &unk_24FD5FDF8;
    objc_msgSend(v70, "floatValue");
    *((_DWORD *)v5 + 16) = v72;

    objc_msgSend(v4, "objectForKey:", CFSTR("PROB_DOUBLE_TAP_INITIAL_LETTER"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v73;
    if (!v73)
      v73 = &unk_24FD5FDF8;
    objc_msgSend(v73, "floatValue");
    *((_DWORD *)v5 + 17) = v75;

    objc_msgSend(v4, "objectForKey:", CFSTR("PROB_SUBSTITUTE_LETTER"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = v76;
    if (!v76)
      v76 = &unk_24FD5FDF8;
    objc_msgSend(v76, "floatValue");
    *((_DWORD *)v5 + 18) = v78;

    objc_msgSend(v4, "objectForKey:", CFSTR("PROB_SUBSTITUTE_INITIAL_LETTER"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v79;
    if (!v79)
      v79 = &unk_24FD5FDF8;
    objc_msgSend(v79, "floatValue");
    *((_DWORD *)v5 + 19) = v81;

    objc_msgSend(v4, "objectForKey:", CFSTR("PROB_SUBSTITUTE_SPACE"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v82;
    if (!v82)
      v82 = &unk_24FD5FDF8;
    objc_msgSend(v82, "floatValue");
    *((_DWORD *)v5 + 20) = v84;

    objc_msgSend(v4, "objectForKey:", CFSTR("PROB_EXTRANEOUS_KEY"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v85;
    if (!v85)
      v85 = &unk_24FD5FDF8;
    objc_msgSend(v85, "floatValue");
    *((_DWORD *)v5 + 21) = v87;

    objc_msgSend(v4, "objectForKey:", CFSTR("PROB_EXTRANEOUS_INITIAL_KEY"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v88;
    if (!v88)
      v88 = &unk_24FD5FDF8;
    objc_msgSend(v88, "floatValue");
    *((_DWORD *)v5 + 22) = v90;

    objc_msgSend(v4, "objectForKey:", CFSTR("PROB_EXTRANEOUS_FINAL_KEY"));
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = v91;
    if (!v91)
      v91 = &unk_24FD5FDF8;
    objc_msgSend(v91, "floatValue");
    *((_DWORD *)v5 + 23) = v93;

    objc_msgSend(v4, "objectForKey:", CFSTR("PREFERS_AUTOCORRECT_WITH_REVISION"));
    v94 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v95 = v94;
    if (!v94)
      v94 = CFSTR("NO");
    v5[15] = -[__CFString BOOLValue](v94, "BOOLValue");

    if (v5[15] || TIIsRevision_Enabled())
    {
      v5[14] = 1;
      __asm { FMOV            V0.2S, #1.0 }
      *(_QWORD *)(v5 + 28) = _D0;
    }
  }

  return (TIKeyboardTyperUserModel *)v5;
}

- (BOOL)prefersContinuousPath
{
  return self->_prefersContinuousPath;
}

- (BOOL)expectsAppendedSpaceToContinuousPath
{
  return self->_expectsAppendedSpaceToContinuousPath;
}

- (BOOL)baseKeyForVariants
{
  return self->_baseKeyForVariants;
}

- (BOOL)prefersPredictionSelection
{
  return self->_prefersPredictionSelection;
}

- (BOOL)prefersInlineSelection
{
  return self->_prefersInlineSelection;
}

- (BOOL)prefersSpaceBarDoubleTap
{
  return self->_prefersSpaceBarDoubleTap;
}

- (BOOL)prefersToCorrectErrors
{
  return self->_prefersToCorrectErrors;
}

- (BOOL)prefersAutocorrectWithRevision
{
  return self->_prefersAutocorrectWithRevision;
}

- (float)probBeginCorrectingAfterWord
{
  return self->_probBeginCorrectingAfterWord;
}

- (float)probBeginCorrectingAfterWordTerminator
{
  return self->_probBeginCorrectingAfterWordTerminator;
}

- (float)probRejectBadAutocorrection
{
  return self->_probRejectBadAutocorrection;
}

- (BOOL)prefersAutocorrectForCaps
{
  return self->_prefersAutocorrectForCaps;
}

- (BOOL)prefersAutocorrectForApostrophes
{
  return self->_prefersAutocorrectForApostrophes;
}

- (BOOL)decomposeInputString
{
  return self->_decomposeInputString;
}

- (BOOL)prefersTransliteration
{
  return self->_prefersTransliteration;
}

- (BOOL)spacesBetweenTransliterations
{
  return self->_spacesBetweenTransliterations;
}

- (BOOL)usePartialCandidates
{
  return self->_usePartialCandidates;
}

- (BOOL)prefersManualRevisionForBadAutocorrect
{
  return self->_prefersManualRevisionForBadAutocorrect;
}

- (float)averageKeyTapsPerSecond
{
  return self->_averageKeyTapsPerSecond;
}

- (unint64_t)maxPriorSegmentsCheckedForErrors
{
  return self->_maxPriorSegmentsCheckedForErrors;
}

- (float)probTransposeLetters
{
  return self->_probTransposeLetters;
}

- (float)probTransposeLetterAndSpace
{
  return self->_probTransposeLetterAndSpace;
}

- (float)probSkipLetter
{
  return self->_probSkipLetter;
}

- (float)probSkipInitialLetter
{
  return self->_probSkipInitialLetter;
}

- (float)probSkipRepeatLetter
{
  return self->_probSkipRepeatLetter;
}

- (float)probSkipSpace
{
  return self->_probSkipSpace;
}

- (float)probDoubleTapLetter
{
  return self->_probDoubleTapLetter;
}

- (float)probDoubleTapInitialLetter
{
  return self->_probDoubleTapInitialLetter;
}

- (float)probSubstituteLetter
{
  return self->_probSubstituteLetter;
}

- (float)probSubstituteInitialLetter
{
  return self->_probSubstituteInitialLetter;
}

- (float)probSubstituteSpace
{
  return self->_probSubstituteSpace;
}

- (float)probExtraneousKey
{
  return self->_probExtraneousKey;
}

- (float)probExtraneousInitialKey
{
  return self->_probExtraneousInitialKey;
}

- (float)probExtraneousFinalKey
{
  return self->_probExtraneousFinalKey;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
}

+ (TIKeyboardTyperUserModel)modelWithName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  TIKeyboardTyperUserModel *v8;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathForResource:ofType:", v4, CFSTR("plist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", v6);
  v8 = -[TIKeyboardTyperUserModel initWithModel:]([TIKeyboardTyperUserModel alloc], "initWithModel:", v7);

  return v8;
}

+ (id)defaultModel
{
  return +[TIKeyboardTyperUserModel modelWithName:](TIKeyboardTyperUserModel, "modelWithName:", CFSTR("DefaultModel"));
}

+ (id)typeVariantKeysModel
{
  return +[TIKeyboardTyperUserModel modelWithName:](TIKeyboardTyperUserModel, "modelWithName:", CFSTR("TypeVariantKeys"));
}

@end
