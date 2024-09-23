@implementation SiriSharedUILatencyViewModel

- (SiriSharedUILatencyViewModel)initWithUserUtterance:(id)a3 shouldSuppress:(BOOL)a4
{
  id v7;
  SiriSharedUILatencyViewModel *v8;
  SiriSharedUILatencyViewModel *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SiriSharedUILatencyViewModel;
  v8 = -[SiriSharedUILatencyViewModel init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_userUtterance, a3);
    v9->_shouldSuppress = a4;
  }

  return v9;
}

- (BOOL)isEqualToViewModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  int v9;
  _BOOL4 v11;

  v4 = a3;
  if (v4)
  {
    -[SiriSharedUILatencyViewModel userUtterance](self, "userUtterance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[SiriSharedUILatencyViewModel userUtterance](self, "userUtterance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "userUtterance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", v7))
      {
        v8 = -[SiriSharedUILatencyViewModel shouldSuppress](self, "shouldSuppress");
        v9 = v8 ^ objc_msgSend(v4, "shouldSuppress") ^ 1;
      }
      else
      {
        LOBYTE(v9) = 0;
      }

    }
    else
    {
      objc_msgSend(v4, "userUtterance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        LOBYTE(v9) = 0;
      }
      else
      {
        v11 = -[SiriSharedUILatencyViewModel shouldSuppress](self, "shouldSuppress");
        v9 = v11 ^ objc_msgSend(v4, "shouldSuppress") ^ 1;
      }
    }

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)viewShouldUpdateFromOldModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[SiriSharedUILatencyViewModel isEqualToViewModel:](self, "isEqualToViewModel:", v4))
  {
    LOBYTE(self) = 0;
  }
  else if (v4 && (objc_msgSend(v4, "shouldDisplay") & 1) != 0)
  {
    if (-[SiriSharedUILatencyViewModel shouldDisplay](self, "shouldDisplay"))
    {
      -[SiriSharedUILatencyViewModel userUtterance](self, "userUtterance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "userUtterance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(self) = objc_msgSend(v5, "isEqualToString:", v6) ^ 1;

    }
    else
    {
      LOBYTE(self) = 1;
    }
  }
  else
  {
    LOBYTE(self) = -[SiriSharedUILatencyViewModel shouldDisplay](self, "shouldDisplay");
  }

  return (char)self;
}

- (BOOL)shouldDisplay
{
  return !-[SiriSharedUILatencyViewModel shouldSuppress](self, "shouldSuppress")
      && -[SiriSharedUILatencyViewModel _hasContent](self, "_hasContent");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SiriSharedUILatencyViewModel initWithUserUtterance:shouldSuppress:]([SiriSharedUILatencyViewModel alloc], "initWithUserUtterance:shouldSuppress:", self->_userUtterance, self->_shouldSuppress);
}

- (BOOL)_hasContent
{
  void *v3;
  void *v4;
  BOOL v5;

  -[SiriSharedUILatencyViewModel userUtterance](self, "userUtterance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SiriSharedUILatencyViewModel userUtterance](self, "userUtterance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)userUtterance
{
  return self->_userUtterance;
}

- (BOOL)shouldSuppress
{
  return self->_shouldSuppress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userUtterance, 0);
}

@end
