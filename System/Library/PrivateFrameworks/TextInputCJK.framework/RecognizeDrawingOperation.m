@implementation RecognizeDrawingOperation

- (RecognizeDrawingOperation)initWithInputManager:(id)a3 strokes:(id)a4 history:(id)a5
{
  id v8;
  id v9;
  id v10;
  RecognizeDrawingOperation *v11;
  RecognizeDrawingOperation *v12;
  uint64_t v13;
  NSLocale *recognitionLanguage;
  uint64_t v15;
  CHRecognizer *recognizer;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)RecognizeDrawingOperation;
  v11 = -[RecognizeDrawingOperation init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    -[RecognizeDrawingOperation setManager:](v11, "setManager:", v8);
    objc_storeStrong((id *)&v12->_strokes, a4);
    objc_msgSend(v8, "recognitionLanguage");
    v13 = objc_claimAutoreleasedReturnValue();
    recognitionLanguage = v12->_recognitionLanguage;
    v12->_recognitionLanguage = (NSLocale *)v13;

    objc_storeStrong((id *)&v12->_history, a5);
    objc_msgSend(v8, "recognizer");
    v15 = objc_claimAutoreleasedReturnValue();
    recognizer = v12->_recognizer;
    v12->_recognizer = (CHRecognizer *)v15;

  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[RecognizeDrawingOperation setCandidates:](self, "setCandidates:", 0);
  -[RecognizeDrawingOperation setManager:](self, "setManager:", 0);
  v3.receiver = self;
  v3.super_class = (Class)RecognizeDrawingOperation;
  -[RecognizeDrawingOperation dealloc](&v3, sel_dealloc);
}

- (void)main
{
  void *v3;
  void *v4;
  CHRecognizer *recognizer;
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
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  id v26;
  id location;

  v3 = (void *)MEMORY[0x249597680](self, a2);
  if (self->_strokes)
  {
    +[RecognizeDrawingOperation drawingWithStrokes:](RecognizeDrawingOperation, "drawingWithStrokes:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    recognizer = self->_recognizer;
    -[RecognizeDrawingOperation manager](self, "manager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "keyboardState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[RecognizeDrawingOperation textRecognitionResultsForDrawing:withRecognizer:keyboardState:history:shouldCancel:](RecognizeDrawingOperation, "textRecognitionResultsForDrawing:withRecognizer:keyboardState:history:shouldCancel:", v4, recognizer, v7, self->_history, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "performSelector:withObject:", sel_textRecognitionResultArrayGivenHistory_, self->_history);
    else
      objc_msgSend(v8, "textRecognitionResultArray");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RecognizeDrawingOperation setCandidates:](self, "setCandidates:", v9);
    -[RecognizeDrawingOperation candidates](self, "candidates");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[RecognizeDrawingOperation manager](self, "manager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stickerCandidateGenerator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "string");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "generateStickerQueriesForText:tokenize:", v14, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v15, "count"))
      {
        v16 = dispatch_group_create();
        dispatch_group_enter(v16);
        objc_initWeak(&location, self);
        v19 = MEMORY[0x24BDAC760];
        v20 = 3221225472;
        v21 = __33__RecognizeDrawingOperation_main__block_invoke;
        v22 = &unk_251980310;
        v23 = v13;
        v24 = v15;
        objc_copyWeak(&v26, &location);
        v25 = v16;
        v17 = v16;
        TIDispatchAsync();
        dispatch_group_wait(v17, 0xFFFFFFFFFFFFFFFFLL);

        objc_destroyWeak(&v26);
        objc_destroyWeak(&location);
      }

    }
    if ((-[RecognizeDrawingOperation isCancelled](self, "isCancelled", v19, v20, v21, v22) & 1) == 0)
    {
      -[RecognizeDrawingOperation manager](self, "manager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_mainThreadUpdateCandidates_, self, 0);

    }
  }
  -[RecognizeDrawingOperation setManager:](self, "setManager:", 0);
  objc_autoreleasePoolPop(v3);
}

- (NSArray)candidates
{
  return self->_candidates;
}

- (void)setCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_candidates, a3);
}

- (TIInputManagerHandwriting)manager
{
  return self->_im;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_im, a3);
}

- (NSString)history
{
  return self->_history;
}

- (void)setHistory:(id)a3
{
  objc_storeStrong((id *)&self->_history, a3);
}

- (NSArray)stickers
{
  return self->_stickers;
}

- (void)setStickers:(id)a3
{
  objc_storeStrong((id *)&self->_stickers, a3);
}

- (CHRecognizer)recognizer
{
  return self->_recognizer;
}

- (void)setRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_recognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognizer, 0);
  objc_storeStrong((id *)&self->_stickers, 0);
  objc_storeStrong((id *)&self->_im, 0);
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_candidates, 0);
  objc_storeStrong((id *)&self->_recognitionLanguage, 0);
  objc_storeStrong((id *)&self->_strokes, 0);
}

void __33__RecognizeDrawingOperation_main__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "manager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "secureCandidateRenderTraits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "manager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inputMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "languageWithRegion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __33__RecognizeDrawingOperation_main__block_invoke_2;
  v10[3] = &unk_2519802E8;
  objc_copyWeak(&v12, (id *)(a1 + 64));
  v11 = *(id *)(a1 + 56);
  objc_msgSend(v2, "generateStickerCandidatesForSearchableQueries:withRenderTraits:shouldAppend:language:completionHandler:", v3, v6, 1, v9, v10);

  objc_destroyWeak(&v12);
}

