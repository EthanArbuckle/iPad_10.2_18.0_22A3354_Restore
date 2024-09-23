@implementation TITypingEffortAnalyzer

- (void)dispatchEventWithActionSummary:(id)a3 outputSummary:(id)a4
{
  TITypingSession *session;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  TIKBAnalyticsMetricsContext *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  TIKBAnalyticsMetricsContext *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  _BOOL8 v32;
  _BOOL8 v33;
  int v34;
  int v35;
  int v36;
  BOOL v37;
  double v38;
  double v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  __CFString *v45;
  __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  TIKBAnalyticsMetricsContext *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  _QWORD v145[86];
  _QWORD v146[88];

  v146[86] = *MEMORY[0x1E0C80C00];
  session = self->_session;
  v7 = a4;
  v8 = a3;
  -[TITypingSession userActionHistory](session, "userActionHistory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "keyboardState");
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = [TIKBAnalyticsMetricsContext alloc];
  -[TITypingSession sessionParams](self->_session, "sessionParams");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activeInputModes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITypingSession sessionParams](self->_session, "sessionParams");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "testingParameters");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = (void *)v11;
  v17 = -[TIKBAnalyticsMetricsContext initWithKeyboardState:activeInputModes:testingParameters:](v12, "initWithKeyboardState:activeInputModes:testingParameters:", v11, v14, v16);

  -[TITypingSession userActionHistory](self->_session, "userActionHistory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "keyboardState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "documentState");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "contextBeforeInput");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(v21, "contextBeforeInput");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "length") != 0;

  }
  else
  {
    v24 = 0;
  }

  objc_msgSend(v21, "contextAfterInput");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    objc_msgSend(v21, "contextAfterInput");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "length") != 0;

  }
  else
  {
    v27 = 0;
  }

  objc_msgSend(v21, "selectedText");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = v21;
  if (v28)
  {
    objc_msgSend(v21, "selectedText");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "length");

    if (v30)
      v27 = 1;
  }

  v31 = v27 | v24;
  v32 = (int)objc_msgSend(v8, "totalInputActions") > 0;
  v33 = (int)objc_msgSend(v7, "charactersOutput") > 0;
  self->_hasCursorMovement = (int)objc_msgSend(v8, "cursorMovements") > 0;
  v34 = objc_msgSend(v8, "emojiSelections");
  v35 = objc_msgSend(v8, "emojiCandidateSelections") + v34;
  v36 = objc_msgSend(v8, "emojiSearchCandidateSelections");
  if ((v35 + v36 < 0) ^ __OFADD__(v35, v36) | (v35 + v36 == 0))
    v37 = 0;
  else
    v37 = 1;
  self->_hasEmojiInput = v37;
  +[TIStandardTypingSessionConfidenceEvaluator calculateAlignedTypingSessionConfidence:](TIStandardTypingSessionConfidenceEvaluator, "calculateAlignedTypingSessionConfidence:", self->_alignedSession);
  v39 = v38;
  v145[0] = CFSTR("totalInputActions");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "totalInputActions"));
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v146[0] = v142;
  v145[1] = CFSTR("characterKeyTaps");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "characterKeyTaps"));
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v146[1] = v141;
  v145[2] = CFSTR("backspaceKeyTaps");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "backspaceKeyTaps"));
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v146[2] = v140;
  v145[3] = CFSTR("spaceKeyTaps");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "spaceKeyTaps"));
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v146[3] = v139;
  v145[4] = CFSTR("returnKeyTaps");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "returnKeyTaps"));
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v146[4] = v138;
  v145[5] = CFSTR("shiftKeyTaps");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "shiftKeyTaps"));
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v146[5] = v137;
  v145[6] = CFSTR("moreKeyTaps");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "moreKeyTaps"));
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v146[6] = v136;
  v145[7] = CFSTR("emojiKeyTaps");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "emojiKeyTaps"));
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v146[7] = v135;
  v145[8] = CFSTR("unknownKeyTaps");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "unknownKeyTaps"));
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v146[8] = v134;
  v145[9] = CFSTR("paths");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "paths"));
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v146[9] = v133;
  v145[10] = CFSTR("pathsWithWeight1");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "pathsWithWeight1"));
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v146[10] = v132;
  v145[11] = CFSTR("pathsWithWeight2");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "pathsWithWeight2"));
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v146[11] = v131;
  v145[12] = CFSTR("pathsWithWeight3");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "pathsWithWeight3"));
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v146[12] = v130;
  v145[13] = CFSTR("pathsWithWeight4");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "pathsWithWeight4"));
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v146[13] = v129;
  v145[14] = CFSTR("pathsWithWeight5");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "pathsWithWeight5"));
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v146[14] = v128;
  v145[15] = CFSTR("pathsWithWeight6");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "pathsWithWeight6"));
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v146[15] = v127;
  v145[16] = CFSTR("pathsWithWeight7");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "pathsWithWeight7"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v146[16] = v126;
  v145[17] = CFSTR("pathsWithWeight8");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "pathsWithWeight8"));
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v146[17] = v125;
  v145[18] = CFSTR("pathsWithWeight9");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "pathsWithWeight9"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v146[18] = v124;
  v145[19] = CFSTR("pathsWithWeight10");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "pathsWithWeight10"));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v146[19] = v123;
  v145[20] = CFSTR("flicks");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "flicks"));
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v146[20] = v122;
  v145[21] = CFSTR("gestures");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "gestures"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v146[21] = v121;
  v145[22] = CFSTR("popupVariants");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "popupVariants"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v146[22] = v120;
  v145[23] = CFSTR("cursorMovements");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "cursorMovements"));
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v146[23] = v119;
  v145[24] = CFSTR("candidateSelections");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "candidateSelections"));
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v146[24] = v118;
  v145[25] = CFSTR("cuts");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "cuts"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v146[25] = v117;
  v145[26] = CFSTR("pastes");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "pastes"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v146[26] = v116;
  v145[27] = CFSTR("emojiSelections");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "emojiSelections"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v146[27] = v115;
  v145[28] = CFSTR("emojiCandidateSelections");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "emojiCandidateSelections"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v146[28] = v114;
  v145[29] = CFSTR("emojiSearchCharacterKeyTaps");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "emojiSearchCharacterKeyTaps"));
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v146[29] = v113;
  v145[30] = CFSTR("emojiSearchBackspaceKeyTaps");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "emojiSearchBackspaceKeyTaps"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v146[30] = v112;
  v145[31] = CFSTR("emojiSearchSpaceKeyTaps");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "emojiSearchSpaceKeyTaps"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v146[31] = v111;
  v145[32] = CFSTR("emojiSearchShiftKeyTaps");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "emojiSearchShiftKeyTaps"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v146[32] = v110;
  v145[33] = CFSTR("emojiSearchMoreKeyTaps");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "emojiSearchMoreKeyTaps"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v146[33] = v109;
  v145[34] = CFSTR("emojiSearchEmojiKeyTaps");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "emojiSearchEmojiKeyTaps"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v146[34] = v108;
  v145[35] = CFSTR("emojiSearchUnknownKeyTaps");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "emojiSearchUnknownKeyTaps"));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v146[35] = v107;
  v145[36] = CFSTR("emojiSearchPaths");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "emojiSearchPaths"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v146[36] = v106;
  v145[37] = CFSTR("emojiSearchPathsWithWeight1");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "emojiSearchPathsWithWeight1"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v146[37] = v105;
  v145[38] = CFSTR("emojiSearchPathsWithWeight2");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "emojiSearchPathsWithWeight2"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v146[38] = v104;
  v145[39] = CFSTR("emojiSearchPathsWithWeight3");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "emojiSearchPathsWithWeight3"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v146[39] = v103;
  v145[40] = CFSTR("emojiSearchPathsWithWeight4");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "emojiSearchPathsWithWeight4"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v146[40] = v102;
  v145[41] = CFSTR("emojiSearchPathsWithWeight5");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "emojiSearchPathsWithWeight5"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v146[41] = v101;
  v145[42] = CFSTR("emojiSearchPathsWithWeight6");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "emojiSearchPathsWithWeight6"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v146[42] = v100;
  v145[43] = CFSTR("emojiSearchPathsWithWeight7");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "emojiSearchPathsWithWeight7"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v146[43] = v99;
  v145[44] = CFSTR("emojiSearchPathsWithWeight8");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "emojiSearchPathsWithWeight8"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v146[44] = v98;
  v145[45] = CFSTR("emojiSearchPathsWithWeight9");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "emojiSearchPathsWithWeight9"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v146[45] = v97;
  v145[46] = CFSTR("emojiSearchPathsWithWeight10");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "emojiSearchPathsWithWeight10"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v146[46] = v96;
  v145[47] = CFSTR("emojiSearchFlicks");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "emojiSearchFlicks"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v146[47] = v95;
  v145[48] = CFSTR("emojiSearchGestures");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "emojiSearchGestures"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v146[48] = v94;
  v145[49] = CFSTR("emojiSearchPopupVariants");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "emojiSearchPopupVariants"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v146[49] = v93;
  v145[50] = CFSTR("emojiSearchCursorMovements");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "emojiSearchCursorMovements"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v146[50] = v92;
  v145[51] = CFSTR("emojiSearchCandidateSelections");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "emojiSearchCandidateSelections"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v146[51] = v91;
  v145[52] = CFSTR("emojiSearchCuts");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "emojiSearchCuts"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v146[52] = v90;
  v145[53] = CFSTR("emojiSearchPastes");
  v40 = (void *)MEMORY[0x1E0CB37E8];
  v41 = objc_msgSend(v8, "emojiSearchPastes");

  objc_msgSend(v40, "numberWithInt:", v41);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v146[53] = v89;
  v145[54] = CFSTR("emojisOutput");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "emojisOutput"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v146[54] = v88;
  v145[55] = CFSTR("wordsOutput");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "wordsOutput"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v146[55] = v87;
  v145[56] = CFSTR("charactersOutput");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "charactersOutput"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v146[56] = v86;
  v145[57] = CFSTR("char1WordsOutput");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "char1WordsOutput"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v146[57] = v85;
  v145[58] = CFSTR("char2WordsOutput");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "char2WordsOutput"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v146[58] = v84;
  v145[59] = CFSTR("char3WordsOutput");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "char3WordsOutput"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v146[59] = v83;
  v145[60] = CFSTR("char4WordsOutput");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "char4WordsOutput"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v146[60] = v82;
  v145[61] = CFSTR("char5WordsOutput");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "char5WordsOutput"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v146[61] = v81;
  v145[62] = CFSTR("char6WordsOutput");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "char6WordsOutput"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v146[62] = v80;
  v145[63] = CFSTR("char7WordsOutput");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "char7WordsOutput"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v146[63] = v79;
  v145[64] = CFSTR("char8WordsOutput");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "char8WordsOutput"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v146[64] = v78;
  v145[65] = CFSTR("char9PlusWordsOutput");
  v42 = (void *)MEMORY[0x1E0CB37E8];
  v43 = objc_msgSend(v7, "char9PlusWordsOutput");

  objc_msgSend(v42, "numberWithInt:", v43);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v146[65] = v77;
  v145[66] = CFSTR("hasExistingText");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v31);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v146[66] = v75;
  v145[67] = CFSTR("hasInput");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v32);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v146[67] = v74;
  v145[68] = CFSTR("hasOutput");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v33);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v146[68] = v73;
  v145[69] = CFSTR("hasCursorMovement");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasCursorMovement);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v146[69] = v72;
  v145[70] = CFSTR("hasEmojiInput");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasEmojiInput);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v146[70] = v71;
  v145[71] = kFeatureKeyboardUsage;
  -[TITypingSession featureUsageMetricsCache](self->_session, "featureUsageMetricsCache");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "featureUsageMetricFromName:forContext:", kFeatureKeyboardUsage, v17);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v146[71] = v69;
  v145[72] = kFeatureContinuousPathUsage;
  -[TITypingSession featureUsageMetricsCache](self->_session, "featureUsageMetricsCache");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "featureUsageMetricFromName:forContext:", kFeatureContinuousPathUsage, v17);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v146[72] = v67;
  v145[73] = kFeatureAutocorrectionUsage;
  -[TITypingSession featureUsageMetricsCache](self->_session, "featureUsageMetricsCache");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "featureUsageMetricFromName:forContext:", kFeatureAutocorrectionUsage, v17);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v146[73] = v65;
  v145[74] = kFeatureCandidateBarUsage;
  -[TITypingSession featureUsageMetricsCache](self->_session, "featureUsageMetricsCache");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "featureUsageMetricFromName:forContext:", kFeatureCandidateBarUsage, v17);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v146[74] = v63;
  v145[75] = kFeatureMultilingualUsage;
  -[TITypingSession featureUsageMetricsCache](self->_session, "featureUsageMetricsCache");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "featureUsageMetricFromName:forContext:", kFeatureMultilingualUsage, v17);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v146[75] = v61;
  v145[76] = kFeatureStringTypingSpeed;
  -[TITypingSession featureUsageMetricsCache](self->_session, "featureUsageMetricsCache");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "featureUsageMetricFromName:forContext:", kFeatureStringTypingSpeed, v17);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v146[76] = v59;
  v145[77] = kFeatureStringAssetAvailabilityStatus;
  -[TITypingSession sessionParams](self->_session, "sessionParams");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v58, "assetAvailabilityStatus");
  v45 = CFSTR("Installed");
  if (!v44)
    v45 = CFSTR("Unavailable");
  v46 = v45;
  v146[77] = v46;
  v145[78] = kFeatureStringSessionAlignmentConfidence;
  objc_msgSend(MEMORY[0x1E0DBDB38], "bucketRatioWithValue:bucketCount:", 10, v39);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v146[78] = v47;
  v145[79] = kFeatureStringKeyboardLanguage;
  -[TIAnalyticsMetricsContext inputLanguage](v17, "inputLanguage");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v146[79] = v48;
  v145[80] = kFeatureStringKeyboardRegion;
  -[TIAnalyticsMetricsContext inputRegion](v17, "inputRegion");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v146[80] = v49;
  v145[81] = kFeatureStringKeyboardVariant;
  -[TIKBAnalyticsMetricsContext inputVariant](v17, "inputVariant");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v146[81] = v50;
  v145[82] = kFeatureStringKeyboardSecondaryLanguage;
  -[TIKBAnalyticsMetricsContext secondaryLanguage](v17, "secondaryLanguage");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v146[82] = v51;
  v145[83] = kFeatureStringKeyboardSecondaryRegion;
  -[TIKBAnalyticsMetricsContext secondaryRegion](v17, "secondaryRegion");
  v52 = v17;
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v146[83] = v53;
  v145[84] = kFeatureStringKeyboardLayout;
  -[TIKBAnalyticsMetricsContext layoutName](v52, "layoutName");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v146[84] = v54;
  v145[85] = kFeatureStringKeyboardType;
  +[TIKBAnalyticsMetricsContext keyboardTypeEnumToString:](TIKBAnalyticsMetricsContext, "keyboardTypeEnumToString:", -[TIKBAnalyticsMetricsContext keyboardType](v52, "keyboardType"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v146[85] = v55;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v146, v145, 86);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKBAnalyticsMetricsContext testingParameters](v52, "testingParameters");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "dispatchEventWithName:payload:testingParameters:allowSparsePayload:", CFSTR("typingEffort"), v76, v57, 0);

}

