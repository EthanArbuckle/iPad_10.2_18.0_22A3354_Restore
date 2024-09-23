@implementation SPCalculatorQuery

+ (unsigned)searchDomain
{
  return 3;
}

+ (BOOL)isQuerySupported:(unint64_t)a3
{
  return (enableCalculator | enableConversion) != 0;
}

+ (void)enableConversion:(BOOL)a3
{
  enableConversion = a3;
}

+ (void)enableCalculator:(BOOL)a3
{
  enableCalculator = a3;
}

- (SPCalculatorQuery)initWithUserQuery:(id)a3 queryGroupId:(unint64_t)a4 options:(unint64_t)a5 queryContext:(id)a6
{
  SPCalculatorQuery *v6;
  qos_class_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SPCalculatorQuery;
  v6 = -[SPKQuery initWithUserQuery:queryGroupId:options:queryContext:](&v12, sel_initWithUserQuery_queryGroupId_options_queryContext_, a3, a4, 0, a6);
  if (v6)
  {
    v7 = qos_class_self();
    dispatch_get_global_queue(v7, 2uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create_with_target_V2("Calculator", 0, v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

  }
  return v6;
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *queue;
  id v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SPCalculatorQuery;
  -[SPKQuery start](&v19, sel_start);
  if (!-[SPKQuery sendEmptyResponseIfNecessary](self, "sendEmptyResponseIfNecessary"))
  {
    -[SPKQuery userQueryString](self, "userQueryString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPKQuery queryContext](self, "queryContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPKQuery delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "queryIdent");
    objc_msgSend(v5, "clientBundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84FE0]), "initWithInput:triggerEvent:indexType:queryId:", v3, objc_msgSend(v4, "whyQuery"), 2, v6);
    objc_msgSend(MEMORY[0x24BE84978], "sharedProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendFeedbackType:feedback:queryId:clientID:", 5, v8, v6, v7);

    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __26__SPCalculatorQuery_start__block_invoke;
    block[3] = &unk_24F01AF88;
    block[4] = self;
    v15 = v3;
    v17 = v7;
    v18 = v6;
    v16 = v8;
    v11 = v7;
    v12 = v8;
    v13 = v3;
    dispatch_async(queue, block);

  }
}

void __26__SPCalculatorQuery_start__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27[2];
  id location;
  _QWORD v29[7];
  _QWORD v30[8];

  v30[7] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setUsesGroupingSeparator:", 1);
  objc_msgSend(v2, "setMaximumIntegerDigits:", 20);
  objc_msgSend(v2, "setMaximumFractionDigits:", 10);
  objc_msgSend(v2, "setNumberStyle:", 1);
  v3 = MEMORY[0x24BDBD1C8];
  v4 = *MEMORY[0x24BE128A0];
  v29[0] = *MEMORY[0x24BE12878];
  v29[1] = v4;
  v30[0] = MEMORY[0x24BDBD1C8];
  v30[1] = v2;
  v29[2] = *MEMORY[0x24BE12868];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", enableConversion);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v5;
  v6 = *MEMORY[0x24BE12888];
  v29[3] = *MEMORY[0x24BE12880];
  v29[4] = v6;
  v30[3] = v3;
  v30[4] = v3;
  v7 = *MEMORY[0x24BE12870];
  v29[5] = *MEMORY[0x24BE12898];
  v29[6] = v7;
  v30[5] = v3;
  v30[6] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  location = 0;
  v9 = (id *)(a1 + 32);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v19 = MEMORY[0x24BDAC760];
  v20 = 3221225472;
  v21 = __26__SPCalculatorQuery_start__block_invoke_2;
  v22 = &unk_24F01AF60;
  objc_copyWeak(v27, &location);
  v10 = *(id *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 32);
  v23 = v10;
  v24 = v11;
  v12 = *(id *)(a1 + 48);
  v14 = *(void **)(a1 + 56);
  v13 = *(void **)(a1 + 64);
  v25 = v12;
  v27[1] = v13;
  v26 = v14;
  v15 = (void *)MEMORY[0x22E2A214C](&v19);
  v16 = (void *)MEMORY[0x24BE128B8];
  objc_msgSend(*v9, "userQueryString", v19, v20, v21, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v16, "evaluate:options:resultHandler:", v17, v8, v15);

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);

}

void __26__SPCalculatorQuery_start__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  const __CFString *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void (**v42)(_QWORD, _QWORD);
  void *v43;
  void *v44;
  uint64_t v45;
  char v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    objc_msgSend(v3, "formattedResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      v6 = objc_msgSend(v3, "isTrivial");

      if ((v6 & 1) == 0)
      {
        v7 = objc_alloc_init(MEMORY[0x24BDD16F0]);
        objc_msgSend(MEMORY[0x24BDBCEA0], "systemLocale");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setLocale:", v8);

        objc_msgSend(v7, "setNumberStyle:", 1);
        objc_msgSend(v7, "setMaximumFractionDigits:", 10);
        objc_msgSend(v3, "formattedResult");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "numberFromString:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "numberFromString:", *(_QWORD *)(a1 + 32));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "formattedResult");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0
          || (objc_msgSend(v10, "isEqual:", v11) & 1) != 0)
        {

LABEL_7:
          objc_msgSend(WeakRetained, "responseHandler");
          v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v13[2](v13, 0);

LABEL_8:
LABEL_11:

          goto LABEL_12;
        }
        v14 = objc_msgSend(*(id *)(a1 + 32), "length");

        if (v14 < 2)
          goto LABEL_7;
        v15 = objc_msgSend(v3, "unitType");
        objc_msgSend(v3, "conversions");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v10;
        if (objc_msgSend(v16, "count"))
        {

        }
        else
        {
          objc_msgSend(v3, "inputValueAndUnit");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v17)
          {
            v19 = 1;
            goto LABEL_18;
          }
        }
        v18 = (void *)objc_opt_new();
        objc_msgSend(v18, "setNumberStyle:", 1);
        objc_msgSend(v18, "setUsesGroupingSeparator:", 1);
        objc_msgSend(v18, "setMaximumFractionDigits:", 2);
        objc_msgSend(v3, "setNumberFormatter:", v18);

        v19 = 0;
LABEL_18:
        v20 = (void *)objc_opt_new();
        objc_msgSend(v20, "beginDictionary");
        objc_msgSend(v3, "formattedExpression");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "encodeObject:withKey:", v21, CFSTR("SSAttributeCalculatorInput"));

        objc_msgSend(v3, "formattedResult");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v20;
        objc_msgSend(v20, "encodeObject:withKey:", v22, CFSTR("SSAttributeCalculatorOutput"));

        if (v19)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "encodeObject:withKey:", v23, CFSTR("SSAttributeIsCalculation"));

        }
        LODWORD(v45) = v19;
        if (v15 == 16)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "encodeObject:withKey:", v24, CFSTR("SSAttributeIsCurrencyConversion"));

        }
        objc_msgSend(v20, "endDictionary", v45);
        v25 = objc_alloc_init(MEMORY[0x24BE84948]);
        objc_msgSend(*(id *)(a1 + 40), "queryContext");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "getTrimmedSearchString");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("calculation-"), "stringByAppendingString:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setIdentifier:", v28);

        objc_msgSend(*(id *)(a1 + 40), "queryContext");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setQueryId:", objc_msgSend(v29, "queryIdent"));

        objc_msgSend(v25, "setUserInput:", *(_QWORD *)(a1 + 32));
        objc_msgSend(v25, "setPlacement:", 3);
        objc_msgSend(v25, "setScore:", 9, 0);
        objc_msgSend(v20, "data");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v30, "copy");
        objc_msgSend(v25, "setAttributeData:", v31);

        objc_msgSend(v25, "setSectionBundleIdentifier:", *MEMORY[0x24BEB0368]);
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if ((v46 & 1) != 0)
        {
          objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("CALCULATION_SECTION_TITLE"), &stru_24F01C208, CFSTR("SpotlightServices"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setSectionHeader:", v34);

          v35 = SSSetTopHitWithReasonString();
          v36 = CFSTR("com.apple.calculation");
        }
        else
        {
          objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("CONVERSION_SECTION_TITLE"), &stru_24F01C208, CFSTR("SpotlightServices"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setSectionHeader:", v37);

          v35 = SSSetTopHitWithReasonString();
          v36 = CFSTR("com.apple.conversion");
        }
        objc_msgSend(v25, "setTopHit:", v35);
        v38 = objc_alloc_init(MEMORY[0x24BEB0250]);
        objc_msgSend(v38, "setBundleIdentifier:", v36);
        objc_msgSend(v25, "sectionHeader");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setTitle:", v39);

        v51[0] = v25;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setResults:", v40);

        v50 = v38;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v50, 1);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0260]), "initWithQueryID:sections:", objc_msgSend(*(id *)(a1 + 40), "queryGroupId"), v47);
        objc_msgSend(v41, "setTopHitIsIn:", 1);
        objc_msgSend(WeakRetained, "responseHandler");
        v42 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v42)[2](v42, v41);

        v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84E20]), "initWithStartSearch:", *(_QWORD *)(a1 + 48));
        objc_msgSend(MEMORY[0x24BE84978], "sharedProxy");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "sendFeedbackType:feedback:queryId:clientID:", 6, v43, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56));

        v10 = v48;
        goto LABEL_8;
      }
    }
    else
    {

    }
    objc_msgSend(WeakRetained, "responseHandler");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    goto LABEL_11;
  }
LABEL_12:

}

- (BOOL)isCalculatorQuery
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
