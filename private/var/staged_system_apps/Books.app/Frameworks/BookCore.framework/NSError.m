@implementation NSError

- (void)logRecursively
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedDescription](self, "localizedDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedFailureReason](self, "localizedFailureReason"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedRecoverySuggestion](self, "localizedRecoverySuggestion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedRecoveryOptions](self, "localizedRecoveryOptions"));
  NSLog(CFSTR("NSError %@\n%@\n%@\n%@\n%@\n%@"), self, v4, v5, v6, v7, v3);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("NSDetailedErrors")));
  v9 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0 && objc_msgSend(v8, "count"))
  {
    NSLog(CFSTR("----------------------- Sub-errors: %03lu"), objc_msgSend(v8, "count"));
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v14);
          v16 = objc_opt_class(NSError);
          if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
            objc_msgSend(v15, "logRecursively");
          else
            NSLog(CFSTR("Not an NSError: %@"), v15);
          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

    NSLog(CFSTR("-----------------------"));
  }

}

@end
