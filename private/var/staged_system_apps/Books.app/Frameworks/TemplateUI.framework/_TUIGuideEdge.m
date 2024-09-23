@implementation _TUIGuideEdge

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = TUILengthDescription(*(_QWORD *)&self->_length.value, *(_QWORD *)&self->_length.max);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p length=%@>"), v5, self, v7));

  return v8;
}

- (_TUIGuideNode)to
{
  return (_TUIGuideNode *)objc_loadWeakRetained((id *)&self->_to);
}

- (void)setTo:(id)a3
{
  objc_storeWeak((id *)&self->_to, a3);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)length
{
  return *($881BB7C90C7D0DFCC1492E3DC022A30F **)&self->_length.value;
}

- (void)setLength:(id *)a3
{
  uint64_t v3;

  *(_QWORD *)&self->_length.value = a3;
  *(_QWORD *)&self->_length.max = v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_to);
}

@end