- (id)countActions
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v3 = (void *)objc_opt_new();
  -[TITypingSession userActionHistory](self->_session, "userActionHistory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 >= 1)
  {
    v6 = 0;
    v7 = 0;
    v8 = v5 - 1;
    v9 = v5;
    do
    {
      v10 = v7;
      -[TITypingSession userActionHistory](self->_session, "userActionHistory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "keyboardState");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "emojiSearchMode");

      switch(objc_msgSend(v7, "actionType"))
      {
        case 0u:
          -[TITypingEffortAnalyzer addActionsForWordEntry:toActionSummary:emojiSearchMode:](self, "addActionsForWordEntry:toActionSummary:emojiSearchMode:", v7, v3, v13);
          break;
        case 1u:
          -[TITypingEffortAnalyzer addActionsForDeleteWord:toActionSummary:emojiSearchMode:](self, "addActionsForDeleteWord:toActionSummary:emojiSearchMode:", v7, v3, v13);
          break;
        case 2u:
          if (v6 >= v8)
          {
            v16 = 0;
          }
          else
          {
            -[TITypingSession userActionHistory](self->_session, "userActionHistory");
            v14 = v8;
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectAtIndex:", v6 + 1);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            v8 = v14;
          }
          -[TITypingEffortAnalyzer addActionsForCursorEvent:lastAction:nextAction:toActionSummary:emojiSearchMode:](self, "addActionsForCursorEvent:lastAction:nextAction:toActionSummary:emojiSearchMode:", v7, v10, v16, v3, v13);

          break;
        case 3u:
          -[TITypingEffortAnalyzer addActionsForDocumentStateChange:toActionSummary:emojiSearchMode:](self, "addActionsForDocumentStateChange:toActionSummary:emojiSearchMode:", v7, v3, v13);
          break;
        case 6u:
          -[TITypingEffortAnalyzer addActionsForArrowKey:toActionSummary:emojiSearchMode:](self, "addActionsForArrowKey:toActionSummary:emojiSearchMode:", v7, v3, v13);
          break;
        case 8u:
          -[TITypingEffortAnalyzer addActionsForCut:toActionSummary:emojiSearchMode:](self, "addActionsForCut:toActionSummary:emojiSearchMode:", v7, v3, v13);
          break;
        case 9u:
          -[TITypingEffortAnalyzer addActionsForPaste:toActionSummary:emojiSearchMode:](self, "addActionsForPaste:toActionSummary:emojiSearchMode:", v7, v3, v13);
          break;
        default:
          break;
      }

      ++v6;
    }
    while (v9 != v6);

  }
  return v3;
}

- (void)registerEventSpec
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  _QWORD v113[88];

  v113[86] = *MEMORY[0x1E0C80C00];
  v88 = (void *)MEMORY[0x1E0DBDB18];
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("totalInputActions"), &unk_1EA1404C8, 0, 0);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v113[0] = v112;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("characterKeyTaps"), &unk_1EA1404C8, 0, 0);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v113[1] = v111;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("backspaceKeyTaps"), &unk_1EA1404C8, 0, 0);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v113[2] = v110;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("spaceKeyTaps"), &unk_1EA1404C8, 0, 0);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v113[3] = v109;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("returnKeyTaps"), &unk_1EA1404C8, 0, 0);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v113[4] = v108;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("shiftKeyTaps"), &unk_1EA1404C8, 0, 0);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v113[5] = v107;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("moreKeyTaps"), &unk_1EA1404C8, 0, 0);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v113[6] = v106;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("emojiKeyTaps"), &unk_1EA1404C8, 0, 0);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v113[7] = v105;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("unknownKeyTaps"), &unk_1EA1404C8, 0, 0);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v113[8] = v104;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("paths"), &unk_1EA1404C8, 0, 0);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v113[9] = v103;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("pathsWithWeight1"), &unk_1EA1404C8, 0, 0);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v113[10] = v102;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("pathsWithWeight2"), &unk_1EA1404C8, 0, 0);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v113[11] = v101;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("pathsWithWeight3"), &unk_1EA1404C8, 0, 0);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v113[12] = v100;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("pathsWithWeight4"), &unk_1EA1404C8, 0, 0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v113[13] = v99;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("pathsWithWeight5"), &unk_1EA1404C8, 0, 0);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v113[14] = v98;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("pathsWithWeight6"), &unk_1EA1404C8, 0, 0);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v113[15] = v97;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("pathsWithWeight7"), &unk_1EA1404C8, 0, 0);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v113[16] = v96;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("pathsWithWeight8"), &unk_1EA1404C8, 0, 0);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v113[17] = v95;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("pathsWithWeight9"), &unk_1EA1404C8, 0, 0);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v113[18] = v94;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("pathsWithWeight10"), &unk_1EA1404C8, 0, 0);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v113[19] = v93;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("flicks"), &unk_1EA1404C8, 0, 0);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v113[20] = v92;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("gestures"), &unk_1EA1404C8, 0, 0);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v113[21] = v91;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("popupVariants"), &unk_1EA1404C8, 0, 0);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v113[22] = v90;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("cursorMovements"), &unk_1EA1404C8, 0, 0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v113[23] = v87;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("candidateSelections"), &unk_1EA1404C8, 0, 0);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v113[24] = v86;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("cuts"), &unk_1EA1404C8, 0, 0);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v113[25] = v85;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("pastes"), &unk_1EA1404C8, 0, 0);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v113[26] = v84;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("emojiSelections"), &unk_1EA1404C8, 0, 0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v113[27] = v83;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("emojiCandidateSelections"), &unk_1EA1404C8, 0, 0);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v113[28] = v82;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("emojiSearchCharacterKeyTaps"), &unk_1EA1404C8, 0, 0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v113[29] = v81;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("emojiSearchBackspaceKeyTaps"), &unk_1EA1404C8, 0, 0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v113[30] = v80;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("emojiSearchSpaceKeyTaps"), &unk_1EA1404C8, 0, 0);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v113[31] = v79;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("emojiSearchShiftKeyTaps"), &unk_1EA1404C8, 0, 0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v113[32] = v78;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("emojiSearchMoreKeyTaps"), &unk_1EA1404C8, 0, 0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v113[33] = v77;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("emojiSearchEmojiKeyTaps"), &unk_1EA1404C8, 0, 0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v113[34] = v76;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("emojiSearchUnknownKeyTaps"), &unk_1EA1404C8, 0, 0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v113[35] = v75;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("emojiSearchPaths"), &unk_1EA1404C8, 0, 0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v113[36] = v74;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("emojiSearchPathsWithWeight1"), &unk_1EA1404C8, 0, 0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v113[37] = v73;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("emojiSearchPathsWithWeight2"), &unk_1EA1404C8, 0, 0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v113[38] = v72;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("emojiSearchPathsWithWeight3"), &unk_1EA1404C8, 0, 0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v113[39] = v71;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("emojiSearchPathsWithWeight4"), &unk_1EA1404C8, 0, 0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v113[40] = v70;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("emojiSearchPathsWithWeight5"), &unk_1EA1404C8, 0, 0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v113[41] = v69;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("emojiSearchPathsWithWeight6"), &unk_1EA1404C8, 0, 0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v113[42] = v68;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("emojiSearchPathsWithWeight7"), &unk_1EA1404C8, 0, 0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v113[43] = v67;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("emojiSearchPathsWithWeight8"), &unk_1EA1404C8, 0, 0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v113[44] = v66;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("emojiSearchPathsWithWeight9"), &unk_1EA1404C8, 0, 0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v113[45] = v65;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("emojiSearchPathsWithWeight10"), &unk_1EA1404C8, 0, 0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v113[46] = v64;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("emojiSearchFlicks"), &unk_1EA1404C8, 0, 0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v113[47] = v63;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("emojiSearchGestures"), &unk_1EA1404C8, 0, 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v113[48] = v62;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("emojiSearchPopupVariants"), &unk_1EA1404C8, 0, 0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v113[49] = v61;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("emojiSearchCursorMovements"), &unk_1EA1404C8, 0, 0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v113[50] = v60;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("emojiSearchCandidateSelections"), &unk_1EA1404C8, 0, 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v113[51] = v59;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("emojiSearchCuts"), &unk_1EA1404C8, 0, 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v113[52] = v58;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("emojiSearchPastes"), &unk_1EA1404C8, 0, 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v113[53] = v57;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("emojisOutput"), &unk_1EA1404C8, 0, 0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v113[54] = v56;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("wordsOutput"), &unk_1EA1404C8, 0, 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v113[55] = v55;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("charactersOutput"), &unk_1EA1404C8, 0, 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v113[56] = v54;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("char1WordsOutput"), &unk_1EA1404C8, 0, 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v113[57] = v53;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("char2WordsOutput"), &unk_1EA1404C8, 0, 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v113[58] = v52;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("char3WordsOutput"), &unk_1EA1404C8, 0, 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v113[59] = v51;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("char4WordsOutput"), &unk_1EA1404C8, 0, 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v113[60] = v50;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("char5WordsOutput"), &unk_1EA1404C8, 0, 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v113[61] = v49;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("char6WordsOutput"), &unk_1EA1404C8, 0, 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v113[62] = v48;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("char7WordsOutput"), &unk_1EA1404C8, 0, 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v113[63] = v47;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("char8WordsOutput"), &unk_1EA1404C8, 0, 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v113[64] = v46;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("char9PlusWordsOutput"), &unk_1EA1404C8, 0, 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v113[65] = v45;
  objc_msgSend(MEMORY[0x1E0DBDB20], "BOOLeanFieldSpecWithName:", CFSTR("hasExistingText"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v113[66] = v44;
  objc_msgSend(MEMORY[0x1E0DBDB20], "BOOLeanFieldSpecWithName:", CFSTR("hasInput"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v113[67] = v43;
  objc_msgSend(MEMORY[0x1E0DBDB20], "BOOLeanFieldSpecWithName:", CFSTR("hasOutput"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v113[68] = v42;
  objc_msgSend(MEMORY[0x1E0DBDB20], "BOOLeanFieldSpecWithName:", CFSTR("hasCursorMovement"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v113[69] = v41;
  objc_msgSend(MEMORY[0x1E0DBDB20], "BOOLeanFieldSpecWithName:", CFSTR("hasEmojiInput"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v113[70] = v40;
  v2 = (void *)MEMORY[0x1E0DBDB20];
  v3 = kFeatureKeyboardUsage;
  TIFeatureUsageAllowedValues();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFieldSpecWithName:allowedValues:", v3, v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v113[71] = v38;
  v4 = (void *)MEMORY[0x1E0DBDB20];
  v5 = kFeatureContinuousPathUsage;
  TIFeatureUsageAllowedValues();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFieldSpecWithName:allowedValues:", v5, v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v113[72] = v36;
  v6 = (void *)MEMORY[0x1E0DBDB20];
  v7 = kFeatureAutocorrectionUsage;
  TIFeatureUsageAllowedValues();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFieldSpecWithName:allowedValues:", v7, v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v113[73] = v34;
  v8 = (void *)MEMORY[0x1E0DBDB20];
  v9 = kFeatureCandidateBarUsage;
  TIFeatureUsageAllowedValues();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFieldSpecWithName:allowedValues:", v9, v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v113[74] = v32;
  v10 = (void *)MEMORY[0x1E0DBDB20];
  v11 = kFeatureMultilingualUsage;
  TIFeatureUsageAllowedValues();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFieldSpecWithName:allowedValues:", v11, v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v113[75] = v30;
  v12 = (void *)MEMORY[0x1E0DBDB20];
  v13 = kFeatureStringTypingSpeed;
  TITypingSpeedAllowedValues();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringFieldSpecWithName:allowedValues:", v13, v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v113[76] = v28;
  v14 = (void *)MEMORY[0x1E0DBDB20];
  v15 = kFeatureStringAssetAvailabilityStatus;
  TIAssetAvailabilityStatusAllowedValues();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringFieldSpecWithName:allowedValues:", v15, v27);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v113[77] = v16;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", kFeatureStringSessionAlignmentConfidence, &unk_1EA1404C8, &unk_1EA1404E0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v113[78] = v17;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardLanguage);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v113[79] = v18;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardRegion);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v113[80] = v19;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardVariant);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v113[81] = v20;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardSecondaryLanguage);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v113[82] = v21;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardSecondaryRegion);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v113[83] = v22;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardLayout);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v113[84] = v23;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", kFeatureStringKeyboardType);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v113[85] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v113, 86);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "eventSpecWithName:inputModeRequired:fieldSpecs:", CFSTR("typingEffort"), 0, v25);
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "registerEventSpec:", v89);

}

- (TITypingEffortAnalyzer)init
{
  TITypingEffortAnalyzer *v2;
  TITypingEffortAnalyzer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TITypingEffortAnalyzer;
  v2 = -[TITypingEffortAnalyzer init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[TITypingEffortAnalyzer registerEventSpec](v2, "registerEventSpec");
  return v3;
}

- (BOOL)hasEmojiInput
{
  return self->_hasEmojiInput;
}

- (BOOL)hasCursorMovement
{
  return self->_hasCursorMovement;
}

- (unint64_t)evaluateConfidenceInSession:(id)a3 alignedSession:(id)a4
{
  return +[TIStandardTypingSessionConfidenceEvaluator evaluateConfidenceInSession:alignedSession:](TIStandardTypingSessionConfidenceEvaluator, "evaluateConfidenceInSession:alignedSession:", a3, a4);
}

- (id)countOutput
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[TITypingSessionAligned alignedEntries](self->_alignedSession, "alignedEntries", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        -[TITypingEffortAnalyzer addCountsForAlignedEntry:toOutputSummary:](self, "addCountsForAlignedEntry:toOutputSummary:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8++), v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  -[TITypingSessionAligned completeText](self->_alignedSession, "completeText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCharactersOutput:", -[TITypingEffortAnalyzer countComposedCharactersInText:](self, "countComposedCharactersInText:", v9));

  return v3;
}

- (int)countComposedCharactersInText:(id)a3
{
  id v3;
  uint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__TITypingEffortAnalyzer_countComposedCharactersInText___block_invoke;
  v6[3] = &unk_1EA1045F8;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateSubstringsInRange:options:usingBlock:", 0, v4, 2, v6);

  LODWORD(v3) = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return (int)v3;
}

- (BOOL)analyzeSession:(id)a3 alignedSession:(id)a4 withConfidence:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;

  v9 = a3;
  v10 = a4;
  if (a5)
  {
    objc_storeStrong((id *)&self->_session, a3);
    objc_storeStrong((id *)&self->_alignedSession, a4);
    *(_DWORD *)&self->_emojiPlaneActive = 0;
    -[TITypingEffortAnalyzer countActions](self, "countActions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITypingEffortAnalyzer countOutput](self, "countOutput");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITypingEffortAnalyzer dispatchEventWithActionSummary:outputSummary:](self, "dispatchEventWithActionSummary:outputSummary:", v11, v12);

  }
  return a5 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alignedSession, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)addActionsForWordEntry:(id)a3 toActionSummary:(id)a4 emojiSearchMode:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v18 = (id)objc_opt_new();
  v10 = (void *)objc_opt_new();
  objc_msgSend(v9, "keyboardState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "inputMode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "allKeyboardInputs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITypingEffortAnalyzer addKeyboardInputActionsForKeyboardInputs:inputMode:toActionSummary:andKeyboardInputTouches:emojiSearchMode:](self, "addKeyboardInputActionsForKeyboardInputs:inputMode:toActionSummary:andKeyboardInputTouches:emojiSearchMode:", v13, v12, v8, v18, v5);

  -[TITypingEffortAnalyzer addPathAndCandidateBarActionsForWordEntry:toActionSummary:andPathTouches:emojiSearchMode:](self, "addPathAndCandidateBarActionsForWordEntry:toActionSummary:andPathTouches:emojiSearchMode:", v9, v8, v10, v5);
  objc_msgSend(v9, "allTouches");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "touchLayouts");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "acceptedCandidate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v17) = v5;
  -[TITypingEffortAnalyzer addTouchRelatedActionsForTouches:layouts:acceptedCandidate:toActionSummary:keyboardInputTouches:pathTouches:emojiSearchMode:](self, "addTouchRelatedActionsForTouches:layouts:acceptedCandidate:toActionSummary:keyboardInputTouches:pathTouches:emojiSearchMode:", v14, v15, v16, v8, v18, v10, v17);

}

- (void)addActionsForDeleteWord:(id)a3 toActionSummary:(id)a4 emojiSearchMode:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v16 = (id)objc_opt_new();
  objc_msgSend(v9, "keyboardState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inputMode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "allKeyboardInputs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITypingEffortAnalyzer addKeyboardInputActionsForKeyboardInputs:inputMode:toActionSummary:andKeyboardInputTouches:emojiSearchMode:](self, "addKeyboardInputActionsForKeyboardInputs:inputMode:toActionSummary:andKeyboardInputTouches:emojiSearchMode:", v12, v11, v8, v16, v5);

  objc_msgSend(v9, "allTouches");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "touchLayouts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v15) = v5;
  -[TITypingEffortAnalyzer addTouchRelatedActionsForTouches:layouts:acceptedCandidate:toActionSummary:keyboardInputTouches:pathTouches:emojiSearchMode:](self, "addTouchRelatedActionsForTouches:layouts:acceptedCandidate:toActionSummary:keyboardInputTouches:pathTouches:emojiSearchMode:", v13, v14, 0, v8, v16, 0, v15);

}

- (void)addKeyboardInputActionsForKeyboardInputs:(id)a3 inputMode:(id)a4 toActionSummary:(id)a5 andKeyboardInputTouches:(id)a6 emojiSearchMode:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  _BOOL8 v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  TITypingEffortAnalyzer *v25;
  const __CFString *v26;
  const __CFString *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  TITypingEffortAnalyzer *v36;
  const __CFString *v37;
  const __CFString *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  _BOOL4 v42;
  id v43;
  int v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v7 = a7;
  v52 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = v7;
  v46 = v13;
  v15 = a5;
  v16 = a6;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v17 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v48;
    v45 = v15;
    v43 = v12;
    v42 = v7;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v48 != v19)
          objc_enumerationMutation(v12);
        v21 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v20);
        objc_msgSend(v21, "touchEvent");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          objc_msgSend(v21, "touchEvent");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v23);

        }
        if ((objc_msgSend(v21, "isSynthesizedByAcceptingCandidate") & 1) == 0)
        {
          objc_msgSend(v21, "touchEvent");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
            goto LABEL_37;
          objc_msgSend(v21, "string");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "_containsEmoji");

          if (v29)
          {
            v25 = self;
            v26 = CFSTR("emojiSelections");
            v27 = 0;
            v15 = v45;
            goto LABEL_24;
          }
          v15 = v45;
          if (objc_msgSend(v46, "isEqualToString:", CFSTR("ko_KR@sw=Korean10Key;hw=Automatic")))
          {
LABEL_37:
            if (-[TITypingEffortAnalyzer isFlickInput:](self, "isFlickInput:", v21))
            {
              v25 = self;
              v26 = CFSTR("flicks");
              v27 = CFSTR("emojiSearchFlicks");
              goto LABEL_24;
            }
            if (-[TITypingEffortAnalyzer isPopupVariantInput:inputMode:](self, "isPopupVariantInput:inputMode:", v21, v46))
            {
              v25 = self;
              v26 = CFSTR("popupVariants");
              v27 = CFSTR("emojiSearchPopupVariants");
              goto LABEL_24;
            }
            if (objc_msgSend(v21, "isBackspace"))
            {
              v25 = self;
              v26 = CFSTR("backspaceKeyTaps");
              v27 = CFSTR("emojiSearchBackspaceKeyTaps");
              goto LABEL_24;
            }
            objc_msgSend(v21, "string");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v30, "isEqualToString:", CFSTR(" ")))
            {

LABEL_23:
              v25 = self;
              v26 = CFSTR("spaceKeyTaps");
              v27 = CFSTR("emojiSearchSpaceKeyTaps");
LABEL_24:
              -[TITypingEffortAnalyzer addCountsForPropertyWithName:andEmojiSearchPropertyName:contributesToTotal:toActionSummary:emojiSearchMode:](v25, "addCountsForPropertyWithName:andEmojiSearchPropertyName:contributesToTotal:toActionSummary:emojiSearchMode:", v26, v27, 1, v15, v14);
              goto LABEL_25;
            }
            objc_msgSend(v21, "string");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[TITypingSession sessionParams](self->_session, "sessionParams");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "wordSeparator");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v31, "isEqualToString:", v33);

            v12 = v43;
            v14 = v42;

            v15 = v45;
            if (v44)
              goto LABEL_23;
            objc_msgSend(v21, "string");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("\n"));

            if (v35)
            {
              v36 = self;
              v37 = CFSTR("returnKeyTaps");
              v38 = 0;
            }
            else
            {
              objc_msgSend(v21, "string");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = objc_msgSend(v39, "length");

              v36 = self;
              if (v40 == 1)
              {
                v37 = CFSTR("characterKeyTaps");
                v38 = CFSTR("emojiSearchCharacterKeyTaps");
              }
              else
              {
                v37 = CFSTR("unknownKeyTaps");
                v38 = CFSTR("unknownKeyTaps");
              }
            }
            v14 = v42;
            -[TITypingEffortAnalyzer addCountsForPropertyWithName:andEmojiSearchPropertyName:contributesToTotal:toActionSummary:emojiSearchMode:](v36, "addCountsForPropertyWithName:andEmojiSearchPropertyName:contributesToTotal:toActionSummary:emojiSearchMode:", v37, v38, 1, v45, v42);
            v12 = v43;
          }
        }
