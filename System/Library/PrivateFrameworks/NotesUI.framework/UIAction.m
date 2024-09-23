@implementation UIAction

id __73__UIAction_IC__ic_centerWindowActionWithAppURL_activationRequestOptions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "initWithActivityType:", CFSTR("com.apple.notes.open.object"));
  objc_msgSend(*(id *)(a1 + 32), "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTargetContentIdentifier:", v3);

  objc_msgSend(v2, "setUserInfo:", &unk_1E5C721A0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3FB0]), "initWithUserActivity:", v2);
  objc_msgSend(v4, "setOptions:", *(_QWORD *)(a1 + 40));

  return v4;
}

@end
