@implementation MTSyncedEpisodeObserver

- (MTSyncedEpisodeObserver)initWithBlock:(id)a3
{
  id v4;
  MTSyncedEpisodeObserver *v5;
  MTSyncedEpisodeObserver *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTSyncedEpisodeObserver;
  v5 = -[MTSyncedEpisodeObserver init](&v8, "init");
  v6 = v5;
  if (v5)
    -[MTSyncedEpisodeObserver setBlock:](v5, "setBlock:", v4);

  return v6;
}

+ (id)observerWithBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithBlock:", v4);

  return v5;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
