@implementation TUIMutableFeedViewState

- (TUIMutableFeedViewState)initWithOther:(id)a3
{
  TUIMutableFeedViewState *v3;
  TUIMutableFeedViewState *v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUIMutableFeedViewState;
  v3 = -[TUIFeedViewState initWithOther:](&v8, "initWithOther:", a3);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewState embeddedScrollAnchors](v3, "embeddedScrollAnchors"));
    v6 = objc_msgSend(v5, "mutableCopy");
    -[TUIFeedViewState setEmbeddedScrollAnchors:](v4, "setEmbeddedScrollAnchors:", v6);

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TUIFeedViewState initWithOther:]([TUIFeedViewState alloc], "initWithOther:", self);
}

- (void)setEmbeddedScrollAnchor:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableDictionary *v9;
  id v10;

  if (a4)
  {
    v6 = a4;
    v7 = a3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewState embeddedScrollAnchors](self, "embeddedScrollAnchors"));

    if (!v8)
    {
      v9 = objc_opt_new(NSMutableDictionary);
      -[TUIFeedViewState setEmbeddedScrollAnchors:](self, "setEmbeddedScrollAnchors:", v9);

    }
    v10 = (id)objc_claimAutoreleasedReturnValue(-[TUIFeedViewState embeddedScrollAnchors](self, "embeddedScrollAnchors"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, v6);

  }
}

@end
