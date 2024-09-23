@implementation RTLocationOfInterestTransition(RTExtensions)

- (uint64_t)initWithLearnedTransition:()RTExtensions
{
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0D183D0];
    v5 = a3;
    v6 = objc_msgSend(v4, "modeOfTransportationFromMotionActivityType:", objc_msgSend(v5, "predominantMotionActivityType"));
    v7 = objc_alloc(MEMORY[0x1E0D183D0]);
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visitIdentifierOrigin");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visitIdentifierDestination");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v7, "initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:modeOfTransportation:", v8, v9, v10, v11, v12, v6);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)locationOfInterestTransitionsFromLearnedTransitions:()RTExtensions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          v12 = objc_alloc(MEMORY[0x1E0D183D0]);
          v13 = (void *)objc_msgSend(v12, "initWithLearnedTransition:", v11, (_QWORD)v15);
          if (v13)
            objc_msgSend(v5, "addObject:", v13);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (uint64_t)modeOfTransportationFromMotionActivityType:()RTExtensions
{
  if ((unint64_t)(a3 - 2) > 3)
    return 0;
  else
    return qword_1D1EECD88[a3 - 2];
}

+ (uint64_t)motionActivityTypeFromModeOfTransportation:()RTExtensions
{
  if ((unint64_t)(a3 - 1) > 2)
    return 0;
  else
    return qword_1D1EECDA8[a3 - 1];
}

@end
