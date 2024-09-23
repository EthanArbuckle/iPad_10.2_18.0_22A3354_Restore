@implementation IKTextElement

void __51__IKTextElement_NSAttributedString__textAttributes__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0DC1138];
  v4[0] = CFSTR("NSFont");
  v4[1] = CFSTR("NSParagraphStyle");
  v1 = *MEMORY[0x1E0DC1178];
  v5[0] = v0;
  v5[1] = v1;
  v4[2] = CFSTR("NSColor");
  v5[2] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)textAttributes___keyMappings;
  textAttributes___keyMappings = v2;

}

void __51__IKTextElement_NSAttributedString__textAttributes__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend((id)textAttributes___keyMappings, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v3, "objectForKey:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v10, v9);

        }
        else
        {
          NSLog(CFSTR("No mapped key for %@"), v8);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

@end
