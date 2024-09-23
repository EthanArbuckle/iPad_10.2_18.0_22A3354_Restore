@implementation TIZhuyinInputManager

- (TIZhuyinInputManager)init
{
  char *v2;
  TIZhuyinInputManager *v3;
  NSMutableString *v4;
  NSMutableString *inputBuffer;
  NSMutableArray *v6;
  NSMutableArray *inputBufferSplittingLengths;
  NSMutableArray *v8;
  NSMutableArray *composedBufferSplittingLengths;
  NSMutableString *v10;
  NSMutableString *composedBuffer;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TIZhuyinInputManager;
  v2 = -[TIZhuyinInputManager init](&v13, sel_init);
  v3 = (TIZhuyinInputManager *)v2;
  if (v2)
  {
    *((_QWORD *)v2 + 4) = 0;
    *(_QWORD *)(v2 + 10) = 0;
    v4 = (NSMutableString *)objc_alloc_init(MEMORY[0x24BDD16A8]);
    inputBuffer = v3->_inputBuffer;
    v3->_inputBuffer = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    inputBufferSplittingLengths = v3->_inputBufferSplittingLengths;
    v3->_inputBufferSplittingLengths = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    composedBufferSplittingLengths = v3->_composedBufferSplittingLengths;
    v3->_composedBufferSplittingLengths = v8;

    v10 = (NSMutableString *)objc_alloc_init(MEMORY[0x24BDD16A8]);
    composedBuffer = v3->_composedBuffer;
    v3->_composedBuffer = v10;

  }
  return v3;
}

- (BOOL)addZhuyinInput:(id)a3
{
  return -[TIZhuyinInputManager addZhuyinInput:withUpdatingComposedTextToClient:](self, "addZhuyinInput:withUpdatingComposedTextToClient:", a3, 1);
}

- (BOOL)addZhuyinInput:(id)a3 withUpdatingComposedTextToClient:(BOOL)a4
{
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _BOOL4 v22;
  BOOL v23;
  void *v24;
  unint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  __int16 v40;
  id location;

  v6 = a3;
  if (!objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TIZhuyinInputManager.m"), 73, CFSTR("Should not happen, we are expecting Zhuyin input to be non-empty string."));

  }
  v7 = objc_msgSend(v6, "characterAtIndex:", 0);
  v8 = -[TIZhuyinInputManager inputCursorLocation](self, "inputCursorLocation");
  v9 = -[TIZhuyinInputManager syllableBuffersAggregateLength](self, "syllableBuffersAggregateLength");
  objc_msgSend(MEMORY[0x24BDD14A8], "zhuyinPhonemeCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "rangeOfCharacterFromSet:", v10);

  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "zhuyinConsonantCharacterSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v6, "rangeOfCharacterFromSet:", v14);

    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "zhuyinMedialCharacterSet");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v6, "rangeOfCharacterFromSet:", v16);

      if (v17 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x24BDD14A8], "zhuyinVowelCharacterSet");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v6, "rangeOfCharacterFromSet:", v18);

        if (v19 != 0x7FFFFFFFFFFFFFFFLL)
          -[TIZhuyinInputManager setSyllableVowelBuffer:](self, "setSyllableVowelBuffer:", v7);
      }
      else
      {
        -[TIZhuyinInputManager setSyllableMedialBuffer:](self, "setSyllableMedialBuffer:", v7);
      }
    }
    else
    {
      -[TIZhuyinInputManager setSyllableConsonantBuffer:](self, "setSyllableConsonantBuffer:", v7);
    }
    v23 = -[TIZhuyinInputManager syllableBuffersOccupied](self, "syllableBuffersOccupied");
    -[TIZhuyinInputManager inputBuffer](self, "inputBuffer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIZhuyinInputManager syllableBuffersAggregateString](self, "syllableBuffersAggregateString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
      objc_msgSend(v12, "replaceCharactersInRange:withString:", v8, v9, v24);
    else
      objc_msgSend(v12, "insertString:atIndex:", v24, -[TIZhuyinInputManager inputCursorLocation](self, "inputCursorLocation"));

    goto LABEL_21;
  }
  if (-[TIZhuyinInputManager syllableBuffersOccupied](self, "syllableBuffersOccupied"))
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR(" ")))
      v7 = objc_msgSend(CFSTR("ˉ"), "characterAtIndex:", 0);
    -[TIZhuyinInputManager setSyllableToneBuffer:](self, "setSyllableToneBuffer:", v7);
    -[TIZhuyinInputManager inputBuffer](self, "inputBuffer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIZhuyinInputManager syllableBuffersAggregateString](self, "syllableBuffersAggregateString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "replaceCharactersInRange:withString:", v8, v9, v13);

