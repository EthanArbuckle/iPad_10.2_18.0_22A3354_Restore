@implementation CNContactStore

uint64_t __58__CNContactStore_TUSearchUtilities__contactForIdentifier___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)contactForIdentifier__identifierToContactCache;
  contactForIdentifier__identifierToContactCache = (uint64_t)v0;

  return objc_msgSend((id)contactForIdentifier__identifierToContactCache, "setCountLimit:", 100);
}

uint64_t __61__CNContactStore_TUSearchUtilities__contactForDestinationId___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)contactForDestinationId__destinationIDToContactCache;
  contactForDestinationId__destinationIDToContactCache = (uint64_t)v0;

  return objc_msgSend((id)contactForDestinationId__destinationIDToContactCache, "setCountLimit:", 100);
}

@end
