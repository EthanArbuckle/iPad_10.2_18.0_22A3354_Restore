@implementation NSAttributedString(NSAttributedStringAttachmentConveniences)

+ (id)attributedStringWithAttachment:()NSAttributedStringAttachmentConveniences
{
  id v5;
  void *v6;
  uint64_t v7;

  if (attributedStringWithAttachment__onceToken != -1)
    dispatch_once(&attributedStringWithAttachment__onceToken, &__block_literal_global_253_0);
  if (attributedStringWithAttachment__useInitWithAttachment)
  {
    v5 = [a1 alloc];
    v6 = (void *)objc_msgSend(v5, "initWithAttachment:attributes:", a3, MEMORY[0x1E0C9AA70]);
  }
  else
  {
    v7 = objc_msgSend(MEMORY[0x1E0CB3498], "_sharedAttachmentString");
    v6 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3778]), "initWithString:", v7);
    objc_msgSend(v6, "addAttribute:value:range:", CFSTR("NSAttachment"), a3, 0, 1);
  }
  return v6;
}

- (uint64_t)initWithAttachment:()NSAttributedStringAttachmentConveniences attributes:
{
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v6 = (void *)objc_msgSend(a4, "mutableCopy");
  v7 = objc_msgSend(MEMORY[0x1E0CB3498], "_sharedAttachmentString");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", a3, CFSTR("NSAttachment"));
  v8 = objc_msgSend(a1, "initWithString:attributes:", v7, v6);

  return v8;
}

+ (uint64_t)_sharedAttachmentString
{
  return _NSFaultInObject();
}

+ (id)attributedStringWithAttachment:()NSAttributedStringAttachmentConveniences attributes:
{
  return (id)objc_msgSend([a1 alloc], "initWithAttachment:attributes:", a3, a4);
}

@end
