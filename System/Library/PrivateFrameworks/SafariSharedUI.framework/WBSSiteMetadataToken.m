@implementation WBSSiteMetadataToken

void __42___WBSSiteMetadataToken_dispatchResponse___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 141558275;
    v5 = 1752392040;
    v6 = 2117;
    v7 = v3;
    _os_log_impl(&dword_1A840B000, v2, OS_LOG_TYPE_DEFAULT, "Dispatching response to handler of token %{sensitive, mask.hash}@", (uint8_t *)&v4, 0x16u);
  }
}

@end
