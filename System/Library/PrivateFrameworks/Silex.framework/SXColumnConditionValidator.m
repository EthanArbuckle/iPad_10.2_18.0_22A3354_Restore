@implementation SXColumnConditionValidator

- (BOOL)validateCondition:(id)a3 context:(id)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v5 = a3;
  v6 = objc_msgSend(a4, "numberOfColumns");
  v7 = objc_msgSend(v5, "minColumns");
  v8 = objc_msgSend(v5, "maxColumns");

  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && v7 > v6)
    return 0;
  return v8 + 1 < 2 || v8 >= v6;
}

@end
