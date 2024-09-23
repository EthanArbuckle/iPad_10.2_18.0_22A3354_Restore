@implementation UIDefinitionDictionary

void __68___UIDefinitionDictionary__normalizedLanguageStringForLanguageCode___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  if (!_MergedGlobals_1003)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "objectForKey:", CFSTR("AppleLanguages"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectAtIndex:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = objc_retainAutorelease(v2);
    objc_msgSend(v3, "UTF8String");
    _MergedGlobals_1003 = uldn_openForContext();

  }
}

@end
