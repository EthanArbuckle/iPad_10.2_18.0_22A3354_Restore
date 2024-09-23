@implementation ASKLoadMonogramResourceOperation

- (ASKLoadMonogramResourceOperation)initWithMonogramResourceURL:(id)a3
{
  id v4;
  ASKLoadMonogramResourceOperation *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ASKLoadMonogramResourceOperation;
  v5 = -[ASKLoadMonogramResourceOperation init](&v8, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTMonogramConfig monogramWithURL:](MTMonogramConfig, "monogramWithURL:", v4));
    -[ASKLoadMonogramResourceOperation setMonogramConfig:](v5, "setMonogramConfig:", v6);

  }
  return v5;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  unsigned int v3;

  v3 = -[ASKLoadMonogramResourceOperation isRendering](self, "isRendering");
  if (v3)
    LOBYTE(v3) = -[ASKLoadMonogramResourceOperation isCancelled](self, "isCancelled") ^ 1;
  return v3;
}

+ (id)keyPathsForValuesAffectingIsFinished
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("isCancelled"), CFSTR("isExecuting"), 0);
}

+ (id)keyPathsForValuesAffectingIsExecuting
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("isCancelled"), CFSTR("isRendering"), 0);
}

- (BOOL)isFinished
{
  if (-[ASKLoadMonogramResourceOperation isRendering](self, "isRendering"))
    return -[ASKLoadMonogramResourceOperation isCancelled](self, "isCancelled");
  else
    return 1;
}

- (BOOL)isRTL
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](NSLocale, "preferredLanguages"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  if (v3)
    v4 = (char *)+[NSLocale characterDirectionForLanguage:](NSLocale, "characterDirectionForLanguage:", v3) == (char *)&dword_0 + 2;
  else
    v4 = 0;

  return v4;
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASKLoadMonogramResourceOperation monogramConfig](self, "monogramConfig"));
  if (!v3 || -[ASKLoadMonogramResourceOperation isCancelled](self, "isCancelled"))
  {

LABEL_4:
    -[ASKLoadMonogramResourceOperation setIsRendering:](self, "setIsRendering:", 0);
    return;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASKLoadMonogramResourceOperation monogramConfig](self, "monogramConfig"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "formattedValue"));

  if (!v5)
    goto LABEL_4;
  -[ASKLoadMonogramResourceOperation setIsRendering:](self, "setIsRendering:", 1);
  v6 = objc_alloc((Class)CNAvatarImageRenderer);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CNAvatarImageRendererSettings defaultSettings](CNAvatarImageRendererSettings, "defaultSettings"));
  v8 = objc_msgSend(v6, "initWithSettings:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASKLoadMonogramResourceOperation monogramConfig](self, "monogramConfig"));
  objc_msgSend(v9, "size");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:", -[ASKLoadMonogramResourceOperation isRTL](self, "isRTL"), 0, v10, v11, 1.0));

  objc_initWeak(&location, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASKLoadMonogramResourceOperation monogramConfig](self, "monogramConfig"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "formattedValue"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __41__ASKLoadMonogramResourceOperation_start__block_invoke;
  v16[3] = &unk_372988;
  objc_copyWeak(&v17, &location);
  v15 = objc_msgSend(v8, "renderMonogramForString:scope:imageHandler:", v14, v12, v16);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __41__ASKLoadMonogramResourceOperation_start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __41__ASKLoadMonogramResourceOperation_start__block_invoke_2;
  v5[3] = &unk_372960;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void __41__ASKLoadMonogramResourceOperation_start__block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "didCompleteWithResource:error:", *(_QWORD *)(a1 + 32), 0);

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "setIsRendering:", 0);

}

- (MTMonogramConfig)monogramConfig
{
  return self->_monogramConfig;
}

- (void)setMonogramConfig:(id)a3
{
  objc_storeStrong((id *)&self->_monogramConfig, a3);
}

- (BOOL)isRendering
{
  return self->_isRendering;
}

- (void)setIsRendering:(BOOL)a3
{
  self->_isRendering = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monogramConfig, 0);
}

@end
