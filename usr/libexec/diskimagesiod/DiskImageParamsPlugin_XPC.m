@implementation DiskImageParamsPlugin_XPC

- (unique_ptr<DiskImage,)createSinkDiskImage
{
  objc_msgSend((id)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC")), "pluginHeader");
  operator new();
}

- (unint64_t)numBlocks
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)objc_msgSend(v2, "pluginHeader") + 16))();

  return v3;
}

- (BOOL)isWritableFormat
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
