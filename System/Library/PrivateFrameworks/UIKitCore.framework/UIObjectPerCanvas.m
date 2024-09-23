@implementation UIObjectPerCanvas

void __76___UIObjectPerCanvas_objectOfClass_forCanvas_withOptions_createIfNecessary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  v3 = (void *)qword_1ECD81FA8;
  qword_1ECD81FA8 = v2;

  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 2);
  v5 = (void *)qword_1ECD81FB8;
  qword_1ECD81FB8 = v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_canvasDisconnected_, CFSTR("UISceneDidDisconnectNotification"), 0);

}

@end
