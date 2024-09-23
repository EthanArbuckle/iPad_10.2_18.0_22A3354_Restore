@implementation UIAlertView(KNAdditions)

- (void)initWithError:()KNAdditions
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(a3, "localizedRecoverySuggestion");
  if (!v5)
    v5 = objc_msgSend(a3, "localizedFailureReason");
  v6 = (void *)objc_msgSend(a1, "initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:", objc_msgSend(a3, "localizedDescription"), v5, 0, 0, 0);
  v7 = (void *)objc_msgSend(a3, "localizedRecoveryOptions");
  if (v7 && (v8 = v7, objc_msgSend(v7, "count")))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v6, "addButtonWithTitle:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }
  }
  else
  {
    objc_msgSend(v6, "addButtonWithTitle:", objc_msgSend((id)TSKBundle(), "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24D82FEB0, CFSTR("TSKit")));
  }
  return v6;
}

- (uint64_t)showWithCompletionHandler:()KNAdditions
{
  TSKUIAlertViewCompletionHandlerDelegate *v5;
  _QWORD v7[7];

  v5 = objc_alloc_init(TSKUIAlertViewCompletionHandlerDelegate);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__UIAlertView_KNAdditions__showWithCompletionHandler___block_invoke;
  v7[3] = &unk_24D82AB48;
  v7[5] = v5;
  v7[6] = a3;
  v7[4] = a1;
  -[TSKUIAlertViewCompletionHandlerDelegate setCompletionHandler:](v5, "setCompletionHandler:", v7);
  objc_msgSend(a1, "setDelegate:", v5);
  return objc_msgSend(a1, "show");
}

@end
