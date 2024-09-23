@implementation NSDictionary(RunningBoard)

- (id)entriesToStringWithIndent:()RunningBoard debug:
{
  id v7;
  _QWORD v9[5];
  int v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__NSDictionary_RunningBoard__entriesToStringWithIndent_debug___block_invoke;
  v9[3] = &unk_1E2D17340;
  v9[4] = &v12;
  v10 = a3;
  v11 = a4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

@end
