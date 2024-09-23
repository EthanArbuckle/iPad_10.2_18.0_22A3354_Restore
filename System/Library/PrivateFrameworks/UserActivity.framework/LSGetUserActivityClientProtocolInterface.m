@implementation LSGetUserActivityClientProtocolInterface

void ___LSGetUserActivityClientProtocolInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE66950);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_LSGetUserActivityClientProtocolInterface_result;
  _LSGetUserActivityClientProtocolInterface_result = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_LSGetUserActivityClientProtocolInterface_result, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_doUpdateUserActivityInfo_makeCurrent_completionHandler_, 0, 0);
  objc_msgSend((id)_LSGetUserActivityClientProtocolInterface_result, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_doFetchUserActivityInfoWithUUID_completionHandler_, 0, 1);
  objc_msgSend((id)_LSGetUserActivityClientProtocolInterface_result, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_doPinUserActivityInfo_completionHandler_, 0, 0);
  v10 = (void *)_LSGetUserActivityClientProtocolInterface_result;
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_doGetUserActivityProxiesWithOptions_completionHandler_, 0, 1);

}

@end
