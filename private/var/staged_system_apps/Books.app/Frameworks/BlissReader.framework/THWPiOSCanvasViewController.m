@implementation THWPiOSCanvasViewController

- (THWPiOSCanvasViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  THWPiOSCanvasViewController *v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THWPiOSCanvasViewController;
  v4 = -[THWPiOSCanvasViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v6 = -[THWPiOSCanvasViewController registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v5, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v4;
}

- (void)viewDidLoad
{
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWPiOSCanvasViewController;
  -[THWPiOSCanvasViewController viewDidLoad](&v5, "viewDidLoad");
  v4 = (void *)objc_opt_new(THiOSTraitsCache, v3);
  -[THWPiOSCanvasViewController setTraitsCache:](self, "setTraitsCache:", v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THWPiOSCanvasViewController;
  -[THWPiOSCanvasViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THWPiOSCanvasViewController traitsCache](self, "traitsCache"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THWPiOSCanvasViewController traitCollection](self, "traitCollection"));
  objc_msgSend(v4, "updateTraitsWithCollection:", v5);

}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[THWPiOSCanvasViewController traitsCache](self, "traitsCache", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THWPiOSCanvasViewController traitCollection](self, "traitCollection"));
  objc_msgSend(v6, "updateTraitsWithCollection:", v5);

}

- (THiOSTraitsCache)traitsCache
{
  return self->_traitsCache;
}

- (void)setTraitsCache:(id)a3
{
  objc_storeStrong((id *)&self->_traitsCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitsCache, 0);
}

@end
