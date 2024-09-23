@implementation ITMLUtilities

+ (void)image:(id)a3 didCompleteLoadingForCache:(int64_t)a4 requestRecord:(id)a5
{
  id v7;
  id v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  id v13;
  __CFString *v14;
  _QWORD v15[4];
  __CFString *v16;
  id v17;
  __CFString *v18;

  if (a5)
  {
    v7 = a5;
    v8 = a3;
    objc_msgSend(v8, "uiImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageType");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v11 = (__CFString *)UTTypeCopyPreferredTagWithClass(v10, (CFStringRef)*MEMORY[0x24BDC1660]);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __64__ITMLUtilities_image_didCompleteLoadingForCache_requestRecord___block_invoke;
    v15[3] = &unk_24EB88350;
    v16 = v10;
    v17 = v9;
    v18 = v11;
    v12 = v11;
    v13 = v9;
    v14 = v10;
    objc_msgSend(v7, "didCompleteLoadingFromCache:withResponseBodyBlock:", a4, v15);

  }
}

void __64__ITMLUtilities_image_didCompleteLoadingForCache_requestRecord___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __64__ITMLUtilities_image_didCompleteLoadingForCache_requestRecord___block_invoke_2;
  v6[3] = &unk_24EB88328;
  v7 = a1[4];
  v8 = a1[5];
  v10 = v3;
  v9 = a1[6];
  v5 = v3;
  dispatch_async(v4, v6);

}

void __64__ITMLUtilities_image_didCompleteLoadingForCache_requestRecord___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  uint64_t v5;
  id v6;

  v2 = (void *)*MEMORY[0x24BDC17C0];
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BDC17C0]))
  {

  }
  else
  {
    v3 = (void *)*MEMORY[0x24BDC17C8];
    v4 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BDC17C8]);

    if ((v4 & 1) == 0)
    {
      UIImagePNGRepresentation(*(UIImage **)(a1 + 40));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  UIImageJPEGRepresentation(*(UIImage **)(a1 + 40), 1.0);
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v6 = (id)v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

@end
