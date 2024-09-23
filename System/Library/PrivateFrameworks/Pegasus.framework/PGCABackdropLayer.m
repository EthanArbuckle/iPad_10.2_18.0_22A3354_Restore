@implementation PGCABackdropLayer

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  -[PGCABackdropLayer valueForKeyPath:](self, "valueForKeyPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqual:", v6) & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)PGCABackdropLayer;
    -[PGCABackdropLayer setValue:forKeyPath:](&v9, sel_setValue_forKeyPath_, v6, v7);
  }

}

- (void)setScale:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PGCABackdropLayer;
  -[PGCABackdropLayer setScale:](&v3, sel_setScale_, 0.25);
}

@end
