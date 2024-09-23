@implementation RTTConversation

+ (RTTConversation)conversationWithCallUID:(id)a3 withCallback:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  RTTConversation *result;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  AXLogRTT();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl(&dword_21473C000, v7, OS_LOG_TYPE_INFO, "Looking for conversation asynchronously: %@", buf, 0xCu);
  }

  +[RTTServer sharedInstance](RTTServer, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __56__RTTConversation_conversationWithCallUID_withCallback___block_invoke;
  v12[3] = &unk_24D2047E0;
  v13 = v5;
  v14 = v6;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v8, "findConversationForCallUID:andResult:", v10, v12);

  return result;
}

void __56__RTTConversation_conversationWithCallUID_withCallback___block_invoke(uint64_t a1, void *a2)
{
  RTTConversation *v3;
  RTTConversation *v4;
  RTTConversation *v5;

  v3 = a2;
  if (!v3)
  {
    v4 = objc_alloc_init(RTTConversation);
    -[RTTConversation setCallIdentifier:](v4, "setCallIdentifier:", *(_QWORD *)(a1 + 32));
    v3 = v4;
  }
  v5 = v3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (RTTConversation)conversationWithCall:(id)a3 withCallback:(id)a4
{
  id v6;
  RTTConversation *result;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "callUUID");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "conversationWithCallUID:withCallback:", v8, v6);

  return result;
}

+ (RTTConversation)conversationWithCall:(id)a3
{
  id v3;
  RTTConversation *v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x24BE4BD98], "currentProcessIsHeard") & 1) == 0 && !_AXSInUnitTestMode())
    +[RTTConversation conversationWithCall:].cold.1();
  v4 = objc_alloc_init(RTTConversation);
  objc_msgSend(v3, "callUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTConversation setCallIdentifier:](v4, "setCallIdentifier:", v5);

  -[RTTConversation setCall:](v4, "setCall:", v3);
  return v4;
}

+ (RTTConversation)conversationWithID:(id)a3 andUtterances:(id)a4
{
  id v5;
  id v6;
  RTTConversation *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(RTTConversation);
  -[RTTConversation setCallIdentifier:](v7, "setCallIdentifier:", v6);

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTTConversation setUtterances:](v7, "setUtterances:", v8);
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTTConversation)initWithCoder:(id)a3
{
  id v4;
  RTTConversation *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RTTConversation;
  v5 = -[RTTConversation init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RTTConversationCallIdentifierKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTConversation setCallIdentifier:](v5, "setCallIdentifier:", v6);

    v7 = (void *)MEMORY[0x24BDBCF20];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("RTTConversationUtterancesKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTConversation setUtterances:](v5, "setUtterances:", v10);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[RTTConversation utterances](self, "utterances");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("RTTConversationUtterancesKey"));

  -[RTTConversation callIdentifier](self, "callIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("RTTConversationCallIdentifierKey"));

}

- (RTTConversation)init
{
  RTTConversation *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTTConversation;
  v2 = -[RTTConversation init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTConversation setUtterances:](v2, "setUtterances:", v3);

  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "callIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTConversation callIdentifier](self, "callIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqualToConversation:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  BOOL v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v5 = 0;
  if (-[RTTConversation isEqual:](self, "isEqual:", v4))
  {
    -[RTTConversation utterances](self, "utterances");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    objc_msgSend(v4, "utterances");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7 == objc_msgSend(v8, "count");

  }
  v18 = v5;
  if (*((_BYTE *)v16 + 24))
  {
    -[RTTConversation utterances](self, "utterances");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __41__RTTConversation_isEqualToConversation___block_invoke;
    v12[3] = &unk_24D204808;
    v14 = &v15;
    v13 = v4;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

    v10 = *((_BYTE *)v16 + 24) != 0;
  }
  else
  {
    v10 = 0;
  }
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __41__RTTConversation_isEqualToConversation___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "utterances");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqual:", v10);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v11;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^ 1;
}

- (id)otherContactPath
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  id v20;
  _QWORD v22[5];
  _QWORD v23[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__3;
  v34 = __Block_byref_object_dispose__3;
  v35 = 0;
  -[RTTConversation callIdentifier](self, "callIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") == 0;

  if (!v4)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__3;
    v28 = __Block_byref_object_dispose__3;
    v29 = 0;
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __35__RTTConversation_otherContactPath__block_invoke;
    v23[3] = &unk_24D2043C0;
    v23[4] = self;
    v23[5] = &v24;
    +[RTTTelephonyUtilities performCallCenterTask:](RTTTelephonyUtilities, "performCallCenterTask:", v23);
    v5 = (void *)v25[5];
    if (v5)
    {
      objc_msgSend(v5, "handle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)v25[5], "isoCountryCode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEB4A20], "phoneNumberWithDigits:countryCode:", v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "unformattedInternationalRepresentation");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v31[5];
      v31[5] = v10;

      if (!v31[5])
      {
        objc_msgSend(v9, "formattedRepresentation");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v31[5];
        v31[5] = v12;

        AXLogRTT();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = v31[5];
          *(_DWORD *)buf = 138412290;
          v37 = v15;
          _os_log_impl(&dword_21473C000, v14, OS_LOG_TYPE_INFO, "Using non-international phone number: %@", buf, 0xCu);
        }

      }
    }
    _Block_object_dispose(&v24, 8);

  }
  if (!v31[5])
  {
    -[RTTConversation utterances](self, "utterances");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __35__RTTConversation_otherContactPath__block_invoke_16;
    v22[3] = &unk_24D204830;
    v22[4] = &v30;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v22);

  }
  if (_AXSInUnitTestMode())
  {
    -[RTTConversation call](self, "call");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = v31[5] == 0;

      if (v18)
      {
        v19 = (void *)v31[5];
        v31[5] = (uint64_t)CFSTR("Unknown");

      }
    }
  }
  v20 = (id)v31[5];
  _Block_object_dispose(&v30, 8);

  return v20;
}

