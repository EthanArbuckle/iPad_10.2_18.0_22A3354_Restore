@implementation NSMutableDictionary(TSUAdditions)

- (uint64_t)tsu_objectForKey:()TSUAdditions withDefaultUsingBlock:
{
  uint64_t v7;

  v7 = objc_msgSend(a1, "objectForKey:");
  if (!v7)
  {
    v7 = (*(uint64_t (**)(uint64_t))(a4 + 16))(a4);
    objc_msgSend(a1, "setObject:forKey:", v7, a3);
  }
  return v7;
}

- (uint64_t)tsu_objectForKey:()TSUAdditions withDefaultOfClass:
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __73__NSMutableDictionary_TSUAdditions__tsu_objectForKey_withDefaultOfClass___block_invoke;
  v5[3] = &unk_24F39AD10;
  v5[4] = a4;
  return objc_msgSend(a1, "tsu_objectForKey:withDefaultUsingBlock:", a3, v5);
}

+ (id)tsu_dictionaryByInvertingDictionaryIfPossible:()TSUAdditions
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v8[5];

  if (!a3)
  {
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[NSMutableDictionary(TSUAdditions) tsu_dictionaryByInvertingDictionaryIfPossible:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSDictionaryAdditions.m"), 139, 0, "invalid nil value for '%{public}s'", "source");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  v5 = (id)objc_opt_new();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __83__NSMutableDictionary_TSUAdditions__tsu_dictionaryByInvertingDictionaryIfPossible___block_invoke;
  v8[3] = &unk_24F39AD38;
  v8[4] = v5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = objc_msgSend(a3, "count");
  if (v6 == objc_msgSend(v5, "count"))
    return v5;
  else
    return 0;
}

+ (uint64_t)tsu_dictionaryByInvertingDictionary:()TSUAdditions
{
  uint64_t v1;
  uint64_t v2;

  v1 = objc_msgSend(a1, "tsu_dictionaryByInvertingDictionaryIfPossible:");
  if (!v1)
  {
    v2 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[NSMutableDictionary(TSUAdditions) tsu_dictionaryByInvertingDictionary:]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSDictionaryAdditions.m"), 156, 0, "Source dictionary is not invertible.");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  return v1;
}

@end
