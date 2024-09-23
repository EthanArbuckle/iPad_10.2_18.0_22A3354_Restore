@implementation MTPropertyChangeQueryObserver

+ (Class)fetchedResultsControllerClass
{
  return (Class)objc_opt_class();
}

- (id)_frc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTPropertyChangeQueryObserver;
  -[MTBaseQueryObserver _frc](&v3, sel__frc);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setPropertyKeys:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTPropertyChangeQueryObserver _frc](self, "_frc");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPropertyKeys:", v4);

}

- (NSArray)propertyKeys
{
  void *v2;
  void *v3;

  -[MTPropertyChangeQueryObserver _frc](self, "_frc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

@end
