@implementation SARecipe

- (_QWORD)initWithId:(void *)a1
{
  _QWORD *v3;
  _QWORD *v4;
  id v5;
  void *v6;
  objc_super v8;

  if (!a1)
    return 0;
  v8.receiver = a1;
  v8.super_class = (Class)SARecipe;
  v3 = objc_msgSendSuper2(&v8, sel_init);
  v4 = v3;
  if (v3)
  {
    v3[2] = a2;
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = (void *)v4[1];
    v4[1] = v5;

  }
  return v4;
}

- (uint64_t)addState:(_BYTE *)a3 hasConcurrentExecution:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v15;

  v5 = a2;
  if (a1)
  {
    if (a3)
    {
      objc_msgSend(*(id *)(a1 + 8), "lastObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "thread");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "thread");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 == v9)
        {
          v13 = 0;
        }
        else
        {
          objc_msgSend(v7, "threadState");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "endTimestamp");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "threadState");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "startTimestamp");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v10, "ge:", v12);

        }
      }
      else
      {
        v13 = 0;
      }
      *a3 = v13;

    }
    objc_msgSend(*(id *)(a1 + 8), "addObject:", v5);
    a1 = objc_msgSend(*(id *)(a1 + 8), "count") - 1;
  }

  return a1;
}

- (void)insertState:(_BYTE *)a3 hasConcurrentExecution:
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  _BYTE *v19;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 8), "addObject:", v5);
  objc_msgSend(*(id *)(a1 + 8), "sortUsingComparator:", &__block_literal_global_6);
  if (a3)
  {
    v19 = a3;
    v20 = v5;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    obj = *(id *)(a1 + 8);
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(0, "thread");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "thread");
          v12 = objc_claimAutoreleasedReturnValue();
          if (v11 == (void *)v12)
          {

          }
          else
          {
            v13 = (void *)v12;
            objc_msgSend(0, "threadState");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "endTimestamp");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "threadState");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "startTimestamp");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v15, "ge:", v17);

            if (v18)
            {
              *v19 = 1;
              goto LABEL_13;
            }
          }
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v7);
    }
LABEL_13:

    v5 = v20;
  }

}

uint64_t __47__SARecipe_insertState_hasConcurrentExecution___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "threadState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "startTimestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

- (uint64_t)addStates:(_BYTE *)a3 hasConcurrentExecution:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t result;
  int v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[16];

  v5 = a2;
  v6 = v5;
  if (!a1)
  {
LABEL_12:

    return a1;
  }
  if (objc_msgSend(v5, "count"))
  {
    if (a3)
    {
      objc_msgSend(*(id *)(a1 + 8), "lastObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "thread");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "thread");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9 == v11)
        {
          v15 = 0;
        }
        else
        {
          objc_msgSend(v8, "threadState");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "endTimestamp");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "firstObject");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "threadState");
          v28 = v9;
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "startTimestamp");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v26, "ge:", v14);

          v9 = v28;
        }

      }
      else
      {
        v15 = 0;
      }
      *a3 = v15;

    }
    objc_msgSend(*(id *)(a1 + 8), "addObjectsFromArray:", v6);
    a1 = objc_msgSend(*(id *)(a1 + 8), "count") - 1;
    goto LABEL_12;
  }
  v17 = *__error();
  _sa_logt();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1B9BE0000, v18, OS_LOG_TYPE_ERROR, "0 recipeStates.count", buf, 2u);
  }

  *__error() = v17;
  _SASetCrashLogMessage(3258, "0 recipeStates.count", v19, v20, v21, v22, v23, v24, v25);
  result = _os_crash();
  __break(1u);
  return result;
}

