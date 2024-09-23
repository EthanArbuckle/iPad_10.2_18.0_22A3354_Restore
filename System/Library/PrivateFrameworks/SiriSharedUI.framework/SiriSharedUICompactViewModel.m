@implementation SiriSharedUICompactViewModel

- (id)_initWithInputType:(int64_t)a3 resultTranscriptItems:(id)a4 conversationTranscriptItems:(id)a5 additionalPlatterTranscriptItems:(id)a6 serverUtterances:(id)a7 speechRecognitionHypothesis:(id)a8 latencyViewModel:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  SiriSharedUICompactViewModel *v21;
  SiriSharedUICompactViewModel *v22;
  uint64_t v23;
  NSArray *resultTranscriptItems;
  uint64_t v25;
  NSArray *conversationTranscriptItems;
  uint64_t v27;
  NSArray *additionalPlatterTranscriptItems;
  uint64_t v29;
  NSArray *serverUtterances;
  uint64_t v31;
  SRUIFSpeechRecognitionHypothesis *speechRecognitionHypothesis;
  objc_super v34;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v34.receiver = self;
  v34.super_class = (Class)SiriSharedUICompactViewModel;
  v21 = -[SiriSharedUICompactViewModel init](&v34, sel_init);
  v22 = v21;
  if (v21)
  {
    v21->_inputType = a3;
    v23 = objc_msgSend(v15, "copy");
    resultTranscriptItems = v22->_resultTranscriptItems;
    v22->_resultTranscriptItems = (NSArray *)v23;

    v25 = objc_msgSend(v16, "copy");
    conversationTranscriptItems = v22->_conversationTranscriptItems;
    v22->_conversationTranscriptItems = (NSArray *)v25;

    v27 = objc_msgSend(v17, "copy");
    additionalPlatterTranscriptItems = v22->_additionalPlatterTranscriptItems;
    v22->_additionalPlatterTranscriptItems = (NSArray *)v27;

    v29 = objc_msgSend(v18, "copy");
    serverUtterances = v22->_serverUtterances;
    v22->_serverUtterances = (NSArray *)v29;

    v31 = objc_msgSend(v19, "copy");
    speechRecognitionHypothesis = v22->_speechRecognitionHypothesis;
    v22->_speechRecognitionHypothesis = (SRUIFSpeechRecognitionHypothesis *)v31;

    objc_storeStrong((id *)&v22->_latencyViewModel, a9);
  }

  return v22;
}

- (SiriSharedUICompactViewModel)initWithInputType:(int64_t)a3 resultTranscriptItems:(id)a4 conversationTranscriptItems:(id)a5 additionalPlatterTranscriptItems:(id)a6 serverUtterances:(id)a7 speechRecognitionHypothesis:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  SiriSharedUILatencyViewModel *v19;
  SiriSharedUICompactViewModel *v20;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = -[SiriSharedUILatencyViewModel initWithUserUtterance:shouldSuppress:]([SiriSharedUILatencyViewModel alloc], "initWithUserUtterance:shouldSuppress:", 0, 0);
  v20 = -[SiriSharedUICompactViewModel _initWithInputType:resultTranscriptItems:conversationTranscriptItems:additionalPlatterTranscriptItems:serverUtterances:speechRecognitionHypothesis:latencyViewModel:](self, "_initWithInputType:resultTranscriptItems:conversationTranscriptItems:additionalPlatterTranscriptItems:serverUtterances:speechRecognitionHypothesis:latencyViewModel:", a3, v18, v17, v16, v15, v14, v19);

  return v20;
}

- (SiriSharedUICompactViewModel)initWithInputType:(int64_t)a3 speechRecognitionHypothesis:(id)a4
{
  return -[SiriSharedUICompactViewModel initWithInputType:resultTranscriptItems:conversationTranscriptItems:additionalPlatterTranscriptItems:serverUtterances:speechRecognitionHypothesis:](self, "initWithInputType:resultTranscriptItems:conversationTranscriptItems:additionalPlatterTranscriptItems:serverUtterances:speechRecognitionHypothesis:", a3, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], a4);
}