LABEL_21:
LABEL_22:
    LOBYTE(v22) = 1;
    goto LABEL_23;
  }
  -[TIZhuyinInputManager inputBuffer](self, "inputBuffer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "length");

  if (v21 && (objc_msgSend(v6, "isEqualToString:", CFSTR(" ")) & 1) == 0)
  {
    v26 = -[TIZhuyinInputManager bufferSplittingLengthsIndex](self, "bufferSplittingLengthsIndex");
    -[TIZhuyinInputManager inputBufferSplittingLengths](self, "inputBufferSplittingLengths");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectAtIndex:", v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "unsignedIntegerValue");

    if (-[TIZhuyinInputManager inputCursorLocation](self, "inputCursorLocation"))
      v30 = -[TIZhuyinInputManager inputCursorLocation](self, "inputCursorLocation") - v29;
    else
      v30 = 0;
    -[TIZhuyinInputManager inputBuffer](self, "inputBuffer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "substringWithRange:", v30, v29);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD14A8], "zhuyinPhonemeCharacterSet");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v32, "rangeOfCharacterFromSet:", v33);

    if (v34 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (-[TIZhuyinInputManager inputCursorLocation](self, "inputCursorLocation"))
        -[TIZhuyinInputManager deleteFromInput](self, "deleteFromInput");
      else
        -[TIZhuyinInputManager forwardDeleteFromInput](self, "forwardDeleteFromInput");
      objc_initWeak(&location, self);
      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = __72__TIZhuyinInputManager_addZhuyinInput_withUpdatingComposedTextToClient___block_invoke;
      v38[3] = &unk_25012EDB8;
      objc_copyWeak(&v39, &location);
      v40 = v7;
      objc_msgSend(v32, "enumerateSubstringsInRange:options:usingBlock:", 0, v29, 2, v38);
      -[TIZhuyinInputManager inputBuffer](self, "inputBuffer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIZhuyinInputManager syllableBuffersAggregateString](self, "syllableBuffersAggregateString");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "insertString:atIndex:", v36, -[TIZhuyinInputManager inputCursorLocation](self, "inputCursorLocation"));

      objc_destroyWeak(&v39);
      objc_destroyWeak(&location);
    }

    goto LABEL_22;
  }
  v22 = !-[TIZhuyinInputManager shouldDirectlyCommitInput:](self, "shouldDirectlyCommitInput:", v6);
LABEL_23:

  return v22;
}

void __72__TIZhuyinInputManager_addZhuyinInput_withUpdatingComposedTextToClient___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_msgSend(v13, "characterAtIndex:", 0);
  objc_msgSend(MEMORY[0x24BDD14A8], "zhuyinConsonantCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v13, "rangeOfCharacterFromSet:", v5);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "zhuyinMedialCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v13, "rangeOfCharacterFromSet:", v7);

    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "zhuyinVowelCharacterSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v13, "rangeOfCharacterFromSet:", v9);

      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x24BDD14A8], "zhuyinToneCharacterSet");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v13, "rangeOfCharacterFromSet:", v11);

        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(WeakRetained, "setSyllableToneBuffer:", *(unsigned __int16 *)(a1 + 40));
      }
      else
      {
        objc_msgSend(WeakRetained, "setSyllableVowelBuffer:", v4);
      }
    }
    else
    {
      objc_msgSend(WeakRetained, "setSyllableMedialBuffer:", v4);
    }
  }
  else
  {
    objc_msgSend(WeakRetained, "setSyllableConsonantBuffer:", v4);
  }

}

