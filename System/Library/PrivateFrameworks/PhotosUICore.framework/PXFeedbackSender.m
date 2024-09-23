@implementation PXFeedbackSender

- (void)sendFeedback:(id)a3 forFeedbackType:(unint64_t)a4
{
  id v5;

  self->_feedbackType = a4;
  v5 = a3;
  self->_userLikedResults = objc_msgSend(v5, "userLikedResults");
  -[PXFeedbackSender _sendFeedbackEntryToOSService:](self, "_sendFeedbackEntryToOSService:", v5);

}

- (void)sendFeedbackToServer:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v4 = (void *)MEMORY[0x1E0C99E98];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), CFSTR("http://localhost:8888"), CFSTR("/ParseClientParams.php"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLWithString:", v7);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A8]), "initWithURL:", v22);
  objc_msgSend(v8, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v6, "systemID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v10, "setDateFormat:", CFSTR("yyyy-MM-dd_HHmmss.SSS"));
  objc_msgSend(v6, "timestamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("systemID=%@&timeStamp=%@&appVersion=%@"), v9, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedbackSender generateFeedbackParamsStringForEntry:](self, "generateFeedbackParamsStringForEntry:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "stringByAppendingString:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "dataUsingEncoding:", 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHTTPBody:", v17);

  v18 = (void *)MEMORY[0x1E0CB39F0];
  objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sessionWithConfiguration:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "dataTaskWithRequest:completionHandler:", v8, &__block_literal_global_103188);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "resume");

}

- (BOOL)sendFeedbackWithFeedbackEntryUUID:(id)a3
{
  NSLog(CFSTR("TODO: implement sendFeedbackWithFeedbackEntryUUID"), a2, a3);
  return 0;
}

- (BOOL)sendPendingFeedbackToServer
{
  NSLog(CFSTR("TODO: implement sendPendingFeedbackToServer"), a2);
  return 0;
}

- (void)testTalkToServer
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("http://localhost:8888/FeedbackTest/FeedbackSample.json"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:", v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB39F0];
  objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sessionWithConfiguration:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dataTaskWithRequest:completionHandler:", v2, &__block_literal_global_31);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resume");

}

- (id)generateFeedbackParamsStringForEntry:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  __CFString *v15;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__103161;
  v14 = __Block_byref_object_dispose__103162;
  v15 = CFSTR("&feedbackValues=");
  objc_msgSend(v3, "feedbackItemsDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__PXFeedbackSender_generateFeedbackParamsStringForEntry___block_invoke;
  v9[3] = &unk_1E513E2F0;
  v9[4] = &v10;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);

  if (objc_msgSend((id)v11[5], "hasSuffix:", CFSTR(",")))
  {
    objc_msgSend((id)v11[5], "substringToIndex:", objc_msgSend((id)v11[5], "length") - 1);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v11[5];
    v11[5] = v5;

  }
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = a4;
  v5 = objc_msgSend(v4, "statusCode");
  objc_msgSend(v4, "MIMEType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "lowercaseString");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  NSLog(CFSTR("response is %ld, %@"), v5, v7);
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a4;
  objc_msgSend(v4, "localizedDescription");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CB3300]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Connection failed! Error - %@ %@"), v7, v6);

}

- (void)_sendFeedbackEntryToOSService:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(v4, "feedbackItemsDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__PXFeedbackSender__sendFeedbackEntryToOSService___block_invoke;
  v7[3] = &unk_1E512C2A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void)_incrementAGGDCounterForFeedbackValueKey:(id)a3 ofEntry:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = a3;
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@"), CFSTR("com.apple.mobileslideshow.feedback"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    ADClientAddValueForScalarKey();
  }
}

void __50__PXFeedbackSender__sendFeedbackEntryToOSService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v5;
  void *v6;
  uint64_t v7;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = objc_msgSend(a3, "BOOLValue");
  v6 = v13;
  if (v5)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (v7 == 37 || v7 == 30)
    {
      if (objc_msgSend(v13, "isEqualToString:", kPXFeedbackUserLikedMemoriesKey))
      {
        v9 = *(void **)(a1 + 40);
        v10 = kPXFeedbackUserLikedCollectionKey;
      }
      else
      {
        v11 = objc_msgSend(v13, "isEqualToString:", kPXFeedbackUserDislikedMemoriesKey);
        v9 = *(void **)(a1 + 40);
        if (v11)
          v10 = kPXFeedbackUserDislikedCollectionKey;
        else
          v10 = (uint64_t)v13;
      }
    }
    else
    {
      v9 = *(void **)(a1 + 40);
      v10 = (uint64_t)v13;
    }
    objc_msgSend(v9, "osKeyForItemKey:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_incrementCounterForFeedbackValueKey:ofEntry:", v12, *(_QWORD *)(a1 + 40));

    v6 = v13;
  }

}

void __57__PXFeedbackSender_generateFeedbackParamsStringForEntry___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(a3, "BOOLValue"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "stringByAppendingFormat:", CFSTR("%@,"), v8);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

void __36__PXFeedbackSender_testTalkToServer__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;

  v2 = (objc_class *)MEMORY[0x1E0CB3940];
  v3 = a2;
  v4 = (id)objc_msgSend([v2 alloc], "initWithData:encoding:", v3, 1);

  NSLog(CFSTR("[NSURLSession]Server Response....:\n\n%@"), v4);
}

void __41__PXFeedbackSender_sendFeedbackToServer___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v6 = a3;
  if (a4)
  {
    NSLog(CFSTR("Server connection error: %@"), a4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (v7 = objc_msgSend(v6, "statusCode"), v7 != 200))
    {
      NSLog(CFSTR("dataTaskWithRequest HTTP status code: %ld"), v7);
    }
    else
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v9, 1);
      NSLog(CFSTR("[NSURLSession]Server Response....:\n\n%@"), v8);

    }
  }

}

@end
