@implementation LSGetBestAppSuggestionManagerProtocolInterface

void ___LSGetBestAppSuggestionManagerProtocolInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE669B0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_LSGetBestAppSuggestionManagerProtocolInterface_result;
  _LSGetBestAppSuggestionManagerProtocolInterface_result = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_LSGetBestAppSuggestionManagerProtocolInterface_result, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_doDetermineBestAppSuggestionWithCompletionHandler_, 0, 1);

}

@end
