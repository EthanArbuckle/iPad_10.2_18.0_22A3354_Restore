@implementation NSKeyedUnarchiver(PosterFoundation)

+ (id)pf_unarchivedObjectOfClass:()PosterFoundation fromData:classReplacementMap:error:
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = (void *)MEMORY[0x24BDBCF20];
  v11 = a5;
  v12 = a4;
  objc_msgSend(v10, "setWithObject:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pf_unarchivedObjectOfClasses:fromData:classReplacementMap:error:", v13, v12, v11, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)pf_unarchivedObjectOfClasses:()PosterFoundation fromData:classReplacementMap:error:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_msgSend([a1 alloc], "initForReadingFromData:error:", v11, a6);
  objc_msgSend(v13, "setRequiresSecureCoding:", 1);
  objc_msgSend(v13, "setDecodingFailurePolicy:", 1);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __103__NSKeyedUnarchiver_PosterFoundation__pf_unarchivedObjectOfClasses_fromData_classReplacementMap_error___block_invoke;
  v17[3] = &unk_251543C38;
  v14 = v13;
  v18 = v14;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v17);
  objc_msgSend(v14, "decodeTopLevelObjectOfClasses:forKey:error:", v10, *MEMORY[0x24BDD0E88], a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
