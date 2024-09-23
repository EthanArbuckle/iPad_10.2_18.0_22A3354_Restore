@implementation DebugButtonCell

+ (id)cellWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  id v7;
  id v8;
  DebugButtonCell *v9;

  v7 = a3;
  v8 = a5;
  v9 = -[DebugButtonCell initWithTitle:style:handler:]([DebugButtonCell alloc], "initWithTitle:style:handler:", v7, a4, v8);

  return v9;
}

+ (id)cellWithTitle:(id)a3 style:(int64_t)a4 target:(id)a5 action:(SEL)a6
{
  id v9;
  DebugButtonCell *v10;
  DebugButtonCell *v11;
  _QWORD v13[4];
  id v14[2];
  id location;

  v9 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, a5);
  v10 = [DebugButtonCell alloc];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10008AE20;
  v13[3] = &unk_10051C460;
  objc_copyWeak(v14, &location);
  v14[1] = (id)a6;
  v11 = -[DebugButtonCell initWithTitle:style:handler:](v10, "initWithTitle:style:handler:", v9, a4, v13);
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);

  return v11;
}

+ (id)cellWithTitle:(id)a3 detailProvider:(id)a4 defaultKey:(id)a5 handler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  DebugButtonCell *v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = -[DebugButtonCell initWithTitle:detailProvider:defaultKey:handler:]([DebugButtonCell alloc], "initWithTitle:detailProvider:defaultKey:handler:", v9, v10, v11, v12);

  return v13;
}

- (DebugButtonCell)initWithTitle:(id)a3 detailProvider:(id)a4 defaultKey:(id)a5 handler:(id)a6
{
  id v10;
  uint64_t (**v11)(_QWORD);
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  DebugButtonCell *v16;
  uint64_t (**v17)(_QWORD);
  id detailProvider;
  void *v19;
  uint64_t v20;
  EFCancelable *observationToken;
  _QWORD v23[4];
  id v24;
  id location;

  v10 = a3;
  v11 = (uint64_t (**)(_QWORD))a4;
  v12 = a5;
  v13 = a6;
  v14 = v11[2](v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = -[DebugButtonCell initWithTitle:detail:style:handler:](self, "initWithTitle:detail:style:handler:", v10, v15, 2, v13);

  if (v16)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v16);
    v17 = objc_retainBlock(v11);
    detailProvider = v16->_detailProvider;
    v16->_detailProvider = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10008B150;
    v23[3] = &unk_10051C488;
    objc_copyWeak(&v24, &location);
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "ef_observeKeyPath:options:autoCancelToken:usingBlock:", v12, 1, 1, v23));
    observationToken = v16->_observationToken;
    v16->_observationToken = (EFCancelable *)v20;

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v16;
}

- (DebugButtonCell)initWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  return -[DebugButtonCell initWithTitle:detail:style:handler:](self, "initWithTitle:detail:style:handler:", a3, 0, a4, a5);
}

- (DebugButtonCell)initWithTitle:(id)a3 detail:(id)a4 style:(int64_t)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  DebugButtonCell *v13;
  id v14;
  id handler;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)DebugButtonCell;
  v13 = -[DebugButtonCell initWithStyle:reuseIdentifier:](&v23, "initWithStyle:reuseIdentifier:", v11 != 0, 0);
  if (!v13)
    goto LABEL_9;
  v14 = objc_retainBlock(v12);
  handler = v13->_handler;
  v13->_handler = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[DebugButtonCell textLabel](v13, "textLabel"));
  objc_msgSend(v16, "setText:", v10);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[DebugButtonCell detailTextLabel](v13, "detailTextLabel"));
  objc_msgSend(v17, "setText:", v11);

  switch(a5)
  {
    case 0:
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[DebugButtonCell textLabel](v13, "textLabel"));
      objc_msgSend(v18, "setTextAlignment:", 1);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor linkColor](UIColor, "linkColor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[DebugButtonCell textLabel](v13, "textLabel"));
      objc_msgSend(v20, "setTextColor:", v19);
LABEL_8:

      break;
    case 1:
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[DebugButtonCell textLabel](v13, "textLabel"));
      objc_msgSend(v21, "setTextAlignment:", 1);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[DebugButtonCell textLabel](v13, "textLabel"));
      objc_msgSend(v20, "setTextColor:", v19);
      goto LABEL_8;
    case 2:
      -[DebugButtonCell setAccessoryType:](v13, "setAccessoryType:", 1);
      break;
  }
LABEL_9:

  return v13;
}

- (void)invokeAction
{
  void (**v2)(void);

  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[DebugButtonCell handler](self, "handler"));
  v2[2]();

}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)detailProvider
{
  return self->_detailProvider;
}

- (void)setDetailProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (EFCancelable)observationToken
{
  return self->_observationToken;
}

- (void)setObservationToken:(id)a3
{
  objc_storeStrong((id *)&self->_observationToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationToken, 0);
  objc_storeStrong(&self->_detailProvider, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end
