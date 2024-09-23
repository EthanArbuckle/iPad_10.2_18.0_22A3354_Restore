@implementation _TUIGuideInstance

- (_TUIGuideInstance)initWithSpec:(id)a3
{
  id v5;
  _TUIGuideInstance *v6;
  _TUIGuideInstance *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TUIGuideInstance;
  v6 = -[_TUIGuideInstance init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_spec, a3);
    v7->_offset = NAN;
  }

  return v7;
}

- (double)guideOffset
{
  return self->_offset;
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p spec=%@ offset=%f>"), v5, self, self->_spec, *(_QWORD *)&self->_offset));

  return (NSString *)v6;
}

- (double)offset
{
  return self->_offset;
}

- (void)setOffset:(double)a3
{
  self->_offset = a3;
}

- (TUIGuideSpec)spec
{
  return self->_spec;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spec, 0);
}

@end