void __35__RTTConversation_otherContactPath__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  +[RTTTelephonyUtilities sharedCallCenter](RTTTelephonyUtilities, "sharedCallCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "callIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "callWithCallUUID:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __35__RTTConversation_otherContactPath__block_invoke_16(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if ((objc_msgSend(v9, "isMe") & 1) == 0)
  {
    objc_msgSend(v9, "contactPath");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    *a4 = 1;
  }

}

- (id)mergeUtterancesIfPossible
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  unint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  int v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[RTTConversation utterances](self, "utterances");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4;
  -[RTTConversation utterances](self, "utterances");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = v5;
  if (v7 >= 2)
  {
    -[RTTConversation utterances](self, "utterances");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTConversation utterances](self, "utterances");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v10, "count") - 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "contactPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByAppendingString:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTTUtterance utteranceWithContactPath:andText:](RTTUtterance, "utteranceWithContactPath:andText:", v12, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    AXLogRTT();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v26 = 138412290;
      v27 = v16;
      _os_log_impl(&dword_21473C000, v17, OS_LOG_TYPE_INFO, "Testing complete %@", (uint8_t *)&v26, 0xCu);
    }

    v18 = objc_msgSend(v11, "isMe");
    v8 = v5;
    if (v18 == objc_msgSend(v5, "isMe"))
    {
      v8 = v5;
      if (objc_msgSend(v11, "isComplete"))
      {
        v8 = v5;
        if (objc_msgSend(v16, "isComplete"))
        {
          AXLogRTT();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            LOWORD(v26) = 0;
            _os_log_impl(&dword_21473C000, v19, OS_LOG_TYPE_INFO, "Merging", (uint8_t *)&v26, 2u);
          }

          objc_msgSend(v11, "text");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "text");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringByAppendingString:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "updateText:", v22);

          -[RTTConversation utterances](self, "utterances");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "removeObject:", v5);

          v8 = v11;
        }
      }
    }

  }
  AXLogRTT();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v26 = 138412290;
    v27 = v8;
    _os_log_impl(&dword_21473C000, v24, OS_LOG_TYPE_INFO, "Utterance merge result: %@", (uint8_t *)&v26, 0xCu);
  }

  return v8;
}

