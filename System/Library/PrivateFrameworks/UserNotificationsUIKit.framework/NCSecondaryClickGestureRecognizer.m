@implementation NCSecondaryClickGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NCSecondaryClickGestureRecognizer;
  v6 = a4;
  -[NCSecondaryClickGestureRecognizer touchesBegan:withEvent:](&v8, sel_touchesBegan_withEvent_, a3, v6);
  LODWORD(a3) = -[NCSecondaryClickGestureRecognizer isSecondaryClickEvent:](self, "isSecondaryClickEvent:", v6, v8.receiver, v8.super_class);

  if ((_DWORD)a3)
    v7 = 1;
  else
    v7 = 5;
  -[NCSecondaryClickGestureRecognizer setState:](self, "setState:", v7);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NCSecondaryClickGestureRecognizer;
  v6 = a4;
  -[NCSecondaryClickGestureRecognizer touchesEnded:withEvent:](&v7, sel_touchesEnded_withEvent_, a3, v6);
  LODWORD(a3) = -[NCSecondaryClickGestureRecognizer isSecondaryClickEvent:](self, "isSecondaryClickEvent:", v6, v7.receiver, v7.super_class);

  if ((_DWORD)a3)
    -[NCSecondaryClickGestureRecognizer setState:](self, "setState:", 3);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NCSecondaryClickGestureRecognizer;
  v6 = a4;
  -[NCSecondaryClickGestureRecognizer touchesCancelled:withEvent:](&v7, sel_touchesCancelled_withEvent_, a3, v6);
  LODWORD(a3) = -[NCSecondaryClickGestureRecognizer isSecondaryClickEvent:](self, "isSecondaryClickEvent:", v6, v7.receiver, v7.super_class);

  if ((_DWORD)a3)
    -[NCSecondaryClickGestureRecognizer setState:](self, "setState:", 4);
}

- (BOOL)isSecondaryClickEvent:(id)a3
{
  return ((unint64_t)objc_msgSend(a3, "buttonMask") >> 1) & 1;
}

@end
