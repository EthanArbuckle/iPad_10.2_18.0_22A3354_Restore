@implementation NSIndexPath(TVMLKitAdditions)

- (uint64_t)flattenedIndexForItemInSections:()TVMLKitAdditions
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__NSIndexPath_TVMLKitAdditions__flattenedIndexForItemInSections___block_invoke;
  v10[3] = &unk_24EB86550;
  v10[4] = a1;
  v10[5] = &v11;
  v10[6] = &v17;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v10);
  v5 = (void *)v12[5];
  if (v5 && (v6 = objc_msgSend(v5, "numberOfItems"), v6 > objc_msgSend(a1, "item")))
  {
    v7 = v18[3];
    v8 = objc_msgSend(a1, "item") + v7;
  }
  else
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

@end
