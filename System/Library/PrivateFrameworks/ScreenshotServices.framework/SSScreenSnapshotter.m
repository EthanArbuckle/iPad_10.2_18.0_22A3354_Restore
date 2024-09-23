@implementation SSScreenSnapshotter

+ (id)snapshotterForScreen:(id)a3
{
  id v3;
  id v4;
  __objc2_class **v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = off_24D06B2D8;
  if (v4 != v3)
    v5 = off_24D06B2F0;
  v6 = (void *)objc_msgSend(objc_alloc(*v5), "initWithScreen:", v3);

  return v6;
}

- (SSScreenSnapshotter)initWithScreen:(id)a3
{
  UIScreen *v4;
  SSScreenSnapshotter *v5;
  UIScreen *screen;
  objc_super v8;

  v4 = (UIScreen *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SSScreenSnapshotter;
  v5 = -[SSScreenSnapshotter init](&v8, sel_init);
  screen = v5->_screen;
  v5->_screen = v4;

  return v5;
}

- (id)takeScreenshot
{
  return 0;
}

- (UIScreen)screen
{
  return self->_screen;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screen, 0);
}

@end
