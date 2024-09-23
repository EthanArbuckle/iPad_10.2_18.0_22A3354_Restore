@implementation THNoteCardBodyLayer

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THNoteCardBodyLayer;
  -[THNoteCardBodyLayer dealloc](&v3, "dealloc");
}

- (NSArray)interactiveLayers
{
  return 0;
}

- (BOOL)shouldForceCentered
{
  return 0;
}

- (void)sizeToFit
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;

  -[THNoteCardBodyLayer bounds](self, "bounds");
  -[THNoteCardBodyLayer sizeThatFits:](self, "sizeThatFits:", v3, v4);
  v6 = v5;
  v8 = v7;
  v9 = -[THNoteCardBodyLayer frame](self, "frame");
  -[THNoteCardBodyLayer setFrame:](self, "setFrame:", TSDRectWithOriginAndSize(v9, v10, v11, v6, v8));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[THNoteCardBodyLayer bounds](self, "bounds", a3.width, a3.height);
  v4 = v3;
  v6 = v5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)setLayoutContext:(id)a3
{
  THNoteCardLayoutContext *layoutContext;

  layoutContext = self->_layoutContext;
  if (layoutContext != a3)
  {

    self->_layoutContext = (THNoteCardLayoutContext *)a3;
    -[THNoteCardBodyLayer setNeedsLayout](self, "setNeedsLayout");
  }
}

- (THNoteCardLayoutContext)layoutContext
{
  return self->_layoutContext;
}

@end
