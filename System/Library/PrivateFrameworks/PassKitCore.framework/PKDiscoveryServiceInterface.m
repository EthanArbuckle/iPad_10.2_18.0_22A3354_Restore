@implementation PKDiscoveryServiceInterface

void __PKDiscoveryServiceInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE278D20);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECF22428;
  qword_1ECF22428 = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECF22428, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_discoveryArticleLayoutsUpdated_, 0, 0);
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECF22428, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_completedCTAForItem_, 0, 0);

}

@end
