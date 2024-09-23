@implementation TSDSystemTextInputResponder

- (void)copy:(id)a3
{
  -[TSDTextInputResponder editor](self, "editor");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[TSDTextInput canPerformEditorAction:withSender:](-[TSDTextInputResponder editor](self, "editor"), "canPerformEditorAction:withSender:", a2, a3) == 1)
  {
    -[TSDTextInputResponder acceptAutocorrection](self, "acceptAutocorrection");
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6BB0], "sharedMenuController"), "hideMenu");
    -[TSDTextInput copy:](-[TSDTextInputResponder editor](self, "editor"), "copy:", a3);
  }
}

- (void)startAutoscroll:(CGPoint)a3
{
  double y;
  double x;
  id v5;
  double v6;
  double v7;

  y = a3.y;
  x = a3.x;
  v5 = -[TSDTextInputResponder p_ICC](self, "p_ICC");
  objc_msgSend(v5, "convertBoundsToUnscaledPoint:", x, y);
  objc_msgSend(v5, "scrollRectToVisible:animated:", 1, v6 + -10.0, v7 + -10.0, 20.0, 20.0);
}

- (void)cancelAutoscroll
{
  objc_msgSend(-[TSDTextInputResponder p_ICC](self, "p_ICC"), "forceStopScrolling");
}

- (void)scrollSelectionToVisible:(BOOL)a3
{
  objc_msgSend(-[TSDTextInputResponder p_ICC](self, "p_ICC", a3), "scrollCurrentSelectionToVisible");
}

@end