LABEL_25:
        ++v20;
      }
      while (v18 != v20);
      v41 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      v18 = v41;
    }
    while (v41);
  }

}

- (BOOL)isFlickInput:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isFlick") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isGesture");

  return v4;
}

- (BOOL)isPopupVariantInput:(id)a3 inputMode:(id)a4
{
  id v6;
  _BOOL4 v7;

  v6 = a4;
  if (objc_msgSend(a3, "isPopupVariant"))
    v7 = !-[TITypingEffortAnalyzer isTenKeyInputMode:](self, "isTenKeyInputMode:", v6);
  else
    LOBYTE(v7) = 0;

  return v7;
}

- (BOOL)isTenKeyInputMode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = a3;
  TIInputModeGetNormalizedIdentifier();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetSWLayout();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@@sw=%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(&unk_1EA140138, "containsObject:", v6);

  return v7;
}

- (void)addPathAndCandidateBarActionsForWordEntry:(id)a3 toActionSummary:(id)a4 andPathTouches:(id)a5 emojiSearchMode:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  int v29;
  TITypingEffortAnalyzer *v30;
  NSObject *v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v6 = a6;
  v35 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "acceptedCandidate");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(v10, "acceptedString");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      objc_msgSend(v10, "acceptedString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "length");

      if (v18)
      {
        objc_msgSend(v10, "acceptedCandidate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isContinuousPathConversion");

        if (v20)
        {
          objc_msgSend(v10, "allTouches");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "count");

          if (v22)
          {
            objc_msgSend(v10, "allTouches");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "lastObject");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v24);

            v25 = CFSTR("paths");
            v26 = CFSTR("emojiSearchPaths");
            goto LABEL_11;
          }
          IXADefaultLogFacility();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s A continuous path conversion with no touch data was found."), "-[TITypingEffortAnalyzer addPathAndCandidateBarActionsForWordEntry:toActionSummary:andPathTouches:emojiSearchMode:]");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v34 = v32;
            _os_log_error_impl(&dword_1DA6F2000, v31, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

          }
        }
        else if ((objc_msgSend(v10, "wordEntryType") & 4) != 0)
        {
          objc_msgSend(v10, "acceptedCandidate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "candidate");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "_containsEmoji");

          if (!v29)
          {
            v25 = CFSTR("candidateSelections");
            v30 = self;
            v26 = 0;
            goto LABEL_16;
          }
          v25 = CFSTR("emojiCandidateSelections");
          v26 = CFSTR("emojiSearchCandidateSelections");
LABEL_11:
          v30 = self;
LABEL_16:
          -[TITypingEffortAnalyzer addCountsForPropertyWithName:andEmojiSearchPropertyName:contributesToTotal:toActionSummary:emojiSearchMode:](v30, "addCountsForPropertyWithName:andEmojiSearchPropertyName:contributesToTotal:toActionSummary:emojiSearchMode:", v25, v26, 1, v11, v6);
        }
      }
    }
    else
    {

    }
  }

}

