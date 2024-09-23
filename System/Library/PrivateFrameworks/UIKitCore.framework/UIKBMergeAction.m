@implementation UIKBMergeAction

- (void)setRemainingKeyName:(id)a3
{
  objc_storeStrong((id *)&self->_remainingKeyName, a3);
}

- (void)setFactors:(id)a3
{
  objc_storeStrong((id *)&self->_factors, a3);
}

- (void)setDisappearingKeyName:(id)a3
{
  objc_storeStrong((id *)&self->_disappearingKeyName, a3);
}

- (NSArray)orderedKeyList
{
  return self->_orderedKeyList;
}

- (NSString)remainingKeyName
{
  return self->_remainingKeyName;
}

- (UIKBGeometry)factors
{
  return self->_factors;
}

- (NSString)disappearingKeyName
{
  return self->_disappearingKeyName;
}

- (id)copyWithZone:(_NSZone *)a3
{
  UIKBMergeAction *v4;
  uint64_t v5;
  NSString *remainingKeyName;
  uint64_t v7;
  NSString *disappearingKeyName;
  uint64_t v9;
  NSArray *orderedKeyList;
  uint64_t v11;
  UIKBGeometry *factors;

  v4 = -[UIKBMergeAction init](+[UIKBMergeAction allocWithZone:](UIKBMergeAction, "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_remainingKeyName, "copy");
  remainingKeyName = v4->_remainingKeyName;
  v4->_remainingKeyName = (NSString *)v5;

  v7 = -[NSString copy](self->_disappearingKeyName, "copy");
  disappearingKeyName = v4->_disappearingKeyName;
  v4->_disappearingKeyName = (NSString *)v7;

  v9 = -[NSArray copy](self->_orderedKeyList, "copy");
  orderedKeyList = v4->_orderedKeyList;
  v4->_orderedKeyList = (NSArray *)v9;

  v11 = -[UIKBGeometry copy](self->_factors, "copy");
  factors = v4->_factors;
  v4->_factors = (UIKBGeometry *)v11;

  return v4;
}

+ (id)mergeActionWithRemainingKeyName:(id)a3 disappearingKeyName:(id)a4 factors:(id)a5
{
  NSString *v7;
  NSString *v8;
  UIKBGeometry *v9;
  UIKBMergeAction *v10;
  NSString *remainingKeyName;
  NSString *v12;
  NSString *disappearingKeyName;
  NSString *v14;
  UIKBGeometry *factors;

  v7 = (NSString *)a3;
  v8 = (NSString *)a4;
  v9 = (UIKBGeometry *)a5;
  v10 = objc_alloc_init(UIKBMergeAction);
  remainingKeyName = v10->_remainingKeyName;
  v10->_remainingKeyName = v7;
  v12 = v7;

  disappearingKeyName = v10->_disappearingKeyName;
  v10->_disappearingKeyName = v8;
  v14 = v8;

  factors = v10->_factors;
  v10->_factors = v9;

  return v10;
}

+ (id)mergeActionWithOrderedKeyList:(id)a3 factors:(id)a4
{
  NSArray *v5;
  UIKBGeometry *v6;
  UIKBMergeAction *v7;
  NSArray *orderedKeyList;
  NSArray *v9;
  UIKBGeometry *factors;

  v5 = (NSArray *)a3;
  v6 = (UIKBGeometry *)a4;
  v7 = objc_alloc_init(UIKBMergeAction);
  orderedKeyList = v7->_orderedKeyList;
  v7->_orderedKeyList = v5;
  v9 = v5;

  factors = v7->_factors;
  v7->_factors = v6;

  return v7;
}

- (void)setOrderedKeyList:(id)a3
{
  objc_storeStrong((id *)&self->_orderedKeyList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factors, 0);
  objc_storeStrong((id *)&self->_orderedKeyList, 0);
  objc_storeStrong((id *)&self->_disappearingKeyName, 0);
  objc_storeStrong((id *)&self->_remainingKeyName, 0);
}

@end
