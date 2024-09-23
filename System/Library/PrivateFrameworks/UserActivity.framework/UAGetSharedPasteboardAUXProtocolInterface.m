@implementation UAGetSharedPasteboardAUXProtocolInterface

void ___UAGetSharedPasteboardAUXProtocolInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE66A70);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_UAGetSharedPasteboardAUXProtocolInterface_result;
  _UAGetSharedPasteboardAUXProtocolInterface_result = v0;

}

@end
