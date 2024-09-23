@implementation _TUISecondaryTapGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  id v7;
  char *v8;
  _BOOL4 v9;
  int v10;
  uint64_t v11;
  id v12;

  v12 = a4;
  v5 = -[_TUISecondaryTapGestureRecognizer state](self, "state");
  v6 = v12;
  if (!v5)
  {
    v7 = v12;
    v8 = (char *)objc_msgSend(v7, "buttonMask");
    v9 = objc_msgSend(v7, "buttonMask") == (char *)&dword_0 + 1 && objc_msgSend(v7, "modifierFlags") == &loc_40000;
    v10 = v8 == (_BYTE *)&dword_0 + 2 || v9;

    if (v10)
      v11 = 3;
    else
      v11 = 5;
    -[_TUISecondaryTapGestureRecognizer setState:](self, "setState:", v11);
    v6 = v12;
  }

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  if (-[_TUISecondaryTapGestureRecognizer state](self, "state", a3, a4) == (char *)&dword_0 + 1
    || -[_TUISecondaryTapGestureRecognizer state](self, "state") == (char *)&dword_0 + 2)
  {
    -[_TUISecondaryTapGestureRecognizer setState:](self, "setState:", 2);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if (-[_TUISecondaryTapGestureRecognizer state](self, "state", a3, a4) == (char *)&dword_0 + 1
    || -[_TUISecondaryTapGestureRecognizer state](self, "state") == (char *)&dword_0 + 2)
  {
    -[_TUISecondaryTapGestureRecognizer setState:](self, "setState:", 3);
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v5;

  if ((uint64_t)-[_TUISecondaryTapGestureRecognizer state](self, "state", a3, a4) > 0)
    v5 = 4;
  else
    v5 = 5;
  -[_TUISecondaryTapGestureRecognizer setState:](self, "setState:", v5);
}

@end
