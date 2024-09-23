@implementation ODCurareCandidateModel

- (ODCurareCandidateModel)initWithModelURL:(id)a3 withBiomeStream:(id)a4 andMetadata:(id)a5
{
  return -[ODCurareCandidateModel initWithModelURL:withBiomeStream:withBiomeStreamIdentifier:withModelTag:andMetadata:](self, "initWithModelURL:withBiomeStream:withBiomeStreamIdentifier:withModelTag:andMetadata:", a3, a4, 0, 0, a5);
}

- (ODCurareCandidateModel)initWithModelURL:(id)a3 withBiomeStreamIdentifier:(id)a4 andMetadata:(id)a5
{
  return -[ODCurareCandidateModel initWithModelURL:withBiomeStream:withBiomeStreamIdentifier:withModelTag:andMetadata:](self, "initWithModelURL:withBiomeStream:withBiomeStreamIdentifier:withModelTag:andMetadata:", a3, 0, a4, 0, a5);
}

- (ODCurareCandidateModel)initWithModelURL:(id)a3 withCoreDuetStreamIdentifier:(id)a4 andMetadata:(id)a5
{
  return -[ODCurareCandidateModel initWithModelURL:withCoreDuetStream:withCoreDuetStreamIdentifier:withModelTag:andMetadata:](self, "initWithModelURL:withCoreDuetStream:withCoreDuetStreamIdentifier:withModelTag:andMetadata:", a3, 0, a4, 0, a5);
}

- (ODCurareCandidateModel)initWithModelURL:(id)a3 withCoreDuetStream:(id)a4 withCoreDuetStreamIdentifier:(id)a5 andMetadata:(id)a6
{
  return -[ODCurareCandidateModel initWithModelURL:withCoreDuetStream:withCoreDuetStreamIdentifier:withModelTag:andMetadata:](self, "initWithModelURL:withCoreDuetStream:withCoreDuetStreamIdentifier:withModelTag:andMetadata:", a3, a4, 0, 0, a6);
}

- (ODCurareCandidateModel)initWithModelURL:(id)a3 withBiomeStream:(id)a4 withBiomeStreamIdentifier:(id)a5 withModelTag:(id)a6 andMetadata:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  ODCurareCandidateModel *v17;
  ODCurareCandidateModel *v18;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = -[ODCurareCandidateModel init](self, "init");
  v18 = v17;
  if (v17)
  {
    -[ODCurareCandidateModel setModelTag:](v17, "setModelTag:", v15);
    -[ODCurareCandidateModel setModelURL:](v18, "setModelURL:", v12);
    -[ODCurareCandidateModel setModelConfiguration:](v18, "setModelConfiguration:", v16);
    -[ODCurareCandidateModel setBMModelDataStream:](v18, "setBMModelDataStream:", v13);
    -[ODCurareCandidateModel setBMModelDataStreamIdentifier:](v18, "setBMModelDataStreamIdentifier:", v14);
    -[ODCurareCandidateModel setCDModelDataStream:](v18, "setCDModelDataStream:", 0);
    -[ODCurareCandidateModel setCDModelDataStreamIdentifier:](v18, "setCDModelDataStreamIdentifier:", 0);
  }

  return v18;
}

- (ODCurareCandidateModel)initWithModelURL:(id)a3 withCoreDuetStream:(id)a4 withCoreDuetStreamIdentifier:(id)a5 withModelTag:(id)a6 andMetadata:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  ODCurareCandidateModel *v17;
  ODCurareCandidateModel *v18;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = -[ODCurareCandidateModel init](self, "init");
  v18 = v17;
  if (v17)
  {
    -[ODCurareCandidateModel setModelTag:](v17, "setModelTag:", v15);
    -[ODCurareCandidateModel setModelURL:](v18, "setModelURL:", v12);
    -[ODCurareCandidateModel setModelConfiguration:](v18, "setModelConfiguration:", v16);
    -[ODCurareCandidateModel setBMModelDataStream:](v18, "setBMModelDataStream:", 0);
    -[ODCurareCandidateModel setBMModelDataStreamIdentifier:](v18, "setBMModelDataStreamIdentifier:", 0);
    -[ODCurareCandidateModel setCDModelDataStream:](v18, "setCDModelDataStream:", v13);
    -[ODCurareCandidateModel setCDModelDataStreamIdentifier:](v18, "setCDModelDataStreamIdentifier:", v14);
  }

  return v18;
}

