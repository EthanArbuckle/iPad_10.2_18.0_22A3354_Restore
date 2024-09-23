@implementation IsWebBrowserAvailable

void __IsWebBrowserAvailable_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", CFSTR("com.apple.mobilesafari"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7CA30;
  qword_1ECD7CA30 = v0;

  if (!qword_1ECD7CA30)
  {
    objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", CFSTR("com.apple.safari"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)qword_1ECD7CA30;
    qword_1ECD7CA30 = v2;

  }
}

@end