- (void)enumerateStatesBetweenStartTime:(unint64_t)a3 startSampleIndex:(void *)a4 endTime:(unint64_t)a5 endSampleIndex:(char)a6 reverseOrder:(void *)a7 block:
{
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t (**v20)(_QWORD, _QWORD);
  char v21;
  _QWORD v22[5];
  id v23;

  v13 = a2;
  v14 = a4;
  v15 = a7;
  if (a1)
  {
    v16 = -[SARecipe indexOfFirstStateOnOrAfterTime:sampleIndex:](a1, v13, a3);
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v17 = v16;
      v18 = -[SARecipe indexOfLastStateOnOrBeforeTime:sampleIndex:](a1, v14, a5);
      if (v18 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v19 = v18;
        if (v17 <= v18)
        {
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __103__SARecipe_enumerateStatesBetweenStartTime_startSampleIndex_endTime_endSampleIndex_reverseOrder_block___block_invoke;
          v22[3] = &unk_1E7148A90;
          v22[4] = a1;
          v23 = v15;
          v20 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1BCCCC450](v22);
          if ((a6 & 1) != 0)
          {
            do
            {
              if (v19 + 1 <= v17)
                break;
              v21 = v20[2](v20, v19--);
            }
            while ((v21 & 1) == 0);
          }
          else
          {
            do
            {
              if ((v20[2](v20, v17) & 1) != 0)
                break;
              ++v17;
            }
            while (v17 <= v19);
          }

        }
      }
    }
  }

}

- (uint64_t)indexOfFirstStateOnOrAfterTime:(unint64_t)a3 sampleIndex:
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  _QWORD v15[4];
  id v16;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    if (v5)
    {
      v7 = *(void **)(a1 + 8);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __55__SARecipe_indexOfFirstStateOnOrAfterTime_sampleIndex___block_invoke;
      v15[3] = &unk_1E7148B78;
      v16 = v5;
      v8 = SABinarySearchArray(v7, 1280, (uint64_t)v15);

    }
    else
    {
      v8 = 0;
    }
    if (a3 != 0x7FFFFFFFFFFFFFFFLL && v8 < objc_msgSend(*(id *)(a1 + 8), "count"))
    {
      do
      {
        objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "threadState");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "startSampleIndex") == 0x7FFFFFFFFFFFFFFFLL)
        {

        }
        else
        {
          objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "threadState");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "endSampleIndex");

          if (v13 >= a3)
            break;
        }
        ++v8;
      }
      while (v8 < objc_msgSend(*(id *)(a1 + 8), "count"));
    }
    if (v8 >= objc_msgSend(*(id *)(a1 + 8), "count"))
      a1 = 0x7FFFFFFFFFFFFFFFLL;
    else
      a1 = v8;
  }

  return a1;
}

- (uint64_t)indexOfLastStateOnOrBeforeTime:(unint64_t)a3 sampleIndex:
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  _QWORD v15[4];
  id v16;

  v5 = a2;
  if (!a1)
  {
    v8 = 0;
    goto LABEL_8;
  }
  if (!objc_msgSend(*(id *)(a1 + 8), "count"))
    goto LABEL_5;
  v6 = *(void **)(a1 + 8);
  if (v5)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __55__SARecipe_indexOfLastStateOnOrBeforeTime_sampleIndex___block_invoke;
    v15[3] = &unk_1E7148B78;
    v16 = v5;
    v7 = SABinarySearchArray(v6, 1536, (uint64_t)v15);

    if (!v7)
      goto LABEL_5;
  }
  else
  {
    v7 = objc_msgSend(*(id *)(a1 + 8), "count");
  }
  v8 = v7 - 1;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_8;
  while (1)
  {
    objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "threadState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "startSampleIndex") == 0x7FFFFFFFFFFFFFFFLL)
    {

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "threadState");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "startSampleIndex");

      if (v14 <= a3)
        goto LABEL_8;
    }
    if (!v8)
      break;
    --v8;
  }
LABEL_5:
  v8 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_8:

  return v8;
}

uint64_t __103__SARecipe_enumerateStatesBetweenStartTime_startSampleIndex_endTime_endSampleIndex_reverseOrder_block___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  unsigned __int8 v5;

  v5 = 0;
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectAtIndexedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, unsigned __int8 *))(v2 + 16))(v2, v3, &v5);

  return v5;
}

uint64_t __55__SARecipe_indexOfFirstStateOnOrAfterTime_sampleIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "threadState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "lt:", v6);

  if ((v4 & 1) != 0)
  {
    v7 = -1;
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v3, "threadState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endTimestamp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v8, "gt:", v10);

    v7 = v7;
  }

  return v7;
}

uint64_t __55__SARecipe_indexOfLastStateOnOrBeforeTime_sampleIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "threadState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "lt:", v6);

  if ((v4 & 1) != 0)
  {
    v7 = -1;
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v3, "threadState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endTimestamp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v8, "gt:", v10);

    v7 = v7;
  }

  return v7;
}

- (NSArray)states
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_states, 0);
}

@end
