@implementation BSUIMappedImageCacheCanary

void __38___BSUIMappedImageCacheCanary_dealloc__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "returnImageCacheForKey:", *(_QWORD *)(a1 + 32));

}

@end
