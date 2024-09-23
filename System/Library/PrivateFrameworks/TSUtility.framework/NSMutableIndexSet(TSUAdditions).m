@implementation NSMutableIndexSet(TSUAdditions)

- (void)tsu_moveIndexesInRange:()TSUAdditions toOffset:
{
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD v13[8];

  if (a5 < a3 || a5 - a3 >= a4)
  {
    v9 = a3 + a4;
    if (a3 + a4 != a5 && objc_msgSend(a1, "firstIndex") != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v9 >= a5)
        v10 = 0;
      else
        v10 = a4;
      v11 = a5 - v10;
      v12 = objc_alloc_init(MEMORY[0x24BDD1698]);
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __67__NSMutableIndexSet_TSUAdditions__tsu_moveIndexesInRange_toOffset___block_invoke;
      v13[3] = &unk_24D61B1A0;
      v13[4] = v12;
      v13[5] = a3;
      v13[6] = a4;
      v13[7] = v11;
      objc_msgSend(a1, "enumerateRangesInRange:options:usingBlock:", a3, a4, 0, v13);
      objc_msgSend(a1, "shiftIndexesStartingAtIndex:by:", a3 + a4, -(uint64_t)a4);
      objc_msgSend(a1, "shiftIndexesStartingAtIndex:by:", v11, a4);
      objc_msgSend(a1, "addIndexes:", v12);

    }
  }
}

- (void)tsu_intersectionWithIndexSet:()TSUAdditions
{
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1698]), "initWithIndexesInRange:", objc_msgSend(a1, "firstIndex"), objc_msgSend(a1, "lastIndex") - objc_msgSend(a1, "firstIndex") + 1);
  objc_msgSend(v5, "removeIndexes:", a3);
  objc_msgSend(a1, "removeIndexes:", v5);

}

@end
