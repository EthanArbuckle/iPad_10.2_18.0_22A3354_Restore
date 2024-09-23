@implementation WFAskParameterDialogRequest(Parameter)

+ (uint64_t)dialogComponentStyleForParameter:()Parameter
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, v7, objc_opt_class(), 0);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        if ((objc_msgSend((id)objc_opt_class(), "isSubclassOfClass:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12)) & 1) != 0)
        {

          v13 = 1;
          goto LABEL_13;
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = objc_msgSend(v3, "liveUpdatesPossibleStatesInEditor");
  else
    v13 = 0;
LABEL_13:

  return v13;
}

@end