- (void)updateWithCandidate:(id)a3 isWholeInputCandidate:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int WordCount;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int WordLengthAtIndex;
  unint64_t v21;
  uint64_t WordReadingLengthAtIndex;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  unint64_t v53;
  void *v54;
  void *v55;
  void *context;
  unint64_t v57;
  void *v58;
  uint64_t v59;
  TIZhuyinInputManager *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;

  v4 = a4;
  v64 = a3;
  if (-[TIZhuyinInputManager syllableBuffersValid](self, "syllableBuffersValid"))
  {
    -[TIZhuyinInputManager composedBuffer](self, "composedBuffer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "candidate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(v6, "setString:", v7);
    else
      objc_msgSend(v6, "insertString:atIndex:", v7, -[TIZhuyinInputManager composedBufferCursorLocation](self, "composedBufferCursorLocation"));

    v8 = -[TIZhuyinInputManager bufferSplittingLengthsIndex](self, "bufferSplittingLengthsIndex");
    if (-[TIZhuyinInputManager composedBufferCursorLocation](self, "composedBufferCursorLocation"))
      v9 = v8 + 1;
    else
      v9 = 0;
    v10 = -[TIZhuyinInputManager syllableBuffersAggregateLength](self, "syllableBuffersAggregateLength");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIZhuyinInputManager inputBufferSplittingLengths](self, "inputBufferSplittingLengths");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v4)
    {
      v57 = v10;
      v58 = v11;
      objc_msgSend(v12, "removeAllObjects");

      v60 = self;
      -[TIZhuyinInputManager composedBufferSplittingLengths](self, "composedBufferSplittingLengths");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeAllObjects");

      objc_msgSend(v64, "mecabraCandidatePointerValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "unsignedLongLongValue");

      WordCount = MecabraCandidateGetWordCount();
      context = (void *)MEMORY[0x234904010]();
      if (WordCount)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        v59 = WordCount;
        do
        {
          WordLengthAtIndex = MecabraCandidateGetWordLengthAtIndex();
          v21 = WordLengthAtIndex;
          WordReadingLengthAtIndex = MecabraCandidateGetWordReadingLengthAtIndex();
          objc_msgSend(v64, "candidate");
          v23 = v19;
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = v18;
          objc_msgSend(v24, "substringWithRange:", v18, WordLengthAtIndex);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v64, "input");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v23;
          objc_msgSend(v26, "substringWithRange:", v23, WordReadingLengthAtIndex);
          v62 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (WordLengthAtIndex)
          {
            v28 = 0;
            do
            {
              objc_msgSend(v25, "rangeOfComposedCharacterSequenceAtIndex:", v28);
              v30 = v29;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v29);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "addObject:", v31);

              v28 += v30;
            }
            while (v28 < v21);
          }
          if (MecabraCandidateWordAtIndexIsFromSystemDictionary())
          {
            -[TIZhuyinInputManager inputBufferSplittingLengths](v60, "inputBufferSplittingLengths");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = (void *)v62;
            -[TIZhuyinInputManager readingsLengths:](v60, "readingsLengths:", v62);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "addObjectsFromArray:", v34);

            -[TIZhuyinInputManager composedBufferSplittingLengths](v60, "composedBufferSplittingLengths");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "addObjectsFromArray:", v27);
            v36 = v63;
            v37 = v61;
          }
          else
          {
            v38 = (void *)MecabraCandidateCopySyllableLengthArrayForWordAtIndex();
            v35 = v38;
            if (v38 && (v39 = objc_msgSend(v38, "count"), v39 != objc_msgSend(v27, "count")))
            {
              -[TIZhuyinInputManager inputBufferSplittingLengths](v60, "inputBufferSplittingLengths");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", WordReadingLengthAtIndex);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "addObject:", v44);

              -[TIZhuyinInputManager composedBufferSplittingLengths](v60, "composedBufferSplittingLengths");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v21);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "addObject:", v45);

              v33 = (void *)v62;
            }
            else
            {
              -[TIZhuyinInputManager inputBufferSplittingLengths](v60, "inputBufferSplittingLengths");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = (void *)v62;
              -[TIZhuyinInputManager readingsLengths:](v60, "readingsLengths:", v62);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "addObjectsFromArray:", v41);

              -[TIZhuyinInputManager composedBufferSplittingLengths](v60, "composedBufferSplittingLengths");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "addObjectsFromArray:", v27);
            }
            v37 = v61;

            v36 = v63;
          }

          v18 = v36 + v21;
          v19 = v37 + WordReadingLengthAtIndex;
          ++v17;

        }
        while (v17 != v59);
      }
      objc_autoreleasePoolPop(context);
      self = v60;
      v10 = v57;
      v11 = v58;
    }
    else
    {
      v46 = objc_msgSend(v12, "count");

      -[TIZhuyinInputManager inputBufferSplittingLengths](self, "inputBufferSplittingLengths");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v47;
      if (v46 >= v9)
        objc_msgSend(v47, "insertObject:atIndex:", v11, v9);
      else
        objc_msgSend(v47, "addObject:", v11);

      v49 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v64, "candidate");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "numberWithUnsignedInteger:", objc_msgSend(v50, "length"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      -[TIZhuyinInputManager composedBufferSplittingLengths](self, "composedBufferSplittingLengths");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "count");

      -[TIZhuyinInputManager composedBufferSplittingLengths](self, "composedBufferSplittingLengths");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v54;
      if (v53 >= v9)
        objc_msgSend(v54, "insertObject:atIndex:", v51, v9);
      else
        objc_msgSend(v54, "addObject:", v51);

    }
    -[TIZhuyinInputManager setInputCursorLocation:](self, "setInputCursorLocation:", -[TIZhuyinInputManager inputCursorLocation](self, "inputCursorLocation") + v10);
    -[TIZhuyinInputManager resetSyllableBuffers](self, "resetSyllableBuffers");

  }
}

- (BOOL)addNonZhuyinInput:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  v5 = -[TIZhuyinInputManager shouldDirectlyCommitInput:](self, "shouldDirectlyCommitInput:", v4);
  if (!v5 && !-[TIZhuyinInputManager syllableBuffersOccupied](self, "syllableBuffersOccupied"))
  {
    -[TIZhuyinInputManager convertToFullWidth:](self, "convertToFullWidth:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIZhuyinInputManager inputBuffer](self, "inputBuffer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertString:atIndex:", v6, -[TIZhuyinInputManager inputCursorLocation](self, "inputCursorLocation"));

    -[TIZhuyinInputManager composedBuffer](self, "composedBuffer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertString:atIndex:", v6, -[TIZhuyinInputManager composedBufferCursorLocation](self, "composedBufferCursorLocation"));

    v9 = objc_msgSend(v6, "length");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TIZhuyinInputManager bufferSplittingLengthsIndex](self, "bufferSplittingLengthsIndex");
    if (-[TIZhuyinInputManager composedBufferCursorLocation](self, "composedBufferCursorLocation"))
      v12 = v11 + 1;
    else
      v12 = 0;
    -[TIZhuyinInputManager inputBufferSplittingLengths](self, "inputBufferSplittingLengths");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    -[TIZhuyinInputManager inputBufferSplittingLengths](self, "inputBufferSplittingLengths");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14 >= v12)
    {
      objc_msgSend(v15, "insertObject:atIndex:", v10, v12);

      -[TIZhuyinInputManager composedBufferSplittingLengths](self, "composedBufferSplittingLengths");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "insertObject:atIndex:", v10, v12);
    }
    else
    {
      objc_msgSend(v15, "addObject:", v10);

      -[TIZhuyinInputManager composedBufferSplittingLengths](self, "composedBufferSplittingLengths");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v10);
    }

    -[TIZhuyinInputManager setInputCursorLocation:](self, "setInputCursorLocation:", -[TIZhuyinInputManager inputCursorLocation](self, "inputCursorLocation") + v9);
  }

  return !v5;
}

