@implementation UIDebugLogNode

uint64_t __113___UIDebugLogNode___genericAppendChildDescription_withPrefix_inheritedTreeStyle_recursionSelector_appendHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_isNode");
}

void __73___UIDebugLogNode__appendChildDescription_withPrefix_inheritedTreeStyle___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a2, "_stringRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("%@%@"), v7, v8);

}

void __83___UIDebugLogNode__appendAttributedChildDescription_withPrefix_inheritedTreeStyle___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v6 = (objc_class *)MEMORY[0x1E0CB3498];
  v7 = a4;
  v8 = a3;
  v9 = a2;
  v10 = (void *)objc_msgSend([v6 alloc], "initWithString:", v8);

  objc_msgSend(v7, "appendAttributedString:", v10);
  objc_msgSend(v9, "_attributedStringRepresentation");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "appendAttributedString:", v11);
}

@end
