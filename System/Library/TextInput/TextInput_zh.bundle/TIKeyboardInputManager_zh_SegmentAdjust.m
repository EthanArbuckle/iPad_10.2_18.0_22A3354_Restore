@implementation TIKeyboardInputManager_zh_SegmentAdjust

- (TIKeyboardInputManager_zh_SegmentAdjust)initWithConfig:(id)a3 keyboardState:(id)a4 segments:(id)a5 inputManager:(id)a6 wordSearch:(id)a7
{
  id v13;
  id v14;
  id v15;
  TIKeyboardInputManager_zh_SegmentAdjust *v16;
  TIKeyboardInputManager_zh_SegmentAdjust *v17;
  TIMecabraIMLogger *v18;
  TIMecabraIMLogger *logger;
  objc_super v21;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)TIKeyboardInputManager_zh_SegmentAdjust;
  v16 = -[TIKeyboardInputManagerMecabra initWithConfig:keyboardState:](&v21, sel_initWithConfig_keyboardState_, a3, a4);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_wordSearch, a7);
    objc_storeStrong((id *)&v17->_inputManager, a6);
    objc_storeStrong((id *)&v17->_segments, a5);
    if (objc_msgSend(MEMORY[0x24BEB5408], "isLoggingEnabled"))
    {
      v18 = (TIMecabraIMLogger *)objc_alloc_init(MEMORY[0x24BEB5408]);
      logger = v17->_logger;
      v17->_logger = v18;

    }
  }

  return v17;
}

- (BOOL)supportsSetPhraseBoundary
{
  return 1;
}

- (BOOL)supportsNumberKeySelection
{
  return 1;
}

- (id)keyEventMap
{
  return (id)objc_msgSend(MEMORY[0x24BEB4DA0], "sharedInstance");
}

- (BOOL)usesCandidateSelection
{
  return 1;
}

- (id)keyboardBehaviors
{
  return objc_alloc_init(MEMORY[0x24BEB4E00]);
}

- (id)wordSearch
{
  return self->_wordSearch;
}

- (id)wordCharacters
{
  return (id)objc_msgSend(MEMORY[0x24BEB4D00], "zhuyinWordCharacters");
}

- (BOOL)usesLiveConversion
{
  return 1;
}

- (BOOL)delayedCandidateList
{
  return 1;
}

