@implementation THModelBoundAnchor

- (THModelBoundAnchor)initWithContentNode:(id)a3
{
  THModelBoundAnchor *v4;
  THModelBoundAnchor *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THModelBoundAnchor;
  v4 = -[THModelBoundAnchor init](&v7, "init");
  v5 = v4;
  if (v4)
    -[THModelBoundAnchor setContentNode:](v4, "setContentNode:", a3);
  return v5;
}

- (THModelBoundAnchor)initWithGlossaryEntry:(id)a3
{
  THModelBoundAnchor *v4;
  THModelBoundAnchor *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THModelBoundAnchor;
  v4 = -[THModelBoundAnchor init](&v7, "init");
  v5 = v4;
  if (v4)
    -[THModelBoundAnchor setGlossaryEntry:](v4, "setGlossaryEntry:", a3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[THModelBoundAnchor setContentNode:](self, "setContentNode:", 0);
  -[THModelBoundAnchor setGlossaryEntry:](self, "setGlossaryEntry:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THModelBoundAnchor;
  -[THModelBoundAnchor dealloc](&v3, "dealloc");
}

- (THModelContentNode)contentNode
{
  return self->mContentNode;
}

- (void)setContentNode:(id)a3
{
  self->mContentNode = (THModelContentNode *)a3;
}

- (THModelGlossaryEntry)glossaryEntry
{
  return self->mGlossaryEntry;
}

- (void)setGlossaryEntry:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