- (void)addTouchRelatedActionsForTouches:(id)a3 layouts:(id)a4 acceptedCandidate:(id)a5 toActionSummary:(id)a6 keyboardInputTouches:(id)a7 pathTouches:(id)a8 emojiSearchMode:(BOOL)a9
{
  id v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v38 = a5;
  v39 = a6;
  v40 = a7;
  v41 = a8;
  v15 = (void *)objc_msgSend(a3, "mutableCopy");
  v37 = v14;
  v16 = (void *)objc_msgSend(v14, "mutableCopy");
  if (!objc_msgSend(v15, "count"))
    goto LABEL_33;
  v17 = 0x1E0CB3000uLL;
  do
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v15, "count"));
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v15, "count"));
    objc_msgSend(v16, "objectAtIndex:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "integerValue");

    -[TITypingSession layouts](self->_session, "layouts");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndexedSubscript:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "objectAtIndex:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v17 + 2024), "numberWithInteger:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v25);

    objc_msgSend(v18, "addObject:", v24);
    v26 = 0;
    if ((unint64_t)objc_msgSend(v15, "count") < 2)
      goto LABEL_16;
    v27 = 1;
    while (1)
    {
      objc_msgSend(v15, "objectAtIndex:", v27);
      v28 = (id)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "pathIndex");
      if (v29 != objc_msgSend(v24, "pathIndex"))
        goto LABEL_11;
      if (!objc_msgSend(v28, "stage"))
        break;
      if (objc_msgSend(v28, "stage") == 2
        || objc_msgSend(v28, "stage") == 3
        || objc_msgSend(v28, "stage") == 5)
      {
        v28 = v28;
        objc_msgSend(*(id *)(v17 + 2024), "numberWithInt:", v27);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v31);

        objc_msgSend(v18, "addObject:", v28);
        v26 = v28;
        goto LABEL_15;
      }
      objc_msgSend(*(id *)(v17 + 2024), "numberWithInt:", v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v30);

      objc_msgSend(v18, "addObject:", v28);