- (id)handleKeyboardInput:(id)a3
{
  TIKeyboardInputManager_zh_SegmentAdjust *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  int64_t v15;
  int64_t v16;
  uint64_t v17;
  int64_t v18;
  int64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  BOOL v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  int64_t v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  TIKeyboardInputManager_zh_SegmentAdjust *v42;
  int64_t v43;
  id obj;
  uint64_t v45;
  int64_t v46;
  void *v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v3 = self;
  v54 = *MEMORY[0x24BDAC8D0];
  -[TIKeyboardInputManager_zh_SegmentAdjust inputManager](self, "inputManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "composedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManager_zh_SegmentAdjust inputManager](v3, "inputManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inputBuffer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManager_zh_SegmentAdjust inputManager](v3, "inputManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "cursorLocation"))
  {
    -[TIKeyboardInputManager_zh_SegmentAdjust inputManager](v3, "inputManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "cursorLocation");

  }
  else
  {
    v10 = 1;
  }

  -[TIKeyboardInputManager_zh_SegmentAdjust inputManager](v3, "inputManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "inputBufferIndexOf:", v10);

  if (v10 < objc_msgSend(v5, "length") && v12 < (unint64_t)objc_msgSend(v7, "length"))
  {
    v46 = v10;
    v40 = v7;
    v41 = v5;
    v13 = (void *)MEMORY[0x24BDBCEB8];
    -[TIKeyboardInputManager_zh_SegmentAdjust segments](v3, "segments");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayWithCapacity:", objc_msgSend(v14, "count") + 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v42 = v3;
    -[TIKeyboardInputManager_zh_SegmentAdjust segments](v3, "segments");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (v48)
    {
      v15 = 0;
      v16 = 0;
      v45 = *(_QWORD *)v50;
      v43 = v12;
      do
      {
        v17 = 0;
        v18 = v15;
        v19 = v16;
        do
        {
          if (*(_QWORD *)v50 != v45)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v17);
          objc_msgSend(v20, "surface");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "length");

          objc_msgSend(v20, "reading");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "length");

          v15 = v22 + v18;
          v16 = v24 + v19;
          v25 = v46 - v18;
          if (v46 > v18 && (v46 < v15 ? (v26 = v12 <= v19) : (v26 = 1), !v26 ? (v27 = v12 < v16) : (v27 = 0), v27))
          {
            v28 = objc_alloc_init(MEMORY[0x24BEB5410]);
            objc_msgSend(v20, "surface");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "substringToIndex:", v25);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setSurface:", v30);

            objc_msgSend(v20, "reading");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v12 - v19;
            objc_msgSend(v31, "substringToIndex:", v12 - v19);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setReading:", v33);

            objc_msgSend(v47, "addObject:", v28);
            v34 = objc_alloc_init(MEMORY[0x24BEB5410]);
            objc_msgSend(v20, "surface");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "substringFromIndex:", v25);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setSurface:", v36);

            objc_msgSend(v20, "reading");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "substringFromIndex:", v32);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setReading:", v38);

            v12 = v43;
            objc_msgSend(v47, "addObject:", v34);

          }
          else
          {
            objc_msgSend(v47, "addObject:", v20);
          }
          ++v17;
          v18 = v15;
          v19 = v16;
        }
        while (v48 != v17);
        v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      }
      while (v48);
    }

    v3 = v42;
    -[TIKeyboardInputManager_zh_SegmentAdjust setSegments:](v42, "setSegments:", v47);

    v7 = v40;
    v5 = v41;
  }
  -[TIKeyboardInputManagerMecabra completeComposition](v3, "completeComposition");

  return 0;
}

- (unsigned)inputIndex
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;

  -[TIKeyboardInputManager_zh_SegmentAdjust currentCandidate](self, "currentCandidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TIKeyboardInputManager_zh_SegmentAdjust currentCandidate](self, "currentCandidate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "candidate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

  }
  else
  {
    -[TIKeyboardInputManager_zh_SegmentAdjust inputManager](self, "inputManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "cursorLocation");
  }

  return v6;
}