- (BOOL)deleteFromInput
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;

  -[TIZhuyinInputManager inputBuffer](self, "inputBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = -[TIZhuyinInputManager syllableBuffersOccupied](self, "syllableBuffersOccupied");
    v6 = -[TIZhuyinInputManager inputCursorLocation](self, "inputCursorLocation");
    if (v5)
    {
      v7 = v6 + -[TIZhuyinInputManager syllableBuffersAggregateLength](self, "syllableBuffersAggregateLength") - 1;
      -[TIZhuyinInputManager inputBuffer](self, "inputBuffer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deleteCharactersInRange:", v7, 1);

      if (-[TIZhuyinInputManager syllableToneBuffer](self, "syllableToneBuffer"))
      {
        -[TIZhuyinInputManager setSyllableToneBuffer:](self, "setSyllableToneBuffer:", 0);
      }
      else if (-[TIZhuyinInputManager syllableVowelBuffer](self, "syllableVowelBuffer"))
      {
        -[TIZhuyinInputManager setSyllableVowelBuffer:](self, "setSyllableVowelBuffer:", 0);
      }
      else if (-[TIZhuyinInputManager syllableMedialBuffer](self, "syllableMedialBuffer"))
      {
        -[TIZhuyinInputManager setSyllableMedialBuffer:](self, "setSyllableMedialBuffer:", 0);
      }
      else if (-[TIZhuyinInputManager syllableConsonantBuffer](self, "syllableConsonantBuffer"))
      {
        -[TIZhuyinInputManager setSyllableConsonantBuffer:](self, "setSyllableConsonantBuffer:", 0);
      }
    }
    else if (v6)
    {
      v9 = -[TIZhuyinInputManager bufferSplittingLengthsIndex](self, "bufferSplittingLengthsIndex");
      -[TIZhuyinInputManager inputBufferSplittingLengths](self, "inputBufferSplittingLengths");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "unsignedIntegerValue");

      v13 = -[TIZhuyinInputManager inputCursorLocation](self, "inputCursorLocation") - v12;
      -[TIZhuyinInputManager inputBuffer](self, "inputBuffer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "deleteCharactersInRange:", v13, v12);

      -[TIZhuyinInputManager composedBufferSplittingLengths](self, "composedBufferSplittingLengths");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndex:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "unsignedIntegerValue");

      v18 = -[TIZhuyinInputManager composedBufferCursorLocation](self, "composedBufferCursorLocation") - v17;
      -[TIZhuyinInputManager composedBuffer](self, "composedBuffer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "deleteCharactersInRange:", v18, v17);

      -[TIZhuyinInputManager inputBufferSplittingLengths](self, "inputBufferSplittingLengths");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeObjectAtIndex:", v9);

      -[TIZhuyinInputManager composedBufferSplittingLengths](self, "composedBufferSplittingLengths");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeObjectAtIndex:", v9);

      -[TIZhuyinInputManager setInputCursorLocation:](self, "setInputCursorLocation:", -[TIZhuyinInputManager inputCursorLocation](self, "inputCursorLocation") - v12);
    }
  }
  return v4 != 0;
}

