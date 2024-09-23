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
  v5[3] = &unk_24D61B108;
  v5[4] = a4;
  return objc_msgSend(a1, "tsu_objectForKey:withDefaultUsingBlock:", a3, v5);
}

+ (id)tsu_dictionaryByInvertingDictionaryIfPossible:()TSUAdditions
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v9[5];

  if (!a3)
  {
    v4 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[NSMutableDictionary(TSUAdditions) tsu_dictionaryByInvertingDictionaryIfPossible:]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/NSDictionaryAdditions.m"), 67, CFSTR("invalid nil value for '%s'"), "source");
  }
  v6 = (id)objc_opt_new();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __83__NSMutableDictionary_TSUAdditions__tsu_dictionaryByInvertingDictionaryIfPossible___block_invoke;
  v9[3] = &unk_24D61B130;
  v9[4] = v6;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = objc_msgSend(a3, "count");
  if (v7 == objc_msgSend(v6, "count"))
    return v6;
  else
    return 0;
}

+ (uint64_t)tsu_dictionaryByInvertingDictionary:()TSUAdditions
{
  uint64_t v1;
  id v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, "tsu_dictionaryByInvertingDictionaryIfPossible:");
  if (!v1)
  {
    v2 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[NSMutableDictionary(TSUAdditions) tsu_dictionaryByInvertingDictionary:]");
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/NSDictionaryAdditions.m"), 86, CFSTR("Source dictionary is not invertible."));
  }
  return v1;
}

- (void)tsu_removeObjectsWithoutKeys:()TSUAdditions
{
  id v5;

  v5 = (id)objc_msgSend((id)objc_msgSend(a1, "allKeys"), "mutableCopy");
  objc_msgSend(v5, "removeObjectsInArray:", a3);
  objc_msgSend(a1, "removeObjectsForKeys:", v5);

}

@end
