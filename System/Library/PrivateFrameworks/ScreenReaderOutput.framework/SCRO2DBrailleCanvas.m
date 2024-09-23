@implementation SCRO2DBrailleCanvas

- (SCRO2DBrailleCanvas)init
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x24BDBCE88];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", CFSTR("SCRO2DBrailleException"), CFSTR("use of %@ is not allowed"), v4);

  return 0;
}

- (SCRO2DBrailleCanvas)initWithCanvasDescriptor:(id)a3
{
  id v5;
  SCRO2DBrailleCanvas *v6;
  SCRO2DBrailleCanvas *v7;
  id *p_descriptor;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  SCRO2DPin *v12;
  SCRO2DBrailleCanvas *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SCRO2DBrailleCanvas;
  v6 = -[SCRO2DBrailleCanvas init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    p_descriptor = (id *)&v6->_descriptor;
    objc_storeStrong((id *)&v6->_descriptor, a3);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SCRO2DBrailleCanvasDescriptor width](v7->_descriptor, "width"))
    {
      v10 = 0;
      do
      {
        if (objc_msgSend(*p_descriptor, "height"))
        {
          v11 = 0;
          do
          {
            v12 = -[SCRO2DPin initWithX:y:style:]([SCRO2DPin alloc], "initWithX:y:style:", v10, v11, -[SCRO2DBrailleCanvasDescriptor pinHeightStyle](v7->_descriptor, "pinHeightStyle"));
            -[SCRO2DPin setState:](v12, "setState:", -[SCRO2DBrailleCanvas _fullyDownPinState](v7, "_fullyDownPinState"));
            objc_msgSend(v9, "addObject:", v12);

            ++v11;
          }
          while (v11 < -[SCRO2DBrailleCanvasDescriptor height](v7->_descriptor, "height"));
        }
        ++v10;
      }
      while (v10 < objc_msgSend(*p_descriptor, "width"));
    }
    objc_storeStrong((id *)&v7->_pins, v9);
    if (!-[SCRO2DBrailleCanvasDescriptor hasConsistentVerticalPinSpacing](v7->_descriptor, "hasConsistentVerticalPinSpacing"))objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("SCRO2DBrailleException"), CFSTR("Displays with variable vertical pin spacing are not yet supported."));
    if ((objc_msgSend(*p_descriptor, "hasConsistentHorizontalPinSpacing") & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("SCRO2DBrailleException"), CFSTR("Displays with variable horizontal pin spacing are not yet supported."));
    v7->_numberOfTextLines = -[SCRO2DBrailleCanvasDescriptor numberOfTextLinesAvailable](v7->_descriptor, "numberOfTextLinesAvailable");
    v13 = v7;

  }
  return v7;
}

- (unint64_t)width
{
  return -[SCRO2DBrailleCanvasDescriptor width](self->_descriptor, "width");
}

- (unint64_t)height
{
  return -[SCRO2DBrailleCanvasDescriptor height](self->_descriptor, "height");
}

- (BOOL)hasConsistentHorizontalPinSpacing
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", CFSTR("SCRO2DBrailleException"), CFSTR("Subclasses of %@ must implement %@"), v5, v6);

  return 0;
}

- (BOOL)hasConsistentVerticalPinSpacing
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", CFSTR("SCRO2DBrailleException"), CFSTR("Subclasses of %@ must implement %@"), v5, v6);

  return 0;
}

- (BOOL)supportsBrailleText
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", CFSTR("SCRO2DBrailleException"), CFSTR("Subclasses of %@ must implement %@"), v5, v6);

  return 0;
}

- (BOOL)skipPinBetweenCellsVertically
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", CFSTR("SCRO2DBrailleException"), CFSTR("Subclasses of %@ must implement %@"), v5, v6);

  return 0;
}

- (BOOL)skipPinBetweenCellsHorizontally
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", CFSTR("SCRO2DBrailleException"), CFSTR("Subclasses of %@ must implement %@"), v5, v6);

  return 0;
}

- (double)horizontalPinSpacing
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", CFSTR("SCRO2DBrailleException"), CFSTR("Subclasses of %@ must implement %@"), v5, v6);

  return 0.0;
}

