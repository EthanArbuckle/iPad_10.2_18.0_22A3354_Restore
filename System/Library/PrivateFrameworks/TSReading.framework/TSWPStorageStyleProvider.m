@implementation TSWPStorageStyleProvider

+ (id)styleProviderForStorage:(id)a3
{
  return a3;
}

- (id)paragraphStyleAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorageStyleProvider paragraphStyleAtParIndex:effectiveRange:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorageStyleProvider.mm"), 26, CFSTR("Use the class method: styleProviderForStorage and do not allocate this class directly. Alternatively, provide your own implementation."));
  return 0;
}

@end
