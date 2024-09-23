@implementation NSString(ICLinguistics)

- (id)ic_guessedWords
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc_init(MEMORY[0x1E0DC3D98]);
  v6 = 0;
  if (!objc_msgSend(v4, "rangeOfMisspelledWordInString:range:startingAt:wrap:language:", a1, 0, objc_msgSend(a1, "length"), 0, 0, v3))
  {
    v7 = v5;
    if (v5 == objc_msgSend(a1, "length"))
    {
      objc_msgSend(v4, "guessesForWordRange:inString:language:", 0, v7, a1, v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

@end
