@implementation TPSSearchQueryXPCInterfaceBuilder

+ (void)configure:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_performQuery_completion_, 0, 0);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_performQuery_completion_, 0, 1);

}

+ (id)searchQueryServerInterface
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3CA0A8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "configure:", v3);
  return v3;
}

@end
