@implementation NSBundle

void __32__NSBundle_VKBundle____vkBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[NSBundle(VKBundle) __vkBundle]::bundle;
  +[NSBundle(VKBundle) __vkBundle]::bundle = v0;

}

@end
