@implementation _TUIFeedCaptureImageResource

- (_TUIFeedCaptureImageResource)initWithResource:(id)a3 kind:(id)a4 naturalSize:(CGSize)a5 contentsScale:(double)a6 instance:(id)a7 options:(id)a8
{
  CGFloat height;
  CGFloat width;
  id v16;
  id v17;
  id v18;
  id v19;
  _TUIFeedCaptureImageResource *v20;
  _TUIFeedCaptureImageResource *v21;
  objc_super v23;

  height = a5.height;
  width = a5.width;
  v16 = a3;
  v17 = a4;
  v18 = a7;
  v19 = a8;
  v23.receiver = self;
  v23.super_class = (Class)_TUIFeedCaptureImageResource;
  v20 = -[_TUIFeedCaptureImageResource init](&v23, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_resource, a3);
    objc_storeStrong((id *)&v21->_kind, a4);
    v21->_naturalSize.width = width;
    v21->_naturalSize.height = height;
    v21->_contentsScale = a6;
    objc_storeStrong((id *)&v21->_instance, a7);
    objc_storeStrong((id *)&v21->_options, a8);
    v21->_intrinsic = 0;
  }

  return v21;
}

- (_TUIFeedCaptureImageResource)initWithResource:(id)a3 kind:(id)a4 instance:(id)a5 options:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _TUIFeedCaptureImageResource *v15;
  _TUIFeedCaptureImageResource *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_TUIFeedCaptureImageResource;
  v15 = -[_TUIFeedCaptureImageResource init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_resource, a3);
    objc_storeStrong((id *)&v16->_kind, a4);
    v16->_naturalSize = CGSizeZero;
    v16->_contentsScale = 1.0;
    objc_storeStrong((id *)&v16->_instance, a5);
    objc_storeStrong((id *)&v16->_options, a6);
    v16->_intrinsic = 1;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD *v8;
  NSString *kind;
  NSObject *instance;
  NSObject *options;
  unsigned __int8 v12;

  v4 = a3;
  v6 = objc_opt_class(_TUIFeedCaptureImageResource, v5);
  v7 = TUIDynamicCast(v6, v4);
  v8 = (_QWORD *)objc_claimAutoreleasedReturnValue(v7);

  if (v8
    && ((kind = self->_kind, kind == (NSString *)v8[3]) || -[NSString isEqualToString:](kind, "isEqualToString:"))
    && ((instance = self->_instance, instance == v8[5])
     || -[NSObject isEqual:](instance, "isEqual:")))
  {
    options = self->_options;
    if (options == v8[6])
      v12 = 1;
    else
      v12 = -[NSObject isEqual:](options, "isEqual:");
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_kind, "hash");
  v4 = (unint64_t)-[NSObject hash](self->_instance, "hash") ^ v3;
  return v4 ^ (unint64_t)-[NSObject hash](self->_options, "hash");
}

- (TUIImageResource)resource
{
  return self->_resource;
}

- (NSString)kind
{
  return self->_kind;
}

- (CGSize)naturalSize
{
  double width;
  double height;
  CGSize result;

  width = self->_naturalSize.width;
  height = self->_naturalSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)contentsScale
{
  return self->_contentsScale;
}

- (NSObject)instance
{
  return self->_instance;
}

- (NSObject)options
{
  return self->_options;
}

- (BOOL)intrinsic
{
  return self->_intrinsic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_resource, 0);
}

@end