- (SiriSharedUICompactViewModel)init
{
  return -[SiriSharedUICompactViewModel initWithInputType:resultTranscriptItems:conversationTranscriptItems:additionalPlatterTranscriptItems:serverUtterances:speechRecognitionHypothesis:](self, "initWithInputType:resultTranscriptItems:conversationTranscriptItems:additionalPlatterTranscriptItems:serverUtterances:speechRecognitionHypothesis:", 0, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@ %p:"), objc_opt_class(), self);
  objc_msgSend(v3, "appendString:", CFSTR(" inputType="));
  SiriSharedUIViewModelInputTypeGetDescription(-[SiriSharedUICompactViewModel inputType](self, "inputType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(v3, "appendString:", CFSTR(" resultTranscriptItems="));
  -[SiriSharedUICompactViewModel resultTranscriptItems](self, "resultTranscriptItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = CFSTR("nil");
  objc_msgSend(v3, "appendString:", v8);

  objc_msgSend(v3, "appendString:", CFSTR("; conversationTranscriptItem="));
  -[SiriSharedUICompactViewModel conversationTranscriptItems](self, "conversationTranscriptItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "description");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = CFSTR("nil");
  objc_msgSend(v3, "appendString:", v12);

  objc_msgSend(v3, "appendString:", CFSTR("; additionalPlatterTranscriptItems="));
  -[SiriSharedUICompactViewModel additionalPlatterTranscriptItems](self, "additionalPlatterTranscriptItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "description");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (const __CFString *)v14;
  else
    v16 = CFSTR("nil");
  objc_msgSend(v3, "appendString:", v16);

  objc_msgSend(v3, "appendString:", CFSTR("; serverUtterances="));
  -[SiriSharedUICompactViewModel serverUtterances](self, "serverUtterances");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "description");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = (const __CFString *)v18;
  else
    v20 = CFSTR("nil");
  objc_msgSend(v3, "appendString:", v20);

  objc_msgSend(v3, "appendString:", CFSTR("; speechRecognitionHypothesis="));
  -[SiriSharedUICompactViewModel speechRecognitionHypothesis](self, "speechRecognitionHypothesis");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "description");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
    v24 = (const __CFString *)v22;
  else
    v24 = CFSTR("nil");
  objc_msgSend(v3, "appendString:", v24);

  objc_msgSend(v3, "appendString:", CFSTR("; latencyViewModel="));
  -[SiriSharedUICompactViewModel latencyViewModel](self, "latencyViewModel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "description");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  if (v26)
    v28 = (const __CFString *)v26;
  else
    v28 = CFSTR("nil");
  objc_msgSend(v3, "appendString:", v28);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v29 = (void *)objc_msgSend(v3, "copy");

  return v29;
}

- (id)_copyWithInputType:(int64_t)a3 resultTranscriptItems:(id)a4 conversationTranscriptItems:(id)a5 additionalPlatterTranscriptItems:(id)a6 serverUtterances:(id)a7 speechRecognitionHypothesis:(id)a8 latencyViewUtterance:(id)a9
{
  void *v9;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  SiriSharedUILatencyViewModel *v26;
  void *v27;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;

  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  if (a3 != 1)
  {
    v23 = 1;
    goto LABEL_22;
  }
  v22 = objc_msgSend(v16, "count");
  if (v22)
  {
    -[SiriSharedUICompactViewModel resultTranscriptItems](self, "resultTranscriptItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v16, "isEqualToArray:", v9))
    {
      v23 = 1;
LABEL_21:

      goto LABEL_22;
    }
  }
  v34 = objc_msgSend(v17, "count");
  v35 = v22;
  if (!v34
    || (-[SiriSharedUICompactViewModel conversationTranscriptItems](self, "conversationTranscriptItems"),
        v33 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v17, "isEqualToArray:")))
  {
    objc_msgSend(v18, "valueForKeyPath:", CFSTR("@unionOfArrays.self"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v32, "count");
    if (v31)
    {
      -[SiriSharedUICompactViewModel additionalPlatterTranscriptItems](self, "additionalPlatterTranscriptItems");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v18, "isEqualToArray:") & 1) == 0)
      {
        v23 = 1;
        goto LABEL_17;
      }
      if (!objc_msgSend(v19, "count"))
      {
        v23 = 0;
LABEL_17:

        goto LABEL_18;
      }
    }
    else if (!objc_msgSend(v19, "count"))
    {

      v23 = 0;
      goto LABEL_18;
    }
    v29 = v9;
    -[SiriSharedUICompactViewModel serverUtterances](self, "serverUtterances");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v19, "isEqualToArray:", v24) ^ 1;

    if (v31)
    {
      v9 = v29;
      goto LABEL_17;
    }

    v9 = v29;
LABEL_18:
    if (!v34)
      goto LABEL_20;
    goto LABEL_19;
  }
  v23 = 1;
LABEL_19:

LABEL_20:
  if (v35)
    goto LABEL_21;
LABEL_22:
  v25 = objc_alloc((Class)objc_opt_class());
  v26 = -[SiriSharedUILatencyViewModel initWithUserUtterance:shouldSuppress:]([SiriSharedUILatencyViewModel alloc], "initWithUserUtterance:shouldSuppress:", v21, v23);
  v27 = (void *)objc_msgSend(v25, "_initWithInputType:resultTranscriptItems:conversationTranscriptItems:additionalPlatterTranscriptItems:serverUtterances:speechRecognitionHypothesis:latencyViewModel:", a3, v16, v17, v18, v19, v20, v26);

  return v27;
}

- (id)copyWithInputType:(int64_t)a3 resultTranscriptItems:(id)a4 conversationTranscriptItems:(id)a5 serverUtterances:(id)a6 speechRecognitionHypothesis:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  -[SiriSharedUICompactViewModel additionalPlatterTranscriptItems](self, "additionalPlatterTranscriptItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactViewModel latencyViewModel](self, "latencyViewModel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "userUtterance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SiriSharedUICompactViewModel _copyWithInputType:resultTranscriptItems:conversationTranscriptItems:additionalPlatterTranscriptItems:serverUtterances:speechRecognitionHypothesis:latencyViewUtterance:](self, "_copyWithInputType:resultTranscriptItems:conversationTranscriptItems:additionalPlatterTranscriptItems:serverUtterances:speechRecognitionHypothesis:latencyViewUtterance:", a3, v15, v14, v16, v13, v12, v18);

  return v19;
}

- (id)copyWithResultTranscriptItems:(id)a3 conversationTranscriptItems:(id)a4 serverUtterances:(id)a5 speechRecognitionHypothesis:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[SiriSharedUICompactViewModel inputType](self, "inputType");
  -[SiriSharedUICompactViewModel additionalPlatterTranscriptItems](self, "additionalPlatterTranscriptItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactViewModel latencyViewModel](self, "latencyViewModel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "userUtterance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[SiriSharedUICompactViewModel _copyWithInputType:resultTranscriptItems:conversationTranscriptItems:additionalPlatterTranscriptItems:serverUtterances:speechRecognitionHypothesis:latencyViewUtterance:](self, "_copyWithInputType:resultTranscriptItems:conversationTranscriptItems:additionalPlatterTranscriptItems:serverUtterances:speechRecognitionHypothesis:latencyViewUtterance:", v14, v13, v12, v15, v11, v10, v17);

  return v18;
}

- (id)copyWithConversationTranscriptItems:(id)a3 serverUtterances:(id)a4 speechRecognitionHypothesis:(id)a5 latencyViewUtterance:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  int64_t v14;
  void *v15;
  void *v16;
  id v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[SiriSharedUICompactViewModel inputType](self, "inputType");
  -[SiriSharedUICompactViewModel resultTranscriptItems](self, "resultTranscriptItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactViewModel additionalPlatterTranscriptItems](self, "additionalPlatterTranscriptItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[SiriSharedUICompactViewModel _copyWithInputType:resultTranscriptItems:conversationTranscriptItems:additionalPlatterTranscriptItems:serverUtterances:speechRecognitionHypothesis:latencyViewUtterance:](self, "_copyWithInputType:resultTranscriptItems:conversationTranscriptItems:additionalPlatterTranscriptItems:serverUtterances:speechRecognitionHypothesis:latencyViewUtterance:", v14, v15, v13, v16, v12, v11, v10);

  return v17;
}

- (id)copyWithInputType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[SiriSharedUICompactViewModel resultTranscriptItems](self, "resultTranscriptItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactViewModel conversationTranscriptItems](self, "conversationTranscriptItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactViewModel additionalPlatterTranscriptItems](self, "additionalPlatterTranscriptItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactViewModel serverUtterances](self, "serverUtterances");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactViewModel speechRecognitionHypothesis](self, "speechRecognitionHypothesis");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactViewModel latencyViewModel](self, "latencyViewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userUtterance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SiriSharedUICompactViewModel _copyWithInputType:resultTranscriptItems:conversationTranscriptItems:additionalPlatterTranscriptItems:serverUtterances:speechRecognitionHypothesis:latencyViewUtterance:](self, "_copyWithInputType:resultTranscriptItems:conversationTranscriptItems:additionalPlatterTranscriptItems:serverUtterances:speechRecognitionHypothesis:latencyViewUtterance:", a3, v5, v6, v7, v8, v9, v11);

  return v12;
}

- (id)copyWithResultTranscriptItems:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v5 = -[SiriSharedUICompactViewModel inputType](self, "inputType");
  -[SiriSharedUICompactViewModel conversationTranscriptItems](self, "conversationTranscriptItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactViewModel additionalPlatterTranscriptItems](self, "additionalPlatterTranscriptItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactViewModel serverUtterances](self, "serverUtterances");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactViewModel speechRecognitionHypothesis](self, "speechRecognitionHypothesis");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactViewModel latencyViewModel](self, "latencyViewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userUtterance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SiriSharedUICompactViewModel _copyWithInputType:resultTranscriptItems:conversationTranscriptItems:additionalPlatterTranscriptItems:serverUtterances:speechRecognitionHypothesis:latencyViewUtterance:](self, "_copyWithInputType:resultTranscriptItems:conversationTranscriptItems:additionalPlatterTranscriptItems:serverUtterances:speechRecognitionHypothesis:latencyViewUtterance:", v5, v4, v6, v7, v8, v9, v11);

  return v12;
}