- (void)addUtterance:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  -[RTTConversation lastUtteranceForMe:isTranscription:](self, "lastUtteranceForMe:isTranscription:", 1, objc_msgSend(v14, "isTranscription"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length") == 1)
  {
    objc_msgSend(v14, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "characterAtIndex:", 0);

    if (v7 == 8)
    {
      v8 = -[RTTConversation processBackspaceForMe:](self, "processBackspaceForMe:", 1);
      goto LABEL_9;
    }
  }
  else
  {

  }
  if (!objc_msgSend(v4, "isMe")
    || (objc_msgSend(v4, "isComplete") & 1) != 0
    || (objc_msgSend(v4, "hasTimedOut") & 1) != 0)
  {
    -[RTTConversation utterances](self, "utterances");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v14);

  }
  else
  {
    objc_msgSend(v4, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateText:", v12);

    v13 = -[RTTConversation mergeUtterancesIfPossible](self, "mergeUtterancesIfPossible");
  }
LABEL_9:

}

- (id)appendCharacter:(unsigned __int16)a3
{
  void *v4;
  void *v5;
  unsigned __int16 v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTConversation appendStringFromOtherContactPath:](self, "appendStringFromOtherContactPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)appendStringFromOtherContactPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v4 = a3;
  -[RTTConversation lastUtteranceForMe:](self, "lastUtteranceForMe:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "characterAtIndex:", 0);
  if ((_DWORD)v6 == 8)
  {
    -[RTTConversation processBackspaceForMe:](self, "processBackspaceForMe:", 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v5
      || (v8 = v6, (objc_msgSend(v5, "isMe") & 1) != 0)
      || (objc_msgSend(v5, "hasTimedOut") & 1) != 0
      || objc_msgSend(v5, "isComplete")
      && (objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "characterIsMember:", v8),
          v9,
          !v10))
    {
      -[RTTConversation otherContactPath](self, "otherContactPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTTUtterance utteranceWithContactPath:andText:](RTTUtterance, "utteranceWithContactPath:andText:", v13, v4);
      v14 = objc_claimAutoreleasedReturnValue();

      -[RTTConversation utterances](self, "utterances");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v14);
      v5 = (void *)v14;
    }
    else
    {
      objc_msgSend(v5, "text");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByAppendingString:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "updateText:", v12);

    }
    v7 = v5;
    v5 = v7;
  }

  return v7;
}

- (id)addTranscriptionFromOtherContactPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[RTTConversation otherContactPath](self, "otherContactPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTTUtterance utteranceWithContactPath:andText:isTranscription:](RTTUtterance, "utteranceWithContactPath:andText:isTranscription:", v5, v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTTConversation utterances](self, "utterances");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v6);

  return v6;
}

- (id)updateTranscriptionFromOtherContactPath:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[RTTConversation lastUtteranceForMe:isTranscription:](self, "lastUtteranceForMe:isTranscription:", 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateText:", v4);

  return v5;
}

- (id)processBackspaceForMe:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v3 = a3;
  -[RTTConversation lastUtteranceForMe:](self, "lastUtteranceForMe:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8)
    {
      objc_msgSend(v6, "text");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length") - 1;

      objc_msgSend(v6, "text");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "length");

      if (v12 < 2)
      {
        v17 = 1;
      }
      else
      {
        objc_msgSend(v6, "text");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "text");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "substringFromIndex:", objc_msgSend(v14, "length") - 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v15, "isEqualToString:", CFSTR("\r\n")))
        {
          objc_msgSend(v6, "text");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v16, "length") - 2;

          v17 = 2;
        }
        else
        {
          v17 = 1;
        }

      }
      objc_msgSend(v6, "text");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringByReplacingCharactersInRange:withString:", v10, v17, &stru_24D204B08);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "updateText:", v19);
    }
  }
  -[RTTConversation utterances](self, "utterances");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v20, "count"))
    goto LABEL_14;
  objc_msgSend(v6, "text");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "length");

  if (v6 && !v22)
  {
    -[RTTConversation utterances](self, "utterances");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "removeObject:", v6);

    -[RTTConversation lastUtteranceForMe:](self, "lastUtteranceForMe:", v3);
    v20 = v6;
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  }
  return v6;
}

- (id)lastUtteranceForMe:(BOOL)a3
{
  return -[RTTConversation lastUtteranceForMe:isTranscription:](self, "lastUtteranceForMe:isTranscription:", a3, 0);
}

