@implementation UICABackdropLayer

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  -[UICABackdropLayer valueForKeyPath:](self, "valueForKeyPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqual:", v6) & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)UICABackdropLayer;
    -[UICABackdropLayer setValue:forKeyPath:](&v9, sel_setValue_forKeyPath_, v6, v7);
  }

}

@end
