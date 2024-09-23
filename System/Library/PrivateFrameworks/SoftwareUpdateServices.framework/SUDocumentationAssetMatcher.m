@implementation SUDocumentationAssetMatcher

+ (id)matcherForInstalledDocumentationFromAsset:(id)a3
{
  return -[SUDocumentationAssetMatcher initWithSoftwareUpdateAsset:limitingToStates:]([SUDocumentationAssetMatcher alloc], "initWithSoftwareUpdateAsset:limitingToStates:", a3, 4);
}

+ (id)matcherDocumentationFromAsset:(id)a3
{
  return -[SUDocumentationAssetMatcher initWithSoftwareUpdateAsset:]([SUDocumentationAssetMatcher alloc], "initWithSoftwareUpdateAsset:", a3);
}

- (SUDocumentationAssetMatcher)initWithSoftwareUpdateAsset:(id)a3
{
  return -[SUDocumentationAssetMatcher initWithSoftwareUpdateAsset:limitingToStates:](self, "initWithSoftwareUpdateAsset:limitingToStates:", a3, 0);
}

- (SUDocumentationAssetMatcher)initWithSoftwareUpdateAsset:(id)a3 limitingToStates:(int)a4
{
  SUDocumentationAssetMatcher *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUDocumentationAssetMatcher;
  v5 = -[SUAssetStateMatcher initWithType:interestedStates:](&v7, sel_initWithType_interestedStates_, CFSTR("com.apple.MobileAsset.SoftwareUpdateDocumentation"), *(_QWORD *)&a4);
  if (v5)
    v5->_suAsset = (MAAsset *)a3;
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUDocumentationAssetMatcher;
  -[SUDocumentationAssetMatcher dealloc](&v3, sel_dealloc);
}

- (id)_findMatchFromCandidates:(id)a3 error:(id *)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSString *v18;
  uint64_t v19;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v22 = -[SUDocumentationAssetMatcher _sortedMatcherPredicatesFromSoftwareUpdateAsset:](self, "_sortedMatcherPredicatesFromSoftwareUpdateAsset:", self->_suAsset);
  v6 = objc_msgSend(v22, "count");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i < v7; ++i)
    {
      v9 = (void *)objc_msgSend(v22, "objectAtIndex:", i);
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v24;
LABEL_5:
        v13 = 0;
        while (1)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(a3);
          v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v13);
          v15 = (void *)MEMORY[0x212BF5ECC]();
          if ((objc_msgSend(v9, "evaluateWithObject:", objc_msgSend(v14, "attributes")) & 1) != 0)
            break;
          objc_autoreleasePoolPop(v15);
          if (v11 == ++v13)
          {
            v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
            if (v11)
              goto LABEL_5;
            goto LABEL_13;
          }
        }
        v16 = v14;
        objc_autoreleasePoolPop(v15);
        if (v16)
          return v16;
      }
LABEL_13:
      v17 = objc_msgSend(v9, "predicateFormat");
      v18 = -[SUAssetStateMatcher assetType](self, "assetType");
      -[SUAssetStateMatcher assetType](self, "assetType");
      v19 = ASServerURLForAssetType();
      NSLog(CFSTR("Failed to find asset matching predicate: %@ in xml for asset type: %@, server url for asset type: %@"), v17, v18, v19);
    }
  }
  v16 = 0;
  if (a4)
    *a4 = +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 38);
  return v16;
}

- (void)_modifyMADownloadOptions:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  if (MGGetBoolAnswer())
    v5 = 60;
  else
    v5 = 30;
  objc_msgSend(a3, "setTimeoutIntervalForResource:", v5);
  objc_msgSend(a3, "setDiscretionary:", 0);
  objc_msgSend(a3, "setAllowsCellularAccess:", 1);
  objc_msgSend(a3, "setAllowsExpensiveAccess:", 1);
  v6 = objc_msgSend((id)-[MAAsset attributes](self->_suAsset, "attributes"), "objectForKey:", CFSTR("SUDocumentationID"));
  objc_msgSend(a3, "setAdditionalServerParams:", objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObjectsAndKeys:", v6, CFSTR("SUDocumentationID"), +[SUUtility currentProductCategory](SUUtility, "currentProductCategory"), CFSTR("Device"), 0));
}

- (id)_queryPredicateForProperties:(id)a3
{
  uint64_t v4;
  _QWORD v6[5];

  v4 = objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60__SUDocumentationAssetMatcher__queryPredicateForProperties___block_invoke;
  v6[3] = &unk_24CE3B7D8;
  v6[4] = v4;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v6);
  return (id)objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", v4);
}

uint64_t __60__SUDocumentationAssetMatcher__queryPredicateForProperties___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), a2, a3));
}

- (id)_sortedMatcherPredicatesFromSoftwareUpdateAsset:(id)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;

  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v7 = objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectForKey:", CFSTR("SUDocumentationID"));
  v8 = +[SUUtility currentDeviceName](SUUtility, "currentDeviceName");
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("SUDocumentationID"));
  }
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "setValue:forKey:", v8, CFSTR("Device"));
  }
  v9 = -[SUDocumentationAssetMatcher _queryPredicateForProperties:](self, "_queryPredicateForProperties:", v6);
  if (v9)
    objc_msgSend(v5, "addObject:", v9);

  return v5;
}

@end