LABEL_11:

      if (objc_msgSend(v15, "count") <= (unint64_t)++v27)
      {
        v26 = 0;
        goto LABEL_16;
      }
    }
    v26 = 0;
LABEL_15:

LABEL_16:
    if (objc_msgSend(v24, "stage"))
    {

      v24 = 0;
      goto LABEL_18;
    }
    if (v24 && v26)
    {
      if (v41 && objc_msgSend(v41, "containsObject:", v26))
      {
        objc_msgSend(v38, "candidate");
        v32 = objc_claimAutoreleasedReturnValue();
        -[TITypingEffortAnalyzer addPathWeightActionsForTouches:withLayout:forWord:toActionSummary:emojiSearchMode:](self, "addPathWeightActionsForTouches:withLayout:forWord:toActionSummary:emojiSearchMode:", v18, v23, v32, v39, a9);
        goto LABEL_21;
      }
      if ((objc_msgSend(v40, "containsObject:", v26) & 1) == 0)
        -[TITypingEffortAnalyzer addSpecialKeyActionsForFirstTouch:andLastTouch:fromLayout:toActionSummary:emojiSearchMode:](self, "addSpecialKeyActionsForFirstTouch:andLastTouch:fromLayout:toActionSummary:emojiSearchMode:", v24, v26, v23, v39, a9);
    }
    else
    {
LABEL_18:
      if (IXACanLogMessageAtLevel())
      {
        IXADefaultLogFacility();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s An incomplete touch path was detected"), "-[TITypingEffortAnalyzer addTouchRelatedActionsForTouches:layouts:acceptedCandidate:toActionSummary:keyboardInputTouches:pathTouches:emojiSearchMode:]");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v44 = v36;
          _os_log_debug_impl(&dword_1DA6F2000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

        }
LABEL_21:

      }
    }
    v33 = objc_msgSend(v19, "count") - 1;
    if (v33 >= 0)
    {
      do
      {
        objc_msgSend(v19, "objectAtIndex:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "integerValue");

        objc_msgSend(v15, "removeObjectAtIndex:", v35);
        objc_msgSend(v16, "removeObjectAtIndex:", v35);
        --v33;
      }
      while (v33 != -1);
    }

    v17 = 0x1E0CB3000;
  }
  while (objc_msgSend(v15, "count"));
