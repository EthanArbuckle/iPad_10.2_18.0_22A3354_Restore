@implementation THHighlight

- (void)dealloc
{
  objc_super v3;

  -[THHighlight setAnnotation:](self, "setAnnotation:", 0);
  -[THHighlight setLines:](self, "setLines:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THHighlight;
  -[THHighlight dealloc](&v3, "dealloc");
}

- (NSArray)lines
{
  return self->_lines;
}

- (void)setLines:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (THAnnotation)annotation
{
  return self->_annotation;
}

- (void)setAnnotation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
