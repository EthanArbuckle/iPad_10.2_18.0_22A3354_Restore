@implementation SUScriptCanvasFunction

- (void)dealloc
{
  objc_super v3;

  self->_lastResult = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUScriptCanvasFunction;
  -[SUScriptFunction dealloc](&v3, sel_dealloc);
}

- (id)copyResultForSize:(CGSize)a3
{
  double height;
  double width;
  SUScriptCanvasResult *lastResult;
  UIImage *v7;
  double v8;
  double v9;
  BOOL v10;
  id v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  double v15;
  void *v16;
  id v17;
  SUScriptCanvasResult *v18;
  SUScriptCanvasResult *v19;

  height = a3.height;
  width = a3.width;
  -[SUScriptFunction lock](self, "lock");
  lastResult = self->_lastResult;
  if (lastResult
    && (v7 = -[SUScriptCanvasResult canvasImage](lastResult, "canvasImage")) != 0
    && ((-[UIImage size](v7, "size"), width == v9) ? (v10 = height == v8) : (v10 = 0), v10))
  {
    v19 = self->_lastResult;
    -[SUScriptFunction unlock](self, "unlock");
    if (v19)
      return v19;
  }
  else
  {
    -[SUScriptFunction unlock](self, "unlock");
  }
  v11 = objc_alloc(MEMORY[0x24BDBCE30]);
  v12 = objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  *(float *)&v13 = width;
  v14 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
  *(float *)&v15 = height;
  v16 = (void *)objc_msgSend(v11, "initWithObjects:", v12, v14, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v15), 0);
  v17 = -[SUScriptFunction callSynchronouslyWithArguments:](self, "callSynchronouslyWithArguments:", v16);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SUScriptFunction lock](self, "lock");

    v18 = -[SUScriptCanvasResult _initWithCanvas:]([SUScriptCanvasResult alloc], "_initWithCanvas:", v17);
    self->_lastResult = v18;
    v19 = v18;
    -[SUScriptFunction unlock](self, "unlock");
  }
  else
  {
    v19 = self->_lastResult;
  }

  return v19;
}

@end
