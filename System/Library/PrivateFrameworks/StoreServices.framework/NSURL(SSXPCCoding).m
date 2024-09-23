@implementation NSURL(SSXPCCoding)

- (id)initWithXPCEncoding:()SSXPCCoding
{
  uint64_t v5;
  uint64_t v6;
  id NSSecureCodingObjectForXPCObject;
  uint64_t v8;
  void *v9;
  void *v10;

  if (!a3)
    goto LABEL_9;
  v5 = MEMORY[0x1A85863E4](a3);
  if (v5 == MEMORY[0x1E0C81390])
  {
    v9 = SSXPCCreateCFObjectFromXPCObject(a3);
LABEL_7:
    v10 = v9;
    if (v9)
    {
      NSSecureCodingObjectForXPCObject = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v9);

      goto LABEL_10;
    }
LABEL_9:
    NSSecureCodingObjectForXPCObject = 0;
    goto LABEL_10;
  }
  if (v5 != MEMORY[0x1E0C812E8])
    goto LABEL_9;
  v6 = objc_opt_class();
  NSSecureCodingObjectForXPCObject = SSCodingCreateNSSecureCodingObjectForXPCObject(a3, v6);
  if (!NSSecureCodingObjectForXPCObject)
  {
    v8 = objc_opt_class();
    v9 = SSCodingCreateNSSecureCodingObjectForXPCObject(a3, v8);
    goto LABEL_7;
  }
LABEL_10:

  return NSSecureCodingObjectForXPCObject;
}

@end
