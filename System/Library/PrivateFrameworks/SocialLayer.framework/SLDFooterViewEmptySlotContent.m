@implementation SLDFooterViewEmptySlotContent

- (SLDFooterViewEmptySlotContent)initWithStyle:(id)a3 maxWidth:(double)a4 forRemote:(BOOL)a5
{
  SLDFooterViewEmptySlotContent *v5;
  SLDFooterViewEmptySlotContent *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SLDFooterViewEmptySlotContent;
  v5 = -[SLDEmptySlotContent initWithStyle:forRemote:](&v9, sel_initWithStyle_forRemote_, a3, a5, a4);
  v6 = v5;
  if (v5)
  {
    -[SLDEmptySlotContent style](v5, "style");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      -[SLDEmptySlotContent setContentSize:](v6, "setContentSize:", 0.0, 40.0);
  }
  return v6;
}

@end
