@implementation NSString(WiFiKitUI)

- (BOOL)isEmpty
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") == 0;

  return v4;
}

- (BOOL)isValidIPv4Address
{
  int v3;

  v3 = 0;
  return inet_pton(2, (const char *)objc_msgSend(objc_retainAutorelease(a1), "cStringUsingEncoding:", 4), &v3) == 1
      && (v3 - 1) < 0xFFFFFFFE;
}

- (BOOL)isValidSubnetMask
{
  int v2;

  v2 = 0;
  return inet_pton(2, (const char *)objc_msgSend(objc_retainAutorelease(a1), "cStringUsingEncoding:", 4), &v2) == 1;
}

- (id)formattedWiFiAddress
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR(":"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  v21 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __43__NSString_WiFiKitUI__formattedWiFiAddress__block_invoke;
  v15[3] = &unk_24DB379C0;
  v15[4] = &v16;
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v15);
  objc_msgSend((id)v17[5], "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v17[5], "removeObjectAtIndex:", 0);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (id)v17[5];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v22, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      v7 = v2;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(":%@"), *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringByAppendingString:", v8);
        v2 = (void *)objc_claimAutoreleasedReturnValue();

        ++v6;
        v7 = v2;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v22, 16);
    }
    while (v4);
  }

  objc_msgSend(v2, "uppercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (id)placeholderStringWithMaxCharacters:()WiFiKitUI
{
  uint64_t v3;
  void *i;

  v3 = a3;
  if (objc_msgSend(a1, "length") < a3)
    v3 = objc_msgSend(a1, "length");
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  for (i = (void *)objc_claimAutoreleasedReturnValue(); v3; --v3)
    objc_msgSend(i, "appendFormat:", CFSTR("%C"), 63386);
  return i;
}

@end
