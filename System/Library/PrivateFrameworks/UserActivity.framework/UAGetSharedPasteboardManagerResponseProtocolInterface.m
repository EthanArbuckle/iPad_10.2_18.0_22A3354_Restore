@implementation UAGetSharedPasteboardManagerResponseProtocolInterface

void ___UAGetSharedPasteboardManagerResponseProtocolInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE61B98);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_UAGetSharedPasteboardManagerResponseProtocolInterface_result;
  _UAGetSharedPasteboardManagerResponseProtocolInterface_result = v0;

  v13 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v12, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_UAGetSharedPasteboardManagerResponseProtocolInterface_result, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_writeLocalPasteboardToFile_itemDir_withCompletion_, 0, 1);
  objc_msgSend((id)_UAGetSharedPasteboardManagerResponseProtocolInterface_result, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_writeLocalPasteboardToFile_itemDir_extension_withCompletion_, 0, 1);

}

@end
