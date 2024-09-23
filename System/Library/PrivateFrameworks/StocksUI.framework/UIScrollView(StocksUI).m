@implementation UIScrollView(StocksUI)

- (void)su_performScrollTestWithLength:()StocksUI completion:
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0DC3C20]);
  objc_msgSend(v7, "setIterations:", 1);
  objc_msgSend(v7, "setLength:", a2);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__UIScrollView_StocksUI__su_performScrollTestWithLength_completion___block_invoke;
  v9[3] = &unk_1EA44CCA8;
  v10 = v6;
  v8 = v6;
  objc_msgSend(a1, "_performScrollTestWithParameters:completionBlock:", v7, v9);

}

@end
