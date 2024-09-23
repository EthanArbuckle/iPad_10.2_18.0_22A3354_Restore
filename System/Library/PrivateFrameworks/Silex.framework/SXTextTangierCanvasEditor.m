@implementation SXTextTangierCanvasEditor

- (id)documentRoot
{
  void *v2;
  void *v3;

  -[TSDCanvasEditor interactiveCanvasController](self, "interactiveCanvasController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentRoot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)wantsKeyboard
{
  return 0;
}

- (id)drawables
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "array");
}

@end