- (id)copyWithAdditionalPlatterTranscriptItems:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v5 = -[SiriSharedUICompactViewModel inputType](self, "inputType");
  -[SiriSharedUICompactViewModel resultTranscriptItems](self, "resultTranscriptItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactViewModel conversationTranscriptItems](self, "conversationTranscriptItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactViewModel serverUtterances](self, "serverUtterances");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactViewModel speechRecognitionHypothesis](self, "speechRecognitionHypothesis");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactViewModel latencyViewModel](self, "latencyViewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userUtterance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SiriSharedUICompactViewModel _copyWithInputType:resultTranscriptItems:conversationTranscriptItems:additionalPlatterTranscriptItems:serverUtterances:speechRecognitionHypothesis:latencyViewUtterance:](self, "_copyWithInputType:resultTranscriptItems:conversationTranscriptItems:additionalPlatterTranscriptItems:serverUtterances:speechRecognitionHypothesis:latencyViewUtterance:", v5, v6, v7, v4, v8, v9, v11);

  return v12;
}

- (id)copyWithSpeechRecognitionHypothesis:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  v6 = -[SiriSharedUICompactViewModel inputType](self, "inputType");
  -[SiriSharedUICompactViewModel resultTranscriptItems](self, "resultTranscriptItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactViewModel conversationTranscriptItems](self, "conversationTranscriptItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactViewModel additionalPlatterTranscriptItems](self, "additionalPlatterTranscriptItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactViewModel serverUtterances](self, "serverUtterances");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactViewModel latencyViewModel](self, "latencyViewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v5, "_initWithInputType:resultTranscriptItems:conversationTranscriptItems:additionalPlatterTranscriptItems:serverUtterances:speechRecognitionHypothesis:latencyViewModel:", v6, v7, v8, v9, v10, v4, v11);

  return v12;
}

