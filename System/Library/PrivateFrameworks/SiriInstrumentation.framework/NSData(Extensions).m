@implementation NSData(Extensions)

- (id)si_asNSUUID
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "length") != 16)
    return 0;
  v3[0] = 0;
  v3[1] = 0;
  objc_msgSend(a1, "getBytes:length:", v3, 16);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v3);
}

@end
