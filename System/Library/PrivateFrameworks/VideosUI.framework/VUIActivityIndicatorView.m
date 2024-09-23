@implementation VUIActivityIndicatorView

+ (id)vui_activityIndicatorViewWithActivityIndicatorStyle:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = 100;
  if (a3 == 1)
    v3 = 101;
  if (a3 == 2)
    v4 = 20;
  else
    v4 = v3;
  return -[VUIActivityIndicatorView initWithActivityIndicatorStyle:]([VUIActivityIndicatorView alloc], "initWithActivityIndicatorStyle:", v4);
}

- (void)vui_startTimer:(double)a3
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_vui_startAnimating, 0);
  -[VUIActivityIndicatorView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_vui_startAnimating, 0, a3);
}

@end
