@implementation FLFollowUpController(ICQUI)

+ (void)icq_dismissFollowUpWithIdentifier:()ICQUI
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D15E30]), "initWithClientIdentifier:", CFSTR("com.apple.icloud.quota"));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__FLFollowUpController_ICQUI__icq_dismissFollowUpWithIdentifier___block_invoke;
  v7[3] = &unk_1E8B39E70;
  v8 = v3;
  v9 = v4;
  v5 = v4;
  v6 = v3;
  objc_msgSend(v5, "pendingFollowUpItemsWithCompletion:", v7);

}

@end
