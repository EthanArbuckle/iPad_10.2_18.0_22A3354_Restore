@implementation NSExpression

void __76__NSExpression_VideosUICore__vui_keyPathBitTestExpressionWithKeyPath_value___block_invoke()
{
  void *v0;

  v0 = (void *)__keyPathBitTestExpressionBlock;
  __keyPathBitTestExpressionBlock = (uint64_t)&__block_literal_global_2_0;

}

id __76__NSExpression_VideosUICore__vui_keyPathBitTestExpressionWithKeyPath_value___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = 0;
  if ((isKindOfClass & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v5;
      v9 = objc_msgSend(v4, "unsignedIntegerValue");
      v10 = objc_msgSend(v8, "unsignedIntegerValue");

      v7 = v10 & v9;
    }
    else
    {
      v7 = 0;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
