@implementation PLContactStoreUtilitiesWorkaround

+ (id)matchingDictionaryForContact:(id)a3 contactStore:(id)a4
{
  return (id)objc_msgSend(a4, "matchingDictionaryForContact:", a3);
}

+ (id)contactWithMatchingDictionary:(id)a3 keysToFetch:(id)a4 contactStore:(id)a5
{
  return (id)objc_msgSend(a5, "contactWithMatchingDictionary:keysToFetch:", a3, a4);
}

@end