- (id)copyWithServerUtterances:(id)a3 speechRecognitionHypothesis:(id)a4 latencyViewUtterance:(id)a5
{
  id v8;
  id v9;
  id v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[SiriSharedUICompactViewModel inputType](self, "inputType");
  -[SiriSharedUICompactViewModel resultTranscriptItems](self, "resultTranscriptItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactViewModel conversationTranscriptItems](self, "conversationTranscriptItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactViewModel additionalPlatterTranscriptItems](self, "additionalPlatterTranscriptItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SiriSharedUICompactViewModel _copyWithInputType:resultTranscriptItems:conversationTranscriptItems:additionalPlatterTranscriptItems:serverUtterances:speechRecognitionHypothesis:latencyViewUtterance:](self, "_copyWithInputType:resultTranscriptItems:conversationTranscriptItems:additionalPlatterTranscriptItems:serverUtterances:speechRecognitionHypothesis:latencyViewUtterance:", v11, v12, v13, v14, v10, v9, v8);

  return v15;
}

- (id)copyWithLatencyViewModel:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  v6 = -[SiriSharedUICompactViewModel inputType](self, "inputType");
  -[SiriSharedUICompactViewModel resultTranscriptItems](self, "resultTranscriptItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactViewModel conversationTranscriptItems](self, "conversationTranscriptItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactViewModel additionalPlatterTranscriptItems](self, "additionalPlatterTranscriptItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactViewModel serverUtterances](self, "serverUtterances");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactViewModel speechRecognitionHypothesis](self, "speechRecognitionHypothesis");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v5, "_initWithInputType:resultTranscriptItems:conversationTranscriptItems:additionalPlatterTranscriptItems:serverUtterances:speechRecognitionHypothesis:latencyViewModel:", v6, v7, v8, v9, v10, v11, v4);

  return v12;
}

- (id)copyWithLatencyIntentSummary:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SiriSharedUILatencyViewModel *v12;
  void *v13;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  v6 = -[SiriSharedUICompactViewModel inputType](self, "inputType");
  -[SiriSharedUICompactViewModel resultTranscriptItems](self, "resultTranscriptItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactViewModel conversationTranscriptItems](self, "conversationTranscriptItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactViewModel additionalPlatterTranscriptItems](self, "additionalPlatterTranscriptItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactViewModel serverUtterances](self, "serverUtterances");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactViewModel speechRecognitionHypothesis](self, "speechRecognitionHypothesis");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SiriSharedUILatencyViewModel initWithUserUtterance:shouldSuppress:]([SiriSharedUILatencyViewModel alloc], "initWithUserUtterance:shouldSuppress:", v4, 0);

  v13 = (void *)objc_msgSend(v5, "_initWithInputType:resultTranscriptItems:conversationTranscriptItems:additionalPlatterTranscriptItems:serverUtterances:speechRecognitionHypothesis:latencyViewModel:", v6, v7, v8, v9, v10, v11, v12);
  return v13;
}

- (int64_t)inputType
{
  return self->_inputType;
}

- (NSArray)resultTranscriptItems
{
  return self->_resultTranscriptItems;
}

- (NSArray)conversationTranscriptItems
{
  return self->_conversationTranscriptItems;
}

- (NSArray)additionalPlatterTranscriptItems
{
  return self->_additionalPlatterTranscriptItems;
}

- (NSArray)serverUtterances
{
  return self->_serverUtterances;
}

- (SRUIFSpeechRecognitionHypothesis)speechRecognitionHypothesis
{
  return self->_speechRecognitionHypothesis;
}

- (SiriSharedUILatencyViewModel)latencyViewModel
{
  return self->_latencyViewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latencyViewModel, 0);
  objc_storeStrong((id *)&self->_speechRecognitionHypothesis, 0);
  objc_storeStrong((id *)&self->_serverUtterances, 0);
  objc_storeStrong((id *)&self->_additionalPlatterTranscriptItems, 0);
  objc_storeStrong((id *)&self->_conversationTranscriptItems, 0);
  objc_storeStrong((id *)&self->_resultTranscriptItems, 0);
}

@end
