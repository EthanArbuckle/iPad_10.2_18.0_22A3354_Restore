@implementation PRMakeRangingServerXPCInterface

void __PRMakeRangingServerXPCInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  _PRMakeRangingServerInterfaceWithProtocol((uint64_t)&unk_1EE419220);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)PRMakeRangingServerXPCInterface_interface;
  PRMakeRangingServerXPCInterface_interface = v0;

  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v3 = objc_opt_class();
  v9 = (id)objc_msgSend(v2, "initWithObjects:", v3, objc_opt_class(), 0);
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = (void *)objc_msgSend(v4, "initWithObjects:", v5, v6, v7, objc_opt_class(), 0);
  objc_msgSend((id)PRMakeRangingServerXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_configureForP2PRanging_options_reply_, 0, 0);
  objc_msgSend((id)PRMakeRangingServerXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_configureForP2PRanging_options_reply_, 1, 0);
  objc_msgSend((id)PRMakeRangingServerXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_startP2PRanging_reply_, 0, 0);
  objc_msgSend((id)PRMakeRangingServerXPCInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_stopP2PRanging_reply_, 0, 0);

}

@end
