@implementation UICommandIdentifierDictionary

void __72___UICommandIdentifierDictionary_intersectingIdentifiersFromDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[_UICommandIdentifier identifierWithAction:propertyList:](_UICommandIdentifier, "identifierWithAction:propertyList:", a2, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
