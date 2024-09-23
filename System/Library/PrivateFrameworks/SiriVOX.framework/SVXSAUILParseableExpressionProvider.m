@implementation SVXSAUILParseableExpressionProvider

- (id)createWithAceId:(id)a3 context:(id)a4 expressionString:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v7 = (objc_class *)MEMORY[0x24BE81920];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(v7);
  objc_msgSend(v11, "setAceId:", v10);

  objc_msgSend(v11, "setContext:", v9);
  objc_msgSend(v11, "setExpressionString:", v8);

  return v11;
}

@end
