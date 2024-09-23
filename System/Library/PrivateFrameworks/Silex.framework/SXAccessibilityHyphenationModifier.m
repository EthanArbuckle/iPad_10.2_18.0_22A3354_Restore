@implementation SXAccessibilityHyphenationModifier

- (void)modifyDOM:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSString *v9;
  _BOOL4 IsAccessibilityCategory;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "layoutOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentSizeCategory");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v9);

  if (IsAccessibilityCategory)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v6, "componentTextStyles", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          -[SXAccessibilityHyphenationModifier enableHyphenationForComponentTextStyleWithIdentifier:DOM:context:](self, "enableHyphenationForComponentTextStyleWithIdentifier:DOM:context:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++), v6, v7);
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v14);
    }

  }
}

- (void)enableHyphenationForComponentTextStyleWithIdentifier:(id)a3 DOM:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SXComponentTextStyle *v15;
  void *v16;
  void *v17;
  SXComponentTextStyle *v18;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "componentTextStyles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "JSONRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
    v12 = (void *)MEMORY[0x24BDBD1B8];
  v14 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(v14, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("hyphenation"));
  objc_msgSend(v14, "setObject:forKey:", &unk_24D6FEE60, CFSTR("hyphenationMinimumWordLength"));
  objc_msgSend(v14, "setObject:forKey:", &unk_24D6FEE60, CFSTR("hyphenationMinimumCharactersBefore"));
  objc_msgSend(v14, "setObject:forKey:", &unk_24D6FEE60, CFSTR("hyphenationMinimumCharactersAfter"));
  objc_msgSend(v14, "setObject:forKey:", &unk_24D6FEE78, CFSTR("hyphenationZone"));
  v15 = [SXComponentTextStyle alloc];
  objc_msgSend(v7, "specVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[SXJSONObject initWithJSONObject:andVersion:](v15, "initWithJSONObject:andVersion:", v14, v16);
  objc_msgSend(v8, "componentTextStyles");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setObject:forKey:", v18, v9);
}

@end
