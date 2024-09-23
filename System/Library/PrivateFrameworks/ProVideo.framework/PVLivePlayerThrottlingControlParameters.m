@implementation PVLivePlayerThrottlingControlParameters

+ (id)CreateControllerParameters:(id)a3 :(id)a4 :(id)a5
{
  NSNumber *v7;
  NSNumber *v8;
  NSNumber *v9;
  PVLivePlayerThrottlingControlParameters *v10;
  NSNumber *renderLinkRate;
  NSNumber *v12;
  NSNumber *playerQueueSize;
  NSNumber *v14;
  NSNumber *playerBypassRenderLink;

  v7 = (NSNumber *)a3;
  v8 = (NSNumber *)a4;
  v9 = (NSNumber *)a5;
  v10 = objc_alloc_init(PVLivePlayerThrottlingControlParameters);
  renderLinkRate = v10->_renderLinkRate;
  v10->_renderLinkRate = v7;
  v12 = v7;

  playerQueueSize = v10->_playerQueueSize;
  v10->_playerQueueSize = v8;
  v14 = v8;

  playerBypassRenderLink = v10->_playerBypassRenderLink;
  v10->_playerBypassRenderLink = v9;

  return v10;
}

- (PVLivePlayerThrottlingControlParameters)init
{
  PVLivePlayerThrottlingControlParameters *v2;
  PVLivePlayerThrottlingControlParameters *v3;
  NSNumber *renderLinkRate;
  NSNumber *playerQueueSize;
  NSNumber *playerBypassRenderLink;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PVLivePlayerThrottlingControlParameters;
  v2 = -[PVLivePlayerThrottlingControlParameters init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    renderLinkRate = v2->_renderLinkRate;
    v2->_renderLinkRate = 0;

    playerQueueSize = v3->_playerQueueSize;
    v3->_playerQueueSize = 0;

    playerBypassRenderLink = v3->_playerBypassRenderLink;
    v3->_playerBypassRenderLink = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[PVLivePlayerThrottlingControlParameters renderLinkRate](self, "renderLinkRate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  -[PVLivePlayerThrottlingControlParameters playerQueueSize](self, "playerQueueSize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  -[PVLivePlayerThrottlingControlParameters playerBypassRenderLink](self, "playerBypassRenderLink");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  +[PVLivePlayerThrottlingControlParameters CreateControllerParameters:::](PVLivePlayerThrottlingControlParameters, "CreateControllerParameters:::", v5, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  PVLivePlayerThrottlingControlParameters *v7;
  PVLivePlayerThrottlingControlParameters *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;

  v7 = (PVLivePlayerThrottlingControlParameters *)a3;
  if (self == v7)
  {
    v10 = 1;
    goto LABEL_36;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = 0;
    goto LABEL_36;
  }
  v8 = v7;
  -[PVLivePlayerThrottlingControlParameters renderLinkRate](self, "renderLinkRate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[PVLivePlayerThrottlingControlParameters renderLinkRate](self, "renderLinkRate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PVLivePlayerThrottlingControlParameters renderLinkRate](v8, "renderLinkRate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqual:", v4) & 1) != 0)
      goto LABEL_11;
  }
  -[PVLivePlayerThrottlingControlParameters renderLinkRate](self, "renderLinkRate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    -[PVLivePlayerThrottlingControlParameters renderLinkRate](v8, "renderLinkRate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
LABEL_11:
      -[PVLivePlayerThrottlingControlParameters playerQueueSize](self, "playerQueueSize");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12
        && (-[PVLivePlayerThrottlingControlParameters playerQueueSize](self, "playerQueueSize"),
            v23 = (void *)objc_claimAutoreleasedReturnValue(),
            -[PVLivePlayerThrottlingControlParameters playerQueueSize](v8, "playerQueueSize"),
            v22 = objc_claimAutoreleasedReturnValue(),
            (objc_msgSend(v23, "isEqual:", v22) & 1) != 0))
      {
        v21 = 0;
      }
      else
      {
        -[PVLivePlayerThrottlingControlParameters playerQueueSize](self, "playerQueueSize");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v10 = 0;
LABEL_26:

          if (!v12)
          {
LABEL_32:

            goto LABEL_33;
          }
          v17 = (void *)v22;
LABEL_31:

          goto LABEL_32;
        }
        -[PVLivePlayerThrottlingControlParameters playerQueueSize](v8, "playerQueueSize");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {

          v10 = 0;
          goto LABEL_30;
        }
        v21 = 1;
      }
      -[PVLivePlayerThrottlingControlParameters playerBypassRenderLink](self, "playerBypassRenderLink");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        -[PVLivePlayerThrottlingControlParameters playerBypassRenderLink](self, "playerBypassRenderLink");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PVLivePlayerThrottlingControlParameters playerBypassRenderLink](v8, "playerBypassRenderLink");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v20, "isEqual:", v5) & 1) != 0)
        {
          v10 = 1;
          goto LABEL_24;
        }
      }
      -[PVLivePlayerThrottlingControlParameters playerBypassRenderLink](self, "playerBypassRenderLink");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {

        v10 = 0;
        if (v15)
          goto LABEL_24;
      }
      else
      {
        -[PVLivePlayerThrottlingControlParameters playerBypassRenderLink](v8, "playerBypassRenderLink");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v18 == 0;

        if (v15)
        {
LABEL_24:

          if ((v21 & 1) != 0)
          {
LABEL_25:
            v13 = 0;
            goto LABEL_26;
          }
LABEL_30:
          v17 = (void *)v22;
          if (!v12)
            goto LABEL_33;
          goto LABEL_31;
        }
      }
      if (v21)
        goto LABEL_25;
      goto LABEL_30;
    }
  }

  v10 = 0;
