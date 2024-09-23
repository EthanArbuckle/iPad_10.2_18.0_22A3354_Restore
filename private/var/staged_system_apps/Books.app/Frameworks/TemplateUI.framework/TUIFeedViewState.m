@implementation TUIFeedViewState

- (TUIFeedViewState)initWithOther:(id)a3
{
  id v4;
  TUIFeedViewState *v5;
  void *v6;
  TUIScrollAnchor *v7;
  TUIScrollAnchor *feedScrollAnchor;
  void *v9;
  NSDictionary *v10;
  NSDictionary *embeddedScrollAnchors;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TUIFeedViewState;
  v5 = -[TUIFeedViewState init](&v13, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "feedScrollAnchor"));
    v7 = (TUIScrollAnchor *)objc_msgSend(v6, "copy");
    feedScrollAnchor = v5->_feedScrollAnchor;
    v5->_feedScrollAnchor = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "embeddedScrollAnchors"));
    v10 = (NSDictionary *)objc_msgSend(v9, "copy");
    embeddedScrollAnchors = v5->_embeddedScrollAnchors;
    v5->_embeddedScrollAnchors = v10;

  }
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[TUIMutableFeedViewState initWithOther:]([TUIMutableFeedViewState alloc], "initWithOther:", self);
}

- (id)embeddedScrollAnchorForIdentifier:(id)a3
{
  if (a3)
    return (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_embeddedScrollAnchors, "objectForKeyedSubscript:"));
  else
    return 0;
}

- (TUIScrollAnchor)feedScrollAnchor
{
  return self->_feedScrollAnchor;
}

- (void)setFeedScrollAnchor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)embeddedScrollAnchors
{
  return self->_embeddedScrollAnchors;
}

- (void)setEmbeddedScrollAnchors:(id)a3
{
  objc_storeStrong((id *)&self->_embeddedScrollAnchors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddedScrollAnchors, 0);
  objc_storeStrong((id *)&self->_feedScrollAnchor, 0);
}

@end
