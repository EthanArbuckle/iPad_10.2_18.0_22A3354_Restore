@implementation NSArray(_WTColor)

- (id)CGColors
{
  void *v2;
  id v3;
  _QWORD v5[4];
  id v6;

  v2 = (void *)objc_opt_new();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __29__NSArray__WTColor__CGColors__block_invoke;
  v5[3] = &unk_251C06F78;
  v3 = v2;
  v6 = v3;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v5);

  return v3;
}

@end