LABEL_33:
  if (v9)
  {

  }
LABEL_36:

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[PVLivePlayerThrottlingControlParameters renderLinkRate](self, "renderLinkRate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PVLivePlayerThrottlingControlParameters playerQueueSize](self, "playerQueueSize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[PVLivePlayerThrottlingControlParameters playerBypassRenderLink](self, "playerBypassRenderLink");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ v4 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)hasNilParameter
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[PVLivePlayerThrottlingControlParameters renderLinkRate](self, "renderLinkRate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PVLivePlayerThrottlingControlParameters playerQueueSize](self, "playerQueueSize");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[PVLivePlayerThrottlingControlParameters playerBypassRenderLink](self, "playerBypassRenderLink");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5 == 0;

    }
    else
    {
      v6 = 1;
    }

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)updateNilsFrom:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (v10)
  {
    -[PVLivePlayerThrottlingControlParameters renderLinkRate](self, "renderLinkRate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(v10, "renderLinkRate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PVLivePlayerThrottlingControlParameters setRenderLinkRate:](self, "setRenderLinkRate:", v5);

    }
    -[PVLivePlayerThrottlingControlParameters playerQueueSize](self, "playerQueueSize");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(v10, "playerQueueSize");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PVLivePlayerThrottlingControlParameters setPlayerQueueSize:](self, "setPlayerQueueSize:", v7);

    }
    -[PVLivePlayerThrottlingControlParameters playerBypassRenderLink](self, "playerBypassRenderLink");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(v10, "playerBypassRenderLink");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PVLivePlayerThrottlingControlParameters setPlayerBypassRenderLink:](self, "setPlayerBypassRenderLink:", v9);

    }
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PVLivePlayerThrottlingControlParameters renderLinkRate](self, "renderLinkRate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVLivePlayerThrottlingControlParameters playerQueueSize](self, "playerQueueSize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVLivePlayerThrottlingControlParameters playerBypassRenderLink](self, "playerBypassRenderLink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%p> renderLinkRate %2@ | playerQueueSize %2@ | playerBypassRenderLink %2@"), self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)renderLinkRate
{
  return self->_renderLinkRate;
}

- (void)setRenderLinkRate:(id)a3
{
  objc_storeStrong((id *)&self->_renderLinkRate, a3);
}

- (NSNumber)playerQueueSize
{
  return self->_playerQueueSize;
}

- (void)setPlayerQueueSize:(id)a3
{
  objc_storeStrong((id *)&self->_playerQueueSize, a3);
}

- (NSNumber)playerBypassRenderLink
{
  return self->_playerBypassRenderLink;
}

- (void)setPlayerBypassRenderLink:(id)a3
{
  objc_storeStrong((id *)&self->_playerBypassRenderLink, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerBypassRenderLink, 0);
  objc_storeStrong((id *)&self->_playerQueueSize, 0);
  objc_storeStrong((id *)&self->_renderLinkRate, 0);
}

@end