- (double)verticalPinSpacing
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", CFSTR("SCRO2DBrailleException"), CFSTR("Subclasses of %@ must implement %@"), v5, v6);

  return 0.0;
}

- (double)interCellHorizontalSpacing
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", CFSTR("SCRO2DBrailleException"), CFSTR("Subclasses of %@ must implement %@"), v5, v6);

  return 0.0;
}

- (double)interCellVerticalSpacing
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", CFSTR("SCRO2DBrailleException"), CFSTR("Subclasses of %@ must implement %@"), v5, v6);

  return 0.0;
}

- (unint64_t)pinHeightStyle
{
  return 2;
}

- (unint64_t)detentCount
{
  return 2;
}

- (id)_pinForX:(unint64_t)a3 y:(unint64_t)a4
{
  return -[NSArray objectAtIndex:](self->_pins, "objectAtIndex:", a3 + -[SCRO2DBrailleCanvasDescriptor width](self->_descriptor, "width") * a4);
}

- (void)setPinState:(id)a3 forX:(unint64_t)a4 y:(unint64_t)a5
{
  id v6;

  -[SCRO2DBrailleCanvas _pinForX:y:](self, "_pinForX:y:", a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setState:", a3.var0);

}

- ($488472A07B2E1D1A523D39A95A553F6B)pinStateForX:(unint64_t)a3 y:(unint64_t)a4
{
  void *v4;
  $488472A07B2E1D1A523D39A95A553F6B v5;

  -[SCRO2DBrailleCanvas _pinForX:y:](self, "_pinForX:y:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5.var0 = objc_msgSend(v4, "state");

  return ($488472A07B2E1D1A523D39A95A553F6B)v5.var0;
}

- (void)_clearCells
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_pins;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setState:", -[SCRO2DBrailleCanvas _fullyDownPinState](self, "_fullyDownPinState", (_QWORD)v8));
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_updateCells
{
  -[SCRO2DBrailleCanvas _clearCells](self, "_clearCells");
  -[SCRO2DBrailleCanvas _blitBMP](self, "_blitBMP");
}

- (void)setNumberOfTextLines:(unint64_t)a3
{
  if (-[SCRO2DBrailleCanvasDescriptor numberOfTextLinesAvailable](self->_descriptor, "numberOfTextLinesAvailable") < a3)
    -[SCRO2DBrailleCanvasDescriptor numberOfTextLinesAvailable](self->_descriptor, "numberOfTextLinesAvailable");
  self->_numberOfTextLines = a3;
}

- (unint64_t)_numberOfTextLines
{
  return self->_numberOfTextLines;
}

- (unint64_t)_textDisplayHeight
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[SCRO2DBrailleCanvas cellHeight](self, "cellHeight");
  v4 = v3
     + -[SCRO2DBrailleCanvasDescriptor skipPinBetweenCellsVertically](self->_descriptor, "skipPinBetweenCellsVertically");
  return v4 * -[SCRO2DBrailleCanvas _numberOfTextLines](self, "_numberOfTextLines");
}

- (void)setBrailleText:(const char *)a3 length:(unint64_t)a4
{
  NSData *v5;
  NSData *brailleTextData;

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a3, a4);
  v5 = (NSData *)objc_claimAutoreleasedReturnValue();
  brailleTextData = self->_brailleTextData;
  self->_brailleTextData = v5;

  -[SCRO2DBrailleCanvas _updateTextCells](self, "_updateTextCells");
}

- (void)_blitBMP
{
  unsigned __int8 *v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unsigned int v8;
  float v9;

  v3 = -[NSData bytes](self->_imageData, "bytes");
  v4 = -[NSData length](self->_imageData, "length");
  if (-[SCRO2DBrailleCanvasDescriptor height](self->_descriptor, "height"))
  {
    v5 = 0;
    do
    {
      if (-[SCRO2DBrailleCanvasDescriptor width](self->_descriptor, "width"))
      {
        v6 = 0;
        do
        {
          v7 = -[SCRO2DBrailleCanvasDescriptor width](self->_descriptor, "width");
          if (v6 + v5 * v7 >= v4)
            v8 = 0;
          else
            v8 = v3[v5 * v7 + v6];
          if (-[SCRO2DBrailleCanvasDescriptor pinHeightStyle](self->_descriptor, "pinHeightStyle") == 2)
            v9 = *(float *)&v8;
          else
            v9 = (double)v8 / 255.0;
          -[SCRO2DBrailleCanvas setPinState:forX:y:](self, "setPinState:forX:y:", LODWORD(v9), v6++, v5);
        }
        while (v6 < -[SCRO2DBrailleCanvasDescriptor width](self->_descriptor, "width"));
      }
      ++v5;
    }
    while (v5 < -[SCRO2DBrailleCanvasDescriptor height](self->_descriptor, "height"));
  }
}

