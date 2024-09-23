@implementation SUTransitionSafetyDelegate

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  objc_msgSend(MEMORY[0x24BDF6F98], "beginTransitionSafety", a3, a4, a5);
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  objc_msgSend(MEMORY[0x24BDF6F98], "endTransitionSafety", a3, a4, a5);
}

@end