LABEL_33:

}

- (void)addPathWeightActionsForTouches:(id)a3 withLayout:(id)a4 forWord:(id)a5 toActionSummary:(id)a6 emojiSearchMode:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  unint64_t v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  const __CFString *v39;
  const __CFString *v40;
  NSObject *v41;
  void *v42;
  double v43;
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v7 = a7;
  v46 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v13)
  {
    objc_msgSend(v13, "frame");
    v17 = v16;
    objc_msgSend(v13, "frame");
    v19 = v18;
    objc_msgSend(v13, "frame");
    v21 = v20;
    objc_msgSend(v13, "frame");
    v23 = v22;
    if (v21 <= 0.0 || v22 <= 0.0)
    {
      IXADefaultLogFacility();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Invalid layout dimensions: width: %f height: %f"), "-[TITypingEffortAnalyzer addPathWeightActionsForTouches:withLayout:forWord:toActionSummary:emojiSearchMode:]", *(_QWORD *)&v21, *(_QWORD *)&v23);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v45 = v42;
        _os_log_error_impl(&dword_1DA6F2000, v41, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    else
    {
      if ((unint64_t)objc_msgSend(v12, "count") < 2)
        goto LABEL_8;
      v43 = v17;
      v24 = 0.0;
      v25 = 1;
      do
      {
        objc_msgSend(v12, "objectAtIndex:", v25 - 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "location");
        v27 = v23;
        v28 = v21;
        v30 = v29;
        v32 = v31;

        objc_msgSend(v12, "objectAtIndex:", v25);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "location");
        v35 = v34;
        v37 = v36;

        v38 = v30 - v43;
        v21 = v28;
        v23 = v27;
        v24 = v24
            + sqrt(((v35 - v43) / v21 - v38 / v21) * ((v35 - v43) / v21 - v38 / v21)+ ((v37 - v19) / v27 - (v32 - v19) / v27) * ((v37 - v19) / v27 - (v32 - v19) / v27));
        ++v25;
      }
      while (objc_msgSend(v12, "count") > v25);
      if (v24 >= 0.5)
      {
        if (v24 >= 1.0)
        {
          if (v24 >= 1.5)
          {
            if (v24 >= 2.0)
            {
              if (v24 >= 2.5)
              {
                if (v24 >= 3.0)
                {
                  if (v24 >= 3.5)
                  {
                    if (v24 >= 4.0)
                    {
                      if (v24 >= 4.5)
                        v40 = CFSTR("pathsWithWeight10");
                      else
                        v40 = CFSTR("pathsWithWeight9");
                      if (v24 >= 4.5)
                        v39 = CFSTR("emojiSearchPathsWithWeight10");
                      else
                        v39 = CFSTR("emojiSearchPathsWithWeight9");
                    }
                    else
                    {
                      v39 = CFSTR("emojiSearchPathsWithWeight8");
                      v40 = CFSTR("pathsWithWeight8");
                    }
                  }
                  else
                  {
                    v39 = CFSTR("emojiSearchPathsWithWeight7");
                    v40 = CFSTR("pathsWithWeight7");
                  }
                }
                else
                {
                  v39 = CFSTR("emojiSearchPathsWithWeight6");
                  v40 = CFSTR("pathsWithWeight6");
                }
              }
              else
              {
                v39 = CFSTR("emojiSearchPathsWithWeight5");
                v40 = CFSTR("pathsWithWeight5");
              }
            }
            else
            {
              v39 = CFSTR("emojiSearchPathsWithWeight4");
              v40 = CFSTR("pathsWithWeight4");
            }
          }
          else
          {
            v39 = CFSTR("emojiSearchPathsWithWeight3");
            v40 = CFSTR("pathsWithWeight3");
          }
        }
        else
        {
          v39 = CFSTR("emojiSearchPathsWithWeight2");
          v40 = CFSTR("pathsWithWeight2");
        }
      }
      else
      {
LABEL_8:
        v39 = CFSTR("emojiSearchPathsWithWeight1");
        v40 = CFSTR("pathsWithWeight1");
      }
      -[TITypingEffortAnalyzer addCountsForPropertyWithName:andEmojiSearchPropertyName:contributesToTotal:toActionSummary:emojiSearchMode:](self, "addCountsForPropertyWithName:andEmojiSearchPropertyName:contributesToTotal:toActionSummary:emojiSearchMode:", v40, v39, 0, v15, v7);
    }
  }

}