- (void)_blitText
{
  unsigned __int8 *v3;
  NSUInteger v4;
  BOOL v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v3 = -[NSData bytes](self->_brailleTextData, "bytes");
  v4 = -[NSData length](self->_brailleTextData, "length");
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    v6 = v4;
    v7 = 0;
    v8 = 0;
    do
    {
      if (!-[SCRO2DBrailleCanvas _canBlitCellAtX:y:](self, "_canBlitCellAtX:y:", v8, v7))
        break;
      -[SCRO2DBrailleCanvas _blitCell:AtX:y:](self, "_blitCell:AtX:y:", *v3, v8, v7);
      v9 = -[SCRO2DBrailleCanvas cellWidth](self, "cellWidth") + v8;
      v8 = v9
         + -[SCRO2DBrailleCanvasDescriptor skipPinBetweenCellsHorizontally](self->_descriptor, "skipPinBetweenCellsHorizontally");
      if (!-[SCRO2DBrailleCanvas _canBlitCellAtX:y:](self, "_canBlitCellAtX:y:", v8, v7))
      {
        v10 = -[SCRO2DBrailleCanvas cellHeight](self, "cellHeight") + v7;
        v8 = 0;
        v7 = v10
           + -[SCRO2DBrailleCanvasDescriptor skipPinBetweenCellsVertically](self->_descriptor, "skipPinBetweenCellsVertically");
      }
      ++v3;
      --v6;
    }
    while (v6);
  }
}

- (unint64_t)cellHeight
{
  return -[SCRO2DBrailleCanvasDescriptor cellHeight](self->_descriptor, "cellHeight");
}

- (unint64_t)cellWidth
{
  return -[SCRO2DBrailleCanvasDescriptor cellWidth](self->_descriptor, "cellWidth");
}

- (BOOL)_canBlitCellAtX:(unint64_t)a3 y:(unint64_t)a4
{
  unint64_t v7;
  unint64_t v8;

  v7 = -[SCRO2DBrailleCanvas cellHeight](self, "cellHeight");
  v8 = a3 + -[SCRO2DBrailleCanvas cellWidth](self, "cellWidth") - 1;
  return v8 < -[SCRO2DBrailleCanvasDescriptor width](self->_descriptor, "width")
      && a4 + v7 - 1 < -[SCRO2DBrailleCanvasDescriptor height](self->_descriptor, "height");
}

- (void)_blitCell:(unsigned __int8)a3 AtX:(unint64_t)a4 y:(unint64_t)a5
{
  int v7;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  $488472A07B2E1D1A523D39A95A553F6B v14;

  v7 = a3;
  if (-[SCRO2DBrailleCanvas cellWidth](self, "cellWidth") + a4 > a4)
  {
    v9 = a4;
    do
    {
      if (-[SCRO2DBrailleCanvas cellHeight](self, "cellHeight") + a5 > a5)
      {
        v10 = 0;
        v11 = v9 - a4;
        do
        {
          if (v9 != a4 || v10)
          {
            if (v9 == a4 && v10 == 1)
            {
              v12 = 2;
            }
            else if (v9 == a4 && v10 == 2)
            {
              v12 = 4;
            }
            else if (v9 == a4 && v10 == 3)
            {
              v12 = 64;
            }
            else if (v11 != 1 || v10)
            {
              if (v11 == 1 && v10 == 1)
              {
                v12 = 16;
              }
              else if (v11 == 1 && v10 == 2)
              {
                v12 = 32;
              }
              else if (v10 == 3 && v11 == 1)
              {
                v12 = 128;
              }
              else
              {
                v12 = 0;
              }
            }
            else
            {
              v12 = 8;
            }
          }
          else
          {
            v12 = 1;
          }
          if ((v12 & v7) != 0)
            v14.var0 = (unint64_t)-[SCRO2DBrailleCanvas _fullyUpPinState](self, "_fullyUpPinState");
          else
            v14.var0 = (unint64_t)-[SCRO2DBrailleCanvas _fullyDownPinState](self, "_fullyDownPinState");
          -[SCRO2DBrailleCanvas setPinState:forX:y:](self, "setPinState:forX:y:", v14.var0, v9, a5 + v10++);
        }
        while (a5 + v10 < -[SCRO2DBrailleCanvas cellHeight](self, "cellHeight") + a5);
      }
      ++v9;
    }
    while (v9 < -[SCRO2DBrailleCanvas cellWidth](self, "cellWidth") + a4);
  }
}

