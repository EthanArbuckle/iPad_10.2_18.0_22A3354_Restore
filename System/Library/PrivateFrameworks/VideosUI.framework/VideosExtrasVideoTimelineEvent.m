@implementation VideosExtrasVideoTimelineEvent

- (VideosExtrasVideoTimelineEvent)initWithElement:(id)a3 prev:(id)a4
{
  id v6;
  id v7;
  VideosExtrasVideoTimelineEvent *v8;
  void *v9;
  char isKindOfClass;
  uint64_t v11;
  IKLockupElement *lockup;
  double v13;
  double v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VideosExtrasVideoTimelineEvent;
  v8 = -[VideosExtrasVideoTimelineEvent init](&v16, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "relatedContent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v6, "relatedContent");
      v11 = objc_claimAutoreleasedReturnValue();
      lockup = v8->_lockup;
      v8->_lockup = (IKLockupElement *)v11;

    }
    objc_msgSend(v6, "offset");
    v8->_offset = v13;
    objc_msgSend(v6, "duration");
    v8->_duration = v14;
    objc_storeWeak((id *)&v8->_previous, v7);
  }

  return v8;
}

- (NSString)title
{
  void *v2;
  void *v3;
  void *v4;

  -[IKLockupElement title](self->_lockup, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)subHeader
{
  void *v2;
  void *v3;
  void *v4;

  -[IKLockupElement subtitle](self->_lockup, "subtitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)loadImage:(id)a3
{
  id v4;
  IKLockupElement *lockup;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  _QWORD v14[4];
  id v15;
  CGRect v16;

  v4 = a3;
  if (v4)
  {
    lockup = self->_lockup;
    if (lockup
      && (-[IKLockupElement image](lockup, "image"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v6,
          v6))
    {
      -[IKLockupElement image](self->_lockup, "image");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "artworkCatalog");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = 100.0;
      v10 = 75.0;
      v16.origin.x = 0.0;
      v16.origin.y = 0.0;
      v16.size.width = 100.0;
      v16.size.height = 75.0;
      if (CGRectIsEmpty(v16))
      {
        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bounds");
        v9 = v12;
        v10 = v13;

      }
      objc_msgSend(v8, "setFittingSize:", v9, v10);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __44__VideosExtrasVideoTimelineEvent_loadImage___block_invoke;
      v14[3] = &unk_1E9FA2FB0;
      v15 = v4;
      objc_msgSend(v8, "setDestination:configurationBlock:", self, v14);

    }
    else
    {
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
    }
  }

}

uint64_t __44__VideosExtrasVideoTimelineEvent_loadImage___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IKLockupElement title](self->_lockup, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<Event title: %@, offset: %f, duration: %f>"), v5, *(_QWORD *)&self->_offset, *(_QWORD *)&self->_duration);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isFirstEvent
{
  return self->_isFirstEvent;
}

- (void)setIsFirstEvent:(BOOL)a3
{
  self->_isFirstEvent = a3;
}

- (double)offset
{
  return self->_offset;
}

- (double)duration
{
  return self->_duration;
}

- (VideosExtrasVideoTimelineEvent)previous
{
  return (VideosExtrasVideoTimelineEvent *)objc_loadWeakRetained((id *)&self->_previous);
}

- (VideosExtrasVideoTimelineEvent)next
{
  return (VideosExtrasVideoTimelineEvent *)objc_loadWeakRetained((id *)&self->_next);
}

- (void)setNext:(id)a3
{
  objc_storeWeak((id *)&self->_next, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_next);
  objc_destroyWeak((id *)&self->_previous);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_lockup, 0);
}

@end