- (BOOL)forwardDeleteFromInput
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;

  -[TIZhuyinInputManager inputBuffer](self, "inputBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    if (!-[TIZhuyinInputManager syllableBuffersOccupied](self, "syllableBuffersOccupied"))
    {
      v5 = -[TIZhuyinInputManager inputCursorLocation](self, "inputCursorLocation");
      -[TIZhuyinInputManager inputBuffer](self, "inputBuffer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "length");

      if (v5 < v7)
      {
        v8 = -[TIZhuyinInputManager inputCursorLocation](self, "inputCursorLocation");
        v9 = -[TIZhuyinInputManager bufferSplittingLengthsIndex](self, "bufferSplittingLengthsIndex");
        if (v8)
          v10 = v9 + 1;
        else
          v10 = v9;
        -[TIZhuyinInputManager inputBufferSplittingLengths](self, "inputBufferSplittingLengths");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndex:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "unsignedIntegerValue");

        v14 = -[TIZhuyinInputManager inputCursorLocation](self, "inputCursorLocation");
        -[TIZhuyinInputManager inputBuffer](self, "inputBuffer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "deleteCharactersInRange:", v14, v13);

        -[TIZhuyinInputManager composedBufferSplittingLengths](self, "composedBufferSplittingLengths");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndex:", v10);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "unsignedIntegerValue");

        v19 = -[TIZhuyinInputManager composedBufferCursorLocation](self, "composedBufferCursorLocation");
        -[TIZhuyinInputManager composedBuffer](self, "composedBuffer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "deleteCharactersInRange:", v19, v18);

        -[TIZhuyinInputManager inputBufferSplittingLengths](self, "inputBufferSplittingLengths");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "removeObjectAtIndex:", v10);

        -[TIZhuyinInputManager composedBufferSplittingLengths](self, "composedBufferSplittingLengths");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "removeObjectAtIndex:", v10);

      }
    }
  }
  return v4 != 0;
}

- (unint64_t)cursorLocation
{
  unint64_t v3;

  v3 = -[TIZhuyinInputManager composedBufferCursorLocation](self, "composedBufferCursorLocation");
  return -[TIZhuyinInputManager syllableBuffersAggregateLength](self, "syllableBuffersAggregateLength") + v3;
}

- (unint64_t)inputBufferIndexOf:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[TIZhuyinInputManager composedBuffer](self, "composedBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  if (objc_msgSend(v5, "length") <= a3)
  {
    -[TIZhuyinInputManager composedBuffer](self, "composedBuffer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a3 - objc_msgSend(v7, "length");

  }
  v15 = v6;
  -[TIZhuyinInputManager inputBufferSplittingLengths](self, "inputBufferSplittingLengths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __43__TIZhuyinInputManager_inputBufferIndexOf___block_invoke;
  v11[3] = &unk_25012EDE0;
  v11[4] = &v12;
  v11[5] = a3;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);

  v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t __43__TIZhuyinInputManager_inputBufferIndexOf___block_invoke(uint64_t result, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;

  if (*(_QWORD *)(result + 40) == a3)
  {
    *a4 = 1;
  }
  else
  {
    v4 = result;
    result = objc_msgSend(a2, "unsignedIntegerValue");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 32) + 8) + 24) += result;
  }
  return result;
}

- (BOOL)isCursorAtEnd
{
  TIZhuyinInputManager *v2;
  void *v3;
  uint64_t v4;

  v2 = self;
  -[TIZhuyinInputManager composedText](self, "composedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  LOBYTE(v2) = v4 == -[TIZhuyinInputManager cursorLocation](v2, "cursorLocation");

  return (char)v2;
}

- (id)readingsLengths:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v8[7];
  _QWORD v9[4];
  _QWORD v10[4];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v3 = (void *)MEMORY[0x24BDBCEB8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  v5 = objc_msgSend(v4, "length");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __40__TIZhuyinInputManager_readingsLengths___block_invoke;
  v8[3] = &unk_25012EE08;
  v8[4] = v9;
  v8[5] = v10;
  v8[6] = &v11;
  objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 2, v8);

  v6 = (id)v12[5];
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __40__TIZhuyinInputManager_readingsLengths___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  ++*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  objc_msgSend(MEMORY[0x24BDD14A8], "zhuyinToneCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "rangeOfCharacterFromSet:", v3) == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "zhuyinCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v8, "rangeOfCharacterFromSet:", v4);

    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_6;
  }
  else
  {

  }
  ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  v6 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
LABEL_6:

}

- (id)convertToFullWidth:(id)a3
{
  id v4;
  int v5;
  __CFString *v6;
  _BOOL4 v7;
  _BOOL4 v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "characterAtIndex:", 0);
  if (v5 <= 90)
  {
    if (v5 > 59)
    {
      if (v5 == 60)
      {

        v6 = CFSTR("《");
        goto LABEL_26;
      }
      if (v5 == 62)
      {

        v6 = CFSTR("》");
        goto LABEL_26;
      }
      goto LABEL_23;
    }
    if (v5 == 34)
    {
      v8 = -[TIZhuyinInputManager leftDoubleQuotationMarkInserted](self, "leftDoubleQuotationMarkInserted");

      if (v8)
      {
        -[TIZhuyinInputManager setLeftDoubleQuotationMarkInserted:](self, "setLeftDoubleQuotationMarkInserted:", 0);
        v6 = CFSTR("”");
      }
      else
      {
        -[TIZhuyinInputManager setLeftDoubleQuotationMarkInserted:](self, "setLeftDoubleQuotationMarkInserted:", 1);
        v6 = CFSTR("“");
      }
    }
    else
    {
      if (v5 != 39)
        goto LABEL_23;
      v7 = -[TIZhuyinInputManager leftSingleQuotationMarkInserted](self, "leftSingleQuotationMarkInserted");

      if (v7)
      {
        -[TIZhuyinInputManager setLeftSingleQuotationMarkInserted:](self, "setLeftSingleQuotationMarkInserted:", 0);
        v6 = CFSTR("’");
      }
      else
      {
        -[TIZhuyinInputManager setLeftSingleQuotationMarkInserted:](self, "setLeftSingleQuotationMarkInserted:", 1);
        v6 = CFSTR("‘");
      }
    }
  }
  else
  {
    if (v5 > 92)
    {
      switch(v5)
      {
        case ']':

          v6 = CFSTR("」");
          goto LABEL_26;
        case '{':

          v6 = CFSTR("『");
          goto LABEL_26;
        case '}':

          v6 = CFSTR("』");
          goto LABEL_26;
      }
LABEL_23:
      v6 = (__CFString *)objc_msgSend(v4, "mutableCopy");
      CFStringTransform(v6, 0, (CFStringRef)*MEMORY[0x24BDBD608], 1u);

      goto LABEL_26;
    }
    if (v5 == 91)
    {

      v6 = CFSTR("「");
    }
    else
    {

      v6 = CFSTR("、");
    }
  }
