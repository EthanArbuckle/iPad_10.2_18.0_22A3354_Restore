@implementation PBUIPosterFloatingLayerReplica

- (PBUIPosterFloatingLayerReplica)initWithFrame:(CGRect)a3
{
  PBUIPosterFloatingLayerReplica *v3;
  PBUIPosterFloatingLayerReplica *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PBUIPosterFloatingLayerReplica;
  v3 = -[PBUIPortalReplicaView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PBUIPortalReplicaView setShouldMatchWallpaperPosition:](v3, "setShouldMatchWallpaperPosition:", 1);
    -[PBUIPortalReplicaView setHidesSourceView:](v4, "setHidesSourceView:", 1);
    -[PBUIPortalReplicaView debugView](v4, "debugView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[PBUIPortalReplicaView debugView](v4, "debugView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "yellowColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "colorWithAlphaComponent:", 0.2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setColor:", v8);

    }
  }
  return v4;
}

- (void)setFloatingLayerStandin:(BOOL)a3
{
  if (self->_floatingLayerStandin != a3)
  {
    self->_floatingLayerStandin = a3;
    -[PBUIPortalReplicaView setNeedsSourceUpdate](self, "setNeedsSourceUpdate");
  }
}

- (BOOL)isFloatingLayerObserver
{
  return 1;
}

- (BOOL)isFloatingLayerStandin
{
  return self->_floatingLayerStandin;
}

@end
