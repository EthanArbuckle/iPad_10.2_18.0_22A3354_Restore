@implementation PREditingRequestRemoteViewControllerPresentationAction

- (PREditingRequestRemoteViewControllerPresentationAction)initWithSourceLayerRenderId:(unint64_t)a3 sourceContextId:(unsigned int)a4 presentedViewScreenRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v9;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  PREditingRequestRemoteViewControllerPresentationAction *v16;
  objc_super v18;
  _QWORD v19[4];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = *(_QWORD *)&a4;
  v12 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forSetting:", v13, 1);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forSetting:", v14, 2);

  *(CGFloat *)v19 = x;
  *(CGFloat *)&v19[1] = y;
  *(CGFloat *)&v19[2] = width;
  *(CGFloat *)&v19[3] = height;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v19, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forSetting:", v15, 3);

  v18.receiver = self;
  v18.super_class = (Class)PREditingRequestRemoteViewControllerPresentationAction;
  v16 = -[PREditingRequestRemoteViewControllerPresentationAction initWithInfo:responder:](&v18, sel_initWithInfo_responder_, v12, 0);

  return v16;
}

- (unint64_t)sourceLayerRenderId
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PREditingRequestRemoteViewControllerPresentationAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  return v4;
}

- (unsigned)sourceContextId
{
  void *v2;
  void *v3;
  unsigned int v4;

  -[PREditingRequestRemoteViewControllerPresentationAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntValue");

  return v4;
}

- (CGRect)presentedViewScreenRect
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[PREditingRequestRemoteViewControllerPresentationAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_CGRectValue");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

@end
