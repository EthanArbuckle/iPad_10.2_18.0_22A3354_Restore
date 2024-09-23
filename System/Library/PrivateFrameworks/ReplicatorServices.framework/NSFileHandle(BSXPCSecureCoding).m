@implementation NSFileHandle(BSXPCSecureCoding)

+ (uint64_t)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:()BSXPCSecureCoding
{
  id v4;
  id v5;

  v4 = a3;
  v5 = xpc_fd_create(objc_msgSend(a1, "fileDescriptor"));
  objc_msgSend(v4, "encodeXPCObject:forKey:", v5, CFSTR("fileDescriptor"));

}

- (id)initWithBSXPCCoder:()BSXPCSecureCoding
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "decodeXPCObjectOfType:forKey:", MEMORY[0x24BDACFC0], CFSTR("fileDescriptor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    a1 = (id)objc_msgSend(a1, "initWithFileDescriptor:closeOnDealloc:", xpc_fd_dup(v4), 1);
    v6 = a1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
