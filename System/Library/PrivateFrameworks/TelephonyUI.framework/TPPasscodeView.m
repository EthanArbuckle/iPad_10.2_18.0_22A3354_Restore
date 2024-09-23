@implementation TPPasscodeView

- (TPPasscodeView)initWithFrame:(CGRect)a3
{
  TPPasscodeView *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPPasscodeView;
  v3 = -[TPPasscodeView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPPasscodeView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPPasscodeView setPasscodeMutableString:](v3, "setPasscodeMutableString:", v5);

  }
  return v3;
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  double v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  unint64_t v32;
  id v33;
  CGRect v34;

  -[TPPasscodeView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(MEMORY[0x1E0DC3658], "dynamicBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFill");

  v34.origin.x = v5;
  v34.origin.y = v7;
  v34.size.width = v9;
  v34.size.height = v11;
  UIRectFill(v34);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", v5 + 0.5, v7 + 0.5, v9 + -1.0, v11 + -1.0, 4.0);
  v33 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setLineWidth:", 1.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "dynamicLabelColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setStroke");

  objc_msgSend(v33, "stroke");
  objc_msgSend(MEMORY[0x1E0DC3658], "dynamicLabelColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFill");

  -[TPPasscodeView passcodeMutableString](self, "passcodeMutableString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  -[TPPasscodeView passcodeMutableString](self, "passcodeMutableString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");
  if (v16 > 8)
  {

    -[TPPasscodeView passcodeMutableString](self, "passcodeMutableString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "length");

    if (v25)
    {
      v26 = 0;
      v27 = 112.0 / (double)v18 * 0.5;
      v28 = (v11 + -2.0 - v27) * 0.5;
      v29 = 22.0;
      do
      {
        objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", v29, v28, v27, v27);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "fill");
        v29 = v27 + v27 + v29;

        ++v26;
        -[TPPasscodeView passcodeMutableString](self, "passcodeMutableString");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "length");

      }
      while (v26 < v32);
    }
  }
  else
  {

    if (v18)
    {
      v19 = 0;
      v20 = 22.0;
      do
      {
        objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", v20, 15.0, 7.0, 7.0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "fill");
        v20 = v20 + 14.0;

        ++v19;
        -[TPPasscodeView passcodeMutableString](self, "passcodeMutableString");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "length");

      }
      while (v19 < v23);
    }
  }

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 150.0;
  v3 = 38.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSString)passcodeString
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[TPPasscodeView passcodeMutableString](self, "passcodeMutableString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)appendCharacter:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[TPPasscodeView passcodeMutableString](self, "passcodeMutableString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v4);

  -[TPPasscodeView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)deleteLastCharacter
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[TPPasscodeView passcodeMutableString](self, "passcodeMutableString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[TPPasscodeView passcodeMutableString](self, "passcodeMutableString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPPasscodeView passcodeMutableString](self, "passcodeMutableString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deleteCharactersInRange:", objc_msgSend(v6, "length") - 1, 1);

    -[TPPasscodeView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)clear
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[TPPasscodeView passcodeMutableString](self, "passcodeMutableString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[TPPasscodeView passcodeMutableString](self, "passcodeMutableString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPPasscodeView passcodeMutableString](self, "passcodeMutableString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deleteCharactersInRange:", 0, objc_msgSend(v6, "length"));

    -[TPPasscodeView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (NSMutableString)passcodeMutableString
{
  return (NSMutableString *)objc_getProperty(self, a2, 416, 1);
}

- (void)setPasscodeMutableString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 416);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcodeMutableString, 0);
}

@end
