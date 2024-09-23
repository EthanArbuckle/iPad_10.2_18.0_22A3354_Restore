@implementation UIGestureRecognizer

- (void)cancel
{
  uint64_t v3;

  if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible)
  {
    v3 = 5;
    goto LABEL_6;
  }
  if ((char *)-[UIGestureRecognizer state](self, "state") == (char *)&dword_0 + 1
    || (char *)-[UIGestureRecognizer state](self, "state") == (char *)&dword_0 + 2)
  {
    v3 = 4;
LABEL_6:
    -[UIGestureRecognizer setState:](self, "setState:", v3);
  }
}

@end
