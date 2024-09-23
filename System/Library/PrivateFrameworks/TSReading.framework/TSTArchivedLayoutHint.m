@implementation TSTArchivedLayoutHint

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTArchivedLayoutHint;
  -[TSTArchivedLayoutHint dealloc](&v3, sel_dealloc);
}

- (void)setHint:(id)a3
{
  if (self->mHint != a3)
  {
    -[TSPObject willModify](self, "willModify");

    self->mHint = (TSTLayoutHint *)a3;
  }
}

- (TSTArchivedLayoutHint)initWithContext:(id)a3 hint:(id)a4
{
  TSTArchivedLayoutHint *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSTArchivedLayoutHint;
  v5 = -[TSPObject initWithContext:](&v7, sel_initWithContext_, a3);
  if (v5)
    v5->mHint = (TSTLayoutHint *)a4;
  return v5;
}

- (TSTLayoutHint)hint
{
  return self->mHint;
}

@end
