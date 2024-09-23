@implementation UIObjectPerScreen

void __76___UIObjectPerScreen_objectOfClass_forScreen_withOptions_createIfNecessary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  v3 = (void *)_MergedGlobals_1288;
  _MergedGlobals_1288 = v2;

  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 2);
  v5 = (void *)qword_1ECD81FA0;
  qword_1ECD81FA0 = v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_screenDisconnected_, CFSTR("_UIScreenDidDisconnectNotification"), 0);

}

@end
