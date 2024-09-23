@implementation WBSCalculationResultProvider

- (WBSCalculationResultProvider)init
{
  WBSCalculationResultProvider *v2;
  id v3;
  const char *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *calculationQueue;
  uint64_t v8;
  NSSet *queryStringsToIgnore;
  NSArray *queryPrefixesToIgnore;
  uint64_t v11;
  NSDataDetector *phoneNumberDetector;
  WBSCalculationResultProvider *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WBSCalculationResultProvider;
  v2 = -[WBSCalculationResultProvider init](&v15, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.safarishared.%p"), v2);
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = (const char *)objc_msgSend(v3, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create(v4, v5);
    calculationQueue = v2->_calculationQueue;
    v2->_calculationQueue = (OS_dispatch_queue *)v6;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("ht"), CFSTR("htt"), CFSTR("ww"), 0);
    v8 = objc_claimAutoreleasedReturnValue();
    queryStringsToIgnore = v2->_queryStringsToIgnore;
    v2->_queryStringsToIgnore = (NSSet *)v8;

    queryPrefixesToIgnore = v2->_queryPrefixesToIgnore;
    v2->_queryPrefixesToIgnore = (NSArray *)&unk_1E4B875F8;

    *(_QWORD *)&v2->_queryLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3560], "dataDetectorWithTypes:error:", 2048, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    phoneNumberDetector = v2->_phoneNumberDetector;
    v2->_phoneNumberDetector = (NSDataDetector *)v11;

    v13 = v2;
  }

  return v2;
}

- (void)evaluateQuery:(id)a3 resultHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  CalculateRequest *currentCalculateRequest;
  void *v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  NSDataDetector *phoneNumberDetector;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *calculationQueue;
  _QWORD block[5];
  id v21;
  void (**v22)(id, _QWORD);
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  os_unfair_lock_lock(&self->_queryLock);
  os_unfair_lock_lock(&self->_calculateRequestLock);
  currentCalculateRequest = self->_currentCalculateRequest;
  if (currentCalculateRequest)
    -[CalculateRequest cancel](currentCalculateRequest, "cancel");
  os_unfair_lock_unlock(&self->_calculateRequestLock);
  objc_msgSend(v6, "queryString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safari_stringByTrimmingWhitespace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NSString isEqualToString:](self->_currentQueryString, "isEqualToString:", v10)
    || (unint64_t)objc_msgSend(v10, "length") < 2
    || -[NSSet containsObject:](self->_queryStringsToIgnore, "containsObject:", v10))
  {
    v7[2](v7, 0);
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = self->_queryPrefixesToIgnore;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v11);
          if (objc_msgSend(v10, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i)))
          {
            v7[2](v7, 0);

            goto LABEL_7;
          }
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v12)
          continue;
        break;
      }
    }

    phoneNumberDetector = self->_phoneNumberDetector;
    objc_msgSend(v6, "queryString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "queryString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[NSDataDetector numberOfMatchesInString:options:range:](phoneNumberDetector, "numberOfMatchesInString:options:range:", v16, 0, 0, objc_msgSend(v17, "length"));

    if (v18 || (unint64_t)(WBSUnifiedFieldInputTypeForString(v10) - 1) <= 1)
    {
      v7[2](v7, 0);
    }
    else
    {
      objc_storeStrong((id *)&self->_currentQueryString, v10);
      calculationQueue = self->_calculationQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __60__WBSCalculationResultProvider_evaluateQuery_resultHandler___block_invoke;
      block[3] = &unk_1E4B2A0F0;
      block[4] = self;
      v21 = v10;
      v22 = v7;
      dispatch_async(calculationQueue, block);

    }
  }
LABEL_7:

  os_unfair_lock_unlock(&self->_queryLock);
}

void __60__WBSCalculationResultProvider_evaluateQuery_resultHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD block[4];
  id v14;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  if ((objc_msgSend(v2, "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
    v3 = (void *)MEMORY[0x1E0D09EC0];
    v4 = *(_QWORD *)(a1 + 40);
    if (evaluationOptions_onceToken != -1)
      dispatch_once(&evaluationOptions_onceToken, &__block_literal_global_9);
    v5 = (void *)evaluationOptions_options;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__WBSCalculationResultProvider_evaluateQuery_resultHandler___block_invoke_3;
    v11[3] = &unk_1E4B2A730;
    v6 = &v12;
    v12 = *(id *)(a1 + 48);
    v7 = v5;
    objc_msgSend(v3, "evaluate:options:resultHandler:", v4, v7, v11);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 56);
    *(_QWORD *)(v9 + 56) = v8;

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__WBSCalculationResultProvider_evaluateQuery_resultHandler___block_invoke_2;
    block[3] = &unk_1E4B2A6E0;
    v6 = &v14;
    v14 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __60__WBSCalculationResultProvider_evaluateQuery_resultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__WBSCalculationResultProvider_evaluateQuery_resultHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__WBSCalculationResultProvider_evaluateQuery_resultHandler___block_invoke_4;
  v5[3] = &unk_1E4B2A708;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __60__WBSCalculationResultProvider_evaluateQuery_resultHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  WBSCalculationResult *v6;

  objc_msgSend(*(id *)(a1 + 32), "formattedResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "length"))
  {

    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "inputValueAndUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isTrivial") & 1) != 0)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "unitType");

    if (v4 == 16)
      goto LABEL_8;
LABEL_6:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    return;
  }

LABEL_8:
  v5 = *(_QWORD *)(a1 + 40);
  v6 = -[WBSCalculationResult initWithCalculateResult:]([WBSCalculationResult alloc], "initWithCalculateResult:", *(_QWORD *)(a1 + 32));
  (*(void (**)(uint64_t, WBSCalculationResult *))(v5 + 16))(v5, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCalculateRequest, 0);
  objc_storeStrong((id *)&self->_phoneNumberDetector, 0);
  objc_storeStrong((id *)&self->_calculationQueue, 0);
  objc_storeStrong((id *)&self->_queryPrefixesToIgnore, 0);
  objc_storeStrong((id *)&self->_queryStringsToIgnore, 0);
  objc_storeStrong((id *)&self->_currentQueryString, 0);
}

@end