- (void)addSpecialKeyActionsForFirstTouch:(id)a3 andLastTouch:(id)a4 fromLayout:(id)a5 toActionSummary:(id)a6 emojiSearchMode:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  BOOL v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  id v20;

  v7 = a7;
  v20 = a3;
  v12 = a4;
  v13 = a6;
  if (a5)
  {
    v14 = a5;
    v15 = objc_msgSend(v12, "forcedKeyCode") == -1;
    v16 = v20;
    if (!v15)
      v16 = v12;
    -[TITypingEffortAnalyzer keyStringWithCode:fromLayout:](self, "keyStringWithCode:fromLayout:", objc_msgSend(v16, "forcedKeyCode"), v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "isEqualToString:", CFSTR("shift")))
    {
      v18 = CFSTR("shiftKeyTaps");
      v19 = CFSTR("emojiSearchShiftKeyTaps");
    }
    else if (objc_msgSend(v17, "isEqualToString:", CFSTR("more")))
    {
      v18 = CFSTR("moreKeyTaps");
      v19 = CFSTR("emojiSearchMoreKeyTaps");
    }
    else if (objc_msgSend(v17, "isEqualToString:", CFSTR("\n")))
    {
      v18 = CFSTR("returnKeyTaps");
      v19 = CFSTR("emojiSearchEmojiKeyTaps");
    }
    else
    {
      if (!objc_msgSend(v17, "isEqualToString:", CFSTR(" ")))
      {
LABEL_13:

        goto LABEL_14;
      }
      v18 = CFSTR("spaceKeyTaps");
      v19 = CFSTR("emojiSearchSpaceKeyTaps");
    }
    -[TITypingEffortAnalyzer addCountsForPropertyWithName:andEmojiSearchPropertyName:contributesToTotal:toActionSummary:emojiSearchMode:](self, "addCountsForPropertyWithName:andEmojiSearchPropertyName:contributesToTotal:toActionSummary:emojiSearchMode:", v18, v19, 1, v13, v7);
    goto LABEL_13;
  }
LABEL_14:

}

- (id)keyStringWithCode:(int64_t)a3 fromLayout:(id)a4
{
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__TITypingEffortAnalyzer_keyStringWithCode_fromLayout___block_invoke;
  v6[3] = &unk_1EA106ED0;
  v6[4] = &v7;
  v6[5] = a3;
  objc_msgSend(a4, "enumerateKeysUsingBlock:", v6);
  if (v8[3])
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)addActionsForCursorEvent:(id)a3 lastAction:(id)a4 nextAction:(id)a5 toActionSummary:(id)a6 emojiSearchMode:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  BOOL v25;
  id v26;

  v7 = a7;
  v26 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  -[TITypingSession userActionHistory](self->_session, "userActionHistory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16 == v26)
  {

  }
  else
  {
    -[TITypingSession userActionHistory](self->_session, "userActionHistory");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lastObject");
    v18 = (id)objc_claimAutoreleasedReturnValue();

    if (v18 != v26)
    {
      objc_msgSend(v12, "keyboardState");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "emojiSearchMode");
      v21 = v20;
      if (!v7)
      {
        if (v20)
        {
          v23 = v12;
LABEL_13:
          v24 = objc_msgSend(v23, "actionType");

          if (v24 == 2)
            goto LABEL_17;
          goto LABEL_16;
        }
LABEL_15:

LABEL_16:
        -[TITypingEffortAnalyzer addCountsForPropertyWithName:andEmojiSearchPropertyName:contributesToTotal:toActionSummary:emojiSearchMode:](self, "addCountsForPropertyWithName:andEmojiSearchPropertyName:contributesToTotal:toActionSummary:emojiSearchMode:", CFSTR("cursorMovements"), CFSTR("emojiSearchCursorMovements"), 1, v14, v7);
        goto LABEL_17;
      }

      if (v21)
      {
        objc_msgSend(v12, "keyboardState");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "emojiSearchMode") && !objc_msgSend(v12, "actionType"))
        {
          v25 = -[TITypingEffortAnalyzer isEmojiSearchCandidateSelection:](self, "isEmojiSearchCandidateSelection:", v12);

          if (v25)
            goto LABEL_17;
        }
        else
        {

        }
        objc_msgSend(v13, "keyboardState");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v19, "emojiSearchMode") & 1) == 0)
        {
          v23 = v13;
          goto LABEL_13;
        }
        goto LABEL_15;
      }
    }
  }
LABEL_17:

}

- (void)addActionsForArrowKey:(id)a3 toActionSummary:(id)a4 emojiSearchMode:(BOOL)a5
{
  -[TITypingEffortAnalyzer addCountsForPropertyWithName:andEmojiSearchPropertyName:contributesToTotal:toActionSummary:emojiSearchMode:](self, "addCountsForPropertyWithName:andEmojiSearchPropertyName:contributesToTotal:toActionSummary:emojiSearchMode:", CFSTR("cursorMovements"), CFSTR("emojiSearchCursorMovements"), 1, a4, a5);
}

