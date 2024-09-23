@implementation NSMutableArray(VK)

- (id)vk_pop
{
  void *v2;

  objc_msgSend(a1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(a1, "removeObjectAtIndex:", 0);
  return v2;
}

- (void)vk_addNonNilObject:()VK
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObject:");
  return a1;
}

- (uint64_t)vk_randomize
{
  uint64_t result;
  uint32_t v3;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(a1, "count");
  if (result >= 2)
  {
    v3 = result;
    v4 = 2 * result;
    do
    {
      v5 = arc4random_uniform(v3);
      result = objc_msgSend(a1, "vk_swapItemAtIndex:withItemAtIndex:", v5, arc4random_uniform(v3));
      --v4;
    }
    while (v4);
  }
  return result;
}

- (void)vk_addObjectsFromNonNilArray:()VK
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObjectsFromArray:");
  return a1;
}

- (void)vk_insertNonNilObject:()VK atIndex:
{
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  if ((a4 & 0x8000000000000000) != 0)
  {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[NSMutableArray(VK) vk_insertNonNilObject:atIndex:]", 0, 0, CFSTR("Trying to insert object in mutableArray at negative index %ld"), a4, v7);
    goto LABEL_8;
  }
  if (objc_msgSend(a1, "count") < a4)
  {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[NSMutableArray(VK) vk_insertNonNilObject:atIndex:]", 0, 0, CFSTR("Trying to insert object in mutableArray at index (%ld) greater than count (%ld)"), a4, objc_msgSend(a1, "count"));
LABEL_8:
    v6 = v8;
    goto LABEL_9;
  }
  v6 = v8;
  if (v8)
  {
    objc_msgSend(a1, "insertObject:atIndex:", v8, a4);
    goto LABEL_8;
  }
LABEL_9:

}

- (void)vk_swapItemAtIndex:()VK withItemAtIndex:
{
  void *v7;
  id v8;

  if (objc_msgSend(a1, "count") <= a3 || objc_msgSend(a1, "count") <= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[NSMutableArray(VK) vk_swapItemAtIndex:withItemAtIndex:]", 0, 0, CFSTR("Trying to swap item at index %@, with item at index %@, but array size is %ld"), v8, v7, objc_msgSend(a1, "count"));
LABEL_6:

    return;
  }
  if (a3 != a4)
  {
    objc_msgSend(a1, "objectAtIndexedSubscript:", a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "objectAtIndexedSubscript:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "replaceObjectAtIndex:withObject:", a3, v7);
    objc_msgSend(a1, "replaceObjectAtIndex:withObject:", a4, v8);
    goto LABEL_6;
  }
}

@end
