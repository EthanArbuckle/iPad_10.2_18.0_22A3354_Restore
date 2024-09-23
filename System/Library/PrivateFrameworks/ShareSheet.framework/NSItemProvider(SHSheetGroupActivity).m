@implementation NSItemProvider(SHSheetGroupActivity)

- (void)loadGroupActivityMetadataWithCompletion:()SHSheetGroupActivity
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  +[SHSheetGroupActivity groupActivityType](SHSheetGroupActivity, "groupActivityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "hasItemConformingToTypeIdentifier:", v5);

  if ((v6 & 1) != 0)
  {
    +[SHSheetGroupActivity groupActivityType](SHSheetGroupActivity, "groupActivityType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __80__NSItemProvider_SHSheetGroupActivity__loadGroupActivityMetadataWithCompletion___block_invoke;
    v8[3] = &unk_1E4002A80;
    v9 = v4;
    objc_msgSend(a1, "loadItemForTypeIdentifier:options:completionHandler:", v7, 0, v8);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

@end