LABEL_26:

  return v6;
}

- (BOOL)shouldDirectlyCommitInput:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v9;
  uint64_t v10;

  v4 = a3;
  if (-[TIZhuyinInputManager syllableBuffersOccupied](self, "syllableBuffersOccupied"))
    goto LABEL_3;
  -[TIZhuyinInputManager inputBuffer](self, "inputBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6
    || (objc_msgSend(v4, "isEqualToString:", CFSTR(" ")) & 1) == 0
    && (objc_msgSend(MEMORY[0x24BDD14A8], "zhuyinToneCharacterSet"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v9),
        v9,
        v10 == 0x7FFFFFFFFFFFFFFFLL))
  {
LABEL_3:
    v7 = 0;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)revertCurrentCharacterToTonelessZhuyin
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id location;

  -[TIZhuyinInputManager inputBuffer](self, "inputBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    if (-[TIZhuyinInputManager syllableBuffersOccupied](self, "syllableBuffersOccupied"))
    {
      v5 = -[TIZhuyinInputManager syllableBuffersAggregateLength](self, "syllableBuffersAggregateLength");
      if (v5)
      {
        v6 = v5;
        do
        {
          -[TIZhuyinInputManager deleteFromInput](self, "deleteFromInput");
          --v6;
        }
        while (v6);
      }
    }
    else
    {
      v7 = -[TIZhuyinInputManager bufferSplittingLengthsIndex](self, "bufferSplittingLengthsIndex");
      -[TIZhuyinInputManager inputBufferSplittingLengths](self, "inputBufferSplittingLengths");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "unsignedIntegerValue");

      if (-[TIZhuyinInputManager inputCursorLocation](self, "inputCursorLocation"))
        v11 = -[TIZhuyinInputManager inputCursorLocation](self, "inputCursorLocation") - v10;
      else
        v11 = 0;
      -[TIZhuyinInputManager inputBuffer](self, "inputBuffer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "substringWithRange:", v11, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[TIZhuyinInputManager inputCursorLocation](self, "inputCursorLocation"))
        -[TIZhuyinInputManager deleteFromInput](self, "deleteFromInput");
      else
        -[TIZhuyinInputManager forwardDeleteFromInput](self, "forwardDeleteFromInput");
      objc_initWeak(&location, self);
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __62__TIZhuyinInputManager_revertCurrentCharacterToTonelessZhuyin__block_invoke;
      v15[3] = &unk_25012EE30;
      objc_copyWeak(&v16, &location);
      objc_msgSend(v13, "enumerateSubstringsInRange:options:usingBlock:", 0, v10 - 1, 2, v15);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);

    }
  }
  return v4 != 0;
}

void __62__TIZhuyinInputManager_revertCurrentCharacterToTonelessZhuyin__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "addZhuyinInput:withUpdatingComposedTextToClient:", v3, 0);

}

- (void)resetSyllableBuffers
{
  -[TIZhuyinInputManager setSyllableConsonantBuffer:](self, "setSyllableConsonantBuffer:", 0);
  -[TIZhuyinInputManager setSyllableMedialBuffer:](self, "setSyllableMedialBuffer:", 0);
  -[TIZhuyinInputManager setSyllableVowelBuffer:](self, "setSyllableVowelBuffer:", 0);
  -[TIZhuyinInputManager setSyllableToneBuffer:](self, "setSyllableToneBuffer:", 0);
}

- (void)reset
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[TIZhuyinInputManager resetSyllableBuffers](self, "resetSyllableBuffers");
  -[TIZhuyinInputManager inputBuffer](self, "inputBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setString:", &stru_25012F088);

  -[TIZhuyinInputManager setInputCursorLocation:](self, "setInputCursorLocation:", 0);
  -[TIZhuyinInputManager inputBufferSplittingLengths](self, "inputBufferSplittingLengths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[TIZhuyinInputManager composedBufferSplittingLengths](self, "composedBufferSplittingLengths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[TIZhuyinInputManager composedBuffer](self, "composedBuffer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setString:", &stru_25012F088);

}

