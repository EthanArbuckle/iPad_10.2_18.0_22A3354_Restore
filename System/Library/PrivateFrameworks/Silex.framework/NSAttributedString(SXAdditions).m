@implementation NSAttributedString(SXAdditions)

- (uint64_t)tokenCountWithEnumerationOptions:()SXAdditions maxTokenCount:outLimitLength:
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (a5)
    *a5 = objc_msgSend(a1, "length");
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  objc_msgSend(a1, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(a1, "length");
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __97__NSAttributedString_SXAdditions__tokenCountWithEnumerationOptions_maxTokenCount_outLimitLength___block_invoke;
  v13[3] = &unk_24D689318;
  v13[4] = &v14;
  v13[5] = a4;
  v13[6] = a5;
  objc_msgSend(v9, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, a3, v13);

  v11 = v15[3];
  _Block_object_dispose(&v14, 8);
  return v11;
}

- (id)stringByTruncatingToLength:()SXAdditions options:
{
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  if (objc_msgSend(a1, "length") <= a3)
    return a1;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  objc_msgSend(a1, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a1, "length");
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __70__NSAttributedString_SXAdditions__stringByTruncatingToLength_options___block_invoke;
  v12[3] = &unk_24D689340;
  v12[4] = &v13;
  v12[5] = a3;
  objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, a4, v12);

  v9 = v14[3];
  if (!v9)
  {
    v14[3] = a3;
    v9 = a3;
  }
  objc_msgSend(a1, "attributedSubstringFromRange:", 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v13, 8);
  return v10;
}

@end
