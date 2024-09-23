@implementation ICTintedLayer

- (void)setContents:(id)a3
{
  id v5;

  v5 = a3;
  if (self->_originalContents != v5)
    objc_storeStrong(&self->_originalContents, a3);
  -[ICTintedLayer updateContents](self, "updateContents");

}

- (void)setTintColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_tintColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_tintColor, a3);
    -[ICTintedLayer updateContents](self, "updateContents");
  }

}

- (void)updateContents
{
  void *v3;
  CGImage *originalContents;
  double Width;
  double v6;
  double v7;
  double Height;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  objc_super v15;
  _QWORD v16[8];

  -[ICTintedLayer tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  originalContents = (CGImage *)self->_originalContents;
  if (v3)
  {
    Width = (double)CGImageGetWidth((CGImageRef)self->_originalContents);
    -[ICTintedLayer contentsScale](self, "contentsScale");
    v7 = Width / v6;
    Height = (double)CGImageGetHeight(originalContents);
    -[ICTintedLayer contentsScale](self, "contentsScale");
    v10 = Height / v9;
    objc_msgSend(MEMORY[0x1E0DC3830], "defaultFormat");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTintedLayer contentsScale](self, "contentsScale");
    objc_msgSend(v11, "setScale:");
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v11, v7, v10);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __31__ICTintedLayer_updateContents__block_invoke;
    v16[3] = &unk_1E5C228C8;
    *(double *)&v16[5] = v7;
    *(double *)&v16[6] = v10;
    v16[7] = originalContents;
    v16[4] = self;
    objc_msgSend(v12, "imageWithActions:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15.receiver = self;
    v15.super_class = (Class)ICTintedLayer;
    -[ICTintedLayer setContents:](&v15, sel_setContents_, objc_msgSend(v13, "ic_CGImage"));

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICTintedLayer;
    -[ICTintedLayer setContents:](&v14, sel_setContents_, originalContents);
  }
}

void __31__ICTintedLayer_updateContents__block_invoke(uint64_t a1, void *a2)
{
  CGContext *v3;
  CGFloat v4;
  CGFloat v5;
  void *v6;
  CGRect v7;
  CGRect v8;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  v4 = *(double *)(a1 + 40);
  v5 = *(double *)(a1 + 48);
  v7.origin.x = 0.0;
  v7.origin.y = 0.0;
  v7.size.width = v4;
  v7.size.height = v5;
  CGContextDrawImage(v3, v7, *(CGImageRef *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "set");

  CGContextSetCompositeOperation();
  v8.origin.x = 0.0;
  v8.origin.y = 0.0;
  v8.size.width = v4;
  v8.size.height = v5;
  CGContextFillRect(v3, v8);
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (id)originalContents
{
  return self->_originalContents;
}

- (void)setOriginalContents:(id)a3
{
  objc_storeStrong(&self->_originalContents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_originalContents, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
}

@end