- (NSString)composedText
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = -[TIZhuyinInputManager composedBufferCursorLocation](self, "composedBufferCursorLocation");
  -[TIZhuyinInputManager composedBuffer](self, "composedBuffer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "substringToIndex:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIZhuyinInputManager syllableBuffersAggregateString](self, "syllableBuffersAggregateString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("ˉ"), CFSTR(" "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIZhuyinInputManager composedBuffer](self, "composedBuffer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "substringFromIndex:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByAppendingString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (unint64_t)bufferSplittingLengthsIndex
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  _QWORD v8[7];
  _QWORD v9[4];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v3 = -[TIZhuyinInputManager inputCursorLocation](self, "inputCursorLocation");
  if (v3)
  {
    v4 = v3;
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    v9[3] = 0;
    -[TIZhuyinInputManager inputBufferSplittingLengths](self, "inputBufferSplittingLengths");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __51__TIZhuyinInputManager_bufferSplittingLengthsIndex__block_invoke;
    v8[3] = &unk_25012EE58;
    v8[5] = &v10;
    v8[6] = v4;
    v8[4] = v9;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

    _Block_object_dispose(v9, 8);
  }
  v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __51__TIZhuyinInputManager_bufferSplittingLengthsIndex__block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "unsignedIntegerValue");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) += result;
  if (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) == a1[6])
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (unint64_t)composedBufferCursorLocation
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  if (-[TIZhuyinInputManager inputCursorLocation](self, "inputCursorLocation"))
  {
    v3 = -[TIZhuyinInputManager bufferSplittingLengthsIndex](self, "bufferSplittingLengthsIndex");
    -[TIZhuyinInputManager composedBufferSplittingLengths](self, "composedBufferSplittingLengths");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __52__TIZhuyinInputManager_composedBufferCursorLocation__block_invoke;
    v7[3] = &unk_25012EE80;
    v7[4] = &v8;
    v7[5] = v3;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  }
  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __52__TIZhuyinInputManager_composedBufferCursorLocation__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "unsignedIntegerValue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  if (*(_QWORD *)(a1 + 40) == a3)
    *a4 = 1;
  return result;
}

- (BOOL)syllableBuffersValid
{
  TIZhuyinInputManager *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  if (-[TIZhuyinInputManager syllableToneBuffer](v2, "syllableToneBuffer"))
    v3 = -[TIZhuyinInputManager syllableConsonantBuffer](v2, "syllableConsonantBuffer")
      || -[TIZhuyinInputManager syllableMedialBuffer](v2, "syllableMedialBuffer")
      || -[TIZhuyinInputManager syllableVowelBuffer](v2, "syllableVowelBuffer") != 0;
  else
    v3 = 0;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)syllableBuffersOccupied
{
  return -[TIZhuyinInputManager syllableBuffersAggregateLength](self, "syllableBuffersAggregateLength") != 0;
}

- (unint64_t)syllableBuffersAggregateLength
{
  TIZhuyinInputManager *v2;
  int v3;
  int v4;
  uint64_t v5;
  unint64_t v6;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[TIZhuyinInputManager syllableConsonantBuffer](v2, "syllableConsonantBuffer");
  v4 = -[TIZhuyinInputManager syllableMedialBuffer](v2, "syllableMedialBuffer");
  v5 = 1;
  if (v3)
    v5 = 2;
  if (v4)
    v6 = v5;
  else
    v6 = v3 != 0;
  if (-[TIZhuyinInputManager syllableVowelBuffer](v2, "syllableVowelBuffer"))
    ++v6;
  if (-[TIZhuyinInputManager syllableToneBuffer](v2, "syllableToneBuffer"))
    ++v6;
  objc_sync_exit(v2);

  return v6;
}

- (NSString)syllableBuffersAggregateString
{
  void *v3;
  TIZhuyinInputManager *v4;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self;
  objc_sync_enter(v4);
  if (-[TIZhuyinInputManager syllableConsonantBuffer](v4, "syllableConsonantBuffer"))
    objc_msgSend(v3, "appendFormat:", CFSTR("%C"), -[TIZhuyinInputManager syllableConsonantBuffer](v4, "syllableConsonantBuffer"));
  if (-[TIZhuyinInputManager syllableMedialBuffer](v4, "syllableMedialBuffer"))
    objc_msgSend(v3, "appendFormat:", CFSTR("%C"), -[TIZhuyinInputManager syllableMedialBuffer](v4, "syllableMedialBuffer"));
  if (-[TIZhuyinInputManager syllableVowelBuffer](v4, "syllableVowelBuffer"))
    objc_msgSend(v3, "appendFormat:", CFSTR("%C"), -[TIZhuyinInputManager syllableVowelBuffer](v4, "syllableVowelBuffer"));
  if (-[TIZhuyinInputManager syllableToneBuffer](v4, "syllableToneBuffer"))
    objc_msgSend(v3, "appendFormat:", CFSTR("%C"), -[TIZhuyinInputManager syllableToneBuffer](v4, "syllableToneBuffer"));
  objc_sync_exit(v4);

  return (NSString *)v3;
}

