@implementation _UICGImageDecompressor

- (_UICGImageDecompressor)init
{
  _UICGImageDecompressor *v2;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UICGImageDecompressor;
  v2 = -[_UICGImageDecompressor init](&v5, sel_init);
  if (-[_UICGImageDecompressor isMemberOfClass:](v2, "isMemberOfClass:", objc_opt_class()))
  {

    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot instantiate abstract class _UICGImageDecompressor"), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  return v2;
}

- (CGImage)waitForImageRef
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Abstract method not implemented"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

@end
