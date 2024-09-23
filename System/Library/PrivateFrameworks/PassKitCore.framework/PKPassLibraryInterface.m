@implementation PKPassLibraryInterface

void __PKPassLibraryInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE1FA2C0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECF221B0;
  qword_1ECF221B0 = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECF221B0, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_catalogChanged_withNewPasses_, 1, 0);
  objc_msgSend((id)qword_1ECF221B0, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_catalogChanged_withNewPasses_states_, 1, 0);
  v4 = (void *)qword_1ECF221B0;
  v5 = objc_alloc(MEMORY[0x1E0C99E60]);
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = (void *)objc_msgSend(v5, "initWithObjects:", v6, v7, objc_opt_class(), 0);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_catalogChanged_withNewPasses_states_, 2, 0);

}

@end
