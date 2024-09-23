@implementation PXConsoleViewController

void __41___PXConsoleViewController_appendOutput___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_textView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v9, "px_isScrolledAtEdge:", 3);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", &stru_1E5149688);
  objc_msgSend(v9, "attributedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v3, "appendAttributedString:", v4);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
    objc_msgSend(v3, "appendAttributedString:", v5);

  }
  objc_msgSend(v3, "appendAttributedString:", *(_QWORD *)(a1 + 40));
  v6 = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAttribute:value:range:", v6, v7, 0, objc_msgSend(v3, "length"));

  objc_msgSend(v9, "setAttributedText:", v3);
  if (v2)
    objc_msgSend(v9, "px_scrollToEdge:animated:", 3, 0);
  objc_msgSend(*(id *)(a1 + 40), "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@"), v8);

}

@end
