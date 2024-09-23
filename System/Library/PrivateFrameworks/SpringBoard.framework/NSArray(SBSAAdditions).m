@implementation NSArray(SBSAAdditions)

- (uint64_t)sbsa_onlyObjectOrNilAssert
{
  void *v5;

  if ((unint64_t)objc_msgSend(a1, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBSystemApertureUtilities.m"), 150, CFSTR("Collection contains more than a single object: %@"), a1);

  }
  return objc_msgSend(a1, "lastObject");
}

- (id)sbsa_onlyObjectOrNil
{
  void *v2;

  if (objc_msgSend(a1, "count") == 1)
  {
    objc_msgSend(a1, "lastObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)sbsa_arrayByAddingOrReplacingObject:()SBSAAdditions passingTest:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a1;
  v8 = v7;
  if (v6)
  {
    v9 = objc_msgSend(v7, "indexOfObjectPassingTest:", a4);
    v10 = (void *)objc_msgSend(v8, "mutableCopy");
    v11 = v10;
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v10, "addObject:", v6);
    else
      objc_msgSend(v10, "replaceObjectAtIndex:withObject:", v9, v6);

  }
  else
  {
    v11 = v7;
  }

  return v11;
}

- (id)sbsa_arrayByAddingOrReplacingObjectMatchingClass:()SBSAAdditions
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__NSArray_SBSAAdditions__sbsa_arrayByAddingOrReplacingObjectMatchingClass___block_invoke;
  v8[3] = &unk_1E8EA2408;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "sbsa_arrayByAddingOrReplacingObject:passingTest:", v5, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
