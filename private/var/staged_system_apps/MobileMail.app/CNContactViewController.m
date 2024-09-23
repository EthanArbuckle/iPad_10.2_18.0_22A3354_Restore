@implementation CNContactViewController

- (BOOL)shouldAutorotate
{
  return +[UIDevice mf_isPad](UIDevice, "mf_isPad") ^ 1;
}

@end
