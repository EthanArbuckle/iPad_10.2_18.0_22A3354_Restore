@implementation NSArray(LocationServices)

- (id)networksSortedBySignalStrengthWithMaxCount:()LocationServices
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("RSSI"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "sortedArrayUsingDescriptors:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObjectsFromArray:", v8);
    if (objc_msgSend(v5, "count") > a3)
      objc_msgSend(v5, "removeObjectsInRange:", a3, objc_msgSend(v5, "count") - a3);
  }
  else
  {
    v8 = 0;
  }

  return v5;
}

@end
