@implementation UITextPositionImpl

+ (id)wrapWebVisiblePosition:(id)a3
{
  id v3;
  UITextPositionImpl *v4;

  v3 = a3;
  v4 = objc_alloc_init(UITextPositionImpl);
  -[UITextPositionImpl setWebVisiblePosition:](v4, "setWebVisiblePosition:", v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UITextPositionImpl webVisiblePosition](self, "webVisiblePosition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "webVisiblePosition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;

  -[UITextPositionImpl webVisiblePosition](self, "webVisiblePosition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "positionOfNextBoundaryOfGranularity:inDirection:", 5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextPositionImpl webVisiblePosition](self, "webVisiblePosition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "positionOfNextBoundaryOfGranularity:inDirection:", 5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextPositionImpl webVisiblePosition](self, "webVisiblePosition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "positionByMovingInDirection:amount:", 1, 10);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (!v8)
    v8 = v4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  if (objc_msgSend(v4, "compare:", v8))
    v10 = CFSTR("...");
  else
    v10 = &stru_1E16EDF20;
  v11 = (void *)MEMORY[0x1E0DD9718];
  -[UITextPositionImpl webVisiblePosition](self, "webVisiblePosition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rangeForFirstPosition:second:", v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@%@"), v10, v14);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextPositionImpl webVisiblePosition](self, "webVisiblePosition");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "positionByMovingInDirection:amount:", 0, 10);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (!v16)
    v16 = v6;
  v17 = (void *)MEMORY[0x1E0CB3940];
  v18 = (void *)MEMORY[0x1E0DD9718];
  -[UITextPositionImpl webVisiblePosition](self, "webVisiblePosition");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "rangeForFirstPosition:second:", v19, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "text");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v6, "compare:", v16);
  v23 = CFSTR("...");
  if (!v22)
    v23 = &stru_1E16EDF20;
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%@%@"), v21, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x1E0CB3940];
  -[UITextPositionImpl webVisiblePosition](self, "webVisiblePosition");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("<UITextPosition: %p, %i, {\"%@\"}, {\"%@\"}>"), self, objc_msgSend(v26, "distanceFromPosition:", v4), v29, v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (WebVisiblePosition)webVisiblePosition
{
  return self->_webVisiblePosition;
}

- (void)setWebVisiblePosition:(id)a3
{
  objc_storeStrong((id *)&self->_webVisiblePosition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webVisiblePosition, 0);
}

@end