- (id)inputStringForCharacters:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "stringByApplyingTransform:reverse:", CFSTR("Han-Latin; Latin-Bopomofo"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(" "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v10, "length"))
        {
          objc_msgSend(v10, "substringFromIndex:", objc_msgSend(v10, "length") - 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(CFSTR("ˉˊˇˋ˙"), "rangeOfString:", v11);

          if (v12 == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v10, "stringByAppendingString:", CFSTR("ˉ"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v13);

          }
          else
          {
            objc_msgSend(v4, "addObject:", v10);
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "componentsJoinedByString:", &stru_25012F088);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)moveCursorBackward
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  id v9;

  -[TIZhuyinInputManager inputBuffer](self, "inputBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4
    && !-[TIZhuyinInputManager syllableBuffersOccupied](self, "syllableBuffersOccupied")
    && -[TIZhuyinInputManager inputCursorLocation](self, "inputCursorLocation"))
  {
    v5 = -[TIZhuyinInputManager bufferSplittingLengthsIndex](self, "bufferSplittingLengthsIndex");
    -[TIZhuyinInputManager inputBufferSplittingLengths](self, "inputBufferSplittingLengths");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v5 < v7)
    {
      -[TIZhuyinInputManager inputBufferSplittingLengths](self, "inputBufferSplittingLengths");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIZhuyinInputManager setInputCursorLocation:](self, "setInputCursorLocation:", -[TIZhuyinInputManager inputCursorLocation](self, "inputCursorLocation")- objc_msgSend(v8, "unsignedIntegerValue"));

    }
  }
}

- (void)moveCursorForward
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  id v12;

  -[TIZhuyinInputManager inputBuffer](self, "inputBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    if (!-[TIZhuyinInputManager syllableBuffersOccupied](self, "syllableBuffersOccupied"))
    {
      v5 = -[TIZhuyinInputManager inputCursorLocation](self, "inputCursorLocation");
      -[TIZhuyinInputManager inputBuffer](self, "inputBuffer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "length");

      if (v5 < v7)
      {
        v8 = -[TIZhuyinInputManager bufferSplittingLengthsIndex](self, "bufferSplittingLengthsIndex");
        if (-[TIZhuyinInputManager inputCursorLocation](self, "inputCursorLocation"))
          ++v8;
        -[TIZhuyinInputManager inputBufferSplittingLengths](self, "inputBufferSplittingLengths");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        if (v8 < v10)
        {
          -[TIZhuyinInputManager inputBufferSplittingLengths](self, "inputBufferSplittingLengths");
          v12 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectAtIndex:", v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIZhuyinInputManager setInputCursorLocation:](self, "setInputCursorLocation:", -[TIZhuyinInputManager inputCursorLocation](self, "inputCursorLocation")+ objc_msgSend(v11, "unsignedIntegerValue"));

        }
      }
    }
  }
}

- (NSMutableString)inputBuffer
{
  return (NSMutableString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInputBuffer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unint64_t)inputCursorLocation
{
  return self->_inputCursorLocation;
}

- (void)setInputCursorLocation:(unint64_t)a3
{
  self->_inputCursorLocation = a3;
}

- (unsigned)syllableConsonantBuffer
{
  return self->_syllableConsonantBuffer;
}

- (void)setSyllableConsonantBuffer:(unsigned __int16)a3
{
  self->_syllableConsonantBuffer = a3;
}

- (unsigned)syllableMedialBuffer
{
  return self->_syllableMedialBuffer;
}

- (void)setSyllableMedialBuffer:(unsigned __int16)a3
{
  self->_syllableMedialBuffer = a3;
}

- (unsigned)syllableVowelBuffer
{
  return self->_syllableVowelBuffer;
}

- (void)setSyllableVowelBuffer:(unsigned __int16)a3
{
  self->_syllableVowelBuffer = a3;
}

- (unsigned)syllableToneBuffer
{
  return self->_syllableToneBuffer;
}

- (void)setSyllableToneBuffer:(unsigned __int16)a3
{
  self->_syllableToneBuffer = a3;
}

- (NSMutableArray)inputBufferSplittingLengths
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInputBufferSplittingLengths:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableArray)composedBufferSplittingLengths
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setComposedBufferSplittingLengths:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableString)composedBuffer
{
  return (NSMutableString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setComposedBuffer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)leftSingleQuotationMarkInserted
{
  return self->_leftSingleQuotationMarkInserted;
}

- (void)setLeftSingleQuotationMarkInserted:(BOOL)a3
{
  self->_leftSingleQuotationMarkInserted = a3;
}

- (BOOL)leftDoubleQuotationMarkInserted
{
  return self->_leftDoubleQuotationMarkInserted;
}

- (void)setLeftDoubleQuotationMarkInserted:(BOOL)a3
{
  self->_leftDoubleQuotationMarkInserted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composedBuffer, 0);
  objc_storeStrong((id *)&self->_composedBufferSplittingLengths, 0);
  objc_storeStrong((id *)&self->_inputBufferSplittingLengths, 0);
  objc_storeStrong((id *)&self->_inputBuffer, 0);
}

@end