- (unsigned)inputCount
{
  void *v2;
  unsigned int v3;

  -[TIKeyboardInputManager_zh_SegmentAdjust inputString](self, "inputString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (id)inputString
{
  void *v3;
  void *v4;
  void *v5;

  -[TIKeyboardInputManager_zh_SegmentAdjust segments](self, "segments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager_zh_SegmentAdjust segments](self, "segments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_surfaceStringWithin:", 0, objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)clearInput
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_zh_SegmentAdjust;
  -[TIKeyboardInputManagerMecabra clearInput](&v3, sel_clearInput);
  -[TIKeyboardInputManager_zh_SegmentAdjust setCurrentCandidate:](self, "setCurrentCandidate:", 0);
  -[TIKeyboardInputManagerMecabra setRemainingInput:](self, "setRemainingInput:", 0);
}

- (id)convertString
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[TIKeyboardInputManager_zh_SegmentAdjust inputManager](self, "inputManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "inputCursorLocation");

  if (!v4)
  {
    -[TIKeyboardInputManager_zh_SegmentAdjust inputManager](self, "inputManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "inputBufferIndexOf:", 1);

  }
  -[TIKeyboardInputManager_zh_SegmentAdjust inputManager](self, "inputManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inputBuffer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 >= objc_msgSend(v7, "length"))
  {
    -[TIKeyboardInputManager_zh_SegmentAdjust inputManager](self, "inputManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "inputBuffer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v9, "length");

  }
  -[TIKeyboardInputManager_zh_SegmentAdjust inputManager](self, "inputManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inputBuffer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "substringToIndex:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)didAcceptCandidate:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  int v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v23;
  const char *v24;
  __int16 v25;
  _BOOL4 v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TIKeyboardInputManager_zh_SegmentAdjust convertString](self, "convertString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  objc_msgSend(v4, "input");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v23 = 136315394;
    v24 = "-[TIKeyboardInputManager_zh_SegmentAdjust didAcceptCandidate:]";
    v25 = 1024;
    v26 = v6 > v8;
    _os_log_impl(&dword_23235B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s  candidate is partial: %d", (uint8_t *)&v23, 0x12u);
  }
  objc_msgSend(v4, "candidate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    v10 = -[TIKeyboardInputManager_zh_SegmentAdjust isTypologyEnabled](self, "isTypologyEnabled");

    if (v10)
      -[TIKeyboardInputManagerMecabra logCommittedCandidate:partial:](self, "logCommittedCandidate:partial:", v4, v6 > v8);
  }
  else
  {

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v6 > v8;
    v12 = -[TIKeyboardInputManagerMecabra mecabraCandidateRefFromCandidate:](self, "mecabraCandidateRefFromCandidate:", v4);
    -[TIKeyboardInputManager_zh_SegmentAdjust wordSearch](self, "wordSearch");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "performAccept:isPartial:", v12, v11);

    -[TIKeyboardInputManagerMecabra updateUsageStatisticsForCandidate:isPartial:](self, "updateUsageStatisticsForCandidate:isPartial:", v4, v11);
  }
  -[TIKeyboardInputManager_zh_SegmentAdjust inputManager](self, "inputManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "inputBuffer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager_zh_SegmentAdjust inputManager](self, "inputManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "inputCursorLocation");
  objc_msgSend(v4, "input");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 <= objc_msgSend(v18, "length"))
  {
    objc_msgSend(v4, "input");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "length");
  }
  else
  {
    -[TIKeyboardInputManager_zh_SegmentAdjust inputManager](self, "inputManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "inputCursorLocation");
  }
  objc_msgSend(v15, "substringFromIndex:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerMecabra setRemainingInput:](self, "setRemainingInput:", v21);

  -[TIKeyboardInputManagerMecabra completeComposition](self, "completeComposition");
  return 0;
}

- (BOOL)_adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  uint64_t v4;
  _BOOL8 v5;
  NSObject *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  if (TICanLogMessageAtLevel())
  {
    TIOSLogFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[TIKeyboardInputManager_zh_SegmentAdjust _adjustPhraseBoundaryInForwardDirection:granularity:].cold.1(v5, v4, v7);

  }
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardInputManager_zh_SegmentAdjust;
  if (!-[TIKeyboardInputManagerMecabra _adjustPhraseBoundaryInForwardDirection:granularity:](&v11, sel__adjustPhraseBoundaryInForwardDirection_granularity_, v5, v4))
  {
    -[TIKeyboardInputManager_zh_SegmentAdjust inputManager](self, "inputManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v5)
      objc_msgSend(v8, "moveCursorForward");
    else
      objc_msgSend(v8, "moveCursorBackward");

  }
  return 1;
}

- (int64_t)segmentIndex
{
  return self->_segmentIndex;
}

- (void)setSegmentIndex:(int64_t)a3
{
  self->_segmentIndex = a3;
}

- (NSArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 800);
}

- (TIZhuyinInputManager)inputManager
{
  return self->_inputManager;
}

- (void)setInputManager:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 808);
}

- (TIMecabraIMLogger)logger
{
  return self->_logger;
}

- (TIKeyboardCandidate)currentCandidate
{
  return self->_currentCandidate;
}

- (void)setCurrentCandidate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 824);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCandidate, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_inputManager, 0);
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_wordSearch, 0);
}

- (void)_adjustPhraseBoundaryInForwardDirection:(NSObject *)a3 granularity:.cold.1(char a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint8_t buf[4];
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s adjust phrase: %d %d"), "-[TIKeyboardInputManager_zh_SegmentAdjust _adjustPhraseBoundaryInForwardDirection:granularity:]", a1 & 1, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_23235B000, a3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

}

@end