- (id)lastUtteranceForMe:(BOOL)a3 isTranscription:(BOOL)a4
{
  void *v6;
  id v7;
  _QWORD v9[5];
  BOOL v10;
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = 0;
  -[RTTConversation utterances](self, "utterances");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54__RTTConversation_lastUtteranceForMe_isTranscription___block_invoke;
  v9[3] = &unk_24D204858;
  v10 = a3;
  v11 = a4;
  v9[4] = &v12;
  objc_msgSend(v6, "enumerateObjectsWithOptions:usingBlock:", 2, v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __54__RTTConversation_lastUtteranceForMe_isTranscription___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (*(unsigned __int8 *)(a1 + 40) == objc_msgSend(v7, "isMe")
    && *(unsigned __int8 *)(a1 + 41) == objc_msgSend(v7, "isTranscription"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (unint64_t)lastUtteranceIndexForMe:(BOOL)a3 isTranscription:(BOOL)a4
{
  void *v6;
  unint64_t v7;
  _QWORD v9[4];
  BOOL v10;
  BOOL v11;

  -[RTTConversation utterances](self, "utterances");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __59__RTTConversation_lastUtteranceIndexForMe_isTranscription___block_invoke;
  v9[3] = &__block_descriptor_34_e29_B32__0__RTTUtterance_8Q16_B24l;
  v10 = a3;
  v11 = a4;
  v7 = objc_msgSend(v6, "indexOfObjectWithOptions:passingTest:", 2, v9);

  return v7;
}

uint64_t __59__RTTConversation_lastUtteranceIndexForMe_isTranscription___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;

  v6 = a2;
  if (*(unsigned __int8 *)(a1 + 32) == objc_msgSend(v6, "isMe")
    && *(unsigned __int8 *)(a1 + 33) == objc_msgSend(v6, "isTranscription"))
  {
    v7 = 1;
    *a4 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)utteranceCountForMe:(BOOL)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  _QWORD v8[4];
  BOOL v9;

  -[RTTConversation utterances](self, "utterances");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __39__RTTConversation_utteranceCountForMe___block_invoke;
  v8[3] = &__block_descriptor_33_e29_B32__0__RTTUtterance_8Q16_B24l;
  v9 = a3;
  objc_msgSend(v4, "indexesOfObjectsPassingTest:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "count");
  return v6;
}

uint64_t __39__RTTConversation_utteranceCountForMe___block_invoke(uint64_t a1, void *a2)
{
  _BOOL4 v2;

  v2 = *(_BYTE *)(a1 + 32) == 0;
  return objc_msgSend(a2, "isMe") ^ v2;
}

- (void)cleanup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;

  -[RTTConversation utterances](self, "utterances");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexesOfObjectsPassingTest:", &__block_literal_global_7);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[RTTConversation utterances](self, "utterances");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectsAtIndexes:", v11);

  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTConversation utterances](self, "utterances");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  -[RTTConversation utterances](self, "utterances");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __26__RTTConversation_cleanup__block_invoke_2;
  v12[3] = &unk_24D2048E0;
  v13 = v5;
  v14 = v7;
  v12[4] = self;
  v9 = v5;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);

  -[RTTConversation utterances](self, "utterances");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectsAtIndexes:", v9);

}

BOOL __26__RTTConversation_cleanup__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length") == 0;

  return v5;
}

void __26__RTTConversation_cleanup__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  if ((unint64_t)(a3 + 1) >= *(_QWORD *)(a1 + 48))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "utterances");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", a3 + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      if ((objc_msgSend(v11, "isComplete") & 1) == 0)
      {
        v7 = objc_msgSend(v11, "isMe");
        if (v7 == objc_msgSend(v6, "isMe"))
        {
          objc_msgSend(v11, "text");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "text");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "stringByAppendingString:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "updateText:", v10);

          objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
        }
      }
    }
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)RTTConversation;
  -[RTTConversation description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTConversation callIdentifier](self, "callIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTConversation utterances](self, "utterances");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@ [%ld]"), v4, v5, objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)callIdentifier
{
  return self->_callIdentifier;
}

- (void)setCallIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_callIdentifier, a3);
}

- (NSMutableArray)utterances
{
  return self->_utterances;
}

- (void)setUtterances:(id)a3
{
  objc_storeStrong((id *)&self->_utterances, a3);
}

- (TUCall)call
{
  return self->_call;
}

- (void)setCall:(id)a3
{
  objc_storeStrong((id *)&self->_call, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_call, 0);
  objc_storeStrong((id *)&self->_utterances, 0);
  objc_storeStrong((id *)&self->_callIdentifier, 0);
}

+ (void)conversationWithCall:.cold.1()
{
  __assert_rtn("+[RTTConversation conversationWithCall:]", "RTTConversation.m", 75, "[HCUtilities currentProcessIsHeard] || _AXSInUnitTestMode()");
}

@end