- (id)getDatesOfEventsForStream
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  void *context;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  _QWORD v42[4];
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[ODCurareCandidateModel BMModelDataStream](self, "BMModelDataStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

LABEL_4:
    -[ODCurareCandidateModel bmReceiveInputBlock](self, "bmReceiveInputBlock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[ODCurareCandidateModel BMModelDataStream](self, "BMModelDataStream");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        v8 = objc_alloc(MEMORY[0x24BE0CD88]);
        -[ODCurareCandidateModel BMModelDataStreamIdentifier](self, "BMModelDataStreamIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v8, "initWithPrivateStreamIdentifier:storeConfig:", v9, 0);
        -[ODCurareCandidateModel setBMModelDataStream:](self, "setBMModelDataStream:", v10);

      }
      -[ODCurareCandidateModel BMModelDataStream](self, "BMModelDataStream");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "publisher");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[ODCurareCandidateModel bmReceiveInputBlock](self, "bmReceiveInputBlock");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "filterWithIsIncluded:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v42[0] = MEMORY[0x24BDAC760];
      v42[1] = 3221225472;
      v42[2] = __51__ODCurareCandidateModel_getDatesOfEventsForStream__block_invoke_2;
      v42[3] = &unk_24EF8DDD0;
      v15 = v3;
      v43 = v15;
      v16 = (id)objc_msgSend(v14, "sinkWithCompletion:receiveInput:", &__block_literal_global, v42);
      v17 = v15;

      goto LABEL_10;
    }
    NSLog(CFSTR("[ODCurareCandidateModel getCountOfEventsForStream:] _bmReceiveInputBlock was nil when it should not be"));
LABEL_9:
    v17 = 0;
    goto LABEL_10;
  }
  -[ODCurareCandidateModel BMModelDataStreamIdentifier](self, "BMModelDataStreamIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_4;
  -[ODCurareCandidateModel CDModelDataStreamIdentifier](self, "CDModelDataStreamIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    NSLog(CFSTR("[ODCurareCandidateModel getCountOfEventsForStream:] Neither Biome nor CoreDuet stream specified, unexpected state."));
    goto LABEL_9;
  }
  -[ODCurareCandidateModel CDQuery](self, "CDQuery");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    NSLog(CFSTR("[ODCurareCandidateModel getCountOfEventsForStream:] CDQuery was nil when it should not be"));
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BE1B0B0], "knowledgeStore");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = 0;
  while (1)
  {
    v23 = (void *)MEMORY[0x2276B0034]();
    -[ODCurareCandidateModel CDQuery](self, "CDQuery");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copy");

    objc_msgSend(v25, "setLimit:", 20);
    objc_msgSend(v25, "setOffset:", v21);
    v41 = 0;
    objc_msgSend(v35, "executeQuery:error:", v25, &v41);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v41;
    if (v27)
    {
      v34 = v27;
      NSLog(CFSTR("[ODCurareCandidateModel getCountOfEventsForStream:] knowledgeStore executeQuery failed with error: %@"), v27);

      objc_autoreleasePoolPop(v23);
      v17 = 0;
      goto LABEL_30;
    }
    if (!objc_msgSend(v26, "count"))
      break;
    context = v23;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v28 = v26;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v38 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "startDate");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v33);

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
      }
      while (v30);
    }

    ++v22;
    objc_autoreleasePoolPop(context);
    v21 += 20;
    if (v22 == 100001)
      goto LABEL_29;
  }

  objc_autoreleasePoolPop(v23);
LABEL_29:
  v17 = v3;
LABEL_30:

LABEL_10:
  return v17;
}

void __51__ODCurareCandidateModel_getDatesOfEventsForStream__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(a2, "timestamp");
  objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

- (void)setStreamFilter:(id)a3 fromInclusive:(id)a4 toDate:(id)a5 toInclusive:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[ODCurareCandidateModel BMModelDataStream](self, "BMModelDataStream");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

LABEL_4:
    -[ODCurareCandidateModel _setBiomeFilter:fromInclusive:toDate:toInclusive:](self, "_setBiomeFilter:fromInclusive:toDate:toInclusive:", v17, v10, v11, v12);
    goto LABEL_5;
  }
  -[ODCurareCandidateModel BMModelDataStreamIdentifier](self, "BMModelDataStreamIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    goto LABEL_4;
  -[ODCurareCandidateModel CDModelDataStream](self, "CDModelDataStream");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {

  }
  else
  {
    -[ODCurareCandidateModel CDModelDataStreamIdentifier](self, "CDModelDataStreamIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      NSLog(&CFSTR("[ODCurareCandidateModel setStreamFilter:fromInclusive:toDate:toInclusive:] Neither Biome nor CoreDuet strea"
                   "m was set, unexpected state.").isa);
      goto LABEL_5;
    }
  }
  -[ODCurareCandidateModel _setCoreDuetQuery:fromInclusive:toDate:toInclusive:](self, "_setCoreDuetQuery:fromInclusive:toDate:toInclusive:", v17, v10, v11, v12);
