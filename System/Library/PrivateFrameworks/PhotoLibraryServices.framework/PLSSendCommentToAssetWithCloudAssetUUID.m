@implementation PLSSendCommentToAssetWithCloudAssetUUID

void ___PLSSendCommentToAssetWithCloudAssetUUID_block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "assetWithUUID:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "userAddCloudSharedCommentWithText:", *(_QWORD *)(a1 + 48));

}

@end
