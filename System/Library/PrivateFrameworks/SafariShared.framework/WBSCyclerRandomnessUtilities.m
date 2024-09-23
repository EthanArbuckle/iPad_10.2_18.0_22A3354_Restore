@implementation WBSCyclerRandomnessUtilities

+ (void)initialize
{
  double v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(a1, "setSeed:", (unint64_t)v3);
}

+ (unint64_t)seed
{
  return seed;
}

+ (void)setSeed:(unint64_t)a3
{
  seed = a3;
  objc_msgSend(a1, "reseed");
}

+ (void)reseed
{
  srand48(seed);
}

+ (unint64_t)randomIntegerWithUpperBound:(unint64_t)a3
{
  return lrand48() % a3;
}

+ (id)randomString
{
  return (id)objc_msgSend(a1, "randomStringWithMaximumLength:", 200);
}

+ (id)randomStringWithMaximumLength:(int64_t)a3
{
  return (id)objc_msgSend(a1, "_randomStringWithCharactersFromString:withMaximumLength:", CFSTR("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+\\/:\"'. "), a3);
}

+ (id)randomURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (objc_msgSend(a1, "randomIntegerWithUpperBound:", 5))
  {
    v3 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(a1, "randomElementOfArray:", &unk_1E4B87640);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_randomStringWithCharactersFromString:withMaximumLength:", CFSTR("abcdefghijklmnopqrstuvwxyz0123456789"), 200);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://%@.com/"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLWithString:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)randomElementOfArray:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(a1, "randomIntegerWithUpperBound:", objc_msgSend(v4, "count")));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)randomElementOfArray:(id)a3 relativeProbabilities:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  double v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  uint64_t *v18;
  double v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[3];
  double v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v29;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "doubleValue");
        v9 = v9 + v11;
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0.0;
  }
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0.0;
  v27 = drand48();
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__9;
  v24 = __Block_byref_object_dispose__9;
  v25 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__WBSCyclerRandomnessUtilities_randomElementOfArray_relativeProbabilities___block_invoke;
  v15[3] = &unk_1E4B389F0;
  v17 = v26;
  v12 = v6;
  v19 = v9;
  v16 = v12;
  v18 = &v20;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v15);
  v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(v26, 8);

  return v13;
}

void __75__WBSCyclerRandomnessUtilities_randomElementOfArray_relativeProbabilities___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v8;
  double v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24)
                                                              - v9 / *(double *)(a1 + 56);

  if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) <= 0.0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    *a4 = 1;
  }

}

+ (id)_randomStringWithCharactersFromString:(id)a3 withMaximumLength:(int64_t)a4
{
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v6 = a3;
  v7 = objc_msgSend(a1, "randomIntegerWithUpperBound:", a4);
  if (v7 <= 1)
    v8 = 1;
  else
    v8 = v7;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "length");
  do
  {
    objc_msgSend(v9, "appendFormat:", CFSTR("%C"), objc_msgSend(v6, "characterAtIndex:", objc_msgSend(a1, "randomIntegerWithUpperBound:", v10)));
    --v8;
  }
  while (v8);

  return v9;
}

@end