- ($488472A07B2E1D1A523D39A95A553F6B)_fullyDownPinState
{
  if (-[SCRO2DBrailleCanvasDescriptor pinHeightStyle](self->_descriptor, "pinHeightStyle") != 1
    && -[SCRO2DBrailleCanvasDescriptor pinHeightStyle](self->_descriptor, "pinHeightStyle") != 2)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("SCRO2DBrailleException"), CFSTR("Unexpected pinHeightStyle: %ld"), -[SCRO2DBrailleCanvasDescriptor pinHeightStyle](self->_descriptor, "pinHeightStyle"));
  }
  return ($488472A07B2E1D1A523D39A95A553F6B)0;
}

- ($488472A07B2E1D1A523D39A95A553F6B)_fullyUpPinState
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  if (-[SCRO2DBrailleCanvasDescriptor pinHeightStyle](self->_descriptor, "pinHeightStyle") == 1)
  {
    v3 = 0;
    v4 = 1065353216;
  }
  else if (-[SCRO2DBrailleCanvasDescriptor pinHeightStyle](self->_descriptor, "pinHeightStyle") == 2)
  {
    v5 = -[SCRO2DBrailleCanvasDescriptor detentCount](self->_descriptor, "detentCount");
    v3 = (v5 - 1) & 0xFFFFFFFF00000000;
    v4 = (v5 - 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("SCRO2DBrailleException"), CFSTR("Unexpected pinHeightStyle: %ld"), -[SCRO2DBrailleCanvasDescriptor pinHeightStyle](self->_descriptor, "pinHeightStyle"));
    v3 = 0;
    v4 = 0;
  }
  return ($488472A07B2E1D1A523D39A95A553F6B)(v4 | v3);
}

- (void)setImageData:(id)a3
{
  objc_storeStrong((id *)&self->_imageData, a3);
  -[SCRO2DBrailleCanvas _updateCells](self, "_updateCells");
}

- (NSData)imageData
{
  return self->_imageData;
}

- (SCRO2DBrailleCanvasDescriptor)descriptor
{
  return (SCRO2DBrailleCanvasDescriptor *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)numberOfTextLines
{
  return self->_numberOfTextLines;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_brailleTextData, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_pins, 0);
}

- (id)debugAsciiCanvas
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  __CFString *v10;
  const __CFString *v11;
  __CFString *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;

  -[SCRO2DBrailleCanvas descriptor](self, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "height");

  if (v4)
  {
    v5 = 0;
    v6 = &stru_24CC1DB88;
    do
    {
      -[SCRO2DBrailleCanvas descriptor](self, "descriptor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "width");

      if (v8)
      {
        v9 = 0;
        v10 = &stru_24CC1DB88;
        do
        {
          if (-[SCRO2DBrailleCanvas pinStateForX:y:](self, "pinStateForX:y:", v9, v5))
            v11 = CFSTR("#");
          else
            v11 = CFSTR(".");
          -[__CFString stringByAppendingString:](v10, "stringByAppendingString:", v11);
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

          ++v9;
          -[SCRO2DBrailleCanvas descriptor](self, "descriptor");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "width");

          v10 = v12;
        }
        while (v9 < v14);
      }
      else
      {
        v12 = &stru_24CC1DB88;
      }
      -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "stringByAppendingString:", CFSTR("\n"));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      ++v5;
      -[SCRO2DBrailleCanvas descriptor](self, "descriptor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "height");

    }
    while (v5 < v17);
  }
  else
  {
    v6 = &stru_24CC1DB88;
  }
  return v6;
}

@end
