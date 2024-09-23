@implementation UIScrollView

- (int)desiredScrollLength:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mf_testName"));
  if ((objc_msgSend(v5, "mf_containsSubstring:", CFSTR("ScrollMessageList")) & 1) != 0)
    v6 = 80000.0;
  else
    v6 = (double)(int)objc_msgSend(v4, "mf_maxScrollLength");
  -[UIScrollView contentSize](self, "contentSize");
  v8 = v7;
  -[UIScrollView bounds](self, "bounds");
  v10 = v8 + v9;
  if (v6 < v8 + v9)
    v10 = v6;
  v11 = (int)v10;

  return v11;
}

@end