- (void)addActionsForCut:(id)a3 toActionSummary:(id)a4 emojiSearchMode:(BOOL)a5
{
  -[TITypingEffortAnalyzer addCountsForPropertyWithName:andEmojiSearchPropertyName:contributesToTotal:toActionSummary:emojiSearchMode:](self, "addCountsForPropertyWithName:andEmojiSearchPropertyName:contributesToTotal:toActionSummary:emojiSearchMode:", CFSTR("cuts"), CFSTR("emojiSearchCuts"), 1, a4, a5);
}

- (void)addActionsForPaste:(id)a3 toActionSummary:(id)a4 emojiSearchMode:(BOOL)a5
{
  -[TITypingEffortAnalyzer addCountsForPropertyWithName:andEmojiSearchPropertyName:contributesToTotal:toActionSummary:emojiSearchMode:](self, "addCountsForPropertyWithName:andEmojiSearchPropertyName:contributesToTotal:toActionSummary:emojiSearchMode:", CFSTR("pastes"), CFSTR("emojiSearchPastes"), 1, a4, a5);
}

- (BOOL)isEmojiSearchCandidateSelection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "acceptedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "acceptedString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6
      && (objc_msgSend(v3, "acceptedCandidate"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "isContinuousPathConversion"),
          v7,
          (v8 & 1) == 0)
      && (objc_msgSend(v3, "wordEntryType") & 4) != 0)
    {
      objc_msgSend(v3, "acceptedCandidate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "candidate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v4) = objc_msgSend(v11, "_containsEmoji");

    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }

  return (char)v4;
}

- (void)addCountsForAlignedEntry:(id)a3 toOutputSummary:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = a4;
  objc_msgSend(v20, "originalWord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "editedEntry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "originalWord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "editedEntry");
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }

  objc_msgSend(v10, "acceptedCandidate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "candidate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v14);
  v15 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v15, "stringByTrimmingCharactersInSet:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "keyboardState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = objc_msgSend(v18, "emojiSearchMode");

  if ((v15 & 1) == 0)
  {
    if (objc_msgSend(v17, "_containsEmoji"))
    {
      objc_msgSend(v6, "setEmojisOutput:", objc_msgSend(v6, "emojisOutput") + 1);
    }
    else
    {
      objc_msgSend(v20, "alignedKeyboardInputs");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[TITypingEffortAnalyzer addCountsForEmojiInputs:toOutputSummary:](self, "addCountsForEmojiInputs:toOutputSummary:", v19, v6);

      -[TITypingEffortAnalyzer addCountsForWord:toOutputSummary:](self, "addCountsForWord:toOutputSummary:", v17, v6);
    }
  }

}

- (void)addCountsForEmojiInputs:(id)a3 toOutputSummary:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "string");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "_containsEmoji");

        if (v12)
          objc_msgSend(v6, "setEmojisOutput:", objc_msgSend(v6, "emojisOutput") + 1);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)addCountsForWord:(id)a3 toOutputSummary:(id)a4
{
  int v6;
  id v7;

  v7 = a4;
  v6 = -[TITypingEffortAnalyzer countComposedCharactersInText:](self, "countComposedCharactersInText:", a3);
  if (v6 >= 1)
  {
    switch(v6)
    {
      case 1:
        objc_msgSend(v7, "setChar1WordsOutput:", objc_msgSend(v7, "char1WordsOutput") + 1);
        break;
      case 2:
        objc_msgSend(v7, "setChar2WordsOutput:", objc_msgSend(v7, "char2WordsOutput") + 1);
        break;
      case 3:
        objc_msgSend(v7, "setChar3WordsOutput:", objc_msgSend(v7, "char3WordsOutput") + 1);
        break;
      case 4:
        objc_msgSend(v7, "setChar4WordsOutput:", objc_msgSend(v7, "char4WordsOutput") + 1);
        break;
      case 5:
        objc_msgSend(v7, "setChar5WordsOutput:", objc_msgSend(v7, "char5WordsOutput") + 1);
        break;
      case 6:
        objc_msgSend(v7, "setChar6WordsOutput:", objc_msgSend(v7, "char6WordsOutput") + 1);
        break;
      case 7:
        objc_msgSend(v7, "setChar7WordsOutput:", objc_msgSend(v7, "char7WordsOutput") + 1);
        break;
      case 8:
        objc_msgSend(v7, "setChar8WordsOutput:", objc_msgSend(v7, "char8WordsOutput") + 1);
        break;
      default:
        objc_msgSend(v7, "setChar9PlusWordsOutput:", objc_msgSend(v7, "char9PlusWordsOutput") + 1);
        break;
    }
    objc_msgSend(v7, "setWordsOutput:", objc_msgSend(v7, "wordsOutput") + 1);
  }

}

- (BOOL)hasEmojiInKeyboardInputs:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  char v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "string", (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "_containsEmoji");

        if ((v8 & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)addCountsForPropertyWithName:(id)a3 andEmojiSearchPropertyName:(id)a4 contributesToTotal:(BOOL)a5 toActionSummary:(id)a6 emojiSearchMode:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v9;
  id v12;
  id v13;
  int v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  id v21;

  v7 = a7;
  v9 = a5;
  v21 = a3;
  v12 = a4;
  v13 = a6;
  v14 = objc_msgSend(v21, "isEqualToString:", CFSTR("emojiSelections")) | v7;
  if (v14 == 1 && !self->_emojiPlaneActive)
  {
    objc_msgSend(v13, "setEmojiKeyTaps:", objc_msgSend(v13, "emojiKeyTaps") + 1);
    objc_msgSend(v13, "setTotalInputActions:", objc_msgSend(v13, "totalInputActions") + 1);
    self->_emojiPlaneActive = 1;
  }
  v15 = v21;
  if (v7)
  {
    if (!self->_emojiSearchActive)
    {
      objc_msgSend(v13, "setEmojiSearchCursorMovements:", objc_msgSend(v13, "emojiSearchCursorMovements") + 1);
      objc_msgSend(v13, "setTotalInputActions:", objc_msgSend(v13, "totalInputActions") + 1);
      v15 = v21;
      self->_emojiSearchActive = 1;
    }
  }
  else
  {
    if (self->_emojiSearchActive)
    {
      objc_msgSend(v13, "setEmojiSearchEmojiKeyTaps:", objc_msgSend(v13, "emojiSearchEmojiKeyTaps") + 1);
      objc_msgSend(v13, "setReturnKeyTaps:", objc_msgSend(v13, "returnKeyTaps") - 1);
      v15 = v21;
      self->_emojiSearchActive = 0;
    }
    if ((v14 & 1) == 0 && self->_emojiPlaneActive)
    {
      objc_msgSend(v13, "setMoreKeyTaps:", objc_msgSend(v13, "moreKeyTaps") + 1);
      objc_msgSend(v13, "setTotalInputActions:", objc_msgSend(v13, "totalInputActions") + 1);
      v15 = v21;
      self->_emojiPlaneActive = 0;
    }
  }
  if (v12 != 0 && v7)
    v16 = v12;
  else
    v16 = v15;
  v17 = v16;
  objc_msgSend(v13, "valueForKey:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "intValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v19 + 1));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValue:forKey:", v20, v17);

  if (v9)
    objc_msgSend(v13, "setTotalInputActions:", objc_msgSend(v13, "totalInputActions") + 1);

}

uint64_t __56__TITypingEffortAnalyzer_countComposedCharactersInText___block_invoke(uint64_t result)
{
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

uint64_t __55__TITypingEffortAnalyzer_keyStringWithCode_fromLayout___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  if (*(_QWORD *)(result + 40) == a3)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
    *a4 = 1;
  }
  return result;
}

@end
