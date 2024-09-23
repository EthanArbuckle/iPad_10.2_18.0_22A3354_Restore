@implementation NSPersistentHistoryTransaction(PhotoLibraryServices)

- (id)_pl_prettyDescriptionWithIndent:()PhotoLibraryServices
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  void *v15;
  void *v17;

  objc_msgSend(a1, "author");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPersistentHistoryTransactionModifiers transactionModifiersFromTransactionAuthor:](PLPersistentHistoryTransactionModifiers, "transactionModifiersFromTransactionAuthor:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0CB3940];
  PLIndentToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "transactionNumber");
  objc_msgSend(a1, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PLDateToISO8160StringWithLocalTimeZone(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "processID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "contextName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "author");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "changeSource");
  PLStringFromXPCChangeSource();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v3, "syncChangeMarker");
  v14 = CFSTR("NO");
  if (v13)
    v14 = CFSTR("YES");
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%@Transaction %08lld: %@ process=%@ (%@) context=%@ author=%@ (changeSource=%@ isSyncableChange=%@)\n"), v4, v5, v7, v8, v9, v10, v11, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
