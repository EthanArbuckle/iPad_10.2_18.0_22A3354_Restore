@implementation NSItemProvider(SharingUI)

- (void)sfui_loadLivePhotoWithCompletionHandler:()SharingUI
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend((id)*MEMORY[0x24BDF8450], "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__NSItemProvider_SharingUI__sfui_loadLivePhotoWithCompletionHandler___block_invoke;
  v7[3] = &unk_24CE0EF48;
  v8 = v4;
  v6 = v4;
  objc_msgSend(a1, "loadItemForTypeIdentifier:options:completionHandler:", v5, 0, v7);

}

- (void)sfui_loadLivePhotoObjectWithCompletionHandler:()SharingUI
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = objc_opt_class();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __75__NSItemProvider_SharingUI__sfui_loadLivePhotoObjectWithCompletionHandler___block_invoke;
  v8[3] = &unk_24CE0EF48;
  v9 = v4;
  v6 = v4;
  v7 = (id)objc_msgSend(a1, "loadObjectOfClass:completionHandler:", v5, v8);

}

@end
