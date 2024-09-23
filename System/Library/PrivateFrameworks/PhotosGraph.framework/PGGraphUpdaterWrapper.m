@implementation PGGraphUpdaterWrapper

- (PGGraphUpdaterWrapper)initWithGraphManager:(id)a3
{
  id v4;
  PGGraphUpdaterWrapper *v5;
  PGGraphUpdater *v6;
  PGGraphUpdater *graphUpdater;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphUpdaterWrapper;
  v5 = -[PGGraphUpdaterWrapper init](&v9, sel_init);
  if (v5)
  {
    v6 = -[PGGraphUpdater initWith:]([PGGraphUpdater alloc], "initWith:", v4);
    graphUpdater = v5->_graphUpdater;
    v5->_graphUpdater = v6;

  }
  return v5;
}

- (void)applyChangesFromGraphUpdate:(id)a3 progressReporter:(id)a4 completionHandler:(id)a5
{
  -[PGGraphUpdater applyChangesFrom:progressReporter:completionHandler:](self->_graphUpdater, "applyChangesFrom:progressReporter:completionHandler:", a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphUpdater, 0);
}

@end
