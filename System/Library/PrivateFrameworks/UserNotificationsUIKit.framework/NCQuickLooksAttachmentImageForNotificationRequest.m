@implementation NCQuickLooksAttachmentImageForNotificationRequest

void ___NCQuickLooksAttachmentImageForNotificationRequest_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.usernotifications.thumbnailgenerator", 0);
  v1 = (void *)_NCQuickLooksAttachmentImageForNotificationRequest___thumbnailGeneratorTimeoutQueue;
  _NCQuickLooksAttachmentImageForNotificationRequest___thumbnailGeneratorTimeoutQueue = (uint64_t)v0;

}

void ___NCQuickLooksAttachmentImageForNotificationRequest_block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) && !*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v2 = *MEMORY[0x1E0DC5F80];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F80], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1CFC3D000, v2, OS_LOG_TYPE_DEFAULT, "Thumbnail generation timed out, cancelling generation", v4, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CD32D0], "sharedGenerator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelRequest:", a1[4]);

  }
}

void ___NCQuickLooksAttachmentImageForNotificationRequest_block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v8 = *MEMORY[0x1E0DC5F80];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F80], OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v11 = 138543618;
    v12 = v9;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_1CFC3D000, v8, OS_LOG_TYPE_DEFAULT, "Thumbnail generation completed: representation=%{public}@, error=%{public}@", (uint8_t *)&v11, 0x16u);
  }

}

@end