LABEL_5:

}

- (BOOL)hasStreamFilter
{
  void *v3;
  BOOL v4;
  void *v5;

  -[ODCurareCandidateModel bmReceiveInputBlock](self, "bmReceiveInputBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[ODCurareCandidateModel CDQuery](self, "CDQuery");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (void)_setBiomeFilter:(id)a3 fromInclusive:(id)a4 toDate:(id)a5 toInclusive:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v15);

  v16 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v17);

  if (v11 && objc_msgSend(v11, "BOOLValue"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v18);

  }
  if (v13 && objc_msgSend(v13, "BOOLValue"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v19);

  }
  if (v10 && v12)
  {
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __75__ODCurareCandidateModel__setBiomeFilter_fromInclusive_toDate_toInclusive___block_invoke;
    v27[3] = &unk_24EF8DDF8;
    v28 = v10;
    v29 = v12;
    v30 = v14;
    v31 = v16;
    -[ODCurareCandidateModel setBmReceiveInputBlock:](self, "setBmReceiveInputBlock:", v27);

    v20 = v28;
  }
  else if (v10)
  {
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __75__ODCurareCandidateModel__setBiomeFilter_fromInclusive_toDate_toInclusive___block_invoke_2;
    v24[3] = &unk_24EF8DE20;
    v25 = v10;
    v26 = v14;
    -[ODCurareCandidateModel setBmReceiveInputBlock:](self, "setBmReceiveInputBlock:", v24);

    v20 = v25;
  }
  else
  {
    if (!v12)
    {
      NSLog(CFSTR("[ODCurareCandidateModel setCoreDuetQuery:fromDate:fromInclusive:toDate:toInclusive:] No dates were specified!"));
      -[ODCurareCandidateModel setBmReceiveInputBlock:](self, "setBmReceiveInputBlock:", &__block_literal_global_162);
      goto LABEL_15;
    }
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __75__ODCurareCandidateModel__setBiomeFilter_fromInclusive_toDate_toInclusive___block_invoke_3;
    v21[3] = &unk_24EF8DE20;
    v22 = v12;
    v23 = v16;
    -[ODCurareCandidateModel setBmReceiveInputBlock:](self, "setBmReceiveInputBlock:", v21);

    v20 = v22;
  }

LABEL_15:
}

BOOL __75__ODCurareCandidateModel__setBiomeFilter_fromInclusive_toDate_toInclusive___block_invoke(id *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a2, "timestamp");
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", objc_msgSend(a1[4], "compare:", v3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", objc_msgSend(a1[5], "compare:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1[6], "containsObject:", v4) && (objc_msgSend(a1[7], "containsObject:", v5) & 1) != 0;

  return v6;
}

uint64_t __75__ODCurareCandidateModel__setBiomeFilter_fromInclusive_toDate_toInclusive___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "timestamp");
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", objc_msgSend(*(id *)(a1 + 32), "compare:", v3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v4);

  return v5;
}

uint64_t __75__ODCurareCandidateModel__setBiomeFilter_fromInclusive_toDate_toInclusive___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "timestamp");
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", objc_msgSend(*(id *)(a1 + 32), "compare:", v3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v4);

  return v5;
}

uint64_t __75__ODCurareCandidateModel__setBiomeFilter_fromInclusive_toDate_toInclusive___block_invoke_4()
{
  return 1;
}

- (void)_setCoreDuetQuery:(id)a3 fromInclusive:(id)a4 toDate:(id)a5 toInclusive:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_opt_new();
  -[ODCurareCandidateModel CDModelDataStreamIdentifier](self, "CDModelDataStreamIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    NSLog(CFSTR("[ODCurareCandidateModel setCoreDuetQuery:fromDate:fromInclusive:toDate:toInclusive:] fromDate: %@, fromInclusive: %@, toDate: %@, toInclusive: %@"), v10, v11, v12, v13);
    v16 = (void *)MEMORY[0x24BE1B090];
    -[ODCurareCandidateModel CDModelDataStreamIdentifier](self, "CDModelDataStreamIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "eventStreamWithName:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v25[0] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setEventStreams:", v19);

    if (v10 && v12)
    {
      if (v11)
      {
        v20 = objc_msgSend(v11, "BOOLValue");
        if (v13 && v20 && objc_msgSend(v13, "BOOLValue"))
        {
          objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("((startDate >= %@) AND (startDate <= %@))"), v10, v12);
          goto LABEL_26;
        }
        if (objc_msgSend(v11, "BOOLValue"))
        {
          objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("((startDate >= %@) AND (startDate < %@))"), v10, v12);
          goto LABEL_26;
        }
      }
      if (v13 && objc_msgSend(v13, "BOOLValue"))
        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("((startDate > %@) AND (startDate <= %@))"), v10, v12);
      else
        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("((startDate > %@) AND (startDate < %@))"), v10, v12);
      goto LABEL_26;
    }
    if (v10)
    {
      if (v11 && objc_msgSend(v11, "BOOLValue"))
        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(startDate >= %@)"), v10, v24);
      else
        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(startDate > %@)"), v10, v24);
    }
    else
    {
      if (!v12)
      {
        NSLog(CFSTR("[ODCurareCandidateModel setCoreDuetQuery:fromDate:fromInclusive:toDate:toInclusive:] No dates were specified!"));
        objc_msgSend(v14, "setPredicate:", 0);
        goto LABEL_27;
      }
      if (v13 && objc_msgSend(v13, "BOOLValue"))
        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(startDate <= %@)"), v12, v24);
      else
        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(startDate < %@)"), v12, v24);
    }
