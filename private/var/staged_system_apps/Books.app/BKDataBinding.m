@implementation BKDataBinding

- (BKDataBinding)initWithBinding:(id)a3 key:(id)a4 to:(id)a5 key:(id)a6 transmitInitialValue:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  BKDataBinding *v16;
  BKDataBinding *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  objc_super v22;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v22.receiver = self;
  v22.super_class = (Class)BKDataBinding;
  v16 = -[BKDataBinding init](&v22, "init");
  v17 = v16;
  if (v16)
  {
    -[BKDataBinding setSrcKey:](v16, "setSrcKey:", v13);
    -[BKDataBinding setDstKey:](v17, "setDstKey:", v15);
    -[BKDataBinding setSrcObj:](v17, "setSrcObj:", v12);
    -[BKDataBinding setDstObj:](v17, "setDstObj:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKDataBinding srcObj](v17, "srcObj"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKDataBinding srcKey](v17, "srcKey"));
    if (v7)
      v20 = 5;
    else
      v20 = 1;
    objc_msgSend(v18, "addObserver:forKeyPath:options:context:", v17, v19, v20, off_1009CB4B8);

  }
  return v17;
}

- (void)dealloc
{
  objc_super v3;

  -[BKDataBinding unbind](self, "unbind");
  v3.receiver = self;
  v3.super_class = (Class)BKDataBinding;
  -[BKDataBinding dealloc](&v3, "dealloc");
}

- (void)unbind
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDataBinding srcObj](self, "srcObj"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKDataBinding srcKey](self, "srcKey"));
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, v4, off_1009CB4B8);

  objc_storeWeak((id *)&self->_srcObj, 0);
  objc_storeWeak((id *)&self->_dstObj, 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  objc_super v18;

  if (off_1009CB4B8 == a6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKDataBinding srcObj](self, "srcObj", a3, a4, a5));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKDataBinding srcKey](self, "srcKey"));
    v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKey:", v8));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKDataBinding dstObj](self, "dstObj"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKDataBinding dstKey](self, "dstKey"));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKey:", v10));

    if (v17 != v11 && (objc_msgSend(v17, "isEqual:", v11) & 1) == 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKDataBinding dstObj](self, "dstObj"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKDataBinding srcObj](self, "srcObj"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKDataBinding srcKey](self, "srcKey"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKey:", v14));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKDataBinding dstKey](self, "dstKey"));
      objc_msgSend(v12, "setValue:forKey:", v15, v16);

    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)BKDataBinding;
    -[BKDataBinding observeValueForKeyPath:ofObject:change:context:](&v18, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDataBinding srcKey](self, "srcKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKDataBinding dstKey](self, "dstKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKDataBinding srcObj](self, "srcObj"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKDataBinding dstObj](self, "dstObj"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Binding: %@ to %@ for %@ and %@"), v3, v4, v5, v6));

  return v7;
}

- (NSString)srcKey
{
  return self->_srcKey;
}

- (void)setSrcKey:(id)a3
{
  objc_storeStrong((id *)&self->_srcKey, a3);
}

- (NSString)dstKey
{
  return self->_dstKey;
}

- (void)setDstKey:(id)a3
{
  objc_storeStrong((id *)&self->_dstKey, a3);
}

- (NSObject)srcObj
{
  return objc_loadWeakRetained((id *)&self->_srcObj);
}

- (void)setSrcObj:(id)a3
{
  objc_storeWeak((id *)&self->_srcObj, a3);
}

- (NSObject)dstObj
{
  return objc_loadWeakRetained((id *)&self->_dstObj);
}

- (void)setDstObj:(id)a3
{
  objc_storeWeak((id *)&self->_dstObj, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dstObj);
  objc_destroyWeak((id *)&self->_srcObj);
  objc_storeStrong((id *)&self->_dstKey, 0);
  objc_storeStrong((id *)&self->_srcKey, 0);
}

@end
