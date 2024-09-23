@implementation CACCorrectionUtilities

+ (id)alternativesForString:(id)a3 languageIdentifier:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x24BDBCEB8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_spellingGuessesForString:languageIdentifier:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObjectsFromArray:", v10);
  objc_msgSend(v8, "localizedUppercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v11, "isEqualToString:", v8);

  if ((v6 & 1) == 0)
    objc_msgSend(v9, "addObject:", v11);

  return v9;
}

+ (id)_spellingGuessesForString:(id)a3 languageIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
  {
    +[CACSpeechSystem speechSystem](CACSpeechSystem, "speechSystem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recognitionSystemRef");
    v9 = RXRecognitionSystemCopyPhoneticNeighborsForText();

    v7 = (void *)v9;
  }
  if (!objc_msgSend(v7, "count"))
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "guessesForWordRange:inString:language:", 0, objc_msgSend(v5, "length"), v5, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15++));
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

  }
  if (!objc_msgSend(v7, "count"))
  {
    +[CACEmojiManager sharedManager](CACEmojiManager, "sharedManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByReplacingEmojisWithDescriptions:", v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "length"))
      objc_msgSend(v7, "addObject:", v17);

  }
  return v7;
}

+ (id)emojiSuggestionsForString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  +[CACEmojiManager sharedManager](CACEmojiManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingEmojisWithDescriptions:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CACEmojiManager sharedManager](CACEmojiManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __52__CACCorrectionUtilities_emojiSuggestionsForString___block_invoke;
  v10[3] = &unk_24F2AD668;
  v8 = v6;
  v11 = v8;
  objc_msgSend(v7, "enumerateEmojisInText:skinToneFilter:usingBlock:", v5, 1, v10);

  return v8;
}

uint64_t __52__CACCorrectionUtilities_emojiSuggestionsForString___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
}

@end
