@implementation BCRenderingCacheBlockCallback

- (BCRenderingCacheBlockCallback)initWithCompletion:(id)a3
{
  id v4;
  BCRenderingCacheBlockCallback *v5;
  BCRenderingCacheBlockCallback *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BCRenderingCacheBlockCallback;
  v5 = -[BCRenderingCacheBlockCallback init](&v8, "init");
  v6 = v5;
  if (v5)
    -[BCRenderingCacheBlockCallback setCompletion:](v5, "setCompletion:", v4);

  return v6;
}

- (void)renderingCacheCallbackImage:(id)a3 context:(id)a4
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BCRenderingCacheBlockCallback completion](self, "completion"));
  v6 = (void *)v5;
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);

  -[BCRenderingCacheBlockCallback setCompletion:](self, "setCompletion:", 0);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
}

@end
