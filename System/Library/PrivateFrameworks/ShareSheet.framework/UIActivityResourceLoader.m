@implementation UIActivityResourceLoader

void __49___UIActivityResourceLoader_loadResourceIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_loadResourceWithBlock:", *(_QWORD *)(a1 + 32));

}

void __50___UIActivityResourceLoader_getResourceWithBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_getResourceWithBlock:", *(_QWORD *)(a1 + 32));

}

@end
