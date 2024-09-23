@implementation SCRO2DBraillePlane

- (SCRO2DBraillePlane)initWithDriver:(id)a3
{
  id v5;
  SCRO2DBraillePlane *v6;
  SCRO2DBraillePlane *v7;
  char v8;
  uint64_t v9;
  SCRO2DBrailleCanvas *canvas;
  SCRO2DBraillePlane *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SCRO2DBraillePlane;
  v6 = -[SCRO2DBraillePlane init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_brailleDriver, a3);
    v8 = objc_opt_respondsToSelector();
    v7->_supportsCanvas = v8 & 1;
    v7->_wordWrapEnabled = 1;
    if ((v8 & 1) != 0)
    {
      -[SCROBrailleDriverProtocol canvas](v7->_brailleDriver, "canvas");
      v9 = objc_claimAutoreleasedReturnValue();
      canvas = v7->_canvas;
      v7->_canvas = (SCRO2DBrailleCanvas *)v9;

    }
    v11 = v7;
  }

  return v7;
}

- (void)setBrailleData:(id)a3
{
  id v4;
  void *v5;
  SCRO2DBrailleImageContent *v6;
  SCRO2DBrailleListContent *v7;
  SCRO2DBrailleCanvas *canvas;
  id v9;
  _BOOL8 wordWrapEnabled;
  SCRO2DBrailleContentProtocol *content;
  id v12;

  v4 = a3;
  if (self->_supportsCanvas)
  {
    v12 = v4;
    objc_msgSend(v4, "imageData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = -[SCRO2DBrailleImageContent initWithBrailleData:canvas:]([SCRO2DBrailleImageContent alloc], "initWithBrailleData:canvas:", v12, self->_canvas);
    }
    else
    {
      if (objc_msgSend(v12, "truncateStrings"))
      {
        v7 = [SCRO2DBrailleListContent alloc];
        canvas = self->_canvas;
        v9 = v12;
        wordWrapEnabled = 0;
      }
      else
      {
        v7 = [SCRO2DBrailleReadingContent alloc];
        canvas = self->_canvas;
        wordWrapEnabled = self->_wordWrapEnabled;
        v9 = v12;
      }
      v6 = -[SCRO2DBrailleListContent initWithBrailleData:canvas:wordWrap:](v7, "initWithBrailleData:canvas:wordWrap:", v9, canvas, wordWrapEnabled);
    }
    content = self->_content;
    self->_content = (SCRO2DBrailleContentProtocol *)v6;

    -[SCRO2DBrailleContentProtocol drawOnCanvas:](self->_content, "drawOnCanvas:", self->_canvas);
    -[SCROBrailleDriverProtocol displayCanvas](self->_brailleDriver, "displayCanvas");
    v4 = v12;
  }

}

- (BOOL)canPanLeft
{
  if (self->_supportsCanvas)
    return -[SCRO2DBrailleContentProtocol canPanLeft](self->_content, "canPanLeft");
  else
    return 0;
}

- (void)panLeft
{
  if (self->_supportsCanvas)
  {
    if (-[SCRO2DBraillePlane canPanLeft](self, "canPanLeft"))
    {
      -[SCRO2DBrailleContentProtocol panLeft](self->_content, "panLeft");
      -[SCRO2DBrailleContentProtocol drawOnCanvas:](self->_content, "drawOnCanvas:", self->_canvas);
    }
  }
}

- (BOOL)canPanRight
{
  if (self->_supportsCanvas)
    return -[SCRO2DBrailleContentProtocol canPanRight](self->_content, "canPanRight");
  else
    return 0;
}

- (void)panRight
{
  if (self->_supportsCanvas)
  {
    if (-[SCRO2DBraillePlane canPanRight](self, "canPanRight"))
    {
      -[SCRO2DBrailleContentProtocol panRight](self->_content, "panRight");
      -[SCRO2DBrailleContentProtocol drawOnCanvas:](self->_content, "drawOnCanvas:", self->_canvas);
    }
  }
}

- (BOOL)wordWrapEnabled
{
  return self->_wordWrapEnabled;
}

- (void)setWordWrapEnabled:(BOOL)a3
{
  self->_wordWrapEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedElement, 0);
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_brailleLines, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_canvas, 0);
  objc_storeStrong((id *)&self->_brailleDriver, 0);
}

@end
