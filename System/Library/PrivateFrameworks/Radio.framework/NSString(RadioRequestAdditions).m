@implementation NSString(RadioRequestAdditions)

+ (id)queryStringForRadioRequestParameters:()RadioRequestAdditions protocolVersion:error:
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  id v14;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("?version=%i"), a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10);
        objc_msgSend(v5, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = v12;
          goto LABEL_12;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (v14 = objc_retainAutorelease(v12), strcmp((const char *)objc_msgSend(v14, "objCType"), "B")))
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
            goto LABEL_16;
          objc_msgSend(v12, "stringValue");
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_12:
          v15 = v13;
          if (!v13)
            goto LABEL_16;
          goto LABEL_13;
        }
        if (objc_msgSend(v14, "BOOLValue"))
          v15 = CFSTR("true");
        else
          v15 = CFSTR("false");
LABEL_13:
        if (queryStringForRadioRequestParameters_protocolVersion_error__sOnceToken != -1)
          dispatch_once(&queryStringForRadioRequestParameters_protocolVersion_error__sOnceToken, &__block_literal_global_101);
        -[__CFString stringByAddingPercentEncodingWithAllowedCharacters:](v15, "stringByAddingPercentEncodingWithAllowedCharacters:", queryStringForRadioRequestParameters_protocolVersion_error__sQueryStringAllowedCharacterSet);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "appendFormat:", CFSTR("&%@=%@"), v11, v16);

LABEL_16:
        ++v10;
      }
      while (v8 != v10);
      v17 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v8 = v17;
    }
    while (v17);
  }

  v18 = (void *)objc_msgSend(v20, "copy");
  return v18;
}

@end
