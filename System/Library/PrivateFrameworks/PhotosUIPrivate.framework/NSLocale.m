@implementation NSLocale

void __50__NSLocale_PhotosUI__pu_currentCharacterDirection__block_invoke()
{
  void *v0;
  int v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("NSForceRightToLeftWritingDirection"));

  if (v1)
  {
    pu_currentCharacterDirection_currentDirection = 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "preferredLocalizations");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    pu_currentCharacterDirection_currentDirection = objc_msgSend(MEMORY[0x1E0C99DC8], "characterDirectionForLanguage:", v4);
  }
}

@end
