@implementation UIImageCGImageContent

void __72___UIImageCGImageContent_prepareContentForDisplayWithCompletionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "contentWithCGImage:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIImageCGImageContent _contentWithCARenderRef](v3);
    v4 = objc_claimAutoreleasedReturnValue();

    +[_UIImageContent _cachePreparedContent:forDisplayOfContent:]((uint64_t)_UIImageContent, v4, *(void **)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    AsyncFallbackPreparationQueue();
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v4, *(dispatch_block_t *)(a1 + 48));
  }

  objc_setAssociatedObject(*(id *)(a1 + 32), CFSTR("com.apple.UIKit.active-decompressor"), 0, (void *)0x301);
}

uint64_t __72___UIImageCGImageContent_prepareContentForDisplayWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __50___UIImageCGImageContent_renditionApplyingEffect___block_invoke(uint64_t a1, CGContextRef c)
{
  CGRect v2;

  v2.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
  v2.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
  v2.size.width = *(CGFloat *)(a1 + 32);
  v2.size.height = *(CGFloat *)(a1 + 40);
  CGContextDrawImage(c, v2, *(CGImageRef *)(a1 + 48));
}

uint64_t __50___UIImageCGImageContent_renditionApplyingEffect___block_invoke_2(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

void __56___UIImageCGImageContent__provideCGImageWithSize_scale___block_invoke(double *a1, void *a2)
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGContext *v7;
  CGImage *v8;
  id v9;
  CGRect v10;

  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v5 = a1[5];
  v6 = a1[6];
  v9 = a2;
  v7 = (CGContext *)objc_msgSend(v9, "CGContext");
  v8 = (CGImage *)atomic_load((unint64_t *)(*((_QWORD *)a1 + 4) + 40));
  v10.origin.x = v3;
  v10.origin.y = v4;
  v10.size.width = v5;
  v10.size.height = v6;
  CGContextDrawImage(v7, v10, v8);

}

void __72___UIImageCGImageContent_prepareContentForDisplayWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  -[_UIImageCGImageContent _contentWithCARenderRef](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  _UIImageDecompressionCompletionQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72___UIImageCGImageContent_prepareContentForDisplayWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E16BAD68;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v2;
  v9 = v4;
  v10 = v5;
  v6 = v2;
  dispatch_async(v3, block);

}

uint64_t __72___UIImageCGImageContent_prepareContentForDisplayWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  +[_UIImageContent _cachePreparedContent:forDisplayOfContent:]((uint64_t)_UIImageContent, *(void **)(a1 + 32), *(void **)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __72___UIImageCGImageContent_optimizeContentForImageSize_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "contentOptimizedForImageSize:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

@end
