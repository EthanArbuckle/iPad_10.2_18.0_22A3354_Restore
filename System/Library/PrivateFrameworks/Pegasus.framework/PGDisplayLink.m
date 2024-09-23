@implementation PGDisplayLink

- (PGDisplayLink)initWithOwner:(id)a3 linkFired:(id)a4
{
  id v6;
  id v7;
  PGDisplayLink *v8;
  PGDisplayLink *v9;
  uint64_t v10;
  id linkFired;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PGDisplayLink;
  v8 = -[PGDisplayLink init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak(&v8->_owner, v6);
    v10 = MEMORY[0x1B5E0FE80](v7);
    linkFired = v9->_linkFired;
    v9->_linkFired = (id)v10;

  }
  return v9;
}

- (void)setPreferredFramesPerSecond:(unint64_t)a3
{
  CADisplayLink *link;
  uint64_t v6;
  CADisplayLink *v7;
  CADisplayLink *v8;
  CADisplayLink *v9;
  id v10;

  if (self->_preferredFramesPerSecond == a3)
    return;
  self->_preferredFramesPerSecond = a3;
  if (self->_invalidated)
    return;
  link = self->_link;
  if (!a3)
  {
    v6 = 1;
    goto LABEL_9;
  }
  if (!link)
  {
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__linkFired_);
    v7 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    v8 = self->_link;
    self->_link = v7;

    -[CADisplayLink setPreferredFramesPerSecond:](self->_link, "setPreferredFramesPerSecond:", a3);
    v9 = self->_link;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v9, "addToRunLoop:forMode:", v10, *MEMORY[0x1E0C99860]);

    return;
  }
  -[CADisplayLink setPreferredFramesPerSecond:](link, "setPreferredFramesPerSecond:", a3);
  if (-[CADisplayLink isPaused](self->_link, "isPaused"))
  {
    link = self->_link;
    v6 = 0;
LABEL_9:
    -[CADisplayLink setPaused:](link, "setPaused:", v6);
  }
}

- (void)invalidate
{
  CADisplayLink *link;

  self->_invalidated = 1;
  -[CADisplayLink invalidate](self->_link, "invalidate");
  link = self->_link;
  self->_link = 0;

}

- (void)_linkFired:(id)a3
{
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id v5;

  -[PGDisplayLink owner](self, "owner", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PGDisplayLink linkFired](self, "linkFired");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, PGDisplayLink *))v4)[2](v4, v5, self);

  }
  else
  {
    -[PGDisplayLink invalidate](self, "invalidate");
  }

}

- (id)owner
{
  return objc_loadWeakRetained(&self->_owner);
}

- (id)linkFired
{
  return self->_linkFired;
}

- (unint64_t)preferredFramesPerSecond
{
  return self->_preferredFramesPerSecond;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_linkFired, 0);
  objc_destroyWeak(&self->_owner);
  objc_storeStrong((id *)&self->_link, 0);
}

@end
