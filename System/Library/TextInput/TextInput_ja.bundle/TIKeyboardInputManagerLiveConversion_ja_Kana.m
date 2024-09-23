@implementation TIKeyboardInputManagerLiveConversion_ja_Kana

+ (Class)wordSearchClass
{
  return (Class)objc_opt_class();
}

- (void)addInput:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  int v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __CFString *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  objc_super v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "length"))
  {
    if (-[TIKeyboardInputManagerLiveConversion_ja shouldCommitHeadSegment](self, "shouldCommitHeadSegment"))
    {
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      -[TIKeyboardInputManagerLiveConversion_ja committedSegments](self, "committedSegments");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v55 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
            objc_msgSend(v15, "surface");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
            {
              objc_msgSend(v7, "output");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "surface");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "insertText:", v18);

            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
        }
        while (v12);
      }

      objc_msgSend(MEMORY[0x24BDBCE30], "array");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerLiveConversion_ja setCommittedSegments:](self, "setCommittedSegments:", v19);

      -[TIKeyboardInputManagerLiveConversion_ja segments](self, "segments");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "surface");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v7, "output");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "insertText:", v22);

      }
      v24 = objc_alloc_init(MEMORY[0x24BDD16A8]);
      -[TIKeyboardInputManagerLiveConversion_ja segments](self, "segments");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "count");

      if (v26 >= 2)
      {
        v27 = 1;
        do
        {
          -[TIKeyboardInputManagerLiveConversion_ja segments](self, "segments");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectAtIndexedSubscript:", v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "reading");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "appendString:", v30);

          ++v27;
          -[TIKeyboardInputManagerLiveConversion_ja segments](self, "segments");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "count");

        }
        while (v27 < v32);
      }
      -[TIKeyboardInputManagerLiveConversion_ja setInput:](self, "setInput:", v24);

    }
    if ((-[TIKeyboardInputManagerLiveConversion_ja_Kana inHardwareKeyboardMode](self, "inHardwareKeyboardMode") & 1) != 0)
      v33 = 0;
    else
      v33 = objc_msgSend(v6, "isPopupVariant");
    -[TIKeyboardInputManagerLiveConversion_ja stringByConvertingPunctuationForInput:isLockedInput:](self, "stringByConvertingPunctuationForInput:isLockedInput:", v9, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = objc_msgSend(v34, "characterAtIndex:", 0);
    -[TIKeyboardInputManagerLiveConversion_ja rawInputString](self, "rawInputString");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "length");

    if ((v35 - 12443) > 1)
      goto LABEL_35;
    -[TIKeyboardInputManagerLiveConversion_ja rawInputString](self, "rawInputString");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "length");

    if (!v39)
      goto LABEL_35;
    v40 = v37 - 1;
    -[TIKeyboardInputManagerLiveConversion_ja rawInputString](self, "rawInputString");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v35 == 12444)
    {
      objc_msgSend(v41, "substringWithRange:", v40, 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(CFSTR("はひふへほ"), "rangeOfString:", v48);
      v46 = v49;

      if (v44 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v47 = CFSTR("ぱぴぷぺぽ");
        goto LABEL_31;
      }
    }
    else
    {
      if (v35 != 12443)
      {
LABEL_34:

LABEL_35:
        objc_msgSend(v6, "setString:", v34);
        v53.receiver = self;
        v53.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja_Kana;
        -[TIKeyboardInputManagerLiveConversion_ja_Kana addInput:withContext:](&v53, sel_addInput_withContext_, v6, v7);
        -[TIKeyboardInputManagerLiveConversion_ja_Kana calculateGeometryForInput:](self, "calculateGeometryForInput:", v6);
        -[TIKeyboardInputManagerLiveConversion_ja rawInputString](self, "rawInputString");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManagerLiveConversion_ja makeCandidatesWithWordSearch:](self, "makeCandidatesWithWordSearch:", v52);

        v9 = v34;
        goto LABEL_36;
      }
      objc_msgSend(v41, "substringWithRange:", v40, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(CFSTR("うかきくけこさしすせそたちつてとはひふへほ"), "rangeOfString:", v43);
      v46 = v45;

      if (v44 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v47 = CFSTR("ゔがぎぐげござじずぜぞだぢづでどばびぶべぼ");
LABEL_31:
        -[__CFString substringWithRange:](v47, "substringWithRange:", v44, v46);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:
        if (v50)
        {
          objc_msgSend(v34, "stringByReplacingCharactersInRange:withString:", 0, 1, v50);
          v51 = objc_claimAutoreleasedReturnValue();

          -[TIKeyboardInputManagerLiveConversion_ja_Kana _deleteFromInput](self, "_deleteFromInput");
          v34 = (void *)v51;
        }
        goto LABEL_34;
      }
    }
    v50 = 0;
    goto LABEL_32;
  }
LABEL_36:

}

- (id)inputString
{
  void *v3;
  void *v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja_Kana;
  -[TIKeyboardInputManagerLiveConversion_ja inputString](&v10, sel_inputString);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[TIKeyboardInputManagerLiveConversion_ja rawInputString](self, "rawInputString");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = &stru_250122EC0;
    if (v6)
      v8 = (__CFString *)v6;
    v5 = v8;

  }
  return v5;
}

- (id)displayStringForSearch
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[TIKeyboardInputManagerLiveConversion_ja committedSurface](self, "committedSurface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLiveConversion_ja rawInputString](self, "rawInputString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 && v4)
  {
    objc_msgSend(v3, "stringByAppendingString:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;

  return v7;
}

- (void)calculateGeometryForInput:(id)a3
{
  id v4;

  v4 = a3;
  -[TIKeyboardInputManagerMecabra restoreGeometryForInput:atIndex:](self, "restoreGeometryForInput:atIndex:", v4, -[TIKeyboardInputManagerLiveConversion_ja inputIndex](self, "inputIndex"));

}

- (void)_deleteFromInput
{
  id v3;
  objc_super v4;

  -[TIKeyboardInputManagerLiveConversion_ja _cancelCandidatesThread](self, "_cancelCandidatesThread");
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja_Kana;
  v3 = -[TIKeyboardInputManagerLiveConversion_ja_Kana deleteFromInput:](&v4, sel_deleteFromInput_, 0);
}

- (id)segmentAdjustInputManager:(unint64_t)a3
{
  TIKeyboardInputManager_ja_SegmentAdjust *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  TIKeyboardInputManager_ja_SegmentAdjust *v10;

  v5 = [TIKeyboardInputManager_ja_SegmentAdjust alloc];
  -[TIKeyboardInputManagerLiveConversion_ja_Kana config](self, "config");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLiveConversion_ja_Kana keyboardState](self, "keyboardState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLiveConversion_ja segmentsForPicker](self, "segmentsForPicker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLiveConversion_ja wordSearch](self, "wordSearch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[TIKeyboardInputManager_ja_SegmentAdjust initWithConfig:keyboardState:segments:at:romajiEnabled:wordSearch:](v5, "initWithConfig:keyboardState:segments:at:romajiEnabled:wordSearch:", v6, v7, v8, a3, 0, v9);

  return v10;
}

- (id)rawInputStringFrom:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "mecabraCandidateRefFromCandidate:", v4);

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BEB4E80], "dictionaryReadingFromMecabraCandidate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)hiraganaStringFor:(id)a3
{
  return a3;
}

@end
