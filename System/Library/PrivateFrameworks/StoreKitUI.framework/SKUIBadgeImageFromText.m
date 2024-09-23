@implementation SKUIBadgeImageFromText

uint64_t __SKUIBadgeImageFromText_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;
  NSObject *v3;
  id v4;
  void *v5;

  v0 = dispatch_queue_create("com.apple.StoreKitUI.SKUIBadgeImage", 0);
  v1 = (void *)SKUIBadgeImageFromText_sBadgeImageQueue;
  SKUIBadgeImageFromText_sBadgeImageQueue = (uint64_t)v0;

  v2 = SKUIBadgeImageFromText_sBadgeImageQueue;
  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(v2, v3);

  v4 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v5 = (void *)SKUIBadgeImageFromText_sBadgeImageCache;
  SKUIBadgeImageFromText_sBadgeImageCache = (uint64_t)v4;

  return objc_msgSend((id)SKUIBadgeImageFromText_sBadgeImageCache, "setCountLimit:", 10);
}

void __SKUIBadgeImageFromText_block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  CGFloat v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[3];
  CGSize v26;

  v25[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("%@:%@"), v3, v4);

  objc_msgSend((id)SKUIBadgeImageFromText_sBadgeImageCache, "objectForKey:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 10.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0DC1140];
    v24[0] = *MEMORY[0x1E0DC1138];
    v24[1] = v10;
    v11 = *(_QWORD *)(a1 + 40);
    v25[0] = v9;
    v25[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sizeWithAttributes:", v12);
    v14 = v13;
    v16 = v15;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scale");
    v19 = v18;
    v26.width = v14 + 6.0;
    v26.height = v16;
    UIGraphicsBeginImageContextWithOptions(v26, 0, v19);

    objc_msgSend(*(id *)(a1 + 40), "set");
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v14 + 6.0, v16, 1.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stroke");
    objc_msgSend(*(id *)(a1 + 32), "drawInRect:withAttributes:", v12, 3.5, -0.5, v14, v16);
    UIGraphicsGetImageFromCurrentImageContext();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;

    UIGraphicsEndImageContext();
    if (*(_BYTE *)(a1 + 56))
      objc_msgSend((id)SKUIBadgeImageFromText_sBadgeImageCache, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v5);

  }
}

@end