void __33__RecognizeDrawingOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setStickers:", v4);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (int)recognitionContentTypeForKeyboardState:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;

  v3 = a3;
  objc_msgSend(v3, "textInputTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textContentType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BEB5220]) & 1) != 0)
    {
      v6 = 3;
      goto LABEL_15;
    }
    if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BEB5208]) & 1) != 0)
    {
      v6 = 6;
      goto LABEL_15;
    }
    if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BEB5200]) & 1) != 0)
    {
      v6 = 4;
      goto LABEL_15;
    }
    if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BEB5218]) & 1) != 0)
    {
      v6 = 5;
      goto LABEL_15;
    }
    if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BEB5210]) & 1) != 0)
    {
      v6 = 2;
      goto LABEL_15;
    }
  }
  v7 = objc_msgSend(v3, "keyboardType");
  if ((unint64_t)(v7 - 3) > 0xF)
    v6 = 0;
  else
    v6 = dword_24805F1A0[v7 - 3];
LABEL_15:

  return v6;
}

+ (int)capitalizationModeForKeyboardAutoCapitalizationType:(unint64_t)a3
{
  if (a3 > 3)
    return 1;
  else
    return dword_24805F1F0[a3];
}

+ (int)autoCorrectionModeForKeyboardAutoCorrectionType:(unint64_t)a3
{
  if (a3 == 2)
    return 1;
  else
    return 2 * (a3 == 1);
}

+ (id)textRecognitionResultsForDrawing:(id)a3 withRecognizer:(id)a4 keyboardState:(id)a5 history:(id)a6 shouldCancel:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  BOOL v25;
  double v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[2];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v18 = v17;
  if (v15)
    objc_msgSend(v17, "setObject:forKey:", v15, *MEMORY[0x24BE1BDB8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v39 = v16;
    v19 = v13;
    objc_msgSend(v18, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE1BDB0]);
    objc_msgSend(v12, "bounds");
    v21 = v20;
    objc_msgSend(v12, "bounds");
    v23 = v21 + v22;
    objc_msgSend(v12, "bounds");
    if (v23 >= 333.3)
    {
      v25 = v24 <= 666.7;
      v24 = 0.0;
      if (!v25)
      {
        objc_msgSend(v12, "bounds", 666.7, 0.0);
        v24 = -v26;
      }
    }
    v42[0] = 0;
    *(double *)&v42[1] = v24;
    objc_msgSend(MEMORY[0x24BDD1968], "value:withObjCType:", v42, "{CGPoint=dd}");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v27, *MEMORY[0x24BE1BDA0]);
    v41 = 0x4074D55555555555;
    objc_msgSend(MEMORY[0x24BDD1968], "value:withObjCType:", &v41, "d");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v28, *MEMORY[0x24BE1BDA8]);
    if (v14)
    {
      objc_msgSend(v19, "setContentType:", objc_msgSend(a1, "recognitionContentTypeForKeyboardState:", v14));
      objc_msgSend(v14, "textInputTraits");
      v38 = v27;
      v29 = a1;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "capitalizationModeForKeyboardAutoCapitalizationType:", objc_msgSend(v30, "autocapitalizationType"));

      objc_msgSend(v19, "setAutoCapitalizationMode:", v31);
      objc_msgSend(v14, "textInputTraits");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "autocorrectionType");
      v34 = v29;
      v27 = v38;
      v35 = objc_msgSend(v34, "autoCorrectionModeForKeyboardAutoCorrectionType:", v33);

      objc_msgSend(v19, "setAutoCorrectionMode:", v35);
    }
    v40 = 0;
    objc_msgSend(v19, "textRecognitionResultForDrawing:options:error:", v12, v18, &v40);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v39;
  }
  else
  {
    objc_msgSend(v13, "textRecognitionResultForDrawing:options:shouldCancel:", v12, v18, v16);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v36;
}

+ (id)recognitionResultsForDrawing:(id)a3 withRecognizer:(id)a4 history:(id)a5 shouldCancel:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (TIGetHandwritingMultipleCharacterRecognitionEnabledValue(void)::onceToken != -1)
    dispatch_once(&TIGetHandwritingMultipleCharacterRecognitionEnabledValue(void)::onceToken, &__block_literal_global_383);
  objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "valueForPreferenceKey:", CFSTR("HandwritingMultipleCharacterRecognitionEnabled"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v13) = objc_msgSend(v14, "BOOLValue");
  if ((_DWORD)v13)
    v15 = 4;
  else
    v15 = 1;
  objc_msgSend(v10, "setRecognitionMode:", v15);
  if (v11)
  {
    v19 = *MEMORY[0x24BE1BDB8];
    v20[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(v10, "recognitionResultsForDrawing:options:shouldCancel:", v9, v16, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)drawingWithStrokes:(id)a3
{
  id v3;
  id v4;
  unint64_t v5;
  unint64_t v6;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BE1BDC8]);
  if (objc_msgSend(v3, "numberOfStrokes"))
  {
    v5 = 0;
    do
    {
      if (objc_msgSend(v3, "numberOfPointsInStrokeAtIndex:", v5))
      {
        v6 = 0;
        do
        {
          objc_msgSend(v3, "pointAtIndex:inStrokeAtIndex:", v6, v5);
          objc_msgSend(v4, "addPoint:");
          ++v6;
        }
        while (objc_msgSend(v3, "numberOfPointsInStrokeAtIndex:", v5) > v6);
      }
      objc_msgSend(v4, "endStroke");
      ++v5;
    }
    while (objc_msgSend(v3, "numberOfStrokes") > v5);
  }

  return v4;
}

@end
