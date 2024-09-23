@implementation _UIHostedWindowHostingHandle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t pid;
  id v5;
  __int128 v6;
  _OWORD v7[3];

  pid = self->_pid;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", pid, CFSTR("pid"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_contextID, CFSTR("contextID"));
  v6 = *(_OWORD *)&self->_rootLayerTransform.c;
  v7[0] = *(_OWORD *)&self->_rootLayerTransform.a;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&self->_rootLayerTransform.tx;
  objc_msgSend(v5, "encodeCGAffineTransform:forKey:", v7, CFSTR("rootLayerTransform"));
  objc_msgSend(v5, "encodeCGRect:forKey:", CFSTR("rootLayerFrame"), self->_rootLayerFrame.origin.x, self->_rootLayerFrame.origin.y, self->_rootLayerFrame.size.width, self->_rootLayerFrame.size.height);

}

- (_UIHostedWindowHostingHandle)initWithCoder:(id)a3
{
  id v4;
  _UIHostedWindowHostingHandle *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  _UIHostedWindowHostingHandle *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UIHostedWindowHostingHandle;
  v5 = -[_UIHostedWindowHostingHandle init](&v15, sel_init);
  if (v5)
  {
    v5->_pid = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("pid"));
    v5->_contextID = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("contextID"));
    if (v4)
    {
      objc_msgSend(v4, "decodeCGAffineTransformForKey:", CFSTR("rootLayerTransform"));
    }
    else
    {
      v13 = 0u;
      v14 = 0u;
      v12 = 0u;
    }
    *(_OWORD *)&v5->_rootLayerTransform.a = v12;
    *(_OWORD *)&v5->_rootLayerTransform.c = v13;
    *(_OWORD *)&v5->_rootLayerTransform.tx = v14;
    objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("rootLayerFrame"), v12, v13, v14);
    v5->_rootLayerFrame.origin.x = v6;
    v5->_rootLayerFrame.origin.y = v7;
    v5->_rootLayerFrame.size.width = v8;
    v5->_rootLayerFrame.size.height = v9;
    v10 = v5;
  }

  return v5;
}

+ (_UIHostedWindowHostingHandle)hostedWindowHostingHandleWithContextID:(unsigned int)a3 rootLayerTransform:(CGAffineTransform *)a4 rootLayerFrame:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _UIHostedWindowHostingHandle *v11;
  __int128 v12;
  __int128 v13;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = objc_alloc_init(_UIHostedWindowHostingHandle);
  v11->_pid = getpid();
  v11->_contextID = a3;
  v13 = *(_OWORD *)&a4->c;
  v12 = *(_OWORD *)&a4->tx;
  *(_OWORD *)&v11->_rootLayerTransform.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v11->_rootLayerTransform.c = v13;
  *(_OWORD *)&v11->_rootLayerTransform.tx = v12;
  v11->_rootLayerFrame.origin.x = x;
  v11->_rootLayerFrame.origin.y = y;
  v11->_rootLayerFrame.size.width = width;
  v11->_rootLayerFrame.size.height = height;
  return v11;
}

- (int)pid
{
  return self->_pid;
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (CGAffineTransform)rootLayerTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self->tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].a;
  return self;
}

- (CGRect)rootLayerFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rootLayerFrame.origin.x;
  y = self->_rootLayerFrame.origin.y;
  width = self->_rootLayerFrame.size.width;
  height = self->_rootLayerFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