LABEL_26:
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPredicate:", v21);

LABEL_27:
    objc_msgSend(v14, "predicate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "predicateFormat");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("[ODCurareCandidateModel setCoreDuetQuery:fromDate:fromInclusive:toDate:toInclusive:] Setting CoreDuet predicate %@"), v23);

    -[ODCurareCandidateModel setCDQuery:](self, "setCDQuery:", v14);
    goto LABEL_28;
  }
  NSLog(&CFSTR("[ODCurareCandidateModel setCoreDuetQuery:fromDate:fromInclusive:toDate:toInclusive:] ERROR: was called without "
               "CDModelDataStreamIdentifier being set!").isa);
LABEL_28:

}

- (id)description
{
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[ODCurareCandidateModel isDefaultModel](self, "isDefaultModel"))
    v3 = CFSTR("default");
  else
    v3 = CFSTR("not_default");
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[ODCurareCandidateModel modelURL](self, "modelURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODCurareCandidateModel modelTag](self, "modelTag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("ODCurareCandidateModel. modelURL: %@, modelTag: %@, isDefault: %@"), v5, v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void)setModelURL:(id)a3
{
  objc_storeStrong((id *)&self->_modelURL, a3);
}

- (NSString)modelTag
{
  return self->_modelTag;
}

- (void)setModelTag:(id)a3
{
  objc_storeStrong((id *)&self->_modelTag, a3);
}

- (MLModelConfiguration)modelConfiguration
{
  return self->_modelConfiguration;
}

- (void)setModelConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_modelConfiguration, a3);
}

- (BOOL)isDefaultModel
{
  return self->_isDefaultModel;
}

- (void)setIsDefaultModel:(BOOL)a3
{
  self->_isDefaultModel = a3;
}

- (BOOL)isPersonalizableModel
{
  return self->_isPersonalizableModel;
}

- (void)setIsPersonalizableModel:(BOOL)a3
{
  self->_isPersonalizableModel = a3;
}

- (BMStoreStream)BMModelDataStream
{
  return self->_BMModelDataStream;
}

- (void)setBMModelDataStream:(id)a3
{
  objc_storeStrong((id *)&self->_BMModelDataStream, a3);
}

- (NSString)BMModelDataStreamIdentifier
{
  return self->_BMModelDataStreamIdentifier;
}

- (void)setBMModelDataStreamIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_BMModelDataStreamIdentifier, a3);
}

- (id)bmReceiveInputBlock
{
  return self->_bmReceiveInputBlock;
}

- (void)setBmReceiveInputBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (_DKKnowledgeQuerying)CDModelDataStream
{
  return self->_CDModelDataStream;
}

- (void)setCDModelDataStream:(id)a3
{
  objc_storeStrong((id *)&self->_CDModelDataStream, a3);
}

- (NSString)CDModelDataStreamIdentifier
{
  return self->_CDModelDataStreamIdentifier;
}

- (void)setCDModelDataStreamIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_CDModelDataStreamIdentifier, a3);
}

- (id)CDQuery
{
  return self->_CDQuery;
}

- (void)setCDQuery:(id)a3
{
  objc_storeStrong(&self->_CDQuery, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_CDQuery, 0);
  objc_storeStrong((id *)&self->_CDModelDataStreamIdentifier, 0);
  objc_storeStrong((id *)&self->_CDModelDataStream, 0);
  objc_storeStrong(&self->_bmReceiveInputBlock, 0);
  objc_storeStrong((id *)&self->_BMModelDataStreamIdentifier, 0);
  objc_storeStrong((id *)&self->_BMModelDataStream, 0);
  objc_storeStrong((id *)&self->_modelConfiguration, 0);
  objc_storeStrong((id *)&self->_modelTag, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
}

@end
